Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp627810ejb;
        Mon, 13 Mar 2023 13:08:14 -0700 (PDT)
X-Received: by 2002:a54:4510:0:b0:383:ce80:6c28 with SMTP id l16-20020a544510000000b00383ce806c28mr8898943oil.51.1678738094043;
        Mon, 13 Mar 2023 13:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678738094; cv=none;
        d=google.com; s=arc-20160816;
        b=AFsTXCZsooOKcnSnPJ4mGNVeIRKoUMODc6tfMawvAmqur8f7T3kXw2gZLxh2owsyC1
         HRT57g1waiT7c07bAQpQNgUmiZnmOGIjloD2PoFa5pW5dnrMAtFfyv7vkYr7yixBo4bJ
         Rw6CwJSgcrCyFVJYXzGGRaNL3/fswkX9l1n8dLap1PaiblBg52+SfTLVjYPtMbJzWt1U
         I1h7cQ4+t1mJRIzsQqo6YZuUySebxSZT7iXDxyAKwIFD5eTjGBqQfm/8/gDNb5RlNmmc
         o2TCqBqOrsM2eB0X9Vz/qaE6v9U0b0CkjvizHUz7bDYe4VAuE9++roCxYFc6L/vOEMQl
         NPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kcNbHfzfjwgj4WAAB9HDgad/3nvdd38KZlpl06VEq68=;
        b=BjoJhxYblSn/gMWl8h7uxEXlOYYlfwytPYLbpgpNUxbbe56yT6ZWl8ayedClaZCPTw
         paz+EqngUlRHTkqQ3FRdGkQvJDSiWD/AGuKR44Twigv6XysIeq4DXkz4r96BNQTPSuXg
         O9U8q2EvXXP7JD+v+l61ATxV9G3PrF2A/6ZmobqLm+deyeU5eNCsm8OzQSbZGlQRuBLd
         KA3zHmkC/XQZxlOnNeqXhXWT/BTV2BFABwnbfTXkwpEMZ68j/Cy5sD4MESUMcRxlgfDV
         Xxo4ZEEY+QM95ycLoHE9is4Lz6fDMASbhzJ6i5VJeI1HgbgV5fd7l/VKcfRmuaiOXs62
         1U3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BG0rPpXj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id fe3-20020a0568082b0300b003785198dba0sor116500oib.13.2023.03.13.13.08.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Mar 2023 13:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BG0rPpXj;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678738093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kcNbHfzfjwgj4WAAB9HDgad/3nvdd38KZlpl06VEq68=;
        b=BG0rPpXjXXYnyJxCokumlwePN+gJSkbHS4RVdb2Qoqcd1SdoVXWnAB5dzIPNJm6Kn5
         ggJ9idQkhnPhhuB2CcaW8ujeMVbUu3ZKhzcpvLDj5aWoqXfoXSLvF6QnHegOTw9umj5e
         Dn2IOgW1sCZM7munNVo+22g1EmzZQlFuo9SICj8L3Qh31dE9DrXkmXgfUAR9LHMuRnFQ
         UJpbW5A0Vm4CtNiqNUKFEO7VVXk88xtjzWelD41XbOOXved6cRLFQyWRa+VPYeCdWdWC
         moGGD/P6ygeXTQnNRJJmd1UQ6gxRlfu3mTyKGje4OqlyxHWz1G4zqqN9DfdUbKfLM2Ty
         wnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678738093;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcNbHfzfjwgj4WAAB9HDgad/3nvdd38KZlpl06VEq68=;
        b=iXQbjWF9KxEGIONCZIlTc9io8IMTYuF09YQ2UC/jkPgAudM9azrh973eTQFC3bOGqR
         cGLFEANZmrtM/MUhAdDxpeKbVoSdTyjlB9b8dmGRJXkV6WGBXbLJjaOK2Z5kbcWNcUEH
         dJp4oE44EiitSfVLmkeDl1z5jcr7NC2HsLYm5WDatjjZv9uZMyoQZQQp8MNQR31Nf4e2
         F73+Xva/MkTMl09TP7gWzXr0Y2y91Ge9qYaA2VuZtOEf4BKs3iH+zP4K5gkNT2c+7Ivy
         6pvQjbjeQlh6PHdDuidqqquE6pDGzGT+TaP7rSABGfaKVemzp/tB9Jky6xdMrTofhAfm
         isIA==
X-Gm-Message-State: AO0yUKUswcKNAelbSDj1fe3yMrbVly+npV/i0OjzkeNOWh5pcm3cwm3Q
	dj1refFmxm5JYPTIdSDoextNzDvh
X-Google-Smtp-Source: AK7set8puSvdQqOxta4Ht0s0kcgDDg8XOJ7UAvwSwEVvlZ6dGNuNwIxWLctXLXcRy8i2vH9AQOFBAw==
X-Received: by 2002:a05:6808:4041:b0:386:8c30:6e92 with SMTP id cz1-20020a056808404100b003868c306e92mr200249oib.14.1678738093661;
        Mon, 13 Mar 2023 13:08:13 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.4.181] ([50.232.40.61])
        by smtp.gmail.com with ESMTPSA id w130-20020aca6288000000b00383bfd8a184sm180886oib.25.2023.03.13.13.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 13:08:13 -0700 (PDT)
Message-ID: <02479679-c3e7-3239-f4d7-5b02e28451e5@linaro.org>
Date: Mon, 13 Mar 2023 13:08:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 05/10] target/arm: gdbstub: Guard pauth code with
 CONFIG_TCG
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230313151058.19645-1-farosas@suse.de>
 <20230313151058.19645-6-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230313151058.19645-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: B8ybjkPIjjZg

On 3/13/23 08:10, Fabiano Rosas wrote:
> We currently don't have the reading of pauth regs implemented for KVM
> so wrap the pauth registration with CONFIG_TCG.
> 
> This avoids the build error when using --disable-tcg:
> 
> libqemu-aarch64-softmmu.fa.p/target_arm_gdbstub64.c.o: in function
> `aarch64_gdb_get_pauth_reg': ../target/arm/gdbstub64.c:233: undefined
> reference to `pauth_ptr_mask'
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/gdbstub.c   | 4 +++-
>   target/arm/gdbstub64.c | 2 ++
>   2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
