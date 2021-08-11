/**
 * @description       : 
 * @author            : Adolfo Crispin
 * @group             : 
 * @last modified on  : 11-08-2021
 * @last modified by  : Adolfo Crispin
 * Modifications Log
 * Ver   Date         Author           Modification
 * 1.0   06-08-2021   Adolfo Crispin   Initial Version
**/
public with sharing class HelloWorld {
    /**
    * @description 
    * @author Adolfo Crispin | 06-08-2021 
    **/
    public HelloWorld() {
        System.debug(LoggingLevel.INFO, 'Hello world');
    }
}
