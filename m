Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1069058wrt;
        Tue, 20 Nov 2018 13:31:19 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WfqbOuj4C7YetSU4Xt9NKlzwO8ZJL9i1D8FfS1ddsCAbe77PWhMoPNFhV1BcyxFjcB1Dy6
X-Received: by 2002:a25:5955:: with SMTP id n82-v6mr3725177ybb.337.1542749479254;
        Tue, 20 Nov 2018 13:31:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749479; cv=none;
        d=google.com; s=arc-20160816;
        b=cDZsUR2S5zv24K68kK9I9USAPEtEQhKiYB2iNyzUJNiCLx0dVM7+UORdkJbVsBBc+J
         L4uE2IeiJeTy63VFgN5pum36H+iHSjwfYAmkJ35S5O58PoptsosOPYCOuROWXZWI0cnl
         fqSR1TVKZ1TVG86OP98SlDvE1LzjTv/APoHe/BCkyyfJYkItFDJccetdv3KaI1ptzij8
         SjmbAprg5Nv+IkpInqQdoLy+nFb6kQ7fwf4sOgee87GMItWs2smyMrtOgHjHMVJcoDue
         2Ycu6jDVOjKPJcalHHd5aZKTw9PYjT5AxQDa+krA7SRvRrBALZVftE7Zg6R1s1Ag8zZX
         m6Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=lUfDHk0s+shvz7OJtogLRCV+QPhYazBl3f1TO2/weWE=;
        b=GLt6nYY5JGMXY0mL92Aq87YsCiTi2OVoBCrNEg5ozSE7QSEtOsnQCrT5ARgO9YIhOs
         Wp465puQ1KmieYfhDipg4AMfTeqwECGeZ6iRU2fJH1tPtha48v2TxjylcsZxA5cSVCJM
         gqc2ZfiFF7GEtuT9uHN7kHBHGuBmlr+3zejBOpX3Fq4c0DK0O/KBkpRISj/OrRH6/WA2
         EiHK0XzqtM+2LyFmaiFkEyENPGeU4c0KLjbYOTUqprw7V+nzWqt4M3s1h1efSh0mxUFv
         mi3NhlsywlODfK2TqvZsNhShB8desg9yZNqkxmRd1Gr+22VFZkx2lAGsSH53KQz35xkx
         dd0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=sSUqHpAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k40-v6si27062975ybj.77.2018.11.20.13.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:31:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=sSUqHpAm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDc6-0004Og-In
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:31:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXp-0000C5-Jx
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXl-0005qT-Rs
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 16:26:53 -0500
Received: from mail-eopbgr760129.outbound.protection.outlook.com
	([40.107.76.129]:22624
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXl-0005lc-4A; Tue, 20 Nov 2018 16:26:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lUfDHk0s+shvz7OJtogLRCV+QPhYazBl3f1TO2/weWE=;
	b=sSUqHpAmmtVfdQzoP2HcqEAyK8cLJHtmT0c/yvhn2SsvxI/9GxgF/RU1+vYS3/pCrvhTdwPA30aAe6hPd1wGGRmOw4k5xb3rcoqm7OqE58L7++QtEi3O6TvfwUk4P8xgEalcoIS59RpRneVl8Xqcd5OalvYVMk0MY5KHr4gFoas=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4651.prod.exchangelabs.com (20.177.216.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:46 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:46 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 11/13] target/arm: PMU: Set PMCR.N to 4
Thread-Index: AQHUgRe9YdUZEF5OKkKRIPjMBxZNTw==
Date: Tue, 20 Nov 2018 21:26:46 +0000
Message-ID: <20181120212553.8480-12-aaron@os.amperecomputing.com>
References: <20181120212553.8480-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181120212553.8480-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR04CA0037.namprd04.prod.outlook.com
	(2603:10b6:903:c6::23) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.155]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4651;
	6:f/X2+sKT7BOWPrYEEjRzGnDMPcCHg93dXl/rLyaR6JR0O+jHCAED6eaJeVCFnvpaSz6c0lPQgcbuD584rW0x1fHkrYiznJEe/qiir6UizoCHh8q5SjoWKz1Cr0WDYplcz2IyFoG612WClx5kDhR6AUzdnCfVmRoSdNY3li4kE9ZhH1TahAp0cI4DnFz74awIiLQMjhNYgoLQPvucwD7anMMMYparmp5F1cHWFPGaXZVbcLOdEE4xCvA+nXLU02LCzNkWiLclZzV2S0eWIAylknH9yIeq7BDRI3wU49LUIZps1yWZM6zOBQDXMPbYgnno8fr08OXSp0ZGhTa3fThKQl/0Yg7gzcDV0lc2Xr9lXOk+WMsT++BCcWet4RQLqbhvAYbgnJN1f4UuzrN4GVkH+XEFNNBGkpjhZMn8FdfNYaDVrLLdVDotJp5eB3l0PVRGGr68TxeW2bDIk5/iXJvbFw==;
	5:jrBzKLgjdZoFHWXWzSDO+1Uf1UjXxpJ5fP/E8uz+HUyu0jYxrPVOGgeBv1H8BYpVne/QYGYBgGx+uvqtwyppbsS1ICkLtnr+e1YsilPSMhSaihPHaWZ72cIPCnsp5rVwmvMP4QsxnBNq9WjBddZB2zDErIsn74Pq3tSrf2qik6E=;
	7:8cZHjbiqEdJrUy74PZ13CwjotZeVkwrfrrlR0SRekeormD6uVTXwMVbFc5ZzOJZ92YKeeWYgc3zdZSLtPvA+Uo7BjNZGWCpRj/8ryUutOmjGjqwe7h6x8gCWDxpu708HiTfLsItxpdXKBjFPSUdCjQ==
x-ms-office365-filtering-correlation-id: c6febe83-4203-4d72-f89c-08d64f2edfc2
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4651; 
x-ms-traffictypediagnostic: DM6PR01MB4651:
x-microsoft-antispam-prvs: <DM6PR01MB4651285599620495566847038AD90@DM6PR01MB4651.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231442)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4651; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4651; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39840400004)(189003)(199004)(476003)(305945005)(39060400002)(71200400001)(7736002)(71190400001)(4326008)(2906002)(3846002)(14444005)(6116002)(6436002)(1076002)(7416002)(14454004)(256004)(316002)(2616005)(5660300001)(486006)(575784001)(11346002)(6512007)(53936002)(86362001)(446003)(110136005)(54906003)(6486002)(186003)(478600001)(2501003)(66066001)(26005)(102836004)(97736004)(99286004)(25786009)(81166006)(68736007)(105586002)(6506007)(8936002)(386003)(81156014)(52116002)(76176011)(106356001)(2900100001)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4651;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 4+9XOBul+3h3TmaYPEtImtsXLBflD2Y1w4gLADryJYihdk9WsocsG8pOgyBjneOnVk29hkowl+IM79yBfqX97x8iizxSnHdreKcuFf2PfPjJ1erbm4Ieh4sGza2NU/ZOK5UyRtyBMeYExh2hZjkT8UVJUxI9O6p1m36KzpUXKg96+Rnb1RaCkhpDhB5AQzUOT1nzl9OAhYPzGfzzR7VbC7n/vPXg0YJI1cQiCkOeNexTpW5gvybxL3sBVWm/ubjspvPvkdrll7JSR2USDB6NLLeGy78fGTas77S6j25iw9FXUHY8DRdzwcZCnj2RGPwmYMD08YsOpg/R/USXNVxkIIkDoqHJSwTa1nkgU++9s0c=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6febe83-4203-4d72-f89c-08d64f2edfc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:46.3190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4651
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.76.129
Subject: [Qemu-arm] [PATCH v8 11/13] target/arm: PMU: Set PMCR.N to 4
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
X-TUID: +F/Apqye1Mjb

This both advertises that we support four counters and enables them
because the pmu_num_counters() reads this value from PMCR.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 6e5f00c0d5..b8462d429a 100644
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
2.19.1

