Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9399750wrt;
        Wed, 5 Dec 2018 05:48:48 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XoCH54S5NJWj+KvM+t0IVkgTHLcwdOiqvmITVwBAw9jxGVDNAaTXIXsRF0RAbyTUiZsFPJ
X-Received: by 2002:aed:2dc5:: with SMTP id i63mr24072896qtd.173.1544017728837;
        Wed, 05 Dec 2018 05:48:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017728; cv=none;
        d=google.com; s=arc-20160816;
        b=GA6skXqoNQbVlt5cmQcJU6/fcMXbQyDI3y6n2jcB58rt3Uve2k92PCgw/hTX3bTb4L
         zS5uqh6KMTGabayiGUQzuDChfiYQshlyQsURDNZB6HovbVQpKaLJA7DRinaDz0R6sHg7
         ltwocRAvNAdoLD1DrKaKcrO41vKJGB0EzkgaX6PglnNf8iwAOscZ2nB1/Jc2oJlX1kP2
         dqiRocBGIhLuYygTTsgQWtjxS6GXUG+Gjouh9kKTZJyH4PFg93CfgSlzwxlxv7vup2O2
         IBl/nIpZb8QhU2t5ZStnExZY5uuhNVZniUxGDqfhLj34NuXxXOfLuoPn43yw3psRXJiB
         UleA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=kPY28nOOWI+M8fjuRCxMaBexF31RO05K6GmpfP9pCEI=;
        b=aoAw2y9vxpuoyRrCyuPdfBlN1YDrAh8H1Tfhjvn3DCbhapYrj5MMoRA7MTd3+Yv7AR
         1Ll/8EJ9bKUryUTLNtU0392Wo7lIv2CjJNlYF6SnoOKwYONWifY5VkWR4AKndDOdeQBx
         1KEe+zA6wBQvOXyQkeoUCDgM5H0hN+WYN6rF2ts27fV/lzetWxW+rxXgwN/XvqbH6t+C
         M9/432jjtmgWAPJThDUJz4GmaS6tLtNdOdonng9du3MC8vGrx+Hp5pFjTm4J09uM5y1e
         sdooNVpmC7hkR2pgdb0TrfGVgXqqliQW+U+qxkvZxwTSI3N0ih9oHaa+yN6NVeg3K9gB
         /JCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=bYbAUZR4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s47si6544580qte.277.2018.12.05.05.48.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:48:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=bYbAUZR4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXXk-0003JF-BT
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:48:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSv-0007uR-N1
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSr-000573-G9
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:43:49 -0500
Received: from mail-eopbgr700113.outbound.protection.outlook.com
	([40.107.70.113]:43136
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXSr-00054p-6v; Wed, 05 Dec 2018 08:43:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kPY28nOOWI+M8fjuRCxMaBexF31RO05K6GmpfP9pCEI=;
	b=bYbAUZR4fa1lm7JLjA31+l09yKw06KYZw2wZ3EKleRwM1kWSOs5pxuBzwA9mc8ciz9Q8aTBkooGhO6CUmZI0IQVN7Laa+jTHW8j3NzsB1chxHDP0m1y5F+8R8aKS/wMQ5d6YNCZnAgPvAl6y9KRyllUkAuEAbAWUXgAvpFYelzI=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4700.prod.exchangelabs.com (20.177.217.81) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.22; Wed, 5 Dec 2018 13:43:36 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:36 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 06/14] target/arm: Implement PMOVSSET
Thread-Index: AQHUjKB8zXOq9vnwJEeAGpYYshQCmQ==
Date: Wed, 5 Dec 2018 13:43:20 +0000
Message-ID: <20181205134243.4791-7-aaron@os.amperecomputing.com>
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
	6:2R290ADDlbuCkoep4PJBrUPnh8qeX0q0280kETlLcGMAmNuOkq5qxJQ3ulgYzkimEezYle+3RPkqHYTKHtZUt8fJEPDTubSTK/l6iIezR1/jKDFquSGsexq7qv7tsfOLAzaY4ZZhRfLmBEc1j6iE1G1gIJkhd4N/KVtcdqyecNTs5aNTKineTwoEWjiWU4tVWVwFGFVug3vt5sTgLgQhw92zYAENZXn58vDp4TwcPL3ufzsli5Rqxk8Vmfgf+PNvQrlzgQCwUvJpXud39akxYHef001xWnUxBIKiw/78NgmQpXSU3ziDoKhDTMwgQZ7ndQUV2Gz9yCZo+SgffszvTrQTCIa6ubjJYHAzvbOLApqjuDy294lNKNRSsetzVhzy31M29tbN+tbhkCeP5MQjXQ0+6xFLYay5aDoqsuoLEFmpE5RJJefXbCZAynn0LAe1vj0TZ/Wg+T+BN4HjpICFLg==;
	5:2TpS15yGigQezSjcO4lOS8FgWnp6MyrJhuKjJe6iNHsaySvsvF3s0b37nzslsjT/jsrHlvBTKUv5Kf9sztO5GCPz6b07+1B2wDR1MK8ojLLGyw8nvnA8SM1y+UTWOPre42RT/H7u1ISr/XMnE7b+apVmLjs0fCEIeGXjJGxcaoo=;
	7:cV+g956+ApFr3ybX1tN3hbpkC+i80qAVFbwxO2K7wPv6l420szo9m59mLD05k24NrdXTJvVQXJ+w9KwH4vE7IMFoTFBKVUCJ5Br6KObK5nxz23IwLFoqmorE/5j82+7P/LCPtnBPzMYEd815et7gqw==
x-ms-office365-filtering-correlation-id: 50632d28-b96a-4f2f-e5c5-08d65ab79e7a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4700; 
x-ms-traffictypediagnostic: DM6PR01MB4700:
x-microsoft-antispam-prvs: <DM6PR01MB47002CC4B6D7328E20C8D4798AA80@DM6PR01MB4700.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4700; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4700; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39850400004)(189003)(199004)(386003)(2906002)(6506007)(2616005)(476003)(97736004)(446003)(11346002)(486006)(102836004)(14454004)(26005)(99286004)(106356001)(3846002)(186003)(6116002)(1076002)(6436002)(81166006)(81156014)(8936002)(54906003)(316002)(86362001)(68736007)(6486002)(25786009)(8676002)(7736002)(7416002)(110136005)(305945005)(2501003)(6666004)(71190400001)(71200400001)(4326008)(39060400002)(76176011)(66066001)(52116002)(53936002)(5660300001)(256004)(14444005)(478600001)(6512007)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4700;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 00LP+gnJn4JRxuV6bsaQC37ul3EryOczV04AufPLJ7gNFdAIAr8lrEKwdaW1OL7ZMPx4dEYnE6j7J7oVvVJFl6tSQszJcEGfA6PuI8qa9uoGDOtep0BETGc8CLirYF/UjsZN+QGOCpFd6VpkAkEYTScqWWvCkOwtnC1gqL15V1UoR2jOD6iVSeVhXOKZqPdbgfIgRyB75qUOtoAFRWoEJlWzqASesYEaZThQroLaOCh2o/Vkd4pkPMWXNuz5rbFm3w1QLJyZGsP1oDbj3I2gWtcNYntvCvs+ZiC44q2zUfzijk+eeY3YZrvFmJcPTjAzcaqPyH4kgapRPr9doqnIW3Qxz35di4SziBgxVESCWY4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50632d28-b96a-4f2f-e5c5-08d65ab79e7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:20.5904 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4700
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.113
Subject: [Qemu-arm] [PATCH v9 06/14] target/arm: Implement PMOVSSET
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
X-TUID: G771Mj6iMxFl

Add an array for PMOVSSET so we only define it for v7ve+ platforms

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0aff261528..71be6fb578 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1342,6 +1342,13 @@ static void pmovsr_write(CPUARMState *env, const ARM=
CPRegInfo *ri,
     env->cp15.c9_pmovsr &=3D ~value;
 }
=20
+static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                         uint64_t value)
+{
+    value &=3D pmu_counter_mask(env);
+    env->cp15.c9_pmovsr |=3D value;
+}
+
 static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
                              uint64_t value)
 {
@@ -1709,6 +1716,24 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] =3D {
     REGINFO_SENTINEL
 };
=20
+static const ARMCPRegInfo pmovsset_cp_reginfo[] =3D {
+    /* PMOVSSET is not implemented in v7 before v7ve */
+    { .name =3D "PMOVSSET", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D =
14, .opc2 =3D 3,
+      .access =3D PL0_RW, .accessfn =3D pmreg_access,
+      .type =3D ARM_CP_ALIAS,
+      .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmovsr),
+      .writefn =3D pmovsset_write,
+      .raw_writefn =3D raw_write },
+    { .name =3D "PMOVSSET_EL0", .state =3D ARM_CP_STATE_AA64,
+      .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 14, .opc2 =3D 3,
+      .access =3D PL0_RW, .accessfn =3D pmreg_access,
+      .type =3D ARM_CP_ALIAS,
+      .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmovsr),
+      .writefn =3D pmovsset_write,
+      .raw_writefn =3D raw_write },
+    REGINFO_SENTINEL
+};
+
 static void teecr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
@@ -5191,6 +5216,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         !arm_feature(env, ARM_FEATURE_PMSA)) {
         define_arm_cp_regs(cpu, v7mp_cp_reginfo);
     }
+    if (arm_feature(env, ARM_FEATURE_V7VE)) {
+        define_arm_cp_regs(cpu, pmovsset_cp_reginfo);
+    }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         /* v7 performance monitor control register: same implementor
          * field as main ID register, and we implement only the cycle
--=20
2.19.1

