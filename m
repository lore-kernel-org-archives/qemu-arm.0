Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3213997njd;
        Tue, 1 Apr 2025 21:08:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW553IbkP0mDo1gCWOcB0Hv9QQUHTspGT1+6Vtrd03MTdpK4o8ecoRaMj5mrT/7rksN5k5oQBYIrmtiJg==@linaro.org
X-Received: by 2002:a05:600c:b9b:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-43db62bdfecmr130519595e9.25.1743566939369;
        Tue, 01 Apr 2025 21:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743566939; cv=none;
        d=google.com; s=arc-20240605;
        b=GhUsF8WRBO7A25Bjz0v/S0yxwlda8rIOtcLewxFtYjVyZU+tDPSg7asV7n/m8zmhgT
         z6TeAKETC0faLqORreFO3m6y9SmJzhcfEKxpYC3uzN+F7cqkBvS3vg22jg3aLFTt20tG
         0t+yHAAempwXaGyFZCP3G+qR43vbEenYbA/+X913+dkTFcpYkTlSq+mTYsctaDS5+1eF
         8RZkomyG0yKlJuoqkTFBzAfo4vZG4XQDI+wTY9x21ZYGlNF+ZSWvmEAFCp6vLqB5BbZ9
         TBclYv6WMQwAXFYb12KIP6u2el03Q/54agpwaOxC6LTJfl6CK5P1OsIPH3uN7N7Fdi7E
         9LYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=i7ob2Qv6SJizBJ26WLxI/2hPmEjkY2C/7n20ks9PPdU=;
        fh=hNFzFuQLpTuzag/wmIUxBECJiUHe/kd/j9u6CjmPo+Y=;
        b=Df/doxTsbRPvu11PM6VJIOmuvwQl7EFOklG1qElxFd9+xLsKLNiqvTtXI+mPRgxNcb
         Y5CqZP3XfDkc1/AKZF2P//niO+Cn4LYv7QeR30fFzATziOFuUhOLUqdetESFL/qTRAZz
         hjTm0D0D8f/rjtXM9oHIte2xuiiBGUhu9kvjkMwS4CTW3VPWvcbCwoT14AcQJPvg/RU7
         FlrnH0ehSulFvXtx4FCIhbuQOO5Pic+j4jN+5O4BExXtFNl8PB/NtJlTj0qiMNDjhEcm
         5DAfen8m0FMDFIikr2OSBMTV7/9ztaLR4sBdIM18Vv9MAipS4+Wxs+MhZ4l26CbJau3h
         4+LA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ia5klaPE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d90f899bfsor40766995e9.2.2025.04.01.21.08.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Apr 2025 21:08:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ia5klaPE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743566939; x=1744171739; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i7ob2Qv6SJizBJ26WLxI/2hPmEjkY2C/7n20ks9PPdU=;
        b=Ia5klaPELOI7oNPww+tUt+UH01Lod/If6+JFpmwq8pIqpsDbwM0VXt978GJAIue+3O
         VbwKMpG1nPb5GpPz6otCmYyOWd4uovL5y1P5UHkv4w/isLBpkjqazNlt2ZStH51MYZP1
         ZVraWir7PeSjSLQQtQkiJb47Eh4XBl29kkBSLvIKAJHGyWcU+kbyiCZlP8S36i5SdiCe
         FMf74RjQT6odbv4txYY/OTtgnfp1Aj7X44+YiG+dDtrN/DOSXWAFCJSoProanmxDua5I
         bbW/Z9M5hKNFEq7z7bXh/8b6L3NKfBaJk1Qrj9It9bmaekiJ3+bBou2IUq9/vOafjKF4
         q1ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743566939; x=1744171739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7ob2Qv6SJizBJ26WLxI/2hPmEjkY2C/7n20ks9PPdU=;
        b=c7FzJROHR3Wx7nLV3/fB9qck2IHUTmPbomyCdqEnrmBOIpi5uaKshKFEgPdPjtgHfx
         aafhJtmHLCXJ0s5zHkyB6GBkzkfvoNdBatrfg0NTeElWw6ps73BuTIpRqWcYdHqSiPBd
         VFfD1Bc7IoNR7UoUCyh2msqC1c/9fnt1U91FJyuCFb/ho6fdfIE5JZA8ssPxk7gcd9X3
         VemsL7zYpy/l7sFeAA2J87CrBxoytDxbknZWaTUmJCAxzAyrc2RLE7C5BIB1rpStmQpp
         YXw09mDtcOQ7OLZUH+HUTfw5RLE9Yd4konoCi1ZyngP+O4Fk/+e3qj8A9OhXYPlYO0Wb
         urKg==
X-Forwarded-Encrypted: i=1; AJvYcCUI9Py50BRygds0H2B1ATv4r2ysk9VCY+pkyNfbM9ZhjC0HNCDZXxeqd0vdhK8aCow9dn0CR3Wds1CpZg==@linaro.org
X-Gm-Message-State: AOJu0Ywboqg6tE0wRqXoNh9uPXXX6WQKh0+GINUVaNfmDTi1zwQzRJjC
	9iNfw5ZBcH5KmDF6dlzTuSRzRQEtTqlJ2nDkpcGnwUrP7kOqsRV8Q8n8JrFWKES3PA==
X-Gm-Gg: ASbGncv8czrG0hcBFR3i2VCYums1nP+LjHtEJhxOp/O8mlFWeGVDfzyKuWO5lAu6EQ3
	/8DgkVEmnGiGhsJL2nBngjdl/s9RozDc2QpJ/fsgaMeuPExzJJ7RUXiZkQic95iRhEKNWC216hS
	J+rnivNprHs7U427mKVPmTRByPDnD2OZVDPtkw5FkW7ZXdJSX9Vxk1F6ziES9f9uu5YdadMf/Bt
	GEYqjQ/cBgJWN1e+SswZYnkiLRQrQNhnLJwqzxBNsfwRNB9/lYQi5ZTzn8EGCY8/iqEqrB3EXb+
	5KVeI62IAZWAA5Dd6prxAvSjtqFUjuLk+WjrxO3JO4R5dSuUrWpBdBhV1d05hVj8sPA02mTG4Hg
	SwkyNfDMtiXNO
X-Google-Smtp-Source: AGHT+IH1+Cc/Zo1DWo48nPIMtxYpkkmAcYv2KlTn+be2Su73XHhfhv7BiGLY3l4FVAuA7CMRdhxRrw==
X-Received: by 2002:a05:600c:1ca9:b0:43c:fe5e:f03b with SMTP id 5b1f17b1804b1-43db62bf723mr165889975e9.30.1743566938862;
        Tue, 01 Apr 2025 21:08:58 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb60d3627sm8001405e9.24.2025.04.01.21.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 21:08:58 -0700 (PDT)
Message-ID: <ddc338b7-4a7e-4353-bc19-1d98c48dcb21@linaro.org>
Date: Wed, 2 Apr 2025 06:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/18] target/arm: Move CPU definitions consumed by HW
 model to "hw/arm/cpu.h"
To: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: ale@rev.ng, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 Rob Herring <robh@kernel.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>, Beniamino Galvani <b.galvani@gmail.com>
References: <20230110164406.94366-1-philmd@linaro.org>
 <20230110164406.94366-7-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20230110164406.94366-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kgPQ3XC/7Fz/

Cc'ing Pierrick

On 10/1/23 17:43, Philippe Mathieu-Daudé wrote:
> Units including "target/arm/cpu.h" can't be built once via meson's
> softmmu_ss[] source set. Since this header depends on specific
> definitions such the word size (32 or 64-bit), for ARM such units
> must go to the per-target arm_ss[].
> 
> We want to expose few architectural definitions to hardware models.
> 
> Expose the ARM architectural definitions used by hardware models,
> in order to reduce the inclusion of "target/arm/cpu.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/cpu.h | 49 ++++++++++++++++++++++++++++++++++++++++++++

Richard, WRT your comment in previous patch (target/ shouldn't access
hw/), WDYT of "target/arm/hw-defs.h" for this header?

>   target/arm/cpu-qom.h | 15 --------------
>   target/arm/cpu.h     | 34 ------------------------------
>   3 files changed, 49 insertions(+), 49 deletions(-)
> 
> diff --git a/include/hw/arm/cpu.h b/include/hw/arm/cpu.h
> index 0c5d6ca2a8..6758bffe34 100644
> --- a/include/hw/arm/cpu.h
> +++ b/include/hw/arm/cpu.h
> @@ -25,4 +25,53 @@ DECLARE_CLASS_CHECKERS(AArch64CPUClass, AARCH64_CPU, TYPE_AARCH64_CPU)
>   #define ARM_CPU_TYPE_SUFFIX "-" TYPE_ARM_CPU
>   #define ARM_CPU_TYPE_NAME(name) (name ARM_CPU_TYPE_SUFFIX)
>   
> +enum QemuPsciConduit {
> +    QEMU_PSCI_CONDUIT_DISABLED = 0,
> +    QEMU_PSCI_CONDUIT_SMC = 1,
> +    QEMU_PSCI_CONDUIT_HVC = 2,
> +};
> +
> +/* Meanings of the ARMCPU object's four inbound GPIO lines */
> +#define ARM_CPU_IRQ 0
> +#define ARM_CPU_FIQ 1
> +#define ARM_CPU_VIRQ 2
> +#define ARM_CPU_VFIQ 3
> +
> +#define GTIMER_PHYS     0
> +#define GTIMER_VIRT     1
> +#define GTIMER_HYP      2
> +#define GTIMER_SEC      3
> +#define GTIMER_HYPVIRT  4
> +#define NUM_GTIMERS     5
> +
> +/* For M profile, some registers are banked secure vs non-secure;
> + * these are represented as a 2-element array where the first element
> + * is the non-secure copy and the second is the secure copy.
> + * When the CPU does not have implement the security extension then
> + * only the first element is used.
> + * This means that the copy for the current security state can be
> + * accessed via env->registerfield[env->v7m.secure] (whether the security
> + * extension is implemented or not).
> + */
> +enum {
> +    M_REG_NS = 0,
> +    M_REG_S = 1,
> +    M_REG_NUM_BANKS = 2,
> +};
> +
> +#define ARM_AFF0_SHIFT 0
> +#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
> +#define ARM_AFF1_SHIFT 8
> +#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
> +#define ARM_AFF2_SHIFT 16
> +#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
> +#define ARM_AFF3_SHIFT 32
> +#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
> +#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
> +
> +#define ARM32_AFFINITY_MASK (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
> +#define ARM64_AFFINITY_MASK \
> +    (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
> +#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
> +
>   #endif
> diff --git a/target/arm/cpu-qom.h b/target/arm/cpu-qom.h
> index b98904b6bc..d37037e214 100644
> --- a/target/arm/cpu-qom.h
> +++ b/target/arm/cpu-qom.h
> @@ -68,19 +68,4 @@ void arm_gt_htimer_cb(void *opaque);
>   void arm_gt_stimer_cb(void *opaque);
>   void arm_gt_hvtimer_cb(void *opaque);
>   
> -#define ARM_AFF0_SHIFT 0
> -#define ARM_AFF0_MASK  (0xFFULL << ARM_AFF0_SHIFT)
> -#define ARM_AFF1_SHIFT 8
> -#define ARM_AFF1_MASK  (0xFFULL << ARM_AFF1_SHIFT)
> -#define ARM_AFF2_SHIFT 16
> -#define ARM_AFF2_MASK  (0xFFULL << ARM_AFF2_SHIFT)
> -#define ARM_AFF3_SHIFT 32
> -#define ARM_AFF3_MASK  (0xFFULL << ARM_AFF3_SHIFT)
> -#define ARM_DEFAULT_CPUS_PER_CLUSTER 8
> -
> -#define ARM32_AFFINITY_MASK (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK)
> -#define ARM64_AFFINITY_MASK \
> -    (ARM_AFF0_MASK|ARM_AFF1_MASK|ARM_AFF2_MASK|ARM_AFF3_MASK)
> -#define ARM64_AFFINITY_INVALID (~ARM64_AFFINITY_MASK)
> -
>   #endif
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 52ac99cad3..ab6fdecf48 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -72,21 +72,6 @@
>   #define ARMV7M_EXCP_PENDSV  14
>   #define ARMV7M_EXCP_SYSTICK 15
>   
> -/* For M profile, some registers are banked secure vs non-secure;
> - * these are represented as a 2-element array where the first element
> - * is the non-secure copy and the second is the secure copy.
> - * When the CPU does not have implement the security extension then
> - * only the first element is used.
> - * This means that the copy for the current security state can be
> - * accessed via env->registerfield[env->v7m.secure] (whether the security
> - * extension is implemented or not).
> - */
> -enum {
> -    M_REG_NS = 0,
> -    M_REG_S = 1,
> -    M_REG_NUM_BANKS = 2,
> -};
> -
>   /* ARM-specific interrupt pending bits.  */
>   #define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
>   #define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
> @@ -107,12 +92,6 @@ enum {
>   #define offsetofhigh32(S, M) (offsetof(S, M) + sizeof(uint32_t))
>   #endif
>   
> -/* Meanings of the ARMCPU object's four inbound GPIO lines */
> -#define ARM_CPU_IRQ 0
> -#define ARM_CPU_FIQ 1
> -#define ARM_CPU_VIRQ 2
> -#define ARM_CPU_VFIQ 3
> -
>   /* ARM-specific extra insn start words:
>    * 1: Conditional execution bits
>    * 2: Partial exception syndrome for data aborts
> @@ -160,13 +139,6 @@ typedef struct ARMGenericTimer {
>       uint64_t ctl; /* Timer Control register */
>   } ARMGenericTimer;
>   
> -#define GTIMER_PHYS     0
> -#define GTIMER_VIRT     1
> -#define GTIMER_HYP      2
> -#define GTIMER_SEC      3
> -#define GTIMER_HYPVIRT  4
> -#define NUM_GTIMERS     5
> -
>   #define VTCR_NSW (1u << 29)
>   #define VTCR_NSA (1u << 30)
>   #define VSTCR_SW VTCR_NSW
> @@ -3323,12 +3295,6 @@ static inline bool arm_cpu_bswap_data(CPUARMState *env)
>   void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
>                             target_ulong *cs_base, uint32_t *flags);
>   
> -enum {
> -    QEMU_PSCI_CONDUIT_DISABLED = 0,
> -    QEMU_PSCI_CONDUIT_SMC = 1,
> -    QEMU_PSCI_CONDUIT_HVC = 2,
> -};
> -
>   #ifndef CONFIG_USER_ONLY
>   /* Return the address space index to use for a memory access */
>   static inline int arm_asidx_from_attrs(CPUState *cs, MemTxAttrs attrs)
