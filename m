Received: by 10.25.205.13 with SMTP id d13csp332289lfg;
        Tue, 10 Jan 2017 09:17:52 -0800 (PST)
X-Received: by 10.55.137.197 with SMTP id l188mr3839988qkd.94.1484068672061;
        Tue, 10 Jan 2017 09:17:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d20si1758905qtd.301.2017.01.10.09.17.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jan 2017 09:17:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48705 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cR03T-0006JR-GG
	for alex.bennee@linaro.org; Tue, 10 Jan 2017 12:17:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36689)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cR03K-0006F2-6O
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 12:17:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cR03J-00045g-Bb
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 12:17:42 -0500
Received: from mail-ua0-x231.google.com ([2607:f8b0:400c:c08::231]:33477)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cR03J-00045V-7R
	for qemu-arm@nongnu.org; Tue, 10 Jan 2017 12:17:41 -0500
Received: by mail-ua0-x231.google.com with SMTP id i68so387677813uad.0
	for <qemu-arm@nongnu.org>; Tue, 10 Jan 2017 09:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sk9fUXfK/tpwPx44kR8f98U9/EZ5sHYh39eD4WxauMk=;
	b=cNGDREa8uvLpQCnSUeCCegtRFVlo5+tn5h3bB5BgokD8xsV/cOCxwixLiwvBQ4zJbB
	3LZSO06Hrh5ETxadnz50F4vBFZjrz+HwahJKgxCwceRnqBgdER9Ba5Bsj9MNoFt4CoFI
	EXRmn2hK+n5EH2M0TlXRAZuUUrx4KZ67W7fdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sk9fUXfK/tpwPx44kR8f98U9/EZ5sHYh39eD4WxauMk=;
	b=fC/P0MgT1LxTYBrInTG21qsjt4NmYonaexrjjxG1g8HetgTnR0qnH+1dBUHaQCNM4o
	xDfO5ngtSPvCYUwQfmghCMBv/EfG8RlBSx+dHi1eT6nlA/4yO2QSomJkUSOj7dwpArM0
	wymNvA+huIPOvIj2sH47lKlesRlCHg+pH4tdjRP4ImOl1nBe7ZW3nYluVRc4fT14Kv69
	eO4kUFyJpD+FIw+gEglNux1gZFLLl7VQceNQhJgXIIa2FYJ1QAv6VXliMt6f4c6Q2Y6Z
	MfiOR92e84dUxhv170FQwaMh2xx1Y5TPxRHqjc/WaMr96gCN+QfoGeE+upqjzuWGc2yt
	ocKw==
X-Gm-Message-State: AIkVDXJmhb2tEPQYxLsT1u3w+9ick4khLpiXNStGqE8Sq6EShOu4sKaV9oJsGiYxo0hJd1K8zzmOVqND7sl/rXCy
X-Received: by 10.159.48.203 with SMTP id k11mr2180588uab.42.1484068660777;
	Tue, 10 Jan 2017 09:17:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 10 Jan 2017 09:17:20 -0800 (PST)
In-Reply-To: <20170110164235.GT14990@toto>
References: <1483977924-14522-1-git-send-email-peter.maydell@linaro.org>
	<1483977924-14522-5-git-send-email-peter.maydell@linaro.org>
	<20170110164235.GT14990@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2017 17:17:20 +0000
Message-ID: <CAFEAcA_8p_OBHEYn=Rr9p-e=GFHz3h1kxK8JRSv6oozTzyvQ2g@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::231
Subject: Re: [Qemu-arm] [PATCH v2 04/18] hw/arm/virt: Wire VIRQ, VFIQ,
 maintenance irq lines from GIC to CPU
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
Cc: Andrew Jones <drjones@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tE4/GvUfCiFn

On 10 January 2017 at 16:42, Edgar E. Iglesias
<edgar.iglesias@xilinx.com> wrote:
> On Mon, Jan 09, 2017 at 04:05:10PM +0000, Peter Maydell wrote:
>> @@ -571,9 +571,17 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>                                                     ppibase + timer_irq[irq]));
>>          }
>>
>> +        qdev_connect_gpio_out_named(cpudev, "gicv3-maintenance-interrupt", 0,
>> +                                    qdev_get_gpio_in(gicdev, ppibase
>> +                                                     + ARCH_GICV3_MAINT_IRQ));
>> +
>>          sysbus_connect_irq(gicbusdev, i, qdev_get_gpio_in(cpudev, ARM_CPU_IRQ));
>>          sysbus_connect_irq(gicbusdev, i + smp_cpus,
>>                             qdev_get_gpio_in(cpudev, ARM_CPU_FIQ));
>> +        sysbus_connect_irq(gicbusdev, i + 2 * smp_cpus,
>> +                           qdev_get_gpio_in(cpudev, ARM_CPU_VIRQ));
>> +        sysbus_connect_irq(gicbusdev, i + 3 * smp_cpus,
>
> I thought there was an error here first (i.e i * smp_cpus + 3).
> The code is correct but could have perhaps been more readable with named irqs.

Yeah, all the GIC interfacing predates named IRQs and we haven't
got round to trying to convert it (it would be a fairly tedious
job given all the boards that wire up GICs these days).

thanks
-- PMM
