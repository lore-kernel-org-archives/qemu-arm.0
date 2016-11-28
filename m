Received: by 10.25.150.194 with SMTP id y185csp1673104lfd;
        Mon, 28 Nov 2016 02:41:15 -0800 (PST)
X-Received: by 10.237.38.37 with SMTP id z34mr20119796qtc.73.1480329675087;
        Mon, 28 Nov 2016 02:41:15 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 124si31670406qke.234.2016.11.28.02.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 02:41:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57845 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBJN3-0001ld-Ry
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 05:41:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56441)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBJMx-0001js-0X
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 05:41:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBJMv-0005q5-Pw
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 05:41:07 -0500
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:34755)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cBJMv-0005po-IA
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 05:41:05 -0500
Received: by mail-ua0-x233.google.com with SMTP id 51so138190344uai.1
	for <qemu-arm@nongnu.org>; Mon, 28 Nov 2016 02:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CMOYAkRvw0vwrCcv0iati/y2PydAs3POo7/o92Ob+zQ=;
	b=P66fiNpqW82fqFumRaHFAFL6rKbBWhb3cs3GB+/V5Tf6a0CIOdP67rbZ3gvlmFxaxr
	tMJYKRqqfXytoZOV2Z8Jx7o6WUZWqvclxOYJqL3YYqBi7W8kl4QYYPwJ3fe6iderPuVv
	pXBNrjVFpfXlcl58GSCYenlvWLE19QFvFMtvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CMOYAkRvw0vwrCcv0iati/y2PydAs3POo7/o92Ob+zQ=;
	b=Kjk2yVoTeG8+IWl7efEGGZAIw7YAS0c1qal6Ax3wIgCXJ1KL72yCvDG3QMPLSKBML3
	pm5aUgNgnvZ2OgI4OrEZe5bghNMgVSjTaHDqRVjb0J71txVt16OWiqxCmXY2CH3Q1PIS
	U6KvISI0Fr99lggKsB95BHf+TcMhMloYo8pH0P5OczbFAhiqEGj90n1MciQyFJIuYWUb
	3BKNWHHBbF+Yr/yigrXcCgnNvlo2V2idyQuOX87rQWlFPbSI7j6L3Afvsje+JtU2LUXa
	V0dyjvWMJ0eQGxQsyzjuoztVKKgzBJvvNAo0LJ0nDQF4oJ4YMSddaUbndCt6cmC86yKO
	c+5g==
X-Gm-Message-State: AKaTC01M1jiqXAar1ohZsJc4KAQCGJXjRpqR6YH5AehFQ3l5D0nr8TVzD2qCGwIp7TTCHKuMtKcJChp8V/sH+1IU
X-Received: by 10.176.67.132 with SMTP id l4mr12883378ual.164.1480329664310;
	Mon, 28 Nov 2016 02:41:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.185.4 with HTTP; Mon, 28 Nov 2016 02:40:43 -0800 (PST)
In-Reply-To: <f5ef5137-47a3-c345-ae34-0893e20de116@kaod.org>
References: <1471946352-20779-1-git-send-email-clg@kaod.org>
	<CAFEAcA_+tECGsnVnp7YKYFXWZDoi9n7mQRjFAoWGZ6hRs2FFpQ@mail.gmail.com>
	<f5ef5137-47a3-c345-ae34-0893e20de116@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2016 10:40:43 +0000
Message-ID: <CAFEAcA-gRO5E9TPZHMpWHZ9kv-5EGTgkgdY5cJeGyXSq5hk_MA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::233
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
X-TUID: WPdRniBksDlh

On 24 November 2016 at 14:29, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 09/05/2016 04:39 PM, Peter Maydell wrote:
>> We implement VBAR in v7-without-EL3 even though architecturally
>> it should only exist in v7-with-EL3 because we have some
>> legacy board models which we implement as without-EL3 but
>> where the guest (Linux) assumes it's running on a with-EL3
>> CPU in NS mode. I'd rather we stick to the architectural
>> definition for 1176 if we can rather than expanding the
>> "things we do which aren't architectural" set if there's
>> no legacy config that requires it. (If it is necessary
>> to define it for 1176 always then that's OK, I'd just
>> prefer not to unless we know we have to.)
>
> According to the ARM spec, 1176 is a v6 with a couple of
> extensions, among which v6k and TrustZone. So it has Secure
> and Non-Secure VBAR and MVBAR registers.
>
> Looking at :
>
>   https://en.wikipedia.org/wiki/List_of_ARM_microarchitectures
>
> May be, we should instead introduce a new ARMv6Z architecture
> for the 1176 cpu which would represent a ARMv6 + TrustZone ?
>
>
> But I am a bit confused with this EL3 feature. 1176 does not
> have EL3 to my understanding (I am beyond my ARM skills there).

EL3 =3D=3D TrustZone's Monitor mode level of privilege. In
ARMv8 the privilege level model was tidied up a bit so it's
more cleanly arranged in levels EL0 (user) EL1 (kernel)
EL2 (hypervisor) EL3 (secure monitor), and the old 32-bit
setup can be expressed in terms of that (User being EL0,
the various Sys/Fiq/Irq/etc modes being EL1, Hyp at EL2
and Mon at EL3). For QEMU we implemented TrustZone support
after the v8 spec was published, so we had the opportunity
to do it in a way that fit nicely with 64-bit TZ support.
So ARM_FEATURE_EL3 is our "does this CPU have TrustZone"
flag, in the same way that ARM_FEATURE_EL2 is "does it have
the Virtualization extensions".

We also support 1176-without-TrustZone, which doesn't
exist in real hardware but which we have for backwards
compatibility with code that runs on our 1176 boards
which we implemented before we had TZ support in the
CPU implementation.

What I'm suggesting is that we shoulld provide VBAR
only in the 1176-with-TZ CPUs, not in the 1176-no-TZ
CPUs, unless we must provide it for the latter as a
back-compat requirement.

> So why is it part of the feature list in arm1176_initfn ?
> Is that a way to define the MVBAR and SCR regs ?

The CPU object defaults to TZ-enabled, and then the
board model can disable it. (See for instance the
code in hw/arm/realview.c which sets the has_el3 property
on the CPU object to false.)

thanks
-- PMM
