Received: by 10.25.208.211 with SMTP id h202csp3516937lfg;
        Fri, 26 Feb 2016 11:21:49 -0800 (PST)
X-Received: by 10.140.240.87 with SMTP id l84mr4450126qhc.69.1456514509346;
        Fri, 26 Feb 2016 11:21:49 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g81si14490130qkb.56.2016.02.26.11.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 11:21:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@microsoft.com;
       dmarc=fail (p=NONE dis=NONE) header.from=microsoft.com
Received: from localhost ([::1]:51739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZNxU-0001kF-P1
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 14:21:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56872)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZNxS-0001k8-95
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 14:21:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>) id 1aZNxO-0001mp-5A
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 14:21:46 -0500
Received: from mail-by2on0106.outbound.protection.outlook.com
	([207.46.100.106]:34813
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Andrew.Baumann@microsoft.com>)
	id 1aZNxN-0001lF-8x; Fri, 26 Feb 2016 14:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
	s=selector1; h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=b8D90XqenNNZz0qKpYGHflm+J27HcmPzu4fEu82+dew=;
	b=aMMREzz7ZE6SPB4YMXgFf/5HsqV0/vb0muq7FwKzr4j+BIicLXb7bM22tVS1l+r/G50oXtx+nY9NuyOVH9krUm5p0552G7Du/+vyo4M5RuGt8po/GVYMU4+E7HbNNtkbrcNqDatyb0ZVMkao4f7IL/GDB4TzkjurMmyQaTg0xxQ=
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com (10.164.22.24) by
	BLUPR0301MB2036.namprd03.prod.outlook.com (10.164.22.26) with Microsoft
	SMTP Server (TLS) id 15.1.415.20; Fri, 26 Feb 2016 19:21:38 +0000
Received: from BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) by
	BLUPR0301MB2034.namprd03.prod.outlook.com ([10.164.22.24]) with mapi id
	15.01.0409.024; Fri, 26 Feb 2016 19:21:38 +0000
From: Andrew Baumann <Andrew.Baumann@microsoft.com>
To: John Snow <jsnow@redhat.com>, Mats Malmberg <mats.malmberg@tritech.se>,
	Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [Qemu-devel] [Qemu-arm] help on how to emulate rasbperry pi 2
Thread-Index: AQHRbyuhTtcp6DFdR0aZb1Ld0rYnj587fCNggAAHpQCAAAYYoIACiHMAgACBTYCAAAGGAIAACX6AgAAWEjA=
Date: Fri, 26 Feb 2016 19:21:38 +0000
Message-ID: <BLUPR0301MB203446D00A8977C4812E88B59EA70@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <605392182193B84A99A143D9DA347B52FB8AA7@post>
	<CAFEAcA9xvDiHAc6Tu-PLbjd=RruX1c+vpfZg+ZvtH5t3DSyUOw@mail.gmail.com>
	<BLUPR0301MB2034905DFE5B0135A1BE897A9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<56CDF624.6050104@redhat.com>
	<BLUPR0301MB2034F3C40B01A1A3536A837C9EA50@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<605392182193B84A99A143D9DA347B52FB8B57@post>
	<56D087AD.3040001@redhat.com>
	<BLUPR0301MB20345BC8FEA7B3A86AB1926B9EA70@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<56D090EB.3000908@redhat.com>
In-Reply-To: <56D090EB.3000908@redhat.com>
Accept-Language: en-AU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none; redhat.com;
	dmarc=none action=none header.from=microsoft.com; 
x-originating-ip: [2001:4898:80e8:a::724]
x-ms-office365-filtering-correlation-id: 43fb37d1-d9b3-487c-8773-08d33ee20ccc
x-microsoft-exchange-diagnostics: 1; BLUPR0301MB2036;
	5:s4C8PAJD/kaXMAQa1jEHthZIoeXojEpusbZAswk+/f+7mYtIAclNLal2JnvqkxtHUwh4zbTz8hghtHgfFx8DPJIJ955ALYjkiN1ZDz38t3rembXaNxEIuGo9RKwp/UuSvn/csrB3ry6ZIpsDsFRY9Q==;
	24:ybbtDFKq6MAhWt2BGe2jUbdAAb0iuag6mDd8ubH4ydnbbkPlpu4RoL7Y/D4I/Js1OR+1v6mFOu5R7XPNgc2NkQizCplUnC5TA8Cu8WnhbeM=
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR0301MB2036;
x-microsoft-antispam-prvs: <BLUPR0301MB203677751142F75D0C9DB6219EA70@BLUPR0301MB2036.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(61425038)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(61426038)(61427038);
	SRVR:BLUPR0301MB2036; BCL:0; PCL:0; RULEID:;
	SRVR:BLUPR0301MB2036; 
x-forefront-prvs: 0864A36BBF
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(479174004)(377454003)(24454002)(52314003)(11100500001)(5001770100001)(5003600100002)(74316001)(3280700002)(2950100001)(2900100001)(93886004)(33656002)(3660700001)(19580405001)(19580395003)(10090500001)(5005710100001)(10400500002)(5004730100002)(86362001)(10290500002)(8990500004)(87936001)(189998001)(4326007)(77096005)(76176999)(50986999)(54356999)(15975445007)(5001960100002)(2906002)(5008740100001)(5002640100001)(106116001)(40100003)(76576001)(99286002)(6116002)(102836003)(586003)(92566002)(1096002)(1220700001)(122556002)(3826002)(460985005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR0301MB2036;
	H:BLUPR0301MB2034.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2016 19:21:38.5602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR0301MB2036
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.106
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel]  help on how to emulate rasbperry pi 2
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
X-TUID: OMAsaArLzW1S

> From: John Snow [mailto:jsnow@redhat.com]
> Sent: Friday, 26 February 2016 9:53 AM
>=20
> On 02/26/2016 12:23 PM, Andrew Baumann wrote:
> >> From: John Snow [mailto:jsnow@redhat.com]
> >> Sent: Friday, 26 February 2016 9:13 AM
[...]
> >> Andrew, you might want to update the examples on that wiki: it looks
> >> like with recent changes that "-sd" was temporarily insufficient for
> >> getting a proper instance running.
> >>
> >> Maybe you should also add some examples that use the -drive/-device
> >> combo that we canonically support in addition to the sugared -sd/-hda.
> >>
> >> Mats: for now, try grabbing the latest qemu master, it fixed a bug wit=
h
> >> -sd. :)
> >
> > Yes, John's right, please try now and this bug should be fixed.
> >
> > There was a regression in qemu-master for about a week, fixed by:
> > https://lists.nongnu.org/archive/html/qemu-devel/2016-
> 02/msg05733.html
> >
> > John, AFAIK there was no way to have working SD without this patch (the
> code to hook up the block device didn't exist), so I don't think there's =
much
> point updating the wiki.
> >
> > Cheers,
> > Andrew
> >
>=20
> `-drive if=3Dnone,id=3Dsd0,file=3Detc.img,format=3Draw
>  -device sd-card,drive=3Dsd0,bus=3Dsd-bus`
>=20
> doesn't work?

No, that doesn't work, but don't ask me why. After commenting out the new c=
ode in raspi.c, I get:

./qemu-system-arm.exe -M raspi2 -bios e:/raspi/th2_10556_uefi.img -drive if=
=3Dnone,id=3Dsd0,file=3De:/raspi/th2_10556_pi2.vhd,format=3Draw -device sd-=
card,drive=3Dsd0,bus=3Dsd-bus
E:\qemu\build64\arm-softmmu\qemu-system-arm.exe: Device with id 'sd0' alrea=
dy exists

Changing the id to sd1 proceeds, but results in an unbootable system (looks=
 like there is no card in the device). I don't know what creates sd0. In fa=
ct, I tried putting the new code back, so -sd works, but the invocation you=
 gave me above still fails the same way.

> The code to "hook up the block device" was added to the board init, but
> that's for if=3DSD devices as added by -sd. the -drive/-device combo
> should work anyway, because you are explicitly hooking it up via -device.
>=20
> I guess the QOMification of SD is new, but usually we recommend/prefer
> scripts and clients to use the explicit drive/device syntax above
> instead of the -sd or -hda syntactic sugar. Real actual people can still
> use -sd/-hd -- but they're prone to breakage as you've seen.

Thanks for the explainer. As you can see, I haven't been able to grok the -=
drive -device syntax yet :)

Andrew
