xquery version "3.0";

(:  BauDi, critical Report, order remarks
    Dennis Ried, 2020-04-06 :)

declare namespace cr = "http://www.baumann-digital.de/ns/criticalReport";
declare namespace uuid = "java:java.util.UUID";
declare namespace saxon = "http://saxon.sf.net/";


let $doc := ./root()/node()

for $remark in $doc/cr:remark
   let $id := uuid:randomUUID()
   let $crID as xs:string := concat('baudi-30-', substring(fn:string($id), 1, 8))

   return
     (
      if(not($remark/@xml:id))
      then(insert node attribute {'xml:id'} {$crID} into $remark)
      else if($remark/@xml:id='')
      then(replace value of node $remark/@xml:id with $crID)
      else()
     )