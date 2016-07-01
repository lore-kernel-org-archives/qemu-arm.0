Received: by 10.25.21.96 with SMTP id l93csp169324lfi;
        Fri, 1 Jul 2016 01:29:19 -0700 (PDT)
X-Received: by 10.237.55.168 with SMTP id j37mr30298853qtb.102.1467361759137;
        Fri, 01 Jul 2016 01:29:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k53si1770765qta.39.2016.07.01.01.29.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 01:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bItp8-0004PM-HG
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 04:29:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56700)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bItp2-0004Oy-I8
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 04:29:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1bItoz-00089x-DH
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 04:29:12 -0400
Received: from 5.mo53.mail-out.ovh.net ([46.105.48.2]:38070)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <clg@kaod.org>)
	id 1bItoz-000880-4t
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 04:29:09 -0400
Received: from player158.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo53.mail-out.ovh.net (Postfix) with ESMTP id 5D6DCFF9252
	for <qemu-arm@nongnu.org>; Fri,  1 Jul 2016 10:29:07 +0200 (CEST)
Received: from [192.168.124.3] (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player158.ha.ovh.net (Postfix) with ESMTPSA id C430B6200BE;
	Fri,  1 Jul 2016 10:29:03 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467301824-10123-1-git-send-email-clg@kaod.org>
	<CAFEAcA_iAVMPNxi8m=uv9OTGoHqxg8egsLT+SN=YFJA=tS4B9w@mail.gmail.com>
	<4c195494-c97a-29e5-f5fb-88e26e71ae13@kaod.org>
	<CAFEAcA-xQ7Y=LPMweCU4yxLr7Mk5t0yy7SXX3=u2rGvAi7VA0w@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <d49da044-0396-a1b8-2b7f-02921102fe81@kaod.org>
Date: Fri, 1 Jul 2016 10:28:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-xQ7Y=LPMweCU4yxLr7Mk5t0yy7SXX3=u2rGvAi7VA0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 3013752575793662891
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeltddrudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 46.105.48.2
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/misc: fix Aspeed SCU hw-strap2
 property
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Do4rApQCd4Wx

On 07/01/2016 10:02 AM, Peter Maydell wrote:
> On 1 July 2016 at 07:11, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> On 06/30/2016 08:24 PM, Peter Maydell wrote:
>>> On 30 June 2016 at 16:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>>> These strap registers are complex enough, let's not mix them.
>>>>
>>>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>>>
>>> Was there a cover letter for this patchset? I can't find
>>> it in my email...
>>
>> Ah :/ No, I didn't send one as the patches were small and self
>> contained. Should we each time ?
>=20
> The basic rule is that single standalone patches don't
> need a cover letter; a series with more than one patch
> should have a cover letter. Some of our automated tooling
> gets confused otherwise (also I like to be able to have a
> single email to mark for attention in my mail client).
> These confused me a bit because they had the series
> indicators in the subject (1/2, 2/2) but no cover.

Yes, the email threading was a bit confusing in my mail
client also. Sorry about that.=20

I will resend with a cover letter. I need to add where=20
the macros are coming from.

Thanks,

C.=20

