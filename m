Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp7284136lfc;
        Thu, 28 Nov 2019 00:47:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqyJSMjxW7IeQGrcJyz3YRAuXXucBCppZFl1dn1j0Ys56BigQC/lj2N3YW4GaPDyVJoXBkYi
X-Received: by 2002:a17:906:6b89:: with SMTP id l9mr12796352ejr.130.1574930828550;
        Thu, 28 Nov 2019 00:47:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574930828; cv=none;
        d=google.com; s=arc-20160816;
        b=FzdJmpLuDWtBoaJqCLXQcHL54YwVCBh/ie9whB2pJIzkggnS90tEy1u1OAei2IiPxq
         uLl+1kWYY0/FlwBx9IjigRyt3K8xpQTlUqMVfpAqv25P+klcPZnhvkHCOqFgAkVqSsYn
         MpOLdYj4FyO3wEhUeyRAv81ElnL+HYW3t1hE9M6aI1CQUjCc04i0nqDpZZbjmwQghma3
         wel2L/hHyPkpLelNx5MoSX6DqM8J+w9NdLQT/kyAoyTphHtBkG4OflOyiQLMysjCHhOV
         mqhY1UcPbMw5nC8GfpEBpc3aA+j2fncWMnf7Pd4d4F3kCH8Zo3HSlF1P1+8h7g2yMJa2
         06mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=0xG3ecRPgFaYzaucTgwZvwCvYzhmQxF3tc2tWhid1+4=;
        b=aD8eym6Ky65fee97a+QVfrg24RKCT+ncX6WZfHSEY1isyv5HAgBdYyveDK6CK2CybI
         K1jV9YKve2H2gqIUIJipvnL4G/CGjjrw/26bpllEOMo6TDgxMg96nRm1mdjIsE9ttW6o
         huyoyuJciC9GkAzAsLJ4x1dGlEmxkrtu6LLFcWfmPSAOPPnp889/XGdPRiWqp7prMEcw
         8BDr65LlcFURmsPDM7xTb5lqp/9wTke6niAd1ZGD/U7W77iGJqkse/vPQIrfu7Y2zgw+
         yEB/SGNxd1wQaKyxcQNTBdSqLqBtcBl8lAbnew0I+OvKKbAw1DJLPzxBhno0cc7x62M/
         6diQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rs25si11640322ejb.85.2019.11.28.00.47.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Nov 2019 00:47:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iaFS6-0004B6-I9
	for alex.bennee@linaro.org; Thu, 28 Nov 2019 03:47:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39542)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1iaFRe-000486-6p
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 03:46:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1iaFRc-0005R6-LL
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 03:46:37 -0500
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:33902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1iaFRc-0005JQ-DA
 for qemu-arm@nongnu.org; Thu, 28 Nov 2019 03:46:36 -0500
Received: from player734.ha.ovh.net (unknown [10.108.1.232])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 02C6973CC4
 for <qemu-arm@nongnu.org>; Thu, 28 Nov 2019 09:46:32 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player734.ha.ovh.net (Postfix) with ESMTPSA id 0E1E0C919A07;
 Thu, 28 Nov 2019 08:46:26 +0000 (UTC)
Subject: Re: [PATCH 2/4] target/arm: Abstract the generic timer frequency
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20191128054527.25450-1-andrew@aj.id.au>
 <20191128054527.25450-3-andrew@aj.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <cd0b8fe7-ce7a-1ba4-2c5c-1bec0a2d1a57@kaod.org>
Date: Thu, 28 Nov 2019 09:46:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191128054527.25450-3-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9901163780868115264
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeiiedguddviecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdeltddrjeeirdehtddrvddvfeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefgedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.251.80
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, joel@jms.id.au, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vuTq7snr1atN

On 28/11/2019 06:45, Andrew Jeffery wrote:
> Prepare for SoCs such as the ASPEED AST2600 whose firmware configures
> CNTFRQ to values significantly larger than the static 62.5MHz value
> currently derived from GTIMER_SCALE. As the OS potentially derives its
> timer periods from the CNTFRQ value the lack of support for running
> QEMUTimers at the appropriate rate leads to sticky behaviour in the
> guest.
> 
> Substitute the GTIMER_SCALE constant with use of a helper to derive the
> period from gt_cntfrq stored in struct ARMCPU. Initially set gt_cntfrq
> to the frequency associated with GTIMER_SCALE so current behaviour is
> maintained.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  target/arm/cpu.c    |  2 ++
>  target/arm/cpu.h    | 10 ++++++++++
>  target/arm/helper.c | 10 +++++++---
>  3 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7a4ac9339bf9..5698a74061bb 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -974,6 +974,8 @@ static void arm_cpu_initfn(Object *obj)
>      if (tcg_enabled()) {
>          cpu->psci_version = 2; /* TCG implements PSCI 0.2 */
>      }
> +
> +    cpu->gt_cntfrq = NANOSECONDS_PER_SECOND / GTIMER_SCALE;
>  }
>  
>  static Property arm_cpu_reset_cbar_property =
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 83a809d4bac4..666c03871fdf 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -932,8 +932,18 @@ struct ARMCPU {
>       */
>      DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ);
>      DECLARE_BITMAP(sve_vq_init, ARM_MAX_VQ);
> +
> +    /* Generic timer counter frequency, in Hz */
> +    uint64_t gt_cntfrq;
>  };
>  
> +static inline unsigned int gt_cntfrq_period_ns(ARMCPU *cpu)
> +{
> +    /* XXX: Could include qemu/timer.h to get NANOSECONDS_PER_SECOND? */
> +    const unsigned int ns_per_s = 1000 * 1000 * 1000;
> +    return ns_per_s > cpu->gt_cntfrq ? ns_per_s / cpu->gt_cntfrq : 1;
> +}

Are you inlining this helper for performance reasons ? 

C. 


>  void arm_cpu_post_init(Object *obj);
>  
>  uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz);
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 65c4441a3896..1cc0551081a0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2409,7 +2409,9 @@ static CPAccessResult gt_stimer_access(CPUARMState *env,
>  
>  static uint64_t gt_get_countervalue(CPUARMState *env)
>  {
> -    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / GTIMER_SCALE;
> +    ARMCPU *cpu = env_archcpu(env);
> +
> +    return qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) / gt_cntfrq_period_ns(cpu);
>  }
>  
>  static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
> @@ -2445,7 +2447,7 @@ static void gt_recalc_timer(ARMCPU *cpu, int timeridx)
>           * set the timer for as far in the future as possible. When the
>           * timer expires we will reset the timer for any remaining period.
>           */
> -        if (nexttick > INT64_MAX / GTIMER_SCALE) {
> +        if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
>              timer_mod_ns(cpu->gt_timer[timeridx], INT64_MAX);
>          } else {
>              timer_mod(cpu->gt_timer[timeridx], nexttick);
> @@ -2874,11 +2876,13 @@ static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
>  
>  static uint64_t gt_virt_cnt_read(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
> +    ARMCPU *cpu = env_archcpu(env);
> +
>      /* Currently we have no support for QEMUTimer in linux-user so we
>       * can't call gt_get_countervalue(env), instead we directly
>       * call the lower level functions.
>       */
> -    return cpu_get_clock() / GTIMER_SCALE;
> +    return cpu_get_clock() / gt_cntfrq_period(cpu);
>  }
>  
>  static const ARMCPRegInfo generic_timer_cp_reginfo[] = {
> 

