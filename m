Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2943118wro;
        Mon, 5 Nov 2018 10:52:34 -0800 (PST)
X-Google-Smtp-Source: AJdET5e/ZbhRBUsJiqzby/gFNZiuIFb9QE0R8OmQHqkp5fVw5J2ud07v/UhLBMUHbUn9bq4HHL/q
X-Received: by 2002:ac8:85d:: with SMTP id x29mr22323745qth.379.1541443954000;
        Mon, 05 Nov 2018 10:52:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541443953; cv=none;
        d=google.com; s=arc-20160816;
        b=zWuwbKCnIZ+SBSEEQfOYeYz60CSLSOOc7nf4Lztpsz00uwnSPApvaRSfi0xy1xkkiv
         46iksGZl3rN2B+SNb/xo07PBPOGW4i2zxNJnQbokAFr0dEzsPCp7/RTYNnfbufYSVamA
         lNKZvMzAd+8NWEHPrB9PA6LJRA+F3SyxiEuxPObk3sduJ/x8FDB66SbnoGt87jogRAn0
         Bol6q8I7UhMOKsdHkilpfaLfWhHSmtnDXpVK3XOCp/XWNMk1oiPdOSip0FaLLsiPYkI7
         B1SsYv7aO/vajlY5vJ09ivLgQoUwJTGVrGYsJSB584FiTbkc6YtQDASrve1zFjyskvHD
         OsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=ORaQJUeT0vyQTTkbxyd2PfJWJ7jUjJbCv7U4/ltXssw=;
        b=SXG4e3wUV56AAwK7d7VP+gpc6IMQhedzKHgLuMzVWS/1UrC3sV5wqE8ubIT75l7fSU
         9ysSX8g30kNiJsIAqMtsoWN9qnZkaumywbB/R3l6nzEAT/UWIAZsjkGeo3FMHzGsJ46g
         LpFVFq2V6fPQlTR6OdeerDZ7kFABopSU8zHThfM1zI0N/o+x/JWAEdfONodhqhqhjT3U
         Z2NuRUx1OitQygcKxiGe9W4beXXzDISbOcr/pKyDRzAFo8zej/vokjvnZhMqjveFmMau
         zAE5OhUT/aosQFeb2JcsJ4BhdL5RgYMczps7Iy77qzNQyZi197OKWmNWhZNKN6gpTl/u
         Z4lA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=WQkzMiKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w39si2201657qtc.168.2018.11.05.10.52.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:52:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=WQkzMiKc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37103 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJjzF-0004qV-FI
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:52:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyl-0004YF-DS
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjye-0000RX-D0
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:01 -0500
Received: from mail-eopbgr740130.outbound.protection.outlook.com
	([40.107.74.130]:9824
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjyc-0000P9-Jj; Mon, 05 Nov 2018 13:51:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ORaQJUeT0vyQTTkbxyd2PfJWJ7jUjJbCv7U4/ltXssw=;
	b=WQkzMiKcFM4W4xd/jGeeQl3HnC1NBT9Tbih10iyHIM/TCIIKAUwIuKAq0OER3hol3GlA0O7Wf/XFA6k+8Sgy/iuOips9kgBztcXCXZmdMb6lwLkI7jHmzSkXbIK4AUmMWCHNEkK5YSKTLWjmcjN8kc2YYxLFS7V17vCFOWOAJIE=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3673.prod.exchangelabs.com (20.176.64.150) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Mon, 5 Nov 2018 18:51:53 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:51:53 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 03/12] target/arm: Swap PMU values before/after
	migrations
Thread-Index: AQHUdTie+eZYbSFIzE2VUuP1qr4hfw==
Date: Mon, 5 Nov 2018 18:51:53 +0000
Message-ID: <20181105185046.2802-4-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB3673;
	6:7+WW/s5ZwgcZFrcbkvQ+OIetV/kuikCgGnBOAdl2i4LoIPKzq1Y6V81GQ+SneIcxK0VEXMH7ONjrlHj5fYxu1ipTqNxvoVoej43P/EJwJRzus4BCPfOJRsERestSocRgOItKIFGhXOxN219gGeHpvedMl+ZlX5zCrKIREs0f58sPnQeYUmur3qx56x5eLE+gpuYHpv2bTj+dlb9r2U0rD4tU+807KvjJWXhbwVaW2ZKSVJ9akSVMtZHLxRJ44TDrVH/etm6Yx4n+M6zXsb2X1Z2YTBMpj/WxY8Xx06Uj4giiwSR2k7irEkNIIJ4WGk1M0TNSbAiku2i9NjYFGtlvaXZKXKV8+eH1uwW4wdwdDS6IIbCfiR9agri41vmnOww9LCPhE34dPVeuoaTPJ4mMBDOaizkVzwvpjOpLnRoC1A4qRhgpXF3ddGCqSD29In7FfiIt4Rocj2nVz854hpS6lQ==;
	5:DIMMyWmqHVc14rAWnqLiGcUuFT7pEX4l5ljyqgtYtS4LIsEnfIApfFXXOavvPDXdrf6dpVSVjQqjLmBZ9AK95A0kFy4sTt2lDzcCSqU9wO3SQnHld6hiqsUrWtwX5pJs3ghfEnHLERB+3eiGdTKsGyegShEvTrSHdZkm/pX4Jvs=;
	7:8uLxUkjwXzPnyFXKTAcuIO0/whjnvr2kqTqPVaggCQ2ejJ0JEOlv7bzySTmHAeuo+nXUdG5PzVv1iT0Xn4GudDh1E7mWeLv41sK8VsZ91Da6yCFalEm6yfYUU+0PmZ+IxiUe6jBakM7fBVsrs8QY2g==
x-ms-office365-filtering-correlation-id: 1e9983aa-fff3-456f-777c-08d6434fc06e
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3673; 
x-ms-traffictypediagnostic: DM6PR01MB3673:
x-microsoft-antispam-prvs: <DM6PR01MB36735205538B8ECF1B2FDE4E8ACA0@DM6PR01MB3673.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(85827821059158);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB3673; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB3673; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(396003)(136003)(366004)(346002)(376002)(199004)(189003)(476003)(76176011)(68736007)(446003)(14444005)(14454004)(186003)(7416002)(6436002)(3846002)(26005)(486006)(6116002)(478600001)(6486002)(2906002)(256004)(2900100001)(305945005)(7736002)(54906003)(8676002)(81166006)(66066001)(110136005)(316002)(81156014)(1076002)(6512007)(2616005)(11346002)(71190400001)(52116002)(102836004)(386003)(71200400001)(105586002)(106356001)(2501003)(8936002)(97736004)(5660300001)(575784001)(39060400002)(25786009)(6506007)(4326008)(53936002)(86362001)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3673;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: nd8edYer/Os8EmbDBka/hCzWhCUtf/meGG+f0L/nW6EFcYBM0oTsJkclLFewY2GEpJzb7U80n/ZtVQ4zhkS2oJKY01efHcHP9zo0e+wh28syh3KLwIfN80PX0+cScQ5UyrKWCtNnLIC7Z3dj9dciSKoqSB4q+GE0OpuSWCay62aoawsgKvGEQGMZ9tz64pcCpX8WfxKLbAz47K99jCRYS1eOgze96MEQPqNI9vloW9zWHKt45Gb3xzyZvNFh37XiJnCombz0URRM1AnzcX0yqBxuNl/N5A7qQ4XqQNtYO+Ye5oTmh0PzQ3Ek/7JvbPGftaY7Im7CSeaTvwh+zoBoSDPw0vl7zQC9iX1r/kkwTxY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e9983aa-fff3-456f-777c-08d6434fc06e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:51:53.0757 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3673
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.130
Subject: [Qemu-arm] [PATCH v7 03/12] target/arm: Swap PMU values
 before/after migrations
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gAHdBn8jq0bS

Because of the PMU's design, many register accesses have side effects
which are inter-related, meaning that the normal method of saving CP
registers can result in inconsistent state. These side-effects are
largely handled in pmu_op_start/finish functions which can be called
before and after the state is saved/restored. By doing this and adding
raw read/write functions for the affected registers, we avoid
migration-related inconsistencies.

Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
---
 target/arm/helper.c  |  6 ++++--
 target/arm/machine.c | 20 ++++++++++++++++++++
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 281bcff1da..5deff3d11f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1450,11 +1450,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 13, .opc2 =3D 0,
       .access =3D PL0_RW, .accessfn =3D pmreg_access_ccntr,
       .type =3D ARM_CP_IO,
-      .readfn =3D pmccntr_read, .writefn =3D pmccntr_write, },
+      .fieldoffset =3D offsetof(CPUARMState, cp15.c15_ccnt),
+      .readfn =3D pmccntr_read, .writefn =3D pmccntr_write,
+      .raw_readfn =3D raw_read, .raw_writefn =3D raw_write, },
 #endif
     { .name =3D "PMCCFILTR_EL0", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 3, .opc1 =3D 3, .crn =3D 14, .crm =3D 15, .opc2 =3D 7,
-      .writefn =3D pmccfiltr_write,
+      .writefn =3D pmccfiltr_write, .raw_writefn =3D raw_write,
       .access =3D PL0_RW, .accessfn =3D pmreg_access,
       .type =3D ARM_CP_IO,
       .fieldoffset =3D offsetof(CPUARMState, cp15.pmccfiltr_el0),
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 239fe4e84d..6d14b08e0c 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -604,6 +604,8 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu =3D opaque;
=20
+    pmu_op_start(&cpu->env);
+
     if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
             /* This should never fail */
@@ -625,6 +627,20 @@ static int cpu_pre_save(void *opaque)
     return 0;
 }
=20
+static int cpu_post_save(void *opaque)
+{
+    ARMCPU *cpu =3D opaque;
+    pmu_op_finish(&cpu->env);
+    return 0;
+}
+
+static int cpu_pre_load(void *opaque)
+{
+    ARMCPU *cpu =3D opaque;
+    pmu_op_start(&cpu->env);
+    return 0;
+}
+
 static int cpu_post_load(void *opaque, int version_id)
 {
     ARMCPU *cpu =3D opaque;
@@ -672,6 +688,8 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
=20
+    pmu_op_finish(&cpu->env);
+
     return 0;
 }
=20
@@ -680,6 +698,8 @@ const VMStateDescription vmstate_arm_cpu =3D {
     .version_id =3D 22,
     .minimum_version_id =3D 22,
     .pre_save =3D cpu_pre_save,
+    .post_save =3D cpu_post_save,
+    .pre_load =3D cpu_pre_load,
     .post_load =3D cpu_post_load,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(env.regs, ARMCPU, 16),
--=20
2.19.1

