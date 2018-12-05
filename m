Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9398777wrt;
        Wed, 5 Dec 2018 05:47:47 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XkNjDmPejDf/3wIFRhmUK6H9HqSepdap8Fy4DJYdHLqGDIHFsbO6V5gcVbraOHvFVTUunf
X-Received: by 2002:ae9:c20b:: with SMTP id j11mr23044427qkg.211.1544017667148;
        Wed, 05 Dec 2018 05:47:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544017667; cv=none;
        d=google.com; s=arc-20160816;
        b=OEdMXPgmgDNeVOzTM4kNEx4yyS5ZJkjnAm2bjLZ2hh8V8OTG4KZWydI6vdzy39Uuer
         /iRdkVi3iOYFWjgj3+ucoMXOAPLE+81xxf1TOW7h+xPI38kjsOdvVlnkYSdQmKgazXTO
         dezHZtS9QhY0YrXlDQBQ4E1u0kwl8O6H1JsCeQVzGz+ib4d1Fx/fJN8pKK/tDiqAe3fs
         yB0Y2A4jGrlL8SSAHZOjXdupmX5iNCk+WnJNH0JFLcPb1OSbsPQljlH5b82i+r/wQxH2
         3zy8fQIk0u+TNXJO+pJ8kwtWE8B8EYHwNu/ewPkib7vv+mX+3BOKIOgQAVWPv7Iz/kD8
         eg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=0xIzYRJrbc3fHE1/VcFgSFiOKVg/UeNBmHtHrv3rCY0=;
        b=cu4MGIcqmV70I4A4ZpB/KJ9t42jTY0iJQf5hGfH3Lj551WILOjxpjW/1KbU0OlBLs+
         vA51ni8bRDRVirBzp/3tCNuv94r7HLLgT6t3W3AsgwpMQyVMekBO7vlBOKEtaucvAXmR
         qtJltn5AAXVjBvxRxhuGJBuq2JabafmIugJvVl7vCDiqj4iZcgHUuKpPEq7qv7+apZ5A
         4WSh8vUt/2RD6wD3f+mGPcYvLUs0jkzW52ORq6OIdBq6TyT8uhsIMF7hf1RcIKvS9Zqy
         orJA5qx+uwsgHrytEIhPma6om74P3/+H0LMEoFEJmUeK2GC/5agFVQ87zySb+Fh+oN0Y
         Zq6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=rh9TZDGJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t14si9647946qve.42.2018.12.05.05.47.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 05:47:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=rh9TZDGJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:34604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUXWk-0001xA-Jy
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 08:47:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSr-0007qo-H9
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 08:43:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gUXSq-00055j-Ga
	for qemu-devel@nongnu.org; Wed, 05 Dec 2018 08:43:45 -0500
Received: from mail-eopbgr700117.outbound.protection.outlook.com
	([40.107.70.117]:16181
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gUXSj-0004vt-JR; Wed, 05 Dec 2018 08:43:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0xIzYRJrbc3fHE1/VcFgSFiOKVg/UeNBmHtHrv3rCY0=;
	b=rh9TZDGJ8rFImjqEm+lJfY3uSUBViDfiOdKVxnzYBBHFkiSFsVWcSaFb1P7VAwSYGivfu9IC+nwzSjspUntl+sfdWyFGvU/cbVJjeXynoQi/jv6fD2npbpZVEWT+kHRXtGv3kvSC0YGT+R9bVDSVHdjE0ILZmElg/gBW26UrNHc=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4700.prod.exchangelabs.com (20.177.217.81) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1382.22; Wed, 5 Dec 2018 13:43:21 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.016;
	Wed, 5 Dec 2018 13:43:21 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v9 05/14] target/arm: Allow AArch32 access for PMCCFILTR
Thread-Index: AQHUjKB7Q0friNIiQ0Kxe79jB7Tv9w==
Date: Wed, 5 Dec 2018 13:43:19 +0000
Message-ID: <20181205134243.4791-6-aaron@os.amperecomputing.com>
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
	6:YDy3IBRDJmJLngNNNHpZ2PhUF6GkmwJJNKE+Vhc+nr9G/Rw2en/T5AfchLvugig+WuHzIghNNNn2UcpK1kPFMoFR8gn5Du5Hsfk93RI9xVvq0PipQp+VcXCOyCKiJY8KhUv55FAjN6MrWzmPsr/E6ShB+zvHvayYjZ++pR+WNIcH6aNcksdFRlcZyEFQhS3GD4eMHmcz6iTbIuT4Fl3ng6iqbYPC1crBwgIEzLL8le7P6+h2T/9Zll2FWE80Ya6O7Ll/l5InAqEyro3E3Q9Sx/l6+huO298BIjpFQiCE84m1S0lH3dIFDu4RtoXDG15H0Q2fwXb2nOpuCiLrdPO3gh8bd+i32Pfp316XTF1cSuTWhlgsvszjQuW3GzCiJP7HwhZjMNC92LnjFjjwtxqBI1G2GtHHUdpqZ+XF79YPXkQD4I2NZR0LtYbfdmxj5O4d4njRHyJ+J/wEgirA3nQ7kA==;
	5:eKFwX+t+ZU5E2u5zxVnOFB3jvyoGBFRh7NhpRjfjRs/jntNt5jof2rams4msxJo2PmluXcebnAhUEDtw7BPxPN3GoU0LHA4nmbp6GV3XHyi276KWmzgK7imy4j2Y9b5arsbIgMYB6dMVgT0GPRxbCY71Y/GiNGNg5qCYFjeZHpk=;
	7:1do4fDnaWtYWIiUkhBXy6IglLfolCe2oGFLWfU1Xp0l6EpM4r5sAD5ozM68wXTuvA//OHiriwvV11VgGOcsxzKH2ObETkEjHRWoL+TtX5lowtWBgtS0S0IlH6Vo0/IO/Ky2TvKPqWVcQl+ve5G/Wsw==
x-ms-office365-filtering-correlation-id: bd7fc919-2838-47da-3c71-08d65ab79dcf
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4700; 
x-ms-traffictypediagnostic: DM6PR01MB4700:
x-microsoft-antispam-prvs: <DM6PR01MB470071DFD710A7AEB851325B8AA80@DM6PR01MB4700.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4700; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4700; 
x-forefront-prvs: 08770259B4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(366004)(136003)(376002)(346002)(39850400004)(189003)(199004)(386003)(2906002)(6506007)(2616005)(476003)(97736004)(446003)(11346002)(486006)(102836004)(14454004)(26005)(99286004)(106356001)(3846002)(186003)(6116002)(1076002)(6436002)(81166006)(81156014)(8936002)(54906003)(316002)(86362001)(68736007)(6486002)(25786009)(8676002)(7736002)(7416002)(110136005)(305945005)(2501003)(71190400001)(71200400001)(4326008)(39060400002)(76176011)(66066001)(52116002)(53936002)(5660300001)(256004)(14444005)(478600001)(6512007)(105586002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4700;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 3mtbD4nXzsgLjdQcXjueUhyOOlvrjuvfaIa8RfdxcnSRV0e71zLsi7ipxFYs/13STQdEqaRMyech950bjxx1mYsmAAESJIYDeZizRr09d6Pi46wNOOlbYVVuMVeBNZhxdcLM4lGdHQIJI2gF9NOKT0q0s4b/oGE/uzdTPVtaLYDXbdcePaZi1m13Vx09LSv7/1V3kU4VLh2FKVsu3GYnMe2ULLiP1WeSJUR60BYY1hn4unOTTUA9CYiXU/Ca/0vraXL3RSc1OQvurrYsZhNEcIyFKQ9CxcBU/nFg+cRToTqtfjZczcI0kdSMcsq7MrC6g4cqMy9xLq6Cjzh9vLKoxv9YmnjrDmxKjoYnCDf1SBY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7fc919-2838-47da-3c71-08d65ab79dcf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2018 13:43:19.4498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4700
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.117
Subject: [Qemu-devel] [PATCH v9 05/14] target/arm: Allow AArch32 access for
 PMCCFILTR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BeQHm6iKy8Pt

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

