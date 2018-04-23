Received: by 10.28.4.212 with SMTP id 203csp3763737wme;
        Mon, 23 Apr 2018 04:33:12 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoCEDycS5FzN4LxsQo5+4iyK8ZbMJm/8Ewok45lxKCE2QSVjKVG1ZYzJWbdhmW3sLGYwUlr
X-Received: by 2002:ac8:1a8e:: with SMTP id x14-v6mr22813944qtj.288.1524483192874;
        Mon, 23 Apr 2018 04:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524483192; cv=none;
        d=google.com; s=arc-20160816;
        b=dSz8hsloPGBv/Ekydh3bGVYSef11B0STWtJ5Ddgn88fMNbdcxRtonIH3lI61y2ZEXY
         f8AQeKRtcCmQUV4PDYaz0OR7Jt739rOti/u7H3zZbBYmFAC1pI9hgjoe7JsPJpTSBViT
         qqfIu8cKdDCZsFGc6kMkwaveRS0JCiwLUa/Z9T4s/p303tYLRVYUwCmy1KL8bQH+asi5
         knA3etHbIME2JadsFzr5WhSR8UR0uKLm1SLB5eMrVT6/jBl479baudNXXVHmEeLESz3/
         1hC8R7hcJHxkPWAfkdfA6JY88jWiROiTzoIXWYDgFcE6rJNJbHuvvKolj9rceAhz4CGE
         JqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=H3ZOdwZlH2byr/yZEEe709FE3UL2Yqu/1xmxIdeo3sY=;
        b=ZlSpLZH5P6dZPixPj6HUwvKaaSJvjEcaCotu43Yp8gpWtmzaftUVy5+KB00XgZsFvs
         6efb8FJEPjzH5I15oDBxeuIjreRnMitWgB23+Qxz3cltNq1Tk26xBSf0Isaavj/9GfTI
         1m3bb6J383UqRY1Dn5lf/Q/IxOlvQAevvDPdN2Gxe8VhLRYdhPJI/e8cFKJ8Jhskx3C8
         Gs5ZUdL8BRTd0ywHZCgmj9EfL5hJMSjzzpZykdXqUX/11PSYnI1DoXJpsl0ZQ/LSfYOV
         d/z73KzZsrG7XVwErS7JohTruqMQ8paqELFvWy0oS2GicnsNXoYwFunjpXmaI4H11KYB
         v8RA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41si724660qks.210.2018.04.23.04.33.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Apr 2018 04:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fAZia-0004S9-Aw
	for alex.bennee@linaro.org; Mon, 23 Apr 2018 07:33:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAZiL-0004QF-PU
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 07:32:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1fAZiH-0003Ch-Kd
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 07:32:57 -0400
Received: from 5.mo1.mail-out.ovh.net ([178.33.45.107]:56775)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1fAZiH-0003Bg-Ag
	for qemu-arm@nongnu.org; Mon, 23 Apr 2018 07:32:53 -0400
Received: from player737.ha.ovh.net (unknown [10.109.122.20])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 95FBBF0BD9
	for <qemu-arm@nongnu.org>; Mon, 23 Apr 2018 13:32:51 +0200 (CEST)
Received: from zorba.kaod.org (LFbn-TOU-1-49-10.w86-201.abo.wanadoo.fr
	[86.201.141.10]) (Authenticated sender: postmaster@kaod.org)
	by player737.ha.ovh.net (Postfix) with ESMTPSA id 1EA76E00D3;
	Mon, 23 Apr 2018 13:32:46 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180423101433.17759-1-clg@kaod.org>
	<CAFEAcA_1q4+kKunX6_d9N3+6tUFGJRRc5biqn5TqDDmh09-kiw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e2d6b0b9-2402-4c34-305e-ae61ebe10df4@kaod.org>
Date: Mon, 23 Apr 2018 13:32:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_1q4+kKunX6_d9N3+6tUFGJRRc5biqn5TqDDmh09-kiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 14151154457856936875
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -65
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtgedrkeeggdegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculdefhedm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.45.107
Subject: Re: [Qemu-arm] [PATCH v2] timer/aspeed: fix vmstate version id
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
X-TUID: X9Nf4Kg+DqJl

On 04/23/2018 12:29 PM, Peter Maydell wrote:
> On 23 April 2018 at 11:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> commit 1d3e65aa7ac5 ("hw/timer: Add value matching support to
>> aspeed_timer") increased the vmstate version of aspeed.timer because
>> the state had changed, but it also bumped the version of the
>> VMSTATE_STRUCT_ARRAY under the aspeed.timerctrl which did not need to.
>>
>> Change back this version to fix migration.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>=20
> Thanks, applied to target-arm.next.
>=20
>>  To test on a 'palmetto-bmc' board, download the latest built OpenBMC
>>  flash image :
>>
>>    wget https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=
=3Dpalmetto/lastSuccessfulBuild/artifact/deploy/images/palmetto/flash-pal=
metto
>>
>>  start two instances of QEMU with :
>>
>>    qemu-system-arm -m 512 -M palmetto-bmc -drive file=3D./flash-palmet=
to,format=3Draw,if=3Dmtd -serial mon:stdio -nographic -nodefaults
>=20
> Thanks also for the test image -- I'll add it to the collection I have.

for a romulus-bmc machine, which uses a ARM1176 CPU, you can download thi=
s
image :

   https://openpower.xyz/job/openbmc-build/distro=3Dubuntu,target=3Dromul=
us/lastSuccessfulBuild/artifact/deploy/images/romulus/flash-romulus

but migration fails :

  qemu-system-arm: error while loading state for instance 0x0 of device '=
cpu'

There seems to be an issue while reading the CPACR reg.


> PS: there seems to be something odd up with the DNS for openpower.xyz:
>=20
> $ host openpower.xyz
> openpower.xyz has address 146.20.65.228
> ;; connection timed out; no servers could be reached

indeed. hmm, I will report.

Thanks,

C.=20

> (also manifests as wget pausing for several seconds before starting
> the download).
>=20
> thanks
> -- PMM
>=20

