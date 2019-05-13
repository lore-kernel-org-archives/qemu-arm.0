Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2681673wrg;
        Mon, 13 May 2019 04:26:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzoN/GgxtoAwnxu9e6HwjUSZ2npdbKp7x6WOKMTurOjyWMy32HykYtmkdm+VULI5i31YHy3
X-Received: by 2002:a50:94a1:: with SMTP id s30mr29060097eda.4.1557746801645;
        Mon, 13 May 2019 04:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557746801; cv=none;
        d=google.com; s=arc-20160816;
        b=VWgmaVz/6LO4hbVMCUrwg8sVlejTKkzyfdhSic/vqiK3gzNICaykIIRztkqYHeI4nJ
         GbN6pk0MuZQ9vFmKsIDztEcgpBVTodTpCyqcoUypp2glcJ0N54/fvWc6H32pte5uovl6
         IKCAD+HgoOt77ffPSJJcMjYL7reDrhf4fP+OGMp9naJSMcL73VVOgcAX7NCTNfJ0MbvL
         sR0+nBcbiU8FZDAY1Rht9PN8Abaj7FQZmtVcHf3EvANwWcsLxrCrznqWVmR4KKL6vQVu
         DoNzJtXAOBgXaL+MGjg3YRVt0moI9tnuIgToOo1ZADkd+RntywfJkVCzWOg9oaGGqgOf
         G2cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=fSeF2SUBNKUB78OzXR3z6aJMCcCqbyb9eRsdop4bGGM=;
        b=xCLozJK41ikwjGe17ZgPJqrtUahviVFKoz8F1i/wqfI5I04QO/UY3+6SU0UTBlXoij
         mS3uKI4p0z7O9lrOhAS7LZnMPj6TfclpYpy8zsdd/AdpM17f48IiT2piNu6NFoUNinFv
         LYVO0wWVz9Y6cgNIhKLdOj8HCGcfhFY0hH7l9qTLXA6cdVvQse5M2KqtO08K60p74mS1
         XJ41TS064VAq52V7UCZEYj8jmiMYO+3BGB7EgZryAY71i744S+UE0Zn0hvN303NLWEsb
         IO/DkN+ufPJC7WnCNq+DmIgE46elOfWyOjLkcNw4cWFbN7st+0xN3Y6WsrcZFVSXpnOA
         O2vg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id z36si2371885edb.45.2019.05.13.04.26.41;
        Mon, 13 May 2019 04:26:41 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57CCF374;
	Mon, 13 May 2019 04:26:40 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD5993F703;
	Mon, 13 May 2019 04:26:38 -0700 (PDT)
Date: Mon, 13 May 2019 12:26:36 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"abologna@redhat.com" <abologna@redhat.com>
Subject: Re: [PATCH 11/13] target/arm/cpu64: max cpu: Introduce sve-vls-map
Message-ID: <20190513112635.GD28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-12-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190512083624.8916-12-drjones@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: /pOlO0FuyVwn

On Sun, May 12, 2019 at 09:36:22AM +0100, Andrew Jones wrote:
> Introduce another cpu property to control SVE vector lengths,
> sve-vls-map, which allows the user to explicitly select the
> set of vector lengths the guest can use. The map must conform
> to QEMU's limits and architectural constraints, checked when
> the property is set. Inconsistencies with sve-max-vq are also
> checked. The bit number of a set bit in the map represents the
> allowed vector length in number of quadwords.
> 
> Note, as the map is implemented with a single 64-bit word we
> currently only support up to 8192-bit vectors. As QEMU and
> KVM only support up to 2048-bit vectors then this sufficient
> now, and probably for some time. Extending the bitmap beyond
> a single word will likely require changing the property to
> a string and adding yet another parser to QEMU.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  target/arm/cpu.c     |  4 +++
>  target/arm/cpu.h     |  3 ++
>  target/arm/cpu64.c   | 70 +++++++++++++++++++++++++++++++++++++++++---
>  target/arm/helper.c  | 10 ++++++-
>  target/arm/monitor.c |  9 ++++--
>  5 files changed, 88 insertions(+), 8 deletions(-)
> 

[...]

> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8292d547e8f9..f0d0ce759ba8 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -920,6 +920,9 @@ struct ARMCPU {
>  
>      /* Used to set the maximum vector length the cpu will support.  */
>      uint32_t sve_max_vq;
> +
> +    /* Each bit represents a supported vector length of (bitnum * 16) bytes */
> +    uint64_t sve_vls_map;

Just to be clear, the representation here is different from the
representation in KVM_REG_ARM64_SVE_VLS?

In the latter, bit n represents vector length ((n + 1) * 16) bytes.

(QEMU is free to choose its own internal representation, naturally.)

[...]

> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c

[...]

> +static void cpu_set_sve_vls_map(Object *obj, Visitor *v, const char *name,
> +                                void *opaque, Error **errp)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +    Error *err = NULL;
> +    uint64_t mask = ~(BIT_MASK(ARM_MAX_VQ - 1) - 1);
> +    int i;
> +
> +    visit_type_uint64(v, name, &cpu->sve_vls_map, errp);
> +
> +    if (!err) {
> +        if (cpu->sve_vls_map == 0) {
> +            error_setg(&err, "SVE vector length map cannot be zero");

Maybe say "empty" here, since the map represents a set?

(But it this is just for debug rather than reporting errors to the user,
it probably doesn't matter much.)

[...]

> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 1e6eb0d0f360..bedec1ea0b27 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -5254,12 +5254,20 @@ uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
>  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                        uint64_t value)
>  {
> +    ARMCPU *cpu = arm_env_get_cpu(env);
>      int cur_el = arm_current_el(env);
>      int old_len = sve_zcr_len_for_el(env, cur_el);
>      int new_len;
>  
>      /* Bits other than [3:0] are RAZ/WI.  */
> -    raw_write(env, ri, value & 0xf);
> +    value &= 0xf;

You might want to sanity-check that the max vq you configured for the
vcpu is <= 16 here.

> +
> +    if (value && !(BIT_MASK(value) & cpu->sve_vls_map)) {
> +        uint64_t map = cpu->sve_vls_map & (BIT_MASK(value) - 1);
> +        value = arm_cpu_fls64(map) - 1;
> +    }
> +
> +    raw_write(env, ri, value);

[...]

Cheers
---Dave
