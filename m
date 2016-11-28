Received: by 10.25.150.194 with SMTP id y185csp1855699lfd;
        Mon, 28 Nov 2016 08:36:21 -0800 (PST)
X-Received: by 10.237.61.98 with SMTP id h31mr21403074qtf.243.1480350981493;
        Mon, 28 Nov 2016 08:36:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o55si25044085qto.279.2016.11.28.08.36.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Nov 2016 08:36:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBOui-0005UH-7Z
	for alex.bennee@linaro.org; Mon, 28 Nov 2016 11:36:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBOuY-0005Sl-BE
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 11:36:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cBOuX-0008Js-Ay
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 11:36:10 -0500
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:36216)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cBOuW-0008Ip-QW
	for qemu-arm@nongnu.org; Mon, 28 Nov 2016 11:36:09 -0500
Received: by mail-ua0-x22c.google.com with SMTP id b35so148379851uaa.3
	for <qemu-arm@nongnu.org>; Mon, 28 Nov 2016 08:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MHjp6VYjbqWR8T8G9gA+AUi6WozkSOl2dYldKlNEV70=;
	b=kAjJhC3CZib6ZK39Pk81tmtUJvgt+Bn+2BxTmKcQS4WuOUK3DawSQ3hYS6eXRjsFx2
	W2QollMd9kRzgUxUXDIegdIexyxQJNB0lKttAUnpJtUEVsdtmiYbfhGhvoSZ4KQr8t9j
	Eq3/BjT3NQEEhQa3ea9+aM0kMRSb/j3NVVhfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MHjp6VYjbqWR8T8G9gA+AUi6WozkSOl2dYldKlNEV70=;
	b=N25c1oJNx/SQf2wMBNK6y/fLg5b7Lhrl3mR66UOtJ/UByTayGCAqI1sbJWxOZd6R7h
	QYQc6WdNgN66U+/95jthB1XdkS8Kz8ChB8AxowslX9o+VMmT44efR//Uyj9bRPdzF0vg
	KqdJsVHTf1FYJz2MLqPQYyROQrCbargX6PUFDWiT9yyIlowFJvlO12q7yxgYQdTPkjci
	VZYVqBojEoDALrYt7Z8rGL6Eojb1py02pw78zFMtElq8gYaZ/Niru8ahfEMnasTWdKtd
	eSsz6alHP4fVel5Axt9vDHJpMwDePmC36OfxVCCSiduWpc79Hp3ydJijeoEYMMMiaTX9
	O9nQ==
X-Gm-Message-State: AKaTC00/SxUVK2j8Z03RXPFoDAZpq7PSoND1JIY/57tvGwX6+y6q4LynX2+h/VT2zaccZfpCMDqIfPModC31hGkY
X-Received: by 10.176.83.12 with SMTP id x12mr17323834uax.131.1480350967439;
	Mon, 28 Nov 2016 08:36:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.185.4 with HTTP; Mon, 28 Nov 2016 08:35:47 -0800 (PST)
In-Reply-To: <CALicx6tkFEADfEK80gbbB5s6fM5xAvCUwoG26AqMyn2stQcj2A@mail.gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-5-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_O+72r2aMdMiVD-mnH41Y9YMaLRvcj1hxrbj_CNRk1Sw@mail.gmail.com>
	<CALicx6tkFEADfEK80gbbB5s6fM5xAvCUwoG26AqMyn2stQcj2A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Nov 2016 16:35:47 +0000
Message-ID: <CAFEAcA9j12HCoZNCpTt+07=+sSz6vM=Zu7rR6EN-SCq1h9GMww@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
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
X-TUID: c3wfDeBJv23Y

On 28 November 2016 at 16:01, Vijay Kilari <vijay.kilari@gmail.com> wrote:
> On Mon, Nov 28, 2016 at 6:31 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 23 November 2016 at 12:39,  <vijay.kilari@gmail.com> wrote:
>>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>>
>>> Reset CPU interface registers of GICv3 when CPU is reset.
>>> For this, object interface is used, which is called from
>>> arm_cpu_reset function.
>>>
>>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>
>> This approach doesn't handle the SMP case correctly --
>> when a CPU is reset then the CPU interface for that CPU
>> (and only that CPU) should be reset. Your code will
>> reset every CPU interface every time any CPU is reset.
>
> arm_cpu_reset is not called when particular cpu is reset?.
> Is it called for all cpus?.

It's called to reset a particular CPU (so it will be called
once for each CPU).

> OR object_child_foreach_recursive() is calling to reset cpu
> interfaces of
> all cpus?.

It does "look through the whole graph of objects in the
simulation and call the function on anything in the
graph that implements the interface". I've just seen that
your code is doing "ignore the call if the CPU that
triggered this isn't the one we care about", though --
I missed that the first time reading the code.

Still I would prefer it if we did this with the same
mechanism for both TCG and KVM. A generic mechanism for
"let the CPU reset trigger reset of many other devices in the
system" isn't widely useful because real hardware doesn't
have that kind of action-at-a-distance behaviour.

thanks
-- PMM
