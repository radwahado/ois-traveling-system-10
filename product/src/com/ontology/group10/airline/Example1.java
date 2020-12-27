package com.ontology.group10.airline;

import java.io.IOException;

import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFormatter;

public class Example1 {

	//executing SPARQL Query
	public static void executeQuery1(String serviceURI, String query) {
		QueryExecution q = QueryExecutionFactory.sparqlService(serviceURI,
				query);
		ResultSet results = q.execSelect();

		ResultSetFormatter.out(System.out, results);

		while (results.hasNext()) {
			QuerySolution soln = results.nextSolution();
			System.out.println(soln);
		}
	}

	public static void main(String[] argv) throws IOException {

		String departure;
		String cabinClass;
		
		java.util.Scanner input = new java.util.Scanner(System.in);	

		//selecting departure location
		System.out.println("enter your choice of departure\n1.Brussels\n2.New_Jersey\n3.Virginia");	
		int departureChoice = input.nextInt();
		
		while(departureChoice <1 | departureChoice >3) {
			System.out.println("invalid choice!!Please enter a valid choice of departure"
					+ "\n1.Brussels\n2.New_Jersey\n3.Virginia");
			departureChoice = input.nextInt();
		}
		switch(departureChoice) {
			case 1:
				departure="Brussels";
				break;
			case 2:
				departure="New_Jersey";
				break;
			case 3:
				departure="Virginia";
				break;
			default:
				departure="Brussels";
		}
		
		//selecting cabin class
		System.out.println("enter your choice of cabin class\n1.Business\n2.Premium_Economy\n3.Economy");	
		int cabinClassChoice = input.nextInt();
		
		while(cabinClassChoice <1 | cabinClassChoice >3) {
			System.out.println("invalid choice!!Please enter a valid choice of cabin class"
					+ "\n1.Business\n2.Premium_Economy\n3.Economy");
			cabinClassChoice = input.nextInt();
		}
		switch(cabinClassChoice) {
			case 1:
				cabinClass="Business";
				break;
			case 2:
				cabinClass="Premium_Economy";
				break;
			case 3:
				cabinClass="Economy";
				break;
			default:
				cabinClass="Business";
		}
		
		//SPARQL ENDPOINT
		String hostLink ="http://localhost:8080/fuseki/airlineBooking_group10/query";
		
		//SPARQL for retreiving flight details according to 
		//selected departure location and cabin class
		String selectQuery = "PREFIX schema: <http://schema.org/>"+
				"PREFIX dbr: <http://dbpedia.org/resource/>"+
				"PREFIX db: <http://dbpedia.org/>"+
				"prefix group10: <http://ontology.group10travel.com#>"+
				"select ?flightNumber ?fromAirportName ?toAirportName ?toCity ?departureTime ?arrivalTime ?cabinClassTitle "+
						 "(COUNT(*) AS ?numberOfTickets) (GROUP_CONCAT(DISTINCT ?price;SEPARATOR=\",\") AS ?prices)"+
				"where "+
				"{"+
				  "?flight group10:departsFrom ?fromAirport ."+
				  "?fromAirport group10:inCity dbr:"+departure +"."+			  
				  "?flight group10:isAvailable true ."+				
				  "?flight group10:hasTicket ?ticket . "+
				  "?ticket group10:belongsToPackage ?package ."+
				  "?package group10:belongsToCabinClass ?cabinClass ."+
						  "?cabinClass group10:title \""+cabinClass+"\"."+		
				  "?flight group10:flightNumber ?flightNumber ."+				
				  "?fromAirport schema:name ?fromAirportName ."+				  
				  "?flight group10:arrivesIn ?toAirport ."+
				  "?toAirport schema:name ?toAirportName ."+
				  "?toAirport group10:inCity ?toCity ."+				  
				  "?flight group10:flightDepartureDatetime ?departureTime ."+
				  "?flight group10:flightArrivalDatetime ?arrivalTime ."+				  
				  "?cabinClass group10:title ?cabinClassTitle ."+				  
				  "?ticket group10:price ?price ."+				
				"}"+
				"GROUP BY ?flightNumber ?fromAirportName ?toAirportName ?toCity ?departureTime ?arrivalTime ?cabinClassTitle "+
				"ORDER BY ?flightNumber ?price "+
				"limit 10";
		
		executeQuery1(hostLink,selectQuery);

	}
}
