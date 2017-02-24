Received: by 10.25.0.147 with SMTP id 141csp810750lfa;
        Fri, 24 Feb 2017 10:31:39 -0800 (PST)
X-Received: by 10.237.39.5 with SMTP id n5mr3925531qtd.38.1487961099152;
        Fri, 24 Feb 2017 10:31:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u32si5933073qte.222.2017.02.24.10.31.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 24 Feb 2017 10:31:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39240 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1chKeW-0003oz-Cp
	for alex.bennee@linaro.org; Fri, 24 Feb 2017 13:31:36 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1chK2w-00067C-Ek
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 12:52:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1chK2t-00077P-3S
	for qemu-arm@nongnu.org; Fri, 24 Feb 2017 12:52:46 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34322)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1chK2s-00076n-Qh; Fri, 24 Feb 2017 12:52:43 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 960DD7E9D5;
	Fri, 24 Feb 2017 17:52:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-118-6.ams2.redhat.com [10.36.118.6]
	(may be forged))
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1OHqddo030843
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 24 Feb 2017 12:52:40 -0500
To: vijay.kilari@gmail.com, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	christoffer.dall@linaro.org
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
	<1487850673-26455-5-git-send-email-vijay.kilari@gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <57dac6a6-6ac5-91c7-6dd2-dfb1b9fa1f7c@redhat.com>
Date: Fri, 24 Feb 2017 18:52:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1487850673-26455-5-git-send-email-vijay.kilari@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 24 Feb 2017 17:52:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v9 4/5] target-arm: Add GICv3CPUState in
 CPUARMState struct
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
Cc: marc.zyngier@arm.com, p.fedin@samsung.com, qemu-devel@nongnu.org,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EVmjAgiGXSrU

Hi,
On 23/02/2017 12:51, vijay.kilari@gmail.com wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> 
> Add gicv3state void pointer to CPUARMState struct
> to store GICv3CPUState.
> 
> In case of usecase like CPU reset, we need to reset
> GICv3CPUState of the CPU. In such scenario, this pointer
> becomes handy.
> 
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/intc/arm_gicv3_common.c | 2 ++
>  hw/intc/arm_gicv3_cpuif.c  | 8 ++++++++
>  hw/intc/gicv3_internal.h   | 2 ++
>  target/arm/cpu.h           | 2 ++
>  4 files changed, 14 insertions(+)
> 
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 5b0e456..c6493d6 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -252,6 +252,8 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>  
>          s->cpu[i].cpu = cpu;
>          s->cpu[i].gic = s;
> +        /* Store GICv3CPUState in CPUARMState gicv3state pointer */
> +        gicv3_set_gicv3state(cpu, &s->cpu[i]);
>  
>          /* Pre-construct the GICR_TYPER:
>           * For our implementation:
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index c25ee03..7849783 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -18,6 +18,14 @@
>  #include "gicv3_internal.h"
>  #include "cpu.h"
>  
> +void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +
> +    env->gicv3state = (void *)s;
> +};
> +
>  static GICv3CPUState *icc_cs_from_env(CPUARMState *env)
>  {
>      /* Given the CPU, find the right GICv3CPUState struct.
> diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
> index 457118e..05303a5 100644
> --- a/hw/intc/gicv3_internal.h
> +++ b/hw/intc/gicv3_internal.h
> @@ -408,4 +408,6 @@ static inline void gicv3_cache_all_target_cpustates(GICv3State *s)
>      }
>  }
>  
> +void gicv3_set_gicv3state(CPUState *cpu, GICv3CPUState *s);
> +
>  #endif /* QEMU_ARM_GICV3_INTERNAL_H */
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 0956a54..d2eb7bf 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -517,6 +517,8 @@ typedef struct CPUARMState {
>  
>      void *nvic;
>      const struct arm_boot_info *boot_info;
> +    /* Store GICv3CPUState to access from this struct */
> +    void *gicv3state;
>  } CPUARMState;
>  
>  /**
> 
