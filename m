Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1065500wrt;
        Tue, 20 Nov 2018 13:27:24 -0800 (PST)
X-Google-Smtp-Source: AJdET5fz4crr2pobFE+laM9A0ulAjy0N7Oa090tFY5l7XM6IiOLcANp0qzY9h30o6cJy5vWNIWuY
X-Received: by 2002:a81:b719:: with SMTP id v25mr3925503ywh.131.1542749244081;
        Tue, 20 Nov 2018 13:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749244; cv=none;
        d=google.com; s=arc-20160816;
        b=piotuBzX0RpFnYalyIMpUm/g1gQ6ZQKiir01AFw8R0WIDeBx6GxOIYcsCLHBBdae7V
         srfrvPFfRSNn5UAvqyBTCO5fOnpqV3VhdpIS9KUyOlHSgXU0tDS2j9oPz/ag0jeu3RVD
         6bLRSMOrvILVxXiEhwZQ4vQiNg4Gpqitr0ab+UFIq489Eorqr387POJIDviMtZOZn/BQ
         1fpTnWeL5DWNelmBQ6RwxYoruILafgfj65D2uQa10iY1BoIx1nYSE3ykH8xtSlYg/dMU
         i5pPqO/42BRLW9HrxF5wKHo4fcFSq5BrzorokKj86nteCx+XU3mJ44ySfvq5AuQ+y/k3
         J42w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=kPY28nOOWI+M8fjuRCxMaBexF31RO05K6GmpfP9pCEI=;
        b=Y1JegLy0cYx/XQDElcAVa5JQ7tfZtp/2CjOzYnYvJc8W7ExDGn/v0Obl715aiMDoRO
         OKo5D7NIAngfgoIPuhT0JxtX6TF/gSwtfD+2IIB92YGZbtDEpmwYnGePANAwNIfRoY0Y
         Lv5q1U4/7Jez5mbNbsgPddKaaeJ/BphH3niEkx0S54k6LZV5xvknWP2/xL0KLJchCE3J
         7/1Vqa9+xYKqdJUuHzqHEL886VHuS22DtsxTDN46LRUij7PY+B5H42r8hx3r7LWEi8XB
         7mnb+9zks785sN2Y4yis5bqZlNBEMHhrejkSc4QREqR1h+LDH7pU32TA2LWofgT4Qnn6
         Sdmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=OYQnuYoz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l11-v6si7500182ybq.56.2018.11.20.13.27.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=OYQnuYoz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDYJ-0000TT-Ey
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:27:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXj-00005t-6r
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXe-0005XD-HS
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:47 -0500
Received: from mail-eopbgr740133.outbound.protection.outlook.com
	([40.107.74.133]:63072
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXd-0005JL-W0; Tue, 20 Nov 2018 16:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kPY28nOOWI+M8fjuRCxMaBexF31RO05K6GmpfP9pCEI=;
	b=OYQnuYozRldhcUcuiLWIcP8pTxWEQuVHDEipuuclSu+caobjNrrLjtvgX/Sbko09o9vVOXMbx76vsp63oPsRTI4uuFVB9P125zO0K0ucQ7u14KcB15/YAtk5Zoy14ndG3YMMbJ3OiFSFexLflru2QGE/wRIAXWjaKTxyTi9ai40=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5228.prod.exchangelabs.com (20.177.219.205) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:39 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:39 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 06/13] target/arm: Implement PMOVSSET
Thread-Index: AQHUgRe5ox1hLzP5+kabVTvza5yyCg==
Date: Tue, 20 Nov 2018 21:26:39 +0000
Message-ID: <20181120212553.8480-7-aaron@os.amperecomputing.com>
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
	6:i8Z777xII34amD4bjVh3jWh6c1L1yxurcxemceQqelPZaiMCvnw7D2+NRcblFvFTUAsqJGimb31W5CA72E0me2DmSMBEG+VIgf0S56ADMSxmfgbi34m0vLaDtjI8RLvW8HyrOquZUx2TzXGUxBYwHwAbI62AbTWend+o/EXm0ngh0cw1v7HtnSp/7RukEsPgRLLUfC8Ux4yyuf23Iv9kkgalj62LaP+Wr+6+310YfR7zKFBWDpnzcpOtnPeP8VWv8Q1qCEDFBwHdGSx9UU+uMy6O8mlTC8avYWQLFIFi4Ut0W4FLTb2hzDf5t370r0iE/JliTQ5Zvkp6leuNoNHzqzlVEN+qPeOuSHHCIKaC4N61q/yXEmlIhSqW0prfuliUr8nZn3kYU5/yDWuWUsygdfokC9ToyC7k1wl5lAMrnScGNmlfLHC4rEGiqRAyFilE+BH0sgSbIshJXGntMywNng==;
	5:yK9ZMKdE8NsoldZcdU6bPZoEpuQCA1luHgypBEzIO2YbkCQ5D/D5tdOtR1PDleMnbPxTyY5UyLLTCoTmqFhcCdvR0MHUdtRc/Io0vq1YS4wj7eaWNt/V9tNCZJBiGVQNWAp06L6pQRaqb8h3KJ3fzX6TLRFWYssF2SuvSKhWSVg=;
	7:J0UqUneC2i03zq4d9LX2BziJVnPjF/p9ajRmZtL3iYrnRe5a+qCeQKBbJU+08hvOSTLJheEPJUnlyJmyIiMN7bjLybsP/xWeYQ2rKCTH3YbpbUK18I4dnB2WPFEy7SF75/o5CgdLirPpi13C91c+Jw==
x-ms-office365-filtering-correlation-id: dcecc0ab-b07e-4a5b-eca2-08d64f2edba9
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5228; 
x-ms-traffictypediagnostic: DM6PR01MB5228:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-microsoft-antispam-prvs: <DM6PR01MB5228FB003675D69E5487C6A48AD90@DM6PR01MB5228.prod.exchangelabs.com>
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
x-microsoft-antispam-message-info: 8fH0bwAJH1OKzw8fa9+R/UpvnEVv4ETi0z+P2ClxtluUmANqDRverbAK93jkJzWiCgl5Ultk58juIn4+Z/9SbmlAkFGY2c7MLzJ+BuIv6WNYFwNDuTNDvMTg178BmVF+XHqQldG1aOidw47VmVFkI7Xhbje7ra0kBvaDJ9GhaA1P6abXcxvTpQyljWHPNIJLZr2dZUAsdxr9WKwpmmInwVSUPvS4QIvZUL06EjAJDPuREsqJCRp+3Shai0rJhWjN9q/4IW0KT8MRZ+u54HxOjaxeimAccbTQe31wPw+iCw4U/SQfVxmJ7f+gvcxSBOfoqpc8spgqJL4tOn47A1ow1KuHtpnrnGaHB5to4cQP4kU=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcecc0ab-b07e-4a5b-eca2-08d64f2edba9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:39.4440 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5228
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.74.133
Subject: [Qemu-arm] [PATCH v8 06/13] target/arm: Implement PMOVSSET
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
X-TUID: eVS0Tkr5a8vA

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

