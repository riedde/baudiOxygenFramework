xquery version "3.0";

(:  BauDi, critical Report, order remarks
    Dennis Ried, 2020-04-06 :)

declare namespace cr = "http://www.baumann-digital.de/ns/criticalReport";
declare namespace uuid = "java:java.util.UUID";
declare namespace saxon = "http://saxon.sf.net/";


let $doc := ./root()/node()
let $id := uuid:randomUUID()
let $crID as xs:string := concat('baudi-30-', substring(fn:string($id), 1, 8))

let $remark := <remark xml:id="{$crID}" xmlns="http://www.baumann-digital.de/ns/criticalReport">
                  <item category=""></item>
                  <mdiv></mdiv>
                  <measureStart></measureStart>
                  <countTimeStart></countTimeStart>
                  <measureEnd></measureEnd>
                  <countTimeEnd></countTimeEnd>
                  <layer></layer>
                  <voice></voice>
                  <note></note>
                  <note type="intern"></note>
                  <sources></sources>
               </remark>                         

return
  insert node $remark as last into $doc
