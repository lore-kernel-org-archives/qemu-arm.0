Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2942858wro;
        Mon, 5 Nov 2018 10:52:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5cLfPpI4XQRXjmouh9kHHLXId6tnoRFCg5O7+ptsVbm/67H9VETmB+ZH4R9KvtWLOhulSGs
X-Received: by 2002:ac8:75cc:: with SMTP id z12mr20861925qtq.249.1541443938750;
        Mon, 05 Nov 2018 10:52:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541443938; cv=none;
        d=google.com; s=arc-20160816;
        b=fmk0TeyYlrlUjPVVdrXQjxDy3Pbzvs4rJo58jY7e6l+jsXu/gkie/khY7z28HAqpRk
         ImT+EgrI+LFKIL0pt7F3gIs5mGYffQ9JKPzDApdm02ItzomdoUcOalj9v3N1y3w2K3V8
         Q709S6fMGRn/gyTrTORKL5niSuTID8roPljQQaQIRDPyOXVESUMh0ZSTMgtqJFM3TmuP
         hEhFE6RyfFtbDCC5TCU76TwHpftRqzG3EAOkkUR2LcL8DX2CUhD1ihB7v3RrYjHTD70g
         BtdJoY/1aCg0dt46yyOAVOX77XoM4Sx/UE2GdVGKJywEBknfytwv2IoWgzO5RQ41JE/m
         VkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=xr1uka41gh1Lvn5XkAnl2B9fwjoZets/wSBpA7k77Yo=;
        b=TZIQ7R2Pe2lr+biC6GAL/Xv77CLtrW0QBiEfy2Nu61f/nQWwiDK0Jc+/AhnbFtZke9
         Lrk4318NWEzMp/XbrhIK/sgknnCYDfjfdqSv1h5sT3KHpQtDX65shrgTa5GRex+1nHSe
         z8LsdOxVJkU8vFZzY4pgsiE56EVvhUQVXcqEbVS/sYraxZLD7PVeRTj2QUyrmYG7OMnr
         f92fRBIYrYCaIFurQpYDGIudg//JJUUCpqk4LRWDVLXlSAaqyNzS/A5rTgnjHZN6woQr
         WvGU1Jd7jAw1xq5bxJxDB1Yxwpsf5uDFPFvyfUSaVroSEC/jlBC2Vth8Z6rP3BP06TXk
         lSUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=h5NAzjRv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y20si905871qvc.208.2018.11.05.10.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:52:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=h5NAzjRv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJjz0-0004a5-6G
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:52:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyl-0004YL-FO
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyi-0000VO-S5
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:03 -0500
Received: from mail-eopbgr740130.outbound.protection.outlook.com
	([40.107.74.130]:9824
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjyg-0000P9-LW; Mon, 05 Nov 2018 13:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xr1uka41gh1Lvn5XkAnl2B9fwjoZets/wSBpA7k77Yo=;
	b=h5NAzjRvJ/mxIufy6KO0uJy3/XDGAHuLvRHYtp+3n+eVsW37K3qIZQP1tl3q/dW2v4JmkY9wNYGKRuhHrwSsPvNZKMsxpTUMEpE392j9Zf3GezL2lOiYtZQ9aqKlpjm8g4tvw7JOjcsKvgEcz8kKxxreU4/ARBo7ykGlculeC1s=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3673.prod.exchangelabs.com (20.176.64.150) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.26; Mon, 5 Nov 2018 18:51:55 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:51:55 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 05/12] target/arm: Allow AArch32 access for PMCCFILTR
Thread-Index: AQHUdTif3JbBpsFViE2iBtfPd5pQQA==
Date: Mon, 5 Nov 2018 18:51:55 +0000
Message-ID: <20181105185046.2802-6-aaron@os.amperecomputing.com>
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
	6:hT8wh5Mdi5OAD/C3UEQkPhjwaCOF9NuYp7xRzfL8Jpc0ULEaWM7oH6LRQwGmnmrl8gP/F6HK7csd63zfydcL/HTKonhhvkDS/JUinGerYTVg73/u/kgsurRbtSgnmpW29yQV3NQP5wZexr7FgKL2qoy8bw5TOMsTiLblkb+MzzJgog673Vdf0Tv77Wvll2jPTkrESPu+fGIC1lqt9OSayQD7d+kpter47YzveE6T69RJt+Wb22u4zoO2exManZjGKmjZwvMtcnP+2PK2/bdsVrOMsKFrxUeL1K7R/ocaBZmvMTj+3e8oso7xD/zOk2PUabexOFtw9C/sAVQqVCzzx0pxtpF881JdPnnahoJzVS6wlUMNOPu7x8+f/tv9p2DPHuqh9taRVOVpJDcPeMp6EaxhydwKOxUKA3sjMphVnA0YmCe5PtXWJ20nJ1cJLXep5fYUp2JeZhe3Jtjou25qKA==;
	5:S8W8WEWYNjkQuB8Sq8gLaFc0l6OGsPNrVCzfSVSzfgrBu9rfmowdjaB0UTLL1cEc52dgKoGB17h7SSFZXiWh7zutGKBCN/r5uywLlMDa+CG/AAZ60LpgCtTOQ01DYWcrjAuqDF7sDBj8OIkAkzKv/6SFQ4HICOFYUdpP0RN/hr0=;
	7:uqD+3YpFTdPrMPkci6L+NdUoUjvcx4X77r5WfeS/oG3INbjuSSpkkj0GepRHslnSnyUjmQ65RVDBF9SEHdZV8GiT03RuSgsF9tg8oid+5U+SjWijV+58XJom1EOEjQPLF4TbvG6NNE7k8lc+2BGaTw==
x-ms-office365-filtering-correlation-id: 3bab5b65-fe24-4c54-ffd8-08d6434fc1c9
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3673; 
x-ms-traffictypediagnostic: DM6PR01MB3673:
x-microsoft-antispam-prvs: <DM6PR01MB36734DDE643CB9FFBF0788A98ACA0@DM6PR01MB3673.prod.exchangelabs.com>
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
x-microsoft-antispam-message-info: HiZ/f7uxry3Hi4xkzdfb/rhJAoSioo3P0yvgqO06fLTVEtdhrY6Z7xs6KzEElm1h7IABr6fxegKL+Xlrhucej9PsCk/o44/4wI9aF9MiTJfQENNEpoor85t6Itmcdezv1R/x762tn6ECTRkPyKriNr+m7spOYNI1x0sl49rt5jpw550zBwuaawsuRoGxbwD/hWA8dV79yBnNG9ls91QZMzBS9YDRFYp2BbuNmByO7iicdm0Etm3zj7uMZ43iM4lYABHZLBGoWhtzd3uf/Q6lcfLFqXB1Z+iNYHMzDcUEN8AwFwXnV3k45LoVaUdx67OSB/ypbF2JjnCWVLzeQ6hlQuUIOeuwEl0U5u1vBvwzE38=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bab5b65-fe24-4c54-ffd8-08d6434fc1c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:51:55.3823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3673
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.130
Subject: [Qemu-arm] [PATCH v7 05/12] target/arm: Allow AArch32 access for
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
X-TUID: UD1Il5UohK+n

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 63d4e993f4..0522a606a4 100644
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

