Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp534995wrw;
        Fri, 16 Nov 2018 07:42:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5eMuGfIlEL+f1leKWmL6yiy+h4tWLwE/7+6z1X0HvEv1zYxFlf6VeghC95BotNqf4133zLW
X-Received: by 2002:a37:112a:: with SMTP id b42mr10808948qkh.136.1542382935223;
        Fri, 16 Nov 2018 07:42:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542382935; cv=none;
        d=google.com; s=arc-20160816;
        b=H06YSCLn5ooYLjnEulpEJehMP53CsJZQnfeA6Vx01LXtejvJO9bl0CZoW8aGT8XOzh
         Kr0BH65ILQJtfmjirXyDFXKf1L2N2QHwK07Va8CcNmSnFung126HexOexkhxuQfCINXe
         sniJgQbIN267k9a3nFwa3qxm+tZEtNSMz4+q5XcPPeyS8ze2DdjZIfEXvHR1FWsefehM
         fjdMr8lC4rt5DYdCht4my9DE+nAmqXX9PBOSat/NTxJGNvxpR5SVEnqCg2YRuvAPtGAV
         T+6brQeJa1WjNPNe+XslOVDPl/DnlDk1K7dMNYw/rn2jiWBfkgMSs4TcOb2jK41reSjt
         U0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=DMsuYZsDLzBLjk1mnFv0UM3VsSrddDMO8Ob11HlD/cY=;
        b=cK02BoVYGJjKEo7/9qd3PCfx2IUr3rXvSTrQyeCuVFzjTA/fnI8lzcsG9NFSVGpHqA
         XSB0Ku63+pMK9vxsPoRHO+JtVa26gt2gj2WFo/5NtTUhFxddX6vURIrpi+vLZbWC4bry
         P37WgMJVVeWo2qjs158f8INp/K0VtyF91zHxkBUS52AC+gPyg/XqZ3e3D90s6qDdA6Mw
         boMevuskw8jXRhN8eKCJB7hPNzhIjxN6bV8TekHevN7ndj4y1cMOKPPiaewh6mkt22iM
         gQMDJQhIa/uKIRwKWUECkpZG+r4tumdZgdBLpmg/o5LO/hhZzdw877j7Bov8VXSUgwR5
         Tblg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=m3ul8JDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si402564qtr.32.2018.11.16.07.42.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 07:42:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=m3ul8JDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:45386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNgG6-00062d-Na
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 10:42:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNgFx-00061Y-Ja
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 10:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gNgFu-00034w-E4
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 10:42:05 -0500
Received: from mail-eopbgr770100.outbound.protection.outlook.com
	([40.107.77.100]:26656
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gNgFt-00032V-T1; Fri, 16 Nov 2018 10:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=DMsuYZsDLzBLjk1mnFv0UM3VsSrddDMO8Ob11HlD/cY=;
	b=m3ul8JDfY5O9alVI8vQBDKZZJxzYfzU4sOkDwZY3HXCvC44i+AY234DE9lAdWNNm6grhCPr3PpSgwkL2v1iZZRtQMJNKfVVkjTil8gy+Ao3dKTs1OVOXMcUalAnO0qGgKqyL3U9BQOt7CSdnCNUCOdUTQWLlP3TsR8izNYgiIzM=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5036.prod.exchangelabs.com (20.176.120.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Fri, 16 Nov 2018 15:41:57 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.045;
	Fri, 16 Nov 2018 15:41:57 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [PATCH v7 02/12] target/arm: Reorganize PMCCNTR accesses
Thread-Index: AQHUdTidRQePjAMjaEK31x4b2nO99aVSjSAAgAAOJoA=
Date: Fri, 16 Nov 2018 15:41:57 +0000
Message-ID: <20181116154137.GC23658@quinoa.localdomain>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
	<20181105185046.2802-3-aaron@os.amperecomputing.com>
	<CAFEAcA-ryywQJsequ9F2Yhb2So0U5XuojF5B2o6ttPA3hN732Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-ryywQJsequ9F2Yhb2So0U5XuojF5B2o6ttPA3hN732Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN3PR03CA0104.namprd03.prod.outlook.com
	(2603:10b6:400:4::22) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5036;
	6:/mkOVMypDbzdbj/b1MlooViDmHoJl/v0VcgnCJDGw8Q/XkqNKssx9UTEB26E4Pf5gdpqMAYZtsIgzkMb+yABYchJ5+rC9WGHWkDbj6ciA9t89UaouNy0VmT5JqPNu94XPIqmCHnH232IikngvmRwt9l/NlWCCqYvGA05GS3VQk3fNK+v5HdEnlhvus4Pu+0LgAXCtFS4It5aBcXz/WX56xBeEML7Dx97zgGWjKtufPIoWrv8mxdp7PKiPPJVH8Zf9nsglFjJhosB8FYZF5LD6MfbefelJGzh8gGKNAZE4QHxVET6dlqGq6nkaR2dDuX/42n3kMX3bXkyb09gV74cF8LiDnZqn49FNmkZ5iGJYWaNDPEL4h80pZ3BUTToxPxkQbVwlsiX8YXJNNRMu/VY6nUyo4wTnk/YR88mCwWuVyDjh7IfsKRm9zNagWH6Res/bmqOySHFZpep24nqn2Zr2Q==;
	5:9k0ICptMIC2GQ9aMCr5KcJSKYxf86Z4wPRgvs1FHvt6chbqVWtcwxYFjtCmzmDhs3CyZCM7MFWKv6ZJpxFA6y6SHvZ8yBezGS/Q+PiDo2tOIqmySESBtxsSMFs5T46cSAp296X2S8R8RgRcGPPd86bCKGeCdQrPEFZqRIoLpTlo=;
	7:zVLuOolN8ZZrYBv7WSbhTogrbLbAeqOXSKHJVDwHEYCBp7p6QeK6n0KkRwXp/lHIkJ5GxsnVN22nw6jbh3NTcpTdIBiy47J4jS6VlbkJWP09Q5Lw5asMpT+PAg53mAzwjsYVJpST7JWYpsOfDgkf7g==
x-ms-office365-filtering-correlation-id: 12113003-a87a-4d2a-97ca-08d64bda0a4f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5036; 
x-ms-traffictypediagnostic: DM6PR01MB5036:
x-microsoft-antispam-prvs: <DM6PR01MB503674CDFD8DE3A243332F828ADD0@DM6PR01MB5036.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231415)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5036; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5036; 
x-forefront-prvs: 0858FF8026
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(39830400003)(396003)(346002)(136003)(376002)(199004)(189003)(25786009)(4326008)(486006)(68736007)(54906003)(105586002)(476003)(7736002)(5660300001)(33896004)(76176011)(97736004)(52116002)(316002)(26005)(102836004)(99286004)(14444005)(7416002)(478600001)(39060400002)(86362001)(305945005)(256004)(386003)(14454004)(33656002)(6506007)(6486002)(53546011)(81166006)(6916009)(9686003)(71200400001)(71190400001)(53936002)(2900100001)(81156014)(6512007)(6116002)(186003)(229853002)(66066001)(106356001)(1076002)(446003)(8676002)(11346002)(6436002)(2906002)(6246003)(8936002)(3846002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5036;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: wNgFWP2IOgoK6OYG+DoYimQRU6QMKiQwz5a0aZ5oA0wyIXECPCB7Gnqgfh3mwvGr3EDakvPh+hw0xbuYIKAC/5TGXOj4PHo4nHeJePlMctd/owWXt/Jq3HMRZ62jM8MM5wqrMhjGx0yEu7BlhB/EkwcGSfbNt0vH6RIpWCTxUHnl5SQXp7dVrhHPmjnacY5R2Y0bP38BMpOc2HZ3iwjLcv9RDxeNeO0Ha1mr5VS2uPIaJaZnqdQcNHSSatm0yQCXGKb9HGpByrcBwhZ7+2gplMfCTloFR2/Mb2i/cR3I5qulUm3pTv/Hk9XZqS+6W/VQMT0TxH26hMcSqefK57cC187YY9fXk20Kzk+IpuIKDLQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EA7FBDFA7212B7449D0E61BA66CEF3C0@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12113003-a87a-4d2a-97ca-08d64bda0a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2018 15:41:57.1821 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.77.100
Subject: Re: [Qemu-arm] [PATCH v7 02/12] target/arm: Reorganize PMCCNTR
 accesses
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qFmvhdyaubp1

On Nov 16 14:50, Peter Maydell wrote:
> On 5 November 2018 at 18:51, Aaron Lindsay <aaron@os.amperecomputing.com>=
 wrote:
> > pmccntr_read and pmccntr_write contained duplicate code that was alread=
y
> > being handled by pmccntr_sync. Consolidate the duplicated code into two
> > functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
> > c15_ccnt in CPUARMState so that we can simultaneously save both the
> > architectural register value and the last underlying cycle count - this
> > ensures time isn't lost and will also allow us to access the 'old'
> > architectural register value in order to detect overflows in later
> > patches.
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
>=20
>=20
> >  /**
> > - * pmccntr_sync
> > + * pmccntr_op_start/finish
> > + * @env: CPUARMState
> > + *
> > + * Convert the counter in the PMCCNTR between its delta form (the typi=
cal mode
> > + * when it's enabled) and the guest-visible value. These two calls mus=
t always
> > + * surround any action which might affect the counter.
> > + */
> > +void pmccntr_op_start(CPUARMState *env);
> > +void pmccntr_op_finish(CPUARMState *env);
> > +
> > +/**
> > + * pmu_op_start/finish
> >   * @env: CPUARMState
> >   *
> > - * Synchronises the counter in the PMCCNTR. This must always be called=
 twice,
> > - * once before any action that might affect the timer and again afterw=
ards.
> > - * The function is used to swap the state of the register if required.
> > - * This only happens when not in user mode (!CONFIG_USER_ONLY)
> > + * Convert all PMU counters between their delta form (the typical mode=
 when
> > + * they are enabled) and the guest-visible values. These two calls mus=
t
> > + * surround any action which might affect the counters, and the return=
 value
> > + * from pmu_op_start must be supplied as the second argument to pmu_op=
_finish.
> >   */
> > -void pmccntr_sync(CPUARMState *env);
> > +void pmu_op_start(CPUARMState *env);
> > +void pmu_op_finish(CPUARMState *env);
>=20
> The comment says that pmu_op_start returns a value and pmu_op_finish
> has a second argument, but the prototypes disagree...

Doh, I updated the comment for pmccntr_op_* but missed pmu_op_*. The
last sentence should end after the comma:

> > + * Convert all PMU counters between their delta form (the typical mode=
 when
> > + * they are enabled) and the guest-visible values. These two calls mus=
t
> > + * surround any action which might affect the counters.
> >   */

> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> so if this turns out to be the only problem I can fix it up when
> I apply it to my tree, if you provide suitable new comment text.

I've also updated the comment text in my tree, so if/when there is a v8
of this patchset, it won't be lost.

-Aaron
