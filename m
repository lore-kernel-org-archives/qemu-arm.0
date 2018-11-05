Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2949266wro;
        Mon, 5 Nov 2018 10:59:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5cKpL4TDXFYNbj+JMFiTF0k7iMwK/46xoXef1mGjeMCZF5ehoLC8+TF56jCSEloNrBBd5MD
X-Received: by 2002:ac8:6659:: with SMTP id j25mr56730qtp.371.1541444348675;
        Mon, 05 Nov 2018 10:59:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541444348; cv=none;
        d=google.com; s=arc-20160816;
        b=em+FHduFucjVas4gAX0w2Xnciil97iMcKQi3Ylk+TiMF5Ms+ygUK9TyzX9nXANKmw/
         tprcYp6XakAf+rvw6EtJivu+/vH0X1iWea+bTPC/+y1JxyJp55GVx9Vtou08eZl1SOQO
         LqvO8Jp0LtWZ97rYJeUtZ34Zkxng9SF6Gx2E6A/eN9RKuaQopYJvmdll412bDDsVFgx7
         VJUao18UcWUmUA1Uu1DtDLN2nHaFq0LRbQQehRPkZye0z93MlL4LVJRawAXn9Kj6djP2
         m3BfuUg9vK5WOSKN5+htcOSY7p1B6PMGof6MwL5Um+W1uNg8M3w8ekj48RPE2s06G3mZ
         jaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=2CztuA3sL9gunx35yyGL0HAZd15Mu8hkkma3f+cUywk=;
        b=mU9iemXEu92k4ChUvXljN4jNGHfMFOpdiuuHhWbi6NODzOfhzE2xUn5zQ9RG2dQmti
         wXfN4xOFPxcqcZHqmeWbdGwprHz3FRsqK633UKNhhbB4vtk6k0s0X2jr6NGdmMk0b9Pl
         WAkDWwVXscALVFhzN0FWAHcZUXVC0wzWZf0+Aod8FHisiYOKcR5bBIUeJYp7X3ipF3/F
         YhYRYwmdWGTE+tj4rJZVg6Hgb+1jQB2igNEBkTNCSdnODvFEHeWKbQHflcb+Z1M6D9H5
         lbX1yDtjOP/e3ntCh3HEfBRSWzefqu2RVpuZVutBSYTX20vW90/c5nryuWSUmbCG/jct
         P4bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=d29KVCLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h21si2458987qtn.354.2018.11.05.10.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:59:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=d29KVCLb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJk5c-0005ZA-6p
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:59:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjzI-00055v-EG
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjz3-0000rh-Hd
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:52:32 -0500
Received: from mail-cys01nam02on0099.outbound.protection.outlook.com
	([104.47.37.99]:43926
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjyu-0000UT-TE; Mon, 05 Nov 2018 13:52:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2CztuA3sL9gunx35yyGL0HAZd15Mu8hkkma3f+cUywk=;
	b=d29KVCLbsAw/OGl1JxM/6JHxhIwYev6Xj3xFdKSL8yN7V90yePYC8GJynpgVzKbFdMN7bwxjvOXxqgCVfBn+ErwNMXbXxxvV2RvD32iJ85B7YmjV8iKgUuqpv6IDMkxZ+cngTlWF8kupQZLbjonHeE5ETpI8f9qPxoTdAqnhDpQ=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5194.prod.exchangelabs.com (20.176.122.31) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Mon, 5 Nov 2018 18:52:01 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:52:01 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 10/12] target/arm: PMU: Set PMCR.N to 4
Thread-Index: AQHUdTiipmLYuvQQkUWlgSTv/s4ESQ==
Date: Mon, 5 Nov 2018 18:52:01 +0000
Message-ID: <20181105185046.2802-11-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5194;
	6:R5eDJLG2TZusn5me92JM4Xz5ozmuhbF9AOhRxGuYLQ8vZMnLNg9pQF6DQjFJW/ver1oD2EMbPVMsaYux6zyNKHQtYg5hiHAL+9YthJTyDlrHKLhBRi/f52F1ozN6T9IjLeWUdD1eoIUOJhIaaKflfEZmawZ/rSxIBVFI7QOciBkjLYizgikwEziPylfOPfJXHqsT3TjwVHb/rjaqnBbitfICdcpAVSrYk9HaMjvruogNEiKPzC6J6UU79xQFyj2kQGZQ6yHkIEX52EIHkje1tcKTz7iyZwXOIDX9PfFfsG+ltu1/WjxEIWCia11pLx90VKlSJDHZBVaccbriZhtiSO7SZvNBEO386iyoH/qtVUw4tJsB0P7EsRWMPVfJMJ76j4P9n32W/GVFxz1r5xVDBEp6nai1Pz5N6OjQ8ZdnG+S9O8RW4A2NS/f+YAYyJMwl38EXQFvx/1zpXUVYHf2NZQ==;
	5:lwEBzGft+rpm1m6g4/X7oyJ1PuZCg7na++lfh8Qti64B3R7/EDBGUquB+ih1GUOTZkfMwYDW7Mun+cLLPSRl/EqGOuspoyczU5nnLGMCN3NpeYEtQxLksJILNGjuWRkDvxrB22S49ZXfrl/sNBkETALzVvvV4gTLS3Rj3ed4Me8=;
	7:5vggkWYAA4UEmYXycaZmwEcZuTIiFAYWMcJnzaX3r8GPa5206E635ZeZwr+x2ItfkkNuXSkU05aVlq3hEbKPHr9Iv7XZXX7vQ0cwSWWSbEovIb59rEQ3HViSK9DpM1XGVhKIE8ckWbN3PKb1BUdoTg==
x-ms-office365-filtering-correlation-id: 35e15671-c31f-4e5a-8744-08d6434fc542
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5194; 
x-ms-traffictypediagnostic: DM6PR01MB5194:
x-microsoft-antispam-prvs: <DM6PR01MB519464FE59F113F0A75275928ACA0@DM6PR01MB5194.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5194; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5194; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(979002)(396003)(346002)(136003)(39840400004)(376002)(366004)(189003)(199004)(81166006)(81156014)(53936002)(66066001)(6436002)(486006)(6486002)(6116002)(14444005)(110136005)(256004)(25786009)(4326008)(54906003)(14454004)(7736002)(305945005)(106356001)(26005)(105586002)(186003)(97736004)(39060400002)(102836004)(8936002)(2900100001)(2501003)(386003)(6506007)(8676002)(7416002)(476003)(316002)(52116002)(6512007)(2616005)(99286004)(76176011)(5660300001)(2906002)(86362001)(68736007)(71200400001)(71190400001)(3846002)(478600001)(446003)(1076002)(11346002)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5194;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: W5g0ouExxvtHLYr2vsx99LvvTGE97j/4jJHR5YLLSedjaBoLZBiSrWXNvPVoEEfI/oCCHvhUFBsBMQJ/KJySxNQDnutkO0DyGyn4HkuLCWfKqH62LkZqU/cib7t3syB+WgHNapN7Gw8zD9veKO3UNmqUqP5fDwQARL175d8wFuJKwptisNHhxHUrDX0e3dxyB9Yml6KoBathjSWHS0uyQgakTs6lqWx/5WQnMWXeRkLir7D/6B1JUiCdRIGlxAqj2s0kBJCUO1gzUg4F/Di1r/Ku0EZdEBrp4p+g8TqjY4HxJULFvTWUOvGRHAXoLJfeI3wXi/jgIz/eOIowYF15bBqP1BxvP3rmR0wNhdrGpw4=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35e15671-c31f-4e5a-8744-08d6434fc542
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:52:01.1943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5194
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.99
Subject: [Qemu-arm] [PATCH v7 10/12] target/arm: PMU: Set PMCR.N to 4
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
X-TUID: qqVOJEfaP+i/

This both advertises that we support four counters and enables them
because the pmu_num_counters() reads this value from PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
---
 target/arm/helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e3ec36490c..11eb62bdda 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1753,7 +1753,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .access =3D PL1_W, .type =3D ARM_CP_NOP },
     /* Performance monitors are implementation defined in v7,
      * but with an ARM recommended set of registers, which we
-     * follow (although we don't actually implement any counters)
+     * follow.
      *
      * Performance registers fall into three categories:
      *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)
@@ -5508,10 +5508,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
     }
     if (arm_feature(env, ARM_FEATURE_V7)) {
         /* v7 performance monitor control register: same implementor
-         * field as main ID register, and we implement only the cycle
-         * count register.
+         * field as main ID register, and we implement four counters in
+         * addition to the cycle count register.
          */
-        unsigned int i, pmcrn =3D 0;
+        unsigned int i, pmcrn =3D 4;
         ARMCPRegInfo pmcr =3D {
             .name =3D "PMCR", .cp =3D 15, .crn =3D 9, .crm =3D 12, .opc1 =
=3D 0, .opc2 =3D 0,
             .access =3D PL0_RW,
@@ -5526,7 +5526,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             .access =3D PL0_RW, .accessfn =3D pmreg_access,
             .type =3D ARM_CP_IO,
             .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmcr),
-            .resetvalue =3D cpu->midr & 0xff000000,
+            .resetvalue =3D (cpu->midr & 0xff000000) | (pmcrn << PMCRN_SHI=
FT),
             .writefn =3D pmcr_write, .raw_writefn =3D raw_write,
         };
         define_one_arm_cp_reg(cpu, &pmcr);
--=20
2.19.1

