Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp717926wrt;
        Tue, 11 Dec 2018 07:30:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WWKlSqem5tGeTLw9vC09zKVzgqgI8MAI6e9CfnNkyaxqWuboEUXv8+8ma62KR8hJMtSP5L
X-Received: by 2002:aed:3eac:: with SMTP id n41mr16374290qtf.196.1544542209904;
        Tue, 11 Dec 2018 07:30:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544542209; cv=none;
        d=google.com; s=arc-20160816;
        b=B3PKU2Ka+OHOSIUqAPsj8O+D3c24Uoc2+jd8nbciscp3h+vxFs5PVNUuGl7bqzHqyO
         NTCTerHgJz2Iy4y8vYhKS/nPrDkc8/Ce+Rt+xC/+ivRBTDihfk/YwvbkURy/n/ZY/JqA
         nIGZgjWFTJWv70nJd55VfUtrOVjfPEQcIx+yvmkLnhDaKJVo9knntZGYiXjwvalrP+J8
         ILCgTCATUzwbDz5l9leVT1SycuuJuDLwiNBLDJqRLW92aM8MRZs0CjKcHibrDvp7VzU2
         UWk3oCQ3lR1ApPlZ+xkJD4tTxA38Mm1yysSfA+nRlQEAYDuDsdBs9XQrd0kPrgYl2LQG
         /5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=pGq08p3YHvPWrndSn5oZZbnHS6W0/LYuWqc1GxqE9hc=;
        b=ZJC6kUdjYw1JFnXVfJW94u/Se/1STqWzBsG46c/AczJKPnPvpKfODA/Kfa+6T2qIX4
         MVhpr+JXH8MYwufvJ0Hipy5TilLCfujUSvuw5b4PaJcCR3iq9pZqGa14kOnXsOgWtjYi
         3w7sBru3OrA68Fhk3AvXdb7BewZIRbtX8se5cea/jgtN17HtIbqS6fcAbLmM30EmSMfu
         iFIhxaREeeY8D5mAmMabJ3xhoJ3V5+6WezPVwIrzzFY5ber8u7ReoATCm9BMBmyfIyfl
         m//C6M2AYSuitqz2vBifdrf/NAg80hJt95pWtWhzRLYBXfhBfiIWci4UVuIz9h9S+Ug+
         hoiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=FXFB94ah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q31si1332820qtj.66.2018.12.11.07.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:30:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=FXFB94ah;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjz7-0003yO-9S
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:30:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjqC-0004Fq-8c
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:21:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjq7-0001dx-V1
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 10:20:55 -0500
Received: from mail-eopbgr800102.outbound.protection.outlook.com
	([40.107.80.102]:11923
	helo=NAM03-DM3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjq7-0001dB-PN; Tue, 11 Dec 2018 10:20:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pGq08p3YHvPWrndSn5oZZbnHS6W0/LYuWqc1GxqE9hc=;
	b=FXFB94ahDMK8FA4B+dVKCpcZ5aN6vvTump43Q4Y/G+0rcy3GrEfBW7hazIet9LZFMbn0CAoo+Jm8PFyZm5UmpMve9+Dv9pKpXN/Kf8861yY9oND1GxEbQTmVFtqFU9nWu1rq5FDSu6gIXvPlPeEfX9APZ1ospVmIzf0V1bqv7oo=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4601.prod.exchangelabs.com (20.177.216.78) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1404.21; Tue, 11 Dec 2018 15:20:49 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:49 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 12/14] target/arm: PMU: Set PMCR.N to 4
Thread-Index: AQHUkWUYWjeYOy/9s0KtpgjoZvT56A==
Date: Tue, 11 Dec 2018 15:20:49 +0000
Message-ID: <20181211151945.29137-13-aaron@os.amperecomputing.com>
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
	6:AP/ZCFcnlraX6P7r1yK9APUXmjrd7Ee2Jiw0L0PlaDCkHt0GB08uty/WURhrTVwxu4ha6pbqEDnY9Z2k1qHtlhXJTIVIko5j0kMGKngi68Wi3wOiILgjNHHqVLxfh4mxUPHs+mWJUlXwUVY9kxgKQBiY58MEIEDo2ElgrzDlyfMHCAkrIy2kRvtJxyV2ujam9H+5+WJWYJ7RQwPJxdK21wKyJkOzNYhG8kjzL+pXSpdRorINiauPt3YAAJnv6d9hTKaGYHseOnD/NbqcAnjFLNFHmskmFe/AG2iJqDP3LRRZvd5byZFGWnYjBBzw+Q8v338D34TXNFcw9bmOn/Gsq54T/6pmQF1aDCBIeh30fOYdbwSvEpnRYKJT3JXkB/jcB96Tuv/l23F0o/0YOVoLwJsbXpFV1TqxUCYt8nIuuPBfEIqMsuknJY3vUhAFlRnmLfabzhNNXAkqaKnNk+j3nQ==;
	5:QtdY9dxD9tiRtzBQJXEsCzDRiwceMKjRT+A3QPlgH+vUOGPWKoTiSLsYg+bGa/tKvypMNaeckdvQKJ52Ul/DCiDgNYBxh1xKIt5B1Vt6BJLsjPwisb2yGvi1X/N6HAC1jDN2h8frAym7KmoUpQTuvAGtrngJVpVYwtDjFzq4sFQ=;
	7:sPfZIdzwPuGxkgLxoybThRCFhwPkRfTrA7vi5+zXqf/tydtBkFxEk/PFBHIN5K2FNVlZ9ueW7RMBsYczaJwLZLQoE5y+m6fXBpsYRA8jBUln92sS/noPK2kF4Iau3kg0UhZ92LBV+m0mHjs9eGa4Tw==
x-ms-office365-filtering-correlation-id: 0fda9599-bff1-4a29-e05d-08d65f7c3b3b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4601; 
x-ms-traffictypediagnostic: DM6PR01MB4601:
x-microsoft-antispam-prvs: <DM6PR01MB4601041966ECE5B29D0BFFC08AA60@DM6PR01MB4601.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231455)(999002)(944501520)(52105112)(10201501046)(3002001)(93006095)(93001095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(20161123564045)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4601; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4601; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39850400004)(366004)(346002)(376002)(136003)(199004)(189003)(66066001)(7416002)(54906003)(106356001)(2906002)(97736004)(110136005)(305945005)(105586002)(316002)(5660300001)(3846002)(256004)(39060400002)(68736007)(14454004)(1076002)(7736002)(76176011)(11346002)(2501003)(99286004)(52116002)(6116002)(4326008)(6512007)(53936002)(81166006)(81156014)(8936002)(102836004)(26005)(8676002)(186003)(14444005)(71190400001)(446003)(486006)(6436002)(86362001)(25786009)(6486002)(2616005)(386003)(476003)(478600001)(6506007)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4601;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: sskyGzMldK2s9RbhEIYAokt54eLN/Uxnmj4NRauxxD5Wruvahzvl2Q66U5Gbq1FSY1pzt3rxdSlt5u7fnat1riWswNFt+iWTFzZXUT8cQhfJNKbIBNeyqZ3nF3yeKRvnVZnm6XnF6yb0nqb17D1SWkF2y9bnvl0Jf9LCPYd0jSzSjYO0bcpzu7dlRm+OJGX5bbByD5SpHkeLrpV8GtQ2auanOsLw4sUs40sbNowIA2Dd3KuzbBDOyHqDRdRNbqJUgolTNMLhKw7hQ4+9lxLf48BpMYRXJPGqXS0CwW7Ukse7dbnGR2+4Tlj+gTgUukrA
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fda9599-bff1-4a29-e05d-08d65f7c3b3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:49.6523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4601
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.80.102
Subject: [Qemu-arm] [PATCH v10 12/14] target/arm: PMU: Set PMCR.N to 4
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
X-TUID: E+LdY2Rls2U6

This both advertises that we support four counters and enables them
because the pmu_num_counters() reads this value from PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7e81473405..af09f757df 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1768,7 +1768,7 @@ static const ARMCPRegInfo v7_cp_reginfo[] =3D {
       .access =3D PL1_W, .type =3D ARM_CP_NOP },
     /* Performance monitors are implementation defined in v7,
      * but with an ARM recommended set of registers, which we
-     * follow (although we don't actually implement any counters)
+     * follow.
      *
      * Performance registers fall into three categories:
      *  (a) always UNDEF in PL0, RW in PL1 (PMINTENSET, PMINTENCLR)
@@ -5502,10 +5502,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
@@ -5520,7 +5520,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
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
2.19.2

