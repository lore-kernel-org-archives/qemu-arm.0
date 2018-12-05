Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9394551wrt;
        Wed, 5 Dec 2018 05:43:41 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WSJggLdEy9iC3/Fy8QAwNdSki3bS2gKvTQ1yRCj8NjGRypTXRbK+tbU8+oMezUvu1Xt8NA
X-Received: by 2002:a0c:878d:: with SMTP id 13mr23603534qvj.8.1544017421411;
        Wed, 05 Dec 2018 05:43:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017421; cv=none;
        d=google.com; s=arc-20160816;
        b=Bym6J014Ee76Pc7udNk0INNSq1HFGSsVN77R6R3Ytxzivut6oZXygB+poHPKyyrwwY
         BEAU3dtkW8vO5uNJI9BhoMBvHVZ6yBujllhtrDZhhzmIwBHQZwQfbNJzX7g7XTYcf5jg
         Pk8/QBUdVJaHwR8DEgVLk/iCwXCThho+mMv852wdrWwjLHkVbNuqcszB5kXd8BZoTA7s
         i6pSecsK58K+Qug8Q/g8RuMq6h0R6GScTPY5wMQf9SuCAyiIhkoaC/0hC/9vMR4kkn/M
         RTeZjmjSBfgzXoD7DPvLJGzkshLzeFqf5T46xXFtDkBXCFWzh87lI+H/EQQ46hxemk2o
         lq2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=Tc0FybT6NlkAQH5niWFLBWtBUb/CwN4iO9M6FrxBehM=;
        b=eUJywZTULNbBM0ANx6z+ZrTRukx7RX0C/LS17rJ1UzcyiBQfNQ7ihIoeQ/P+9w5CVT
         49b3pyt0FHJ4wjenEXS4Wp2KgvmRt1YqJl0UY21BomMmyan6nxK3FaUKJPnQTaX2Z+pF
         bgAcEL9vN96H0P8Noh5vFtEF/dS2p1r8yxcreJTf6GIKaQKRar3WMIan6gNMDPud6izm
         8c7tPYaX5icjYCsTqnC/XavTNgRx9aos6hOHoC0AShMD1OR3HnkavuFLCku+57bfAmaW
         QLb/LnoGcfzAwKCLftU+Af7LQ06JsChV3h/Xsd4xlkCijL2xVMNvWpTyvFeGLopxo/Qc
         FRgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=O0k+nGmn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t32si2993852qte.12.2018.12.05.05.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:43:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=O0k+nGmn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34574 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXSn-0007Z1-0R
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:43:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51463)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSZ-0007Xb-OS
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSV-0004eE-Kt
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:27 -0500
Received: from mail-eopbgr700125.outbound.protection.outlook.com
	([40.107.70.125]:10909
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXSV-0004aK-Cb; Wed, 05 Dec 2018 08:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Tc0FybT6NlkAQH5niWFLBWtBUb/CwN4iO9M6FrxBehM=;
	b=O0k+nGmnzFwwKxrekQLMpsG96touoyYYUXM+Gt9Fke2RWeC8uUWlmArhsjnrzDtALs6pd0DD4VLgGh9aZGWKpn/LJQ/DpAo3s5GV+pQkpVvKa8AfOLW+2rgbGNb23VXkM5m9dJQ0gZVNNNkWi/sBt/DRBL9raAUkrxCkUi+7ak8=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4700.prod.exchangelabs.com (20.177.217.81) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.22; Wed, 5 Dec 2018 13:43:20 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:20 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 03/14] target/arm: Swap PMU values before/after
	migrations
Thread-Index: AQHUjKB6FC5zZTLpdkSgAfs3PI5Uug==
Date: Wed, 5 Dec 2018 13:43:17 +0000
Message-ID: <20181205134243.4791-4-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4700;
	6:d6MQc7xSXZFYFHtd8cvxyeJ4VM9tNQVBVKFdRP8VeW2FBNk49gBMGmRoAqv7EiwDAG/hpF2YSXufxQEBhEI4+RQnjPQAjX0FyIAjd0/pLIQDcDaJiEArg8yUzE4euzbqSDM4Sx56LFbZxAPjVIVxeXCHImROzPcZJ0/l+fZMYDqHzxgJbUP5u9fmI0omX0vfngu678Wp+w8zRN52iKWo20UZMHj5qr4+8nEYjVECOESNR9ak74oeNHfUjz5vCM9+/QegFPk5Qal+053gP/S10CMiXJbq9cidasj90rWqdUZARQBABa+vZRzQf/kIWnc5rcq5uvZu3Ghk8Cl1+J5L3OwH/Xe4dWiejNBTvEQTZHskBaZGl1xkdTTw6A1fYJpnBv9Ma8/8SUcDLrIcz5fLyBuJMTJNpZT+2W0wJlztVwy+zdRMUHF4bS4+WaTpXTOeZ3rnLs9tknzPBCmCoQFMKQ==;
	5:QdM+1GcnhKpZ04INI5FdMTGvSgC6ac7pJxqi3c8Vy+IQ7fW84qy96eSefT5s3Q9eBYc6E9cPzjGXLsIRX7mEGFLzihwM9X3iOjBXCpIxevpkvNTFRl4z1LdW6qhOdnV0K3uAUXjKV5KxpkkYROKqse+o/fo7HE8XADx6t7zA1N8=;
	7:BzkiXztbKtESK5wsyQCp6nleFbPQpN26imfJWQ+80DK/tOoirXj7EHSMlDTr+G1yYj8KjoaCoyH3qR7K4HXvbGqV/UmoAgKTy61nIaM657SFl8eVD0H+/aB5rgePT5JAb033WUdaOt4lYjf/VTLlXg==
x-ms-office365-filtering-correlation-id: 89da6e76-a2cb-4175-eb3f-08d65ab79c58
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4700; 
x-ms-traffictypediagnostic: DM6PR01MB4700:
x-microsoft-antispam-prvs: <DM6PR01MB4700E99BCCB153A3A1D300BC8AA80@DM6PR01MB4700.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4700; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4700; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39850400004)(189003)(199004)(386003)(2906002)(6506007)(2616005)(476003)(97736004)(446003)(11346002)(486006)(102836004)(14454004)(26005)(99286004)(106356001)(3846002)(186003)(6116002)(1076002)(6436002)(81166006)(81156014)(8936002)(54906003)(316002)(575784001)(86362001)(68736007)(6486002)(25786009)(8676002)(7736002)(7416002)(110136005)(305945005)(2501003)(6666004)(71190400001)(71200400001)(4326008)(39060400002)(76176011)(66066001)(52116002)(53936002)(5660300001)(256004)(14444005)(478600001)(6512007)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4700;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 4iOgCPtHKGauX0nzUu6wDD+Eyau6nwWyZV4/UUmdKSwAegHZ5B1HnIGygHU22FYeisoSrN4Ezp1M+DYBkubCOwigEHnvgW5xp7kZ81K95EdPZfO/GyVXoAFVJ3V4cgoeXyepXNYsRn10Gdmf7ITSMKakqJQUMgYBPidKffgnwiJAH3WGYbd0gNnjm2XFm+M9FxH/7kRSwvF/jdtGEJf8OLxRBd9I0Z/xAQRwuKxK1t7rFo9rXIxZT7JAmPAX5eVuemjSQRKH9C+LAWV78ZRWt6ZEmTiJaX7MaqYCOg9+kj4X77U5fHkHNrIs6sRhOJ4NbglaxkPmgeqCS4/Z4vcjNgQRYhyABZT9DJ2uNaVO97c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89da6e76-a2cb-4175-eb3f-08d65ab79c58
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:17.0279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4700
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.125
Subject: [Qemu-arm] [PATCH v9 03/14] target/arm: Swap PMU values
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
X-TUID: 19u8M+ij1HWd

Because of the PMU's design, many register accesses have side effects
which are inter-related, meaning that the normal method of saving CP
registers can result in inconsistent state. These side-effects are
largely handled in pmu_op_start/finish functions which can be called
before and after the state is saved/restored. By doing this and adding
raw read/write functions for the affected registers, we avoid
migration-related inconsistencies.

Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c  |  6 ++++--
 target/arm/machine.c | 24 ++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 497907fc79..71a5c71e0a 100644
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
index 7a22ebc209..b292549614 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -620,6 +620,10 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu =3D opaque;
=20
+    if (!kvm_enabled()) {
+        pmu_op_start(&cpu->env);
+    }
+
     if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
             /* This should never fail */
@@ -641,6 +645,17 @@ static int cpu_pre_save(void *opaque)
     return 0;
 }
=20
+static int cpu_post_save(void *opaque)
+{
+    ARMCPU *cpu =3D opaque;
+
+    if (!kvm_enabled()) {
+        pmu_op_finish(&cpu->env);
+    }
+
+    return 0;
+}
+
 static int cpu_pre_load(void *opaque)
 {
     ARMCPU *cpu =3D opaque;
@@ -653,6 +668,10 @@ static int cpu_pre_load(void *opaque)
      */
     env->irq_line_state =3D UINT32_MAX;
=20
+    if (!kvm_enabled()) {
+        pmu_op_start(&cpu->env);
+    }
+
     return 0;
 }
=20
@@ -721,6 +740,10 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
=20
+    if (!kvm_enabled()) {
+        pmu_op_finish(&cpu->env);
+    }
+
     return 0;
 }
=20
@@ -729,6 +752,7 @@ const VMStateDescription vmstate_arm_cpu =3D {
     .version_id =3D 22,
     .minimum_version_id =3D 22,
     .pre_save =3D cpu_pre_save,
+    .post_save =3D cpu_post_save,
     .pre_load =3D cpu_pre_load,
     .post_load =3D cpu_post_load,
     .fields =3D (VMStateField[]) {
--=20
2.19.1

