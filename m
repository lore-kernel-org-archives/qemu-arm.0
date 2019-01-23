Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1189484wrt;
        Wed, 23 Jan 2019 13:51:28 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4PUVDb2vPxux7PwuE59Mw2S5YwUr0cBEt2TVYOZMKSJbyXdvaW3kMMA0E40WmvhvJYPaKU
X-Received: by 2002:a5d:68c3:: with SMTP id p3mr4565797wrw.34.1548280288292;
        Wed, 23 Jan 2019 13:51:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548280288; cv=none;
        d=google.com; s=arc-20160816;
        b=Lf3SUkJajUQ9sI1s74FGI4W3aYPFSb65V7mMgsvS7nW7DHgYrH+dwnZ31z4sT5AVI0
         Ff1FOAgtEHe6lmcB1RagyAhKybWYM+lDwIS7Edk4StETcXX7LIg/SP9CuQx57vlPlSPQ
         Jz/b2eSx6fgSFY1XZYY+kM5GKHZoRt0P0zqeQudqbdZTxbB+a1lWMkAI+bxqaQmA08XH
         wGS+jTo+nWZw01RBZUmDTZXDlmvCiF7XsIb+g5o8BFOsdCOcEwEJApa2aanjUzRj2zV1
         kX+KVFbZhL43/8rGVGXMH3sfZcaKxKnp9AU0EnqkoQP7Chcr8ejQGaD95YwNF5FSJa8m
         1UNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-language:accept-language
         :message-id:date:thread-index:thread-topic:to:from:dkim-signature;
        bh=GLUDEoFwg+KGaGcN5N8UB6VZCUvX/fkR7mqdHWpfXSs=;
        b=ZjauDKqEjq0NNrXhN1CxRO1pbiCleERjd1t6JP9PFkZYbcL41O007KlrnFJSr9uOCx
         b/qud3wjgLWiET/QFGLq81tgJvq1wP66s37wzPP17ZtTzldqB9KnIfclylovI8BUcL2E
         otsQ8d/bwsdB5xzzo7OtD8oQHb4s0KP8j0EaAow/gYWTQfAPj/aHXvlw+s8tJB0hP33c
         /rPFqSZ3b2v0w9zvXL0MK+OwazeqedTTDtLUIMkeBYh/2LBDgzLkjsP2bFfjPUklcd2v
         Xk26nZYLchyUG0y8VTvGEENc98ggRdO6deTYHQvOM6cuo/Rkmdcv/7nxSr7eGrwT1PwA
         4XkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ffpXiBxl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si18121242wrr.17.2019.01.23.13.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Jan 2019 13:51:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=ffpXiBxl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([127.0.0.1]:42436 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmQQh-0004z4-AS
	for alex.bennee@linaro.org; Wed, 23 Jan 2019 16:51:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43757)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmQOC-0002zK-Jm
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 16:48:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aaron@os.amperecomputing.com>) id 1gmQ8q-00052z-WA
	for qemu-devel@nongnu.org; Wed, 23 Jan 2019 16:33:04 -0500
Received: from mail-co1nam04on071f.outbound.protection.outlook.com
	([2a01:111:f400:fe4d::71f]:57720
	helo=NAM04-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <aaron@os.amperecomputing.com>)
	id 1gmQ8h-0004Y5-UI; Wed, 23 Jan 2019 16:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=GLUDEoFwg+KGaGcN5N8UB6VZCUvX/fkR7mqdHWpfXSs=;
	b=ffpXiBxlfxFt+rcgX2BDbRTWxrgeohDfhMwUOZoDFw8YMzCJH9OFyhp5AiidM7GWFGHKIIHgvJ3bxSAlQkbPpRky/azIsRRTmAkAE17kCQAhYv2u+rS9whZWyoS8WZZUSONYMeCj0huTW+LIEd86OzqCOtgFGCjLo/DQLUSDFRU=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5067.prod.exchangelabs.com (20.176.120.223) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1537.31; Wed, 23 Jan 2019 21:32:41 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::8054:2484:c74a:d082%3]) with mapi id 15.20.1558.016;
	Wed, 23 Jan 2019 21:32:36 +0000
From: Aaron Lindsay OS <aaron@os.amperecomputing.com>
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Peter Maydell
	<peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [PATCH v11 0/2] More fully implement ARM PMUv3
Thread-Index: AQHUs2MoGHDyPqkm2Eu4kteI3rU0vg==
Date: Wed, 23 Jan 2019 21:32:35 +0000
Message-ID: <20190123213227.17077-1-aaron@os.amperecomputing.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR18CA0051.namprd18.prod.outlook.com
	(2603:10b6:903:13f::13) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [216.85.170.152]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5067;
	6:GGJEd+m89AIt5Xh5b7mUdzdc1j2xu5eBM/UJrCC5pI4fGLUPFT6p9ANTH+ClijpfTIpEWy72NGL7bln7q74E4CmdNDr+0pCNdA/udM4N5WgIv6IESTxVBQxBrB8hCOY07SO5K+bCGj/2LBZEcvDKOFukoQBdKCgrPoauioCWv4nE/myPOhrOH3kohJ8Or0CGQOVI/gpECyHIXc+EpcQnvEj/6iycY5UCzC/gIZp0mTPX18jWhyqEy5yQfMIRsT0BVlfzcjHZYnXXavKvUyTaAbNfig16HgUjfmz2DzuLH2sk++VQsQkGHVfiNLtTleAugPmz4H7YIvV5w7TASKmrQ6eQSWFAbciDWyg9hLOP1ORuYbe6bFCOEt4w+mFAn+lrZMPTCHtSnF7OzanASTz10u6diJLk5o4f6cZyG+YNMhBE2jC17sWHwABQEH+jGXaRulRHIFdvwpb6lOF84yydng==;
	5:Ly2yVjMKnpkofAkWsTRTxwKGMC7tABTV5m58IE8reoObnPTnlmYi3p9xrD3zNODXmOb/hTfzyg4U2Yb9vGaOPKNkoxy4dnO/t0LcGcm1AqfpV8K8rtfpTAT7bw8UCN79yARXrpxSM1Xsf3ZPGgkPk3MH7hZqEekJuJSFCo9bWqnuhg5bA0yreACDuRc7ybIkDcpco9i1ktVsUQH7l4oqnw==;
	7:jqYhhhcqc2RAPNqdqvM2x+ShTq8qaEcHu0QvaM3qOo1MacevupSkwK449l7iLepyS0hIPwqwUSTTn9uf7PfDr96ITT4duTBEQbyeHyJ/PHP4dryPw2X+p11ES83YW8wEqBixafmUGrbcG/JenkTr7A==
x-ms-office365-filtering-correlation-id: 0f496e97-f1df-489a-1e36-08d6817a4a81
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5067; 
x-ms-traffictypediagnostic: DM6PR01MB5067:
x-microsoft-antispam-prvs: <DM6PR01MB506721FE9E0B4A0AA5358ADB8A990@DM6PR01MB5067.prod.exchangelabs.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(189003)(199004)(102836004)(186003)(6486002)(105586002)(966005)(498600001)(71200400001)(71190400001)(106356001)(110136005)(6512007)(6306002)(54906003)(3846002)(6116002)(97736004)(256004)(86362001)(52116002)(26005)(6436002)(386003)(99286004)(2501003)(6506007)(8676002)(4744005)(81166006)(81156014)(8936002)(50226002)(68736007)(7736002)(2906002)(305945005)(53936002)(14454004)(25786009)(1076003)(107886003)(39060400002)(66066001)(4326008)(486006)(476003)(2616005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5067;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:3; A:3; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: z1nitpzfTlsdMWSz4G1QCurZ/CKWwK2Gq43gMe0gban5+xW+0MYIt7xkRZaXqtikRqVSWmBouzpYm/djLce1XvgARSXDwLXW5OlQN0ZvQb6SG9g41X2gNWn1zmfeUpG/qu9D7lbkN7h8dRLjYQ/j+NupfwOvrTK+lRLbGdeZk+WL2pocd9LiZoalyCKiitJuVBITN9fUMYYPWx6vl67f1Rvm4hVYSxBMxBAGO8HxwJG6lsGw0bg91Kjisl8ocoPjAXDApLj9wPkw6Rc4yNlSDxz9RhsoIuRmF8gHNAyui65hgeSle8ApNCLB0mK1GqxZsIAab2ZRu+FxCPGpGgGcrMobE060sFw0pJW48xf2moi+NWK+34UctKbll/ED+VHXqpnhInAZYPLQDAiPiAGjIpHRLWAbsngN7ABamYuy/Mg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f496e97-f1df-489a-1e36-08d6817a4a81
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 21:32:34.6076 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5067
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 2a01:111:f400:fe4d::71f
Subject: [Qemu-devel] [PATCH v11 0/2] More fully implement ARM PMUv3
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
Cc: Aaron Lindsay OS <aaron@os.amperecomputing.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2X5hxnynVxp

Most of this patchset to implement the PMU has been merged already, but
the interrupt-on-overflow behavior had some additional review comments.
In addition to improving the overflow detection and bit-clearing logic,
I split the previous patch [1] into two to (hopefully) make it more
digestable.

There is also a separate bugfix for one of the the already-merged
patches which I already sent out separately as "target/arm: Don't clear
supported PMU events when initializing PMCEID1" [2].

[1] - https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg02242.html
[2] - https://lists.gnu.org/archive/html/qemu-devel/2019-01/msg05996.html

Aaron Lindsay (2):
  target/arm: Send interrupts on PMU counter overflow
  target/arm: Add a timer to predict PMU counter overflow

 target/arm/cpu.c    |  12 ++++
 target/arm/cpu.h    |  10 ++++
 target/arm/helper.c | 133 ++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 143 insertions(+), 12 deletions(-)

--=20
2.20.1

