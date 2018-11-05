Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2943220wro;
        Mon, 5 Nov 2018 10:52:39 -0800 (PST)
X-Google-Smtp-Source: AJdET5ftoM06mpI8DyvwfDvJUOg1vIibf3PNcq/aozozxGniCQaBccGcWQTnKiWtxPlX4mrm4xyR
X-Received: by 2002:aed:3c0c:: with SMTP id t12mr22953517qte.226.1541443958909;
        Mon, 05 Nov 2018 10:52:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541443958; cv=none;
        d=google.com; s=arc-20160816;
        b=XspGSUHcqQfQdafkxJb4xpP9QuXRtxrudsEEi2rW/cuI+oyTYNIOlWqBCcDgfRZ5Z5
         Ab4whI8ywcjYqEtt0kT0x3u7Q8K5qoDiQsy7Bv2EUm0lX9CnUA/WJoagJoH6cNFWNkl1
         kMrunyDrNazBK2ZHkm8rPBRCgeblgwI4u1Qv51DXABgbI1TrS3xAHVRgvfkh1Zp74G9D
         jfCMtVTJmOjPPrObn4pYNLLRfdrqL0TdfCGFQkX8T1qOEZTyeYcxZJk4yjTrrVaoU8V2
         ErsX77Wx+6BwIC1NJogAwu7j25XYbPZnyEzp5B3GYvnxcXoScTcAr0VU7bFFCY9COhh9
         cAQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=VPXd9MWghnIzR5xY8zDFivqOeaaw3nTLqLMlwfGeAI0=;
        b=zgA2Ul6wxUdeQLxItutrTK1nv//jAGvZ5Znh2PdN3xDQDvBO0aHmWdmSo8ZY9ZmWIz
         FSSNXnOKBYAZJMfcZBxFU85flDE6SZ954gE5bkt63sFrg3Z77Odhnf6VZuBK09fyHd5O
         z74Ifh3Ynw44MgB30N6ebJYdrZ2m0vD+CTwBDFoWz/hV2xotbzuU82GbIjq+OZfeS6n3
         nMdMbWlyEHURSQhwl2Cp5+rN5eTi+8GjRA85Yo9AOYlk+1SbF6rvZJktbIECTZXfAPzW
         W34wYkkenrpn20g4Zc2JrLh1jb9j7lmTyBdvmnKi04v3O3+3z4LJm4KnHKMU+A7e7g1q
         cidg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="Ee/qGTTG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p125si2958631qkd.255.2018.11.05.10.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:52:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b="Ee/qGTTG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37105 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJjzK-0004uS-8c
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:52:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyo-0004c2-Vf
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyn-0000Y1-6J
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:06 -0500
Received: from mail-eopbgr740130.outbound.protection.outlook.com
	([40.107.74.130]:9824
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjyl-0000P9-It; Mon, 05 Nov 2018 13:52:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=VPXd9MWghnIzR5xY8zDFivqOeaaw3nTLqLMlwfGeAI0=;
	b=Ee/qGTTG2j8Uqi3HonFd6nWEGNYV8gQYuvDxqIie0Abx5FaDYIk3BtIpNygZsb3gAbmTDBvo+4sdA7I8OeaflP0JTRnioc0v26vrzI8WjRrCS4rzfpdJX0OniVOE+0IHzdNAE9e7UAAWjFsxBtm6fRzcP0ssKeUwMd9htDcOWP4=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3673.prod.exchangelabs.com (20.176.64.150) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Mon, 5 Nov 2018 18:51:56 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:51:56 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 06/12] target/arm: Implement PMOVSSET
Thread-Index: AQHUdTigfZ68J2Z5mEy9PN0mUl5ylg==
Date: Mon, 5 Nov 2018 18:51:56 +0000
Message-ID: <20181105185046.2802-7-aaron@os.amperecomputing.com>
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
	6:LPxtb98pNRjH+n2OtAktiZhRVvyVzWUUBoVZdPwYJY/23n/kAVarNm5KnxFDqdol5ZJa6N1g876MgFj8Dz47RQMCd0Bk7xTx5EBc8GE914jzuGQtetuclyZgr86Fi4lUwZ0UkRgF+LiJsHkznIYrwp/LMoM8uVRHVI8Z8kOFohFOxmQYuw8Ne4DSs5bLHoYG53gdWUiRsR7Fi3ptq8kEjPMAlFmKp/jmyd02Wj4UHIDs3HQA/OVB7B27z2eB+aJ3ZDu8zG1wEXrgpdPncu0fAebbgqfMIrTlv9nigncSoUgHUZbluGbBBNJFKhGt/cVaYb2C2jLrvqfPz41GX2c68+s5O0u5twmwro8hLqfjAvziYCh1DcryWsbRkFFGgKRsXBFMJ0mx5j1SG1FDASAYIqWJw+oYLH5eKMxOAaDk9yUgkmC3KsQB0RyFyYxC9kl1fRkh83YsMO/57DqQF4fEbQ==;
	5:2L9Ss5SvNifzDK/vRrgBJg4U5mFlR3SWgIJF9XdjN7WaU4EsI2/QT787koz5rC2mw/UlUij9/q+Q1WiFdUcqDau/H2/k9MOXpom3APujmXzuCeT5Ze3LxNdEoURZT4wOzlk9asOLZjeq3Igk6PkYkIzNBf2XviGnMRke3Eqt3nY=;
	7:tkRvyFc9Ol//iqn1Ze1sYQgjJlm69rNyKdYg5RaCwb1jDaro2uz5mX958WwZ+ZfaKwBo5qlSCPuA7zMZVldx2uXH7agdF8TwUKW2uHTqKGs562ySARcoKNXPOMvHtyNLhbPnHU0RVg9kK7lvX6MjbQ==
x-ms-office365-filtering-correlation-id: 6f8e55e2-790b-4c39-79ad-08d6434fc275
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3673; 
x-ms-traffictypediagnostic: DM6PR01MB3673:
x-microsoft-antispam-prvs: <DM6PR01MB367386F7547494F9522AA0C98ACA0@DM6PR01MB3673.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB3673; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB3673; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(396003)(136003)(366004)(346002)(376002)(199004)(189003)(476003)(76176011)(68736007)(446003)(14444005)(14454004)(186003)(7416002)(6436002)(3846002)(26005)(486006)(6116002)(478600001)(6486002)(2906002)(256004)(2900100001)(305945005)(7736002)(54906003)(8676002)(81166006)(66066001)(110136005)(316002)(81156014)(1076002)(6512007)(2616005)(11346002)(71190400001)(52116002)(102836004)(386003)(71200400001)(105586002)(106356001)(2501003)(8936002)(97736004)(5660300001)(39060400002)(25786009)(6506007)(4326008)(53936002)(86362001)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3673;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 6BTXApQvmnflcbEAEg0tmeIzRxTeLEmfXckveAaYpjaHWWFw6xNOS92WzNt2beok2LqENMubwbZnK9ZTKZ0HjM4NdY6FoWYajvpCgQNwCwKkvyvl6myI8U0IeBDHmn22pIB1f7+LTXtsBdQCTaU9ZGAOcO0MfQ5LaE+Zz6vf4n8zkBQbv1RoHgvllELaVk6n3SJ8xFYJ0O9b4hycqWB9V8s0CeD96openg0uZghcZTOTB4+Qa985uzFL4fjMCCBRuZfby/sjxBtVGsNsmHCKDa/J/uNmIFzNsmglbdgKQ7dSG6a8jPe+2ojan26oXzQXgz3/O0kN8Bk7fnlYDhOYsOMFG+jSAZo+MF1isR8+t30=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8e55e2-790b-4c39-79ad-08d6434fc275
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:51:56.6532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3673
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.130
Subject: [Qemu-arm] [PATCH v7 06/12] target/arm: Implement PMOVSSET
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
X-TUID: qiVGRAm7pbMI

Add an array for PMOVSSET so we only define it for v7ve+ platforms

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0522a606a4..6724d97346 100644
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
@@ -5212,6 +5237,9 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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

