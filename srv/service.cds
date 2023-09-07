using { z.ASCMJ } from '../db/schema';

namespace z.ASCMJ;

service z {
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