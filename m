Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1147004ejc;
        Thu, 9 Mar 2023 12:44:44 -0800 (PST)
X-Received: by 2002:a05:6a00:4c16:b0:5a8:4c8a:2ce4 with SMTP id ea22-20020a056a004c1600b005a84c8a2ce4mr14189pfb.3.1678394684123;
        Thu, 09 Mar 2023 12:44:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678394684; cv=none;
        d=google.com; s=arc-20160816;
        b=LP8Zm0SsTgjCzSHsUk9DIsoDbX+f902j8eM+VqCraffw8NQADz72iTNWBbfRlJu+gi
         Zr85ITNCWacJhQR8T3PNbJfMqT00d2vkl22Z8/uBYOLTdnGYjUx5O6c04XcGc9Wyt3O5
         GvhrzuPdZo2uPc1DEXnVwKgkCD8MZmzvvbTl/pCsbKuWLHSWBKKKnOFmofdMFQ2gKmYh
         VZSbEl/oV28I+QSgMTz8fT8jSQHCCBl6tsbuG3nitQR+TN1l3Jwt+NbN9MPni6n9sHIH
         mNG9ypHzZSh+QIaqHV480Mceyu7YEYksGlJ4b5mkbvONN4WNPznnSnDQt4o8dgFS+VV9
         bGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3C0UwMgWENNIgVRqXWh+6XqbY0jzBubncxZEujTGp+o=;
        b=rpfzw0S+iLYMsB6bFBcNMJy1pIecH0RmURfL95ZUMn4t04IAikP34vAqurUECPW4M9
         1oNnqqE8NPtQPffCJ6Uoe9LXc9lfQhhM2L/8FwwIyh7+Fcj9SUamAY/3+MLYbH3OO3MM
         eLUaH3wcZ4XyDtQhIllx2Ey68pQCDvYC75/lxGj4+Sxiwb75zjdO2mwNpW5YekiTzJXR
         UhLEblASjv9S/n6QnE6xdsoshAifrY0k4emhkV31/OtbAOivDG88oF4FDf45cWEJo8Sp
         +xQB/sfDTN+5Jd6V14sXEmA+UutCJoPDQVXiAWaNou2xL/f2j/f/5YWeHBFaZE+OlHAG
         Targ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WjYS942W;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e66-20020a621e45000000b005a9cdea76dasor12989pfe.84.2023.03.09.12.44.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Mar 2023 12:44:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WjYS942W;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678394683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3C0UwMgWENNIgVRqXWh+6XqbY0jzBubncxZEujTGp+o=;
        b=WjYS942W5zhMPobYvzJoX2AxAeVXYKkFA/qIZemA2zmIsEN3ikRzcwZumoiep6TY5O
         giiG5cAp8zWavPPyuwaV+MRhcxfSHhLPi6vaUITjd57o0IoZIaabhgxNnfIiW4qJ0JvI
         CmlC3opSlPmjxzsJ7bn2rcCYRW4nXSTZKZgHhR0a0AxPTFz0HKmYFe9xtewc7xl00cr9
         RwJ/IismaNjuCp2zU1kRI/b0O/yCwSuPdaZpxzMyKUpMUku6tsY+T2hzliFEH7IXIhoY
         20r+NyUVsks6ytrlJkNugJkKlxFg6EDfr8F2GpHpQ2BlYCcOJcVtAGds73Z32KHJXBU/
         hkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678394683;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3C0UwMgWENNIgVRqXWh+6XqbY0jzBubncxZEujTGp+o=;
        b=atg9YAepWMpZnV4v159lGZkyWG+EFCoYisKFOQySlfGpxY7plD05AwSKtWXElDJf/a
         9EjNsydN/sSixZkHZebqvOZKf9SmvENuBuOUELiVuCk2ZMxzHGplmYFBvEIBRG4SyX8Y
         n1f/vKBoj8mhAIwwNkQbUyS9gX324TztWKUQJQY8b6e8MabwUkSdwYrNpMOR+WdWTP4/
         Q7dIXUhrOEbzxmY/9UUQ4QHJWg/HuzwruBBTOouVbr5Lv7mP1AKdRFtnBScSydRhl2nW
         g935p7hIxvgwc2q4EpwqlJPtrJRP8/2mXbaVoiAUaR+Qh0acxkjrJv5m+aigMIhRksjt
         OY2Q==
X-Gm-Message-State: AO0yUKWKHH+IVnXrTNVUsFUyT/FWR5g5215bOnjEPiq4AKj41jFOed1C
	3ehtHZ4y7/ZAHb+re8p34V8UKAzc
X-Google-Smtp-Source: AK7set+zDqmQTz5IgmJuc+PrtlbDCXsu99uR2whnM138lwCFyjvqoVQOn73kOIi11Eqdr7nUBEyhCw==
X-Received: by 2002:aa7:9488:0:b0:5a8:b6ab:49c3 with SMTP id z8-20020aa79488000000b005a8b6ab49c3mr18961817pfk.17.1678394683580;
        Thu, 09 Mar 2023 12:44:43 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154a:9f01:bf7f:79a0:a976:bdaf? ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
        by smtp.gmail.com with ESMTPSA id y15-20020a63e24f000000b004fb997a0bd8sm34355pgj.30.2023.03.09.12.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 12:44:43 -0800 (PST)
Message-ID: <42a5ac76-a78e-c99c-87b3-76da5318c993@linaro.org>
Date: Thu, 9 Mar 2023 12:44:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v8 11/11] target/arm: gdbstub: Guard pauth code with
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-12-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230309201434.10831-12-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: XIdi20srL+wv

On 3/9/23 12:14, Fabiano Rosas wrote:
> We currently don't have the reading of pauth regs implemented for KVM
> so wrap the pauth registration with CONFIG_TCG.
> 
> This avoids the build error when using --disable-tcg:
> 
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub64.c.o: in function
> `aarch64_gdb_get_pauth_reg': ../target/arm/gdbstub64.c:233: undefined
> reference to `pauth_ptr_mask'
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> Does this make sense? I seem to remember we had a rule that for KVM
> register values should come from the ONE_REG interface.
> ---
>   target/arm/gdbstub.c   | 2 ++
>   target/arm/gdbstub64.c | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 2ecc362ac2..fc937580dd 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -521,11 +521,13 @@ void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu)
>                                        aarch64_gdb_set_fpu_reg,
>                                        34, "aarch64-fpu.xml", 0);
>           }
> +#ifdef CONFIG_TCG
>           if (isar_feature_aa64_pauth(&cpu->isar)) {
>               gdb_register_coprocessor(cs, aarch64_gdb_get_pauth_reg,
>                                        aarch64_gdb_set_pauth_reg,
>                                        4, "aarch64-pauth.xml", 0);

I think this should be tcg_enabled(), which should avoid the need for ifdef.


r~


>           }
> +#endif /* CONFIG_TCG */
>   #endif
>       } else {
>           if (arm_feature(env, ARM_FEATURE_NEON)) {
> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 3bee892fb7..67c7cbb63c 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -210,6 +210,7 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
>       return 0;
>   }
>   
> +#ifdef CONFIG_TCG
>   int aarch64_gdb_get_pauth_reg(CPUARMState *env, GByteArray *buf, int reg)
>   {
>       switch (reg) {
> @@ -243,6 +244,7 @@ int aarch64_gdb_set_pauth_reg(CPUARMState *env, uint8_t *buf, int reg)
>       /* All pseudo registers are read-only. */
>       return 0;
>   }
> +#endif
>   
>   static void output_vector_union_type(GString *s, int reg_width,
>                                        const char *name)
