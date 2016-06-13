Received: by 10.25.85.209 with SMTP id j200csp1093612lfb;
        Mon, 13 Jun 2016 02:07:38 -0700 (PDT)
X-Received: by 10.55.16.90 with SMTP id a87mr13767250qkh.111.1465808857925;
        Mon, 13 Jun 2016 02:07:37 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q66si14576627qhb.40.2016.06.13.02.07.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 02:07:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54541 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCNqL-0001pc-AJ
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 05:07:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39552)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCNqG-0001n2-N3
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCNqF-0002gl-LI
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:07:32 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:34732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bCNqF-0002gZ-HR
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 05:07:31 -0400
Received: by mail-vk0-x22e.google.com with SMTP id t129so42669670vka.1
	for <qemu-arm@nongnu.org>; Mon, 13 Jun 2016 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OvfI194hY62ru3PnjxZU7Lf6ijIqsdNC/95Hpqmtl2Q=;
	b=ec0JUOkJRgKhlxAWxCaJd9qMFYiIlt4SGGBgf+WfOC7Apkf5jcbwcQdmmEuQ/qNPfb
	ynjb+xSL83HY1YrwkqmxeR7sslNXHkf9Pwu1+ZrQaf6ksDo1LVskGqmPb80XgEfuRuTO
	qc0v7/ysrG37jap92nf/mGNKBzWxs47qbMOuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OvfI194hY62ru3PnjxZU7Lf6ijIqsdNC/95Hpqmtl2Q=;
	b=dXO52grNxCU0nMOSuL/5t7kfjg87XegcpRFFx29tJOtnotn3xDoUGaCCU76JtwV7cz
	LuliPmxVtIA342LrbYFGD6pg0G2gui0UBFfiAp/FpyeJx6Icg3c+/GavHUtmZzDzY4uo
	jC7QZK3fsC1XRXiEZKrq1x5EqzWYOJQWtrIGC7932zsOVp0VzekRWwh4nOrMy568TFr+
	jFnm/f2paWaBtWJU46MLaocWQVGKgIOkYh+zdvkztzkmAA7BIZtV7hUwABFqZz/R3YR4
	Mteqk05Hj0wRDqMmwxakuQpyvseULX4FFuUzp/T1InkGC+zHKtIlLKxcJab5PDA1Ay+n
	ezEw==
X-Gm-Message-State: ALyK8tJ/hNXCBCaGds03dwm97Zj3sQkVNv+izw0H+6/T/zlzsWroLz8iA4gOh8rdsDEXkV6H7eGn19kY5XiuImMq
X-Received: by 10.31.228.133 with SMTP id b127mr5872882vkh.90.1465808851163;
	Mon, 13 Jun 2016 02:07:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Mon, 13 Jun 2016 02:07:11 -0700 (PDT)
In-Reply-To: <575E65A4.1080802@huawei.com>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-15-git-send-email-peter.maydell@linaro.org>
	<575E65A4.1080802@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Jun 2016 10:07:11 +0100
Message-ID: <CAFEAcA_A9fatO00vbhVCb-_N-nNh7vUmDzaCwqswPd9WBxO=tQ@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 14/22] hw/intc/arm_gicv3:
 Implement gicv3_set_irq()
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
Cc: Patch Tracking <patches@linaro.org>,
	Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /C2cfJYnmG8b

On 13 June 2016 at 08:49, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>
>
> On 2016/5/26 22:55, Peter Maydell wrote:
>> Implement the code which updates the GIC state when an interrupt
>> input into the GIC is asserted.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/intc/arm_gicv3.c        | 20 +++++++++++++++++++-
>>  hw/intc/arm_gicv3_dist.c   | 21 +++++++++++++++++++++
>>  hw/intc/arm_gicv3_redist.c | 21 +++++++++++++++++++++
>>  hw/intc/gicv3_internal.h   |  2 ++
>>  trace-events               |  2 ++
>>  5 files changed, 65 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
>> index e8f6766..e770409 100644
>> --- a/hw/intc/arm_gicv3.c
>> +++ b/hw/intc/arm_gicv3.c
>> @@ -311,7 +311,25 @@ static void gicv3_set_irq(void *opaque, int irq, int level)
>>       *  [N+32..N+63] : PPI (internal interrupts for CPU 1
>>       *  ...
>>       */
>> -    /* Do nothing for now */
>> +    GICv3State *s = opaque;
>> +
>> +    if (irq < (s->num_irq - GIC_INTERNAL)) {
>> +        /* external interrupt (SPI) */
>> +        gicv3_dist_set_irq(s, irq + GIC_INTERNAL, level);
>> +    } else {
>> +        /* per-cpu interrupt (PPI) */
>> +        int cpu;
>> +
>> +        irq -= (s->num_irq - GIC_INTERNAL);
>> +        cpu = irq / GIC_INTERNAL;
>> +        irq %= GIC_INTERNAL;
>> +        assert(cpu < s->num_cpu);
>> +        /* Raising SGIs via this function would be a bug in how the board
>> +         * model wires up interrupts.
>> +         */
>> +        assert(irq >= 16 && irq < 32);
> Nit: Use GIC_NR_SGIS instead and irq < 32 is unnecessary.

Fixed, thanks.

-- PMM
