Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1067010wrt;
        Tue, 20 Nov 2018 13:29:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XydY3Yrf/yILv0VpglSZO1/kHhCCcssFgU5aeC7tsz2aITQPvfUC6YKxg0gMsafIPKd6vt
X-Received: by 2002:a25:1fd6:: with SMTP id f205-v6mr3607628ybf.30.1542749350819;
        Tue, 20 Nov 2018 13:29:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749350; cv=none;
        d=google.com; s=arc-20160816;
        b=dqGHY3bdUJmjI59FiG6SdjBfsxrW9ICMjTAVKD044xbIWThsb5kCIXDmy4petlPXxu
         EPOlvdBUzOrU1Rl96qtQEYhzmhLSxmjWtVa3y+yeHbosegCJCWQFg7L+3Jhln2abDFFQ
         1jvBDyB7g05LOSKRPxlKtJMScH1nU3nuc3qxep1xzT24PPswBZEyb3IeJWRuV1vIH3Ub
         jr5WuiEXfPwnthVmSqJ5zytqtm/KY8O7MTEPUYGObXgU1hgLrunkNvuU9DdBN01YQx5D
         HnU/CSw7TsbPPmkaxOlh+MzXRVogZCCr1CBiOJkCboV3lMmOe5ochG37SsyAXjV5xv07
         T+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=nj4RSqj68MVxYVLNAGs1J14T49I2nxpLxTQUyFKeooM=;
        b=xjTR6lHQOu+ev/iQvgPKcni6tKZTNzThrTt+u3AkRzqkOV3mQ+aVx5We0xiMNw/dC4
         rmCK+hCS9YMEWXNDQkUnmfcULVGZnvF1u2HxDLRg+jRUyNe3FIQedhrbkxIgMuWtJ7NT
         n8Vt33PnRCqgLl2OWpd6BqES061LwaX7QyV12+jl+dH3q+aDG+70vNeMc2HuQSsILnXd
         b2gt4Ax2rDDg7Bg/Ar443R9geG5ENufV/0fzP8gZXaXXFwfnAjXdwRDvWc/CpDwJ/yWb
         zyAqyAohHfj5PPOa8no1Tk+AJ2mKPUVQANk1rHvyExVuaKOndbMDzanLaRTj2jOI4lhz
         fGjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=fInkBkGq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s3-v6si21007124ybp.44.2018.11.20.13.29.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:29:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=fInkBkGq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36014 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDa2-0002br-5K
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:29:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXn-00008l-HZ
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXj-0005l6-Kc
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:51 -0500
Received: from mail-eopbgr740125.outbound.protection.outlook.com
	([40.107.74.125]:18539
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXi-0005b1-SY; Tue, 20 Nov 2018 16:26:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=nj4RSqj68MVxYVLNAGs1J14T49I2nxpLxTQUyFKeooM=;
	b=fInkBkGqS540ALSUOlJ/jnInIG2PWzxXLT8EGSg5JbgVGiZj8jDIdtok/jvX7guo7UYBnHPnNo0q7QfvHSe1zeBTavx55sev8rjyfEh3NBv4pneSLzCf/VoNwWl2v9P7IwkmHb1nBxvquK9JtaZ+mF+zYC0LkaSNFp8zhiZIL/M=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5228.prod.exchangelabs.com (20.177.219.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:40 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:40 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64 bit
	registers, add PMCEID[23]
Thread-Index: AQHUgRe6PKv4vgGF2kKNh/7lbe8jmQ==
Date: Tue, 20 Nov 2018 21:26:40 +0000
Message-ID: <20181120212553.8480-8-aaron@os.amperecomputing.com>
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
	6:DUjz5Y9PfnjWtlbg5ZRZFBYLni3b972mVqdGFU6I0GNvoUAFOkmSyLQPUDkszKQgMpgemwYkgDTzh4bmJaZ458Zcrh23vmvhsicF/2IHKPLRfkTG8ARRzL+YCUDHfuWw41dHHSg+yqRmIGb8GrrVLeMqJhz5heYGS+lFMo1OZoJo5Ib2kO7Gxudds5rBp/Rq8/0nzcV1rrWCbGYHzLAd1iETUCuWdWYDRLYBmiDMWQ4NNSI7RPPBg5iPwlkOU5TwkXGg6Uo8rXG9+1vuQIen+owWmdYZcUq6efwkyTWV7jbWRxu0fkUjb+NZqguVANIzmW/r+w/6JaMk1Vj9F9gZCCvArz39LnnobJIpUHduZWa9K+D1wbyDToQqf/IXzsV9kg9oZPPB7gUKi4cPzk3UptvG9DXplfITXYZ8qhMk8poualx/Cl4hHUPsIDOWygxbRmhgRJGj0VnBzfxISqEO5Q==;
	5:q5sG7NXHP9V6CabHD2hGnjl5itXelHJj/kZYMIp9UIASddlACSDw5SuxQwRfLy3+dX2x3b3euyBnw0BSsI3b4C/26fjqF6ujbXoDyvUQP+mHBNjraRtHuD0inxVSCru9GMZCxhfvbND6MUGVzPt463pHMiGQ+rzyliA3ZFfJI/Y=;
	7:EP2vZfor/0SI8bqJj2Mm68PnZKltW3ebqp0MVZfodXVWjMa35/MxwW08rJiBTaWPo89mHTDeG7RSC/mfQFr4JY/YGuwNs97a+sx20X/JS33oJ6ZrKLXeIhxdx5XJdkJ50UuQePNoLiKu5QOSYGcMbg==
x-ms-office365-filtering-correlation-id: c0a688ba-07dd-4085-6da7-08d64f2edc6d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5228; 
x-ms-traffictypediagnostic: DM6PR01MB5228:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB5228BCD40C774245BBF557F68AD90@DM6PR01MB5228.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5228; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5228; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39840400004)(366004)(396003)(136003)(189003)(199004)(305945005)(4326008)(39060400002)(71200400001)(7736002)(71190400001)(2906002)(6436002)(14454004)(3846002)(6116002)(14444005)(256004)(1076002)(86362001)(316002)(11346002)(107886003)(6486002)(446003)(2616005)(53936002)(5660300001)(486006)(110136005)(6512007)(54906003)(476003)(478600001)(186003)(2501003)(66066001)(26005)(97736004)(25786009)(76176011)(68736007)(6506007)(106356001)(99286004)(105586002)(8936002)(386003)(81166006)(102836004)(81156014)(52116002)(8676002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5228;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 0kk0wIyUkqyBC+rsdiq/6xWDz0Omc//hJRCiGkszA4/BmRofnBHIPUTQ9z3YwANXngYJm6SHRa0LZ8zFUOLKPYiAjUqPu8nvjvPvONRI0uQSb9+dgt5uDeLWbp3FjoUz4hr2GAwyjCS6mou5RaE66b0SEmVgX8j4qJFiAFI1N676WAagNAeG7d3Qw+8iqu27o1mzgqGV+gotcRj9fYuAlyS0dtadjT7yN4HfFusaU4SqOc/RMzvGCyygtrMsCpTtoELZlrnv273RNxyh/Pj99QbMq77Rz5rUd11GvIyo6iN/mq3rjs3XZQARiAKupkBJzT8/Ls0rp0HFiDr45insmM7vCSpy0S1mlKOepyAJbek=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0a688ba-07dd-4085-6da7-08d64f2edc6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:40.7252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.125
Subject: [Qemu-arm] [PATCH v8 07/13] target-arm: Make PMCEID[01]_EL0 64 bit
 registers, add PMCEID[23]
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
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: co7jDCe9ccIZ

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/cpu.h    |  4 ++--
 target/arm/helper.c | 12 ++++++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 627e5c1995..50de58e4a2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -837,8 +837,8 @@ struct ARMCPU {
     uint32_t id_pfr0;
     uint32_t id_pfr1;
     uint32_t id_dfr0;
-    uint32_t pmceid0;
-    uint32_t pmceid1;
+    uint64_t pmceid0;
+    uint64_t pmceid1;
     uint32_t id_afr0;
     uint32_t id_mmfr0;
     uint32_t id_mmfr1;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 71be6fb578..75f054fe79 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5432,7 +5432,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name =3D "PMCEID0", .state =3D ARM_CP_STATE_AA32,
               .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 12, .opc2 =3D =
6,
               .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
-              .resetvalue =3D cpu->pmceid0 },
+              .resetvalue =3D extract64(cpu->pmceid0, 0, 32) },
+            { .name =3D "PMCEID2", .state =3D ARM_CP_STATE_AA32,
+              .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 14, .opc2 =3D =
4,
+              .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
+              .resetvalue =3D extract64(cpu->pmceid0, 32, 32) },
             { .name =3D "PMCEID0_EL0", .state =3D ARM_CP_STATE_AA64,
               .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =3D=
 6,
               .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
@@ -5440,7 +5444,11 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name =3D "PMCEID1", .state =3D ARM_CP_STATE_AA32,
               .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 12, .opc2 =3D =
7,
               .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
-              .resetvalue =3D cpu->pmceid1 },
+              .resetvalue =3D extract64(cpu->pmceid1, 0, 32) },
+            { .name =3D "PMCEID3", .state =3D ARM_CP_STATE_AA32,
+              .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 14, .opc2 =3D =
5,
+              .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
+              .resetvalue =3D extract64(cpu->pmceid1, 32, 32) },
             { .name =3D "PMCEID1_EL0", .state =3D ARM_CP_STATE_AA64,
               .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =3D=
 7,
               .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
--=20
2.19.1

