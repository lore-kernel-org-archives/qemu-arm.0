Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp709079wrt;
        Tue, 11 Dec 2018 07:21:28 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U6JXTvzEoCfW5JKSrcND9RobY+hTvQ428sImm+zibr4KrXCRP+kCzzv4s93I3ITnDlD1sw
X-Received: by 2002:aed:32c6:: with SMTP id z64mr16079333qtd.132.1544541688056;
        Tue, 11 Dec 2018 07:21:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544541688; cv=none;
        d=google.com; s=arc-20160816;
        b=E+4NFCmOl3y+cBFMEQMUn+xT5ky6eZ0aBhI9WOZEqvuTeICoAAHLUojNY1D8Q+0Hsx
         yef2ZxGffZHCkGPNXBOMXS7V88rvoRqNM83PkIIpy/IQ2j/ZULBTs7hSVptBmYcdMnLe
         MgdkQy/UBGtifVzs2crrRgpApaPRal/hweEUqNcJN7T0AN7j6KW0nYy0SWIGaKuKKz6I
         rjlcPY2wLHn0xWcrCt56if60+OqOEb8zp+C0VSB+e8camBEvbipr8kGaguBlXN7+Khxj
         ScGxuYrJKKXVpeSLBmFr2V3tQPfpku8kXYqc8NjRucGoeLx6Xs+Fe7fDib+faEkUeq+H
         W5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=5spLWlcxsr5TGY41AaUZ6HFmT3AaWPWB/Jw6BiyM3wU=;
        b=WluV9o5X4sSVSpF4rGKkh6p2ryNtrDplZfq6AdHKviAQJJBoJIrFGOvrtS36Dvvg7+
         y/nS52Wfexb8T4aEB8sO0gXLpznfz7L6yaHhjVt7xNgt5u68G89qe1DdnVem2LoAapjZ
         9lGSGxc4iiwdGYwvLgIH6Nup7WUi+WjuMJaz2uy7WxlulIICSpQj7SboPi7FoKzM7mCB
         FAjFD51lSyvMaJ42z0NUW0P5JCBGNnlBaiig4ewQLmoEjhNJd3S6EQ7VrNj18RLwq/+h
         ibJNX4yHcfzg+CCA2QYnwrLYMKoKGwXwhR/+W1LIS8DYfRHHvgJ1RGyMwLXV6egr2MDN
         pOnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=J3RpmTeZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c19si1602310qkb.99.2018.12.11.07.21.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:21:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=J3RpmTeZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjqh-0004UQ-DA
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:21:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpn-0003sZ-NT
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpj-0001Nh-Kn
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:31 -0500
Received: from mail-eopbgr740122.outbound.protection.outlook.com
	([40.107.74.122]:12256
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpj-0001La-9P; Tue, 11 Dec 2018 10:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=5spLWlcxsr5TGY41AaUZ6HFmT3AaWPWB/Jw6BiyM3wU=;
	b=J3RpmTeZVwNyuDYrsIzdBREFNNw450YjYhzd2CW4VWicH6GU7NMlRJ7/pWZnuj/n8k+WP27RRV6qNRX4uTbtPRhgC71vihb1O2ZIydUzycTS62B6jFIThpfD+xeouUd5p6S9V9MgfszAzK6QPkeWGCl9uhS+nEHeXGDCxFYk9sg=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4604.prod.exchangelabs.com (20.177.216.81) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.22; Tue, 11 Dec 2018 15:20:25 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:25 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 05/14] target/arm: Allow AArch32 access for PMCCFILTR
Thread-Index: AQHUkWUKOoIGltpFqEO1eXcNOi8svw==
Date: Tue, 11 Dec 2018 15:20:24 +0000
Message-ID: <20181211151945.29137-6-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4604;
	6:Zn0TIuN2RTLyntto82qroNzvXYj6BcajCQNacDYp5BOos/MyedKCyUs/T1/9VzI7UOt/LNF5VK3DG2KxnDeZ/y0HO6EmOkp3ENNzSOqNb1X29D3TGXLzJnfJSWYhHWnqY8ustNvnxynSg0slM9ogp3iHI/3rjCxXObeYT/c4/KCPEGhC924gfJ+Js+4Zd6JjBZr9aR6dQpkCSz4/S6iOhgsWVtMyWnt4Hh3C2h71ECchublXAj86kncWiONWz5ctkpbbJlJljEGeuXBYfKw+0uDqbRbVXxqW3c4YWt6nvMGIqK6WZDoKoci5+BipZGPbaGvcnb0DKiBqQuXHKZpqWstEN10hVN/JdHheKXGppNSB6JQ2hPd39DibRP3MSjM5/8O1lNkjOatBQ/WWfXOkcqFq10LxCNk1gH1Qf4LtoCtxIgWx2cWhck0p4Jm1NFFX5Tuoc4nUlCS/U1dPC4ilKA==;
	5:J2BSW9tbfSL0aX6hdNuZKp8/JPdj41jbMHkFwg6RAxojcMBNnObAVu+2OTgKdXruPWpfG0Pb8hlATQMl54ID7J57gaXivzjbltl5LYzwP2cn3w9HRc+ve/unABmUPRUArDDGUy1ZNhvybQbZt1CQvvu345AC0psZJJXcj3AQh14=;
	7:+iph6WVKH3hu/yrG3VDw97LS6xLpggY6/lUItIxXvg87AaGa2giPrSYmElgCMzbHQcH0phXvylCMJSc4KXa63YjBGiSZcKbqRuT/klzovKA4LjRL37Mg/vZOxVPZIMtwkiTGB7Gy6Z5k5ztkjj6YGQ==
x-ms-office365-filtering-correlation-id: cd6b5817-e377-4f27-959b-08d65f7c2c89
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4604; 
x-ms-traffictypediagnostic: DM6PR01MB4604:
x-microsoft-antispam-prvs: <DM6PR01MB4604B04019320BE6B69B48048AA60@DM6PR01MB4604.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(93006095)(93001095)(10201501046)(3231455)(999002)(944501520)(52105112)(148016)(149066)(150057)(6041310)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4604; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4604; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(136003)(376002)(366004)(346002)(39850400004)(199004)(189003)(97736004)(1076002)(14444005)(256004)(26005)(25786009)(7736002)(53936002)(2616005)(186003)(86362001)(4326008)(446003)(11346002)(305945005)(105586002)(106356001)(476003)(486006)(7416002)(5660300001)(102836004)(478600001)(8936002)(316002)(81156014)(81166006)(8676002)(2501003)(6512007)(2906002)(39060400002)(54906003)(110136005)(71190400001)(71200400001)(14454004)(76176011)(6116002)(386003)(6486002)(3846002)(99286004)(6436002)(68736007)(66066001)(6506007)(52116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4604;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: VShSGyVI1B1y/a2KsCVYrNbSXJ/HI4lr8h2IIvznSa5LgCLyEktVN1FnoO7hDCXP+JnANtBoWf76mkKPZdFB+/a+6U2zAiHuFVsggfpXYL5fgfUXV6xYYLS2dkS+KA3a+wkQgPcycOBgb6t7jEwW8FLYVljHYUqWafsPLwBFUgewiwTZatOJSQpDOv7KBXA+zir+3EqzqiBpLYg+vOkW7PGBZEBgBNmn5rnJBTXXUihtUfsvJsOyX/mQYfjJXwBtjOpA3tdxkf0Ako36nXVDrC5OJ4AN2Pj1bcq/VDkHf0YcQVe2l9reBTcz6spKluIi
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6b5817-e377-4f27-959b-08d65f7c2c89
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:25.0114 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4604
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.122
Subject: [Qemu-arm] [PATCH v10 05/14] target/arm: Allow AArch32 access for
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
X-TUID: xs55G9+tQ4aY

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
2.19.2

