Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2121750wrt;
        Thu, 24 Jan 2019 08:27:30 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6+6SBjlyrhPIUCeBLuq+L5nU8KiRIpie0QTnRnH1Qxy9iX5v077SqgJ/73gCEFKTnqc+1s
X-Received: by 2002:adf:fc51:: with SMTP id e17mr7746160wrs.268.1548347250061;
        Thu, 24 Jan 2019 08:27:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548347250; cv=none;
        d=google.com; s=arc-20160816;
        b=gIMllVjYaBhy7XWxh48eY+vG2WuSMhxVwUb6i7KMqx6tdGEUNhV7g3fWXEx4rPD3gB
         IakhN0m4myEGbnZv4xxC9r8I95jeMKJ9tmWZ5uv+qPOd5r56ridO5+vLHfKMJpNpvdus
         ss93olduBQFq7wsvQd5b0ZG4xHGy2XVd/VP8JSSBvB4DzfjGoOlE/W6Z6vsk39ZuOQFl
         Rlgr4QA/U/mASgS+BmB5vqy2ZSCwwAiPbLAsouy5QbBHmU+m9XAbdqggCnlYGYaZBfhq
         IKs/gKPdV2bUdR9jyPaBWM0XyEqKeH4sEvrT0Cv2asuqS8axP5LiilZgO9pf5Z1vi23P
         yx3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature;
        bh=zLdUkqKN9+1U5TQd4x8HT2tuwuHNaRaOKqvTx2nsC3s=;
        b=NwWXRe5Om82KtMh6GSgfQINh+JIqI5eibePFa/MUqMscKGc9hSab/ZajvZ5QaNJpXI
         EV7RRKJvO0Cun28SI49saW1D1eMnnZol2wMhiG6KN1DaBU3JDXqZlOlsP1Np+HCabYDy
         ZY4+hBQEK6oq12NUwnXte68hXi5rfEQ2X3GyoUNbrkWkx0rsqDf0OEf8jiwnXuMp2Gk9
         Ev+3LfbW+y6OtIxAb0d0cI17obUaqgWRV7Pi3paRFTwSXKVhMFAASTqW7cGa7BoVcdIl
         HP4Ul5aMGDl3RQsesEOTLGz2Z6EQgRFKxysgUjVMZZ5hL1AfGuYq8UGLL0hOYENR/a/5
         WdIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=UT8q6LfS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g16si71853605wrq.455.2019.01.24.08.27.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 08:27:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=UT8q6LfS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:56467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmhqj-0005d8-4z
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 11:27:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmhnn-0003Uq-HF
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 11:24:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmhnj-0005RL-3I
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 11:24:25 -0500
Received: from mail-eopbgr780110.outbound.protection.outlook.com
	([40.107.78.110]:34663
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gmhnb-0005HJ-HP; Thu, 24 Jan 2019 11:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zLdUkqKN9+1U5TQd4x8HT2tuwuHNaRaOKqvTx2nsC3s=;
	b=UT8q6LfSCI31VJqJq+tzxLsO1Waa2aTNoHWUXZydl/StzSgX5Mi05AFt1k81q/KIDOo7uDgQNkvPFQlpqeVvCbhLCvVBBJSIlBkHbkotrQ+7DY4H1p33w0LNpb78gB2/84i0s8RNIEdrdzh+IGUqOEHP6RyNjS9fKgjBQpP1Xvk=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB4442.prod.exchangelabs.com (20.177.222.13) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.16; Thu, 24 Jan 2019 16:24:10 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1558.016;
	Thu, 24 Jan 2019 16:24:10 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v12 0/2] More fully implement ARM PMUv3
Thread-Index: AQHUtAE8eaaZ9/CUWkeRpeRZuFv25g==
Date: Thu, 24 Jan 2019 16:24:10 +0000
Message-ID: <20190124162401.5111-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR18CA0050.namprd18.prod.outlook.com
	(2603:10b6:903:13f::12) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4442;
	6:inJtiTMQTHIALmex2GrGprEsgSuCNEsY7Xp2fPml7WYNePRrUE9xoMLVCXqTzDzu3mjPSYrBLNLNYhZklS20UPPz7sLGdDdMS/6JdafTMLfs/0GzjRXXCWGoci05+SmBjCld7Okjtqe9IhfNi8XRc5PjeAuReF4ZxX9XvOaDHAxBwbD9pEjZMwtDJmPyek17sslije0h/sct8FehbJ3IEU2ydktnCf+J0P547V/2/hbCAX5vDB4pTq39Em9RQeR2xGBbEW2UtUw+dEjVaOzgArkFRxBSYA/fljClCKuzGv2Ov8lDf19cd3F/FWs4AlfT7KwrqGfWbNYam97r+kbr+TInLwrCeVt7lX+5JaVYVAfdIlmeU5y2tqy3yDTjGb3G9UiBOE1CsaBd8gIFzMEHwCM1lc3l+v3sMmOn/MuOrsR7aBM9Io1IjPwoQDRlDc1G6PWPUjk4VXvbgrsn6bb2Cg==;
	5:kQ0gJg1X3s5kympqeBqJV3NU9+q7CO59cw05lsrwwbKt2/i6C63WAQZj7jsPU2Tqg28FOx4u+x221FgJe6J+RWQQruHZhidXOT7XO1YPEGGGHpQuZDOFPr8ydj1WBRRYFjscxAorRdw/yfHbtOnr1+w8RqPDOlGwaRY/NFLcRsA+nB++knQ9Y8nbb/LZuWFki6pcX+ZnoouWSjT2pzaTZg==;
	7:GiMHYd8n9yl1CXkFHRYWmnVtnMNfQ1YzuB18WHJYnisqW6NkOpjrBo5yKGGzscfzwfEYBXgC7FpiA7y6pGQIvSr8F35sSFT5EpKsbBqwgEdRJUsXc94VfYbp7dNKQycib4PgsnQH9ZAHmIMxesmlHA==
x-ms-office365-filtering-correlation-id: 02e42eb1-8d98-4091-7242-08d682185ec7
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB4442; 
x-ms-traffictypediagnostic: DM6PR01MB4442:
x-microsoft-antispam-prvs: <DM6PR01MB44423854D40E910A67D266858A9A0@DM6PR01MB4442.prod.exchangelabs.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(346002)(376002)(396003)(39840400004)(136003)(199004)(189003)(476003)(26005)(86362001)(305945005)(71200400001)(71190400001)(8936002)(386003)(6506007)(2616005)(25786009)(2906002)(6116002)(2501003)(3846002)(66066001)(186003)(6486002)(7736002)(14454004)(256004)(8676002)(478600001)(6436002)(54906003)(110136005)(39060400002)(52116002)(6512007)(4326008)(99286004)(81156014)(81166006)(486006)(107886003)(97736004)(102836004)(68736007)(316002)(106356001)(105586002)(4744005)(1076003)(50226002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB4442;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yxOesRkEpMnTUwdRsV+4BvKir5ajelENrinnoERjOuoSCH7mzXg4SuuGoc8jgnqL2a+NZoIMsCUMBB2/ZYMh5mroEL6AMqkiBazDy99oMmYEqqoa7If6NdmXagF+FFThgUAyyUCrkiUFaC6EIO9nw8t9ikm1mkXmUNLz6ppPf7nJExAot5ze9mhe/EDLd0E/wzAaCGkR4A8ER5tvW2nlFrEcnqOAU3zU/PP659tub/p/DCNeJkvtraZVvjIWxroxbo4kVwh4yJl/lyGLhEfO1nujOrWFVpT7tbxc9tdY3RSjfQ2EEl/SyLmeuqDbjtxd0k08FoC6aiKOX/SFwncjFIDhScojI1ugr30M61864huE28IyeCS54KfAvspXcHGjCL6qx+fLqlDPDOP3vWymTDROOrxdxdvNT3no8A/RVZ8=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02e42eb1-8d98-4091-7242-08d682185ec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 16:24:09.0041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4442
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.78.110
Subject: [Qemu-arm] [PATCH v12 0/2] More fully implement ARM PMUv3
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
Cc: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qCa9UR60bXVC

Most of this patchset implementing the PMU has been merged already, but
the interrupt-on-overflow behavior had some additional review comments.
This most recent version fixes a type promotion issue and adds Richard's
Reviewed-by's.

Aaron Lindsay (2):
  target/arm: Send interrupts on PMU counter overflow
  target/arm: Add a timer to predict PMU counter overflow

 target/arm/cpu.c    |  12 ++++
 target/arm/cpu.h    |  10 ++++
 target/arm/helper.c | 133 ++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 143 insertions(+), 12 deletions(-)

--=20
2.20.1

