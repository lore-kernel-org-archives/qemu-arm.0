Received: by 10.223.172.38 with SMTP id v35csp1786858wrc;
        Tue, 5 Sep 2017 12:19:19 -0700 (PDT)
X-Received: by 10.200.43.188 with SMTP id m57mr170446qtm.241.1504639159745;
        Tue, 05 Sep 2017 12:19:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504639159; cv=none;
        d=google.com; s=arc-20160816;
        b=LH4BcfZO8DJyR72Zm4jGVco3JHCVq0aO68OWGLDD72Ezm3nE1GpeWr6uQmOQl87Ecn
         Ai3GsCdyVACWjPEeWXY9XWIQI0tnGEEiu8lSF/XkRZDt5GZ/mgrXcTi8sBCHkdL2WtsU
         VYuxsSgZYFfJAv49ZgZ5f5iZZb3OUH/mJT/0l5ObH/sDiRMgziAnlkXsduk1c5ydLlRT
         bghqBX9hGvH9c6LxOdihl9BtVJt4B6SRerJnh361DyYJ0ugxWEComUAOQsC7hOZIAVQG
         QtbIlrF+TDww5jJHdO6KHjjtR/LIQMgAzxAotPTziuOeNuKRfzsNwvqxQcnHM6SXj/Ku
         bW+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=V4zl+MBw6jN7RhAPv8FKYv829TTY1LbgEAiMwXuQHHc=;
        b=TorfYZryoYWhUlhK8oAyTt7AD1pc6jPdEL8RtCwyNyytgdZ38yAZ3yc/9GkDe4F9wS
         jx/KVJakQ9mQOB/ivpM1ijptM9NLItep0QM8k580ao3IQLlOj07DZLTHVRDwLZVyk4Yf
         ev3Tk2ExzaTlFWXiXUcvF+qfC15k7k3yzHHpAnWWEht0ydnentoBkOT/2EoYslwp8lFx
         Hklh50yg4qcHgnxof0UqFMHfP0J/vXLFyqrrH/wIGREcWXuLcv2cklvwy3KAQY6r8MLf
         5RnOL3/9EHD0oArtVEvWRPFFNELAPy9aSfHXgNmeIq22pF/6FbHVUAmhTFkiBftJUj0L
         U1Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L+sUy2EN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j51si970921qtc.260.2017.09.05.12.19.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 12:19:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=L+sUy2EN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpJNV-0005dH-D6
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 15:19:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpJLA-0004Rl-5A
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 15:16:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpJL4-0000ZH-Gu
	for qemu-devel@nongnu.org; Tue, 05 Sep 2017 15:16:52 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpJL4-0000Ys-9Q; Tue, 05 Sep 2017 15:16:46 -0400
Received: by mail-qt0-x242.google.com with SMTP id h21so2744509qth.4;
	Tue, 05 Sep 2017 12:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=V4zl+MBw6jN7RhAPv8FKYv829TTY1LbgEAiMwXuQHHc=;
	b=L+sUy2ENgV14IEXhXbLBWZlmfpZr04zFi6zrn5t+fVxC4Q6fgvXis2hbopr9+ZN3MV
	dcLryiQRKjKECyzjNzsbZx/TpVwMHvb1Dzo30FyvESr1KlYSLg6+4LXCK/kD02P56mnV
	5CmLChqksu0POZpkKfRW6+I4jnG6lxD8SFv6/POjEdc5R/gi+BCr4bNCH4cmixLVa2uA
	eCKs0JU8iIwnvNJxzma+xqUygclqr+l/g0mgNiH4UXG6aRROEl+14vMCcy12CK1IFwLT
	FrfN8lpXhFb0Ip4d2KKagK3iRV3NIVbDsvE3lo9FOrp9PmGa6TYaAT2KfZ0CTQ28aexc
	8VaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=V4zl+MBw6jN7RhAPv8FKYv829TTY1LbgEAiMwXuQHHc=;
	b=rq19n6HPrw6rF9Rgo41CSQW34kThLJ1a7CuyLcXePQqOlMZzqMnMI3nfKuOvPudibx
	3CUOM0sTtNlJsnmnUICYImbsOsDnWowQQKYgQMCs5/Vq+a3SXJwtA22mTqd0iHbj+2PS
	zHmbiAbejgRBPhnaitgJj0on0gXaCmmMz8yWhqt5EWF3TIulQ0elCJOPbENRerS7lx3X
	x/B6DvEgznrC7r4AsYpg4+fiPjU6CJ6iKhLQr0vFO57RQf48YvPSsyBz8tdxuXaGZxHq
	V23fgh2A/5u7vT6FTDU3kT49J0LSloES93Ke0RLO6BEq9W9kHLvY2KfSqhyv+gxeuMGl
	vsGw==
X-Gm-Message-State: AHPjjUgnB6XbMIscr8DbDHquZaAY7c6rkSVu+4zjbDnlUcWwM6AFi9eu
	/GEMDIK0HLXE2llVNzM=
X-Google-Smtp-Source: ADKCNb7Fv8v+/OqBp7zeFlHWwFOpH+/eVD5EnFtHqbVvlHQDvA3X4gkG5qDFKeliviqOhA3fkhxRoA==
X-Received: by 10.200.40.231 with SMTP id j36mr202525qtj.270.1504639005320;
	Tue, 05 Sep 2017 12:16:45 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id l1sm908923qtc.19.2017.09.05.12.16.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 12:16:44 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-2-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cfc75c71-1558-3405-8e5c-188cdb329bfe@amsat.org>
Date: Tue, 5 Sep 2017 16:16:41 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 01/20] target/arm: Implement
 ARMv8M's PMSAv8 registers
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r3NDn00DJLtJ

Hi Peter,

On 08/22/2017 12:08 PM, Peter Maydell wrote:
> As part of ARMv8M, we need to add support for the PMSAv8 MPU
> architecture.
> 
> PMSAv8 differs from PMSAv7 both in register/data layout (for instance
> using base and limit registers rather than base and size) and also in
> behaviour (for example it does not have subregions); rather than
> trying to wedge it into the existing PMSAv7 code and data structures,
> we define separate ones.
> 
> This commit adds the data structures which hold the state for a
> PMSAv8 MPU and the register interface to it.  The implementation of
> the MPU behaviour will be added in a subsequent commit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h      |  13 ++++++
>   hw/intc/armv7m_nvic.c | 122 ++++++++++++++++++++++++++++++++++++++++++++++----
>   target/arm/cpu.c      |  36 ++++++++++-----
>   target/arm/machine.c  |  28 +++++++++++-
>   4 files changed, 179 insertions(+), 20 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fe6edb7..b6bb78a 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -522,6 +522,19 @@ typedef struct CPUARMState {
>           uint32_t rnr;
>       } pmsav7;
>   
> +    /* PMSAv8 MPU */
> +    struct {
> +        /* The PMSAv8 implementation also shares some PMSAv7 config
> +         * and state:
> +         *  pmsav7.rnr (region number register)
> +         *  pmsav7_dregion (number of configured regions)
> +         */
> +        uint32_t *rbar;
> +        uint32_t *rlar;
> +        uint32_t mair0;
> +        uint32_t mair1;
> +    } pmsav8;
> +
>       void *nvic;
>       const struct arm_boot_info *boot_info;
>       /* Store GICv3CPUState to access from this struct */
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index bbfe2d5..c0dbbad 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -544,25 +544,67 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset)
>       {
>           int region = cpu->env.pmsav7.rnr;
>   
> +        if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
> +            /* PMSAv8M handling of the aliases is different from v7M:
> +             * aliases A1, A2, A3 override the low two bits of the region
> +             * number in MPU_RNR, and there is no 'region' field in the
> +             * RBAR register.
> +             */
> +            int aliasno = (offset - 0xd9c) / 8; /* 0..3 */
> +            if (aliasno) {
> +                region = deposit32(region, 0, 2, aliasno);
> +            }
> +            if (region >= cpu->pmsav7_dregion) {
> +                return 0;
> +            }
> +            return cpu->env.pmsav8.rbar[region];
> +        }
> +
>           if (region >= cpu->pmsav7_dregion) {
>               return 0;
>           }
>           return (cpu->env.pmsav7.drbar[region] & 0x1f) | (region & 0xf);
>       }
> -    case 0xda0: /* MPU_RASR */
> -    case 0xda8: /* MPU_RASR_A1 */
> -    case 0xdb0: /* MPU_RASR_A2 */
> -    case 0xdb8: /* MPU_RASR_A3 */
> +    case 0xda0: /* MPU_RASR (v7M), MPU_RLAR (v8M) */
> +    case 0xda8: /* MPU_RASR_A1 (v7M), MPU_RLAR_A1 (v8M) */
> +    case 0xdb0: /* MPU_RASR_A2 (v7M), MPU_RLAR_A2 (v8M) */
> +    case 0xdb8: /* MPU_RASR_A3 (v7M), MPU_RLAR_A3 (v8M) */
>       {
>           int region = cpu->env.pmsav7.rnr;
>   
> +        if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
> +            /* PMSAv8M handling of the aliases is different from v7M:
> +             * aliases A1, A2, A3 override the low two bits of the region
> +             * number in MPU_RNR.
> +             */
> +            int aliasno = (offset - 0xda0) / 8; /* 0..3 */
> +            if (aliasno) {
> +                region = deposit32(region, 0, 2, aliasno);
> +            }
> +            if (region >= cpu->pmsav7_dregion) {
> +                return 0;
> +            }
> +            return cpu->env.pmsav8.rlar[region];
> +        }
> +
>           if (region >= cpu->pmsav7_dregion) {
>               return 0;
>           }
>           return ((cpu->env.pmsav7.dracr[region] & 0xffff) << 16) |
>               (cpu->env.pmsav7.drsr[region] & 0xffff);
>       }
> +    case 0xdc0: /* MPU_MAIR0 */
> +        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
> +            goto bad_offset;
> +        }
> +        return cpu->env.pmsav8.mair0;
> +    case 0xdc4: /* MPU_MAIR1 */
> +        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
> +            goto bad_offset;
> +        }
> +        return cpu->env.pmsav8.mair1;
>       default:
> +    bad_offset:
>           qemu_log_mask(LOG_GUEST_ERROR, "NVIC: Bad read offset 0x%x\n", offset);
>           return 0;
>       }
> @@ -691,6 +733,26 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>       {
>           int region;
>   
> +        if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
> +            /* PMSAv8M handling of the aliases is different from v7M:
> +             * aliases A1, A2, A3 override the low two bits of the region
> +             * number in MPU_RNR, and there is no 'region' field in the
> +             * RBAR register.
> +             */
> +            int aliasno = (offset - 0xd9c) / 8; /* 0..3 */
> +
> +            region = cpu->env.pmsav7.rnr;
> +            if (aliasno) {
> +                region = deposit32(region, 0, 2, aliasno);
> +            }
> +            if (region >= cpu->pmsav7_dregion) {
> +                return;
> +            }
> +            cpu->env.pmsav8.rbar[region] = value;
> +            tlb_flush(CPU(cpu));
> +            return;
> +        }
> +
>           if (value & (1 << 4)) {
>               /* VALID bit means use the region number specified in this
>                * value and also update MPU_RNR.REGION with that value.
> @@ -715,13 +777,32 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>           tlb_flush(CPU(cpu));
>           break;
>       }
> -    case 0xda0: /* MPU_RASR */
> -    case 0xda8: /* MPU_RASR_A1 */
> -    case 0xdb0: /* MPU_RASR_A2 */
> -    case 0xdb8: /* MPU_RASR_A3 */
> +    case 0xda0: /* MPU_RASR (v7M), MPU_RLAR (v8M) */
> +    case 0xda8: /* MPU_RASR_A1 (v7M), MPU_RLAR_A1 (v8M) */
> +    case 0xdb0: /* MPU_RASR_A2 (v7M), MPU_RLAR_A2 (v8M) */
> +    case 0xdb8: /* MPU_RASR_A3 (v7M), MPU_RLAR_A3 (v8M) */
>       {
>           int region = cpu->env.pmsav7.rnr;
>   
> +        if (arm_feature(&cpu->env, ARM_FEATURE_V8)) {
> +            /* PMSAv8M handling of the aliases is different from v7M:
> +             * aliases A1, A2, A3 override the low two bits of the region
> +             * number in MPU_RNR.
> +             */
> +            int aliasno = (offset - 0xd9c) / 8; /* 0..3 */
> +
> +            region = cpu->env.pmsav7.rnr;
> +            if (aliasno) {
> +                region = deposit32(region, 0, 2, aliasno);
> +            }
> +            if (region >= cpu->pmsav7_dregion) {
> +                return;
> +            }
> +            cpu->env.pmsav8.rlar[region] = value;
> +            tlb_flush(CPU(cpu));
> +            return;
> +        }
> +
>           if (region >= cpu->pmsav7_dregion) {
>               return;
>           }
> @@ -731,6 +812,30 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>           tlb_flush(CPU(cpu));
>           break;
>       }
> +    case 0xdc0: /* MPU_MAIR0 */
> +        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
> +            goto bad_offset;
> +        }
> +        if (cpu->pmsav7_dregion) {
> +            /* Register is RES0 if no MPU regions are implemented */
> +            cpu->env.pmsav8.mair0 = value;
> +        }
> +        /* We don't need to do anything else because memory attributes
> +         * only affect cacheability, and we don't implement caching.
> +         */
> +        break;
> +    case 0xdc4: /* MPU_MAIR1 */
> +        if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
> +            goto bad_offset;
> +        }
> +        if (cpu->pmsav7_dregion) {
> +            /* Register is RES0 if no MPU regions are implemented */
> +            cpu->env.pmsav8.mair1 = value;
> +        }
> +        /* We don't need to do anything else because memory attributes
> +         * only affect cacheability, and we don't implement caching.
> +         */
> +        break;
>       case 0xf00: /* Software Triggered Interrupt Register */
>       {
>           int excnum = (value & 0x1ff) + NVIC_FIRST_IRQ;
> @@ -740,6 +845,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>           break;
>       }
>       default:
> +    bad_offset:
>           qemu_log_mask(LOG_GUEST_ERROR,
>                         "NVIC: Bad write offset 0x%x\n", offset);
>       }
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 41ae6ba..8b610de 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -228,17 +228,25 @@ static void arm_cpu_reset(CPUState *s)
>       env->vfp.xregs[ARM_VFP_FPEXC] = 0;
>   #endif
>   
> -    if (arm_feature(env, ARM_FEATURE_PMSA) &&
> -        arm_feature(env, ARM_FEATURE_V7)) {
> +    if (arm_feature(env, ARM_FEATURE_PMSA)) {
>           if (cpu->pmsav7_dregion > 0) {
> -            memset(env->pmsav7.drbar, 0,
> -                   sizeof(*env->pmsav7.drbar) * cpu->pmsav7_dregion);
> -            memset(env->pmsav7.drsr, 0,
> -                   sizeof(*env->pmsav7.drsr) * cpu->pmsav7_dregion);
> -            memset(env->pmsav7.dracr, 0,
> -                   sizeof(*env->pmsav7.dracr) * cpu->pmsav7_dregion);
> +            if (arm_feature(env, ARM_FEATURE_V8)) {
> +                memset(env->pmsav8.rbar, 0,
> +                       sizeof(*env->pmsav8.rbar) * cpu->pmsav7_dregion);
> +                memset(env->pmsav8.rlar, 0,
> +                       sizeof(*env->pmsav8.rlar) * cpu->pmsav7_dregion);
> +            } else if (arm_feature(env, ARM_FEATURE_V7)) {
> +                memset(env->pmsav7.drbar, 0,
> +                       sizeof(*env->pmsav7.drbar) * cpu->pmsav7_dregion);
> +                memset(env->pmsav7.drsr, 0,
> +                       sizeof(*env->pmsav7.drsr) * cpu->pmsav7_dregion);
> +                memset(env->pmsav7.dracr, 0,
> +                       sizeof(*env->pmsav7.dracr) * cpu->pmsav7_dregion);
> +            }
>           }
>           env->pmsav7.rnr = 0;
> +        env->pmsav8.mair0 = 0;
> +        env->pmsav8.mair1 = 0;
>       }
>   
>       set_flush_to_zero(1, &env->vfp.standard_fp_status);
> @@ -809,9 +817,15 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>           }
>   
>           if (nr) {
> -            env->pmsav7.drbar = g_new0(uint32_t, nr);
> -            env->pmsav7.drsr = g_new0(uint32_t, nr);
> -            env->pmsav7.dracr = g_new0(uint32_t, nr);
> +            if (arm_feature(env, ARM_FEATURE_V8)) {
> +                /* PMSAv8 */
> +                env->pmsav8.rbar = g_new0(uint32_t, nr);
> +                env->pmsav8.rlar = g_new0(uint32_t, nr);
> +            } else {
> +                env->pmsav7.drbar = g_new0(uint32_t, nr);
> +                env->pmsav7.drsr = g_new0(uint32_t, nr);
> +                env->pmsav7.dracr = g_new0(uint32_t, nr);
> +            }
>           }
>       }
>   
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 3193b00..05e2909 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -159,7 +159,8 @@ static bool pmsav7_needed(void *opaque)
>       CPUARMState *env = &cpu->env;
>   
>       return arm_feature(env, ARM_FEATURE_PMSA) &&
> -           arm_feature(env, ARM_FEATURE_V7);
> +           arm_feature(env, ARM_FEATURE_V7) &&
> +           !arm_feature(env, ARM_FEATURE_V8);
>   }
>   
>   static bool pmsav7_rgnr_vmstate_validate(void *opaque, int version_id)
> @@ -209,6 +210,31 @@ static const VMStateDescription vmstate_pmsav7_rnr = {
>       }
>   };
>   
> +static bool pmsav8_needed(void *opaque)
> +{
> +    ARMCPU *cpu = opaque;
> +    CPUARMState *env = &cpu->env;
> +
> +    return arm_feature(env, ARM_FEATURE_PMSA) &&
> +        arm_feature(env, ARM_FEATURE_V8);
> +}
> +
> +static const VMStateDescription vmstate_pmsav8 = {
> +    .name = "cpu/pmsav8",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pmsav8_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VARRAY_UINT32(env.pmsav8.rbar, ARMCPU, pmsav7_dregion, 0,
> +                              vmstate_info_uint32, uint32_t),
> +        VMSTATE_VARRAY_UINT32(env.pmsav8.rlar, ARMCPU, pmsav7_dregion, 0,
> +                              vmstate_info_uint32, uint32_t),
> +        VMSTATE_UINT32(env.pmsav8.mair0, ARMCPU),
> +        VMSTATE_UINT32(env.pmsav8.mair1, ARMCPU),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>   static int get_cpsr(QEMUFile *f, void *opaque, size_t size,
>                       VMStateField *field)
>   {
> 

maybe you plan to add migration between version 22 and 23 in a later 
patch, else

...
const VMStateDescription vmstate_arm_cpu = {
     ...
     .subsections = (const VMStateDescription*[]) {
         ...
         &vmstate_pmsav8,

do not forget this ^

Regards,

Phil.
