Received: by 10.25.205.13 with SMTP id d13csp7239395lfg;
        Fri, 30 Dec 2016 03:47:14 -0800 (PST)
X-Received: by 10.237.62.153 with SMTP id n25mr47290830qtf.50.1483098434885;
        Fri, 30 Dec 2016 03:47:14 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n71si24547510qka.65.2016.12.30.03.47.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Dec 2016 03:47:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nokia.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=nokia.com
Received: from localhost ([::1]:39453 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cMveT-0006GB-Pk
	for alex.bennee@linaro.org; Fri, 30 Dec 2016 06:47:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cMveP-0006Ef-3g
	for qemu-arm@nongnu.org; Fri, 30 Dec 2016 06:47:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcin.krzeminski@nokia.com>) id 1cMveN-0007Lh-TP
	for qemu-arm@nongnu.org; Fri, 30 Dec 2016 06:47:09 -0500
Received: from mail-db5eur01on0136.outbound.protection.outlook.com
	([104.47.2.136]:24480
	helo=EUR01-DB5-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcin.krzeminski@nokia.com>)
	id 1cMveJ-0007Kw-08; Fri, 30 Dec 2016 06:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.onmicrosoft.com; 
	s=selector1-nokia-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=R90+hRhakZG3IrlFpplOB7bdKXKorqsqUwLGNQRy8Xo=;
	b=T5HvZW9CMjXMpC00wYSHsabp+zxJKk+3XOB87OKKPPYpDu+XS5hfYWWxaK3zaa6jDmF2jKpPMHLemmtBlKRB0sg9zUcL6JfTfNaqY6qFsdJiGSqe2+tCA8YRLVJuQffSEV9svSCYt2okF+cSxnZOQdOv9bWY3eq0i3IQccTMnqg=
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com (10.167.132.139) by
	AM4PR0701MB2132.eurprd07.prod.outlook.com (10.167.132.141) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.817.5;
	Fri, 30 Dec 2016 10:13:17 +0000
Received: from AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) by
	AM4PR0701MB2130.eurprd07.prod.outlook.com ([10.167.132.139]) with
	mapi id 15.01.0817.009; Fri, 30 Dec 2016 10:13:17 +0000
From: "Krzeminski, Marcin (Nokia - PL/Wroclaw)" <marcin.krzeminski@nokia.com>
To: Peter Maydell <peter.maydell@linaro.org>
Thread-Topic: [RFC 1/3] nvic: Add CPU numebr property
Thread-Index: AQHSV5+Fz/O50VPgpUq/4+yMTaToVqEKn2oAgBW6N5o=
Date: Fri, 30 Dec 2016 10:13:17 +0000
Message-ID: <AM4PR0701MB2130E7AB34BFBB36FCB75E53FE6A0@AM4PR0701MB2130.eurprd07.prod.outlook.com>
References: <1481894559-13974-1-git-send-email-marcin.krzeminski@nokia.com>
	<1481894559-13974-2-git-send-email-marcin.krzeminski@nokia.com>,
	<CAFEAcA-ODRCg1t=6iFBE5oue8X5GSHDXYWV2uy6sFttE8_tG6Q@mail.gmail.com>
In-Reply-To: <CAFEAcA-ODRCg1t=6iFBE5oue8X5GSHDXYWV2uy6sFttE8_tG6Q@mail.gmail.com>
Accept-Language: pl-PL, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=marcin.krzeminski@nokia.com; 
x-originating-ip: [25.163.180.4]
x-ms-office365-filtering-correlation-id: 31b8589f-1206-4a2b-34a2-08d4309c7964
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
	SRVR:AM4PR0701MB2132; 
x-microsoft-exchange-diagnostics: 1; AM4PR0701MB2132;
	7:WNLnn2h1YUw/70jt3ezbAnyM2SE7r+NZOUC3p2ZSUFtPD8LOgJck0S97OhugUkQok42V/3uK1jvPVOhIgmMfhXqI4Gqp46kGZpJaCHLpqG85Y+TUsGR9KK3q+WcArMB5B3hGiB/rLyY73IaYCyYgKW+2fRkrts0tgP654Jy3Exf4DtYd29WpXa9hNK0C5eu1vKPWCLtIZ5uaMpQ+v4wIAVU22fqIhxYdOuKzcK5vOdZTWAdMC1WBHFNyx/hEW92SD7C2p7Ds9cdZmT/j5Q1AKI/3L7N3CQQid5x5yoA7SF7+MVCheafLVe52RzEL+NN7MipjcO1VEXffOKVIQZpJNA4rZG2n3DS8SaNILyn2xgHScu9lnM/tGIvOl1EMFrg19QHrlK0eJuU2olI9VBFqr/8bh5oaVAJsqTQQ08s8nzfamIkI5UkcNDBBU0SsUyK4F4p2M5n4QSYpQNOg/hxKJg==
x-microsoft-antispam-prvs: <AM4PR0701MB2132F80950E8BE52BA5E7487FE6A0@AM4PR0701MB2132.eurprd07.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(82608151540597);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6055026)(6041248)(20161123564025)(20161123562025)(20161123555025)(20161123560025)(6072148);
	SRVR:AM4PR0701MB2132; BCL:0; PCL:0; RULEID:;
	SRVR:AM4PR0701MB2132; 
x-forefront-prvs: 0172F0EF77
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39840400002)(39410400002)(39450400003)(39860400002)(39850400002)(189002)(199003)(24454002)(6916009)(38730400001)(2950100002)(25786008)(4326007)(5660300001)(6436002)(122556002)(92566002)(2906002)(77096006)(86362001)(6506006)(102836003)(3846002)(39060400001)(55016002)(6116002)(99286003)(9686002)(8676002)(2900100001)(66066001)(106356001)(97736004)(106116001)(74316002)(7736002)(305945005)(8936002)(50986999)(76176999)(81166006)(54356999)(189998001)(81156014)(68736007)(33656002)(110136003)(101416001)(105586002)(7696004)(3280700002)(3660700001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM4PR0701MB2132;
	H:AM4PR0701MB2130.eurprd07.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: nokia.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2016 10:13:17.4303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0701MB2132
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.2.136
Subject: [Qemu-arm] Odp.: [RFC 1/3] nvic: Add CPU numebr property
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
Cc: "rfsw-patches@mlist.nokia.com" <rfsw-patches@mlist.nokia.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"mar.krzeminski@gmail.com" <mar.krzeminski@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lvt95nKB2ZSq

Hi Peter,

sorry for late response - I missed your email.

> On 16 December 2016 at 13:22,  <marcin.krzeminski@nokia.com> wrote:
>> From: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>>
>> In case of MultiCPU SoC M3 is not always CPU0.
>> This commit add cpu_id property to allow set CPU
>> number for NVIC model. Also address space that this used
>> by NVIC is updated to mach CPU's one.
>>
>> Signed-off-by: Marcin Krzeminski <marcin.krzeminski@nokia.com>
>
> The right fix for this I think is probably for the NVIC to
> have an actual pointer to its CPU object, which the armv7m_init
> code sets up (perhaps with QOM links?) when it creates the CPU
> and the NVIC. The two really do need to be closely coupled,
> and the CPU already has a pointer to its NVIC. There's
> no need for the NVIC to get the CPU pointer by looking it up
> by CPU ID.

I was thinking about similar solution (maybe the same as you did in GIC v3)=
.
Generally this should be done automatically without any user interact.
>
> Once I've got the GICv3 virtualization out of the way, the
> next thing on my todo list is to pick up the NVIC refactoring
> that Michael Davidsaver posted last year:
>  https://lists.nongnu.org/archive/html/qemu-devel/2015-12/msg00504.html
> which makes some moves in that direction (though it doesn't
> init the NVIC's CPU pointer with a link, it just assumes
> first_cpu).

That is good news ;]. I think we can postpone this work until NVIC
refactoring will be finished.

Thanks,
Marcin
>
> thanks
> -- PMM
>

