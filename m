Received: by 10.25.85.209 with SMTP id j200csp1069276lfb;
        Mon, 13 Jun 2016 00:57:36 -0700 (PDT)
X-Received: by 10.140.41.178 with SMTP id z47mr11997503qgz.25.1465804656887;
        Mon, 13 Jun 2016 00:57:36 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b11si12247377qte.87.2016.06.13.00.57.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 00:57:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54289 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCMka-0005Tj-BA
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 03:57:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCMkW-0005LC-Hj
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 03:57:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1bCMkU-0004XV-IR
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 03:57:31 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:5760)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1bCMkO-0004X5-Af; Mon, 13 Jun 2016 03:57:24 -0400
Received: from 172.24.1.36 (EHLO SZXEML424-HUB.china.huawei.com)
	([172.24.1.36])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id CDE06935; Mon, 13 Jun 2016 15:56:58 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by SZXEML424-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 13 Jun 2016 15:56:47 +0800
Message-ID: <575E673E.2080500@huawei.com>
Date: Mon, 13 Jun 2016 15:56:46 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
	<1464274540-19693-17-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1464274540-19693-17-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.575E674C.00CB, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f38c6c0f65ddb98daf71ac9f4a9e17fb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 16/22] hw/intc/arm_gicv3:
 Implement gicv3_cpuif_update()
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
X-TUID: fF+oRJ6FmmLa



On 2016/5/26 22:55, Peter Maydell wrote:
> +void gicv3_cpuif_update(GICv3CPUState *cs)
> +{
> +    /* Tell the CPU about its highest priority pending interrupt */
> +    int irqlevel = 0;
> +    int fiqlevel = 0;
> +    ARMCPU *cpu = ARM_CPU(cs->cpu);
> +    CPUARMState *env = &cpu->env;
> +
> +    trace_gicv3_cpuif_update(gicv3_redist_affid(cs), cs->hppi.irq,
> +                             cs->hppi.grp, cs->hppi.prio);
> +
> +    if (cs->hppi.grp == GICV3_G1 && !arm_feature(env, ARM_FEATURE_EL3)) {
> +        /* If a Security-enabled GIC sends a G1S interrupt to a
> +         * Security-disabled CPU, we must treat it as if it were G0.
> +         */
> +        cs->hppi.grp = GICV3_G0;
> +    }
> +
> +    if (icc_hppi_can_preempt(cs)) {
> +        /* We have an interrupt: should we signal it as IRQ or FIQ?
> +         * This is described in the GICv3 spec section 4.6.2.
> +         */
> +        bool isfiq;
> +
> +        switch (cs->hppi.grp) {
> +        case GICV3_G0:
> +            isfiq = true;
> +            break;
> +        case GICV3_G1:
> +            isfiq = (!arm_is_secure(env) ||
> +                     (arm_current_el(env) == 3 && arm_el_is_aa64(env, 3)));
> +            break;
> +        case GICV3_G1NS:
> +            isfiq = arm_is_secure(env);
> +            break;
> +        default:
> +            g_assert_not_reached();
> +        }
> +
> +        if (isfiq) {
> +            fiqlevel = 1;
> +        } else {
> +            irqlevel = 1;
> +        }
> +    }
> +
> +    trace_gicv3_cpuif_set_irqs(gicv3_redist_affid(cs), fiqlevel, irqlevel);
> +
> +    qemu_set_irq(cs->parent_fiq, fiqlevel);
> +    qemu_set_irq(cs->parent_irq, irqlevel);
Does it need to set both fiq and irq for one interrupt? I think it
should be called differently based on the value of isfiq.

Thanks,
-- 
Shannon

