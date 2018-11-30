Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3961599wrt;
        Fri, 30 Nov 2018 11:58:18 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X7KY2n6JAGpiBOV2KTGVk9ya1l5RIqfavjSiGmuTbEuyYmbZiOE7TSdD7MkwqXEKBp9QUE
X-Received: by 2002:a25:29c3:: with SMTP id p186-v6mr6577718ybp.57.1543607898182;
        Fri, 30 Nov 2018 11:58:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543607898; cv=none;
        d=google.com; s=arc-20160816;
        b=jvi02zarrNVDHes1Wa/4Yflv5NSLC9+lpaFn/eyn+CCnICdIIJxoSKWROiEvmyaBuy
         qm1wxSQbOEuxmRvXfw5ri8Qrg/Eta40CC1S/ji11FIbbLPzHHxDIZht5MoQkXo3eYlaF
         DjRGQoMi3f7bpVVk8aNrsgGZ2RjbcR71Y+ua9Fd10xgxUCOteyQaQDVwbhoDex2v6c65
         Jjv4xfrn7xFj2edAIy3vw2+T3U0y+pHTNdcnWUd8b2Ag5n/FGyDLS0xpVhAsU4ODtUcL
         AHqqqgiJQYR6Owt3iFP5w+SwvW9uNgHAlH/QSBvyQbTNA8IOJGNuuALfQN0urTmRsPAl
         L2kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=TvC0jthwoOe0z9hSK+Zb4FrZh+OOBYBwro6uy/4FvXg=;
        b=i/txRf3rkWfXiziir1Jcbly97iCO+Q2I+8WQisP827r4aLU7osbUI4eGpdOYgNSAaT
         0v8f1o0fuSmwd19qk9d3f6HkDDzFYQr/QITInoHEb3p34SFhYbTI7bNBMBXkzTVOqvKR
         SbSoBhjd/317LN3d9GuA4WFGWyfPFDz0DlUYbb4wGmYmaA/2zEuDoUSBYwY2BJxRoUSP
         /IMNizvjxHRTFz7h20U8maI6iklCRsqqGzy78DAMg3p59WYJhTCAnc8ixtYgaf5Xfu36
         OqET4wiYhkNfFnPjH6euh/VH/l2gpOsyWI0Xed95XqseDBBl1UqAwqNUZMj3q5bA+D7Y
         M6Rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=GKqOifuu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x11-v6si3954874ywl.355.2018.11.30.11.58.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 11:58:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=GKqOifuu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSovZ-00086s-MB
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 14:58:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gSovS-00086b-2E
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 14:58:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gSovJ-0001xW-Q2
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 14:58:08 -0500
Received: from mail-eopbgr800129.outbound.protection.outlook.com
	([40.107.80.129]:24608
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gSovJ-0001rF-HQ; Fri, 30 Nov 2018 14:58:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=TvC0jthwoOe0z9hSK+Zb4FrZh+OOBYBwro6uy/4FvXg=;
	b=GKqOifuu/ndW2qTNZgWUlka4gM/9R/U16ziSmXZR+Gt8GDg2he3DnMRsCT27q+mGLuoJYSmb1FseK/iJbE47gnnuzqOyGUfoYqL9HBamAYx8jRbqHbZpvUoaZ9CSZbtKRzfF6ff+mjlNC46VZDuOTzIEb/yHDC7W07Qwe+Nhy2U=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4713.prod.exchangelabs.com (20.177.217.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1361.19; Fri, 30 Nov 2018 19:57:56 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%6]) with mapi id 15.20.1382.020;
	Fri, 30 Nov 2018 19:57:56 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 13/13] target/arm: Send interrupts on PMU counter
	overflow
Thread-Index: AQHUgRe/RrVDSDGCp06ElHLXrFt0RKVonbWAgAAMJYCAAAZOgIAAG5AA
Date: Fri, 30 Nov 2018 19:57:55 +0000
Message-ID: <20181130195742.GC24714@quinoa.localdomain>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
	<20181120212553.8480-14-aaron@os.amperecomputing.com>
	<d6fde9c7-b72e-ae9d-817b-71c3d6369dbc@linaro.org>
	<20181130175629.GB24714@quinoa.localdomain>
	<fb2e45b2-463d-aefe-e3d7-f3027f662c12@linaro.org>
In-Reply-To: <fb2e45b2-463d-aefe-e3d7-f3027f662c12@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CWXP265CA0012.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:400:2e::24) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4713;
	6:EqBxBCa4kmCPM6BKdlin1RXa439g47zvp6kR7H52De2CNsG2Cgrl7itT/u7h2b4N5PfAcnbU/McJ/BDPMtKfqPMh4XD0IirrnZNGPmp/qt09wiXS6ydNwRo58Mq2kOuHzHBYtdd0JojgBjsui0rWKHSSAfnCs9dVh55retSxkwZ9cQDPgfkzjuINsPS9o/su872PyUUEkD1ZK3Vt0aUV+y3G+C83xvFSA/TSEPWdVSNEchh0FFA9OU3zDfiLrxEg1dUr/J9GoPW67KI1B1sZc2FnSnEZNj9+gREn6W7vO9ReeEI/bQbMARZWq/zSaEoJLqVQehaumbVGw6ujovHaVgV5lAyDj4HzNNZ2qh3QNDR6O72VltZ+AS82Dq8gS3SzSoSKKzvfcmRui167PMBaP+zumDiacldhe83wO3lqAXvWDxmzYsUTRCVUAE7xtADlXGyK/5ADRolARFrzeYgK/g==;
	5:mR7fD2mOtceCIIrW9UBQ/o9M/ngs3VVQcN+fHA9mxaeo6HvHl0eFw2un3r6QLxroDXSFqJ6gKN1cVgIjGjCTHzP5n5/morXtqhcoNXVXRpDrsJlSY3ZP5jFafDCkYEkoa3eHyLGANFylRPc6m6G8R045K85MagardHwDrsMA1pU=;
	7:WCkcIr7Gt8KkqC9Lo3OVIEmlnSQeqiSgbxWHUAsBuHJwLDjbR9r7auc1MbxC3JmqxZDBaGyHp8hTL2WIUYMeNsh98nCPqbxoUNVB58jCUkX+41MZWHK4FMYPdJEPYzHFN07ZsdxI2JSifQ1UVHYCOw==
x-ms-office365-filtering-correlation-id: 0058b55d-a3c9-4d92-bb5b-08d656fe1e89
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4713; 
x-ms-traffictypediagnostic: DM6PR01MB4713:
x-microsoft-antispam-prvs: <DM6PR01MB4713DE722D219556CF62F3B98AD30@DM6PR01MB4713.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231453)(999002)(944501410)(52105112)(93006095)(93001095)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4713; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4713; 
x-forefront-prvs: 087223B4DA
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(39850400004)(396003)(376002)(136003)(366004)(199004)(189003)(5660300001)(8676002)(6512007)(7416002)(4326008)(81166006)(6486002)(6436002)(81156014)(54906003)(93886005)(68736007)(229853002)(478600001)(106356001)(8936002)(11346002)(316002)(446003)(105586002)(486006)(476003)(33656002)(76176011)(97736004)(107886003)(33896004)(52116002)(86362001)(102836004)(7736002)(71200400001)(71190400001)(26005)(39060400002)(1076002)(386003)(53546011)(186003)(6506007)(6246003)(6916009)(305945005)(25786009)(256004)(14454004)(66066001)(99286004)(6116002)(9686003)(53936002)(2906002)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4713;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 2JfAvxATQD8p22lpNbzB8OmJuT3hCWlNiab5fMsUfyjJYA9qan8caaL0svy+94+09wOdNYOU/y2VBueRh1WUtVv0DJlMvL7lZKdCJVKdnSvknanY3uVTYIAlyDGHGhheWHlRETgEFkXLNOZDejlYsKZsUSehy5UxdIv3i9mkBCtD4QtxrK/g1isAE+DlxXDd98Kzi8Hyd4B2TjGhqrCE7PcYaQYaCJo7Y2M+3oQ4BDVbi3YrR/4dszQHz+bWPIn/Obg82tpVJkPcLrSzj/cKzoMVd36sMRXS2nhlhdI3aqSRQCv07F7/I3EH2GGCG/MMMDya/M5biCL+qXSq1FoEghZRcySd2sAmpACjVfDsGsE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0EB9EB3CA4B2EE40BAEEB6D2661B5D14@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0058b55d-a3c9-4d92-bb5b-08d656fe1e89
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2018 19:57:55.9012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4713
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.80.129
Subject: Re: [Qemu-arm] [PATCH v8 13/13] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Aaron Lindsay <alindsay@codeaurora.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	SM-Aaron Lindsay <alindsay@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: o3aVWqTp8fCY

On Nov 30 10:19, Richard Henderson wrote:
> On 11/30/18 9:56 AM, Aaron Lindsay wrote:
> > On Nov 30 09:13, Richard Henderson wrote:
> >> On 11/20/18 1:26 PM, Aaron Lindsay wrote:
> >>> Setup a QEMUTimer to get a callback when we expect counters to next
> >>> overflow and trigger an interrupt at that time.
> >>>
> >>> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> >>> Signed-off-by: Aaron Lindsay <alindsay@os.amperecomputing.com>
> >>> ---
> >>>  target/arm/cpu.c    |  12 +++++
> >>>  target/arm/cpu.h    |   7 +++
> >>>  target/arm/helper.c | 126 +++++++++++++++++++++++++++++++++++++++++-=
--
> >>>  3 files changed, 139 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> >>> index 208a08e867..7311a48e3c 100644
> >>> --- a/target/arm/cpu.c
> >>> +++ b/target/arm/cpu.c
> >>> @@ -827,6 +827,13 @@ static void arm_cpu_finalizefn(Object *obj)
> >>>          QLIST_REMOVE(hook, node);
> >>>          g_free(hook);
> >>>      }
> >>> +#ifndef CONFIG_USER_ONLY
> >>> +    if (arm_feature(&cpu->env, ARM_FEATURE_PMU) && cpu->pmu_timer) {
> >>
> >> No need for two tests here.  Just check cpu->pmu_timer.
> >> (If it's set for any reason it should be freed, surely.)
> >>
> >>> @@ -1305,7 +1338,18 @@ void pmccntr_op_start(CPUARMState *env)
> >>>              eff_cycles /=3D 64;
> >>>          }
> >>> =20
> >>> -        env->cp15.c15_ccnt =3D eff_cycles - env->cp15.c15_ccnt_delta=
;
> >>> +        uint64_t new_pmccntr =3D eff_cycles - env->cp15.c15_ccnt_del=
ta;
> >>> +
> >>> +        unsigned int overflow_bit =3D (env->cp15.c9_pmcr & PMCRLC) ?=
 63 : 31;
> >>> +        uint64_t overflow_mask =3D (uint64_t)1 << overflow_bit;
> >>> +        if (!(new_pmccntr & overflow_mask) &&
> >>> +                (env->cp15.c15_ccnt & overflow_mask)) {
> >>
> >> Fyi, this expression is
> >>
> >>     env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask
> >>
> >>> +            env->cp15.c9_pmovsr |=3D (1 << 31);
> >>> +            new_pmccntr &=3D ~overflow_mask;
> >>
> >> Why this line?  You just checked that overflow_mask was unset in new_p=
mccntr above.
> >=20
> > This ensures that when overflow_bit =3D=3D 31 (because PMCR.LC is not s=
et)
> > the high 32 bits remain 0 even after an overflow has occurred. As you
> > point out, it's silly when overflow_bit =3D=3D 64, but I didn't think i=
t was
> > worth the extra conditional to avoid it.
>=20
> Eh?  But we've set overflow_mask based on PMCR.LC, so what you say here d=
oesn't
> make sense.

Sorry, I had an off-by-one-bit think-o I couldn't get past until I
started typing a concrete example to explain myself. I'll change this
line to be:

if (!(env->cp15.c9_pmcr & PMCRLC))
	new_pmccntr &=3D 0xffffffff;

-Aaron
