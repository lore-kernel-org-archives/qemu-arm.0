Received: by 10.25.85.209 with SMTP id j200csp1067230lfb;
        Mon, 13 Jun 2016 00:50:45 -0700 (PDT)
X-Received: by 10.233.235.83 with SMTP id b80mr13119587qkg.83.1465804245759;
        Mon, 13 Jun 2016 00:50:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l30si4638422qtl.74.2016.06.13.00.50.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 00:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54266 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCMdx-0002Nb-79
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 03:50:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCMds-0002LP-Mj
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 03:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCMdq-0003a4-Fk
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 03:50:39 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:62637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bCMdj-0003Xu-CL; Mon, 13 Jun 2016 03:50:32 -0400
Received: from 172.24.1.47 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.1.47])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CDE05916; Mon, 13 Jun 2016 15:50:08 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jun 2016 15:49:56 +0800
Message-ID: <575E65A4.1080802@huawei.com>
Date: Mon, 13 Jun 2016 15:49:56 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-15-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-15-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.575E65B3.015F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d68e894073ee1d51a73298c4cf21ffae
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HoASfB3cjEv2



On 2016/5/26 22:55, Peter Maydell wrote:
> Implement the code which updates the GIC state when an interrupt
> input into the GIC is asserted.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/intc/arm_gicv3.c        | 20 +++++++++++++++++++-
>  hw/intc/arm_gicv3_dist.c   | 21 +++++++++++++++++++++
>  hw/intc/arm_gicv3_redist.c | 21 +++++++++++++++++++++
>  hw/intc/gicv3_internal.h   |  2 ++
>  trace-events               |  2 ++
>  5 files changed, 65 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index e8f6766..e770409 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -311,7 +311,25 @@ static void gicv3_set_irq(void *opaque, int irq, int level)
>       *  [N+32..N+63] : PPI (internal interrupts for CPU 1
>       *  ...
>       */
> -    /* Do nothing for now */
> +    GICv3State *s = opaque;
> +
> +    if (irq < (s->num_irq - GIC_INTERNAL)) {
> +        /* external interrupt (SPI) */
> +        gicv3_dist_set_irq(s, irq + GIC_INTERNAL, level);
> +    } else {
> +        /* per-cpu interrupt (PPI) */
> +        int cpu;
> +
> +        irq -= (s->num_irq - GIC_INTERNAL);
> +        cpu = irq / GIC_INTERNAL;
> +        irq %= GIC_INTERNAL;
> +        assert(cpu < s->num_cpu);
> +        /* Raising SGIs via this function would be a bug in how the board
> +         * model wires up interrupts.
> +         */
> +        assert(irq >= 16 && irq < 32);
Nit: Use GIC_NR_SGIS instead and irq < 32 is unnecessary.

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

-- 
Shannon

