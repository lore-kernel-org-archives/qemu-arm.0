Received: by 10.223.172.38 with SMTP id v35csp1971609wrc;
        Tue, 5 Sep 2017 16:00:19 -0700 (PDT)
X-Received: by 10.55.23.86 with SMTP id i83mr902310qkh.332.1504652418915;
        Tue, 05 Sep 2017 16:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504652418; cv=none;
        d=google.com; s=arc-20160816;
        b=Hwyk5mRW39aeeuX8w1gtOdAQyctHuoMwr4LvlcVZD1jYG/iqhClL6T7nAbq3DfZ1uf
         xdC/fMHD7EzqqCutztZsd2+Y9ECS/EKLBIUCl+yT5nEM8hXKWFHO7YFoVVsWdLE2WGoe
         lZIeCyUZ84h48zR4JPIo2PfKkJDMDwq9Yizqnp2UANYOEFanDmqKj8GN29su0OYREHf+
         B7i0VdGkUXPySXzbjGFc7NlCHmB2wQ7VZq5nLv1/fk61QoqD+a9KsCn7jPJ4MhopVlea
         sIMMuk+z0208qs5+MM6CFNy3TNxobkQzYzRPftLIPsMRAE01+EqlGTL92kjJng63dh2W
         mfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=mgsOqm9XEZ/1kIQPa2Kyo3wXfI0tRWnVD6dfDs87G60=;
        b=phTR2R7XH93ISuG6o7Tw9hMzHb5x+fJIdI8wGGCizbXdokYBpVcaPST5koq9C6gQPs
         Yu0s4AKMylFwLad3L+GPSjymNGhZckr1KrKMSlVdojvAGUJqdDffXYdwWSlgn6cXPp8j
         CPBfjEqfdqeqCkUv6ppNU7snGby5q6F+DeYktpEtx6nUHlq2YmCQhTMZMoTHq1LHRPiu
         MbuWiASXZ0mNduqJ73lZgGT7B/sc1iktaz6HIGiqIR5CxQNjgS7d66G7WS3Bh8jd2H1Y
         2tfzTujCsTCI37z5repxkTkRwvdqMixlRN0CCUeFetiTAQgZkYmg4l05ijzQn35DFAEj
         Sxcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BiQ9Cc3T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g199si1682176qke.58.2017.09.05.16.00.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 16:00:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=BiQ9Cc3T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33483 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpMpM-0005AK-NF
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 19:00:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMp7-00053X-PU
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 19:00:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMp2-0002Kl-W2
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 19:00:01 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38510)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpMos-0002Ct-HH; Tue, 05 Sep 2017 18:59:46 -0400
Received: by mail-qt0-x242.google.com with SMTP id k2so314858qte.5;
	Tue, 05 Sep 2017 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mgsOqm9XEZ/1kIQPa2Kyo3wXfI0tRWnVD6dfDs87G60=;
	b=BiQ9Cc3T873p2D5r8SezeKxaNBy/KH5lnO7E4JNU//kgBs51uHIbyaKbW3IIsmD33J
	2SAiJcByZk1bG02dclNqBUrq6vWk0Z8y2OvNEe1agyLpBlsQ53lWLdHWjSfp/b5evMSw
	K2VDi3lY18ariKxRTCRPpfM2f2AhsCXZCpdm6BVV8EnlJonvOqreMqomsIwEv0ED4Hdv
	anXpS8xqiupIXvGsXF6C22TmPSVbOKHkix69vgRwKuDJiLTcJxqBll1Pg4ksictUmuHZ
	4ULSW+IZJ11vVilz04n8tIaaAXRsFs5DsVALPhQSjK6RPdI4aOqar5YR7xVSQExLal9w
	m+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mgsOqm9XEZ/1kIQPa2Kyo3wXfI0tRWnVD6dfDs87G60=;
	b=AF0HQkY75ORgOgXmVgVW1jxieNuWfVZVnDG3rkG77723incVWWxNvSDDX0YUp39HSa
	NSrOV5CZzSWLbiXAoWvlDG9zZk1VIYBCrnbVXavbJ6thmtuD6etiVjBny6mvPNk5pVbL
	A2xifaJvgVY2YxyugxkZfLPYYl5Uom2vEZP512ZGoUFq0jP/KnN8Bbqo1BO4ditzh+hY
	AFRf3a3Nhky5uWYCh7GEbNXFn/3mxBliwTRR+XVSPiW0Jrv/8otCVIYjiFcdwn71xzWb
	Zju+zo7od/KLjcdlI1G8ldx7PfKqyBbD45ehX/0UY2cZeRWd/GLddoku1x5pR4WIXqUB
	l8lg==
X-Gm-Message-State: AHPjjUhADP+Ui/owbIo621gW8rf6xYba9Yfpb+qWSUpfiqV+n50ZcO4K
	qygaLug6X4BPdL75QOg=
X-Google-Smtp-Source: ADKCNb6/5WSq1BEmOO6y6RfwUAOrrXN3l6tWbenBPPoGAQZ3rmZ1ACUxPmkl9lvW9n7oYl6AZ5wy1Q==
X-Received: by 10.237.53.175 with SMTP id c44mr888479qte.209.1504652385611;
	Tue, 05 Sep 2017 15:59:45 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	f48sm1248039qtc.49.2017.09.05.15.59.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 15:59:44 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1503414539-28762-1-git-send-email-peter.maydell@linaro.org>
	<1503414539-28762-13-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <083e75ee-a047-d3e2-4c00-356c4f24895f@amsat.org>
Date: Tue, 5 Sep 2017 19:59:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503414539-28762-13-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 12/20] target/arm: Make
 MPU_MAIR0, MPU_MAIR1 registers banked for v8M
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
X-TUID: Z5i9LKBAHO+N

On 08/22/2017 12:08 PM, Peter Maydell wrote:
> Make the MPU registers MPU_MAIR0 and MPU_MAIR1 banked if v8M security
> extensions are enabled.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h      | 4 ++--
>   hw/intc/armv7m_nvic.c | 8 ++++----
>   target/arm/cpu.c      | 4 ++--
>   target/arm/machine.c  | 6 ++++--
>   4 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index d0b0936..2f59828 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -545,8 +545,8 @@ typedef struct CPUARMState {
>            */
>           uint32_t *rbar;
>           uint32_t *rlar;
> -        uint32_t mair0;
> -        uint32_t mair1;
> +        uint32_t mair0[2];
> +        uint32_t mair1[2];

I'm tempted to ask:

             uint32_t mair[2][2];

>       } pmsav8;
>   
>       void *nvic;
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 3a1f02d..e98eb95 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -604,12 +604,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
>           if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
>               goto bad_offset;
>           }
> -        return cpu->env.pmsav8.mair0;
> +        return cpu->env.pmsav8.mair0[attrs.secure];

            return cpu->env.pmsav8.mair[0][attrs.secure];

>       case 0xdc4: /* MPU_MAIR1 */
>           if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
>               goto bad_offset;
>           }
> -        return cpu->env.pmsav8.mair1;
> +        return cpu->env.pmsav8.mair1[attrs.secure];

            return cpu->env.pmsav8.mair[1][attrs.secure];

>       default:
>       bad_offset:
>           qemu_log_mask(LOG_GUEST_ERROR, "NVIC: Bad read offset 0x%x\n", offset);
> @@ -826,7 +826,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
>           }
>           if (cpu->pmsav7_dregion) {
>               /* Register is RES0 if no MPU regions are implemented */
> -            cpu->env.pmsav8.mair0 = value;
> +            cpu->env.pmsav8.mair0[attrs.secure] = value;

                cpu->env.pmsav8.mair[0][attrs.secure] = value;

>           }
>           /* We don't need to do anything else because memory attributes
>            * only affect cacheability, and we don't implement caching.
> @@ -838,7 +838,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
>           }
>           if (cpu->pmsav7_dregion) {
>               /* Register is RES0 if no MPU regions are implemented */
> -            cpu->env.pmsav8.mair1 = value;
> +            cpu->env.pmsav8.mair1[attrs.secure] = value;

                cpu->env.pmsav8.mair[1][attrs.secure] = value;

>           }
>           /* We don't need to do anything else because memory attributes
>            * only affect cacheability, and we don't implement caching.
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ae866be..ae8af19 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -249,8 +249,8 @@ static void arm_cpu_reset(CPUState *s)
>               }
>           }
>           env->pmsav7.rnr = 0;
> -        env->pmsav8.mair0 = 0;
> -        env->pmsav8.mair1 = 0;
> +        memset(env->pmsav8.mair0, 0, sizeof(env->pmsav8.mair0));
> +        memset(env->pmsav8.mair1, 0, sizeof(env->pmsav8.mair1));
            memset(env->pmsav8.mair, 0, sizeof(env->pmsav8.mair));

>       }
>   
>       set_flush_to_zero(1, &env->vfp.standard_fp_status);
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index cd6b6af..414a879 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -229,8 +229,8 @@ static const VMStateDescription vmstate_pmsav8 = {
>                                 vmstate_info_uint32, uint32_t),
>           VMSTATE_VARRAY_UINT32(env.pmsav8.rlar, ARMCPU, pmsav7_dregion, 0,
>                                 vmstate_info_uint32, uint32_t),
> -        VMSTATE_UINT32(env.pmsav8.mair0, ARMCPU),
> -        VMSTATE_UINT32(env.pmsav8.mair1, ARMCPU),
> +        VMSTATE_UINT32(env.pmsav8.mair0[M_REG_NS], ARMCPU),
> +        VMSTATE_UINT32(env.pmsav8.mair1[M_REG_NS], ARMCPU),

etc...

matter of taste, so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>           VMSTATE_END_OF_LIST()
>       }
>   };
> @@ -255,6 +255,8 @@ static const VMStateDescription vmstate_m_security = {
>           VMSTATE_UINT32(env.v7m.faultmask[M_REG_S], ARMCPU),
>           VMSTATE_UINT32(env.v7m.control[M_REG_S], ARMCPU),
>           VMSTATE_UINT32(env.v7m.vecbase[M_REG_S], ARMCPU),
> +        VMSTATE_UINT32(env.pmsav8.mair0[M_REG_S], ARMCPU),
> +        VMSTATE_UINT32(env.pmsav8.mair1[M_REG_S], ARMCPU),
>           VMSTATE_END_OF_LIST()
>       }
>   };
> 
