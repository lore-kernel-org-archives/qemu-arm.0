Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp708786wrt;
        Tue, 11 Dec 2018 07:21:12 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WH94LRjuHkUoDWMQHN30aNypNe8PkIQQOjiBH/JPQ5j05Mar7T7QgROpV5wqB53cQl3c+4
X-Received: by 2002:ae9:df02:: with SMTP id t2mr15085957qkf.230.1544541672457;
        Tue, 11 Dec 2018 07:21:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544541672; cv=none;
        d=google.com; s=arc-20160816;
        b=EICafrnzpNHy6UgpbJWH9cr/vo3skZWdKuBEJp6JyPlCjayqH3AyJB0GioqwXgLvZW
         XQ5wkizJnI8gBDI5hP4STzPGffjVrWVqUpFPWxk0VjVoOzhWf3qIKxfOWaSS5kYunrpY
         iIjxI+PrpBSj/v407LxbWG3PAnkuRUNvNH/12AHKGNdm91EfVFPuYg4ME6EWcOA7osAa
         iYKOAajQ3NRvLLs2exh6aEbiVSFihYD5qQV7E6TLhbuBHrXbXwWXAJz87cLnHxQsUNZG
         x5KCmYzgbpQ2C9DXk3ZgMbfrzfYZOlUs9R+HZ7IaLfC8S8N/SEqEgp1NRaBzKvYDG7Ih
         DAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=bCGijUgPPQCwMo4ui9qVskI+ONO5XPCxVc/TwlxAEtI=;
        b=HE4be0INSsl0TqVtvGJlZoYYGsixDPWR23u2djGIYFVUeTj5ahFs8ETSEFXVALPtEY
         ZPN0C5PXD7sG7+tD23GH7gv/8fwc3jorE7LFCKAVQ2lVg5FvQL3No+s84K3iBNOASN4S
         ILqdLHoU5IAH6/WxKLbm8QvmfGPZCCFONXtuu1AVsEQHc9lUtGo1YmsMPelauCI8jzeM
         qHBSP+PE6MCCcrbQJCCN2hQmbQHsbPyqC5NZbtvtaSTQ2lMGH9CYBcAQNFoJYsmsf/Bo
         MstCedAObf4v2bG3k/7a9IRk1mN6qz+c21XON7xtUjiJSKQd8KdDGdCGh7G4BZAxn0BV
         m0Yg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=L1pyT9XV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 99si864459qta.389.2018.12.11.07.21.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:21:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=L1pyT9XV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38620 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjqR-0004DL-TO
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:21:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpl-0003r1-EN
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpk-0001OZ-F8
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:29 -0500
Received: from mail-eopbgr710107.outbound.protection.outlook.com
	([40.107.71.107]:42240
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpk-00018w-47; Tue, 11 Dec 2018 10:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=bCGijUgPPQCwMo4ui9qVskI+ONO5XPCxVc/TwlxAEtI=;
	b=L1pyT9XVTl7mYYpx/skLViKGz64w/sMKcgcO5dJcQR8rrn3+ytqju7EwtjUGsv88aLX8eIYcJOdiD47YwG/Li2FwtTlzqkqjaqPlEb8xQz2Ud5iTyC36L7+lWQ/6PdM5f9Ykex0CmjLlKEu6k9CokrpSvOZJvbOoSf+jAl05O/g=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4379.prod.exchangelabs.com (20.177.221.214) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.18; Tue, 11 Dec 2018 15:20:18 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:18 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 03/14] target/arm: Swap PMU values before/after
	migrations
Thread-Index: AQHUkWUGUY0t6Xr9CEu/h5Xc9eW7kg==
Date: Tue, 11 Dec 2018 15:20:18 +0000
Message-ID: <20181211151945.29137-4-aaron@os.amperecomputing.com>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181211151945.29137-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0041.namprd11.prod.outlook.com
	(2603:10b6:a03:80::18) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [65.190.6.212]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4379;
	6:6vi1S4kXczT2FJ8PRVbWr4m0IIpA9NIszXFNf6MJ2HPbuLHlS21dCVSRwUOhLeWK+nVP+kloZRQUxFQMeoKiXPdzwSH13V4uB7kNLr7QkLV/6ofib2e9fhBcD2Z7j5fFNl3mtMjhHTLjC9QbEwrKU3ir1KCtcDb1KDGAdUL7N1yTjROU+H9ikvjlUcUuri5oP9AOxQZfspJdbjPQ2zvdc5e7kridQDD5INIZZlK8HlD+77w2JpaP7EaMCA6g4pwSL3LzjIDuqBVzgCxqAVJR00P6EC5+ftrU+yKEK06Mr8orE7rQZAq+w1Zqs4fEiN1091XSRu7GYk+qSkeQO9EMKxsQv6QCNroMKRqfWXSmKFguIieuv06hevTryO6w0YOsIe45FHni5oKoPVhb+IW97qBhUM/GAMVO0ZgPzzqw5lW+XfSuu/9Iutw+yEGdTD4h7VgxGgIDvXV5xT3iphYZAQ==;
	5:vLtdXG0XB6gHAQ/UvQtMB0u+mmx/7+Vw2hmvDjn2YlL7Jmgr0ph7Uj2bn7wqbtS6HRyMwFIhK2KqMuDzfqxG6z5pvLiWPaOa1B2//K9Hcskmdv92k5P0swZS5S0oOqHRLEdYZk2s3yklcf8EgSEcoMs3s3baqPNXjes/j9HEPgw=;
	7:VfiXMJ3CQo/0DkSWNjoXdiYgS+YPTMDdMEUbz2SGxPGHPwSERj+1J+gR2ACPAzVyLHNjO1UYXQC/9A/myIPXwdkZO3YoIhgvTqzc6/Xan9Bp2xpmYoGZXA+PrYB1Dj6NSPWODK/TcI6Xe3cJ22lIIg==
x-ms-office365-filtering-correlation-id: 72742aa1-3e46-449f-735b-08d65f7c287c
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4379; 
x-ms-traffictypediagnostic: DM6PR01MB4379:
x-microsoft-antispam-prvs: <DM6PR01MB43798BE070982D5CBE1D14CA8AA60@DM6PR01MB4379.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4379; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4379; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(396003)(346002)(376002)(189003)(199004)(4326008)(26005)(81166006)(81156014)(71200400001)(71190400001)(106356001)(6436002)(66066001)(14454004)(68736007)(3846002)(2501003)(102836004)(8936002)(6486002)(8676002)(97736004)(6116002)(186003)(446003)(99286004)(476003)(11346002)(2616005)(25786009)(7416002)(486006)(7736002)(54906003)(305945005)(39060400002)(478600001)(14444005)(256004)(52116002)(2906002)(386003)(1076002)(6506007)(105586002)(76176011)(6512007)(575784001)(86362001)(53936002)(5660300001)(316002)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4379;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: zsTVn19FBUfJArGGzV9ZHIcl5pAaapG6Yu55cqcG7x4QXJ8wro00W6ATg72aoK2kPHy9K/CKkAikA/jGNeuGPM/FDnJllFbosDhOrZ18i+jpGz3T6T7/pmckDxoGWR+TcNqA8nnOol4pqAADT6JBrz8Ol16o+8rN8ML5WSPBr+pYTV/9pOm7WqtW7IDqMQf3LX1lGtf1y/+xrSvSfXrQOIesIRrVog9C5+nIzZhPY1vPdYRLISCGPWIzGt3zDMYhdigxsbESeDuXbPhz5rBBzOai9HR35ypsxmK+76dVNm+Po0pM5n2xd+HUzaVbLjA7
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72742aa1-3e46-449f-735b-08d65f7c287c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:18.1988 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4379
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.107
Subject: [Qemu-arm] [PATCH v10 03/14] target/arm: Swap PMU values
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
X-TUID: XoI/KGpPA8nl

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
2.19.2

