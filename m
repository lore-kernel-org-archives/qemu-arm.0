Received: by 10.223.172.38 with SMTP id v35csp1961585wrc;
        Tue, 5 Sep 2017 15:46:22 -0700 (PDT)
X-Received: by 10.55.99.88 with SMTP id x85mr860706qkb.258.1504651582563;
        Tue, 05 Sep 2017 15:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504651582; cv=none;
        d=google.com; s=arc-20160816;
        b=AlcXqtmj5ISvWxH1451bS+WwsAAqrPC17CLewonzcf806fpzI1R4ZkKLT4YQqWZvJG
         ban/RkzrjD7ohcQeQXZT5FFIz9gA0oFRW0K9A30s9bDALWwBXhyNWrP+6D0+WpVxhpCi
         368/dJJwKpc0XwkTe/wOgX0vopH3loOv4bm2nk2gNMN3U4vEMkpsRKK28E4ql3itRvnw
         M/SrKQi0o/tsossPZcT4EsRV7Mo3VkX+h7yP7bb8BfJl9z9SpHQGOatInJ/8SFOxeg3D
         dhEnN6M+pWlvmtbba2Pw8WQ3/dtUlF/oFCAEd3LOb6NwUuqKksfV8AUt7xYosAZ/shjQ
         fdrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=w8AH+/nzsmrsV5P253aYXwu+aPJaJif1oV+tYgIzDZI=;
        b=kDh0mXShdtZbZkHNvDkdZIZWGL6ZWZrDXXto1zNcaMW763ZrQTxZu6+2EUvJYM8Mic
         viBiCuelaU83b3FmeY/N+Uis6VzbHJBMRXNVatmPuH6A/RBjFyNlG+Vjzf/UZFA0BTEB
         qjRQglgFx2eWy9Rx7AdS6l1cH8XdMm1HPjvgLEzP7Jcru9KmVH3PB44Eorl4a5pTYw3G
         DQ5JA6ubniJEiZVwX5bLUCf1qcRIJEVYoNw6aEuUvPl3fWfUdWIgGah4HGlpHVNPkSNh
         Cjx1ZuRTc/mehDtPHyonsmJdEnpr8nSfyRD8PwW40HuN1f52aaLBj6DNDT0AaUXzN6Qr
         BuCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oJMHpFOv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v186si1490951qkh.115.2017.09.05.15.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 15:46:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oJMHpFOv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33429 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMbs-0007eJ-91
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 18:46:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMbc-0007aP-WB
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:46:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMbY-0008PQ-0k
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 18:46:05 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMbN-0008Le-KV; Tue, 05 Sep 2017 18:45:49 -0400
Received: by mail-qk0-x244.google.com with SMTP id c69so2957760qke.5;
	Tue, 05 Sep 2017 15:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=w8AH+/nzsmrsV5P253aYXwu+aPJaJif1oV+tYgIzDZI=;
	b=oJMHpFOvaiYhx71/OgHlWJ/1DmDrRqcWChkN6XQ0znEctkjR2GhtcGa61Ib50ueb+b
	OfU1aOQXYSpAFvIcGnJWsyBh2zM/14R2DwdDW/1gCUnSnJikS03PAiEJp2Mo7Hf3vdYE
	bNJoHNKQxwuIP/nN6UfTdF35+ZS02PUXU8c9Tfj5+a/dK/EDJG1Lkb7oSKPDsGqOWMIM
	7khNavdXDheCVJPS9PjOKJCdQPLLZgTDDOKFviz/WIpmsCiG+8x/Gc2vj9c6gmpUeQwn
	u/ojAaLh+wbc3ofBoLF74Zvc4nRLUBaBkP2t5HREVzVblfB9ho+v7WW3yjTOQn3/pmwb
	klmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w8AH+/nzsmrsV5P253aYXwu+aPJaJif1oV+tYgIzDZI=;
	b=BPjZzRPuIO6uUDGNWFa55yM81VqyFqmivM3B6rrxQrzoK0fPrjfdvt+5HAMY/3pPTp
	zsVHP4fsB05YxWsvNEZ4wKQh+/ZX6+eYMLucdpdQEG3LNIWitlMDT4gW506qwc/NikoV
	J1UN2Etq+ksZz1HCU/WMGaupAFN6bnTIQ/ALPkb95eAxkUZfd9f7fmbgFfNfWM6KgnkP
	kO1od3gf0D+FNn/LGtWbLWGxADQcJaNJxOkHdHXc6/6B0P37fv0H3nRRfyg+I++H6WSj
	+2OGqwiGJMmO6P3l1FM3L34fx/VVXVJZsok52dkofQSqcEQBOIFHWnynjh1jpb5DlrOL
	70Lw==
X-Gm-Message-State: AHPjjUisdHpJGUt0O8N+jHJix4iwY963Kce0okMsqMkGduRTNKFEay7d
	KKVNKopGUUWnSw==
X-Google-Smtp-Source: AOwi7QCPw7hK59lGAvNfHUK1SkG0YRV9iv6B/1BAuceOG7CFu3qUU8gmvQ2OU8jkRIbXwmZ/3KqiPA==
X-Received: by 10.55.75.17 with SMTP id y17mr936679qka.114.1504651548949;
	Tue, 05 Sep 2017 15:45:48 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	r22sm1185462qtj.94.2017.09.05.15.45.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 15:45:48 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-7-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a6b2c6cf-4cd0-cc99-daef-ab85f6a4b1a7@amsat.org>
Date: Tue, 5 Sep 2017 19:45:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-arm] [PATCH 06/20] target/arm: Make BASEPRI register
 banked for v8M
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5HSUKelQ6voB

Hi Peter,

On 08/22/2017 12:08 PM, Peter Maydell wrote:
> Make the BASEPRI register banked if v8M security extensions are enabled.
> 
> Note that we do not yet implement the functionality of the new
> AIRCR.PRIS bit (which allows the effect of the NS copy of BASEPRI to
> be restricted).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h      | 14 +++++++++++++-
>   hw/intc/armv7m_nvic.c |  4 ++--
>   target/arm/helper.c   | 10 ++++++----
>   target/arm/machine.c  |  3 ++-
>   4 files changed, 23 insertions(+), 8 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 436ca0d..0c28dfd 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -72,6 +72,18 @@
>   #define ARMV7M_EXCP_PENDSV  14
>   #define ARMV7M_EXCP_SYSTICK 15
>   
> +/* For M profile, some registers are banked secure vs non-secure;
> + * these are represented as a 2-element array where the first element
> + * is the non-secure copy and the second is the secure copy.
> + * When the CPU does not have implement the security extension then
> + * only the first element is used.
> + * This means that the copy for the current security state can be
> + * accessed via env->registerfield[env->v7m.secure] (whether the security
> + * extension is implemented or not).
> + */
> +#define M_REG_NS 0
> +#define M_REG_S 1

enum {
     M_REG_NS = 0,
     M_REG_S = 1,
     M_BANKED_SECURE_REG_COUNT = 2;
};

or directly this?

#define M_BANKED_SECURE_REG_COUNT 2

shorter nicer...

#define M_BANKED_SECURE_REGS 2

> +
>   /* ARM-specific interrupt pending bits.  */
>   #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
>   #define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
> @@ -409,7 +421,7 @@ typedef struct CPUARMState {
>       struct {
>           uint32_t other_sp;
>           uint32_t vecbase;
> -        uint32_t basepri;
> +        uint32_t basepri[2];

             uint32_t basepri[M_BANKED_SECURE_REGS];

(and following patches of this series...)

>           uint32_t control;
>           uint32_t ccr; /* Configuration and Control */
>           uint32_t cfsr; /* Configurable Fault Status */
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index c0dbbad..2a41e5d 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -171,8 +171,8 @@ static inline int nvic_exec_prio(NVICState *s)
>           running = -1;
>       } else if (env->v7m.primask) {
>           running = 0;
> -    } else if (env->v7m.basepri > 0) {
> -        running = env->v7m.basepri & nvic_gprio_mask(s);
> +    } else if (env->v7m.basepri[env->v7m.secure] > 0) {
> +        running = env->v7m.basepri[env->v7m.secure] & nvic_gprio_mask(s);
>       } else {
>           running = NVIC_NOEXC_PRIO; /* lower than any possible priority */
>       }
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 1debebc..1087f19 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8838,7 +8838,7 @@ uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
>           return env->v7m.primask;
>       case 17: /* BASEPRI */
>       case 18: /* BASEPRI_MAX */
> -        return env->v7m.basepri;
> +        return env->v7m.basepri[env->v7m.secure];
>       case 19: /* FAULTMASK */
>           return env->v7m.faultmask;
>       default:
> @@ -8898,12 +8898,14 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
>           env->v7m.primask = val & 1;
>           break;
>       case 17: /* BASEPRI */
> -        env->v7m.basepri = val & 0xff;
> +        env->v7m.basepri[env->v7m.secure] = val & 0xff;
>           break;
>       case 18: /* BASEPRI_MAX */
>           val &= 0xff;
> -        if (val != 0 && (val < env->v7m.basepri || env->v7m.basepri == 0))
> -            env->v7m.basepri = val;
> +        if (val != 0 && (val < env->v7m.basepri[env->v7m.secure]
> +                         || env->v7m.basepri[env->v7m.secure] == 0)) {
> +            env->v7m.basepri[env->v7m.secure] = val;
> +        }
>           break;
>       case 19: /* FAULTMASK */
>           env->v7m.faultmask = val & 1;
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 745adae..8476efd 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -115,7 +115,7 @@ static const VMStateDescription vmstate_m = {
>       .needed = m_needed,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT32(env.v7m.vecbase, ARMCPU),
> -        VMSTATE_UINT32(env.v7m.basepri, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.basepri[M_REG_NS], ARMCPU),
>           VMSTATE_UINT32(env.v7m.control, ARMCPU),
>           VMSTATE_UINT32(env.v7m.ccr, ARMCPU),
>           VMSTATE_UINT32(env.v7m.cfsr, ARMCPU),
> @@ -250,6 +250,7 @@ static const VMStateDescription vmstate_m_security = {
>       .needed = m_security_needed,
>       .fields = (VMStateField[]) {
>           VMSTATE_UINT32(env.v7m.secure, ARMCPU),
> +        VMSTATE_UINT32(env.v7m.basepri[M_REG_S], ARMCPU),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> 
