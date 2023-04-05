Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp621189ejb;
        Wed, 5 Apr 2023 13:07:54 -0700 (PDT)
X-Received: by 2002:a05:6870:9114:b0:17b:2054:38f0 with SMTP id o20-20020a056870911400b0017b205438f0mr4740855oae.25.1680725274272;
        Wed, 05 Apr 2023 13:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680725274; cv=none;
        d=google.com; s=arc-20160816;
        b=PsW55Z47FHMPvrn30nzA90Bi4y9MBMiTubw67glwbTOxi8PsVCkMBaVYj7JGkcThBK
         jz+yQGUSDz7NQPb/oKsJdBNVlE2jSuCz5Ez6ubJw/bjyFoBiEKGCXa+GGg7Np0SJMtQN
         HeqzZSdV5+vcYqK25vI7qwvJb2bX7IE7FCawVFSmYtRL1RArmoZQbRl8TXLIfd8nbt5Y
         AU5pqUaoX2XbqT+kRW/cmuubg0sPxMNRc3uhOwGccPEMSz8fA9MuPymc7iXCqnjwBf/q
         EelAaaznxGr1mbpy+DxbL9+f3rByu7t0QbRtgbYaLnTeyenjB8U0j/d8dl7ptN6AmMbw
         nuOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=RhuMLQBR3rCl5VaE4Hh/yoxhUD1OUMBEn6EcaPgazrI=;
        b=OYGWHmTu5wzemTAKj1Hj8j/TVJ8mR7WEuoFgLNzCwOyVJ4W1DlX/1J/BT5TbFJWJhO
         vWAdYBB7zF1IIgi146rbJ7fAGxL01sa9OkZS9PCCw+gBluV903wkSe+KyF+bYEKdfFsE
         FcQFCr3QL4yO4HKNe+PO5U+zDeMpWpguYC7qDN1VdldXGtlZaRIKrM5BP3LmibMTsmcr
         Yn8SgA3X2RrP/oxNv4QMj4s3rMUtSDh3F6U++dqaxnA32mDwRbcOXNMssKgrg0ufr5fC
         dJkI/vEm0JDef3hZ7NYo97FrIVxYNwHvxVNp57e9ovVGhfCYUXh4T7XcitM4E5/JLeow
         kL5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="kppZoR/1";
       spf=pass (google.com: domain of danielhb413@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=danielhb413@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <danielhb413@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g22-20020a9d6a16000000b006a141d1396fsor1886969otn.150.2023.04.05.13.07.54
        (Google Transport Security);
        Wed, 05 Apr 2023 13:07:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of danielhb413@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="kppZoR/1";
       spf=pass (google.com: domain of danielhb413@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=danielhb413@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680725273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RhuMLQBR3rCl5VaE4Hh/yoxhUD1OUMBEn6EcaPgazrI=;
        b=kppZoR/1zW6G4gbfVxrRR4+8q+hkzKbeskQd0eUY/mk5GSG1/5iCfKnThI8KkKkX7O
         ejsfgROLtdbTWv6JMTBunwyggZlFSRFGh0Z3DYTR66yzCD5kBBHxKY9po2D22t/0o4J3
         +91RKQYNS8ABFg4rtxkODTQFJDwX5fC14sD1zf9P/QTTL60ta+T4FF0yYe6N7DJpHktV
         wSwFGxP4CcwElfLyqw4NFVYGaeFIKJR6TwduC6NgBg74tLXpqZ0Vap4ivNToOJu/905+
         mxyQEA6S7G8kKnkatzOkjfI+cdUXsyPUn8YywCUlFhHPyzNyMvyHyiCHYoRXgSHl3olG
         yBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680725273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhuMLQBR3rCl5VaE4Hh/yoxhUD1OUMBEn6EcaPgazrI=;
        b=5I63Cz7aXZ6LwW6u5bzW2qd4EsZ0mLtAiVj7jPnOO2KUMrsLezXXg8jCIkhF9hDB52
         WK6JYG8+MCM1RkbJiSUoL+AWWGJGKGTDaBB204ZMnk5mTVxeqkyeP/puhdYaezggUMmi
         6AxygyXgYsYb+GSzKmUl8SDCcuLdsBkXLzBZwjEOE2/DvgZ3WGg4y34uc5CVSKM4hdpv
         qqRHAiZ+yVwdsmJ6jSJV/gbWxifzl4hr9ofj2NME61BLUBqYzv5AQkrvghwcs7rLPFJQ
         8d9bv4A90dZaNnnuC5xmclk5Hd50x55LMfc1690WXaEL25SMTzUM1qBQtVH0/ZVe5vJB
         hkzg==
X-Gm-Message-State: AAQBX9fxqDuuUF/PoDLGT7Omo7Ebu84aSGSXyEeixEP5LE/tPMbhzTmS
	VeOeRdlXB1GxmG9RGBihPvAGSkdRb28=
X-Google-Smtp-Source: AKy350YiSmUilKBLhtGMkDdEkcF20XopvLMbOWeSCDMkvT7LnCLKjzIhC+ILBPXNxeO6263OpKyUnQ==
X-Received: by 2002:a9d:76d5:0:b0:69f:a723:bd60 with SMTP id p21-20020a9d76d5000000b0069fa723bd60mr3301505otl.5.1680725273722;
        Wed, 05 Apr 2023 13:07:53 -0700 (PDT)
Return-Path: <danielhb413@gmail.com>
Received: from [192.168.68.107] ([191.255.108.232])
        by smtp.gmail.com with ESMTPSA id q16-20020a056830019000b0069fb87285fdsm7212817ota.59.2023.04.05.13.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 13:07:53 -0700 (PDT)
Message-ID: <330814bb-1568-9f64-b7ab-005776671ec5@gmail.com>
Date: Wed, 5 Apr 2023 17:07:49 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 08/10] target/ppc: Restrict KVM-specific field from
 ArchCPU
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>,
 Greg Kurz <groug@kaod.org>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-9-philmd@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230405160454.97436-9-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3KCFh/GtIkmw



On 4/5/23 13:04, Philippe Mathieu-Daudé wrote:
> The 'kvm_sw_tlb' field shouldn't be accessed when KVM is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>

>   target/ppc/cpu.h        | 2 ++
>   target/ppc/mmu_common.c | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
> index 557d736dab..0ec3957397 100644
> --- a/target/ppc/cpu.h
> +++ b/target/ppc/cpu.h
> @@ -1148,7 +1148,9 @@ struct CPUArchState {
>       int tlb_type;    /* Type of TLB we're dealing with */
>       ppc_tlb_t tlb;   /* TLB is optional. Allocate them only if needed */
>       bool tlb_dirty;  /* Set to non-zero when modifying TLB */
> +#ifdef CONFIG_KVM
>       bool kvm_sw_tlb; /* non-zero if KVM SW TLB API is active */
> +#endif /* CONFIG_KVM */
>       uint32_t tlb_need_flush; /* Delayed flush needed */
>   #define TLB_NEED_LOCAL_FLUSH   0x1
>   #define TLB_NEED_GLOBAL_FLUSH  0x2
> diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
> index 7235a4befe..21843c69f6 100644
> --- a/target/ppc/mmu_common.c
> +++ b/target/ppc/mmu_common.c
> @@ -917,10 +917,12 @@ static void mmubooke_dump_mmu(CPUPPCState *env)
>       ppcemb_tlb_t *entry;
>       int i;
>   
> +#ifdef CONFIG_KVM
>       if (kvm_enabled() && !env->kvm_sw_tlb) {
>           qemu_printf("Cannot access KVM TLB\n");
>           return;
>       }
> +#endif
>   
>       qemu_printf("\nTLB:\n");
>       qemu_printf("Effective          Physical           Size PID   Prot     "
> @@ -1008,10 +1010,12 @@ static void mmubooke206_dump_mmu(CPUPPCState *env)
>       int offset = 0;
>       int i;
>   
> +#ifdef CONFIG_KVM
>       if (kvm_enabled() && !env->kvm_sw_tlb) {
>           qemu_printf("Cannot access KVM TLB\n");
>           return;
>       }
> +#endif
>   
>       for (i = 0; i < BOOKE206_MAX_TLBN; i++) {
>           int size = booke206_tlb_size(env, i);
