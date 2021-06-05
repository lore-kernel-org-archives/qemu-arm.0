Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2226902lfa;
        Sat, 5 Jun 2021 12:31:35 -0700 (PDT)
X-Received: by 2002:a17:902:8484:b029:101:7016:fb7b with SMTP id c4-20020a1709028484b02901017016fb7bmr10091939plo.23.1622921495776;
        Sat, 05 Jun 2021 12:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622921495; cv=none;
        d=google.com; s=arc-20160816;
        b=IrR9VM98dzIUzvvG1kpP5TMn5khS5UwFRI2FuQr9WpJ+AGYaQFdEuKOheBcSAHPRZ7
         LBSy3FK/ToiIn6OAJvyNWXLOKxHWOwBQktS/i6+P3cD9smIV654QARTXgpzD/324zBug
         RtRjMvYdEPJuERvMGzQW7ywuhkJ/VP2P4rL82iGyVqvjM1w9poRBjcARLVLQCnCk9DQm
         T5jk1wXrHJtt8Hi5qso10h9uwmmMy6lPNKHMmtamOhFgsqon5XF2azyYp42IHOOn86zV
         QES9rNM+wwSwnDXo3QJKaqRN/COeXzN8x3lTJ1vA1l3LGrTl5L4rlSu7I7Ws5ML0/PQC
         0uJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=9F2m1DhrSUSIYTdnZmgqh1HCfDmWW6hYno5vOwJhfIA=;
        b=GVVMN1MCvwMbmevIbgy4ivroORNDcGi8lMY9vm5GXLvdnupEKSyHY1xOi2/c+VjudG
         R2H9r3O8tPkVERzRbFCNkfDNjR9dRveKI2FqISkB+wpbl5OO1RZkn1W43EBTpT8QGoPY
         0UZA1JsU5lDZ3ThFpAIk5rv1VOQ6i6FzNwKfWRQ5R5hi2gOd7tHC3c4JoLwbqzXKfQR+
         wKpkG5ZyhP+zR2tJig4hLDNncE6tbiVGU1KRULCfmDkpDwUA+OnsG7FzTwbPP1g9ItIS
         uKSjdckKlWeOmG5yr3qIOxzBFGylOlWtRDBy5y/wfRfuGthyDu79SAIDxgmMrJGNCXmG
         NnRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CxdHNK8t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id pc11sor5444202pjb.10.2021.06.05.12.31.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 12:31:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CxdHNK8t;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9F2m1DhrSUSIYTdnZmgqh1HCfDmWW6hYno5vOwJhfIA=;
        b=CxdHNK8tOIPMSfMSrpNC999t9tUFpjSlswwsYleBvktU/sokPEx6vtuuBFD2llG2IM
         eZuAeM8oyQlVAPTpKh9+Qi+3UsXutpDLMJGXPsHl5SOtuSrpeyF9igDRCO7dW5zkg0Qm
         bGAQAbQHS7uXS/QseU2HyjDNF3iPoMkKtCbCfGZLDLQZiLqiXsyKvfRMUfEtAYpkwfsT
         iq1eiejCpwSNnjgrgw74PCTwp7SMDL+dp0/ptFOo1fn4EDiubMEv82BPOYtGZjrdwbKd
         Aq0egEVip4Puv+0URBgn12wErxCITPWVBDEmdWhFmSfeng/sqvItTFNnRBWIdwszxGpK
         RI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9F2m1DhrSUSIYTdnZmgqh1HCfDmWW6hYno5vOwJhfIA=;
        b=jdGhpB62nmAPOzfqo7b/+8DgQc+5/LAbtvpPm+FcNGbwT8TgPPmjDMPaHfhzNqhf2K
         agyW5qG2IshMT9P+mYLzGG/0apvcvpULo+Jnyd7St7Al/dEQetDkIyoYIi31AsR1hQOk
         orarpHi/AL2R1AJ6dHSNBv4U4Ll33u6O5+PfRUg1L9Th6eO9w2UWYsCAN2VBY1rvfTRL
         Z4PQPaf6EfPNBHJwor9yiJ/LsrA9Xw2/F2jpGezW02jFmHCkN8V0X11gd+vPn7JwRn/E
         DfecShrY4REHhfMIpo7RFTbMCXBF/J/dsJRdy6nqyzljg27q6YOfihyZ6nruPLt7/4ue
         +wcA==
X-Gm-Message-State: AOAM5307zfCrNljUB9/spnKLLG3c0W+7YYxdX5tzQVCxFAbYnsZ7ECwJ
	d2pWDtF1WyYk6V0TLaC0g9mKkeYRYXBGlOzh
X-Google-Smtp-Source: ABdhPJwtZCjzbGmeJuPaJsw0BTWevqeBKI3ETk2r/aWngs6A7QZje0ELG2Cp6LOtHVG58Bz/KJJsvQ==
X-Received: by 2002:a17:90b:503:: with SMTP id r3mr12019768pjz.195.1622921495168;
        Sat, 05 Jun 2021 12:31:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id j9sm7753758pjy.25.2021.06.05.12.31.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 12:31:34 -0700 (PDT)
Subject: Re: [PATCH v16 73/99] target/arm: cpu-sve: split TCG and KVM
 functionality
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-74-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b55a4a70-8501-5cfe-b525-37e521a575ca@linaro.org>
Date: Sat, 5 Jun 2021 12:31:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-74-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: er8CWtUzE0Sr

On 6/4/21 8:52 AM, Alex Bennée wrote:
>       DECLARE_BITMAP(kvm_supported, ARM_MAX_VQ);
> -    DECLARE_BITMAP(tmp, ARM_MAX_VQ);
> -    uint32_t vq, max_vq = 0;
> -
> -    /* Collect the set of vector lengths supported by KVM. */
> -    bitmap_zero(kvm_supported, ARM_MAX_VQ);
> -    if (kvm_enabled() && kvm_arm_sve_supported()) {
> -        kvm_arm_sve_get_vls(CPU(cpu), kvm_supported);
> -    } else if (kvm_enabled()) {
> -        assert(!cpu_isar_feature(aa64_sve, cpu));
> -    }
> +    uint32_t max_vq = 0;
>   
> +    if (kvm_enabled()) {
> +        kvm_sve_get_supported_lens(cpu, kvm_supported);
> +    }

Previously, kvm_supported was always initialized.

I guess this is sort-of a cleanup.  But we've got 4 different checks for kvm 
and tcg.  I think we can actually tidy this up with a set of callbacks.

static bool do_sve_finalize(ARMCPU *cpu, Error **errp,
     void (*get_supported_lens)(ARMCPU *, unsigned long *),
     void (*enable_lens)(unsigned long *vq_map,
                         unsigned long *vq_init,
                         uint32_t max_vq,
                         unsigned long *supported),
     void (*disable_lens)(unsigned long *vq_map,
                          unsigned long *vq_init,
                          unsigned long *supported,
                          Error **errp),
     void (*validate_lens)(unsigned long *vq_map,
                           unsigned long *vq_init,
                           unsigned long *supported,
                           Error **errp, uint32_t max_vq))
{
     ...
}

bool cpu_sve_finalize_features(ARMCPU *cpu, Error **errp)
{
     if (kvm_enabled()) {
         return do_sve_finalize(cpu, errp,
                                kvm_sve_get_supported_lens,
                                kvm_sve_enable_lens,
                                kvm_sve_disable_lens,
                                kvm_sve_validate_lens);
     } else if (tcg_enabled()) {
         return do_sve_finalize(cpu, errp,
                                tcg_sve_get_supported_lens,
                                tcg_sve_enable_lens,
                                tcg_sve_disable_lens,
                                tcg_sve_validate_lens);
     } else {
         g_assert_not_reached(); /* ??? */
     }
}

with

void tcg_sve_get_supported_lens(ARMCPU *cpu,
                                 unsigned long *supported)
{
     bitmap_fill(supported, ARM_MAX_VQ);
}

which we can later adjust for, e.g. -cpu a64fx and neoverse-v1, etc, which 
don't support all vq sizes.


r~
