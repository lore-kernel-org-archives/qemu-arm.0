Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1066315wrt;
        Tue, 20 Nov 2018 13:28:27 -0800 (PST)
X-Google-Smtp-Source: AJdET5csBoVAWiajOL0Pef11AOtcEUVGIdioDuoK96Somr4W8wjf5rjy/P05FLpHPSdbHW6136go
X-Received: by 2002:a0d:d005:: with SMTP id s5-v6mr3894453ywd.113.1542749307552;
        Tue, 20 Nov 2018 13:28:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542749307; cv=none;
        d=google.com; s=arc-20160816;
        b=YVu8MhN4DecWj8pXDCf48FyGWejEtXFiI8sO3ks7S/P7tkOYEUL2ddV67rJqpuNnGS
         g6ascq+05oyCUuil/KCZxQvdWfBKy6i74rb9WQAIKqgecuSpIgo9Rwm8KftjEro/FGQn
         yoDNAF7C+5h3Al+BpX72G0LpSgqjQ9m4SpdxvJvrzBrCL48MHFHwcHIgM6tY+zzdiGai
         FbUPkwMyYklEcPNsKEdvR/BqZdNEoXRTZRo6vrh+qnpmV+NknkwDpDUca4DoEkk/kIG4
         4yj4n7T5LbI7mCwlf49RhnvXKvF82T2sCffjn0Yj3BR3EHp+t8phHH9t48eEQMrZNj+/
         sKLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature;
        bh=77TgK8qfniKFrBuS+BvSZTBeQHpRnIoouBk2bJmvQss=;
        b=v7HO9gUqWz7gZ/VvG5arhGWzIfNxQQmtC2Y3Iz2UFvsaiCUca4e3T0GTB653t//Ss+
         E8yo944yH+xFIBMvoQHL7hZDB1V/MSIxXFo/K0IKuz4t8oLbmt1/b2rq96DQsXMt1100
         wgjOl3eiK7g5oXwyPzkNoCkktAXZzPE4t7pxlxvkT0hbKliT/dI0UOGG2Ttv/X26aLbZ
         lxwmw5LAR/rOzDXmOPyTveYB9dQOkPg5S0m6tF7rNwiv6J0dUNxadDjafHpRNES5Xmbo
         MbUl0CU3oIbmkVFJuXiSliOpZI1Io689PSyfKVYmvH2R3JIejzvKfuYdYouUzf32dJOF
         gMVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=BCkmUgNn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r66-v6si23977162ywd.310.2018.11.20.13.28.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 13:28:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=BCkmUgNn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:36006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPDZK-0000kB-Sl
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 16:28:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57631)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXj-00005u-DE
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 16:26:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gPDXf-0005a7-FT
	for qemu-devel@nongnu.org; Tue, 20 Nov 2018 16:26:47 -0500
Received: from mail-eopbgr780134.outbound.protection.outlook.com
	([40.107.78.134]:13440
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gPDXV-00050G-Pq; Tue, 20 Nov 2018 16:26:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=77TgK8qfniKFrBuS+BvSZTBeQHpRnIoouBk2bJmvQss=;
	b=BCkmUgNnccX9YH/xnB49Qux6G9PBtdLbjobEfJwb+NhMwvxIiiR3k2IEq+ImYAlzauXPdtrwEAM8JFg7b5VrP7U7JrXcqk2fiU+ZZeW8mtxXwBaTMuShKJZq34/7iIZnr7P3t9QiSv4JPZihS8HPODcyZSS61i84Ev2srXLOusc=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4651.prod.exchangelabs.com (20.177.216.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1339.23; Tue, 20 Nov 2018 21:26:27 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::d5ed:ce81:19eb:c9ea%5]) with mapi id 15.20.1294.048;
	Tue, 20 Nov 2018 21:26:27 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v8 00/13] More fully implement ARM PMUv3
Thread-Index: AQHUgRexjmsyHWZNZU2jFJaV8GxPCQ==
Date: Tue, 20 Nov 2018 21:26:26 +0000
Message-ID: <20181120212553.8480-1-aaron@os.amperecomputing.com>
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
	6:j0Vycue5JAUW3kKoF4wml5La6WA4FKfW6DXUFfUACU9roUrIMedOUrlz0f3a+2oEbA0Zkp23O0YF1LAaB1OGDQcqTgVqzNq4qH3tZXa4ZApgaeC6Sr7AFpJyS/KFko9EPODq9HSZxCLkUKXLNv+fbkmd4ct3pvcfmBiySRWyEt9kU9PWK7dS3nWRaCAIIxqvccaweoTfyNnNkiIwaNYo1BLtpGCof+Gu47jwd/qX+AG1binP9Mk4TVA/4wQPouniptq1Z2IlAXorxSXP9NY/wvrdk30p0rYtWUjSWgBWB10h8oMFbxFkjPdmXZj+ZYyfd8j7PmccO/2yh++JYLzh17DuTsPfAKUCyKWcTJIyBXpYLwFiWOKT6KmqdFbe3Cqy6+Q/sczYI61XO5+fn4IMnZMyVIEfwNA/1V1LqD4PGOwjfYbk4+skJKFPz3wQBVnOZOkqoIKzyaO0OZ5lfcjasw==;
	5:Y2DwqQmD1O+LgnkBvp1O95yGsp82aBKSfB2s/SUc9P1gJwdD+ONzy/IBXTkW8qcvPytAlcKLusw28UQTdJKZMFobbbA9tHVZYCSokddaUtwKgCfVr800EXK5Yz++kldVuN5KeygaTvzYJsqXpcQ580JbAdq6K++0S2kJzVXOOZw=;
	7:TQA8yXZz5JEtV4yjkgkIDH4SBuS+9csP3lSsLDUJz0HF1I0HJljDlW5pkItWGwqZC1ib/nRCMEg9TEw/jprcF+jhml1jfD36xmw31l8Z+TZMNPsJJ2b0bFN5sQ2W0ta0qNPjiuVeULCdTioDS5n8aQ==
x-ms-office365-filtering-correlation-id: 2a23d7a9-245b-41be-6b2f-08d64f2ed410
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4651; 
x-ms-traffictypediagnostic: DM6PR01MB4651:
x-microsoft-antispam-prvs: <DM6PR01MB4651F8B6AD10BEA07CB8D0F48AD90@DM6PR01MB4651.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(93006095)(93001095)(10201501046)(3231442)(944501410)(52105112)(148016)(149066)(150057)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4651; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4651; 
x-forefront-prvs: 08626BE3A5
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(136003)(366004)(396003)(39840400004)(189003)(199004)(476003)(305945005)(39060400002)(71200400001)(7736002)(71190400001)(4326008)(2906002)(3846002)(14444005)(6116002)(6436002)(1076002)(14454004)(256004)(316002)(2616005)(5660300001)(486006)(107886003)(6512007)(53936002)(86362001)(110136005)(54906003)(6486002)(6306002)(186003)(478600001)(966005)(2501003)(66066001)(26005)(102836004)(97736004)(99286004)(25786009)(81166006)(68736007)(105586002)(6506007)(8936002)(386003)(81156014)(52116002)(106356001)(2900100001)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4651;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: Z/3I7sXrW5UyIibNPsNdJFE28GiThCr62ojIpnOs6YM6Y3iXRVnOu+FXX8ZvF8LO1cis3HUACNM/JM/lw5/vMJBM+yRwEh0bsTau4Na1QPS2GS2AzShif0fhXDxyJ2zsO2kugLZPX+idoVgK0TALkryxQ/eJYLVZavG2d/Jc7qq0ehhfAYs6Xsw4qRQS9KS+ZFSxONX55KrnDbwRx/kwND7BO1LBmDcF5+Mcs2lMTTd+XV9FDbggauO77JFb+BiI15xa0EkMiDWlzrGEuV42lB+Zb5icCptKkR/GppQEU33Y+RZe1FuZd1v3jPd/Isfp/jmu7u9Xyf2E/s2bPZ0qH8qxf+DyaO4Y0q0MjCUxk2M=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a23d7a9-245b-41be-6b2f-08d64f2ed410
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2018 21:26:26.9439 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4651
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.78.134
Subject: [Qemu-devel] [PATCH v8 00/13] More fully implement ARM PMUv3
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
X-TUID: aQh9AIbepjdH

The ARM PMU implementation currently contains a basic cycle counter, but
it is often useful to gather counts of other events, filter them based
on execution mode, and/or be notified on counter overflow. These patches
flesh out the implementations of various PMU registers including
PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to represent
arbitrary counter types, implement mode filtering, send interrupts on
counter overflow, and add instruction, cycle, and software increment
events.

Since v7 [1] I have made the following changes:
* Updated pmu_op_start/finish to not be called upon migration under KVM
* Added a patch updating PMCEID* to be 64-bit registers for AArch64 and
  added PMCEID2/3 for AArch32
* Changed get_pmceid() return two full 64-bit register values (since the
  underlying registers are now 64-bit post-ARMv8.1)
* Updated the comment for pmu_op_start/finish to match the
  implementation
* Added a check so the pmu_timer is not freed if it was not originally
  allocated

[1] - https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg00837.html

Aaron Lindsay (13):
  migration: Add post_save function to VMStateDescription
  target/arm: Reorganize PMCCNTR accesses
  target/arm: Swap PMU values before/after migrations
  target/arm: Filter cycle counter based on PMCCFILTR_EL0
  target/arm: Allow AArch32 access for PMCCFILTR
  target/arm: Implement PMOVSSET
  target-arm: Make PMCEID[01]_EL0 64 bit registers, add PMCEID[23]
  target/arm: Add array for supported PMU events, generate
    PMCEID[01]_EL0
  target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
  target/arm: PMU: Add instruction and cycle events
  target/arm: PMU: Set PMCR.N to 4
  target/arm: Implement PMSWINC
  target/arm: Send interrupts on PMU counter overflow

 docs/devel/migration.rst    |   9 +-
 include/migration/vmstate.h |   1 +
 migration/vmstate.c         |  13 +-
 target/arm/cpu.c            |  28 +-
 target/arm/cpu.h            |  71 +++-
 target/arm/cpu64.c          |   4 -
 target/arm/helper.c         | 801 ++++++++++++++++++++++++++++++++----
 target/arm/machine.c        |  24 ++
 8 files changed, 846 insertions(+), 105 deletions(-)

--=20
2.19.1

