Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2947543wro;
        Mon, 5 Nov 2018 10:57:15 -0800 (PST)
X-Google-Smtp-Source: AJdET5fVbT6lKjHkXMEL+bVtdBg+P7RdtP+w+VyunjEhKYfB4ITpnYX6D4kjzDVOmcPZO5vt1euC
X-Received: by 2002:a0c:9471:: with SMTP id i46mr22628235qvi.120.1541444235552;
        Mon, 05 Nov 2018 10:57:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541444235; cv=none;
        d=google.com; s=arc-20160816;
        b=SHqLUasA19AVpO94PMNxiJaP6SYqUmYvGktGZ08SEyMXuSrpH4Xo2piTJ5I/gdWM8Y
         VKhhWflliSK1g2hb3C69sb2GEKwyN2UWma0LxcZ5qJ3uXDVMflMtr7Si6rSPbZqTOSNz
         yUPXMnlpJM1SLqXZNz1bSp346X44oDITA4iJwBT8741P3HqReuLEIcxtzhE7nm9uCfqJ
         Shl3b7JMOp0NzdDnpL1SJqWaFloZbJI35nURUMSqEEOTgMdb97zsvVlCbE2gzGSNZ5C2
         cU/c9p8w1JceMjZBwJOV+EFVnUdyhSY6fPkA9RPSdLCk0RdfAlbwE0hfL82+GF+9r0OP
         RH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=H2D6sw7M1tf0FGlfciFc1U7nQt5fwH39+wFUtf8S6oA=;
        b=E3B3FtfJGmalQjGZNFmBmt0AhYd4ioqgGBlk5CKhm0uszMidX58PTuz/+xv1dMI2tx
         sJNkugJzGpmzC/7CZ89QneAwvTiqkf56DpwKFRVIk/8a6BCXXzvxoytzd5/9zue6IStB
         zqbAMvpj2GgWKSiqLuRy8V6/Wa1Kg9AEa4gwcF6MTvZNOvz243USXeDDA1SfwkEwF8iK
         WYF0RU7RDgjQ8xnTUFkroq+jcywkBqIXAa+Nz6xWb2fgpe4zuPjBJiVv6viLrnQM+bmC
         sN4VLrlwWLodBpyKyslmkg6ICOPmmaSeQXXTWOeIGu8EmsDJp0cD9qKhf5FJY5ir9x4G
         uFSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=idjQ1iS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b72si5045661qkh.258.2018.11.05.10.57.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:57:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=idjQ1iS+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJk3n-0002W8-2G
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:57:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyu-0004hk-OZ
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyp-0000Zv-0L
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:10 -0500
Received: from mail-cys01nam02on0099.outbound.protection.outlook.com
	([104.47.37.99]:43926
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjyn-0000UT-Er; Mon, 05 Nov 2018 13:52:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=H2D6sw7M1tf0FGlfciFc1U7nQt5fwH39+wFUtf8S6oA=;
	b=idjQ1iS+WtptdTHmYn7RmYN8eSa7qM3JyfbYNVDRuoyj9XB03szKm5vCj8JbV3O+6Ha4McV3BSuJXGBjn3osDGq0V7DBRV32jG399T9Nzvsq6APNFWYegP3tZGDeJSNtkZjeBWdYWbLEBwr9vOgQbjzkr9HK3Q2IEPVU/CQ/LD4=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5194.prod.exchangelabs.com (20.176.122.31) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Mon, 5 Nov 2018 18:51:59 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:51:59 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 08/12] target/arm: Finish implementation of
	PM[X]EVCNTR and PM[X]EVTYPER
Thread-Index: AQHUdTihBOOM77DBnUa0vIMauKNftw==
Date: Mon, 5 Nov 2018 18:51:58 +0000
Message-ID: <20181105185046.2802-9-aaron@os.amperecomputing.com>
References: <20181105185046.2802-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181105185046.2802-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR20CA0070.namprd20.prod.outlook.com
	(2603:10b6:404:151::32) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5194;
	6:RqxiA0CoF6o0S4YUH8mAU5oyYRKYR50AcO5yp9LOBkwvabVqP0ktvEjmPVaclG0iCrG5i3rDMlVzgP+Idl1BZ9sXWTwo5zNMCdusSYS+LcUV6fZuKKIM9OeclITUheojloLTm09KXJlckMzB40Pr4r/6NeGt1yaKknkU9VHX5Reb7ZTSRHz5HFg2qYEMsyT05RbaiiFieAexpMIqNpMjkLpnZg9NmDeJ4LUPQ1kiSb/qAmO0/RGwEGhzpDrgP+iKKDprDE+76UJKMNvpGrLSJyPc1aHjgoJPh9MQzobcpk024sJZF0XrsjAdyzg+I16cwvFtq7I05RDrFeMLTW0D3PqfGw7WH7HgeUn6JE9OuXxQhISfYZnNGX2CcUHALQ1VBj4RMj1ePpbdLmWt5sDSH1NrPIZxgnGyX1n6Jhea3TsnwsW6JVWqorU4e/5jGRf9rDZz1T9/CQWjdZyfplke5A==;
	5:Wngu6fnUB0qmpPw/7MZNDAMw230K9xW0V/2lfSkvnX67Wdxf5QNZCEHk4ejQmPjMwEfsPHRC1MNw7UnjioHYsu47hpk7fuqpEM3AAHF4Wdr+RL+BUYCsSVq9mPnonTIQUmap5qvoKXsTyc+suTIKWaiGdLRe1pDt4KhWRLYfm6w=;
	7:e/vE5icGyOYQAvmfPObC66WQSW5sY1+1O5qNXNzbF7/J6bxyAPmWhl8k2/WABcrU8s/m12+h1IyzuRBI9HdAfmb4juDrHML99VTvcfy8k/FoV9bRMomHPn1ZIUUF2qQv47Mz7hD1SBoW4J112p3+WA==
x-ms-office365-filtering-correlation-id: a6053a07-a7fc-4a53-4575-08d6434fc3eb
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5194; 
x-ms-traffictypediagnostic: DM6PR01MB5194:
x-microsoft-antispam-prvs: <DM6PR01MB519433F9A1F32130D6E9EEAB8ACA0@DM6PR01MB5194.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(163750095850);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5194; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5194; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(346002)(136003)(39840400004)(376002)(366004)(189003)(199004)(81166006)(81156014)(53936002)(53946003)(66066001)(6436002)(486006)(6486002)(6116002)(14444005)(110136005)(256004)(25786009)(4326008)(54906003)(14454004)(7736002)(305945005)(106356001)(26005)(105586002)(186003)(97736004)(39060400002)(102836004)(8936002)(2900100001)(2501003)(386003)(6506007)(8676002)(7416002)(476003)(316002)(52116002)(6512007)(2616005)(99286004)(76176011)(5660300001)(2906002)(86362001)(68736007)(71200400001)(71190400001)(3846002)(478600001)(4744004)(446003)(1076002)(11346002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5194;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: GB9RVSZucNkrzavHQBiUdsYG3+QcKMC4ToO/Mkf38LspIXq/CDsM+RMZ2yVDoSQKhq4K39Y4K714trLybaFD9lrTGcJo+RO/RX5qhKPfpzJqVwzB//7x7RG3be50nbDLXNFZa4yuL5OraFrnIwniF921t5ocrHQ6eo8TRF3BBV1Noe0wwXqetYXVgR7hZAPUD4wDyMTUa+bGHZomh8ol8RuSzy6OgiiOjobv/MJln+iFGn9m4aIhzWWMtdOWGnv459BewEt92ODAxQQD0GXBm5P0apjTY8cSRe2rMEiJXjZEi2Jq5Yxba8iZMTzhiaIBOlsumW+qhEV9JNDxuJQIg+DjxYLmDzR2f5tdNwyiScs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6053a07-a7fc-4a53-4575-08d6434fc3eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:51:58.9618 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5194
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.99
Subject: [Qemu-arm] [PATCH v7 08/12] target/arm: Finish implementation of
 PM[X]EVCNTR and PM[X]EVTYPER
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
	Aaron Lindsay <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KL2CE2ysWTk9

Add arrays to hold the registers, the definitions themselves, access
functions, and logic to reset counters when PMCR.P is set. Update
filtering code to support counters other than PMCCNTR. Support migration
with raw read/write functions.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |   3 +
 target/arm/helper.c | 296 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 282 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f991ff370e..067f6efdb6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -482,6 +482,9 @@ typedef struct CPUARMState {
          * pmccntr_op_finish.
          */
         uint64_t c15_ccnt_delta;
+        uint64_t c14_pmevcntr[31];
+        uint64_t c14_pmevcntr_delta[31];
+        uint64_t c14_pmevtyper[31];
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register =
*/
diff --git a/target/arm/helper.c b/target/arm/helper.c
index b9d8441497..b7297d72a8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -979,6 +979,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] =3D {
 #define PMCRDP  0x10
 #define PMCRD   0x8
 #define PMCRC   0x4
+#define PMCRP   0x2
 #define PMCRE   0x1
=20
 #define PMXEVTYPER_P          0x80000000
@@ -1051,6 +1052,17 @@ uint64_t get_pmceid(CPUARMState *env)
     return pmceid;
 }
=20
+/*
+ * Check at runtime whether a PMU event is supported for the current machi=
ne
+ */
+static bool event_supported(uint16_t number)
+{
+    if (number > MAX_EVENT_ID) {
+        return false;
+    }
+    return supported_event_map[number] !=3D UNSUPPORTED_EVENT;
+}
+
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *r=
i,
                                    bool isread)
 {
@@ -1170,9 +1182,11 @@ static bool pmu_counter_enabled(CPUARMState *env, ui=
nt8_t counter)
         prohibited =3D env->cp15.c9_pmcr & PMCRDP;
     }
=20
-    /* TODO Remove assert, set filter to correct PMEVTYPER */
-    assert(counter =3D=3D 31);
-    filter =3D env->cp15.pmccfiltr_el0;
+    if (counter =3D=3D 31) {
+        filter =3D env->cp15.pmccfiltr_el0;
+    } else {
+        filter =3D env->cp15.c14_pmevtyper[counter];
+    }
=20
     p   =3D filter & PMXEVTYPER_P;
     u   =3D filter & PMXEVTYPER_U;
@@ -1192,6 +1206,17 @@ static bool pmu_counter_enabled(CPUARMState *env, ui=
nt8_t counter)
         filtered =3D m !=3D p;
     }
=20
+    if (counter !=3D 31) {
+        /*
+         * If not checking PMCCNTR, ensure the counter is setup to an even=
t we
+         * support
+         */
+        uint16_t event =3D filter & PMXEVTYPER_EVTCOUNT;
+        if (!event_supported(event)) {
+            return false;
+        }
+    }
+
     return enabled && !prohibited && !filtered;
 }
=20
@@ -1238,14 +1263,47 @@ void pmccntr_op_finish(CPUARMState *env)
     }
 }
=20
+static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
+{
+
+    uint16_t event =3D env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_EVTCO=
UNT;
+    uint64_t count =3D 0;
+    if (event_supported(event)) {
+        uint16_t event_idx =3D supported_event_map[event];
+        count =3D pm_events[event_idx].get_count(env);
+    }
+
+    if (pmu_counter_enabled(env, counter)) {
+        env->cp15.c14_pmevcntr[counter] =3D
+            count - env->cp15.c14_pmevcntr_delta[counter];
+    }
+    env->cp15.c14_pmevcntr_delta[counter] =3D count;
+}
+
+static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
+{
+    if (pmu_counter_enabled(env, counter)) {
+        env->cp15.c14_pmevcntr_delta[counter] -=3D
+            env->cp15.c14_pmevcntr[counter];
+    }
+}
+
 void pmu_op_start(CPUARMState *env)
 {
+    unsigned int i;
     pmccntr_op_start(env);
+    for (i =3D 0; i < pmu_num_counters(env); i++) {
+        pmevcntr_op_start(env, i);
+    }
 }
=20
 void pmu_op_finish(CPUARMState *env)
 {
+    unsigned int i;
     pmccntr_op_finish(env);
+    for (i =3D 0; i < pmu_num_counters(env); i++) {
+        pmevcntr_op_finish(env, i);
+    }
 }
=20
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
@@ -1268,6 +1326,13 @@ static void pmcr_write(CPUARMState *env, const ARMCP=
RegInfo *ri,
         env->cp15.c15_ccnt =3D 0;
     }
=20
+    if (value & PMCRP) {
+        unsigned int i;
+        for (i =3D 0; i < pmu_num_counters(env); i++) {
+            env->cp15.c14_pmevcntr[i] =3D 0;
+        }
+    }
+
     /* only the DP, X, D and E bits are writable */
     env->cp15.c9_pmcr &=3D ~0x39;
     env->cp15.c9_pmcr |=3D (value & 0x39);
@@ -1321,6 +1386,14 @@ void pmccntr_op_finish(CPUARMState *env)
 {
 }
=20
+void pmevcntr_op_start(CPUARMState *env, uint8_t i)
+{
+}
+
+void pmevcntr_op_finish(CPUARMState *env, uint8_t i)
+{
+}
+
 void pmu_op_start(CPUARMState *env)
 {
 }
@@ -1391,30 +1464,174 @@ static void pmovsset_write(CPUARMState *env, const=
 ARMCPRegInfo *ri,
     env->cp15.c9_pmovsr |=3D value;
 }
=20
-static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value)
+static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value, const uint8_t counter)
 {
+    if (counter =3D=3D 31) {
+        pmccfiltr_write(env, ri, value);
+    } else if (counter < pmu_num_counters(env)) {
+        pmevcntr_op_start(env, counter);
+
+        /*
+         * If this counter's event type is changing, store the current
+         * underlying count for the new type in c14_pmevcntr_delta[counter=
] so
+         * pmevcntr_op_finish has the correct baseline when it converts ba=
ck to
+         * a delta.
+         */
+        uint16_t old_event =3D env->cp15.c14_pmevtyper[counter] &
+            PMXEVTYPER_EVTCOUNT;
+        uint16_t new_event =3D value & PMXEVTYPER_EVTCOUNT;
+        if (old_event !=3D new_event) {
+            uint64_t count =3D 0;
+            if (event_supported(new_event)) {
+                uint16_t event_idx =3D supported_event_map[new_event];
+                count =3D pm_events[event_idx].get_count(env);
+            }
+            env->cp15.c14_pmevcntr_delta[counter] =3D count;
+        }
+
+        env->cp15.c14_pmevtyper[counter] =3D value & PMXEVTYPER_MASK;
+        pmevcntr_op_finish(env, counter);
+    }
     /* Attempts to access PMXEVTYPER are CONSTRAINED UNPREDICTABLE when
      * PMSELR value is equal to or greater than the number of implemented
      * counters, but not equal to 0x1f. We opt to behave as a RAZ/WI.
      */
-    if (env->cp15.c9_pmselr =3D=3D 0x1f) {
-        pmccfiltr_write(env, ri, value);
+}
+
+static uint64_t pmevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri,
+                               const uint8_t counter)
+{
+    if (counter =3D=3D 31) {
+        return env->cp15.pmccfiltr_el0;
+    } else if (counter < pmu_num_counters(env)) {
+        return env->cp15.c14_pmevtyper[counter];
+    } else {
+      /*
+       * We opt to behave as a RAZ/WI when attempts to access PMXEVTYPER
+       * are CONSTRAINED UNPREDICTABLE. See comments in pmevtyper_write().
+       */
+        return 0;
     }
 }
=20
+static void pmevtyper_writefn(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    uint8_t counter =3D ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    pmevtyper_write(env, ri, value, counter);
+}
+
+static void pmevtyper_rawwrite(CPUARMState *env, const ARMCPRegInfo *ri,
+                               uint64_t value)
+{
+    uint8_t counter =3D ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    env->cp15.c14_pmevtyper[counter] =3D value;
+
+    /*
+     * pmevtyper_rawwrite is called between a pair of pmu_op_start and
+     * pmu_op_finish calls when loading saved state for a migration. Becau=
se
+     * we're potentially updating the type of event here, the value writte=
n to
+     * c14_pmevcntr_delta by the preceeding pmu_op_start call may be for a
+     * different counter type. Therefore, we need to set this value to the
+     * current count for the counter type we're writing so that pmu_op_fin=
ish
+     * has the correct count for its calculation.
+     */
+    uint16_t event =3D value & PMXEVTYPER_EVTCOUNT;
+    if (event_supported(event)) {
+        uint16_t event_idx =3D supported_event_map[event];
+        env->cp15.c14_pmevcntr_delta[counter] =3D
+            pm_events[event_idx].get_count(env);
+    }
+}
+
+static uint64_t pmevtyper_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter =3D ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    return pmevtyper_read(env, ri, counter);
+}
+
+static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    pmevtyper_write(env, ri, value, env->cp15.c9_pmselr & 31);
+}
+
 static uint64_t pmxevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    /* We opt to behave as a RAZ/WI when attempts to access PMXEVTYPER
-     * are CONSTRAINED UNPREDICTABLE. See comments in pmxevtyper_write().
+    return pmevtyper_read(env, ri, env->cp15.c9_pmselr & 31);
+}
+
+static void pmevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value, uint8_t counter)
+{
+    if (counter < pmu_num_counters(env)) {
+        pmevcntr_op_start(env, counter);
+        env->cp15.c14_pmevcntr[counter] =3D value;
+        pmevcntr_op_finish(env, counter);
+    }
+    /*
+     * We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
+     * are CONSTRAINED UNPREDICTABLE.
      */
-    if (env->cp15.c9_pmselr =3D=3D 0x1f) {
-        return env->cp15.pmccfiltr_el0;
+}
+
+static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint8_t counter)
+{
+    if (counter < pmu_num_counters(env)) {
+        uint64_t ret;
+        pmevcntr_op_start(env, counter);
+        ret =3D env->cp15.c14_pmevcntr[counter];
+        pmevcntr_op_finish(env, counter);
+        return ret;
     } else {
+      /* We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
+       * are CONSTRAINED UNPREDICTABLE. */
         return 0;
     }
 }
=20
+static void pmevcntr_writefn(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    uint8_t counter =3D ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    pmevcntr_write(env, ri, value, counter);
+}
+
+static uint64_t pmevcntr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter =3D ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    return pmevcntr_read(env, ri, counter);
+}
+
+static void pmevcntr_rawwrite(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    uint8_t counter =3D ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    assert(counter < pmu_num_counters(env));
+    env->cp15.c14_pmevcntr[counter] =3D value;
+    pmevcntr_write(env, ri, value, counter);
+}
+
+static uint64_t pmevcntr_rawread(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter =3D ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    assert(counter < pmu_num_counters(env));
+    return env->cp15.c14_pmevcntr[counter];
+}
+
+static void pmxevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    pmevcntr_write(env, ri, value, env->cp15.c9_pmselr & 31);
+}
+
+static uint64_t pmxevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return pmevcntr_read(env, ri, env->cp15.c9_pmselr & 31);
+}
+
 static void pmuserenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1618,16 +1835,23 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .fieldoffset =3D offsetof(CPUARMState, cp15.pmccfiltr_el0),
       .resetvalue =3D 0, },
     { .name =3D "PMXEVTYPER", .cp =3D 15, .crn =3D 9, .crm =3D 13, .opc1 =
=3D 0, .opc2 =3D 1,
-      .access =3D PL0_RW, .type =3D ARM_CP_NO_RAW, .accessfn =3D pmreg_acc=
ess,
+      .access =3D PL0_RW, .type =3D ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn =3D pmreg_access,
       .writefn =3D pmxevtyper_write, .readfn =3D pmxevtyper_read },
     { .name =3D "PMXEVTYPER_EL0", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 13, .opc2 =3D 1,
-      .access =3D PL0_RW, .type =3D ARM_CP_NO_RAW, .accessfn =3D pmreg_acc=
ess,
+      .access =3D PL0_RW, .type =3D ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn =3D pmreg_access,
       .writefn =3D pmxevtyper_write, .readfn =3D pmxevtyper_read },
-    /* Unimplemented, RAZ/WI. */
     { .name =3D "PMXEVCNTR", .cp =3D 15, .crn =3D 9, .crm =3D 13, .opc1 =
=3D 0, .opc2 =3D 2,
-      .access =3D PL0_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0,
-      .accessfn =3D pmreg_access_xevcntr },
+      .access =3D PL0_RW, .type =3D ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn =3D pmreg_access_xevcntr,
+      .writefn =3D pmxevcntr_write, .readfn =3D pmxevcntr_read },
+    { .name =3D "PMXEVCNTR_EL0", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 13, .opc2 =3D 2,
+      .access =3D PL0_RW, .type =3D ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn =3D pmreg_access_xevcntr,
+      .writefn =3D pmxevcntr_write, .readfn =3D pmxevcntr_read },
     { .name =3D "PMUSERENR", .cp =3D 15, .crn =3D 9, .crm =3D 14, .opc1 =
=3D 0, .opc2 =3D 0,
       .access =3D PL0_R | PL1_RW, .accessfn =3D access_tpm,
       .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmuserenr),
@@ -4435,7 +4659,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
 #endif
     /* The only field of MDCR_EL2 that has a defined architectural reset v=
alue
      * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; but=
 we
-     * don't impelment any PMU event counters, so using zero as a reset
+     * don't implement any PMU event counters, so using zero as a reset
      * value for MDCR_EL2 is okay
      */
     { .name =3D "MDCR_EL2", .state =3D ARM_CP_STATE_BOTH,
@@ -5287,6 +5511,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * field as main ID register, and we implement only the cycle
          * count register.
          */
+        unsigned int i, pmcrn =3D 0;
 #ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr =3D {
             .name =3D "PMCR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =
=3D 0, .opc2 =3D 0,
@@ -5307,6 +5532,43 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         };
         define_one_arm_cp_reg(cpu, &pmcr);
         define_one_arm_cp_reg(cpu, &pmcr64);
+        for (i =3D 0; i < pmcrn; i++) {
+            char *pmevcntr_name =3D g_strdup_printf("PMEVCNTR%d", i);
+            char *pmevcntr_el0_name =3D g_strdup_printf("PMEVCNTR%d_EL0", =
i);
+            char *pmevtyper_name =3D g_strdup_printf("PMEVTYPER%d", i);
+            char *pmevtyper_el0_name =3D g_strdup_printf("PMEVTYPER%d_EL0"=
, i);
+            ARMCPRegInfo pmev_regs[] =3D {
+                { .name =3D pmevcntr_name, .cp =3D 15, .crn =3D 15,
+                  .crm =3D 8 | (3 & (i >> 3)), .opc1 =3D 0, .opc2 =3D i & =
7,
+                  .access =3D PL0_RW, .type =3D ARM_CP_IO | ARM_CP_ALIAS,
+                  .readfn =3D pmevcntr_readfn, .writefn =3D pmevcntr_write=
fn,
+                  .accessfn =3D pmreg_access },
+                { .name =3D pmevcntr_el0_name, .state =3D ARM_CP_STATE_AA6=
4,
+                  .opc0 =3D 3, .opc1 =3D 3, .crn =3D 15, .crm =3D 8 | (3 &=
 (i >> 3)),
+                  .opc2 =3D i & 7, .access =3D PL0_RW, .accessfn =3D pmreg=
_access,
+                  .type =3D ARM_CP_IO,
+                  .readfn =3D pmevcntr_readfn, .writefn =3D pmevcntr_write=
fn,
+                  .raw_readfn =3D pmevcntr_rawread,
+                  .raw_writefn =3D pmevcntr_rawwrite },
+                { .name =3D pmevtyper_name, .cp =3D 15, .crn =3D 15,
+                  .crm =3D 12 | (3 & (i >> 3)), .opc1 =3D 0, .opc2 =3D i &=
 7,
+                  .access =3D PL0_RW, .type =3D ARM_CP_IO | ARM_CP_ALIAS,
+                  .readfn =3D pmevtyper_readfn, .writefn =3D pmevtyper_wri=
tefn,
+                  .accessfn =3D pmreg_access },
+                { .name =3D pmevtyper_el0_name, .state =3D ARM_CP_STATE_AA=
64,
+                  .opc0 =3D 3, .opc1 =3D 3, .crn =3D 15, .crm =3D 12 | (3 =
& (i >> 3)),
+                  .opc2 =3D i & 7, .access =3D PL0_RW, .accessfn =3D pmreg=
_access,
+                  .type =3D ARM_CP_IO,
+                  .readfn =3D pmevtyper_readfn, .writefn =3D pmevtyper_wri=
tefn,
+                  .raw_writefn =3D pmevtyper_rawwrite },
+                REGINFO_SENTINEL
+            };
+            define_arm_cp_regs(cpu, pmev_regs);
+            g_free(pmevcntr_name);
+            g_free(pmevcntr_el0_name);
+            g_free(pmevtyper_name);
+            g_free(pmevtyper_el0_name);
+        }
 #endif
         ARMCPRegInfo clidr =3D {
             .name =3D "CLIDR", .state =3D ARM_CP_STATE_BOTH,
--=20
2.19.1

