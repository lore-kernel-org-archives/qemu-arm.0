Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9398720wrt;
        Wed, 5 Dec 2018 05:47:44 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VDO5mWrw6T0ovR7+Hju53T3p2Bi2MltpMbp3PGJSX+9N+iIq6MPBVUA6xGWIfLxAViZXLT
X-Received: by 2002:aed:33e3:: with SMTP id v90mr23185270qtd.261.1544017664164;
        Wed, 05 Dec 2018 05:47:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017664; cv=none;
        d=google.com; s=arc-20160816;
        b=AbAA4CRk5CgqyN1yLa9ZdlXjc6YvIp687e/mV1wFc0MJ78rCauHPD5VsTrvPo1Fe/S
         BUWv/aUpLfFcRm+0b6kMVdwZA7AK/VYHiFyD5zkpu9ryPAN7QLB7PD4qb4pBGdbUcObP
         e3tXKjzSFtB6erVEdfOEWA9uaFUoImnqrOr2eKyTkiWsjLSYx2npIAdV/3tNl0r3ZI8R
         w4q2C/8hP4ZpvflfuxI5gvpimjYbN3VlGl/Utjly1iQ9hkVdWpr3CLbrRsJW8W90YEu8
         ckCXTWg32Gijg1LNsbL6by8ZdtijKw/WPsSFTrnvk3PwKYpRH0JQW0weQoet4k8ct9su
         DsZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=nodMbJ7VWnHnVarwto99U3wd72a5hx3F/b40CZveEVU=;
        b=JC2oudU6Xqv8pdbAhJO94UcSBDOaR3GGaX+F306bArtAztTnb0zZSrAvTCXSod0s28
         XnNVDxTiWj7HZo36EW56rMjCPdFoL89liue/UgEy3gpRerovDwKZJO961oQh0U+OsHWw
         G0ljTlmwHW1CAmL+Ka3AyxAdV1quRiq5L/VuIrqWWCiLSKtlY0FHCBRWxgmeVQmWPk9R
         7jK7pYBRL0q8xuP0N7dP9Aj3i1zno729I2hVvBxTYaRYDHxEfQujTRmf0bHf3usMxCqU
         r92EdinYE0mVMAvESFlmkQaNoc0WzPwnHH1VWVPHfeRMWv97g1wS0Zv86LRnVrR1O91d
         vxxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=NETxLkmU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o89si3255557qko.41.2018.12.05.05.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:47:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=NETxLkmU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34603 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXWh-0001sD-MF
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:47:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTG-0008C8-Ba
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 08:44:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTD-0005eq-VY
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 08:44:10 -0500
Received: from mail-co1nam04on0716.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::716]:64512
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXT4-0005F5-7l; Wed, 05 Dec 2018 08:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nodMbJ7VWnHnVarwto99U3wd72a5hx3F/b40CZveEVU=;
	b=NETxLkmUEhzAjCBafA3QFnuMIFpJEmlanK7P0mP7IQ3sFWFfCaGZJLkqKuATHbLzu3e40Z0vvtfCbDique33v+hdME6eSiBCaO/WycDyMsqBFzz8l6Cm8s9t3IcdjhBZDExajNOEgj0SZTkGE2AtgTYYW3pYOVzs8VUtyh1Ud2o=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4204.prod.exchangelabs.com (20.176.106.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 5 Dec 2018 13:43:46 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:46 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 10/14] target/arm: Finish implementation of
	PM[X]EVCNTR and PM[X]EVTYPER
Thread-Index: AQHUjKB+r2qOJYrpkE+rmgbvHDyyJQ==
Date: Wed, 5 Dec 2018 13:43:25 +0000
Message-ID: <20181205134243.4791-11-aaron@os.amperecomputing.com>
References: <20181205134243.4791-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181205134243.4791-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR12CA0032.namprd12.prod.outlook.com
	(2603:10b6:405:70::18) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4204;
	6:D2nhtJ5hnVD+6PjFO+cbSAa7dEKfNZINrpwlwFXpy15WSPYDWt9K+3tJIwzeQkXmWo/obyfaEBYnmc84K6yO4EgiQGSFLzJ73UHHoJS3OsB1d7w8b2evJO8qQnWq/zIQSZcxR/bY2/NqPDoBQgBHSpA89OofvmZBtgoY7cgAIbm6ISRV79zf0ncn2HRf1qfvkn/Uo6uJCC0qwQnXhkpEkllXLpYD1bRhKz49LyM9XFS1k7qDORN10l7fg9QrxvXbziWWQJ2/ofmF5P/AB10f4ttLIjKqz9B26Zt339of8wRdoCzqudfoq7b0rtjc3L9OJi8pEYanYesgI7mt93cd7+dvSlr3WSVdXKdyYx+jfKW4uWQcGjtROq4L5MB7ROQWWzQJB7AvoKCU4xWSUs60dTCCAqHazsKnXKGJvZJCnOYRQCPj/kOUdm7lQY2gpAywWSlbc7+o8jFz5IyRsilrfg==;
	5:F5K2LEKvqLki4eHGP19u4npQrlXyrrNXcqXTnB87HxGfhQQMzLHTxrhHb2fQkFCoZELZv2satAE6Gd4GY4O+3Nw5mkNT5d/DFXOtmVmQeuEVZsWTXqm+uXRlu9WH2qqZiWUJnZp/wdEemtxa0Zwtvz3IzGkmrU7oosAdHGP84yw=;
	7:logU8RZS3NaKUP6YjWawlfMkbvc8kZQaJo+p5crG826fYqa0SsOEfF3nF/Yc7Uc247VkjIMuqcvlW1f4N/qJSdhvXM0tIHxAmp0MYYsArXqX8d6mNsNohWlHvGy0874Rg7Om+StvxXoWhenRcj8xgg==
x-ms-office365-filtering-correlation-id: 359bbb87-fac9-4a63-3ce8-08d65ab7a11b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4204; 
x-ms-traffictypediagnostic: DM6PR01MB4204:
x-microsoft-antispam-prvs: <DM6PR01MB420400599BF5CBCF6B38DE9C8AA80@DM6PR01MB4204.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4204; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4204; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(106356001)(54906003)(110136005)(6436002)(4744004)(4326008)(68736007)(7416002)(14454004)(14444005)(256004)(316002)(97736004)(6666004)(105586002)(2906002)(8936002)(486006)(1076002)(53936002)(6116002)(3846002)(8676002)(446003)(11346002)(2616005)(81166006)(86362001)(5660300001)(81156014)(6506007)(25786009)(386003)(476003)(71200400001)(26005)(478600001)(76176011)(102836004)(71190400001)(99286004)(52116002)(6486002)(7736002)(305945005)(66066001)(39060400002)(2501003)(53946003)(6512007)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4204;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: vX3M8oPg9SJmO5/v4IeKO47spMl1zHHvnCEp/VF3jfWZ9bW8Yvav1xQT5V2mV0AAyXVzP2xumL7LnnVuPQl/JpE0uTT25n4Yvi891o7mxNl4+3xsR045hmViE6i4PMO3URfopLynGMOAjeDbC64J75NRKIDe0KNB75lLVRj7zNFq5KyH7byenHQNiTvjegFYA780Vie6SlmcxutDUnTGo7gsJSEMX0iXx3nB/OrpeVXgxAVKcHQUCmTUhG4BWRYsYeGGSpbkFcz0zpRJ2088tl/V8AQ61yNuKrsgoVZISGuPbgy/S6XV8K/XxhfIGBLp13P8yv0J9U92jr1q/PMHMzeLMk6Z80CBYbfaZh0mnCQ=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359bbb87-fac9-4a63-3ce8-08d65ab7a11b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:25.0435 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4204
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::716
Subject: [Qemu-devel] [PATCH v9 10/14] target/arm: Finish implementation of
 PM[X]EVCNTR and PM[X]EVTYPER
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3gqTyByP6N7d

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
index 0255f68bd7..62987111be 100644
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
index b7a1f4c108..c51031d262 100644
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
@@ -1066,6 +1067,17 @@ uint64_t get_pmceid(CPUARMState *env, unsigned which=
)
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
@@ -1185,9 +1197,11 @@ static bool pmu_counter_enabled(CPUARMState *env, ui=
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
@@ -1207,6 +1221,17 @@ static bool pmu_counter_enabled(CPUARMState *env, ui=
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
@@ -1253,14 +1278,47 @@ void pmccntr_op_finish(CPUARMState *env)
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
@@ -1283,6 +1341,13 @@ static void pmcr_write(CPUARMState *env, const ARMCP=
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
@@ -1336,6 +1401,14 @@ void pmccntr_op_finish(CPUARMState *env)
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
@@ -1406,30 +1479,174 @@ static void pmovsset_write(CPUARMState *env, const=
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
@@ -1633,16 +1850,23 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
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
@@ -4429,7 +4653,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] =3D {
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
@@ -5281,6 +5505,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * field as main ID register, and we implement only the cycle
          * count register.
          */
+        unsigned int i, pmcrn =3D 0;
 #ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr =3D {
             .name =3D "PMCR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =
=3D 0, .opc2 =3D 0,
@@ -5301,6 +5526,43 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

