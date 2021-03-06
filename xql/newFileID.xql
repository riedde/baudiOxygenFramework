xquery version "3.0";

(:  Generate MEI 3.0.0 file for new Music Work

    This is to be used in oXygen XML editor with Saxon-EE.
    Dennis Ried, 2018-05-28 :)

declare namespace mei = "http://www.music-encoding.org/ns/mei";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace uuid = "java:java.util.UUID";
declare namespace saxon = "http://saxon.sf.net/";

let $doc := ./root()/node()
let $id := uuid:randomUUID()

let $fileIDbefore := $doc/@xml:id
let $sourceID as xs:string := concat('baudi-01-', substring(fn:string($id), 1, 8))
let $workID as xs:string := concat('baudi-02-', substring(fn:string($id), 1, 8))
let $persID as xs:string := concat('baudi-04-', substring(fn:string($id), 1, 8))
let $orgID as xs:string := concat('baudi-05-', substring(fn:string($id), 1, 8))
let $placeID as xs:string := concat('baudi-06-', substring(fn:string($id), 1, 8))

let $newID := if (string(node-name($doc)) = 'person')
              then ($persID)
              else if (string(node-name($doc)) ='org')
              then ($orgID)
              else if (string(node-name($doc)) ='place')
              then ($placeID)
              else if (string(node-name($doc)) ='work')
              then ($workID)
              else  if (string(node-name($doc)) ='mei')
              then ($sourceID)
              else ()

return
    (
        if(string(node-name($doc)) ='work')
        then(for $ID in $doc//@xml:id[contains(.,$fileIDbefore)]
                let $IDending := substring($ID,18)
                let $IDrenewed := concat($workID,$IDending)
                return
                    replace value of node $ID with $IDrenewed)
        else if(string(node-name($doc)) ='mei')
        then(for $ID in $doc//@xml:id[contains(.,$fileIDbefore)]
                let $IDending := substring($ID,18)
                let $IDrenewed := concat($sourceID,$IDending)
                return
                    replace value of node $ID with $IDrenewed)
        else(replace value of node $fileIDbefore with $newID)
    )