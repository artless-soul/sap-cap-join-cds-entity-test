namespace z.ASCMJ;

// Environment fields
type ASC_KEYFLD : Association to one MDF ; /** "b3ecab7c-fc88-4e3b-b293-0c6220fdadc3" */
type KEYFLD : String @title: 'Key field' @Analytics.Dimension ; /** "9d788ec7-17b3-4e68-842d-ee0025eb87d4" */

// Environment functions
/** {ID: "13189d5c-034f-404a-85c7-b5698feb6632"} */
@title: 'Master data function'
@description: 'Master data function'
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@Aggregation.ApplySupported.GroupableProperties: [KEYFLD]
@UI.Identification : [{Value : KEYFLD}]
entity MDF {
key KEYFLD : KEYFLD @title: 'Key field' ;
};

/** {ID: "ac7068b0-0e1e-4655-acf7-33e599129c6d"} */
@title: 'Association Model Entity'
@description: 'Association Model Entity'
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@Aggregation.ApplySupported.GroupableProperties: [ASC,KEYFLD]
@UI.Identification : [{Value : KEYFLD}]
entity ASCME {
ASC : ASC_KEYFLD @title: 'Association' ;
key KEYFLD : KEYFLD @title: 'Key field' ;
};

/** {ID: "d902c1f3-c43a-4571-a160-00816acf5b5a", description: "Model Join Full Implicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJFI as
select key newuid() as _ID, MDF.KEYFLD: KEYFLD, ASCME.ASC
from MDF
FULL JOIN
ASCME
on MDF.KEYFLD = ASCME.ASC.KEYFLD ;
/** {ID: "049d3fa9-2872-493d-995e-b3899e63fb6f", description: "Model Join left implicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJLI as
select key newuid() as _ID, MDF.KEYFLD: KEYFLD, ASCME.ASC
from MDF
LEFT JOIN
ASCME
on MDF.KEYFLD = ASCME.ASC.KEYFLD ;
/** {ID: "cdf423a0-ee3f-4171-a801-afd61e3b9062", description: "Inner Model Join Implicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJII as
select key newuid() as _ID, MDF.KEYFLD: KEYFLD, ASCME.ASC
from MDF
INNER JOIN
ASCME
on MDF.KEYFLD = ASCME.ASC.KEYFLD ;
/** {ID: "00077100-d699-4998-b5e8-af57c7dea1da", description: "Cross Model Join Implicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJCI as
select key newuid() as _ID, MDF.KEYFLD: KEYFLD, ASCME.ASC
from MDF
CROSS JOIN
ASCME
;
/** {ID: "4a27d85e-aac9-451c-bbff-72547cd7e242", description: "Union All Model Join Implicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJUI as
select key newuid() as _ID, KEYFLD: KEYFLD, null as ASC
from MDF
union all
select key newuid() as _ID, KEYFLD: KEYFLD, ASC
from ASCME;
/** {ID: "d6d06b25-8979-4d8b-8c57-992ca3ba335d", description: "Full Model Join Explicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJFE as
select key newuid() as _ID, MDF.KEYFLD: KEYFLD, ASCME.ASC
from MDF
FULL JOIN
ASCME
on MDF.KEYFLD = ASCME.ASC.KEYFLD ;
/** {ID: "947aa1cd-2e7c-4105-9529-8f61363dbfa2", description: "Left Model Join Explicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJLE as
select key newuid() as _ID, MDF.KEYFLD: KEYFLD, ASCME.ASC
from MDF
LEFT JOIN
ASCME
on MDF.KEYFLD = ASCME.ASC.KEYFLD ;
/** {ID: "3de52e77-f899-484c-a65a-7dc65518841c", description: "Inner Model Join Explicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJIE as
select key newuid() as _ID, MDF.KEYFLD: KEYFLD, ASCME.ASC
from MDF
INNER JOIN
ASCME
on MDF.KEYFLD = ASCME.ASC.KEYFLD ;
/** {ID: "77b4fb26-9165-4794-bf59-2682b3f7badc", description: "Union All Model Join Explicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJUE as
select key newuid() as _ID, KEYFLD: KEYFLD, null as ASC,
virtual '77b4fb26-9165-4794-bf59-2682b3f7badc' as _function_ID: _z.Function_ID @readonly
from MDF
union all
select key newuid() as _ID, KEYFLD: KEYFLD, ASC
from ASCME;
/** {ID: "d1e1003f-1553-4d50-a4bd-fe0a9583c61e", description: "Cross Model Join Explicit"} */
@cds.odata.valuelist
@Aggregation.ApplySupported.PropertyRestrictions
@Aggregation.ApplySupported.Transformations
@readonly
entity MJCE as
select key newuid() as _ID, MDF.KEYFLD: KEYFLD, ASCME.ASC
from MDF
CROSS JOIN
ASCME
;
extend service z.Ext with {
@odata.draft.enabled
@cds.redirection.target
entity ASCMJ_MDF as projection on ASCMJ.MDF;


@odata.draft.enabled
@cds.redirection.target
entity ASCMJ_ASCME as projection on ASCMJ.ASCME;
@readonly
entity ASCMJ_MJFI as projection on ASCMJ.MJFI;


@readonly
entity ASCMJ_MJLI as projection on ASCMJ.MJLI;


@readonly
entity ASCMJ_MJII as projection on ASCMJ.MJII;


@readonly
entity ASCMJ_MJCI as projection on ASCMJ.MJCI;


@readonly
entity ASCMJ_MJUI as projection on ASCMJ.MJUI;


@readonly
entity ASCMJ_MJFE as projection on ASCMJ.MJFE;


@readonly
entity ASCMJ_MJLE as projection on ASCMJ.MJLE;


@readonly
entity ASCMJ_MJIE as projection on ASCMJ.MJIE;


@readonly
entity ASCMJ_MJUE as projection on ASCMJ.MJUE;


@readonly
entity ASCMJ_MJCE as projection on ASCMJ.MJCE;

}