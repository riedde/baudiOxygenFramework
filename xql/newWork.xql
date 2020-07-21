xquery version "3.0";

(:  Generate MEI 4.0.0 file for a new musical work

    This is to be used in oXygen XML editor with Saxon-EE.
    Dennis Ried, 2020-04-25 :)

declare namespace mei = "http://www.music-encoding.org/ns/mei";
declare namespace tei = "http://www.tei-c.org/ns/1.0";
declare namespace uuid = "java:java.util.UUID";
declare namespace saxon = "http://saxon.sf.net/";

let $doc := ./root()/node()
let $id := uuid:randomUUID()

let $workID as xs:string := concat('baudi-02-', substring(fn:string($id), 1, 8))

let $workFile  := <work xmlns="http://www.music-encoding.org/ns/mei" xml:id="{$workID}">
    <title type="uniform" xml:id="{$workID}-title">
        <titlePart type="main" xml:id="{$workID}-titleMain"/>
        <titlePart type="subordinate" xml:id="{$workID}-titleSub"/>
        <titlePart type="desc" xml:id="{$workID}-titleDesc"/>
    </title>
    <composer xml:id="{$workID}-composer">
        <persName auth="baudi-04-5e3ed698">Ludwig Baumann</persName>
    </composer>
    <arranger xml:id="{$workID}-arranger"/>
    <lyricist xml:id="{$workID}-lyricist"/>
    <editor xml:id="{$workID}-editor"/>
    <funder xml:id="{$workID}-funder"/>
    <key/>
    <meter/>
    <tempo/>
    <incip/>
    <creation/>
    <history/>
    <langUsage>
        <head>In der Quelle verwendete Sprache(n)</head>
        <language/>
    </langUsage>
    <perfMedium>
        <perfResList/>
    </perfMedium>
    <audience/>
    <contents>
        <contentItem/>
    </contents>
    <context/>
    <classification>
        <head/>
        <termList>
            <term type="workGroup" subtype=""/>
            <term type="genre" subtype=""/>
        </termList>
    </classification>
    <relationList>
        <relation/>
    </relationList>
</work>

return
    fn:put($workFile,concat('../../../../../Users/dried/Repositories/BauDi/baudiWorks/data/new/',$workID,'.xml'))