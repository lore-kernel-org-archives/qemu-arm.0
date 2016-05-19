Received: by 10.25.208.137 with SMTP id h131csp3014194lfg;
        Thu, 19 May 2016 06:07:13 -0700 (PDT)
X-Received: by 10.55.101.20 with SMTP id z20mr14419189qkb.80.1463663233454;
        Thu, 19 May 2016 06:07:13 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 125si12429019qkl.203.2016.05.19.06.07.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 06:07:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3NfU-0002Q3-Qb
	for alex.bennee@linaro.org; Thu, 19 May 2016 09:07:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34161)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1b3Neu-00020t-3r
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1b3Nes-0006h7-2J
	for qemu-arm@nongnu.org; Thu, 19 May 2016 09:06:35 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:44826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1b3Nem-0006g0-15; Thu, 19 May 2016 09:06:28 -0400
Received: from 172.24.1.47 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DHI65759; Thu, 19 May 2016 20:59:51 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 19 May 2016 20:59:41 +0800
Message-ID: <573DB8A2.1000701@huawei.com>
Date: Thu, 19 May 2016 20:59:14 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1462814989-24360-1-git-send-email-peter.maydell@linaro.org>
	<1462814989-24360-11-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1462814989-24360-11-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.573DB8C8.018C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b309547f2f39dee43df5e865fec53f98
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 10/23] hw/intc/arm_gicv3:
 Implement functions to identify next pending irq
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dww8wf5dwlIJ



On 2016/5/10 1:29, Peter Maydell wrote:
> +    uint32_t pend, grpmask;
> +    uint32_t pending = *gic_bmp_ptr32(s->pending, irq - GIC_INTERNAL);
> +    uint32_t edge_trigger = *gic_bmp_ptr32(s->edge_trigger, irq - GIC_INTERNAL);
> +    uint32_t level = *gic_bmp_ptr32(s->level, irq - GIC_INTERNAL);
> +    uint32_t group = *gic_bmp_ptr32(s->group, irq - GIC_INTERNAL);
> +    uint32_t grpmod = *gic_bmp_ptr32(s->grpmod, irq - GIC_INTERNAL);
> +    uint32_t enable = *gic_bmp_ptr32(s->enabled, irq - GIC_INTERNAL);
> +
Since you use "irq - GIC_INTERNAL" many times, how about moving into the
gic_bmp_ptr32()?

[...]
> +/* Update the GIC status after state in the distributor has
> + * changed affecting @len interrupts starting at @start,
> + * but don't tell the CPU i/f.
> + */
> +static void gicv3_update_noirqset(GICv3State *s, int start, int len)
> +{
> +    int i;
> +    uint8_t prio;
> +    uint32_t pend = 0;
> +
> +    for (i = 0; i < s->num_cpu; i++) {
> +        s->cpu[i].seenbetter = false;
> +    }
> +
> +    /* Find the highest priority pending interrupt in this range. */
> +    for (i = start; i < start + len; i++) {
> +        GICv3CPUState *cs;
> +
The i should start from GIC_INTERNAL or you should change the parameter
of the callers.

> +        if (i == start || (i & 0x1f) == 0) {
> +            /* Calculate the next 32 bits worth of pending status */
> +            pend = gicd_int_pending(s, i & ~0x1f);
> +        }
> +
[...]
> +
> +    /* Note that we can guarantee that these functions will not
> +     * recursively call back into gicv3_full_update(), because
> +     * at each point the "previous best" is always outside the
> +     * range we ask them to update.
> +     */
> +    gicv3_update_noirqset(s, 0, s->num_irq);
> +
use GIC_INTERNAL instead of 0?


>  /**
> + * gicv3_irq_group:
> + *
> + * Return the group which this interrupt is configured as (GICV3_G0,
> + * GICV3_G1 or GICV3_G1NS).
> + */
> +static inline int gicv3_irq_group(GICv3State *s, GICv3CPUState *cs, int irq)
use uint32_t instead of int in this and other functions?

Thanks,
-- 
Shannon

