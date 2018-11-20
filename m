Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1065225wrt;
        Tue, 20 Nov 2018 13:27:06 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VS5s8RUuZgdBVqXEWIuDe5HIuG/gLn4tV+90zhSWMDMdDyzbdY0CqSz6UYYfjvI3AM/ma7
X-Received: by 2002:a25:a287:: with SMTP id c7-v6mr3723345ybi.418.1542749225934;
        Tue, 20 Nov 2018 13:27:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749225; cv=none;
        d=google.com; s=arc-20160816;
        b=vuTMaJgKokiNnm9bEw9fSXqJZtNTBlHOJ6uD9ILLJhf/0KFhbfO4mgGdQ5ohmV7yRZ
         wpqA13rsJ4llPeVEysqqiKem9IdJiXiPSXY4FqJy9TCeoiPnnDD2EcPpnAQ6hDNOhX6D
         5wjrzlfb72a3PxJAwR65Y9u0n8b8yXGBi1SUEVOHtDHdSPA7c70HABdGM3nmvRv90ck6
         s6jGD3YisYKs0vfcb/Uwq6fp/NrpyXqTHaHW6TGpWeGfYBpDox0IivFAg9lGKMMnYC6G
         T36SBRsM1JTCsHjsCr0WKKY4BkJvEWCTPmpNhzX4QWMIcPxJV19Xgroj6SgxI29dTdso
         ibpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=0xIzYRJrbc3fHE1/VcFgSFiOKVg/UeNBmHtHrv3rCY0=;
        b=hclZPtc898vEtvs+cjZUJe6iDsOWrX0Em5YsHVl1WCCyqO3dAAZmJz2haXbe1cFubd
         kBz6cdziePLg+fQ3HLYtwfmfP9/SGXLseKTk7clz9gVnFSavU5NPRJR8zpE2irVyTrTj
         X2KX+SKXZjzMctepoaqVhdvPkf/FeMfJqPtouELtZLBN0gFhhRHkgYR7tS79QIsD20wp
         L+yZzjg0/hmO3gpnKSE7AxFaSLTnFQuMiCQ1pvW8sl7P0mevHGHnvP35kOUpdy2XZHJv
         vNMsmXzpUbB0gjLZStchmZ1I+TXm0LkMjP6sc6Da0nUwpII2cW26x9t+2F4IYgbw0s44
         2wVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=hWs+ag6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s84si7352006ywb.297.2018.11.20.13.27.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:27:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=hWs+ag6B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:35999 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDY0-00007t-22
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:27:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXh-0008WA-BF
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXd-0005UP-Ez
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:45 -0500
Received: from mail-eopbgr740133.outbound.protection.outlook.com
	([40.107.74.133]:63072
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXd-0005JL-0q; Tue, 20 Nov 2018 16:26:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0xIzYRJrbc3fHE1/VcFgSFiOKVg/UeNBmHtHrv3rCY0=;
	b=hWs+ag6Bq9wtEIQsLGJREuaavmET3hc4JPM3prOYHfijiTZN0zcyDFgC/DNKQ/b15WsnZpVh0vNjOh6DwIsL8E3jqjE+vi4jucKQzU9dZPq1bKXnv7bZJ7w4i8qxAt7zKVastGrP3C/1roa4FxMcnLgMkZ6UBWtZZSXZM0iz6sQ=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5228.prod.exchangelabs.com (20.177.219.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:38 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:38 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 05/13] target/arm: Allow AArch32 access for PMCCFILTR
Thread-Index: AQHUgRe4ziQvelVeNUWtX5mJ8bGWgQ==
Date: Tue, 20 Nov 2018 21:26:38 +0000
Message-ID: <20181120212553.8480-6-aaron@os.amperecomputing.com>
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
	6:PLSI/+vrbmFWAdXsAYzHOj3EksHBAzEshwbs2l/ePanuryD0VREKQB5eCUJQrXhfoacDB09TKa43yYdvFxx6vgX8qWLFHGRYf5/dQfwcb8ZQK6RNt+E4ubtOEz92uoYQpb54GLH7SMXNZjSKxuKF2vRCU8AyD8jCMp0V21sV1SgVc8n3o7+i8Dr63BLhUF8bts54BEwLZ4mL1X4kf7co4gmt7B63XPNHK4qpFPni6ZInH4wmIYI4W6hmKuyVo6nOIJnhjycRCeSgP1MDTnOOaoClebKVhVAJfS96FwYm45DMYXtbUciiycytMnCwO/ht2e/XhElwS+u/XW7or3h3nCLycc8RYVDiJg9GX43Zn8djvfXj3GTL8TKeKZ2wjloOZs4U34B1YSMxV8iUz/r5uTvOznJF2dK7ih9nby2z53oFmszQu05ccN4BBJI69zH2Vm742oxI2HlVO+4K8hXA8w==;
	5:3uZ25i/5txCt3/BpNTL8HugPCjk2JyvVWVBJbsBD6c+Fdk+dlwcdGNg24vKkcCyzc9wvgFemixR8SElCJirxIDESr8CNiLt62rDezR+O36s2cp9QE++8osKnajUOARN9Gmdm/YpuN/1N3344iIFxL2xwVeXuCYElCcmiglMuW+E=;
	7:dJJUK+sg36Pip1x/T50GmnGjgzyEFTXpKFlvCRMb30/FX3jll+TdLOw2mrbl5qIipvVvc6zrDhBEhZ1Vf+UliPFGBj+cndKKen59sgo8jAuuc3ak9IR2GiFCRJmdTmGGa4EcoRfzTJ35fRtDFZL1gA==
x-ms-office365-filtering-correlation-id: 8f687e56-8d6c-4bd9-f676-08d64f2edad0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5228; 
x-ms-traffictypediagnostic: DM6PR01MB5228:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB52285E43EEBDF4379E3D6E6C8AD90@DM6PR01MB5228.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(3231442)(944501410)(52105112)(10201501046)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5228; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5228; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39840400004)(366004)(396003)(136003)(189003)(199004)(305945005)(4326008)(39060400002)(71200400001)(7736002)(71190400001)(2906002)(6436002)(7416002)(14454004)(3846002)(6116002)(14444005)(256004)(1076002)(86362001)(316002)(11346002)(6486002)(446003)(2616005)(53936002)(5660300001)(486006)(110136005)(6512007)(54906003)(476003)(478600001)(186003)(2501003)(66066001)(26005)(97736004)(25786009)(76176011)(68736007)(6506007)(106356001)(99286004)(105586002)(8936002)(386003)(81166006)(102836004)(81156014)(52116002)(8676002)(2900100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5228;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: pKYqNOB/JJEkmgkI3NrcICr/uf8r4EhwBM3cbn6y2wiw5FA2BaBE9aM3oZZyftgSN83m/24OOM8oI3mYrNv0/Dy/hnFM/NTOLJFqa0G54UDYQ/CtkethligSP2cXpNVGJGBfVhgTlXO0TZC6OlMu4PYWNEFZ4DNZ47uC0QJYqEPH+z21dlMrEIXjtMEViq4aYt0ciVAtCVTfnqa3AHb5Ic8eacQPdQ8C1UkciZsJfs683ZR6kj0XibhTjAi06qljvgI4NV4Xs5x2cHF6jFEm+X3Gsqz3kBG3upXrO1k4BrW4bIcOMSCrG4QJpbvvbK9O28UxxMdMh4+jYAwvI0p5q9l1lPLmancF+H2Ul9OIO+8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f687e56-8d6c-4bd9-f676-08d64f2edad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:38.0690 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.133
Subject: [Qemu-arm] [PATCH v8 05/13] target/arm: Allow AArch32 access for
 PMCCFILTR
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
X-TUID: ykqAsDhC4iB+

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ddb47813d2..0aff261528 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -994,6 +994,10 @@ static const ARMCPRegInfo v6_cp_reginfo[] =3D {
                                PMXEVTYPER_M | PMXEVTYPER_MT | \
                                PMXEVTYPER_EVTCOUNT)
=20
+#define PMCCFILTR             0xf8000000
+#define PMCCFILTR_M           PMXEVTYPER_M
+#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
+
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
   return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
@@ -1297,10 +1301,26 @@ static void pmccfiltr_write(CPUARMState *env, const=
 ARMCPRegInfo *ri,
                             uint64_t value)
 {
     pmccntr_op_start(env);
-    env->cp15.pmccfiltr_el0 =3D value & 0xfc000000;
+    env->cp15.pmccfiltr_el0 =3D value & PMCCFILTR_EL0;
+    pmccntr_op_finish(env);
+}
+
+static void pmccfiltr_write_a32(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    pmccntr_op_start(env);
+    /* M is not accessible from AArch32 */
+    env->cp15.pmccfiltr_el0 =3D (env->cp15.pmccfiltr_el0 & PMCCFILTR_M) |
+        (value & PMCCFILTR);
     pmccntr_op_finish(env);
 }
=20
+static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *r=
i)
+{
+    /* M is not visible in AArch32 */
+    return env->cp15.pmccfiltr_el0 & PMCCFILTR;
+}
+
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1536,6 +1556,11 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .readfn =3D pmccntr_read, .writefn =3D pmccntr_write,
       .raw_readfn =3D raw_read, .raw_writefn =3D raw_write, },
 #endif
+    { .name =3D "PMCCFILTR", .cp =3D 15, .opc1 =3D 0, .crn =3D 14, .crm =
=3D 15, .opc2 =3D 7,
+      .writefn =3D pmccfiltr_write_a32, .readfn =3D pmccfiltr_read_a32,
+      .access =3D PL0_RW, .accessfn =3D pmreg_access,
+      .type =3D ARM_CP_ALIAS | ARM_CP_IO,
+      .resetvalue =3D 0, },
     { .name =3D "PMCCFILTR_EL0", .state =3D ARM_CP_STATE_AA64,
       .opc0 =3D 3, .opc1 =3D 3, .crn =3D 14, .crm =3D 15, .opc2 =3D 7,
       .writefn =3D pmccfiltr_write, .raw_writefn =3D raw_write,
--=20
2.19.1

