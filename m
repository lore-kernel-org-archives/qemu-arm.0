Received: by 10.103.86.15 with SMTP id k15csp1001614vsb;
        Mon, 19 Dec 2016 00:02:55 -0800 (PST)
X-Received: by 10.237.62.110 with SMTP id m43mr14259112qtf.195.1482134575466;
        Mon, 19 Dec 2016 00:02:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n72si9063145qke.243.2016.12.19.00.02.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Dec 2016 00:02:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:43943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cIsuK-0001Nf-SE
	for alex.bennee@linaro.org; Mon, 19 Dec 2016 03:02:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48782)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cIsuB-0001KP-3t
	for qemu-arm@nongnu.org; Mon, 19 Dec 2016 03:02:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cIsu5-0002UZ-0A
	for qemu-arm@nongnu.org; Mon, 19 Dec 2016 03:02:43 -0500
Received: from mail-db5eur01on0099.outbound.protection.outlook.com
	([104.47.2.99]:45083
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cIsty-0002Ki-Jp; Mon, 19 Dec 2016 03:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=HkBOIvctcoZzymbNQu+5GSpkyn/IcV939oc0QxvFqQ4=;
	b=GKELopydg25Z5UgsWaVGzKUssulJ0Kk279ngEcmhPK+GL0cnUaG4mFNR4BBUoGIdKHSiCjju9z+NL/KTfSx7txlVRwHb7Czh5TRdZ7OWKzTxogY+Bot46oESyvIqYWCFwLAtdApPZnIva40riqI8VxdL+eLoMe9Q4cHtjaBVWqw=
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) by
	AM4PR0701MB2131.eurprd07.prod.outlook.com (10.167.132.140) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.789.13;
	Mon, 19 Dec 2016 07:31:02 +0000
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) with
	mapi id 15.01.0789.018; Mon, 19 Dec 2016 07:31:02 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Thread-Topic: [Qemu-arm] [PATCH 2/2] block: m25p80: Introduce Die Erase command
Thread-Index: AQHSV6BIv32Ws1NS4kCxfXoCkXlKmKEKxaEAgAQIfJCAABWEgIAAAJjw
Date: Mon, 19 Dec 2016 07:31:02 +0000
Message-ID: <AM4PR0701MB21303D4AF472821A1B3E5421FE910@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
	<1481894862-14102-3-git-send-email-marcin.krzeminski@nokia.com>
	<20161216163542.GQ9606@toto>
	<AM4PR0701MB21305D92F87BC4C9568C14F6FE910@AM4PR0701MB2130.eurprd07.prod.outlook.com>
	<20161219072807.GS9606@toto>
In-Reply-To: <20161219072807.GS9606@toto>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [131.228.2.29]
x-ms-office365-filtering-correlation-id: 315b6017-b120-40bd-0991-08d427e0fc68
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
	SRVR:AM4PR0701MB2131; 
x-microsoft-exchange-diagnostics: 1; AM4PR0701MB2131;
	7:MouJkiloZs/FKBc42aYeQORbmSZsz0loNdbRm1QJz1NMoBMKDD98YpYxRpvy8m/ZnAmOoFXN4kgH+BBAd3FXjePyS6KeUk/843XHHdK0LUgBb7hM7hJ9Ewf1lhkYRFECr6JqUv3ItE90fURtbZE1MsmeYWNA+v0T46Gw1087ZthA9BlbObzujYx7WpkmX1UkK9kohQRMPSro66dIJPWaLMK1NLR9hM4kD6SCCtasix2uqKgxcU488FERglPso5m/fe9szLaPHZXXEm+n9Nhzz6n5V94VQn3tRgcz4mW/0U2zzFy+y6Vewcdpontu5igPIGIy+zok/y8e8wZWKcaik5nBxQalt2jmgz98cy9W0o2YQfL+MlFX2kbTGEOK3vqY2NyhAcQhMWFmIVldA5QWJXAwyWmnM9vVwRMDkg3j0Mc1FakwtaCttnFTsOLJ8KnxamY6heVj8K/k+vgFy9i56Q==
x-microsoft-antispam-prvs: <AM4PR0701MB2131686C85CC602FE9615075FE910@AM4PR0701MB2131.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(82608151540597);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123560025)(6072148);
	SRVR:AM4PR0701MB2131; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2131; 
x-forefront-prvs: 01613DFDC8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39860400002)(39850400002)(39410400002)(39450400003)(39840400002)(199003)(24454002)(13464003)(377454003)(189002)(101416001)(229853002)(38730400001)(86362001)(2900100001)(189998001)(106356001)(6436002)(50986999)(6506006)(76176999)(97736004)(54356999)(77096006)(106116001)(93886004)(76576001)(33656002)(66066001)(105586002)(122556002)(92566002)(39060400001)(110136003)(6916009)(7696004)(2950100002)(3846002)(6116002)(8936002)(74316002)(102836003)(5660300001)(2906002)(68736007)(7736002)(9686002)(3280700002)(25786008)(8676002)(4326007)(81156014)(81166006)(3660700001)(305945005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0701MB2131;
	H:AM4PR0701MB2130.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2016 07:31:02.4484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2131
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.99
Subject: Re: [Qemu-arm] [PATCH 2/2] block: m25p80: Introduce Die Erase
 command
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "clg@kaod.org" <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cO2lbXtlYgwz



> -----Original Message-----
> From: Edgar E. Iglesias [mailto:edgar.iglesias@gmail.com]
> Sent: Monday, December 19, 2016 8:28 AM
> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> <marcin.krzeminski@nokia.com>
> Cc: qemu-devel@nongnu.org; peter.maydell@linaro.org; rfsw-
> patches@mlist.nokia.com; qemu-arm@nongnu.org; clg@kaod.org
> Subject: Re: [Qemu-arm] [PATCH 2/2] block: m25p80: Introduce Die Erase
> command
>=20
> On Mon, Dec 19, 2016 at 06:21:13AM +0000, Krzeminski, Marcin (Nokia -
> PL/Wroclaw) wrote:
> >
> >
> > > -----Original Message-----
> > > From: Edgar E. Iglesias [mailto:edgar.iglesias@gmail.com]
> > > Sent: Friday, December 16, 2016 5:36 PM
> > > To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> > > <marcin.krzeminski@nokia.com>
> > > Cc: qemu-devel@nongnu.org; peter.maydell@linaro.org; rfsw-
> > > patches@mlist.nokia.com; qemu-arm@nongnu.org; clg@kaod.org
> > > Subject: Re: [Qemu-arm] [PATCH 2/2] block: m25p80: Introduce Die
> > > Erase command
> > >
> > > On Fri, Dec 16, 2016 at 02:27:42PM +0100,
> > > marcin.krzeminski@nokia.com
> > > wrote:
> > > > From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> > > >
> > > > Big flash chips (like mt25qu01g) are consisted from dies.
> > > > Because of that some manufactures remove support for Chip Erase
> > > > giving Die Erase command instead.To avoid unnecessary code
> > > > complication, support for chip erase for mt25qu01g is not removed.
> > > >
> > > > Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> > > > ---
> > > >  hw/block/m25p80.c | 33 +++++++++++++++++++++++++++++----
> > > >  1 file changed, 29 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c index
> > > > 2bc7028..0bc1fbf 100644
> > > > --- a/hw/block/m25p80.c
> > > > +++ b/hw/block/m25p80.c
> > > > @@ -216,8 +216,8 @@ static const FlashPartInfo known_devices[] =3D =
{
> > > >      { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
> > > >      { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K)=
 },
> > > >      { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K=
) },
> > > > -    { INFO("mt25ql01g",   0x20ba21,      0,  64 << 10, 2048, ER_4K=
) },
> > > > -    { INFO("mt25qu01g",   0x20bb21,      0,  64 << 10, 2048, ER_4K=
) },
> > > > +    { INFO("mt25ql01g",   0x20ba21, 0x1040,  64 << 10, 2048, ER_4K=
) },
> > > > +    { INFO("mt25qu01g",   0x20bb21, 0x1040,  64 << 10, 2048, ER_4K=
) },
> > > >
> > > >      /* Spansion -- single (large) sector size only, at least
> > > >       * for the chips listed here (without boot sectors).
> > > > @@ -358,6 +358,8 @@ typedef enum {
> > > >
> > > >      REVCR =3D 0x65,
> > > >      WEVCR =3D 0x61,
> > > > +
> > > > +    DIE_ERASE =3D 0xC4,
> > > >  } FlashCMD;
> > > >
> > > >  typedef enum {
> > > > @@ -411,6 +413,7 @@ typedef struct Flash {
> > > >      bool reset_enable;
> > > >      bool quad_enable;
> > > >      uint8_t ear;
> > > > +    uint32_t die_cnt;
> > > >
> > > >      int64_t dirty_page;
> > > >
> > > > @@ -492,7 +495,7 @@ static inline void flash_sync_area(Flash *s,
> > > > int64_t off, int64_t len)
> > > >
> > > >  static void flash_erase(Flash *s, int offset, FlashCMD cmd)  {
> > > > -    uint32_t len;
> > > > +    uint32_t len =3D 0;
> > >
> > > Do you really need this?
> >
> > Compilation warning.
>=20
> Of course, because you are logging len in a code path that doesn't use th=
e
> variable.
>=20
> Let me be more clear below:
>=20
> > >
> > > >      uint8_t capa_to_assert =3D 0;
> > > >
> > > >      switch (cmd) {
> > > > @@ -513,6 +516,16 @@ static void flash_erase(Flash *s, int offset,
> > > FlashCMD cmd)
> > > >      case BULK_ERASE:
> > > >          len =3D s->size;
> > > >          break;
> > > > +    case DIE_ERASE:
> > > > +        if (s->die_cnt) {
> > > > +            len =3D s->size / s->die_cnt;
> > > > +            offset =3D offset & (~(len-1));
> > > > +        } else {
> > > > +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %d die erase
> > > > + not
> > > supported by"
> > > > +                          " device\n", len);
>=20
> Don't log len here...

Sure, I did not get your intention :)

Thanks,
Marcin
>=20
>=20
>=20
> > > > +            return;
> > > > +        }
> > > > +        break;
> > > >      default:
> > > >          abort();
> > > >      }
> > > > @@ -634,6 +647,7 @@ static void complete_collecting_data(Flash *s)
> > > >      case ERASE4_32K:
> > > >      case ERASE_SECTOR:
> > > >      case ERASE4_SECTOR:
> > > > +    case DIE_ERASE:
> > > >          flash_erase(s, s->cur_addr, s->cmd_in_progress);
> > > >          break;
> > > >      case WRSR:
> > > > @@ -684,6 +698,7 @@ static void reset_memory(Flash *s)
> > > >      s->write_enable =3D false;
> > > >      s->reset_enable =3D false;
> > > >      s->quad_enable =3D false;
> > > > +    s->die_cnt =3D 0;
> > > >
> > > >      switch (get_man(s)) {
> > > >      case MAN_NUMONYX:
> > > > @@ -716,7 +731,15 @@ static void reset_memory(Flash *s)
> > > >              s->four_bytes_address_mode =3D true;
> > > >          }
> > > >          if (!(s->nonvolatile_cfg & NVCFG_LOWER_SEGMENT_MASK)) {
> > > > -            s->ear =3D s->size / MAX_3BYTES_SIZE - 1;
> > > > +            s->ear =3D ( s->size > MAX_3BYTES_SIZE ? s->size /
> > > > + MAX_3BYTES_SIZE
> > > - 1 : 0);
> > > > +        }
> > > > +        /* 1GiB devices */
> > > > +        if (s->pi->id[2] =3D=3D 0x21) {
> > > > +            /* MT25Q00 has 2 dies N25Q00 has 4 */
> > > > +            if (s->pi->id[4] & BIT(6))
> > > > +                s->die_cnt =3D 2;
> > > > +            else
> > > > +                s->die_cnt =3D 4;
> > >
> > > Decoding of die_cnt should probably be done in realize().
> > >
> > > >          }
> > > >          break;
> > > >      case MAN_MACRONIX:
> > > > @@ -880,6 +903,7 @@ static void decode_new_cmd(Flash *s, uint32_t
> > > value)
> > > >      case PP:
> > > >      case PP4:
> > > >      case PP4_4:
> > > > +    case DIE_ERASE:
> > > >          s->needed_bytes =3D get_addr_length(s);
> > > >          s->pos =3D 0;
> > > >          s->len =3D 0;
> > > > @@ -1217,6 +1241,7 @@ static const VMStateDescription
> > > > vmstate_m25p80
> > > =3D {
> > > >          VMSTATE_UINT8(spansion_cr2nv, Flash),
> > > >          VMSTATE_UINT8(spansion_cr3nv, Flash),
> > > >          VMSTATE_UINT8(spansion_cr4nv, Flash),
> > > > +        VMSTATE_UINT32(die_cnt, Flash),
> > >
> > > die_cnt is fixed per instance. Since it doesn't change, it doesn't
> > > need to be part of VMSTATE.
> >
> > Yes, you are right. Even more, number of a dies is fixed attribute of
> > chip, so it could Be a part of FlashPartInfo. I'll up v2.
> >
> > Thanks,
> > Marcin
> >
> > >
> > > >          VMSTATE_END_OF_LIST()
> > > >      }
> > > >  };
> > > > --
> > > > 2.7.4
> > > >
> > > >
