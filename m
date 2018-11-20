Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1066694wrt;
        Tue, 20 Nov 2018 13:28:50 -0800 (PST)
X-Google-Smtp-Source: AJdET5dgBpF8ZLx54jQxn/gJXFmzr0GY+boM9rdco+7d1XXiioSDi09QNwUf07Ip39DyU9xG/5By
X-Received: by 2002:a25:21d5:: with SMTP id h204-v6mr3596640ybh.416.1542749330020;
        Tue, 20 Nov 2018 13:28:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749330; cv=none;
        d=google.com; s=arc-20160816;
        b=hxsNbteT9BPx8vdfsLlh+Ukdn/Z/Mo4kr3XOz69RSdJ4GqrXdYGKrIvgVc4zwe2La0
         qUCG9wDBqgRKfdBQcvljk3EpF69qsc5IzHZ4lbIg/H6RH1P7M6c+r0iKyaIra8yQ6Azz
         JrBnQUafy7QIipAq+R2vmq8aVoe+tBHszmRWgnb19/TOoS9iwWZX2+7iPs14uTOTdNLs
         +IeIzAwmd+/iR2WLnkkTn4Q26xc5D+TKUNdEzy5w054UFA0PVaiwAODWRaMA0xvcBsVS
         ZNAtRpCwYAbB6dd7QYb1GFl+Kxxe4RilUzoAFX/v1PN7jpFvJNxjcSQh38DFKux1QYx1
         Is3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=ACGwthsJKZRnSF5wGyd+O5TulEmuY7Fr9PCna9sCNw8=;
        b=bUjO2qEN62pRuysK5x+2+t9tE+dVkHUVMkBTX5x0LGU5RMJKTR5EBPo/pIhyl84EmF
         ZuwqcqGytfDEw0bvhOotU/gKvXhiE6o6GxVH1A8PmlsM3xaXzQCzY124UBCGM8XCEDqf
         JCSKef98yB7hrDFCgz6QcMXPC3DgTKzI5etoU31IPJAbe3hzFTB1q6BDnknuhbG9nrsr
         CjWke0GSEY1BwyUOVz3goBblq0WiBFAttFBTMcIbDxdL5V9dNWhd7nAEqnqA2LpToBzp
         EyHE6lWvpPYKHnJ4ZXiIVIN++/p6JIl6RXHgAnKbKwFkvvFd7RxYb0V0BKJhlJuwlJ2k
         jFWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=K2kdyVec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q17-v6si10724535ybj.396.2018.11.20.13.28.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:28:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=K2kdyVec;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDZh-0002KP-A8
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:28:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXh-0008W4-7r
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXb-0005Pq-Vj
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:45 -0500
Received: from mail-eopbgr740133.outbound.protection.outlook.com
	([40.107.74.133]:63072
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXb-0005JL-Gy; Tue, 20 Nov 2018 16:26:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ACGwthsJKZRnSF5wGyd+O5TulEmuY7Fr9PCna9sCNw8=;
	b=K2kdyVec+8zQOX/Orl2ZnRdkp1qSkqa9SfbrwGgu+k/tW+uyVQ5r6FvtRJ40tf1NQAvXt+H3AHSbMW93y5NYk7GnR88GB674sJdI17+OD3ROABWehfEmzpqQm8ucSVbTQhgytykE7567FxIA0PzI9OpirNAFVwi5EEdOPNtKEFI=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5228.prod.exchangelabs.com (20.177.219.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:35 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:35 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 03/13] target/arm: Swap PMU values before/after
	migrations
Thread-Index: AQHUgRe2o83RCI+kfUeY0CxT0nzgug==
Date: Tue, 20 Nov 2018 21:26:35 +0000
Message-ID: <20181120212553.8480-4-aaron@os.amperecomputing.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181120212553.8480-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR04CA0037.namprd04.prod.outlook.com
	(2603:10b6:903:c6::23) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5228;
	6:JZiF2LDhnNhlVt0vmQnhESymLYcpfbdbdxoewEh7kjFU25su5E4LZhjTMNYuKI6bHD+hHuJUuoGGukzqqzPe4vWFYGyvvHtjNclb9OSIdb25XAvnCx80fiJleX9W2/qZy+Q/+lCIZAW0X1A8vKEKKmatRSpmbtyiUF8a7agCXIaiUTHorzAsl66sBLN2h2sKvTGFI+aSFyxaKhby9gUvpTLmyiMaDlIwS30p0k/p796NLkEo5nMOD6eeRdSLtDHDU9Bq1lSDL3Tf6EG7TmIUibSXL502cTDQfKyF5JZJF1PsoIZffKJ9c+yKg0ZkwMMM0TMveoL/GzTkoXDXei81M4xMURgKEYTbFB6jVZZezk+ov6TlwDZcdAIFZ+FF+1VwdNGzQDKg8HNCh1ddgxHF0GVrHwQY4VVI/Lag7GcEqnwiZTaJ+BfsHTc6ObWap19V7+L75tGjd7xZeam5YwXQ7g==;
	5:I54+bw3bRW9wgHQAl50AzEN52SlPxToaJ2orVcvytHRM652xrbfw8oDYu7tjLMY4fyY9drqRjcHfDBq8dnVoGDeIYsbxU1U3oTx4iQh8tE7+spwTrBzG+rk1cevB10lTH87Bb63APmBONRUpzhSIA/9iCMH2iGRo2DB0UFqlJ68=;
	7:ixGB+u4Hme/eB9RjTUVDKMbIFQtoEF+1tYFs6ad6x3J6JIQZTDptO3g1jiV4TyM/m2jUNHavcaD6q6jkFlUMhwuh6aH0O9B5hOShbjmITmfH+ylIDtSEVjRzJ2zCWsQSf1qafwAe15C3Q24qk55IWQ==
x-ms-office365-filtering-correlation-id: 7e13885e-d0d1-4de2-e2c3-08d64f2ed917
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5228; 
x-ms-traffictypediagnostic: DM6PR01MB5228:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB5228D2C69200759EB2B110028AD90@DM6PR01MB5228.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5228; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5228; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39840400004)(366004)(396003)(136003)(189003)(199004)(305945005)(4326008)(39060400002)(71200400001)(7736002)(71190400001)(2906002)(6436002)(7416002)(14454004)(3846002)(6116002)(14444005)(256004)(1076002)(86362001)(316002)(575784001)(11346002)(6486002)(446003)(2616005)(53936002)(5660300001)(486006)(110136005)(6512007)(54906003)(476003)(478600001)(186003)(2501003)(66066001)(26005)(97736004)(25786009)(76176011)(68736007)(6506007)(106356001)(99286004)(105586002)(8936002)(386003)(81166006)(102836004)(81156014)(52116002)(8676002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5228;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: sUUAvs1C4gNlW/w5aB1W2Phwg9Zgz8Muk9MvVpjIvNHmRdtrKL+P33G+dC+lYlWc/JYSEtEJLVHRMwjk7vbPRH/23Js9de1LDW7a6p5tyAt1cDoCuQxGkPaDvXOwFi2BDTBCIgykYtaqtwou9hsvL9EMhd3ezwvZLYbet2Ecg8aphJyqAxLnaf48edJKau8bpJRsPNRL9zZflUUd1d7ALezuaMcO7G3FwwB2eXm+20kVewqMPhJhAvmqlZT5RC8KzEvdTmwqYZQnQ/7vZRRj242QcVvu7/Zu88tZzbpWper3k+bej/DsTjpiO9dCV1S2+wtHqhiIJqzwqjWTjGv7wLQIc2zwVQGbrf3QcQvetAI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e13885e-d0d1-4de2-e2c3-08d64f2ed917
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:35.1315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.133
Subject: [Qemu-arm] [PATCH v8 03/13] target/arm: Swap PMU values
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
X-TUID: 1WLuC7g9vTp+

Because of the PMU's design, many register accesses have side effects
which are inter-related, meaning that the normal method of saving CP
registers can result in inconsistent state. These side-effects are
largely handled in pmu_op_start/finish functions which can be called
before and after the state is saved/restored. By doing this and adding
raw read/write functions for the affected registers, we avoid
migration-related inconsistencies.

Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
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
index 2033816a64..2f9cd993aa 100644
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

