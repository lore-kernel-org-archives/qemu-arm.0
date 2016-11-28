Received: by 10.25.150.194 with SMTP id y185csp1837241lfd;
        Mon, 28 Nov 2016 08:02:36 -0800 (PST)
X-Received: by 10.55.203.19 with SMTP id d19mr21879336qkj.215.1480348955957;
        Mon, 28 Nov 2016 08:02:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 96si25012334qtc.269.2016.11.28.08.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 08:02:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59662 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBOO2-0000Et-Ls
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 11:02:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cBONK-0008Bu-Nc
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 11:01:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cBONJ-0003Tu-Oi
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 11:01:50 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34294)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cBONJ-0003TL-Hz; Mon, 28 Nov 2016 11:01:49 -0500
Received: by mail-oi0-x241.google.com with SMTP id m75so14243338oig.1;
	Mon, 28 Nov 2016 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2o8Dqi2lKaXrSZuzHkYn8/CUL/XlQaJp0EpG0Qza/Mg=;
	b=mQdR1jgdPUZ6HXYWNikZtM9p0V2WN5+I0Ml0t0riJ3m1KboLLYb6VvcuC7XsoYg/eo
	SzQbzr2vSvDkHncBOCAoBbdyWVs+ShDaiVUWHQeGY4XAx1VUAoWtSfQsNlsc9dNbwjtj
	TliBris7w5+bs/2Tlq0OGU3nmr4XnQ0Jk71HgB7V7NdmXmjmg5DO1DMinLmC/0Pm1yLS
	3Opw+hdpMwzz/lOd+WhbrjvF4aXtpPwyayhkC1fI8TAJ1EkmuvNyOoy5zz8GaU5OZx7Y
	P2Zqlx8az6MHHn8IUBAV64WdCAcvSUQxJ3BWx9EYuXon7v6MwKcXc81/Z/EsezzMUtv0
	zKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2o8Dqi2lKaXrSZuzHkYn8/CUL/XlQaJp0EpG0Qza/Mg=;
	b=YM6tq+HlLdMSg8gokf6nmE6Hf8DdgHWaHcczSdN/r+JjtAIUX9cHlatlvKMHPY7HJY
	AqyGXvcERfwCb4DOs5uYRd9Q/O/bpsU5/0xcj25RsZGmiGc3wSGQS2gS8JAPFnuRZhBs
	Xg0xFvYORSuP/TlQvH/WxPHnM8Mzsxc9MqBip+ZP/9sFZfTZM2ga6u2aXWQgFPj+qeBq
	K96VNELXgqhmAl8aqBNUz+XYvEkPjwknXh74qUZfY8dCcMcZhjnh9rnykwkLLBbhC0Rh
	dKkt18xCaP8Zu/kpCwPIHQGEsv04NtLKsLBBjy5vEmE9Lwd6KFeVeTBD9DN7tFOSrYyO
	gM6Q==
X-Gm-Message-State: AKaTC015oLw03TD477rYV3Yspbe9fGoSydrsVJVABSNWdsWvOMHBk1a+0jodu2hKvNmY63Cum7YR8z1blJyWBw==
X-Received: by 10.157.27.16 with SMTP id l16mr11903618otl.262.1480348907153;
	Mon, 28 Nov 2016 08:01:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.54.233 with HTTP; Mon, 28 Nov 2016 08:01:46 -0800 (PST)
In-Reply-To: <CAFEAcA_O+72r2aMdMiVD-mnH41Y9YMaLRvcj1hxrbj_CNRk1Sw@mail.gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-5-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_O+72r2aMdMiVD-mnH41Y9YMaLRvcj1hxrbj_CNRk1Sw@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Mon, 28 Nov 2016 21:31:46 +0530
Message-ID: <CALicx6tkFEADfEK80gbbB5s6fM5xAvCUwoG26AqMyn2stQcj2A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
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
X-TUID: gaU4ggZ3LbRR

On Mon, Nov 28, 2016 at 6:31 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 23 November 2016 at 12:39,  <vijay.kilari@gmail.com> wrote:
>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> Reset CPU interface registers of GICv3 when CPU is reset.
>> For this, object interface is used, which is called from
>> arm_cpu_reset function.
>>
>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> This approach doesn't handle the SMP case correctly --
> when a CPU is reset then the CPU interface for that CPU
> (and only that CPU) should be reset. Your code will
> reset every CPU interface every time any CPU is reset.

arm_cpu_reset is not called when particular cpu is reset?.
Is it called for all cpus?.
OR object_child_foreach_recursive() is calling to reset cpu interfaces of
all cpus?.

>
> I think it would be better to use the same approach that
> the arm_gicv3_cpuif.c code uses to arrange for cpu i/f
> registers to be reset, perhaps by moving the appropriate
> parts of that code into the common source file.
>
> Having the reset state depend implicitly on the kernel's
> internal state (as you have here for the ICC_CTLR_EL1
> state) is something I'm a bit unsure about -- what goes
> wrong if you don't do that?

During VM boots kvm_arm_gicv3_reset() writes all
the GIC registers with reset value. kernel does not allow writing ICC_CTLR_EL1
with zeros because it validates against hw supported values.
Similarly SRE_EL1.

>
> thanks
> -- PMM
