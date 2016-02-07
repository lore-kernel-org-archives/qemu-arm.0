Received: by 10.25.159.19 with SMTP id i19csp1036213lfe;
        Sun, 7 Feb 2016 14:38:09 -0800 (PST)
X-Received: by 10.140.108.181 with SMTP id j50mr29245707qgf.104.1454884689356;
        Sun, 07 Feb 2016 14:38:09 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q18si6559154qkh.45.2016.02.07.14.38.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 Feb 2016 14:38:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:38838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSXy4-0006tz-Q3
	for alex.bennee@linaro.org; Sun, 07 Feb 2016 17:38:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aSXy2-0006tj-7H
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 17:38:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aSXxy-0003ia-34
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 17:38:06 -0500
Received: from mail-bn1bon0138.outbound.protection.outlook.com
	([157.56.111.138]:26806
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aSXxx-0003hr-RW
	for qemu-arm@nongnu.org; Sun, 07 Feb 2016 17:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=RpcSB0w/oekpFtZbX75RZ0uNtE6x4at1BbtgeSUuT5s=;
	b=ATBq9/JjB+4LWe2JUmlC0//U9tYOgu3JFhRWwTyFjE8mJEa82BP4RPMuKhGu8rEABnDnzOVxenBHKCTSGuJRfjPVKemdGuOiFK4kBK7qHg+oLhx4aNLi/Dr2eG9Ahd0UEKpadFK9Zz/lc1ZyeEJqs1rwfrux5tgl04GU4erqwjo=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) with Microsoft
	SMTP Server (TLS) id 15.1.403.16; Sun, 7 Feb 2016 22:37:59 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0403.016; Sun, 7 Feb 2016 22:37:59 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: Stephen Warren <swarren@wwwdotorg.org>, Peter Maydell
	<peter.maydell@linaro.org>
Thread-Topic: [PATCH] bcm2835_property: implement "get board revision" query
Thread-Index: AQHRYWW7p5/4i8b4T0OgZ6bFlnQrc58hK8Iw
Date: Sun, 7 Feb 2016 22:37:59 +0000
Message-ID: <BLUPR0301MB20343F80372F1202A8EF2D3A9ED40@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1454821757-27964-1-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1454821757-27964-1-git-send-email-swarren@wwwdotorg.org>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: wwwdotorg.org; dkim=none (message not signed)
	header.d=none;wwwdotorg.org; dmarc=none action=none
	header.from=microsoft.com;
x-originating-ip: [129.94.8.223]
x-ms-office365-filtering-correlation-id: 9aae450a-c83a-4ef3-e131-08d3300f551c
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2034;
	5:HkaU/qUXyWo6Sqj2iruCmf7H9/GuqfObBbrNE6S715rlt0BYyLsxODpuo09585nXPpS2JPRJtPg2g3k8cSl0/r1bZwkoh7S35yYFXzr2NuWR8z0XkszY4iQGBNNNZT+fZDVrtrGyDPmk/pVqHBEYJg==;
	24:pi0c316iC/6er0rb1jx1O9/GHO7uFn521S65AeHM9cgGkXe792AHx3zsN6hG/IrLNUTAjwD11WtzDJfUfgrJgc4siBxKSUznK+vAt5SZMVI=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2034;
x-microsoft-antispam-prvs: <BLUPR0301MB2034B4398DCDA48E93A185649ED40@BLUPR0301MB2034.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2034; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2034; 
x-forefront-prvs: 08457955C4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(51414003)(164054003)(377454003)(33656002)(11100500001)(1096002)(1220700001)(66066001)(2906002)(3846002)(586003)(102836003)(5003600100002)(10090500001)(3660700001)(3280700002)(76576001)(5002640100001)(8990500004)(10290500002)(87936001)(4326007)(74316001)(189998001)(40100003)(86612001)(5001770100001)(19580395003)(54356999)(76176999)(50986999)(19580405001)(5008740100001)(5001960100002)(122556002)(5004730100002)(92566002)(106116001)(15975445007)(77096005)(5005710100001)(10400500002)(2950100001)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2034;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2016 22:37:59.8095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2034
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.111.138
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: implement "get board
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
X-TUID: f4M4uQZqUT5B

Hi Stephen,

Thanks for the patch!

> From: Stephen Warren [mailto:swarren@wwwdotorg.org]
> Sent: Sunday, 7 February 2016 4:09 PM
>=20
> Return a valid value from the BCM2835 property mailbox query "get board
> revision". This query is used by U-Boot. Implementing it fixes the first
> obvious difference between qemu and real HW.
>=20
> The value returned is currently hard-coded to match the RPi2 I own. Other
> values are legal, e.g. different board manufacturer field values are like=
ly to
> exist in the wild. When support for other RPi models is added, the value =
can
> be made dynamic.
>=20
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Signed-off-by: Stephen Warren <swarren@wwwdotorg.org>
> ---
> This looks like the only non-video-related mailbox request used by U-Boot
> that wasn't implemented by qemu.
>=20
> The only other feature required for U-Boot to get to its command prompt i=
s
> the BCM2835 timer.
>=20
> Andrew, I assume you're actively working on mainlining all the features i=
n
> your github branch? I look forward to U-Boot working on qemu:-)

That's right, although I probably won't get the next round of patches out u=
ntil late Feb. However, my goal in that series is to merge support for Pi1,=
 so:

* Do you know where we can find the appropriate values for Pi1 boards?
* Can you please propagate the board-rev property through bcm2835_periphera=
ls and bcm2836 so that the appropriate value is being set in the board defi=
nition file (raspi.c)? This should be as simple as a few calls to object_pr=
operty_add_alias(), e.g.:
https://github.com/0xabu/qemu/blob/raspi/hw/arm/bcm2836.c#L42

Thanks,
Andrew
