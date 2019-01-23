Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1098500wrt;
        Wed, 23 Jan 2019 12:03:22 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7pcC2/pvwzQkeAx08miGDlj827BLUblOJQp8Jh8QzH0RKi+xgN9TyiUZNu1ezPe9nxc94u
X-Received: by 2002:adf:9d08:: with SMTP id k8mr4416946wre.203.1548273802360;
        Wed, 23 Jan 2019 12:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548273802; cv=none;
        d=google.com; s=arc-20160816;
        b=0z0X5jkcvvbEKGEnYRkHr784gR5an968DfNyJQyEjxPF39DlOWDIQT49lF2+bcAubE
         cYQx5YcOYNY+jm0AyEyjmaP+pZrfIN98N8/W01mILEXlqBCEJ0YVy9b2v9UOapSjq+so
         K+zEOcqLXV6bfGSlX7MyA8EWZNDT0j549AMhmKFdQo35S1kPd8NxcJeSXSx1Y7XoM1c5
         Rtg5rLA7Bc6sz4joN1Z3v9R4VqI5TsTgUAukqhUlKMhEnWJM2fvAZUZGEOV7lfMQgQh9
         LKNYLukdlE1cdpB540icM03HeQHEne2TS5Lu2Fmk7/cBeTC19vje2bueXXFqwcmkquvY
         9/DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature;
        bh=md8yN09mreSAhprAyFKdmf4eTI2cw1Em7gYuSND9oDo=;
        b=yzqtVQ+68XguUMIiJzf/sSQYHYAyBTJbRuuGr9iP5Z48lNGZvOx/jnaRgbcYInSlLT
         HUY/uEUmRlIUGHZELS9lsqUF4lmF17FglSoZxwsqHigXv1lrM6sS8EVlPmF1mvzzrVHP
         leBEUNgIkiFX0EXDUbOr5PiqeICO2rsLd9PEnaMysjLTLJLWI/Rc5/IURDfNB8ESZBXn
         4pBODZWDdctACpPFuY/Oh/HZCsQpP7b6l46wbPxYBt9BynSmrG6AnwtKAPD8OmzJ5gC6
         OBfEhdQw3J71GJocu9kuRlWhkked741fCJUyhRehK32exbP4NEvDXPbRxXAQSn5zodJS
         gwFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="FJeMbb/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y131si37145238wmd.163.2019.01.23.12.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 12:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="FJeMbb/S";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:40935 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmOk4-0007H6-7G
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 15:03:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmOje-00079o-DY
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 15:02:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmOgc-0004Tl-HR
	for qemu-arm@nongnu.org; Wed, 23 Jan 2019 14:59:47 -0500
Received: from mail-eopbgr800125.outbound.protection.outlook.com
	([40.107.80.125]:61120
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gmOga-0004PS-HL; Wed, 23 Jan 2019 14:59:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=md8yN09mreSAhprAyFKdmf4eTI2cw1Em7gYuSND9oDo=;
	b=FJeMbb/SitfwZ+rq38CllYuINimeFuin6JceQixK+zs2Zt0Ml5HuMspWc7Z42C9LJNEboLJ56u9r7yNoobBTlbgRKYcX2XouuMYTf1m3AwIgtx56UXab/5fA9bxr+5szbqVQzfGIRQWuTsvMV0KgtxdEfKDgSaDDXLysA/F4EDg=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5034.prod.exchangelabs.com (20.176.120.218) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.26; Wed, 23 Jan 2019 19:59:36 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1558.016;
	Wed, 23 Jan 2019 19:59:36 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH] target/arm: Don't clear supported PMU events when
	initializing PMCEID1
Thread-Index: AQHUs1Yq7R34PkeQFUa1wl27sGQrPg==
Date: Wed, 23 Jan 2019 19:59:36 +0000
Message-ID: <20190123195814.29253-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY1PR07CA0033.namprd07.prod.outlook.com
	(2a01:111:e400:c60a::43) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5034;
	6:LBhFGl8zz0SBzGYUU2X9IU19n65Ip1EwlGl4UtQHgk4DQJwuLcxVQDTMd6gcGrb4YaRTY2E22l+Jp2VGChR06wxrapkIw59eXVkUJvYJpd831SGHZDZJrf+3pBeGzRpht1dMjYxiaBWKP8ur57SnWFNPPMf51pczBdaoDKnA5FkqzLvWg1AkrmlEWNSTJPt9gFpTGFaieVAXBLzczvVIEN7ge5xjmwHd+rEvQ6Fc3o541zwmcbfYmkkX+v51S+MWPuzaxDqpQGkiiOOvdb3FsJrF3LO1P2B5kz1C69tMWEb/NYIvJB1UySOkEq0IsH/6Ajm7DMF/lCPO7eEdn1kEvynXFUfwobzox0FWjG0o7BvC+FvbU/uSzfbb9lKzk7klHVg2/O7r9UaGtwd6mdf1/mDESxORDyvih9O/fbJW4LP4IImxOxBZWQ7yBkEULEHSGEKa3/cRhq3VwVjzs/O7vA==;
	5:p2IMiwQcah+xgJjUsDUyRcRPfWPpqBNUuvAOsrY1/e6UOwZd8aLr9XcjdsyJD+8RTHP3iZIBMTubIm+prwdoFGvDD/Zv7vLg4ZPy/MG0htqIQVTVJfDY2aXwEXonP7qSyleFJDb9c6Hw0+4+kI38PNg7jz2HVG3Ph1XBeQe8XmuYoe8ntY4aNJ6xuJPqOMWbNnPhfEH8Slgbz0pohtJSXw==;
	7:wKJVNmLa6XhDk9WTH3jQsgLBAUEXZnmLXY/iRcBilNZKnUO7fCphsPTY3bKLoL5ek27njcQm6SlvJj4ivfw2ofq8zGPprkTQMvg0Ij6CId/8oDCVWyM9JRTPis3eDmGig0crcaeWbOM+eeSyMpumJA==
x-ms-office365-filtering-correlation-id: df7f4fb7-deb9-4d43-b3c8-08d6816d4cac
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5034; 
x-ms-traffictypediagnostic: DM6PR01MB5034:
x-microsoft-antispam-prvs: <DM6PR01MB503445AD20C6FD504F9925CA8A990@DM6PR01MB5034.prod.exchangelabs.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(366004)(136003)(39840400004)(396003)(376002)(199004)(189003)(6486002)(186003)(478600001)(6436002)(110136005)(102836004)(316002)(2501003)(54906003)(7736002)(99286004)(2616005)(486006)(305945005)(476003)(86362001)(52116002)(6512007)(26005)(39060400002)(107886003)(25786009)(97736004)(3846002)(81166006)(14454004)(6116002)(106356001)(2906002)(71190400001)(71200400001)(4326008)(68736007)(8676002)(1076003)(81156014)(66066001)(6506007)(386003)(8936002)(256004)(50226002)(53936002)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5034;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2gfZr5MQ9AfXbndld5Y4Kspu9L173y7s3MfCPtspKRxjcQr90k9myxjb9Nry77tg20GrO0W/1m8PiATfnptSM4+jL2arjNB6fPsoQK4ZESPeOkK6asP4SrA18eBGqJGXdK33Dyjn+DslB18784UYehtkVYS731WHZ6wayXB/cmKdm2KMnABBzfm29+wbCpILFWPWMkzB8LZFeUCvYCWXPS7Ixa9W/2Mx6pj6sa5TxA5+vQQhK3gliA2TnxYnlnVeAalAPaIMKaELJIscYptPVEcvbnR4PPT6UTYjUABu7Rcunzwf5UlhPKdGaP1JbfdmqGvr+aP6atpC3AE8ktUfPPJbF0HXKdMaRtTCsyMMv5+zP1OOdu+dJemVsPKcM1uguYk/SMi46ioSmmnjjmZU6GoYZiCZw7vOApv5frTuxDo=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df7f4fb7-deb9-4d43-b3c8-08d6816d4cac
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 19:59:34.7892 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.80.125
Subject: [Qemu-arm] [PATCH] target/arm: Don't clear supported PMU events
 when initializing PMCEID1
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
Cc: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jk6Jvc7rP5KH

A bug was introduced during a respin of:

	commit 57a4a11b2b281bb548b419ca81bfafb214e4c77a
	target/arm: Add array for supported PMU events, generate PMCEID[01]_EL0

This patch introduced two calls to get_pmceid() during CPU
initialization - one each for PMCEID0 and PMCEID1. In addition to
building the register values, get_pmceid() clears an internal array
mapping event numbers to their implementations (supported_event_map)
before rebuilding it. This is an optimization since much of the logic is
shared. However, since it was called twice, the contents of
supported_event_map reflect only the events in PMCEID1 (the second call
to get_pmceid()).

Fix this bug by moving the initialization of PMCEID0 and PMCEID1 back
into a single function call, and name it more appropriately since it is
doing more than simply generating the contents of the PMCEID[01]
registers.

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/cpu.c    |  3 +--
 target/arm/cpu.h    | 11 +++++------
 target/arm/helper.c | 27 ++++++++++++++++-----------
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7e1f3dd637..d6da3f4fed 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1039,8 +1039,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error=
 **errp)
         unset_feature(env, ARM_FEATURE_PMU);
     }
     if (arm_feature(env, ARM_FEATURE_PMU)) {
-        cpu->pmceid0 =3D get_pmceid(&cpu->env, 0);
-        cpu->pmceid1 =3D get_pmceid(&cpu->env, 1);
+        pmu_init(cpu);
=20
         if (!kvm_enabled()) {
             arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ff81db420d..b8161cb6d7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1012,14 +1012,13 @@ void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
 void pmu_post_el_change(ARMCPU *cpu, void *ignored);
=20
 /*
- * get_pmceid
- * @env: CPUARMState
- * @which: which PMCEID register to return (0 or 1)
+ * pmu_init
+ * @cpu: ARMCPU
  *
- * Return the PMCEID[01]_EL0 register values corresponding to the counters
- * which are supported given the current configuration
+ * Initialize the CPU's PMCEID[01]_EL0 registers and associated internal s=
tate
+ * for the current configuration
  */
-uint64_t get_pmceid(CPUARMState *env, unsigned which);
+void pmu_init(ARMCPU *cpu);
=20
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 92666e5208..31273fb8de 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1090,22 +1090,24 @@ static const pm_event pm_events[] =3D {
 static uint16_t supported_event_map[MAX_EVENT_ID + 1];
=20
 /*
- * Called upon initialization to build PMCEID0_EL0 or PMCEID1_EL0 (indicat=
ed by
- * 'which'). We also use it to build a map of ARM event numbers to indices=
 in
- * our pm_events array.
+ * Called upon CPU initialization to initialize PMCEID[01]_EL0 and build a=
 map
+ * of ARM event numbers to indices in our pm_events array.
  *
  * Note: Events in the 0x40XX range are not currently supported.
  */
-uint64_t get_pmceid(CPUARMState *env, unsigned which)
+void pmu_init(ARMCPU *cpu)
 {
-    uint64_t pmceid =3D 0;
     unsigned int i;
=20
-    assert(which <=3D 1);
-
+    /*
+     * Empty supported_event_map and cpu->pmceid[01] before adding support=
ed
+     * events to them
+     */
     for (i =3D 0; i < ARRAY_SIZE(supported_event_map); i++) {
         supported_event_map[i] =3D UNSUPPORTED_EVENT;
     }
+    cpu->pmceid0 =3D 0;
+    cpu->pmceid1 =3D 0;
=20
     for (i =3D 0; i < ARRAY_SIZE(pm_events); i++) {
         const pm_event *cnt =3D &pm_events[i];
@@ -1113,13 +1115,16 @@ uint64_t get_pmceid(CPUARMState *env, unsigned whic=
h)
         /* We do not currently support events in the 0x40xx range */
         assert(cnt->number <=3D 0x3f);
=20
-        if ((cnt->number & 0x20) =3D=3D (which << 6) &&
-                cnt->supported(env)) {
-            pmceid |=3D (1 << (cnt->number & 0x1f));
+        if (cnt->supported(&cpu->env)) {
             supported_event_map[cnt->number] =3D i;
+            uint64_t event_mask =3D 1 << (cnt->number & 0x1f);
+            if (cnt->number & 0x20) {
+                cpu->pmceid1 |=3D event_mask;
+            } else {
+                cpu->pmceid0 |=3D event_mask;
+            }
         }
     }
-    return pmceid;
 }
=20
 /*
--=20
2.20.1

