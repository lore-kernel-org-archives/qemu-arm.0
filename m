Received: by 10.25.159.131 with SMTP id i125csp747284lfe;
        Thu, 1 Dec 2016 02:11:04 -0800 (PST)
X-Received: by 10.55.78.146 with SMTP id c140mr32212588qkb.55.1480587064636;
        Thu, 01 Dec 2016 02:11:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id r61si32684116qtd.26.2016.12.01.02.11.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Dec 2016 02:11:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cCOKW-0006Wu-4m
	for alex.bennee@linaro.org; Thu, 01 Dec 2016 05:11:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cCOK2-0006JX-41
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 05:10:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cCOK0-0004Vi-S7
	for qemu-arm@nongnu.org; Thu, 01 Dec 2016 05:10:34 -0500
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:32865)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cCOK0-0004V1-KN; Thu, 01 Dec 2016 05:10:32 -0500
Received: by mail-io0-x241.google.com with SMTP id j92so9638418ioi.0;
	Thu, 01 Dec 2016 02:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=v5MMrsKuwtEAr+k5GVIbC8FNRp05UMxDikRwHRxVmZI=;
	b=xfewc0U1ZbCijy7rWQFspmfi+186+GPQ0WfayRfbdFmWWtPcKy8LmIAivA1lDgF3Da
	UxO6N2YD2yzgvt3SIsVTqtx2NRBWtLrDcpMv5S+bTExrSfWNtu01wZqJrS8UrHE/Zu4z
	Df6xuOh+d6MGdc9/1m1ITf+mJ41RScb3aRQpOMCkcxRmuBCfB2C6sYWLZ/jQIV2zoDqk
	B+uGhOdxGnZuHmieQABLJ4G2fOgG6plCkzpCTjSlm7rKqdg2c2c3l2SrvNZnBD7yvdeQ
	CuL0Ag1R/bWJHbz9Rq+RZQHwTYsPWMRLqcr+sLhvhlTnAOxp3S0k2RqnMrBprndkfr/h
	3iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=v5MMrsKuwtEAr+k5GVIbC8FNRp05UMxDikRwHRxVmZI=;
	b=Isjssfljxd0sP7ubyC/ZVY7GOZ4eOKwQcLnOYvDFoo2HEQYNlMwWQWsBbHnUwsvkHa
	DeSXF69qC5HlPithyFxXIOXPOY0HcU09mYDBTRfSog2E8Gl7vFFaJtSwOgR1GSeSUnqr
	gNn4bAI+YQt9QcKxWJ7p3yVGEQRxqMO1t14BduJ0vaTHF0B8S7em7S5gkNFSRWiNK8BG
	MEuLMOCoA38/x4ShbOMgExUXV5iUlV9U0tIreITqbv5QOunezJbjX9a0mNXYpKIVWsUl
	9C6AJdjkQ5NN8qA7ix8scy5kMjxednueF98E9CeKoXpg74IufEdPSPOV6MCwB5thI1xw
	LRNw==
X-Gm-Message-State: AKaTC02gXC98r5VEwmCsOxSS8wPXwBD68ezbYu/VQvDCluNMxG702gpSMXHk9H5lKkG77RwNeEkD30Ajm01Rlw==
X-Received: by 10.157.38.162 with SMTP id l31mr19031389otb.21.1480587031429;
	Thu, 01 Dec 2016 02:10:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.36.15 with HTTP; Thu, 1 Dec 2016 02:10:31 -0800 (PST)
In-Reply-To: <CAFEAcA82q1jRrNwR_7Nya3Dm2knOCsx54kovaN3NS8J_9eQFeA@mail.gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-5-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_O+72r2aMdMiVD-mnH41Y9YMaLRvcj1hxrbj_CNRk1Sw@mail.gmail.com>
	<CALicx6tkFEADfEK80gbbB5s6fM5xAvCUwoG26AqMyn2stQcj2A@mail.gmail.com>
	<CAFEAcA9j12HCoZNCpTt+07=+sSz6vM=Zu7rR6EN-SCq1h9GMww@mail.gmail.com>
	<CALicx6tPXCyxF_2d6oVzQrmc5W8C4R+8i4gPZWWYBGY9PWdJeA@mail.gmail.com>
	<CAFEAcA82q1jRrNwR_7Nya3Dm2knOCsx54kovaN3NS8J_9eQFeA@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Thu, 1 Dec 2016 15:40:31 +0530
Message-ID: <CALicx6t=C9dmXY_nQgumgr11qAydr1Q6VseWCBBNy9uEFXaCGA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4001:c06::241
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
X-TUID: 9N6zZyqB4MsE

On Wed, Nov 30, 2016 at 10:29 PM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 30 November 2016 at 16:23, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Mon, Nov 28, 2016 at 10:05 PM, Peter Maydell
>> <peter.maydell@linaro.org> wrote:
>>> Still I would prefer it if we did this with the same
>>> mechanism for both TCG and KVM. A generic mechanism for
>>> "let the CPU reset trigger reset of many other devices in the
>>> system" isn't widely useful because real hardware doesn't
>>> have that kind of action-at-a-distance behaviour.
>>
>> To make direct call from arm_cpu_reset() to reset CPUIF,
>> I could not find a way to get GICv3CPUState from CPUARMState or
>> ARMCPU struct.
>
> You don't want to directly call from arm_cpu_reset().
> Coprocessor regs registered via cpregs can have
> reset functions, which get called automatically.
> This is what the TCG gicv3 code already does to reset
> the CPU i/f, the relevant code just needs to be
> arranged so it's used for KVM too.

Yes, the reset functions of cpregs get CPUARMState as parameter
and still we cannot fetch GICv3CPUState from it.

The TCG code in arm_gicv3_cpuif.c is rely on el_hook to get
GICv3CPUState.
>
>> Any idea how to get GICv3CPUState?
>>
>> In  hw/intc/arm_gicv3_cpuif.c implementation,
>> el_hook function is registered to fetch GICv3CPUState
>> from CPUARMState struct, but it is for TCG
>
> Yes, you don't need the el hook.

Without this is there a way to get GICv3CPUState for KVM?
I am not familiar with this code.

>
> thanks
> -- PMM
