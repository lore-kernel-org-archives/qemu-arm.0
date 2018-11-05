Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2942445wro;
        Mon, 5 Nov 2018 10:51:51 -0800 (PST)
X-Google-Smtp-Source: AJdET5cWjGQr0qm6LHugpguuR7ETnaBT81Yq+RSppuJ2ll+XobO6OZF11CYc8xCsLn2MTBrqvGHQ
X-Received: by 2002:ac8:f6f:: with SMTP id l44mr23010813qtk.158.1541443911656;
        Mon, 05 Nov 2018 10:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541443911; cv=none;
        d=google.com; s=arc-20160816;
        b=krPLhMM0j04M4sHYLXUiqZ3jI/n/qFMYVAcYgwI5UvLb9WSkRKG2krOenOg8rn5MvZ
         JtXuhtxS5zcc9U+W7bvIZc8jWwdlK7QCp2QGY+FjMdkIrjsyry3fWU8aBtLe3/qu3cXU
         oE7AZ0hwW9J4Cd4BiYUIpeZsIOy+Ku0+Vel92M2U1PRljdDJwG3Mclzyo2huP+HiRD98
         EMP1WjjmE08LVfSfhQu6mPDubwfUKaRDRPDOxcI211IJYmuexT/kAIdvv84inXnW5UnF
         0wLPBhA/82XGqy5lm5B7Vne97z2c4ZMKUhBabKQtHVVYsBUKGAaDnXwD7o4sXRTVxemH
         1DyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature;
        bh=yb+w6G2DY/lMP10OofXmMCvhnmEKUSEooxVU6qA7lg4=;
        b=lZ7Fe8QCB0HvyBOFINZyc3v4fJ+lkgHJKMJMHCVlN14S3qWIE+QUg5mpaXl8y+Tx6a
         Evz55SErVF9jwOu1pD137S0APJG+Hbb8sR8w5j7+I7v10FhjPaC3dvhiPmyZEibKUXZg
         ECX+0m8yDPv8czUY5AS8ofTrmpgWoPGqNY2vzyMdfLWAoj5OMneWLuXun0HRji6IdHPR
         EkRqMZXP+9o6QpIOJ6UmHhsw8DvHyNHW2jtgdvXq/QJLCg6XMVSUg6EJC6zolRK4w74y
         mF8WdlVSGFA0H6lWVWk577/6j2VH7YfhQOggxT4DoUV9MM81syV2uEKOE1qqO0LJajPC
         Gn9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=A3I7lf3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n79-v6si3616130qka.101.2018.11.05.10.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 10:51:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=A3I7lf3K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:37092 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJjyZ-0004PB-83
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 13:51:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyR-0004P2-RV
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:51:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gJjyM-0000D0-2b
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 13:51:42 -0500
Received: from mail-sn1nam02on0123.outbound.protection.outlook.com
	([104.47.36.123]:45116
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gJjyI-000050-ST; Mon, 05 Nov 2018 13:51:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yb+w6G2DY/lMP10OofXmMCvhnmEKUSEooxVU6qA7lg4=;
	b=A3I7lf3Kh0kGKKpBiOh6muzami/y7bKlh5u9GnY8xz/yA/SoluTIYhYO/fF2jB1QvN708nDeJugzUGNmMVLREXPHeTguj8DsxAbLGQED6ec7+2MfVAAveZkSSEZBi+0VwPqO1AHoFJbl3dGZ7B57SIxFiU++ocUQuDA/FIQtZys=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5034.prod.exchangelabs.com (20.176.120.218) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.25; Mon, 5 Nov 2018 18:51:25 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::4cf7:c8dc:b673:ec66%3]) with mapi id 15.20.1294.028;
	Mon, 5 Nov 2018 18:51:25 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v7 00/12] More fully implement ARM PMUv3
Thread-Index: AQHUdTiNuwfI3sEwik6sc7JRlEdlJA==
Date: Mon, 5 Nov 2018 18:51:25 +0000
Message-ID: <20181105185046.2802-1-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5034;
	6:CBiBD+NRqUPyKXk1aPOhxBXu4IiyERiIsIAVzxW3B64aWcF3c3VzdEyqd2XJOUIElcamv+XQT8QF79OJDYL3fB0vFbj4IVczgAIzUSqfIWqTzm1r+noLoiVU3JSqOFCr5E+wTpd0/Mx44Bo4CpY61bU7oROWtgo7J7FB2s0PD9QFOEVG1VNrU4nHTlfh8vnys/VAdfaJ/u8KIHUvr4/LcjbFFfHN/LshPR3axAx8ZQDVZRLidBJ+7FU9eK8M81/qE6WKVcGnGnGSnP41YslvyjFmjX6B08SYmqHTYblpNEu5mAvGTMD7wE+R0dNG7eTrYolF72GlL8YJb+Y9E1+YF8nmOa3UelmvbrQGepmoefcozLQ2dJGIHKLkJHlnbe1n//haEeSO907ti7VP1Vc8PbJg3GBn9hDR4SJAZ4dcwO3WJSeILl/B/Quz7X0FF2mUAz1PNDbGNwhwJ8+kbpx7QQ==;
	5:biiJI0TIriMSbn3WdxUHLS/6Xmigl6u1i34UN5N9/wVK8BheGw7Dce/Zqe1iTzYTDp+f9w82AFnUWArphWyoBsmU5OCmYXYa52ZEAAqe6C9AEjdCDIexhgU/YafHZxvj3tUNdIVpPuHLqqRX+NL5joVW47uJ43YeZGcqG66oK80=;
	7:tNooQ00e7yBlX+u+Y6U+ZTddEbNPsyPcX7nA8FkSuFRUorQlaM3hOka2/PNAdnc88EzzxYWpCzVtU9fUwUqDoPen8aHdf8MweB/lsH2lpyRD8UG3ixblGGB1/+msZG8+p+vv7AMMB3/86RcC6Niw8g==
x-ms-office365-filtering-correlation-id: f27864d1-4c4d-4444-e889-08d6434fafbf
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5034; 
x-ms-traffictypediagnostic: DM6PR01MB5034:
x-microsoft-antispam-prvs: <DM6PR01MB503486B113F1940331788EFC8ACA0@DM6PR01MB5034.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:(226959686518644)(22074186197030);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93001095)(3231382)(944501410)(52105095)(148016)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(20161123562045)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5034; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5034; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(366004)(39840400004)(396003)(376002)(346002)(189003)(199004)(81166006)(52116002)(110136005)(105586002)(1076002)(86362001)(8936002)(54906003)(68736007)(8676002)(81156014)(66066001)(6306002)(102836004)(6512007)(14454004)(2900100001)(966005)(2906002)(53936002)(3846002)(6116002)(6506007)(386003)(71200400001)(478600001)(14444005)(71190400001)(26005)(5660300001)(316002)(6486002)(107886003)(256004)(25786009)(106356001)(305945005)(99286004)(7736002)(39060400002)(476003)(2616005)(486006)(6436002)(97736004)(4326008)(2501003)(186003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5034;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: cIP+n+apadS4viL2cORlfBBfpDuXDMgkO/0yNJyb+4di2M+GAgVTvlZI8/h1m16jOMUvNTFKNjQfqTyhaI9glOjfA9LPUvg3Iwn5MlbIqg7x8rvhTBkAVkKladaxk6Tu4+e6f/ew26lSz8Jw1EuXSL3h2we+p0BGPUGmPnDvprc6wdSe1gxAGPhXahXraWoo0DGINffNZ746KlZFhYXytFFj3X70Z715lwMNUy3s6/zM2nKDszvKI9d68m8YV3ampNQqurzyhh1D3pYOUEMNBW5vUfTjH5paaUX57tBy3HjY7/3+OeWoSndWVu/8nWlv68aSnZgK8cCio9CYbfKcH/Vag/p77WcIB0sIHqwOJ7w=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f27864d1-4c4d-4444-e889-08d6434fafbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2018 18:51:25.4104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.123
Subject: [Qemu-arm] [PATCH v7 00/12] More fully implement ARM PMUv3
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
X-TUID: dPhEE6THyZ4U

The ARM PMU implementation currently contains a basic cycle counter, but
it is often useful to gather counts of other events, filter them based
on execution mode, and/or be notified on counter overflow. These patches
flesh out the implementations of various PMU registers including
PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to represent
arbitrary counter types, implement mode filtering, send interrupts on
counter overflow, and add instruction, cycle, and software increment
events.

Since v6 [1] I have made the following changes:
* Use cpu_get_host_ticks() for the cycle counter value for user mode
* Re-staged "PMU: Set PMCR.N to 4" so that the value of the pmcrn local
  variable matches the architectural value of PMCR.N
* Re-ordered "Reorganize PMCCNTR accesses" to come first to eliminate
  the churn of *_op_start/finish function names and definitions
* Use extract64 and ARRAY_SIZE macros where applicable
* Add a return value to the post_save migration function

[1] - https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg02036.html

Aaron Lindsay (12):
  migration: Add post_save function to VMStateDescription
  target/arm: Reorganize PMCCNTR accesses
  target/arm: Swap PMU values before/after migrations
  target/arm: Filter cycle counter based on PMCCFILTR_EL0
  target/arm: Allow AArch32 access for PMCCFILTR
  target/arm: Implement PMOVSSET
  target/arm: Add array for supported PMU events, generate PMCEID[01]
  target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
  target/arm: PMU: Add instruction and cycle events
  target/arm: PMU: Set PMCR.N to 4
  target/arm: Implement PMSWINC
  target/arm: Send interrupts on PMU counter overflow

 docs/devel/migration.rst    |   9 +-
 include/migration/vmstate.h |   1 +
 migration/vmstate.c         |  13 +-
 target/arm/cpu.c            |  28 +-
 target/arm/cpu.h            |  68 +++-
 target/arm/cpu64.c          |   4 -
 target/arm/helper.c         | 774 ++++++++++++++++++++++++++++++++----
 target/arm/machine.c        |  20 +
 8 files changed, 816 insertions(+), 101 deletions(-)

--=20
2.19.1

