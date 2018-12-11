Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp711017wrt;
        Tue, 11 Dec 2018 07:23:16 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UccOyQ6uTyJFi3zT5fs/ZOI8EH9EhpEHT0gMolHPXOb2TJbkGBEK6uOTg+NJZXWQE9sdKQ
X-Received: by 2002:a37:ae41:: with SMTP id x62mr14183635qke.354.1544541796511;
        Tue, 11 Dec 2018 07:23:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544541796; cv=none;
        d=google.com; s=arc-20160816;
        b=wXxdNxIQgaEFiO8YGvYwfAXSnS/MmgPvmD5YZHLIX3QH+rPGncqMc3Jki6H+adQV8I
         25VLRn7Le9J7ySaAKfksGTTY586Q8MMyHDgS6lHKVtW3FQwW58M4aNh9nIdw/Da+zgDR
         /4uBJORJVKXiTAzLesUoveKAq3LeC3nXHlYoNkjje4UmE0R7QtKJI20GsbXtBXTxa4P5
         8qX6t6yQS9RWemugscRC4up0jRJTZyiLnqHu0S8vEKAAIIS9yvMg9Vy28Gf8FrCAYcJJ
         y2+NURFRE29PgrJ8PWPs6xgq6mRBBFF5ulVQc+w+wCmsv9DPJ7iUiqicJ2a5dDwQqID+
         2bbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:message-id
         :date:thread-index:thread-topic:to:from:dkim-signature;
        bh=/627UIsGl7Hp6Go0HmZGEFsmfVVqroGpJeS1xg5vMLw=;
        b=MQo9wzl87fbj5Ap+C6alxge2AYcKewCHzqpWCFUEu3cSYId9HAUNnt10+ZtgnsjqNV
         F5Vi4SloHYVUBkjduSJUPEeEaOC3NipzDU5/82qjP8uEF1IjvwCQk2sCRz+RJp2sRo9O
         3H/BwYNuNXh+/BOVylWO8MAC/F2K6aiqqae1prwxYIUWjWhZB+MvgcosgLHK9xH5xal4
         huDmyKfboPgsbLxgU+yg0ZOCgjWWs5ruAf3OlOc7sMw8P2v1RtMKcAxxt01VjFJs0eJ2
         ligG6Fcv1y4/8IQrc/+DxiPBjFSwPdoi/eiglB8C6MmPd4omCd8VOcGsgpVaf4Ox2XKc
         XAqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ojUEEyrk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l5si1454629qkd.172.2018.12.11.07.23.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 07:23:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ojUEEyrk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38628 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWjsR-0005P3-Sf
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 10:23:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpl-0003qq-98
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 10:20:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gWjpk-0001OK-AZ
	for qemu-devel@nongnu.org; Tue, 11 Dec 2018 10:20:29 -0500
Received: from mail-eopbgr710107.outbound.protection.outlook.com
	([40.107.71.107]:42240
	helo=NAM05-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gWjpU-00018w-Gn; Tue, 11 Dec 2018 10:20:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/627UIsGl7Hp6Go0HmZGEFsmfVVqroGpJeS1xg5vMLw=;
	b=ojUEEyrkddgMdaRGUnbAqEe+6NqmW/0GiwIPJvSaQEWa4yKhwaVHSYQ6OszE40eZjalHM7X6Mb2WWDSsOEVZWR/GX3Eal0+hgcD6ShAu1THry3P/M8kVnfhkJpQTb4d8Rjal07XBObtSfrguu038Mb+BpkQ3GXqQtiTUSpFadow=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4379.prod.exchangelabs.com (20.177.221.214) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1425.18; Tue, 11 Dec 2018 15:20:04 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::9c7c:27c7:4cb7:f820%2]) with mapi id 15.20.1404.026;
	Tue, 11 Dec 2018 15:20:04 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 00/14] More fully implement ARM PMUv3
Thread-Index: AQHUkWT9yoTnQLK4wEyGDenROpz3ow==
Date: Tue, 11 Dec 2018 15:20:04 +0000
Message-ID: <20181211151945.29137-1-aaron@os.amperecomputing.com>
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
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4379;
	6:R9KvAEsqnrNUqiv7zsKv8FxC/BzuENVE9+RBHG3mdWwZD892FAkiaPn+QGZxpet0GtRksum+lIXF72juDE32MXL67Sg8sj0ILodZ5vfdPRDh0bjkU1UKXzicUUV5EKqAdxyzNIkM11Mdj6M/iI/Q6esz4N5UUJw/7EFERTawxW1DB9qVK0cgO+ZoLBXE96OSWcWtbhgEPQsm1NzMCBH/Oq4126yljgy26cr6skfckPI1dE7ncY+m8ERicbNYDEHFfElUm1Vj9qeCWPt8ghFCwORcpOALTncFWZrTvy7/FWOY5/NONI2ueWZDLTmsB/Cu5MMBdUEFw6U/b2pqVZoyiCp+2Sbp1NVsFTb7QuxcNZUcWINAdPBwZkKnYWJYaw80z0Gdtn7k1qMknv4lnwHMYrIrQkI4I29gdLfV9RCrKx3nRqE90sj2NiFkMzPZvxonIWRi1Zs5C/2Ldyn4qz3eDA==;
	5:1lzQUsmVr7kwTOyeva/3k0Cpqv3bezwVaJpJ44dT/L5FrgZUoD2Mipo5Js3J8/4H95tN5odjm1OVJJJteV5UowqQabOr3p8MWSdx+34NVSNm6UTIrr/3Wdozh31zD58U+JabqYTIOLc8Zi5fW2CsIUZXigrsCyD7VuC/BuLPwak=;
	7:8ZAWkZlTNmg6zM6HQtpftTNPBu3xTCIcw43SKb5itVcrzKp8mBMXS9Zn3KZPK+jCD8V6otBPsb1RlIVNbR3D0xWav6OJSTVC8E3PlC9hqh87xKlVn38F1CCRAGxuZzBBiIpuws0wBkn8J3sEoLtfWQ==
x-ms-office365-filtering-correlation-id: 4fd6b66f-94c3-4208-80fb-08d65f7c2013
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390098)(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4379; 
x-ms-traffictypediagnostic: DM6PR01MB4379:
x-microsoft-antispam-prvs: <DM6PR01MB4379CD12D9DDE242B223065A8AA60@DM6PR01MB4379.prod.exchangelabs.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231455)(999002)(944501520)(52105112)(93006095)(93001095)(10201501046)(3002001)(148016)(149066)(150057)(6041310)(20161123558120)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB4379; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB4379; 
x-forefront-prvs: 08831F51DC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39850400004)(396003)(346002)(376002)(189003)(199004)(4326008)(26005)(81166006)(81156014)(71200400001)(71190400001)(106356001)(6436002)(66066001)(14454004)(68736007)(3846002)(2501003)(102836004)(8936002)(6486002)(8676002)(97736004)(6116002)(186003)(99286004)(476003)(2616005)(25786009)(107886003)(486006)(6306002)(7736002)(54906003)(305945005)(39060400002)(478600001)(14444005)(256004)(966005)(52116002)(2906002)(386003)(1076002)(6506007)(105586002)(6512007)(86362001)(53936002)(5660300001)(316002)(110136005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4379;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: Q1AmSIBKtMxxbx4qiZ8kDChk1TULGO3A9fsfczyHYFwtoH4loGM48oPea1xRNv+69nVml+URr7d/NIZR88WERMeyONj7ITk8hdXRfAH/u+vYV/AE6RAMxjtfwPGdk2eiLka+8iJ1GJA9aFfk21IEJeilZoCyitFvZoQXxk3ycD6F7ydsiynZcCAaHaOYHSkrEMmff5xmgorn71arWI7oGlDkRj+07Z+D666LzWMKCcF/R8g+WcLWC6WUvMxocU7arCv0kGOH556OkcyyUghtTPblcDapTIhcVwWUKW7G3qKW3gUn2GgYGkawJhB3ehJU
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd6b66f-94c3-4208-80fb-08d65f7c2013
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2018 15:20:04.1361 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4379
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.71.107
Subject: [Qemu-devel] [PATCH v10 00/14] More fully implement ARM PMUv3
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
X-TUID: 6Fb/RepAmPsu

The ARM PMU implementation currently contains a basic cycle counter, but
it is often useful to gather counts of other events, filter them based
on execution mode, and/or be notified on counter overflow. These patches
flesh out the implementations of various PMU registers including
PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to represent
arbitrary counter types, implement mode filtering, send interrupts on
counter overflow, and add instruction, cycle, and software increment
events.

Since v9 [1] I have made the following changes:
* Added a clarifying comment about how the PMU timer's migration is
  handled
* Added a check against implementing PMCEID[23] if ID_DFR0.PerfMon =3D=3D
  0xf
* Added TRACEFILT to the ID_DFR0 field definitions

[1] - https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg00805.html

Aaron Lindsay (14):
  migration: Add post_save function to VMStateDescription
  target/arm: Reorganize PMCCNTR accesses
  target/arm: Swap PMU values before/after migrations
  target/arm: Filter cycle counter based on PMCCFILTR_EL0
  target/arm: Allow AArch32 access for PMCCFILTR
  target/arm: Implement PMOVSSET
  target/arm: Define FIELDs for ID_DFR0
  target/arm: Make PMCEID[01]_EL0 64 bit registers, add PMCEID[23]
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
 target/arm/cpu.h            |  81 +++-
 target/arm/cpu64.c          |   4 -
 target/arm/helper.c         | 808 ++++++++++++++++++++++++++++++++----
 target/arm/machine.c        |  24 ++
 8 files changed, 863 insertions(+), 105 deletions(-)

--=20
2.19.2

