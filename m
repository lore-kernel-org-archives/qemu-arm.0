Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2789305wrt;
        Thu, 18 Oct 2018 12:55:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV630TgX5r1CayvwL651KQO8AuGvGs7UBcepPfwIttRvvTjX/5B3526V59iu0gZqZ37ujWBCF
X-Received: by 2002:ac8:88c:: with SMTP id v12-v6mr29792112qth.297.1539892525434;
        Thu, 18 Oct 2018 12:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539892525; cv=none;
        d=google.com; s=arc-20160816;
        b=E6I4vCYrk6ETJEBJ19nTgDrVtNAmNuBwzp8ONnhCFlQ5vIxtFAV2TTRCbwdMdbPK9L
         QxSn/lvOO6bL45PH05+0rwRpThpPNcWCx6WaPcRphCGmenON30gffkSXim1YBm5Htstw
         qthZxI5cmNGqrlmlEI/0/FXZsXTqRijmrGMoXBpoImophkiCjdP2x7LmCdX7iHczlXfZ
         7F29L2FZsWOCO0c07ojBBHjKqd9SUlJ6GQwpN7Y7IzRNa2g1CykBudkX9WBjissCKQ8W
         +tf4qAcuIsX0/xdYFcZCNvlnJoTs7UrocVShc24yKx94TtUXKxx4vQyn7JXCbRtbuIi2
         pXbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version
         :content-transfer-encoding:content-id:spamdiagnosticmetadata
         :spamdiagnosticoutput:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:to:from
         :dkim-signature;
        bh=K668+9ZuzDG0ngYIm+yUrzZnzjt+9AjMfHDOzi6YYb4=;
        b=F8so7RUGDnXtB42ZfeqwM+kQZAPFMLArQn2N8SGhVDnmz1bnbF+7oj9RffoMIog/c4
         17C3LTqz0X6yng3gNMMKhznJC0PnYPDdAK3+cwfzqqOnfFgMWopIkrT7llYnUsXEE3TQ
         w1228jF3dTDzq+8MHkhgw8OkyauuME+NQwJsefHkvXJ/NZkkvHRCQrx8vWhiJTIonnX8
         R4uhi4HemvuXUdq0/BgsChyJva8otUfTrpqRFzChB2RcLD8JOy0ly2NtGyuoKtw+4gOX
         1nki24DnJl1pupfsRp5CvZoYCce9NIJuGwHuhCYhBR7CmrZ2DykoHHAd3yW+n7jme2sh
         qtWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Xl78ufxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si7808098qvq.48.2018.10.18.12.55.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 12:55:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@amperemail.onmicrosoft.com header.s=selector1-os-amperecomputing-com header.b=Xl78ufxg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amperecomputing.com
Received: from localhost ([::1]:44198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDEOD-0004cD-11
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 15:55:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gDEO4-0004bt-E1
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 15:55:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Aaron@os.amperecomputing.com>) id 1gDENx-0007V8-6w
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 15:55:13 -0400
Received: from mail-eopbgr680111.outbound.protection.outlook.com
	([40.107.68.111]:52800
	helo=NAM04-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Aaron@os.amperecomputing.com>)
	id 1gDENw-0007T5-UW; Thu, 18 Oct 2018 15:55:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amperemail.onmicrosoft.com; s=selector1-os-amperecomputing-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=K668+9ZuzDG0ngYIm+yUrzZnzjt+9AjMfHDOzi6YYb4=;
	b=Xl78ufxg8f/p38jyRq7rMMHO3RfrC+WtdVDQgAwjSC0686YZhxyTR/0DLlr2MXKLEsR5bLLCiE8sDhkFYgyu8jup7KZPk6f2Y3PGZCZcmyPtOoe8jYdt/H4JA531GqmT5L4zed6mSI37l1WKKTGFoKZZCGN/bsxjVM6vsZx9LS4=
Received: from DM6PR01MB4825.prod.exchangelabs.com (20.177.218.222) by
	DM6PR01MB5131.prod.exchangelabs.com (20.176.121.87) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.26; Thu, 18 Oct 2018 19:55:04 +0000
Received: from DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8]) by DM6PR01MB4825.prod.exchangelabs.com
	([fe80::e89d:b810:e11c:e1e8%4]) with mapi id 15.20.1250.020;
	Thu, 18 Oct 2018 19:55:04 +0000
From: Aaron Lindsay <Aaron@os.amperecomputing.com>
To: Richard Henderson <richard.henderson@linaro.org>
Thread-Topic: [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set PMCR.N to 4
Thread-Index: AQHUZkqtClSdP8CrKE6ECjIGAbu+Z6Uj0EWAgAAEBoCAAA4agIAADd8AgAF8CQA=
Date: Thu, 18 Oct 2018 19:55:04 +0000
Message-ID: <20181018195456.GF12691@quinoa.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-13-aclindsa@gmail.com>
	<0fdcad4a-c8b5-3309-d2ce-f9be901ec52a@linaro.org>
	<20181017192013.GA25905@quinoa.localdomain>
	<31f327f4-42ee-55fc-596d-97d935803867@linaro.org>
	<20181017202505.GC25905@quinoa.localdomain>
	<ddceb720-97d2-22fa-e58a-7283fb416c29@linaro.org>
In-Reply-To: <ddceb720-97d2-22fa-e58a-7283fb416c29@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CY4PR15CA0012.namprd15.prod.outlook.com
	(2603:10b6:910:14::22) To DM6PR01MB4825.prod.exchangelabs.com
	(2603:10b6:5:6b::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Aaron@os.amperecomputing.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.85.170.154]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB5131;
	6:UgO77XpK6ZK2WaYn9UQWJP58GUQJIapMKRDZZnz//cLUPgBvQMoFRVad6J1xiY31aiI6L58hxS+7VlgoXfj/yGVU7WXxCcJeOwZtx3TfVKVf11S4yYWUuntHdpg8jkNjOZHbBCLRYi+0uHQURNBtCmIPdOBZZfL4Qx6MNIWDiy29iK4W5FH6CRbEzoA//FzLvNl39LbEmGClH4l2ovWiwuDqCa2fk8AH/Fbg9b7BaYfZucX3osGcEEEkFvZ3dS+A2fTUFKowEvJd2BtDhh7FK1Wn2iHy1xCR+MHzaj+9HaUetX25DI49TLU4/cZO/J7sWu6rAwrZqCIXHV7KUlrADKlU9nZf+/cB1N69aU6Hn5Yx810J/Otmv76XbCiIMG6hD3o2CiXPYp9Aap//dW11t8fk4APKvBPlBZbATzwiZ+QRYASS238C7HV0hd2VNBv1YHcwTI+6JZ0aPTR37fID2g==;
	5:YPAoCZynRyBq3jWNUY9MUQfXnmwUD/HakvwTpz12gQgHBby7e2p5zKU1NaVirFyw7IaSFvlmcaoqqpWKSUb2NbNorc3Q0c0vPDe9f1gQxrUAcOi/i85/QI0qSckwOcsolnhDbQr0n3abw+LZhZGH5sj9MPSLZ460CSMvWogL05g=;
	7:fBzSSiDrTKYtXq2w1KUQTcEOcOJeTfGs4B28gPr1i26L6DcUEfWndSVf1YOuz8AMrJpdJ0KKfr3tFPBqSvodelIZmij3zbF9Ka5IgV+bnVQRcJVVkeni1FAGkFGxP39bdi1kLrU4gnjoxm7asbgbHjS7sdDgQFzF0hyJd7M7/4MnXRF8D22lYGlLS0zBg64lQDH5HuVZ7t3Ktwo8yPrr1BHq0wQtfDFJlE53n4qkvxCFyORtF+fUPm74GjRXSzvQ
x-ms-office365-filtering-correlation-id: 19d7841f-abb3-4406-57e4-08d6353398d8
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(5600074)(711020)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7153060)(7193020);
	SRVR:DM6PR01MB5131; 
x-ms-traffictypediagnostic: DM6PR01MB5131:
x-microsoft-antispam-prvs: <DM6PR01MB51319A039B7162FE94F7E8818AF80@DM6PR01MB5131.prod.exchangelabs.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149066)(150057)(6041310)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:DM6PR01MB5131; BCL:0; PCL:0; RULEID:; SRVR:DM6PR01MB5131; 
x-forefront-prvs: 08296C9B35
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(39840400004)(366004)(136003)(346002)(199004)(189003)(52314003)(186003)(486006)(26005)(72206003)(39060400002)(25786009)(14454004)(71200400001)(508600001)(305945005)(6436002)(53936002)(316002)(6486002)(7736002)(7416002)(102836004)(1076002)(11346002)(446003)(71190400001)(86362001)(229853002)(476003)(2906002)(6512007)(9686003)(97736004)(4326008)(80792005)(5250100002)(6246003)(54906003)(105586002)(93886005)(3846002)(106356001)(8936002)(6916009)(81166006)(256004)(76176011)(66066001)(68736007)(81156014)(5660300001)(8676002)(99286004)(6506007)(53546011)(2900100001)(33896004)(52116002)(386003)(6116002)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR01MB5131;
	H:DM6PR01MB4825.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: os.amperecomputing.com does not
	designate permitted sender hosts)
x-microsoft-antispam-message-info: FdW7U2uyL8RgSXzi7N0IjY1YJQJvvsUnOYgLTNc5ymPorA3AD16WG1Bs3GcEaUju/Niuru37zKvCaRDASjPcwNAOhCUBH2yTEX9KrTmmRhIMkg/gD5ZvRGgJiXMqO5uYUCNAxWWcw4ow5fQnVbP88mEv+O6haxpkQ4WvW1g3kY1nHvkqLPQwBsEMy1/AMd6qfpAlR++zxjuukspHzS9nymIhjlczxsyN6bKBHNI/9YPHqMwzb2ib6eVa5ETGoNbNTQPKLElXJMybUNzLHHDGMefZfCd90BXzL+QFQx5H65wx9DrouObXima1pgGctLSLTTF3NHiWDRzjbb5FXa3sr1iqoHMLt+o/KMeVrSXI0EA=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DCF50956F035B347998E5F63B6B81EB6@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d7841f-abb3-4406-57e4-08d6353398d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2018 19:55:04.7295 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5131
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 40.107.68.111
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 12/14] target/arm: PMU: Set
 PMCR.N to 4
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u1vq9NIz1eDL

On Oct 17 14:14, Richard Henderson wrote:
> On 10/17/18 1:25 PM, Aaron Lindsay wrote:
> > I suppose pmcrn (the local variable) should've been set to 0 before thi=
s
> > patch and updated here to be 4.
>=20
> That's plausible.
>=20
> > Anyway, by splitting these patches apart, my intention was to separate
> > the plumbing work from turning on the water. If you believe it is bette=
r
> > to do both in the same patch, I'll make that change for v7.
>=20
> Fair.  I'll let Peter weigh in for final decision.

At a minimum, I've updated my local tree so that pmcrn is initially set
to 0 in 'target/arm: Finish implementation of PM[X]EVCNTR and
PM[X]EVTYPER' and updated to 4 in this patch. And I'll squash them
instead if that ends up being the decision.=20

-Aaron
