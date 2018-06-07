Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1704500wrq;
        Wed, 6 Jun 2018 23:10:03 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLoW6aukg1FiIIG0nQYt/noLcZ/V/mtdIJhvdvttOameDvGmbikqmqyXv8Xn2k18Z/ZQ6EZ
X-Received: by 2002:a37:670c:: with SMTP id b12-v6mr391889qkc.108.1528351803839;
        Wed, 06 Jun 2018 23:10:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528351803; cv=none;
        d=google.com; s=arc-20160816;
        b=wJzl10bJS0EmUL6aCe39VtLAghBevcgBjAgaLcRdfIrRkJPY2cRl/OwKi+/Etgivi+
         p0cCnk5JpgaJXqeprgVj+DyWaZbdHV5t5zOhZEmKEp4NWxux7jVJIeFCqioewQQaca4W
         MYrGyBDknT58/T3g0ZPwacZsqvcd8FzHxlzMP0KHKv7L1PtnPo6QTxI05Xrqn5ytF9z8
         TLdWf29O1zi1XaaytiXUJwSyt+/zSmC7+uG+mTJXRDp0yn308W54hgO13mgxGQoTj1Wg
         bSIC/SeJuLCXw8xxvlxouJw5pG5WZfJSbACDkE0yFEBlZF4ZECio69xBACcV2afL0yr7
         fHrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature:arc-authentication-results;
        bh=osVpa1Hea96j+O1I+SObgwdyXaNKT/x3dFVmFO27gbQ=;
        b=HuOmo4JN1C1JVjDpwiEfVjZbUNUNwCzVChLsya4a+2updTd8l0VVpn4d5pb3zfgn7e
         Qp9U/qiNXRTOYpx7CNCHXy1OF5bo9EivY+CRrHEAGQUt2K+cdQH+r8fX4R4JhJL3GsNe
         U08LrbjAwXBcfWOLFeDYhTAdW264k4fAC/vedKXr1zZa2ZsH7090YR0goeIiCHJBgQ7o
         Ugf9Yn7WLsJTgi6UDfinsnIuyCLFiMQvKk/wrvdTWG1gK2S+FiHtCXMmvcQB/CCWKHx1
         k23AjyuRTgKlNgT3Tg7qZvzwM0WLyhwNx9CBn64RMVj7bkIodRl7N6YO1kgqIhtaUPXZ
         w5uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=YIuDjrVC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h15-v6si2717988qtn.387.2018.06.06.23.10.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Jun 2018 23:10:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@xilinx.onmicrosoft.com header.s=selector1-xilinx-com header.b=YIuDjrVC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55867 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQo7X-0006gj-BL
	for alex.bennee@linaro.org; Thu, 07 Jun 2018 02:10:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <saipava@xilinx.com>) id 1fQo67-0005Th-Ks
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 02:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <saipava@xilinx.com>) id 1fQo64-0004G1-3A
	for qemu-devel@nongnu.org; Thu, 07 Jun 2018 02:08:35 -0400
Received: from mail-cys01nam02on0088.outbound.protection.outlook.com
	([104.47.37.88]:19328
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <saipava@xilinx.com>)
	id 1fQo63-0004EM-Ia; Thu, 07 Jun 2018 02:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=osVpa1Hea96j+O1I+SObgwdyXaNKT/x3dFVmFO27gbQ=;
	b=YIuDjrVCg9L6o7HUCwO9F2VRIccwtfOQR4m4Dtv+ALDZxTVqrN+hsNNKJ6c/0CodGnC1u8ymineM8IJQG0pr1rljRrb/hf6fcCgLk2W0Yjdb3sDfno7RFv6t9WDcy3tYE3SEBniNLnCZEhW7KaS9pTB70aVhetzWTY5SsyeRbsE=
Received: from MWHPR02MB2478.namprd02.prod.outlook.com (10.168.204.148) by
	MWHPR02MB2592.namprd02.prod.outlook.com (10.168.205.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.15; Thu, 7 Jun 2018 06:08:28 +0000
Received: from MWHPR02MB2478.namprd02.prod.outlook.com
	([fe80::e8ff:73e5:677f:1c50]) by
	MWHPR02MB2478.namprd02.prod.outlook.com
	([fe80::e8ff:73e5:677f:1c50%7]) with mapi id 15.20.0820.015;
	Thu, 7 Jun 2018 06:08:28 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: "luc.michel@greensocs.com" <luc.michel@greensocs.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Thread-Topic: [PATCH 1/6] intc/arm_gic: Refactor operations on the distributor
Thread-Index: AQHT/XkvXvKUizz8oU25YDLHonYKEKRUUG3g
Date: Thu, 7 Jun 2018 06:08:28 +0000
Message-ID: <MWHPR02MB2478BA4007D93FBD665EB8EBCA640@MWHPR02MB2478.namprd02.prod.outlook.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
	<20180606093101.30518-2-luc.michel@greensocs.com>
In-Reply-To: <20180606093101.30518-2-luc.michel@greensocs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=saipava@xilinx.com; 
x-originating-ip: [182.72.145.30]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR02MB2592;
	7:2lGe1RAefGh8tmR2qXbZD7QXh8hd9bjAmRTZYqkKRPt3kmcSUDoGQOjk6GP21FJ8XkjjdR/bhrJCYsL8RLNx0I2m4jRO7+G8GfDSzm1n3rqbIxgMSRt7DQZDGo0VQSFEvsmP52ImtYgvdjvq951RxolmiL86IOrpkcDCmmKXFFTA20u5xXaPJnsiNZ+HtEwNHXm261l2TSXXHDDyUFVpoMh/Kq0lcajr4hSmlFBdjqRnbrDPaQmz3NO8an/UD+sJ
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4534165)(7168020)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR02MB2592; 
x-ms-traffictypediagnostic: MWHPR02MB2592:
x-ld-processed: 657af505-d5df-48d0-8300-c31994686c5c,ExtAddr
x-microsoft-antispam-prvs: <MWHPR02MB2592E96223CF7152989C4A89CA640@MWHPR02MB2592.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(192374486261705)(245156298449039)(192813158149592); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(10201501046)(3002001)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:MWHPR02MB2592; BCL:0; PCL:0; RULEID:; SRVR:MWHPR02MB2592; 
x-forefront-prvs: 06968FD8C4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39380400002)(39860400002)(396003)(366004)(189003)(199004)(13464003)(53946003)(3280700002)(2900100001)(186003)(106356001)(26005)(110136005)(97736004)(55016002)(54906003)(66066001)(229853002)(33656002)(316002)(6436002)(5250100002)(2501003)(105586002)(3660700001)(7696005)(305945005)(74316002)(8936002)(7736002)(81156014)(8676002)(81166006)(25786009)(11346002)(2906002)(99286004)(102836004)(476003)(446003)(6506007)(53546011)(486006)(76176011)(3846002)(6116002)(55236004)(59450400001)(9686003)(68736007)(53936002)(16200700003)(6246003)(4326008)(478600001)(575784001)(14454004)(5660300001)(86362001)(569006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB2592;
	H:MWHPR02MB2478.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: rkO3EUi+3kKPGtygDimdzmPjQ4Smz1KPm2f0HXU5v9R3v8reuCBKXNMrHt5EoKy64SN0hvjOtPPMFJa/QdS7h7sGYH4R3K80JRFuHGdc4zOXurBcern1cs6KYDwsL+vRP9+TwJ5sHnhl3MrSCq/sGDuE+2bmB4KZh4/LVjH2pONy11YGy1mU8quLoJK8KN0S
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 33797141-565c-47fe-61c8-08d5cc3d165c
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33797141-565c-47fe-61c8-08d5cc3d165c
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2018 06:08:28.0635 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2592
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.88
Subject: Re: [Qemu-devel] [PATCH 1/6] intc/arm_gic: Refactor operations on
 the distributor
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Edgar Iglesias <edgari@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"mark.burton@greensocs.com" <mark.burton@greensocs.com>,
	Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PllvsgX7ysM8



> -----Original Message-----
> From: luc.michel@greensocs.com [mailto:luc.michel@greensocs.com]
> Sent: Wednesday, June 6, 2018 3:01 PM
> To: qemu-devel@nongnu.org
> Cc: Luc MICHEL <luc.michel@greensocs.com>; qemu-arm@nongnu.org; Peter
> Maydell <peter.maydell@linaro.org>; Sai Pavan Boddu <saipava@xilinx.com>;
> Edgar Iglesias <edgari@xilinx.com>; mark.burton@greensocs.com; Jan Kiszka
> <jan.kiszka@web.de>
> Subject: [PATCH 1/6] intc/arm_gic: Refactor operations on the distributor
>=20
> From: Luc MICHEL <luc.michel@greensocs.com>

Reviewed-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Thanks,
Sai Pavan
>=20
> In preparation for the virtualization extensions implementation, refactor=
 the
> name of the functions and macros that act on the GIC distributor to make =
that
> fact explicit. It will be useful to differentiate them from the ones that=
 will act on
> the virtual interfaces.
>=20
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c        | 164 ++++++++++++++++++++-------------------
>  hw/intc/arm_gic_common.c |   6 +-
>  hw/intc/arm_gic_kvm.c    |  23 +++---
>  hw/intc/gic_internal.h   |  51 ++++++------
>  4 files changed, 127 insertions(+), 117 deletions(-)
>=20
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c index
> ea0323f969..141f3e7a48 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -92,11 +92,12 @@ void gic_update(GICState *s)
>          best_prio =3D 0x100;
>          best_irq =3D 1023;
>          for (irq =3D 0; irq < s->num_irq; irq++) {
> -            if (GIC_TEST_ENABLED(irq, cm) && gic_test_pending(s, irq, cm=
) &&
> -                (!GIC_TEST_ACTIVE(irq, cm)) &&
> -                (irq < GIC_INTERNAL || GIC_TARGET(irq) & cm)) {
> -                if (GIC_GET_PRIORITY(irq, cpu) < best_prio) {
> -                    best_prio =3D GIC_GET_PRIORITY(irq, cpu);
> +            if (GIC_DIST_TEST_ENABLED(irq, cm) &&
> +                gic_test_pending(s, irq, cm) &&
> +                (!GIC_DIST_TEST_ACTIVE(irq, cm)) &&
> +                (irq < GIC_INTERNAL || GIC_DIST_TARGET(irq) & cm)) {
> +                if (GIC_DIST_GET_PRIORITY(irq, cpu) < best_prio) {
> +                    best_prio =3D GIC_DIST_GET_PRIORITY(irq, cpu);
>                      best_irq =3D irq;
>                  }
>              }
> @@ -112,7 +113,7 @@ void gic_update(GICState *s)
>          if (best_prio < s->priority_mask[cpu]) {
>              s->current_pending[cpu] =3D best_irq;
>              if (best_prio < s->running_priority[cpu]) {
> -                int group =3D GIC_TEST_GROUP(best_irq, cm);
> +                int group =3D GIC_DIST_TEST_GROUP(best_irq, cm);
>=20
>                  if (extract32(s->ctlr, group, 1) &&
>                      extract32(s->cpu_ctlr[cpu], group, 1)) { @@ -145,7 +=
146,7 @@ void
> gic_set_pending_private(GICState *s, int cpu, int irq)
>      }
>=20
>      DPRINTF("Set %d pending cpu %d\n", irq, cpu);
> -    GIC_SET_PENDING(irq, cm);
> +    GIC_DIST_SET_PENDING(irq, cm);
>      gic_update(s);
>  }
>=20
> @@ -153,13 +154,13 @@ static void gic_set_irq_11mpcore(GICState *s, int i=
rq,
> int level,
>                                   int cm, int target)  {
>      if (level) {
> -        GIC_SET_LEVEL(irq, cm);
> -        if (GIC_TEST_EDGE_TRIGGER(irq) || GIC_TEST_ENABLED(irq, cm)) {
> +        GIC_DIST_SET_LEVEL(irq, cm);
> +        if (GIC_DIST_TEST_EDGE_TRIGGER(irq) ||
> + GIC_DIST_TEST_ENABLED(irq, cm)) {
>              DPRINTF("Set %d pending mask %x\n", irq, target);
> -            GIC_SET_PENDING(irq, target);
> +            GIC_DIST_SET_PENDING(irq, target);
>          }
>      } else {
> -        GIC_CLEAR_LEVEL(irq, cm);
> +        GIC_DIST_CLEAR_LEVEL(irq, cm);
>      }
>  }
>=20
> @@ -167,13 +168,13 @@ static void gic_set_irq_generic(GICState *s, int ir=
q, int
> level,
>                                  int cm, int target)  {
>      if (level) {
> -        GIC_SET_LEVEL(irq, cm);
> +        GIC_DIST_SET_LEVEL(irq, cm);
>          DPRINTF("Set %d pending mask %x\n", irq, target);
> -        if (GIC_TEST_EDGE_TRIGGER(irq)) {
> -            GIC_SET_PENDING(irq, target);
> +        if (GIC_DIST_TEST_EDGE_TRIGGER(irq)) {
> +            GIC_DIST_SET_PENDING(irq, target);
>          }
>      } else {
> -        GIC_CLEAR_LEVEL(irq, cm);
> +        GIC_DIST_CLEAR_LEVEL(irq, cm);
>      }
>  }
>=20
> @@ -192,7 +193,7 @@ static void gic_set_irq(void *opaque, int irq, int le=
vel)
>          /* The first external input line is internal interrupt 32.  */
>          cm =3D ALL_CPU_MASK;
>          irq +=3D GIC_INTERNAL;
> -        target =3D GIC_TARGET(irq);
> +        target =3D GIC_DIST_TARGET(irq);
>      } else {
>          int cpu;
>          irq -=3D (s->num_irq - GIC_INTERNAL); @@ -204,7 +205,7 @@ static=
 void
> gic_set_irq(void *opaque, int irq, int level)
>=20
>      assert(irq >=3D GIC_NR_SGIS);
>=20
> -    if (level =3D=3D GIC_TEST_LEVEL(irq, cm)) {
> +    if (level =3D=3D GIC_DIST_TEST_LEVEL(irq, cm)) {
>          return;
>      }
>=20
> @@ -224,7 +225,7 @@ static uint16_t gic_get_current_pending_irq(GICState
> *s, int cpu,
>      uint16_t pending_irq =3D s->current_pending[cpu];
>=20
>      if (pending_irq < GIC_MAXIRQ && gic_has_groups(s)) {
> -        int group =3D GIC_TEST_GROUP(pending_irq, (1 << cpu));
> +        int group =3D GIC_DIST_TEST_GROUP(pending_irq, (1 << cpu));
>          /* On a GIC without the security extensions, reading this regist=
er
>           * behaves in the same way as a secure access to a GIC with them=
.
>           */
> @@ -255,7 +256,7 @@ static int gic_get_group_priority(GICState *s, int cp=
u, int
> irq)
>=20
>      if (gic_has_groups(s) &&
>          !(s->cpu_ctlr[cpu] & GICC_CTLR_CBPR) &&
> -        GIC_TEST_GROUP(irq, (1 << cpu))) {
> +        GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
>          bpr =3D s->abpr[cpu] - 1;
>          assert(bpr >=3D 0);
>      } else {
> @@ -268,7 +269,7 @@ static int gic_get_group_priority(GICState *s, int cp=
u, int
> irq)
>       */
>      mask =3D ~0U << ((bpr & 7) + 1);
>=20
> -    return GIC_GET_PRIORITY(irq, cpu) & mask;
> +    return GIC_DIST_GET_PRIORITY(irq, cpu) & mask;
>  }
>=20
>  static void gic_activate_irq(GICState *s, int cpu, int irq) @@ -281,14 +=
282,14
> @@ static void gic_activate_irq(GICState *s, int cpu, int irq)
>      int regno =3D preemption_level / 32;
>      int bitno =3D preemption_level % 32;
>=20
> -    if (gic_has_groups(s) && GIC_TEST_GROUP(irq, (1 << cpu))) {
> +    if (gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
>          s->nsapr[regno][cpu] |=3D (1 << bitno);
>      } else {
>          s->apr[regno][cpu] |=3D (1 << bitno);
>      }
>=20
>      s->running_priority[cpu] =3D prio;
> -    GIC_SET_ACTIVE(irq, 1 << cpu);
> +    GIC_DIST_SET_ACTIVE(irq, 1 << cpu);
>  }
>=20
>  static int gic_get_prio_from_apr_bits(GICState *s, int cpu) @@ -357,7 +3=
58,7
> @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>          return irq;
>      }
>=20
> -    if (GIC_GET_PRIORITY(irq, cpu) >=3D s->running_priority[cpu]) {
> +    if (GIC_DIST_GET_PRIORITY(irq, cpu) >=3D s->running_priority[cpu]) {
>          DPRINTF("ACK, pending interrupt (%d) has insufficient priority\n=
", irq);
>          return 1023;
>      }
> @@ -366,7 +367,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu,
> MemTxAttrs attrs)
>          /* Clear pending flags for both level and edge triggered interru=
pts.
>           * Level triggered IRQs will be reasserted once they become inac=
tive.
>           */
> -        GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : cm);
> +        GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ?
> ALL_CPU_MASK
> +                                                             : cm);
>          ret =3D irq;
>      } else {
>          if (irq < GIC_NR_SGIS) {
> @@ -378,7 +380,9 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu,
> MemTxAttrs attrs)
>              src =3D ctz32(s->sgi_pending[irq][cpu]);
>              s->sgi_pending[irq][cpu] &=3D ~(1 << src);
>              if (s->sgi_pending[irq][cpu] =3D=3D 0) {
> -                GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MAS=
K :
> cm);
> +                GIC_DIST_CLEAR_PENDING(irq,
> +                                       GIC_DIST_TEST_MODEL(irq) ? ALL_CP=
U_MASK
> +                                                                : cm);
>              }
>              ret =3D irq | ((src & 0x7) << 10);
>          } else {
> @@ -386,7 +390,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu,
> MemTxAttrs attrs)
>               * interrupts. (level triggered interrupts with an active li=
ne
>               * remain pending, see gic_test_pending)
>               */
> -            GIC_CLEAR_PENDING(irq, GIC_TEST_MODEL(irq) ? ALL_CPU_MASK : =
cm);
> +            GIC_DIST_CLEAR_PENDING(irq, GIC_DIST_TEST_MODEL(irq) ?
> ALL_CPU_MASK
> +                                                                 : cm);
>              ret =3D irq;
>          }
>      }
> @@ -397,11 +402,11 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu,
> MemTxAttrs attrs)
>      return ret;
>  }
>=20
> -void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
> +void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
>                        MemTxAttrs attrs)  {
>      if (s->security_extn && !attrs.secure) {
> -        if (!GIC_TEST_GROUP(irq, (1 << cpu))) {
> +        if (!GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
>              return; /* Ignore Non-secure access of Group0 IRQ */
>          }
>          val =3D 0x80 | (val >> 1); /* Non-secure view */ @@ -414,13 +419=
,13 @@
> void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
>      }
>  }
>=20
> -static uint32_t gic_get_priority(GICState *s, int cpu, int irq,
> +static uint32_t gic_dist_get_priority(GICState *s, int cpu, int irq,
>                                   MemTxAttrs attrs)  {
> -    uint32_t prio =3D GIC_GET_PRIORITY(irq, cpu);
> +    uint32_t prio =3D GIC_DIST_GET_PRIORITY(irq, cpu);
>=20
>      if (s->security_extn && !attrs.secure) {
> -        if (!GIC_TEST_GROUP(irq, (1 << cpu))) {
> +        if (!GIC_DIST_TEST_GROUP(irq, (1 << cpu))) {
>              return 0; /* Non-secure access cannot read priority of Group=
0 IRQ */
>          }
>          prio =3D (prio << 1) & 0xff; /* Non-secure view */ @@ -543,7 +54=
8,7 @@
> static bool gic_eoi_split(GICState *s, int cpu, MemTxAttrs attrs)  static=
 void
> gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)  {
>      int cm =3D 1 << cpu;
> -    int group =3D gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
> +    int group =3D gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
>=20
>      if (!gic_eoi_split(s, cpu, attrs)) {
>          /* This is UNPREDICTABLE; we choose to ignore it */ @@ -557,7 +5=
62,7
> @@ static void gic_deactivate_irq(GICState *s, int cpu, int irq, MemTxAtt=
rs
> attrs)
>          return;
>      }
>=20
> -    GIC_CLEAR_ACTIVE(irq, cm);
> +    GIC_DIST_CLEAR_ACTIVE(irq, cm);
>  }
>=20
>  void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs) @=
@ -
> 584,14 +589,15 @@ void gic_complete_irq(GICState *s, int cpu, int irq,
> MemTxAttrs attrs)
>      if (s->revision =3D=3D REV_11MPCORE) {
>          /* Mark level triggered interrupts as pending if they are still
>             raised.  */
> -        if (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_ENABLED(irq, cm)
> -            && GIC_TEST_LEVEL(irq, cm) && (GIC_TARGET(irq) & cm) !=3D 0)=
 {
> +        if (!GIC_DIST_TEST_EDGE_TRIGGER(irq) && GIC_DIST_TEST_ENABLED(ir=
q,
> cm)
> +            && GIC_DIST_TEST_LEVEL(irq, cm)
> +            && (GIC_DIST_TARGET(irq) & cm) !=3D 0) {
>              DPRINTF("Set %d pending mask %x\n", irq, cm);
> -            GIC_SET_PENDING(irq, cm);
> +            GIC_DIST_SET_PENDING(irq, cm);
>          }
>      }
>=20
> -    group =3D gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
> +    group =3D gic_has_groups(s) && GIC_DIST_TEST_GROUP(irq, cm);
>=20
>      if (s->security_extn && !attrs.secure && !group) {
>          DPRINTF("Non-secure EOI for Group0 interrupt %d ignored\n", irq)=
; @@ -
> 607,7 +613,7 @@ void gic_complete_irq(GICState *s, int cpu, int irq,
> MemTxAttrs attrs)
>=20
>      /* In GICv2 the guest can choose to split priority-drop and deactiva=
te */
>      if (!gic_eoi_split(s, cpu, attrs)) {
> -        GIC_CLEAR_ACTIVE(irq, cm);
> +        GIC_DIST_CLEAR_ACTIVE(irq, cm);
>      }
>      gic_update(s);
>  }
> @@ -655,7 +661,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>                      goto bad_reg;
>                  }
>                  for (i =3D 0; i < 8; i++) {
> -                    if (GIC_TEST_GROUP(irq + i, cm)) {
> +                    if (GIC_DIST_TEST_GROUP(irq + i, cm)) {
>                          res |=3D (1 << i);
>                      }
>                  }
> @@ -675,11 +681,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>          res =3D 0;
>          for (i =3D 0; i < 8; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>=20
> -            if (GIC_TEST_ENABLED(irq + i, cm)) {
> +            if (GIC_DIST_TEST_ENABLED(irq + i, cm)) {
>                  res |=3D (1 << i);
>              }
>          }
> @@ -696,7 +702,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>          mask =3D (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
>          for (i =3D 0; i < 8; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>=20
> @@ -713,11 +719,11 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>          mask =3D (irq < GIC_INTERNAL) ?  cm : ALL_CPU_MASK;
>          for (i =3D 0; i < 8; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>=20
> -            if (GIC_TEST_ACTIVE(irq + i, mask)) {
> +            if (GIC_DIST_TEST_ACTIVE(irq + i, mask)) {
>                  res |=3D (1 << i);
>              }
>          }
> @@ -726,7 +732,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>          irq =3D (offset - 0x400) + GIC_BASE_IRQ;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
> -        res =3D gic_get_priority(s, cpu, irq, attrs);
> +        res =3D gic_dist_get_priority(s, cpu, irq, attrs);
>      } else if (offset < 0xc00) {
>          /* Interrupt CPU Target.  */
>          if (s->num_cpu =3D=3D 1 && s->revision !=3D REV_11MPCORE) { @@ -=
740,7
> +746,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset,
> MemTxAttrs attrs)
>              if (irq >=3D 29 && irq <=3D 31) {
>                  res =3D cm;
>              } else {
> -                res =3D GIC_TARGET(irq);
> +                res =3D GIC_DIST_TARGET(irq);
>              }
>          }
>      } else if (offset < 0xf00) {
> @@ -751,14 +757,16 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>          res =3D 0;
>          for (i =3D 0; i < 4; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>=20
> -            if (GIC_TEST_MODEL(irq + i))
> +            if (GIC_DIST_TEST_MODEL(irq + i)) {
>                  res |=3D (1 << (i * 2));
> -            if (GIC_TEST_EDGE_TRIGGER(irq + i))
> +            }
> +            if (GIC_DIST_TEST_EDGE_TRIGGER(irq + i)) {
>                  res |=3D (2 << (i * 2));
> +            }
>          }
>      } else if (offset < 0xf10) {
>          goto bad_reg;
> @@ -776,7 +784,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr
> offset, MemTxAttrs attrs)
>          }
>=20
>          if (s->security_extn && !attrs.secure &&
> -            !GIC_TEST_GROUP(irq, 1 << cpu)) {
> +            !GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
>              res =3D 0; /* Ignore Non-secure access of Group0 IRQ */
>          } else {
>              res =3D s->sgi_pending[irq][cpu]; @@ -872,10 +880,10 @@ stat=
ic void
> gic_dist_writeb(void *opaque, hwaddr offset,
>                      int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_C=
PU_MASK;
>                      if (value & (1 << i)) {
>                          /* Group1 (Non-secure) */
> -                        GIC_SET_GROUP(irq + i, cm);
> +                        GIC_DIST_SET_GROUP(irq + i, cm);
>                      } else {
>                          /* Group0 (Secure) */
> -                        GIC_CLEAR_GROUP(irq + i, cm);
> +                        GIC_DIST_CLEAR_GROUP(irq + i, cm);
>                      }
>                  }
>              }
> @@ -893,26 +901,26 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>=20
>          for (i =3D 0; i < 8; i++) {
>              if (value & (1 << i)) {
> -                int mask =3D
> -                    (irq < GIC_INTERNAL) ? (1 << cpu) : GIC_TARGET(irq +=
 i);
> +                int mask =3D (irq < GIC_INTERNAL) ? (1 << cpu)
> +                                                : GIC_DIST_TARGET(irq +
> + i);
>                  int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_M=
ASK;
>=20
>                  if (s->security_extn && !attrs.secure &&
> -                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ =
*/
>                  }
>=20
> -                if (!GIC_TEST_ENABLED(irq + i, cm)) {
> +                if (!GIC_DIST_TEST_ENABLED(irq + i, cm)) {
>                      DPRINTF("Enabled IRQ %d\n", irq + i);
>                      trace_gic_enable_irq(irq + i);
>                  }
> -                GIC_SET_ENABLED(irq + i, cm);
> +                GIC_DIST_SET_ENABLED(irq + i, cm);
>                  /* If a raised level triggered IRQ enabled then mark
>                     is as pending.  */
> -                if (GIC_TEST_LEVEL(irq + i, mask)
> -                        && !GIC_TEST_EDGE_TRIGGER(irq + i)) {
> +                if (GIC_DIST_TEST_LEVEL(irq + i, mask)
> +                        && !GIC_DIST_TEST_EDGE_TRIGGER(irq + i)) {
>                      DPRINTF("Set %d pending mask %x\n", irq + i, mask);
> -                    GIC_SET_PENDING(irq + i, mask);
> +                    GIC_DIST_SET_PENDING(irq + i, mask);
>                  }
>              }
>          }
> @@ -930,15 +938,15 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>                  int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_M=
ASK;
>=20
>                  if (s->security_extn && !attrs.secure &&
> -                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ =
*/
>                  }
>=20
> -                if (GIC_TEST_ENABLED(irq + i, cm)) {
> +                if (GIC_DIST_TEST_ENABLED(irq + i, cm)) {
>                      DPRINTF("Disabled IRQ %d\n", irq + i);
>                      trace_gic_disable_irq(irq + i);
>                  }
> -                GIC_CLEAR_ENABLED(irq + i, cm);
> +                GIC_DIST_CLEAR_ENABLED(irq + i, cm);
>              }
>          }
>      } else if (offset < 0x280) {
> @@ -953,11 +961,11 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          for (i =3D 0; i < 8; i++) {
>              if (value & (1 << i)) {
>                  if (s->security_extn && !attrs.secure &&
> -                    !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                    !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                      continue; /* Ignore Non-secure access of Group0 IRQ =
*/
>                  }
>=20
> -                GIC_SET_PENDING(irq + i, GIC_TARGET(irq + i));
> +                GIC_DIST_SET_PENDING(irq + i, GIC_DIST_TARGET(irq +
> + i));
>              }
>          }
>      } else if (offset < 0x300) {
> @@ -971,7 +979,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>=20
>          for (i =3D 0; i < 8; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>=20
> @@ -979,7 +987,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>                 for per-CPU interrupts.  It's unclear whether this is the
>                 corect behavior.  */
>              if (value & (1 << i)) {
> -                GIC_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
> +                GIC_DIST_CLEAR_PENDING(irq + i, ALL_CPU_MASK);
>              }
>          }
>      } else if (offset < 0x400) {
> @@ -990,7 +998,7 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          irq =3D (offset - 0x400) + GIC_BASE_IRQ;
>          if (irq >=3D s->num_irq)
>              goto bad_reg;
> -        gic_set_priority(s, cpu, irq, value, attrs);
> +        gic_dist_set_priority(s, cpu, irq, value, attrs);
>      } else if (offset < 0xc00) {
>          /* Interrupt CPU Target. RAZ/WI on uniprocessor GICs, with the
>           * annoying exception of the 11MPCore's GIC.
> @@ -1016,21 +1024,21 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>              value |=3D 0xaa;
>          for (i =3D 0; i < 4; i++) {
>              if (s->security_extn && !attrs.secure &&
> -                !GIC_TEST_GROUP(irq + i, 1 << cpu)) {
> +                !GIC_DIST_TEST_GROUP(irq + i, 1 << cpu)) {
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>=20
>              if (s->revision =3D=3D REV_11MPCORE) {
>                  if (value & (1 << (i * 2))) {
> -                    GIC_SET_MODEL(irq + i);
> +                    GIC_DIST_SET_MODEL(irq + i);
>                  } else {
> -                    GIC_CLEAR_MODEL(irq + i);
> +                    GIC_DIST_CLEAR_MODEL(irq + i);
>                  }
>              }
>              if (value & (2 << (i * 2))) {
> -                GIC_SET_EDGE_TRIGGER(irq + i);
> +                GIC_DIST_SET_EDGE_TRIGGER(irq + i);
>              } else {
> -                GIC_CLEAR_EDGE_TRIGGER(irq + i);
> +                GIC_DIST_CLEAR_EDGE_TRIGGER(irq + i);
>              }
>          }
>      } else if (offset < 0xf10) {
> @@ -1044,10 +1052,10 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          irq =3D (offset - 0xf10);
>=20
>          if (!s->security_extn || attrs.secure ||
> -            GIC_TEST_GROUP(irq, 1 << cpu)) {
> +            GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
>              s->sgi_pending[irq][cpu] &=3D ~value;
>              if (s->sgi_pending[irq][cpu] =3D=3D 0) {
> -                GIC_CLEAR_PENDING(irq, 1 << cpu);
> +                GIC_DIST_CLEAR_PENDING(irq, 1 << cpu);
>              }
>          }
>      } else if (offset < 0xf30) {
> @@ -1058,8 +1066,8 @@ static void gic_dist_writeb(void *opaque, hwaddr
> offset,
>          irq =3D (offset - 0xf20);
>=20
>          if (!s->security_extn || attrs.secure ||
> -            GIC_TEST_GROUP(irq, 1 << cpu)) {
> -            GIC_SET_PENDING(irq, 1 << cpu);
> +            GIC_DIST_TEST_GROUP(irq, 1 << cpu)) {
> +            GIC_DIST_SET_PENDING(irq, 1 << cpu);
>              s->sgi_pending[irq][cpu] |=3D value;
>          }
>      } else {
> @@ -1106,7 +1114,7 @@ static void gic_dist_writel(void *opaque, hwaddr
> offset,
>              mask =3D ALL_CPU_MASK;
>              break;
>          }
> -        GIC_SET_PENDING(irq, mask);
> +        GIC_DIST_SET_PENDING(irq, mask);
>          target_cpu =3D ctz32(mask);
>          while (target_cpu < GIC_NCPU) {
>              s->sgi_pending[irq][target_cpu] |=3D (1 << cpu); diff --git
> a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c index
> aee50a20e0..295ee9cc5e 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -204,8 +204,8 @@ static void arm_gic_common_reset(DeviceState *dev)
>          }
>      }
>      for (i =3D 0; i < GIC_NR_SGIS; i++) {
> -        GIC_SET_ENABLED(i, ALL_CPU_MASK);
> -        GIC_SET_EDGE_TRIGGER(i);
> +        GIC_DIST_SET_ENABLED(i, ALL_CPU_MASK);
> +        GIC_DIST_SET_EDGE_TRIGGER(i);
>      }
>=20
>      for (i =3D 0; i < ARRAY_SIZE(s->priority2); i++) { @@ -222,7 +222,7 =
@@ static
> void arm_gic_common_reset(DeviceState *dev)
>      }
>      if (s->security_extn && s->irq_reset_nonsecure) {
>          for (i =3D 0; i < GIC_MAXIRQ; i++) {
> -            GIC_SET_GROUP(i, ALL_CPU_MASK);
> +            GIC_DIST_SET_GROUP(i, ALL_CPU_MASK);
>          }
>      }
>=20
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c index
> 204369d0e2..799136732a 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -140,10 +140,10 @@ static void translate_group(GICState *s, int irq, i=
nt
> cpu,
>      int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>=20
>      if (to_kernel) {
> -        *field =3D GIC_TEST_GROUP(irq, cm);
> +        *field =3D GIC_DIST_TEST_GROUP(irq, cm);
>      } else {
>          if (*field & 1) {
> -            GIC_SET_GROUP(irq, cm);
> +            GIC_DIST_SET_GROUP(irq, cm);
>          }
>      }
>  }
> @@ -154,10 +154,10 @@ static void translate_enabled(GICState *s, int irq,=
 int
> cpu,
>      int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>=20
>      if (to_kernel) {
> -        *field =3D GIC_TEST_ENABLED(irq, cm);
> +        *field =3D GIC_DIST_TEST_ENABLED(irq, cm);
>      } else {
>          if (*field & 1) {
> -            GIC_SET_ENABLED(irq, cm);
> +            GIC_DIST_SET_ENABLED(irq, cm);
>          }
>      }
>  }
> @@ -171,7 +171,7 @@ static void translate_pending(GICState *s, int irq, i=
nt
> cpu,
>          *field =3D gic_test_pending(s, irq, cm);
>      } else {
>          if (*field & 1) {
> -            GIC_SET_PENDING(irq, cm);
> +            GIC_DIST_SET_PENDING(irq, cm);
>              /* TODO: Capture is level-line is held high in the kernel */
>          }
>      }
> @@ -183,10 +183,10 @@ static void translate_active(GICState *s, int irq, =
int
> cpu,
>      int cm =3D (irq < GIC_INTERNAL) ? (1 << cpu) : ALL_CPU_MASK;
>=20
>      if (to_kernel) {
> -        *field =3D GIC_TEST_ACTIVE(irq, cm);
> +        *field =3D GIC_DIST_TEST_ACTIVE(irq, cm);
>      } else {
>          if (*field & 1) {
> -            GIC_SET_ACTIVE(irq, cm);
> +            GIC_DIST_SET_ACTIVE(irq, cm);
>          }
>      }
>  }
> @@ -195,10 +195,10 @@ static void translate_trigger(GICState *s, int irq,=
 int
> cpu,
>                                uint32_t *field, bool to_kernel)  {
>      if (to_kernel) {
> -        *field =3D (GIC_TEST_EDGE_TRIGGER(irq)) ? 0x2 : 0x0;
> +        *field =3D (GIC_DIST_TEST_EDGE_TRIGGER(irq)) ? 0x2 : 0x0;
>      } else {
>          if (*field & 0x2) {
> -            GIC_SET_EDGE_TRIGGER(irq);
> +            GIC_DIST_SET_EDGE_TRIGGER(irq);
>          }
>      }
>  }
> @@ -207,9 +207,10 @@ static void translate_priority(GICState *s, int irq,=
 int
> cpu,
>                                 uint32_t *field, bool to_kernel)  {
>      if (to_kernel) {
> -        *field =3D GIC_GET_PRIORITY(irq, cpu) & 0xff;
> +        *field =3D GIC_DIST_GET_PRIORITY(irq, cpu) & 0xff;
>      } else {
> -        gic_set_priority(s, cpu, irq, *field & 0xff, MEMTXATTRS_UNSPECIF=
IED);
> +        gic_dist_set_priority(s, cpu, irq,
> +                              *field & 0xff, MEMTXATTRS_UNSPECIFIED);
>      }
>  }
>=20
> diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h index
> 7fe87b13de..6f8d242904 100644
> --- a/hw/intc/gic_internal.h
> +++ b/hw/intc/gic_internal.h
> @@ -27,30 +27,31 @@
>=20
>  #define GIC_BASE_IRQ 0
>=20
> -#define GIC_SET_ENABLED(irq, cm) s->irq_state[irq].enabled |=3D (cm) -#d=
efine
> GIC_CLEAR_ENABLED(irq, cm) s->irq_state[irq].enabled &=3D ~(cm) -#define
> GIC_TEST_ENABLED(irq, cm) ((s->irq_state[irq].enabled & (cm)) !=3D 0) -#d=
efine
> GIC_SET_PENDING(irq, cm) s->irq_state[irq].pending |=3D (cm) -#define
> GIC_CLEAR_PENDING(irq, cm) s->irq_state[irq].pending &=3D ~(cm) -#define
> GIC_SET_ACTIVE(irq, cm) s->irq_state[irq].active |=3D (cm) -#define
> GIC_CLEAR_ACTIVE(irq, cm) s->irq_state[irq].active &=3D ~(cm) -#define
> GIC_TEST_ACTIVE(irq, cm) ((s->irq_state[irq].active & (cm)) !=3D 0) -#def=
ine
> GIC_SET_MODEL(irq) s->irq_state[irq].model =3D true -#define
> GIC_CLEAR_MODEL(irq) s->irq_state[irq].model =3D false -#define
> GIC_TEST_MODEL(irq) s->irq_state[irq].model -#define GIC_SET_LEVEL(irq, c=
m)
> s->irq_state[irq].level |=3D (cm) -#define GIC_CLEAR_LEVEL(irq, cm) s-
> >irq_state[irq].level &=3D ~(cm) -#define GIC_TEST_LEVEL(irq, cm) ((s-
> >irq_state[irq].level & (cm)) !=3D 0) -#define GIC_SET_EDGE_TRIGGER(irq) =
s-
> >irq_state[irq].edge_trigger =3D true -#define GIC_CLEAR_EDGE_TRIGGER(irq=
) s-
> >irq_state[irq].edge_trigger =3D false -#define GIC_TEST_EDGE_TRIGGER(irq=
) (s-
> >irq_state[irq].edge_trigger)
> -#define GIC_GET_PRIORITY(irq, cpu) (((irq) < GIC_INTERNAL) ?            =
\
> +#define GIC_DIST_SET_ENABLED(irq, cm) (s->irq_state[irq].enabled |=3D
> +(cm)) #define GIC_DIST_CLEAR_ENABLED(irq, cm)
> +(s->irq_state[irq].enabled &=3D ~(cm)) #define GIC_DIST_TEST_ENABLED(irq=
,
> +cm) ((s->irq_state[irq].enabled & (cm)) !=3D 0) #define
> +GIC_DIST_SET_PENDING(irq, cm) (s->irq_state[irq].pending |=3D (cm))
> +#define GIC_DIST_CLEAR_PENDING(irq, cm) (s->irq_state[irq].pending &=3D
> +~(cm)) #define GIC_DIST_SET_ACTIVE(irq, cm) (s->irq_state[irq].active
> +|=3D (cm)) #define GIC_DIST_CLEAR_ACTIVE(irq, cm)
> +(s->irq_state[irq].active &=3D ~(cm)) #define GIC_DIST_TEST_ACTIVE(irq,
> +cm) ((s->irq_state[irq].active & (cm)) !=3D 0) #define
> +GIC_DIST_SET_MODEL(irq) (s->irq_state[irq].model =3D true) #define
> +GIC_DIST_CLEAR_MODEL(irq) (s->irq_state[irq].model =3D false) #define
> +GIC_DIST_TEST_MODEL(irq) (s->irq_state[irq].model) #define
> +GIC_DIST_SET_LEVEL(irq, cm) (s->irq_state[irq].level |=3D (cm)) #define
> +GIC_DIST_CLEAR_LEVEL(irq, cm) (s->irq_state[irq].level &=3D ~(cm))
> +#define GIC_DIST_TEST_LEVEL(irq, cm) ((s->irq_state[irq].level & (cm)) !=
=3D 0)
> #define GIC_DIST_SET_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger =
=3D
> true) #define GIC_DIST_CLEAR_EDGE_TRIGGER(irq) \
> +    (s->irq_state[irq].edge_trigger =3D false) #define
> +GIC_DIST_TEST_EDGE_TRIGGER(irq) (s->irq_state[irq].edge_trigger)
> +#define GIC_DIST_GET_PRIORITY(irq, cpu) (((irq) < GIC_INTERNAL) ?       =
     \
>                                      s->priority1[irq][cpu] :            =
\
>                                      s->priority2[(irq) - GIC_INTERNAL]) =
-#define
> GIC_TARGET(irq) s->irq_target[irq] -#define GIC_CLEAR_GROUP(irq, cm) (s-
> >irq_state[irq].group &=3D ~(cm)) -#define GIC_SET_GROUP(irq, cm) (s-
> >irq_state[irq].group |=3D (cm)) -#define GIC_TEST_GROUP(irq, cm) ((s-
> >irq_state[irq].group & (cm)) !=3D 0)
> +#define GIC_DIST_TARGET(irq) (s->irq_target[irq]) #define
> +GIC_DIST_CLEAR_GROUP(irq, cm) (s->irq_state[irq].group &=3D ~(cm))
> +#define GIC_DIST_SET_GROUP(irq, cm) (s->irq_state[irq].group |=3D (cm))
> +#define GIC_DIST_TEST_GROUP(irq, cm) ((s->irq_state[irq].group & (cm))
> +!=3D 0)
>=20
>  #define GICD_CTLR_EN_GRP0 (1U << 0)
>  #define GICD_CTLR_EN_GRP1 (1U << 1)
> @@ -79,8 +80,8 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu,
> MemTxAttrs attrs);  void gic_complete_irq(GICState *s, int cpu, int irq,
> MemTxAttrs attrs);  void gic_update(GICState *s);  void
> gic_init_irqs_and_distributor(GICState *s); -void gic_set_priority(GICSta=
te *s, int
> cpu, int irq, uint8_t val,
> -                      MemTxAttrs attrs);
> +void gic_dist_set_priority(GICState *s, int cpu, int irq, uint8_t val,
> +                           MemTxAttrs attrs);
>=20
>  static inline bool gic_test_pending(GICState *s, int irq, int cm)  { @@ =
-93,7
> +94,7 @@ static inline bool gic_test_pending(GICState *s, int irq, int cm=
)
>           * GICD_ISPENDR to set the state pending.
>           */
>          return (s->irq_state[irq].pending & cm) ||
> -            (!GIC_TEST_EDGE_TRIGGER(irq) && GIC_TEST_LEVEL(irq, cm));
> +            (!GIC_DIST_TEST_EDGE_TRIGGER(irq) &&
> + GIC_DIST_TEST_LEVEL(irq, cm));
>      }
>  }
>=20
> --
> 2.17.0

