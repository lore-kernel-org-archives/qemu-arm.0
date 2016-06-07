Received: by 10.25.27.66 with SMTP id b63csp1888245lfb;
        Tue, 7 Jun 2016 01:38:23 -0700 (PDT)
X-Received: by 10.140.160.135 with SMTP id g129mr19563989qhg.47.1465288703021;
        Tue, 07 Jun 2016 01:38:23 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c65si14550295qhd.2.2016.06.07.01.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 01:38:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47868 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bACWk-0000Xp-GY
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 04:38:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bACUJ-0007gt-HV
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 04:35:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bACUG-0007El-AX
	for qemu-devel@nongnu.org; Tue, 07 Jun 2016 04:35:51 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:23072)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bACU5-0006ju-C0; Tue, 07 Jun 2016 04:35:48 -0400
Received: from 172.24.1.36 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.1.36])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id DLW03175; Tue, 07 Jun 2016 16:33:30 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.235.1; Tue, 7 Jun 2016
	16:33:20 +0800
Message-ID: <575686CF.7040705@huawei.com>
Date: Tue, 7 Jun 2016 16:33:19 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-8-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090206.575686DF.0025, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-06-18 04:22:30, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: cf33aadc45f01104969a6ddc671dc0ef
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Subject: Re: [Qemu-devel] [PATCH v2 07/22] hw/intc/arm_gicv3: Move irq lines
 into GICv3CPUState structure
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lHigFqU/Cpu+



On 2016/5/26 22:55, Peter Maydell wrote:
> Move the GICv3 parent_irq and parent_fiq pointers into the
> GICv3CPUState structure rather than giving them their own array.
> This will make it easy to assert the IRQ and FIQ lines for a
> particular CPU interface without having to know or calculate
> the CPU index for the GICv3CPUState we are working on.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Shannon Zhao <shannon.zhao@linaro.org>

> ---
>  hw/intc/arm_gicv3_common.c         | 7 ++-----
>  include/hw/intc/arm_gicv3_common.h | 5 ++---
>  2 files changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index bf6949f..1557833 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -72,14 +72,11 @@ void gicv3_init_irqs_and_mmio(GICv3State *s, qemu_irq_handler handler,
>      i = s->num_irq - GIC_INTERNAL + GIC_INTERNAL * s->num_cpu;
>      qdev_init_gpio_in(DEVICE(s), handler, i);
>  
> -    s->parent_irq = g_malloc(s->num_cpu * sizeof(qemu_irq));
> -    s->parent_fiq = g_malloc(s->num_cpu * sizeof(qemu_irq));
> -
>      for (i = 0; i < s->num_cpu; i++) {
> -        sysbus_init_irq(sbd, &s->parent_irq[i]);
> +        sysbus_init_irq(sbd, &s->cpu[i].parent_irq);
>      }
>      for (i = 0; i < s->num_cpu; i++) {
> -        sysbus_init_irq(sbd, &s->parent_fiq[i]);
> +        sysbus_init_irq(sbd, &s->cpu[i].parent_fiq);
>      }
>  
>      memory_region_init_io(&s->iomem_dist, OBJECT(s), ops, s,
> diff --git a/include/hw/intc/arm_gicv3_common.h b/include/hw/intc/arm_gicv3_common.h
> index 6d4327b..f01b616 100644
> --- a/include/hw/intc/arm_gicv3_common.h
> +++ b/include/hw/intc/arm_gicv3_common.h
> @@ -135,6 +135,8 @@ typedef struct GICv3CPUState GICv3CPUState;
>  struct GICv3CPUState {
>      GICv3State *gic;
>      CPUState *cpu;
> +    qemu_irq parent_irq;
> +    qemu_irq parent_fiq;
>  
>      /* Redistributor */
>      uint32_t level;                  /* Current IRQ level */
> @@ -169,9 +171,6 @@ struct GICv3State {
>      SysBusDevice parent_obj;
>      /*< public >*/
>  
> -    qemu_irq *parent_irq;
> -    qemu_irq *parent_fiq;
> -
>      MemoryRegion iomem_dist; /* Distributor */
>      MemoryRegion iomem_redist; /* Redistributors */
>  
> 

-- 
Shannon

