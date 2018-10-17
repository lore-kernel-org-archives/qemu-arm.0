Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1164915wrt;
        Wed, 17 Oct 2018 12:21:44 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63iIzcNy2R5ng+E/s3HY29b3UK2xABNkHxxVRJbwu8VRoE+qVnVmr0Q6pdk6BkicmZ7/mzW
X-Received: by 2002:ac8:3fe2:: with SMTP id v31-v6mr25900675qtk.108.1539804103924;
        Wed, 17 Oct 2018 12:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539804103; cv=none;
        d=google.com; s=arc-20160816;
        b=MsWo+5qY7N6S12Lfw8rJF/XlR56WIqztR5+GZBEacSH1fonVTIdlbCaIupdo6BZTEW
         iUbVX1f5F2YaUrQCVdarZntpJb3+XkyFjp5Po99UA1X7GjFulay/STp0BjqrPxL9XjQl
         RtLC5ao3zxQeuZt0pw6acK8amybk1LVAiSPn9j8ofjw8yOsLsBhojsWxATarFPuuuxNa
         3TEZKA7/O7yAqFLX3TAvGYdtqwNPFbHweCCVFGY77FPwdkTybiYknwZ299RoDDC97WJF
         Ux9eQ713qBkyS9bUe1Cy/xcAa6lVQkqI06wzl3GduylpXg2Z9GfZrY5bHXUIg1ChrBZi
         e5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=eqsXaCRQ1EXsD6mo3VNn2YiA+4RP2QzR0r48HBtMoGw=;
        b=to9MH59Xnx7IpyirGh78uGKhhV8osv5M7cxjCygWGKcNNVZSijZCgZHPXmq1wQRZpo
         ms+1Pgxobfx+k/bkquJa6siBMLnfv2K+RNFe/N5z6ctdhkKp9uJcWr6k4foc0DcRJzxr
         yeE+e3LBelQoc/i0IbPeXusu5eipAtji5gYtTduscO3SXiA+UAPPc/p3aWH+asFiGZdZ
         wcsB2WnWzgtzFwuAsEP4c7dxIE+mRUZUkYogNx3JoVltF+9JoDylQAx43Y32G5J1ljWf
         9Rp52Rs4cVkI+0NffIsyX8oQmABuYKbxHrLIYVDqiW7jfh77WIvvARL2TxWlqplFviv5
         U3xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=kFaOyKdI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 20si495351qvz.116.2018.10.17.12.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 Oct 2018 12:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=kFaOyKdI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:38722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCrO3-0007G0-9D
	for alex.bennee@linaro.org; Wed, 17 Oct 2018 15:21:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gCrNR-0007Dw-Jc
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 15:21:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gCrNQ-0006es-OY
	for qemu-devel@nongnu.org; Wed, 17 Oct 2018 15:21:05 -0400
Received: from mail-co1nam03on0118.outbound.protection.outlook.com
	([104.47.40.118]:2775
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Aaron@os.amperecomputing.com>)
	id 1gCrNI-0006N1-VM; Wed, 17 Oct 2018 15:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eqsXaCRQ1EXsD6mo3VNn2YiA+4RP2QzR0r48HBtMoGw=;
	b=kFaOyKdI/Je8JBw2t68wAEEv5cezd2HWumjCHcw+OKhEuzlo3MN3yyFeCM98XMNX2AnW7JLSdZvklfIfg6QVMzQHTyllBYjVxbUIA+uTami0p4/Q4m8tVDkQqH5ARoMcHEEbe+fE8lKKAMLcpS9LM47ogXVVThx0zp/YDoxqQww=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB3756.prod.exchangelabs.com (20.176.65.21) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.25; Wed, 17 Oct 2018 19:20:53 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8%4]) with mapi id 15.20.1250.020;
	Wed, 17 Oct 2018 19:20:53 +0000
From: Aaron Lindsay <Aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set PMCR.N to 4
Thread-Index: AQHUZkqtClSdP8CrKE6ECjIGAbu+Z6Uj0EWA
Date: Wed, 17 Oct 2018 19:20:53 +0000
Message-ID: <20181017192013.GA25905@quinoa.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-13-aclindsa@gmail.com>
	<0fdcad4a-c8b5-3309-d2ce-f9be901ec52a@linaro.org>
In-Reply-To: <0fdcad4a-c8b5-3309-d2ce-f9be901ec52a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BN6PR08CA0082.namprd08.prod.outlook.com
	(2603:10b6:404:b6::20) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB3756;
	6:YjD4+PJb1svevSCr2qmDcF9UaxHIif/M817Cc7xgw0iLdcFY90DcY601CKqWeXdpuK+WsZtCq0MdZFRyjI9zvs6xUVGOURXSp91W8G9PObeDDcofod4XpWwP7nDCyL+KHqxO0SS05p4tftPb7HWNiFQaoRXKae74JvAX7CSdOg26sR0MpTJk1+xmKS20heUNbe8AnciQRQPvx6gUnSu+T0GsME5r0XVByxv5FXB2FJDCTGmuWTC4++3wSF9z9OoL+Vxt30WPFaWodTOcbAUB6Z34TW3HLzBJTyiFomEAfqHPyP+1qspOjB2qrpQml+AiqEw7GOQ6HUdCMMo8lTi9rdZpjMtp1co4kNaYzsAo2777Pxv6toE+0pTyZIQizIbXpa6Z/zbqFwwhKJA7c11w6Sq0+xv1IfJUeG/0zdPzr4rCsgIoCkXgctHorsJnXbz5joTztDhvXq3OMUj/Pl7tGg==;
	5:xn3FRu/IYbVwuB5hKY+9TUdIuYvBl93AjaERHXQ44SALYkT1jPAvuMPSjNzXgaWTOQ11o9LoqG99gLBdgeIEjnoYpogNQK0bXUWXUC7l3LQZbccSfDwegbyf5/DVX2xt9JpGyEDT0u3aSlxlsgS3m4CHIvD35yCyHOavFE+oKo0=;
	7:4hKGxQwSFj/HrJrhKdQEXYjvUhEyf3a3VTCfhAbfu1uyyePaHTD+bmFUUAlYw0WcmciFX6PALhD7SR3jZAiwDEm15LiaOBhOJ44BpxQR/K86IEs00b9WLSeZSVxnmWtN0PaZxnQ+UgvL17B0FA+yVbKmCfpcHB4dTu2CfUoaIQ178sgHWc6HgurNzOphwFRKbmA1RY1kt9Ssk5SI6VOGQt55aNRPdDsijQ1AW5QaBTCVXQDf1kArqbOWLdEuWdGT
x-ms-office365-filtering-correlation-id: eda67b65-00fc-451a-1666-08d63465a767
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB3756; 
x-ms-traffictypediagnostic: DM6PR01MB3756:
x-microsoft-antispam-prvs: <DM6PR01MB375613433FC5E365B308A6D38AFF0@DM6PR01MB3756.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231355)(944501410)(52105095)(3002001)(149066)(150057)(6041310)(20161123562045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB3756; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB3756; 
x-forefront-prvs: 08286A0BE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(39840400004)(396003)(136003)(366004)(189003)(199004)(446003)(256004)(14444005)(486006)(476003)(11346002)(52116002)(86362001)(7736002)(105586002)(2900100001)(7416002)(97736004)(53546011)(26005)(106356001)(6506007)(25786009)(102836004)(99286004)(4326008)(80792005)(386003)(72206003)(76176011)(53936002)(6486002)(2906002)(186003)(81166006)(68736007)(5660300001)(6436002)(9686003)(6512007)(33656002)(5250100002)(66066001)(39060400002)(71190400001)(6116002)(71200400001)(8676002)(6916009)(14454004)(305945005)(316002)(33896004)(229853002)(6246003)(1076002)(3846002)(81156014)(54906003)(478600001)(8936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB3756;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:0; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: 2b58IwEvpHhN0pQ89hYmK94FfM29ObPjzUA8NFTESut4S1qk8nNh5qwOrwfzkrl1cLnyh0L+DUd1iJH3C1p3TmYvAh5X+HX8Zx7JmBEy4Gf1+pDCRJIJngsQURwARYOSwr9647OfomnbrUmu9mW4KFTJPympi4yNOe7QMB4tbXpkDlXoQyg51NTfAQ/OGno9nVKryn7gUzZ1H7AwndeZFiD9XW4OMdx5czjQfPxrf3jpk5/YP8iCG+i4tlSRX9ryTuYXKw0VGkrXYZw6wzQlP2n1YuqRJbhJOxSf+nEUAbTo+F1AKkMv5zhJPnMmQ71ZZ1QOXRDYJpjOPONbKL8+FyrkaPO6B0qeRPdISHF3cfs=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D7899A26DE492E4DB9800DF0DEE58AAE@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda67b65-00fc-451a-1666-08d63465a767
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2018 19:20:53.0860 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3756
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.118
Subject: Re: [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set PMCR.N to 4
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
Cc: Wei Huang <wei@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: twFPcAID0icq

On Oct 16 17:09, Richard Henderson wrote:
> On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> > This both advertises that we support four counters and enables them
> > because the pmu_num_counters() reads this value from PMCR.
> >=20
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/helper.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> It looks like this should have been folded into patch 10,
> or patch 10 split to include the code changes that go with
> these comment changes.

By setting PMCR.N to 4, this commit is what causes all the previous
implementation of non-PMCCNTR counters to become usable by the guest -
both because the OS can now detect their presence in PMCR, and because
the system registers used to setup/access the counters are gated on
pmu_num_counters(), which uses PMCR.N to determine if a counter is
implemented.

That said, I'm not against merging the two patches if you feel that is
cleaner.

-Aaron
