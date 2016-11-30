Received: by 10.25.159.131 with SMTP id i125csp388834lfe;
        Wed, 30 Nov 2016 09:00:05 -0800 (PST)
X-Received: by 10.55.166.77 with SMTP id p74mr29553487qke.113.1480525205896;
        Wed, 30 Nov 2016 09:00:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e63si38098889qkc.195.2016.11.30.09.00.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 09:00:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cC8Em-0000L2-MK
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 12:00:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cC8Ei-0000J1-AP
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 12:00:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cC8Eh-0007b9-Dg
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 12:00:00 -0500
Received: from mail-ua0-x22d.google.com ([2607:f8b0:400c:c08::22d]:36404)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cC8Eh-0007aD-6e
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 11:59:59 -0500
Received: by mail-ua0-x22d.google.com with SMTP id b35so219123865uaa.3
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 08:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T0V4eUTxfUE5bHmw4TI7ybFuIprSJKcOIdEud1UA+OM=;
	b=J1ZudouJROVj2VHmWFlSmmQBaJlpJF7rO3VcuimHZmeix8/pHkPNzZ93M877ZLpDQt
	qWLQQWizQN+3rNY+e5J3/+tnujNMGl9/HRaD+9xY6pLVDNCtj38VRYpR00Y/s6cBakoq
	lqGGwbpIV9WoulFzl3z7Tl7LeT0lrBcJJ0+/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T0V4eUTxfUE5bHmw4TI7ybFuIprSJKcOIdEud1UA+OM=;
	b=Pcmuyu5UBzr1A3pZwPm74CjBme3NkHuVk9ne3Q0p41SfSbt6b2SzUVorQMbycVX1CG
	KKy1mWSs8R3CbEmAB1QMj4w6w8VWIgdJpbAwNlFCVSJFUiFGKx49eVJnv2Og3z2wRhf+
	PfMi3C4dFEJdRxIW/BFcqBfPKzkdx0YrSBkFX0a+HfpRN6QQhpEUdwlkk9SVjNZbE6vI
	M0B557BVFlhRJhFtSJ9V24sIgrH60icl5FkWQiXOvLVzVekF3o6TlLIN613q5AjcxI7j
	DBTLj1oHxXz2Hq4wh1OoUuNyxJG9EG+8j+HKp9kxXvIazW+SqeWy3PYRFgzjBuMRfwED
	Ig9Q==
X-Gm-Message-State: AKaTC03md2Wl5IqmJRCaUGWjMffiCN2R94P+SynEfM6ms8LqcFG3rzkOfmToKxKiDDqczY96jG/fNbr6m2L09z/i
X-Received: by 10.176.83.12 with SMTP id x12mr26062350uax.131.1480525197395;
	Wed, 30 Nov 2016 08:59:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 30 Nov 2016 08:59:36 -0800 (PST)
In-Reply-To: <CALicx6tPXCyxF_2d6oVzQrmc5W8C4R+8i4gPZWWYBGY9PWdJeA@mail.gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-5-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_O+72r2aMdMiVD-mnH41Y9YMaLRvcj1hxrbj_CNRk1Sw@mail.gmail.com>
	<CALicx6tkFEADfEK80gbbB5s6fM5xAvCUwoG26AqMyn2stQcj2A@mail.gmail.com>
	<CAFEAcA9j12HCoZNCpTt+07=+sSz6vM=Zu7rR6EN-SCq1h9GMww@mail.gmail.com>
	<CALicx6tPXCyxF_2d6oVzQrmc5W8C4R+8i4gPZWWYBGY9PWdJeA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 30 Nov 2016 16:59:36 +0000
Message-ID: <CAFEAcA82q1jRrNwR_7Nya3Dm2knOCsx54kovaN3NS8J_9eQFeA@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22d
Subject: Re: [Qemu-arm] [PATCH v6 4/4] hw/intc/arm_gicv3_kvm: Reset GICv3
 cpu interface registers
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DeDJ1wBnPmAc

On 30 November 2016 at 16:23, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Mon, Nov 28, 2016 at 10:05 PM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> Still I would prefer it if we did this with the same
>> mechanism for both TCG and KVM. A generic mechanism for
>> "let the CPU reset trigger reset of many other devices in the
>> system" isn't widely useful because real hardware doesn't
>> have that kind of action-at-a-distance behaviour.
>
> To make direct call from arm_cpu_reset() to reset CPUIF,
> I could not find a way to get GICv3CPUState from CPUARMState or
> ARMCPU struct.

You don't want to directly call from arm_cpu_reset().
Coprocessor regs registered via cpregs can have
reset functions, which get called automatically.
This is what the TCG gicv3 code already does to reset
the CPU i/f, the relevant code just needs to be
arranged so it's used for KVM too.

> Any idea how to get GICv3CPUState?
>
> In  hw/intc/arm_gicv3_cpuif.c implementation,
> el_hook function is registered to fetch GICv3CPUState
> from CPUARMState struct, but it is for TCG

Yes, you don't need the el hook.

thanks
-- PMM
