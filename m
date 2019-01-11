Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp317918wrt;
        Fri, 11 Jan 2019 08:22:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4SOo9kNzaDJmiWT3MM6e5VenRMRRua7wU3GuBUTUhyY+oqeQ/rlRotLNgdiSDPqffqe6pI
X-Received: by 2002:a5d:480d:: with SMTP id l13mr15040395wrq.175.1547223749878;
        Fri, 11 Jan 2019 08:22:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547223749; cv=none;
        d=google.com; s=arc-20160816;
        b=duKu1kO7axClif3RRI7sqNKlYg5GpEkMdxTq46oaF73FbS+HXBIoRL2I6Fjt54WcGt
         GenLJGPqN/Ij8bxxhX2/jmJANiEFJbXBTZ579lmQFJRM7Wg0GQUyII5xt4kdPUgh0Zqj
         srXM7LSDoTVbhx/DnWL35+BCVkzTQyB39gNC1yFS4eVz5RISqnLW6mzo9aFto+KI4KCc
         fGM2p0QRCaPeZiT9zjy+f4NjTxLvVlwqEtX+cIKAYiLYzZo6VrhFhjeBUGwuG6RU7wIH
         a4lgdd2A+Z6dsEsxehz+SF+3gxhRGjNoPvNxw4UJo3m3f84HtCyxMK8AfJLk9KQ0w/Rq
         bemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=0ZSUV8ULzt9qW1KlEGBKJZTGofNos4ErJUyMhoLRhyM=;
        b=EtK/PqjLF2k4SU6FuiZgztyUAzqcUPhUC/FNI40+1ibYUuE3vvqf1SYMcV4A6/WZdO
         NH4YiUpSFgPWP7smjTrUs0+/D3Dr2FSuuB3y/DiuTMiMsytNt2yMjXZ17etnqbWlqWZS
         h49qfgIu8yti9z75wW6bp5h81polxgbfbnSd5/CVs3u1Q1qkg72V6jmtZ0RrW1jAgSoy
         0WccZbBQh5yJZ2Rq3dLDLFtdeekRI7YleSTL9PPFcwJSj8Z44Gi3YKBNub2D5HcII5xJ
         H2CckKRK81hSIH2nRlr/ZzssBhRXq1ZHKlw7RW1An3eGwJFT11jVmKjf8vrzwKJwdMHq
         /+qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=gyvpOrTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si43274004wrs.235.2019.01.11.08.22.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 08:22:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=gyvpOrTk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:36908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghzZk-0001z0-Uw
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 11:22:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1ghzZd-0001yj-8I
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 11:22:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1ghzZU-0006NC-Eo
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 11:22:14 -0500
Received: from mail-eopbgr700130.outbound.protection.outlook.com
	([40.107.70.130]:10880
	helo=NAM04-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1ghzZT-0006ML-Tg; Fri, 11 Jan 2019 11:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0ZSUV8ULzt9qW1KlEGBKJZTGofNos4ErJUyMhoLRhyM=;
	b=gyvpOrTkkrTKx/Vbt2qzqyAsRh8q3uPt7SBu0YnTrLhmzXjn1qDlOtfpDvWsyFdlCvDUQl3OgNyW5uKWrfK56pxSr7G6zokeD+hFaPJjh3+Yi+PhjRoxiePwqkZEXUuVakolDfrgWZXVofz44xD46fZuEkCxLGvTqrJeHN/GR60=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4716.prod.exchangelabs.com (20.177.217.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1516.18; Fri, 11 Jan 2019 16:22:08 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::957e:524c:a580:4104]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::957e:524c:a580:4104%3]) with mapi id 15.20.1516.016;
	Fri, 11 Jan 2019 16:22:08 +0000
From: Aaron Lindsay <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v10 00/14] More fully implement ARM PMUv3
Thread-Index: AQHUkWT9yoTnQLK4wEyGDenROpz3o6WqcMqA
Date: Fri, 11 Jan 2019 16:22:07 +0000
Message-ID: <20190111162205.GB2819@quinoa.localdomain>
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181211151945.29137-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR03CA0024.namprd03.prod.outlook.com
	(2603:10b6:404:23::34) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.153]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4716;
	6:lrNd37MyQHPNPHOcVW3PhvXFFHl903hb8+mxgN1JRqDltXzyUE3lPfHp0e7ksLzsMlc/WJF1hTFEokUm8GX9HDfyiSsdcxaLOumrAOEDzuX5O79t7jiP4gtWtSgAJet2Z6Y9zWg+E/ktnUdiPrdCtotBAmatJCNLbbUogm9KGv06OX+4Ag5hb5kATlyE9oFyqR9xPGtHo+NzQtcwaULZtQzrqxnDP6/hNBt2knyyMarBVtpQqCd8a+FTf0rIM05ivweAs8Vh99n4ZRVhN1z04UsCqrtH1KG21lOvvkFQ4ClLb3/mc60Gy2bGK3sGXSM80thxUtQDz74COtfaiqVSnBpXI1kDXSs5rlxZj/TEQW6p80vDmL+2SW3O33girPQsmhVTqCfcBTFJcU0eX0oMUzxzTXN/0kg1AFNnciORAY7P+pkeS9XFo2nYahP5YscAzATMWDbCPMbyfaTICDkkTA==;
	5:NVDNi/jbsQSe4ab1zty61Po0LRvMHISajEDmkCzsqcdFBDg2kq6ZdJp4pvsoB9tWTjvXNdbxHDb0cJ1JyouMc8thI65cJKct3RHCz6Zv7VQ/LSsvzaOtc4xwRcRJD+k9UbAoI12h5hSgHKIHEIrW+PvirDKIGYN4qc3Hh8qg76j/eUpMIfMzK6rJvdtRGooxQYWYnqZes6Rhx0T01UVSpA==;
	7:tb+b9TOmOueRBZCsJoDtJs7tri9hXlSgRe7PQ37utgTe0vlQGUs1RBuoPMpsuE8YZhFg6pLBHrPZNo4aufRFdZXHcsCTnUDZ4/a9n5HBJIxRm6pg3ngFHWBpNFRXx9jjE2XatIyX2AVAqPlnkfD5Rw==
x-ms-office365-filtering-correlation-id: c2044771-3c38-4f49-582e-08d677e0ee7b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4716; 
x-ms-traffictypediagnostic: DM6PR01MB4716:
x-microsoft-antispam-prvs: <DM6PR01MB4716E40789088D40CC13F0D88A850@DM6PR01MB4716.prod.exchangelabs.com>
x-forefront-prvs: 09144DB0F7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(376002)(346002)(136003)(39840400004)(199004)(189003)(1076003)(7736002)(305945005)(66066001)(6436002)(8936002)(8676002)(81156014)(81166006)(71190400001)(71200400001)(54906003)(486006)(229853002)(6486002)(110136005)(446003)(316002)(11346002)(256004)(14444005)(476003)(86362001)(52116002)(76176011)(106356001)(2501003)(105586002)(68736007)(478600001)(966005)(39060400002)(26005)(186003)(5660300001)(6246003)(53936002)(33656002)(6506007)(386003)(25786009)(33896004)(4326008)(102836004)(2906002)(99286004)(14454004)(97736004)(3846002)(6306002)(9686003)(6512007)(6116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4716;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YwH1BG/uVbhgYYCjaVZZ3E3LqRX2VhYMbbWgwnsdz1AWXib+pGJNg2OkYfT4qEyI1zW+QNvJ7h/aNmvzLByKkfLL/mlywJei4DcG1RbIjA+yuGYhu6qsfeb94t2qzk1h7jZG4FzKQ831TxMeIr2mS7gtHMxlF19BYbjHmq4QIdTh/GpVkmIYXxZ9LWvGTb3xOsFPXUfK7Xlb1XyjFeVIRgGtdDFe5o++nTAaGmbPepp6yXguI7glGrHI9igdnoqXQh2GnM/BIOx08ik7HZahDIC9+5cwJqm1lCyaHetQH3dRcAAJSAFdFEf+YT3+gPgETqglUAJ7W1DFMyTj0LQs7LESsUcXc1UTL49YGOWjt/tlnH5Y32Xwq0xuTifOnSwXKp83NudbkYzEV8I533qicN5XDrl+NdOrCu4BDUHPc0U=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3C19AC5E1A4D124298E0480D30770486@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2044771-3c38-4f49-582e-08d677e0ee7b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2019 16:22:08.0016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4716
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.70.130
Subject: Re: [Qemu-arm] [PATCH v10 00/14] More fully implement ARM PMUv3
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SnSOOkMe34Ms

Ping, just in case this got buried over the holidays...

-Aaron

On Dec 11 10:20, Aaron Lindsay wrote:
> The ARM PMU implementation currently contains a basic cycle counter, but
> it is often useful to gather counts of other events, filter them based
> on execution mode, and/or be notified on counter overflow. These patches
> flesh out the implementations of various PMU registers including
> PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to represent
> arbitrary counter types, implement mode filtering, send interrupts on
> counter overflow, and add instruction, cycle, and software increment
> events.
>=20
> Since v9 [1] I have made the following changes:
> * Added a clarifying comment about how the PMU timer's migration is
>   handled
> * Added a check against implementing PMCEID[23] if ID_DFR0.PerfMon =3D=3D
>   0xf
> * Added TRACEFILT to the ID_DFR0 field definitions
>=20
> [1] - https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg00805.html
>=20
> Aaron Lindsay (14):
>   migration: Add post_save function to VMStateDescription
>   target/arm: Reorganize PMCCNTR accesses
>   target/arm: Swap PMU values before/after migrations
>   target/arm: Filter cycle counter based on PMCCFILTR_EL0
>   target/arm: Allow AArch32 access for PMCCFILTR
>   target/arm: Implement PMOVSSET
>   target/arm: Define FIELDs for ID_DFR0
>   target/arm: Make PMCEID[01]_EL0 64 bit registers, add PMCEID[23]
>   target/arm: Add array for supported PMU events, generate
>     PMCEID[01]_EL0
>   target/arm: Finish implementation of PM[X]EVCNTR and PM[X]EVTYPER
>   target/arm: PMU: Add instruction and cycle events
>   target/arm: PMU: Set PMCR.N to 4
>   target/arm: Implement PMSWINC
>   target/arm: Send interrupts on PMU counter overflow
>=20
>  docs/devel/migration.rst    |   9 +-
>  include/migration/vmstate.h |   1 +
>  migration/vmstate.c         |  13 +-
>  target/arm/cpu.c            |  28 +-
>  target/arm/cpu.h            |  81 +++-
>  target/arm/cpu64.c          |   4 -
>  target/arm/helper.c         | 808 ++++++++++++++++++++++++++++++++----
>  target/arm/machine.c        |  24 ++
>  8 files changed, 863 insertions(+), 105 deletions(-)
>=20
> --=20
> 2.19.2
>=20
