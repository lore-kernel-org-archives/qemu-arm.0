Received: by 10.80.163.71 with SMTP id 65csp3338409edn;
        Thu, 6 Oct 2016 10:24:15 -0700 (PDT)
X-Received: by 10.200.38.186 with SMTP id 55mr14849429qto.35.1475774655527;
        Thu, 06 Oct 2016 10:24:15 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62si8254503qkv.337.2016.10.06.10.24.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 10:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsCP0-0003oT-8R
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 13:24:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bsBxE-0004om-Hn
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 12:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1bsBxD-00081C-54
	for qemu-devel@nongnu.org; Thu, 06 Oct 2016 12:55:32 -0400
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:36214)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1bsBx7-0007yr-3v; Thu, 06 Oct 2016 12:55:25 -0400
Received: by mail-lf0-x242.google.com with SMTP id b75so1307897lfg.3;
	Thu, 06 Oct 2016 09:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=k5dyfwEO3hq8kWtPY0xhcj7U5HOKThC37k3HeyZKZ1E=;
	b=btACEQyGU5qO5jGtfVqyG2qrMS8RavF4wjEqGqiT1KIc5QtYmdkzOcxzu/HrpklZ8G
	5tBf72zCCjYqMExi4nCZa47BNNVhZbtgxZVFy8iadGQ7LlPxQKZyIvioGACheeWiYvZb
	mo3SgFFxCbK0g0xRHcyPdrVfF3amRkvckv5VD34+QyaC8tw07UcGfvQtbhMPxo0Cqazh
	AAeVbfiPtBFF9BRHcA8kK/z5yCSyLta/LNguLVnIQ9HZHJN1u1SCLcz4m7RN9AbtxeeS
	ybnqOuqDgV4ZeGOBWMNm6qefo6UNoZ1ee0nqeJFOtfd5dgs6hw5xqmbbB0aZbjqDH26u
	xVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=k5dyfwEO3hq8kWtPY0xhcj7U5HOKThC37k3HeyZKZ1E=;
	b=QE6GLl31V77LvwzKGjPFGCKni+HZ5cWAn6VQcNhytjPYzahOvP/md+TyNB1QBFeJnP
	/wXFb7FgJDvpd5UWd3qY8oqglic3qaE//LgfcS5n94eX6NmaN8qUIf2jFMcR6lRzILZ8
	AXEDMWNKIZVt+u5402WEafRpewm/tEH/56wE3DvUW3kL4lAnkupv8a2vNL8FMCjZ9r/X
	5lVMX0Gx6LnmaRaqSdYqadZJsnB8va+d9KZ4M9fLSHCswn47OMG7TjdRAWBZa7uFP2W4
	SawN+upYe61nmayYstQsFQt6A18zC+ah9nl67yu2okoOIKur5LRhPvlR/cYGbYBTDPz8
	Yb+Q==
X-Gm-Message-State: AA6/9RmvyJJRF1MIc2Eq+sT78aGAzww8KX3dVTsVaW73bJ0uI4KgGAj0WwozoGbCtm/bKQ==
X-Received: by 10.25.44.80 with SMTP id s77mr1881829lfs.18.1475772924123;
	Thu, 06 Oct 2016 09:55:24 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	t78sm2804017lfi.43.2016.10.06.09.55.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Oct 2016 09:55:23 -0700 (PDT)
Date: Thu, 6 Oct 2016 18:55:22 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161006165522.GB28109@toto>
References: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
	<1475760067-25756-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1475760067-25756-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-devel] [PATCH 2/3] target-arm: Add trace events for the
 generic timers
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B8emRDnl1ocB

On Thu, Oct 06, 2016 at 02:21:06PM +0100, Peter Maydell wrote:
> Add some useful trace events for the ARM generic timers (notably
> the various register writes and the resulting IRQ line state).

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  Makefile.objs       |  1 +
>  target-arm/helper.c | 20 ++++++++++++++++----
>  2 files changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile.objs b/Makefile.objs
> index 02fb8e7..69fdd48 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -155,6 +155,7 @@ trace-events-y += hw/alpha/trace-events
>  trace-events-y += ui/trace-events
>  trace-events-y += audio/trace-events
>  trace-events-y += net/trace-events
> +trace-events-y += target-arm/trace-events
>  trace-events-y += target-i386/trace-events
>  trace-events-y += target-sparc/trace-events
>  trace-events-y += target-s390x/trace-events
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 23792ab..5fcdc2b 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -1,4 +1,5 @@
>  #include "qemu/osdep.h"
> +#include "trace.h"
>  #include "cpu.h"
>  #include "internals.h"
>  #include "exec/gdbstub.h"
> @@ -1560,10 +1561,13 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>          /* Note that this must be unsigned 64 bit arithmetic: */
>          int istatus = count - offset >= gt->cval;
>          uint64_t nexttick;
> +        int irqstate;
>  
>          gt->ctl = deposit32(gt->ctl, 2, 1, istatus);
> -        qemu_set_irq(cpu->gt_timer_outputs[timeridx],
> -                     (istatus && !(gt->ctl & 2)));
> +
> +        irqstate = (istatus && !(gt->ctl & 2));
> +        qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
> +
>          if (istatus) {
>              /* Next transition is when count rolls back over to zero */
>              nexttick = UINT64_MAX;
> @@ -1580,11 +1584,13 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>              nexttick = INT64_MAX / GTIMER_SCALE;
>          }
>          timer_mod(cpu->gt_timer[timeridx], nexttick);
> +        trace_arm_gt_recalc(timeridx, irqstate, nexttick);
>      } else {
>          /* Timer disabled: ISTATUS and timer output always clear */
>          gt->ctl &= ~4;
>          qemu_set_irq(cpu->gt_timer_outputs[timeridx], 0);
>          timer_del(cpu->gt_timer[timeridx]);
> +        trace_arm_gt_recalc_disabled(timeridx);
>      }
>  }
>  
> @@ -1610,6 +1616,7 @@ static void gt_cval_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                            int timeridx,
>                            uint64_t value)
>  {
> +    trace_arm_gt_cval_write(timeridx, value);
>      env->cp15.c14_timer[timeridx].cval = value;
>      gt_recalc_timer(arm_env_get_cpu(env), timeridx);
>  }
> @@ -1629,6 +1636,7 @@ static void gt_tval_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  {
>      uint64_t offset = timeridx == GTIMER_VIRT ? env->cp15.cntvoff_el2 : 0;
>  
> +    trace_arm_gt_tval_write(timeridx, value);
>      env->cp15.c14_timer[timeridx].cval = gt_get_countervalue(env) - offset +
>                                           sextract64(value, 0, 32);
>      gt_recalc_timer(arm_env_get_cpu(env), timeridx);
> @@ -1641,6 +1649,7 @@ static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      ARMCPU *cpu = arm_env_get_cpu(env);
>      uint32_t oldval = env->cp15.c14_timer[timeridx].ctl;
>  
> +    trace_arm_gt_ctl_write(timeridx, value);
>      env->cp15.c14_timer[timeridx].ctl = deposit64(oldval, 0, 2, value);
>      if ((oldval ^ value) & 1) {
>          /* Enable toggled */
> @@ -1649,8 +1658,10 @@ static void gt_ctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          /* IMASK toggled: don't need to recalculate,
>           * just set the interrupt line based on ISTATUS
>           */
> -        qemu_set_irq(cpu->gt_timer_outputs[timeridx],
> -                     (oldval & 4) && !(value & 2));
> +        int irqstate = (oldval & 4) && !(value & 2);
> +
> +        trace_arm_gt_imask_toggle(timeridx, irqstate);
> +        qemu_set_irq(cpu->gt_timer_outputs[timeridx], irqstate);
>      }
>  }
>  
> @@ -1715,6 +1726,7 @@ static void gt_cntvoff_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  {
>      ARMCPU *cpu = arm_env_get_cpu(env);
>  
> +    trace_arm_gt_cntvoff_write(value);
>      raw_write(env, ri, value);
>      gt_recalc_timer(cpu, GTIMER_VIRT);
>  }
> -- 
> 2.7.4
> 
