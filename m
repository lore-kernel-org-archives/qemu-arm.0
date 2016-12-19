Received: by 10.103.86.15 with SMTP id k15csp977651vsb;
        Sun, 18 Dec 2016 22:37:05 -0800 (PST)
X-Received: by 10.200.48.44 with SMTP id f41mr13467000qte.94.1482129425141;
        Sun, 18 Dec 2016 22:37:05 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a7si883840qke.252.2016.12.18.22.37.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 18 Dec 2016 22:37:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:43643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cIrZG-0001ma-Ja
	for alex.bennee@linaro.org; Mon, 19 Dec 2016 01:37:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cIrYA-0001kP-2B
	for qemu-devel@nongnu.org; Mon, 19 Dec 2016 01:35:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cIrY5-0005dX-Rm
	for qemu-devel@nongnu.org; Mon, 19 Dec 2016 01:35:54 -0500
Received: from mail-db5eur01on0099.outbound.protection.outlook.com
	([104.47.2.99]:64784
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cIrY5-0005cS-Dp; Mon, 19 Dec 2016 01:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IPFLJLUkobKQep3NjoU6xdRRuAKU96XYKLNdApFjrrY=;
	b=S/nP4YQnrOwgX4Ue/a+rbC8mwlfz0DKwdOZl+UaDoghX23Ec7S3c17hSsPbrAvFiLvHg18ZV2oBMbH9k79thdQu7wJbCmpQ4NnCgrg6Tc1YNXUtYZX76sKAhkXT+alClUUJQcA/aughp5TwcrW5hyJ0URvqyLk6qRK0S+Atv7A0=
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) by
	AM4PR0701MB2131.eurprd07.prod.outlook.com (10.167.132.140) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.789.13;
	Mon, 19 Dec 2016 06:21:13 +0000
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) with
	mapi id 15.01.0789.018; Mon, 19 Dec 2016 06:21:13 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Thread-Topic: [Qemu-arm] [PATCH 2/2] block: m25p80: Introduce Die Erase command
Thread-Index: AQHSV6BIv32Ws1NS4kCxfXoCkXlKmKEKxaEAgAQIfJA=
Date: Mon, 19 Dec 2016 06:21:13 +0000
Message-ID: <AM4PR0701MB21305D92F87BC4C9568C14F6FE910@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1481894862-14102-1-git-send-email-marcin.krzeminski@nokia.com>
	<1481894862-14102-3-git-send-email-marcin.krzeminski@nokia.com>
	<20161216163542.GQ9606@toto>
In-Reply-To: <20161216163542.GQ9606@toto>
Accept-Language: pl-PL, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [131.228.2.29]
x-ms-office365-filtering-correlation-id: 28324d59-0d71-4524-ee67-08d427d73bac
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
	SRVR:AM4PR0701MB2131; 
x-microsoft-exchange-diagnostics: 1; AM4PR0701MB2131;
	7:izqmmePD9z/2c4PsP8/8geDWhA8FJ/W9b+2ueo2iiCVwdqiShbKItwZrp/YbUKnLAx+RGt9VZGtmBuZ7ZoxeOyrbVpFEOifSf8MqyzoEsFtZeKSvssPTHOqNRQneUeOPwhRgLnX2oZQE66cqfdfosbCTctnEeqw4JLwxaAh/zZNajsa6JwlJ1gpRmb2FxsQNFWT/sYVL7m1xaaKcqiK3EDchWaVaM3AtDQo07xnB3u02/prH5EbP4sWgAPZF6iEXzvCD4g2zzUBt/DaTeMHHWleanjhjVB10h9r10RZlyRd2P+fRmOgZBY8aa/p+33QmqvL5iSFRnxYx7SS5jJE0bwEHj2Xw2WZ+l0jgpcotI15unQOybC9R0Jhyh4vOSMNOzS6mzCSXrpoBG0J/oP6r85fRzMSbXcZrHweSSH5a0AHF/6j/WpsZ4vgdRVg/0NR1EUC6bRT5Grq63yH+lbXqsQ==
x-microsoft-antispam-prvs: <AM4PR0701MB2131ECC1CA843954D6F81CC0FE910@AM4PR0701MB2131.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(82608151540597);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(6041248)(20161123562025)(20161123564025)(20161123555025)(20161123560025)(6072148);
	SRVR:AM4PR0701MB2131; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2131; 
x-forefront-prvs: 01613DFDC8
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39860400002)(39850400002)(39840400002)(39410400002)(39450400003)(199003)(24454002)(13464003)(377454003)(189002)(101416001)(229853002)(38730400001)(86362001)(2900100001)(189998001)(106356001)(6436002)(54356999)(50986999)(76176999)(6506006)(97736004)(77096006)(106116001)(76576001)(33656002)(66066001)(105586002)(122556002)(92566002)(5660300001)(110136003)(6916009)(7696004)(39060400001)(2950100002)(3846002)(6116002)(74316002)(8936002)(102836003)(2906002)(68736007)(7736002)(9686002)(3280700002)(25786008)(8676002)(4326007)(81156014)(81166006)(3660700001)(305945005);
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
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2016 06:21:13.6041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2131
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.99
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 2/2] block: m25p80: Introduce
 Die Erase command
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "clg@kaod.org" <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ICNtCczvxBz5



> -----Original Message-----
> From: Edgar E. Iglesias [mailto:edgar.iglesias@gmail.com]
> Sent: Friday, December 16, 2016 5:36 PM
> To: Krzeminski, Marcin (Nokia - PL/Wroclaw)
> <marcin.krzeminski@nokia.com>
> Cc: qemu-devel@nongnu.org; peter.maydell@linaro.org; rfsw-
> patches@mlist.nokia.com; qemu-arm@nongnu.org; clg@kaod.org
> Subject: Re: [Qemu-arm] [PATCH 2/2] block: m25p80: Introduce Die Erase
> command
>=20
> On Fri, Dec 16, 2016 at 02:27:42PM +0100, marcin.krzeminski@nokia.com
> wrote:
> > From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> >
> > Big flash chips (like mt25qu01g) are consisted from dies.
> > Because of that some manufactures remove support for Chip Erase giving
> > Die Erase command instead.To avoid unnecessary code complication,
> > support for chip erase for mt25qu01g is not removed.
> >
> > Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
> > ---
> >  hw/block/m25p80.c | 33 +++++++++++++++++++++++++++++----
> >  1 file changed, 29 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c index
> > 2bc7028..0bc1fbf 100644
> > --- a/hw/block/m25p80.c
> > +++ b/hw/block/m25p80.c
> > @@ -216,8 +216,8 @@ static const FlashPartInfo known_devices[] =3D {
> >      { INFO("n25q128",     0x20ba18,      0,  64 << 10, 256, 0) },
> >      { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
> >      { INFO("n25q512a",    0x20ba20,      0,  64 << 10, 1024, ER_4K) },
> > -    { INFO("mt25ql01g",   0x20ba21,      0,  64 << 10, 2048, ER_4K) },
> > -    { INFO("mt25qu01g",   0x20bb21,      0,  64 << 10, 2048, ER_4K) },
> > +    { INFO("mt25ql01g",   0x20ba21, 0x1040,  64 << 10, 2048, ER_4K) },
> > +    { INFO("mt25qu01g",   0x20bb21, 0x1040,  64 << 10, 2048, ER_4K) },
> >
> >      /* Spansion -- single (large) sector size only, at least
> >       * for the chips listed here (without boot sectors).
> > @@ -358,6 +358,8 @@ typedef enum {
> >
> >      REVCR =3D 0x65,
> >      WEVCR =3D 0x61,
> > +
> > +    DIE_ERASE =3D 0xC4,
> >  } FlashCMD;
> >
> >  typedef enum {
> > @@ -411,6 +413,7 @@ typedef struct Flash {
> >      bool reset_enable;
> >      bool quad_enable;
> >      uint8_t ear;
> > +    uint32_t die_cnt;
> >
> >      int64_t dirty_page;
> >
> > @@ -492,7 +495,7 @@ static inline void flash_sync_area(Flash *s,
> > int64_t off, int64_t len)
> >
> >  static void flash_erase(Flash *s, int offset, FlashCMD cmd)  {
> > -    uint32_t len;
> > +    uint32_t len =3D 0;
>=20
> Do you really need this?

Compilation warning.
>=20
> >      uint8_t capa_to_assert =3D 0;
> >
> >      switch (cmd) {
> > @@ -513,6 +516,16 @@ static void flash_erase(Flash *s, int offset,
> FlashCMD cmd)
> >      case BULK_ERASE:
> >          len =3D s->size;
> >          break;
> > +    case DIE_ERASE:
> > +        if (s->die_cnt) {
> > +            len =3D s->size / s->die_cnt;
> > +            offset =3D offset & (~(len-1));
> > +        } else {
> > +            qemu_log_mask(LOG_GUEST_ERROR, "M25P80: %d die erase not
> supported by"
> > +                          " device\n", len);
> > +            return;
> > +        }
> > +        break;
> >      default:
> >          abort();
> >      }
> > @@ -634,6 +647,7 @@ static void complete_collecting_data(Flash *s)
> >      case ERASE4_32K:
> >      case ERASE_SECTOR:
> >      case ERASE4_SECTOR:
> > +    case DIE_ERASE:
> >          flash_erase(s, s->cur_addr, s->cmd_in_progress);
> >          break;
> >      case WRSR:
> > @@ -684,6 +698,7 @@ static void reset_memory(Flash *s)
> >      s->write_enable =3D false;
> >      s->reset_enable =3D false;
> >      s->quad_enable =3D false;
> > +    s->die_cnt =3D 0;
> >
> >      switch (get_man(s)) {
> >      case MAN_NUMONYX:
> > @@ -716,7 +731,15 @@ static void reset_memory(Flash *s)
> >              s->four_bytes_address_mode =3D true;
> >          }
> >          if (!(s->nonvolatile_cfg & NVCFG_LOWER_SEGMENT_MASK)) {
> > -            s->ear =3D s->size / MAX_3BYTES_SIZE - 1;
> > +            s->ear =3D ( s->size > MAX_3BYTES_SIZE ? s->size / MAX_3BY=
TES_SIZE
> - 1 : 0);
> > +        }
> > +        /* 1GiB devices */
> > +        if (s->pi->id[2] =3D=3D 0x21) {
> > +            /* MT25Q00 has 2 dies N25Q00 has 4 */
> > +            if (s->pi->id[4] & BIT(6))
> > +                s->die_cnt =3D 2;
> > +            else
> > +                s->die_cnt =3D 4;
>=20
> Decoding of die_cnt should probably be done in realize().
>=20
> >          }
> >          break;
> >      case MAN_MACRONIX:
> > @@ -880,6 +903,7 @@ static void decode_new_cmd(Flash *s, uint32_t
> value)
> >      case PP:
> >      case PP4:
> >      case PP4_4:
> > +    case DIE_ERASE:
> >          s->needed_bytes =3D get_addr_length(s);
> >          s->pos =3D 0;
> >          s->len =3D 0;
> > @@ -1217,6 +1241,7 @@ static const VMStateDescription vmstate_m25p80
> =3D {
> >          VMSTATE_UINT8(spansion_cr2nv, Flash),
> >          VMSTATE_UINT8(spansion_cr3nv, Flash),
> >          VMSTATE_UINT8(spansion_cr4nv, Flash),
> > +        VMSTATE_UINT32(die_cnt, Flash),
>=20
> die_cnt is fixed per instance. Since it doesn't change, it doesn't need t=
o be
> part of VMSTATE.

Yes, you are right. Even more, number of a dies is fixed attribute of chip,=
 so it could
Be a part of FlashPartInfo. I'll up v2.

Thanks,
Marcin

>=20
> >          VMSTATE_END_OF_LIST()
> >      }
> >  };
> > --
> > 2.7.4
> >
> >
