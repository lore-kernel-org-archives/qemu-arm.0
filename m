Received: by 10.25.159.131 with SMTP id i125csp372324lfe;
        Wed, 30 Nov 2016 08:23:27 -0800 (PST)
X-Received: by 10.55.27.226 with SMTP id m95mr32898477qkh.143.1480523007663;
        Wed, 30 Nov 2016 08:23:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k185si38025877qkc.96.2016.11.30.08.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 Nov 2016 08:23:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:44937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cC7fK-0000O6-G7
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 11:23:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cC7fH-0000O0-6u
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 11:23:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cC7fG-00075C-Bf
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 11:23:23 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:32936)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cC7fG-00074j-4P; Wed, 30 Nov 2016 11:23:22 -0500
Received: by mail-oi0-x242.google.com with SMTP id f201so23689851oib.0;
	Wed, 30 Nov 2016 08:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PSmcZyLuyi43xISqSCDWJmmIclhW/6vrG0FK6iQzVfU=;
	b=w+4A9FsE6NDaZq4J/5sO3FTmPhFqJQda2K9a7oPHpXAsJ4XIiAnYQqKfUj1pUHCPvi
	G8ashamEAml6VflMKvDFVyw6qsUf74byS4nYDde9dtoi+qjyOI++YHnzMRkJUCD9ugHM
	xfqbBK0+VkaWyc6WTSGiIY//6sQ1j1LHWVR1hVHXJv7zZgo7SyR2u2dbfYL+23bSRqzT
	fpApzTIhjnIl8+WcTn5Y5r2PZ+oXaCQ0bCfKc3LGOAnrM7WQwWO/w1aICTwA8FwThc82
	m/To7CxfYwvkXoe3QR/IUmHRERZwMuYEuvL5fRwSPv/+drkEYQH8j94YokfHpqlQgNit
	xOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PSmcZyLuyi43xISqSCDWJmmIclhW/6vrG0FK6iQzVfU=;
	b=Rg9smj7ZuspsAX20sPGj35IZ+s3a5rgUnj/WjAsjuqNeAeTE6K2ef87FDdD9nxfZzN
	Hstm2NMkaqDuqC+b4o5QcGbgYhOyVEr5dx0QaqUibUhUKfDO9qookHgEnBf/yViovSG9
	GLrgxyNH2O1TmHzQtwS1ck2FFS5S+q7AYLFp8+FvJDSVYY07v/GgdRfMHVUL8jQpgi5Y
	YSCCu84z6yAX487voFHBQqyhg3q6FiYAuCeOPy8FoPPiZMRt+Mw8gJ1nGzQVB+h9HYoI
	hvcYwwc5yWq5BUfh/0S99UoT7aT0Ytny+I5IlvM51Um36PYXHvJpPVbgG5MALKX7lojy
	VX+w==
X-Gm-Message-State: AKaTC03BbzxaJbcs6w3wOEv81tm+gNkOQQ2+4GnkKx16ncHK2EqR6tvBqr3jZj8lomz0GGm8fg02IqPyFlkFkw==
X-Received: by 10.202.75.139 with SMTP id y133mr17439702oia.193.1480522999178; 
	Wed, 30 Nov 2016 08:23:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.36.15 with HTTP; Wed, 30 Nov 2016 08:23:18 -0800 (PST)
In-Reply-To: <CAFEAcA9j12HCoZNCpTt+07=+sSz6vM=Zu7rR6EN-SCq1h9GMww@mail.gmail.com>
References: <1479904764-15532-1-git-send-email-vijay.kilari@gmail.com>
	<1479904764-15532-5-git-send-email-vijay.kilari@gmail.com>
	<CAFEAcA_O+72r2aMdMiVD-mnH41Y9YMaLRvcj1hxrbj_CNRk1Sw@mail.gmail.com>
	<CALicx6tkFEADfEK80gbbB5s6fM5xAvCUwoG26AqMyn2stQcj2A@mail.gmail.com>
	<CAFEAcA9j12HCoZNCpTt+07=+sSz6vM=Zu7rR6EN-SCq1h9GMww@mail.gmail.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Wed, 30 Nov 2016 21:53:18 +0530
Message-ID: <CALicx6tPXCyxF_2d6oVzQrmc5W8C4R+8i4gPZWWYBGY9PWdJeA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
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
X-TUID: kqYd3mWRlUZl

On Mon, Nov 28, 2016 at 10:05 PM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 28 November 2016 at 16:01, Vijay Kilari <vijay.kilari@gmail.com> wrote:
>> On Mon, Nov 28, 2016 at 6:31 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 23 November 2016 at 12:39,  <vijay.kilari@gmail.com> wrote:
>>>> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>>>
>>>> Reset CPU interface registers of GICv3 when CPU is reset.
>>>> For this, object interface is used, which is called from
>>>> arm_cpu_reset function.
>>>>
>>>> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>>>
>>> This approach doesn't handle the SMP case correctly --
>>> when a CPU is reset then the CPU interface for that CPU
>>> (and only that CPU) should be reset. Your code will
>>> reset every CPU interface every time any CPU is reset.
>>
>> arm_cpu_reset is not called when particular cpu is reset?.
>> Is it called for all cpus?.
>
> It's called to reset a particular CPU (so it will be called
> once for each CPU).
>
>> OR object_child_foreach_recursive() is calling to reset cpu
>> interfaces of
>> all cpus?.
>
> It does "look through the whole graph of objects in the
> simulation and call the function on anything in the
> graph that implements the interface". I've just seen that
> your code is doing "ignore the call if the CPU that
> triggered this isn't the one we care about", though --
> I missed that the first time reading the code.
>
> Still I would prefer it if we did this with the same
> mechanism for both TCG and KVM. A generic mechanism for
> "let the CPU reset trigger reset of many other devices in the
> system" isn't widely useful because real hardware doesn't
> have that kind of action-at-a-distance behaviour.

To make direct call from arm_cpu_reset() to reset CPUIF,
I could not find a way to get GICv3CPUState from CPUARMState or
ARMCPU struct.

Any idea how to get GICv3CPUState?

In  hw/intc/arm_gicv3_cpuif.c implementation,
el_hook function is registered to fetch GICv3CPUState from CPUARMState
struct, but it is for TCG

>
> thanks
> -- PMM
