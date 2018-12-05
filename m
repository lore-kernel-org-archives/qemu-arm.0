Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9404820wrt;
        Wed, 5 Dec 2018 05:54:29 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UJchv8AZ6QHzg4AouPAO1ANo1JteiwONrqRJ+WVgO4IQFO413rI9u4ZAiynTV8umVZHAtV
X-Received: by 2002:a0c:95e8:: with SMTP id t37mr23984004qvt.163.1544018069766;
        Wed, 05 Dec 2018 05:54:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544018069; cv=none;
        d=google.com; s=arc-20160816;
        b=c2jsFV31Ij6ANGoFnH1wx06Un8KyfLSFplwQw+DKCZCSUTIZZCqDXXbLXr1Y3BLTt0
         gq5EBW9tJHoknp8RRAhgmPFEvIoI7vvtItofS4oKMiY1+kyZC+tGfVagArUn2gwqxrMl
         mOwUUGEbjufW2I1IljBy4yb42RLOJlkTqKJhr1SY05oOIr/HFbejNcWFVIyR6Pu8/Ics
         lMPkQc2umQFAdF/cvN0o/DyXE44ewsjIGhHJfogXP9JvmvTUfkGQWmT0Gh0FEGOSaE1A
         nWCpZe1+f3Jw1Xyo5I3pOs9z0HH/zmwfwEnYyflR4XwxepQR5rHEEfQoT0UoVV1AUEc7
         3Kog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=FDpWp3T9UN4seC2tR1kdKq38DmyqmtAARlYFOKouo1U=;
        b=DPdJYw1VZeN7glr/iKJdph2lXmW77Tb0J6sxrHUy7KhauWba+HEX1JMwvQypghCQbM
         4zLTeJCcYVccxFJCrdAnJzK64E9oFKaECJeQE/WMqxuWRUsn1zdgOxg2n5pKzJ+W9IdS
         t8HAsv6YfZeIoSXy3Jx884CTXv0VUYC+xxMGIblfvr3jTsdhnaJS4epVejFYdYP7/wfb
         8PvEpRSp/buy1GCjHqAd4Qky6cW6lrhGH20mdR6gf6Jukt9ByQdXMZMSt3C7eO0IDsPN
         f6ZmWo3M3UluPQyfXGwZ4JKlwGX0gmVa92hMMFlT1lQnGm9SjLO7gMV5zhX6M4bXw403
         OgiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=R3eT8itm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k6si5714898qvi.152.2018.12.05.05.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:54:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=R3eT8itm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXdF-0007x8-5t
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:54:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTG-0008CB-CT
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:44:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTE-0005fx-T0
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:44:10 -0500
Received: from mail-co1nam04on0716.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::716]:59042
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXTE-0005eP-HQ; Wed, 05 Dec 2018 08:44:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FDpWp3T9UN4seC2tR1kdKq38DmyqmtAARlYFOKouo1U=;
	b=R3eT8itmjnGZWuO3ZVbnGQcq1fHcHVPxvSgQxREkof0IKMUnZCRyguOGIT4/gMAvBZ+4ibLcdmdUGoMtUktPqhXcv238jKzSwtWW6eZ4h63om5eIqqnlmy3MnGTsrzATFxQfGFjGWkzSftQKGs4pzlGQLsNAv6g/1MM3vdonI9k=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4204.prod.exchangelabs.com (20.176.106.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 5 Dec 2018 13:43:49 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:49 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 13/14] target/arm: Implement PMSWINC
Thread-Index: AQHUjKCBhJflNbObxU+OsPiGwNaiOQ==
Date: Wed, 5 Dec 2018 13:43:29 +0000
Message-ID: <20181205134243.4791-14-aaron@os.amperecomputing.com>
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
	6:tPo0HtTHiRk/xQ9dajcz8VJV4t5OrYmPs/Pw/y/KYC5enbLgvz3LBSjqN2dgHi2fQWzUCd8QLYSdDM77Sna+uR4RD2nd7MJpM6jUf5AVMrm4OEX+Kn2R6kK772ZX3SNmhItf8al/w3EWdgH8nlx0hpENZTTI8XoKFPKtx1OrgZLvze0WDlu0Hm46Tn63KeZTRszhzXYgxVv3ZZaNHK7dyjWg11FMIfPfKT0PrwWcWEenHeMWh+vOq+aTYfl6spciMg3w1nNG+iqa5R57ePZvzeVbeVfmaFU3opjc/eAcXnKD1vuFNCjqlJU04byEI85ektPbLGgPh8lAN9HdqHMksao30HHK1jZkIKErQefNJXYtY2Dm6vMkPUerAWg9zAe/Zh1hlBBw/lHHQ7TmqwbAFpJEIiPWJXT+aWSadyBR+p0CSkNnNmWjr9ib3FyWvWrfEuEX/avR8lt+5uw2P/00tQ==;
	5:hHcccNnOYEV4cEAHuAPljAGrEKyHrp8kuXG2/RrAfSXygvwEkzI6WxQfq0eGQv8IcEalrlXL6U0yU7VRHNuzLbsLTbtXxtfE6DUrD0FJe2ck0kXmIiSSJyPDhzePSEBHVKt9Nmo4Ys/6Lo7gpodSmYmwYKIZxwFWL13P/LXIgZE=;
	7:tMyhERZ7AdoubpS3LqKRekE2VBP14Vysuoo1BGeIGEM1R3m/6vy+0Ir8Hrha5NsR9GG/nMap6nzlfVQQcA1mJ68qiB7mse6BvfKzHHSxsrh/DB6EUxiVWuhv1I9N/GMwLBq5EWpgCEL4a1bTSMUKRg==
x-ms-office365-filtering-correlation-id: bdd243b3-e8e6-41cc-3491-08d65ab7a37b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4204; 
x-ms-traffictypediagnostic: DM6PR01MB4204:
x-microsoft-antispam-prvs: <DM6PR01MB42041E63A7FF74D3431ED83C8AA80@DM6PR01MB4204.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4204; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4204; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(106356001)(54906003)(110136005)(6436002)(4326008)(68736007)(7416002)(14454004)(14444005)(256004)(316002)(97736004)(6666004)(105586002)(2906002)(8936002)(486006)(1076002)(53936002)(6116002)(3846002)(8676002)(446003)(11346002)(2616005)(81166006)(86362001)(5660300001)(81156014)(6506007)(25786009)(386003)(476003)(71200400001)(26005)(478600001)(76176011)(102836004)(71190400001)(99286004)(52116002)(6486002)(7736002)(305945005)(66066001)(39060400002)(2501003)(6512007)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4204;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: RhA8x8v5lUtgswdn8RZANxwigWfkMg7KFLieeXpGsgmY1409RfkOGbbIiko7J5qnz/ccUfQ8XezugyJIoN0Ehj0XOypVrWM2jK+yQhIq0a/8mfOYq1lWGhYGWbI3JY/z7nPKhIHn8jppw7gBJwz8iQNs3jniU4onVHZPGQt70SSSwe3lfIbOsl1GVa7U4tVw+16ooMVIK+roXLtzt6m+HmaCi9b9tWbx7/7HqUdSJiZ21dme5vBkESfhl5lNXnCSDsz6dkOYEbMjTkS+S6kzeezcOP9eY9QUpO40zdmkmlzn3H4hXr3lzjsfl0ZrBMgH2o7mXMbDGT255y0tIcaVkvM/jeoRA7fX1n/hWwR1ojY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdd243b3-e8e6-41cc-3491-08d65ab7a37b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:29.0123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4204
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::716
Subject: [Qemu-arm] [PATCH v9 13/14] target/arm: Implement PMSWINC
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
X-TUID: U17QgxRFtMuR

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 724c2f1d69..3906b6c7a4 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1027,6 +1027,15 @@ static bool event_always_supported(CPUARMState *env)
     return true;
 }
=20
+static uint64_t swinc_get_count(CPUARMState *env)
+{
+    /*
+     * SW_INCR events are written directly to the pmevcntr's by writes to
+     * PMSWINC, so there is no underlying count maintained by the PMU itse=
lf
+     */
+    return 0;
+}
+
 /*
  * Return the underlying cycle count for the PMU cycle counters. If we're =
in
  * usermode, simply return 0.
@@ -1054,6 +1063,10 @@ static uint64_t instructions_get_count(CPUARMState *=
env)
 #endif
=20
 static const pm_event pm_events[] =3D {
+    { .number =3D 0x000, /* SW_INCR */
+      .supported =3D event_always_supported,
+      .get_count =3D swinc_get_count,
+    },
 #ifndef CONFIG_USER_ONLY
     { .number =3D 0x008, /* INST_RETIRED, Instruction architecturally exec=
uted */
       .supported =3D instructions_supported,
@@ -1393,6 +1406,24 @@ static void pmcr_write(CPUARMState *env, const ARMCP=
RegInfo *ri,
     pmu_op_finish(env);
 }
=20
+static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    unsigned int i;
+    for (i =3D 0; i < pmu_num_counters(env); i++) {
+        /* Increment a counter's count iff: */
+        if ((value & (1 << i)) && /* counter's bit is set */
+                /* counter is enabled and not filtered */
+                pmu_counter_enabled(env, i) &&
+                /* counter is SW_INCR */
+                (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) =3D=3D =
0x0) {
+            pmevcntr_op_start(env, i);
+            env->cp15.c14_pmevcntr[i]++;
+            pmevcntr_op_finish(env, i);
+        }
+    }
+}
+
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     uint64_t ret;
@@ -1813,9 +1844,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn =3D pmovsr_write,
       .raw_writefn =3D raw_write },
-    /* Unimplemented so WI. */
     { .name =3D "PMSWINC", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D =
0, .opc2 =3D 4,
-      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc, .type =3D ARM_C=
P_NOP },
+      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc, .type =3D ARM_C=
P_NO_RAW,
+      .writefn =3D pmswinc_write },
+    { .name =3D "PMSWINC_EL0", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =3D 4,
+      .access =3D PL0_W, .accessfn =3D pmreg_access_swinc, .type =3D ARM_C=
P_NO_RAW,
+      .writefn =3D pmswinc_write },
     { .name =3D "PMSELR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =3D 0=
, .opc2 =3D 5,
       .access =3D PL0_RW, .type =3D ARM_CP_ALIAS,
       .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmselr),
--=20
2.19.1

