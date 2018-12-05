Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9403556wrt;
        Wed, 5 Dec 2018 05:53:01 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Ux7b1Cq96zjdo2bfplWB/eUIk7078oRupBgc0KhWSbjYGwB1ViVEvdUcebkZHBpKcNCZlk
X-Received: by 2002:aed:2764:: with SMTP id n91mr23804894qtd.37.1544017981453;
        Wed, 05 Dec 2018 05:53:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017981; cv=none;
        d=google.com; s=arc-20160816;
        b=kK5rkAFmMJOkfHggG8+Ga0Uew/mHhlOnXr1RSqWSHf4fxSx6ouVAXOuNxSrRFZid5O
         v5EEB4V8cMAR+M2cRn/bvZgj7AJLXvSgPAarsnQ/aBCZA1CMhUAs54CDdQ9avYCWdeeh
         crlJbmlHDdbxCz2yVMRaxskLrCRThLjo2bkUgW1WYJpNc2Uf4I+rLXXDxWJ8bYEy02Yp
         0pcE4JxyZf0ygL2gRvB14Z2S6bj5zm6/P59YeCpwWv+HbFNBbSv6D7hFbyKPkWalaZhG
         KCueeCot8JIX4SjS0UQ4fEMII9iP3FDu8NJ4Tun7Ltx4/G6bByoOF83foWceXunkDja2
         818Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=JQZCAMCAOG+ioD8yKmSgHXWgxq//2AQ3Ao8ypO2OEkw=;
        b=TPdLe0oEhLYWZwiMN8KWwFhTqjoZwDlHNtfSnWiGC/8zjiZkdvH978M76zL1yu2QNw
         uNNZJbo7b5S14kDchBKOJTurjYBSTmHHTBW1TBvz1BDM1S6bWrBS3mzNEcVQESc1Hfzj
         1NLP5sgAeUCmmZbgxNPXjxrvhp2aRe44wZ7oUumf4YXADldxZ6sSY/lXf9ioNFVJHmye
         E+yS6ZaUJ4rWesbTcvfoHEyMBcuqC0/SJHCHDBEpiAoee9h6GtKkQho9FBjO2rNPAhf/
         0Za/gNNnBc6VZYoTEalz5sAzU9peTCCuIeVjNcdX6+FfFPUWGX4UwS0qaVqn5hw4GTJP
         5/Ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Cm495YSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q7si345652qvc.195.2018.12.05.05.53.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:53:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Cm495YSL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXbp-0006dg-1o
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:53:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTD-00088W-Es
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:44:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXTC-0005co-0X
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 08:44:07 -0500
Received: from mail-co1nam04on0716.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::716]:64512
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXTB-0005F5-Nu; Wed, 05 Dec 2018 08:44:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JQZCAMCAOG+ioD8yKmSgHXWgxq//2AQ3Ao8ypO2OEkw=;
	b=Cm495YSLBwcQtppOvrcpUIOrl2weTJtxqeNiIa1p+S0Xe7xj9Zq+W4HF7aI5UHyeOtmcW7lXAGN2MzYxThwIgwDOpK2hYrxmE0J3SeF1G3CHhD4tGdJikR84PFGni8A1f3JU8eGjt+LDJimdMVziXewkixfLz6A23oH6aTLzlV8=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4204.prod.exchangelabs.com (20.176.106.157) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.19; Wed, 5 Dec 2018 13:43:44 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:44 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 08/14] target/arm: Make PMCEID[01]_EL0 64 bit
	registers, add PMCEID[23]
Thread-Index: AQHUjKB9mlVV58tpVkyEdwuwq+dkTA==
Date: Wed, 5 Dec 2018 13:43:22 +0000
Message-ID: <20181205134243.4791-9-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4204;
	6:OJvarW9edQsMXqp7i8FDmOu1tHR4yxu7IoZ53/SxDj0/hI01ItuE1F8s+aJR9WHFpHi5XVRGm901H8W8sUqiELvWevfqgwfrozYxPVKfWdQ+f+C+fT5nj8dRXZX6ZS1EOtqVzHBR8LNZqvg2GjvEEsiHuS+UMReRaJ2f3x0WDTIzYTzFdWT7iHvWNsmkvYXxpMDcEuRagws2CnCqmkdPTP+SdPBiHmbjY1H8C02ADsoRuDsgl5PEQSM9d5NjIHVBo1BefsBgdbI2eJt6I+XrrQNiFvYOdHGssM+oWkOUS4KqsgKXwl5BDwrJja97mKleaOBLQIf68ywXXJW+VruuCZHgFPM5PORu2FRUXmJuybujICmrmXncHB/HMX5alq9nIn2zyTZY+ZZD8i3lz5HODTXPpxGSWKU5kX2H70iOeZta5tDu8YkVA/hR1f4GWAK+fFkcLwfMPuRVVpknJMD/gw==;
	5:ci111q7h65emRBaC65Qod2bAYMc+02h/z/Yt8OcZyj3O7AUiEh3ZSVqJtsZELTaxnWlPuxwTbpVrurQm3fyUMTwrx2trk6Jiz0n93PyplzZwTHfIdEk7GuMQOZk94Ymd0UnddNarQEdeNwNd5vQqlPEEM6sos+a+KJUK+adO1pU=;
	7:NWyrobNv3zW8znfYkaCtMeUjdQtfWthj6zjhA5z0h1EBGIIM/ltdx0uxOUs+w51KzZSz0cDdPaW7vkNBoi2tVrWOGI41lLwkDdJlEe/jMIcyY0joI0NfTArewLY3sSI+m4TmiYS9JiXUI71lVX6asw==
x-ms-office365-filtering-correlation-id: 4e5bad1f-1fa1-4aa1-4c9f-08d65ab79fc6
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4204; 
x-ms-traffictypediagnostic: DM6PR01MB4204:
x-microsoft-antispam-prvs: <DM6PR01MB42046D69256A165FCEC8B1BB8AA80@DM6PR01MB4204.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231455)(999002)(944501520)(52105112)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4204; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4204; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(346002)(376002)(396003)(189003)(199004)(106356001)(54906003)(110136005)(6436002)(4326008)(68736007)(14454004)(14444005)(256004)(316002)(97736004)(6666004)(105586002)(2906002)(8936002)(486006)(1076002)(53936002)(6116002)(3846002)(8676002)(446003)(11346002)(2616005)(81166006)(86362001)(5660300001)(81156014)(6506007)(25786009)(386003)(476003)(71200400001)(26005)(478600001)(76176011)(102836004)(71190400001)(99286004)(52116002)(6486002)(107886003)(7736002)(305945005)(66066001)(39060400002)(2501003)(6512007)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4204;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: tk7cpNbuzicKP974Zx5JO9sLUEtA68admLxQiDT8Z7zK8Fsi7PAJL3X1PG/yJCmT4mNPhmZRMqFXhuuxxJyIFfoKKDvyus3GF6PSMwYuGUqx7mYVxDMXbcq3+okEui9aMuVrjIzY9d2KrQ+UBZpguohIKP8cKeGTiqqxVfGnm1DYPaHQvghrWxrBMk8S3zyyYM/4VyJLT2LIAiqc3mrPK3yKwMzzOKw+F8UbLlVJJIpybyBp12hihpTqoeZKwCXBWHTA6RAy/gLQEPDhpRuGnK06aOXzzbZRd7kUx1XiuhzfFOBZztVDWrS7iB0IEDXwHzqcIbGiH3ccJHsNRMCpmsWnlrywiXsrJVVoxpvQDEE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e5bad1f-1fa1-4aa1-4c9f-08d65ab79fc6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:22.7623 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4204
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::716
Subject: [Qemu-arm] [PATCH v9 08/14] target/arm: Make PMCEID[01]_EL0 64 bit
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
X-TUID: hOI7z95R7Fqj

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/cpu.h    |  4 ++--
 target/arm/helper.c | 18 ++++++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 304e6e47b3..4216fe22db 100644
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
index 71be6fb578..fb6939e99c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5256,6 +5256,20 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     } else {
         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
     }
+    if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >=3D 4) {
+        ARMCPRegInfo v81_pmu_regs[] =3D {
+            { .name =3D "PMCEID2", .state =3D ARM_CP_STATE_AA32,
+              .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 14, .opc2 =3D =
4,
+              .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
+              .resetvalue =3D extract64(cpu->pmceid0, 32, 32) },
+            { .name =3D "PMCEID3", .state =3D ARM_CP_STATE_AA32,
+              .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 14, .opc2 =3D =
5,
+              .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
+              .resetvalue =3D extract64(cpu->pmceid1, 32, 32) },
+            REGINFO_SENTINEL
+        };
+        define_arm_cp_regs(cpu, v81_pmu_regs);
+    }
     if (arm_feature(env, ARM_FEATURE_V8)) {
         /* AArch64 ID registers, which all have impdef reset values.
          * Note that within the ID register ranges the unused slots
@@ -5432,7 +5446,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name =3D "PMCEID0", .state =3D ARM_CP_STATE_AA32,
               .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 12, .opc2 =3D =
6,
               .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
-              .resetvalue =3D cpu->pmceid0 },
+              .resetvalue =3D extract64(cpu->pmceid0, 0, 32) },
             { .name =3D "PMCEID0_EL0", .state =3D ARM_CP_STATE_AA64,
               .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =3D=
 6,
               .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
@@ -5440,7 +5454,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name =3D "PMCEID1", .state =3D ARM_CP_STATE_AA32,
               .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 12, .opc2 =3D =
7,
               .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
-              .resetvalue =3D cpu->pmceid1 },
+              .resetvalue =3D extract64(cpu->pmceid1, 0, 32) },
             { .name =3D "PMCEID1_EL0", .state =3D ARM_CP_STATE_AA64,
               .opc0 =3D 3, .opc1 =3D 3, .crn =3D 9, .crm =3D 12, .opc2 =3D=
 7,
               .access =3D PL0_R, .accessfn =3D pmreg_access, .type =3D ARM=
_CP_CONST,
--=20
2.19.1

