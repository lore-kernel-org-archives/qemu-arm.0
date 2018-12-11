Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp712799wrt;
        Tue, 11 Dec 2018 07:25:07 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VI3xbTUhKxNKJ1W/4vMMR6r4dvb1y3iHTd6PQnZ5g32bnkAQ9MG++yyq3Ch9ZcXAX0H5w4
X-Received: by 2002:ac8:892:: with SMTP id v18mr16059651qth.297.1544541907023;
        Tue, 11 Dec 2018 07:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544541907; cv=none;
        d=google.com; s=arc-20160816;
        b=XbM4kMDuE0cL5jTqBTMcb3VEGqQVlUT2QHjqdO5ca4dZzpIeHPrKtQpgzKD/M9uo0x
         ASDZKTxdtpvlq6BvOpSwi3nP2b9LA+myZ3WDaAxD/D1/GY2tAJX/GtZghV1n0SuD22Fk
         cs4L3Ww8skQZmnt64F1yrQBsoXC8Tx/+vDSM08R4lmgpoh73LSYf+dt+Lb78M2/5L1XC
         05ECWAu2AdWNBN1mwgnWP9OxEMW2q+Kb3G5JSHaED8GvLU0qn1XZNp74E/Hc5FIjuZ0c
         bOeYyma83940DNfzSUSkqCVWCRB1s+FC9B6gP371+0tDnWnIJCOPi9IR6JG/LuKkOfTX
         EqtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=BstglDGMeyOsdgDZUOh4p9Ojp3hsCaQUnpOjDpTd/4M=;
        b=lhItzw/136IjBfv6zltAeWp7NyPIIRYut5iEI6F/QJXRbxIQvVch8yp+V7KwiES/wD
         xpuWVwXqPOKm7PlvXoJQtqoP9FObLxD+WxKmejy3/yPUsKEMSRTeUGezep0mISpHlsiE
         2cYbuIbAxzmaMVlTbjlzZ20ZQDd7vAeULwttdbFGt3d6i4/78q3DmCyC6KUKQW7S1SMs
         kv1zessS6VuqEpjQ6LQr4cjzeDhTIV9Ig/uywpTaSsW6QKG6vMVP8JzZsH9qy6J1WWrw
         pvmtXZo+HvUO50rQ/ypACTeXacyLRx3PrcQ4UAfi5A5FElPn1/3mBc3WG7Uu8BmjU1vD
         eFaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=COORj8Th;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y47si625636qtb.175.2018.12.11.07.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:25:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=COORj8Th;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38647 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjuE-0007rO-63
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:25:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjq0-00046A-VL
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpv-0001XN-Qt
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:44 -0500
Received: from mail-eopbgr810091.outbound.protection.outlook.com
	([40.107.81.91]:4512
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpv-0001Us-I8; Tue, 11 Dec 2018 10:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BstglDGMeyOsdgDZUOh4p9Ojp3hsCaQUnpOjDpTd/4M=;
	b=COORj8ThvJoNSOFsX+ajhCVx4wSOTixAPxX463Yn5aiZu2XMji32Rgx6GoOVUtJspUoxQik1YInUwqQMbJeKHixHvOeygzZAxM7d9wqRRJ/4y4uEhF8pQcE2z7zkqrn5vJY05DFaJMTG6U1jS9gI8EPdYtodk/hCXzseLzgLvrg=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4601.prod.exchangelabs.com (20.177.216.78) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Tue, 11 Dec 2018 15:20:35 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:35 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 08/14] target/arm: Make PMCEID[01]_EL0 64 bit
	registers, add PMCEID[23]
Thread-Index: AQHUkWUQRH8xZH9xREycr7EcLyDkyQ==
Date: Tue, 11 Dec 2018 15:20:35 +0000
Message-ID: <20181211151945.29137-9-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4601;
	6:19DZh+jVtJU9PajTZ2VImwX8OQ8PnHW9l46UIRIsbYSyQMIRLoA9W8Bc1hZcVbIQRoTnZns+itXjhTl9psUx97OzYT3yBitKL0sMX6zuSsC3jagbI6ck+rGCRW4mPhdPn9qTSnIPNWEgNi2Q3KXLdOJBhARm/5Y4GwJkYsrV0tJ8SXdtd25/KgibWUdTR7TIGT+Z+2Jj7gOORaa0w3dlC7D3zaCXgDRIUP80oRoZsOwURT5YCLPdOnWgoQmSkJ/KP9QfAF+UgxZQ727TaeFe4J2ygvqZUEoaI+ihWJ64GWU/FoqcgxbhyIq7j9vxDnJLMPUZaUEYq9Pxr3F7QgI/lwHb/C5zmwfMmuLltyU0qWMp5zFODwRmUtO+wsGhZmkz1LNw/+FghrpFoQJ3yJn2DrZMAbDURHNCaBAbXDViTnFHtibY4fnDJlS1dJY23J/JGGkRiFCbFLD6h0D6cwGNXw==;
	5:perKSPqCiXYC2MaeCmSTmV4HG6f4GmYNw9yH26JX+IMOZYYuJGHyMjPX4pZLTFXif796pophPz/YQmnwjQKl1NIg4wPDC6vwxpT2llLKVMpFPH/IfH2F/qYxOs7l2laS12qZQUgOlqcztQgg/O2wAd/UAZVg0w7kzLdX2s7Bzu0=;
	7:8GKSz+jizfMh9zX7KxRwHRVKqGUBw83lWJvnfOA74Mmn7IR0MhfP+NR1YgDzsnNoElC7DcFPj1SpZbcn6mwNge3VGPXvJtNj8o2V5tazPAPCyLTnE08+vD5BG248fRUhEBtqPsq6ZADvD+to0gKO8Q==
x-ms-office365-filtering-correlation-id: faee882c-bb85-484d-dc80-08d65f7c32a0
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4601; 
x-ms-traffictypediagnostic: DM6PR01MB4601:
x-microsoft-antispam-prvs: <DM6PR01MB4601D2E8A1BE187C4BBFE1168AA60@DM6PR01MB4601.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231455)(999002)(944501520)(52105112)(10201501046)(3002001)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4601; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4601; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39840400004)(366004)(346002)(376002)(136003)(199004)(189003)(66066001)(54906003)(106356001)(2906002)(97736004)(110136005)(305945005)(105586002)(316002)(5660300001)(3846002)(256004)(39060400002)(68736007)(14454004)(1076002)(7736002)(76176011)(107886003)(11346002)(2501003)(99286004)(52116002)(6116002)(4326008)(6512007)(53936002)(81166006)(81156014)(8936002)(102836004)(26005)(8676002)(186003)(14444005)(71190400001)(446003)(486006)(6436002)(86362001)(25786009)(6486002)(2616005)(386003)(476003)(478600001)(6506007)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4601;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: FAcsK9F1Lu76v+NQylzgOqNDHdrxGF8kC0Q2E2qDHTCCasqmHe15eCj2Tzz4XeF/O3UTzVxP35bBLy+2hBPo/l4S/7SnRkBXJJgSgxlAqT1udfdxDrhI8wv0/bUUBsY3uixYhtRcQNxgfuu093yCvrTZolMiwwRTjQOXKhg6BR+wVL/vNllNICCKufDVbASm8GiJMXtt31Cmlc+jytvwBCgRKSEw8oX81U97M3Bk5LTq1bOQnFb8ctv3H3ZCF3n9w0HCkGgYsvkcPBKPTdYQgqT/147AIbjn4zNfTgB8btLqOje7lYTq8ZWRib8QwUV6
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faee882c-bb85-484d-dc80-08d65f7c32a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:35.2302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4601
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.81.91
Subject: [Qemu-arm] [PATCH v10 08/14] target/arm: Make PMCEID[01]_EL0 64 bit
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
X-TUID: wBkJvcqmvlq/

Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  4 ++--
 target/arm/helper.c | 19 +++++++++++++++++--
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2a64c1d858..ed3ec81d16 100644
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
index 71be6fb578..cbbd56858c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5256,6 +5256,21 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     } else {
         define_arm_cp_regs(cpu, not_v7_cp_reginfo);
     }
+    if (FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) >=3D 4 &&
+            FIELD_EX32(cpu->id_dfr0, ID_DFR0, PERFMON) !=3D 0xf) {
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
@@ -5432,7 +5447,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -5440,7 +5455,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
2.19.2

