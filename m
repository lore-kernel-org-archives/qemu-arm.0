Received: by 10.25.159.19 with SMTP id i19csp1718657lfe;
        Mon, 8 Feb 2016 21:42:04 -0800 (PST)
X-Received: by 10.140.175.7 with SMTP id v7mr41748384qhv.103.1454996524527;
        Mon, 08 Feb 2016 21:42:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g188si34252991qkb.10.2016.02.08.21.42.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 21:42:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:52074 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aT13s-0003xY-0k
	for alex.bennee@linaro.org; Tue, 09 Feb 2016 00:42:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aT13p-0003xK-I8
	for qemu-arm@nongnu.org; Tue, 09 Feb 2016 00:42:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aT13m-0002SY-Ad
	for qemu-arm@nongnu.org; Tue, 09 Feb 2016 00:42:01 -0500
Received: from mail-bn1bbn0107.outbound.protection.outlook.com
	([157.56.111.107]:51639
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aT13m-0002SU-4Q; Tue, 09 Feb 2016 00:41:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=uPllzAK3ExFjL1oAzJW4Ic0qi3mQuEt7vzFH2FqUHtY=;
	b=cSaZw3R4EaAn+8+61OVeBzqYrrGSaqZVa+yKlttW4EDpVWF1O9c914tcOwbL4EmW39TQmgitH2FHVxvPsWyThfF2YFu8GOinI+fGIx4qyX5hpAkGUH+Zx7bR3pgC5ZRgVyYDYtIbWzRiHnXCK8K/9fcCDDdSjc/qSLMvHGG7kvU=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.403.16; Tue, 9 Feb 2016 05:41:56 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0403.017; Tue, 9 Feb 2016 05:41:56 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Stephen Warren <swarren@wwwdotorg.org>, Peter Maydell
	<peter.maydell@linaro.org>
Thread-Topic: [PATCH V2] bcm2835_property: implement "get board revision" query
Thread-Index: AQHRYvaK1cnSukCkdE63k02sI0Zye58jMl9A
Date: Tue, 9 Feb 2016 05:41:56 +0000
Message-ID: <BLUPR0301MB2034738A097725F02E582A2A9ED60@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1454993910-24077-1-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1454993910-24077-1-git-send-email-swarren@wwwdotorg.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wwwdotorg.org; dkim=none (message not signed)
	header.d=none;wwwdotorg.org; dmarc=none action=none
	header.from=microsoft.com;
x-originating-ip: [129.94.8.223]
x-ms-office365-filtering-correlation-id: e6076a4b-c7df-4029-5b11-08d33113b913
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:5NCchUeZkove53YuY2cT6Uwc77DAN9DouiWm9LwE6OCmdQs5RuIy5eTfXaekMxhBkBt1/2m6XpDVEjkfXaH7LmsCfW5TedT5cDY7hzJlEC/O/t1Cfhl8lC7Ecp50DAkdKSlounfSKoRJx5LLFvzrRw==;
	24:yE/mldmRM4xGjukPt1JE1uQJrWOZAnxRE2VFxhNMHRVwoagw5neU4S5dOu+jkwrsifSV5ysCt+3wB84u3l2npTDH9Ut9d2q2GTQ5SWATYUA=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB20346142EC574DBAC6E5AFFA9ED60@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 08476BC6EF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(377454003)(164054003)(6116002)(76176999)(87936001)(10290500002)(5002640100001)(54356999)(50986999)(19580405001)(10090500001)(106116001)(5001770100001)(86612001)(19580395003)(66066001)(5004730100002)(5003600100002)(86362001)(5008740100001)(5001960100002)(10400500002)(5005710100001)(11100500001)(33656002)(3280700002)(3660700001)(74316001)(1096002)(189998001)(586003)(1220700001)(2906002)(102836003)(40100003)(122556002)(4326007)(3846002)(92566002)(76576001)(77096005)(2900100001)(2950100001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2016 05:41:56.6064 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.107
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH V2] bcm2835_property: implement "get board
	revision" query
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gXVXzTLZblHD

> From: Stephen Warren [mailto:swarren@wwwdotorg.org]
> Sent: Tuesday, 9 February 2016 3:59 PM
>=20
> Return a valid value from the BCM2835 property mailbox query "get board
> revision". This query is used by U-Boot. Implementing it fixes the first
> obvious difference between qemu and real HW.
>=20
> The value returned is currently hard-coded to match the RPi2 I own. Other
> values are legal, e.g. different board manufacturer field values are like=
ly to
> exist in the wild.
>=20
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
> ---
> V2: Set the property in raspi.c, and pass it through to the property mbox
> code via property aliases.

Reviewed-by: Andrew Baumann <Andrew.Baumann@microsoft.com>

Thanks,
Andrew
