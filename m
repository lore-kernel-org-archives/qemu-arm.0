Received: by 10.25.150.194 with SMTP id y185csp1816592lfd;
        Mon, 28 Nov 2016 07:21:37 -0800 (PST)
X-Received: by 10.237.53.102 with SMTP id b35mr21244197qte.266.1480346496945;
        Mon, 28 Nov 2016 07:21:36 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g126si32259828qkb.252.2016.11.28.07.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 07:21:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBNkN-0004jY-Oh
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 10:21:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBNkD-0004fF-9u
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 10:21:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBNkA-0002dC-46
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 10:21:25 -0500
Received: from 11.mo4.mail-out.ovh.net ([46.105.34.195]:60277)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBNk9-0002YJ-UM
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 10:21:22 -0500
Received: from player750.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id F0DD71FC46
	for <qemu-arm@nongnu.org>; Mon, 28 Nov 2016 16:21:18 +0100 (CET)
Received: from hermes.kaod.org (LFbn-1-2234-107.w90-76.abo.wanadoo.fr
	[90.76.55.107]) (Authenticated sender: clg@kaod.org)
	by player750.ha.ovh.net (Postfix) with ESMTPSA id D6CB3180073;
	Mon, 28 Nov 2016 16:21:15 +0100 (CET)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1471946352-20779-1-git-send-email-clg@kaod.org>
	<CAFEAcA_+tECGsnVnp7YKYFXWZDoi9n7mQRjFAoWGZ6hRs2FFpQ@mail.gmail.com>
	<f5ef5137-47a3-c345-ae34-0893e20de116@kaod.org>
	<CAFEAcA-gRO5E9TPZHMpWHZ9kv-5EGTgkgdY5cJeGyXSq5hk_MA@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f9310c6b-719f-db68-8a1b-993bf9ffec44@kaod.org>
Date: Mon, 28 Nov 2016 16:21:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gRO5E9TPZHMpWHZ9kv-5EGTgkgdY5cJeGyXSq5hk_MA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
X-Ovh-Tracer-Id: 5435281802747349936
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeeigdejhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.34.195
Subject: Re: [Qemu-arm] [PATCH] target-arm: Add VBAR support to ARM1176 CPUs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SNzIMGqZgXBF

On 11/28/2016 11:40 AM, Peter Maydell wrote:
> On 24 November 2016 at 14:29, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>> On 09/05/2016 04:39 PM, Peter Maydell wrote:
>>> We implement VBAR in v7-without-EL3 even though architecturally
>>> it should only exist in v7-with-EL3 because we have some
>>> legacy board models which we implement as without-EL3 but
>>> where the guest (Linux) assumes it's running on a with-EL3
>>> CPU in NS mode. I'd rather we stick to the architectural
>>> definition for 1176 if we can rather than expanding the
>>> "things we do which aren't architectural" set if there's
>>> no legacy config that requires it. (If it is necessary
>>> to define it for 1176 always then that's OK, I'd just
>>> prefer not to unless we know we have to.)
>>
>> According to the ARM spec, 1176 is a v6 with a couple of
>> extensions, among which v6k and TrustZone. So it has Secure
>> and Non-Secure VBAR and MVBAR registers.
>>
>> Looking at :
>>
>>   https://en.wikipedia.org/wiki/List_of_ARM_microarchitectures
>>
>> May be, we should instead introduce a new ARMv6Z architecture
>> for the 1176 cpu which would represent a ARMv6 + TrustZone ?
>>
>>
>> But I am a bit confused with this EL3 feature. 1176 does not
>> have EL3 to my understanding (I am beyond my ARM skills there).
>=20
> EL3 =3D=3D TrustZone's Monitor mode level of privilege. In
> ARMv8 the privilege level model was tidied up a bit so it's
> more cleanly arranged in levels EL0 (user) EL1 (kernel)
> EL2 (hypervisor) EL3 (secure monitor), and the old 32-bit
> setup can be expressed in terms of that (User being EL0,
> the various Sys/Fiq/Irq/etc modes being EL1, Hyp at EL2
> and Mon at EL3). For QEMU we implemented TrustZone support
> after the v8 spec was published, so we had the opportunity
> to do it in a way that fit nicely with 64-bit TZ support.
> So ARM_FEATURE_EL3 is our "does this CPU have TrustZone"
> flag, in the same way that ARM_FEATURE_EL2 is "does it have
> the Virtualization extensions".
>
> We also support 1176-without-TrustZone, which doesn't
> exist in real hardware but which we have for backwards
> compatibility with code that runs on our 1176 boards
> which we implemented before we had TZ support in the
> CPU implementation.

Thanks for the explanation. It is clearer now.

> What I'm suggesting is that we shoulld provide VBAR
> only in the 1176-with-TZ CPUs, not in the 1176-no-TZ
> CPUs, unless we must provide it for the latter as a
> back-compat requirement.

I don't for the back-compat requirement.=20

But I need to rework the patch to keep VBAR in any case=20
for the v7-without-EL3 CPUs and remove it for the 1176 CPUs=20
when 'has_el3' is not set.

Thanks,

C.=20

>> So why is it part of the feature list in arm1176_initfn ?
>> Is that a way to define the MVBAR and SCR regs ?
>=20
> The CPU object defaults to TZ-enabled, and then the
> board model can disable it. (See for instance the
> code in hw/arm/realview.c which sets the has_el3 property
> on the CPU object to false.)
>=20
> thanks
> -- PMM
>=20

