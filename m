Received: by 10.25.44.15 with SMTP id s15csp2541131lfs;
        Thu, 27 Jul 2017 15:44:06 -0700 (PDT)
X-Received: by 10.55.19.13 with SMTP id d13mr7454183qkh.214.1501195446088;
        Thu, 27 Jul 2017 15:44:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501195446; cv=none;
        d=google.com; s=arc-20160816;
        b=g7HCBtGs5rWTPNXPeK1s9MxtaxEss6ZfhZIbUAWUlvjnKLpk9Xek0sw3QgCEaHgoRZ
         cnxV8cMYaiKI9zRQaA9LcW403HSWmniXexk4LwH00ySaeGBT/PNJZvYDL/8ScliVcb/m
         yLvtDWxq5SeBwc1JgUqp3C6rfvC1uGk9XINlAvMSvhVIBj62WaZeJzwLTPSjtyiAD2WM
         1UoaAjbmR+3eBtqPIz5tIo4k6OfoWyWyTAQF+tkCXuTv9miZUq2bnrIdv447OyShBaqB
         Ecv+eiGzd9Ewgy+tLbr9g1XTTl1XZi1FzI5NxUfupebidX7vr5NYdNl8K7wS8Fqabx16
         ol1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=tcitE3tZLRoQrszpvuGIuZ5/K2b1s+oR5oGDFlEuGNs=;
        b=ipvp2z3eHot1z3RcRlR4IUSOZJEm7cg3e9Kas5Jpb5yopJ6m32MlB+oEJmy1AIwqnn
         OSA6mgEYOk9YYIJ+nZc7LFTZS0c5Af9wbLjH6WPzav8jh7fiyPYl24nZhUBwY6hU3qMG
         74J592j6mHT7shqspTOJrKojsevBOcm+Q/XXjI+z6enJSlWfRacGOnTg/ipf2LZ3nwq1
         SfEcLQ9AQsZzQg0tGxoB2/WJ/M6X7sD3BTMfkZiwzVxcFaQrfhGlrSe688M+JOZAuOqJ
         whLglPT07RQfSgExhADwCI+ilhDiw4muz36Cp7GykkQf/x7xfI/3/7jG1hi207nAxa24
         wqRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ArfMT0ef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n188si8552029qkf.442.2017.07.27.15.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Jul 2017 15:44:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=ArfMT0ef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44994 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1darVj-0000Ej-AQ
	for alex.bennee@linaro.org; Thu, 27 Jul 2017 18:44:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40835)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1darVb-0000Cs-7F
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 18:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1darVZ-0008Pe-TE
	for qemu-arm@nongnu.org; Thu, 27 Jul 2017 18:43:55 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:37645)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1darVU-0008Lg-VW; Thu, 27 Jul 2017 18:43:49 -0400
Received: by mail-qt0-x241.google.com with SMTP id d10so10048956qtb.4;
	Thu, 27 Jul 2017 15:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tcitE3tZLRoQrszpvuGIuZ5/K2b1s+oR5oGDFlEuGNs=;
	b=ArfMT0efFQ+OXqVbVC7xSLulN97/qMylbJPz4gSMZ4QugRbZ73AteMcZGhWgwKHcWE
	VnWYrGIjF46HAXc4ZsfSHg3ncEXOL3QYIgQLQveJ2bD8VzunwuymG3qS2C0CK8+U0WBU
	oxlWSdVtN0bsuUzD979GgB4KpzZcQ07y82jfd8qpguC3IMODMbAA2/LtJ+1rOg3LdwDT
	WeyU0S2eLNt8hMWumPzsXe930/CBvYqLVHBEP7qfwTn2KwyYhMMYnJOmejbmSJrG3KID
	ksSf3+nKixMuW2akOet1VRvqg3giYM85PRi0h19SJwwpC7ij+Pl9FN4xt3imEJJhzO8Q
	xUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tcitE3tZLRoQrszpvuGIuZ5/K2b1s+oR5oGDFlEuGNs=;
	b=qPrjv7GfAFec9UzGKIhoiEdHVpmIJ8e1q7onw2yagTuSSffIHlT4NTUjXwEAAbzczq
	/deCIGWHA9J2BkrAV1nipD0Ms6cdn9wARfw12DwNTOy+/YHhoaSZ2uIWwXRJId4bPpZp
	PFlxVby0XD7xR+u7Lk0AVvvjvGP1Nzvm0eGzYjoRCn7/deWSXLBpJ7pA35EWbbMmmdNB
	ujCxEgzlwyzKSTvKjKgK/N0dJ0Keh5Uwc3WkfunwNr9cLhBVbpRVGvAtrN+qnzRKFl5v
	X4BgAWdi2gxe3rCMXypQAcih6lvrftO3Ts6HjzPttrWocymRcMekgclY05g3upfAz5+y
	uUMg==
X-Gm-Message-State: AIVw113by3xbsZxFN+V/OTkfQPgZgpphoqmnb7kq3VafukIupZJJZMfh
	31n5JBH5RrBTyw==
X-Received: by 10.200.37.206 with SMTP id f14mr7574779qtf.271.1501195426789;
	Thu, 27 Jul 2017 15:43:46 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	z192sm13953184qka.46.2017.07.27.15.43.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 15:43:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1501153150-19984-1-git-send-email-peter.maydell@linaro.org>
	<1501153150-19984-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5aff6da7-4ad1-64af-6445-98b8d7520b4c@amsat.org>
Date: Thu, 27 Jul 2017 19:43:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1501153150-19984-4-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH for-2.10 3/5] target/arm: Rename cp15.c6_rgnr
 to pmsav7.rnr
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
X-TUID: /H7XV9eWuCz2

Hi Peter,

you missed some rgnr -> rnr :|

On 07/27/2017 07:59 AM, Peter Maydell wrote:
> Almost all of the PMSAv7 state is in the pmsav7 substruct of
> the ARM CPU state structure. The exception is the region
> number register, which is in cp15.c6_rgnr. This exception
> is a bit odd for M profile, which otherwise generally does
> not store state in the cp15 substruct.
> 
> Rename cp15.c6_rgnr to pmsav7.rnr accordingly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/armv7m_nvic.c | 14 +++++++-------
>   target/arm/cpu.h      |  3 +--
>   target/arm/helper.c   |  6 +++---
>   target/arm/machine.c  |  2 +-
>   4 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 26a4b2d..323e2d4 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -536,13 +536,13 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
>       case 0xd94: /* MPU_CTRL */
>           return cpu->env.v7m.mpu_ctrl;
>       case 0xd98: /* MPU_RNR */
> -        return cpu->env.cp15.c6_rgnr;
> +        return cpu->env.pmsav7.rnr;
>       case 0xd9c: /* MPU_RBAR */
>       case 0xda4: /* MPU_RBAR_A1 */
>       case 0xdac: /* MPU_RBAR_A2 */
>       case 0xdb4: /* MPU_RBAR_A3 */
>       {
> -        int region = cpu->env.cp15.c6_rgnr;
> +        int region = cpu->env.pmsav7.rnr;
>   
>           if (region >= cpu->pmsav7_dregion) {
>               return 0;
> @@ -554,7 +554,7 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
>       case 0xdb0: /* MPU_RASR_A2 */
>       case 0xdb8: /* MPU_RASR_A3 */
>       {
> -        int region = cpu->env.cp15.c6_rgnr;
> +        int region = cpu->env.pmsav7.rnr;
>   
>           if (region >= cpu->pmsav7_dregion) {
>               return 0;
> @@ -681,7 +681,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>                             PRIu32 "/%" PRIu32 "\n",
>                             value, cpu->pmsav7_dregion);
>           } else {
> -            cpu->env.cp15.c6_rgnr = value;
> +            cpu->env.pmsav7.rnr = value;
>           }
>           break;
>       case 0xd9c: /* MPU_RBAR */
> @@ -702,9 +702,9 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>                                 region, cpu->pmsav7_dregion);
>                   return;
>               }
> -            cpu->env.cp15.c6_rgnr = region;
> +            cpu->env.pmsav7.rnr = region;
>           } else {
> -            region = cpu->env.cp15.c6_rgnr;
> +            region = cpu->env.pmsav7.rnr;
>           }
>   
>           if (region >= cpu->pmsav7_dregion) {
> @@ -720,7 +720,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>       case 0xdb0: /* MPU_RASR_A2 */
>       case 0xdb8: /* MPU_RASR_A3 */
>       {
> -        int region = cpu->env.cp15.c6_rgnr;
> +        int region = cpu->env.pmsav7.rnr;
>   
>           if (region >= cpu->pmsav7_dregion) {
>               return;
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 102c58a..b39d64a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -305,8 +305,6 @@ typedef struct CPUARMState {
>               uint64_t par_el[4];
>           };
>   
> -        uint32_t c6_rgnr;
> -
>           uint32_t c9_insn; /* Cache lockdown registers.  */
>           uint32_t c9_data;
>           uint64_t c9_pmcr; /* performance monitor control register */
> @@ -519,6 +517,7 @@ typedef struct CPUARMState {
>           uint32_t *drbar;
>           uint32_t *drsr;
>           uint32_t *dracr;
> +        uint32_t rnr;
>       } pmsav7;
>   
>       void *nvic;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 169c361..63187de 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2385,7 +2385,7 @@ static uint64_t pmsav7_read(CPUARMState *env, const ARMCPRegInfo *ri)
>           return 0;
>       }
>   
> -    u32p += env->cp15.c6_rgnr;
> +    u32p += env->pmsav7.rnr;
>       return *u32p;
>   }
>   
> @@ -2399,7 +2399,7 @@ static void pmsav7_write(CPUARMState *env, const ARMCPRegInfo *ri,
>           return;
>       }
>   
> -    u32p += env->cp15.c6_rgnr;
> +    u32p += env->pmsav7.rnr;
>       tlb_flush(CPU(cpu)); /* Mappings may have changed - purge! */
>       *u32p = value;
>   }
> @@ -2447,7 +2447,7 @@ static const ARMCPRegInfo pmsav7_cp_reginfo[] = {
>         .readfn = pmsav7_read, .writefn = pmsav7_write, .resetfn = pmsav7_reset },
>       { .name = "RGNR", .cp = 15, .crn = 6, .opc1 = 0, .crm = 2, .opc2 = 0,

"RGNR" -> "RNR"

>         .access = PL1_RW,
> -      .fieldoffset = offsetof(CPUARMState, cp15.c6_rgnr),
> +      .fieldoffset = offsetof(CPUARMState, pmsav7.rnr),
>         .writefn = pmsav7_rgnr_write },

pmsav7_rnr_write

>       REGINFO_SENTINEL
>   };
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 1a40469..93c1a78 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -151,7 +151,7 @@ static bool pmsav7_rgnr_vmstate_validate(void *opaque, int version_id)

pmsav7_rnr_vmstate_validate()

>   {
>       ARMCPU *cpu = opaque;
>   
> -    return cpu->env.cp15.c6_rgnr < cpu->pmsav7_dregion;
> +    return cpu->env.pmsav7.rnr < cpu->pmsav7_dregion;
>   }
>   
>   static const VMStateDescription vmstate_pmsav7 = {
> 
[...]
         VMSTATE_VALIDATE("rgnr is valid", pmsav7_rgnr_vmstate_validate),

also this one "rnr is valid" ^^^

once fixed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
