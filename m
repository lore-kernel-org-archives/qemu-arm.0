Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3119239njb;
        Tue, 18 Mar 2025 11:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDk7fMmd6sLKsZP1Be4Q/MCndWSnY79tPCn/IGfYhFeI6Naf7i7pPyRtqhFiKWaVzVQv0Jwa8mo5sACw==@linaro.org
X-Received: by 2002:a05:600c:1885:b0:43c:f680:5c2e with SMTP id 5b1f17b1804b1-43d3b9d63c5mr31289415e9.13.1742321687691;
        Tue, 18 Mar 2025 11:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742321687; cv=none;
        d=google.com; s=arc-20240605;
        b=Y2aXWwpjUohbE4lq7tkFf5U4FIfRMTjvZZCnUwWEmvd4Z0xkJPa7wM7Wvy3QqVXdQy
         bFC3m7lFej5K+kZACshUURzOuwoWG8Voqav3Fes54DBfgM347BnECQeNaqF+CDWX8to8
         okYVpxhXQub9mT9AsCtmW28atZfmlzbj7Syj5QlR3S26jjvCCGBSutNXI463pRzk1ee+
         w1PNoSwF+x3ewavme9uHyX9AFP3uXqIy/H78Xn7tlbc2LJQe3UsR3lANTGaev2GVOg0b
         aldJqYFbuylM97RAOA6eD5v/VijbhpTZ5ODfvVdp/unIV7ODhBbMrMUbi/SoQslATuuw
         Kjcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BHwyXtD9sEyyGr5c+FuZRLUFIfG7HhOrVMbvojfaBjE=;
        fh=lFCxw6Tl7ll1p7PhVtv9DZSr85xUvMGrbGA0SSwTA68=;
        b=CagjZOeD/NX6x2Bst0nvxgOplpLxnx54Y6k6toQ5kJ6Z3cVmjKHWUR/iFcoyPz4utF
         wjHBttN+CC7MLS6vZhiqlb0CvFyPxuhBI/ZwaVMGLGl6fygqvYIbApE59JNaltZQzhiy
         Oug2k5FsJnH7xfV63pzAEoYhGGls9YjtlMI9bUgFXQrxQYNIQAn0ZDKgvNOH0kXnM6LW
         4RDa2yRfC76q6kMOKIzry2uhh0ZjRd0sX4jiCWkHviHAwACILYONuDh4JUd3PtiE25JH
         c4OXIqFUBC1ZJLSs1QQmL6CPwuTUc6W5sZJR8H2o5vhxGCGfqOk551ZF+N5Wqq0Xr1UD
         FiXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VXz2TVlR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-395c80d6e43sor3389656f8f.1.2025.03.18.11.14.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 11:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VXz2TVlR;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742321687; x=1742926487; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BHwyXtD9sEyyGr5c+FuZRLUFIfG7HhOrVMbvojfaBjE=;
        b=VXz2TVlRq5kZ3xfO1xDQiNDJvqz3DKfzYss4LAIBqsn3of2rZhHwiOp+Pz8Y/ur8k0
         2JVSnvxaKjV0GOg5WXR/3u/0vo8YQdjeaJrMJPxnz+xXCDhiLktM1W4seL9+o3pHjfJk
         5a3A6viBfogIQn5romN7jSfpQQKclIyjK6J3fVvtdvoCrmftqbUW3uZwkysvAxHZGY5W
         82eQot/3hKtJU+Fj5P1T3dVmOHm4cBcp1Op3DPVFS7gNEZ0LjCy5Sa3hqKQ3La1JG+Mv
         hHSyKPOrvGMAF8NF8IvBr1iB/F0Jv/sGZxCnj7bzG+i1XPCBY67Td/j2OISI5oM07c8o
         dlWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742321687; x=1742926487;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BHwyXtD9sEyyGr5c+FuZRLUFIfG7HhOrVMbvojfaBjE=;
        b=rIh3/5IKDzuZA9tRXNXkkKuaKXVu1AzM+Js5MA8P2vp3iPZbi82b/4/bwMimJ9FUPS
         UkWoGNsAYx0Wwse9WL1F+O8/uoB1eU6vuatt9JX+HNQKAcmrp9MAQoZvHMk0/Ffuu6Tj
         JSt0aO1N4/Lk8Ia8efFYyE/CGF0wfb/uN3OECL7yIrogzvsXFNleaDpa8RDHRPY7Ooir
         htAESuZH4XnMkXckDgJn4l/jLvhI11b0zwGRGOH8adgYyEtkj2bgnLNSOGJB7MHZ8/oB
         2X3oRyOkSXCkuP8epy3ZKO/m1cjeQefpZn9vCbe/KkwEvXDYD3dsSUrVwf22qqITONaC
         hoTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV35fbBmc1GVmYyczzN9mybEnse44ZB62bncirKJ54Z2jNVF959UmP5FM7GoBQjW1mcEqlDvafgwZYldw==@linaro.org
X-Gm-Message-State: AOJu0YyuYuoLcWibCfUvW391DOaGX2lhXKlejy19vnuIS03vaW1AzgfD
	JdznADyzTTq3FMzdR55Hcv3av47FNicJu5MSr/pSHRQwJCJWJ/8VVlVAUrPxG1IAR4xxswVOpAb
	qlJc=
X-Gm-Gg: ASbGncuqhPY8e/M+j/ap5Yi9b0B03gxnWDwHciwKoo/lAM9gN4lx3pasBdHStiRmy3J
	Fo7m8CNbvrfNutju8lS5nI5ZACW/QBscP8+f9Fx2rK4TeHx3Uk5X65h4Oo8Mi3ecwSKV0ePdIVo
	fPYty5LvFwHEbF1telNtPKCNPL4KCQZprLwUkf5nsOF09oTz5tBd7HY4d35PSb/+KnFbUu/p4Wp
	JRp/0IEyLuqBM+51w7KoYRujZbyCHQUby6ZsviWHzkfwzy+Mn6kkkPurF93LKgkjJq+7ljZw+IB
	TNbd8mS7v1jul0y4t0nxNWEJZwcxUZmOi1VlYwxoW/4zsUDk3h2mfKM1ZgnPAzUDO/DYiULGLoM
	/m/abjFQQ5dwqTl0ZrOI1Qy0=
X-Google-Smtp-Source: AGHT+IGjFHimgPwrXJB69701bffChbLD/HEoki8yIc2rRZawW/+t712tZ7qp7WVYQIXal7RK/toejg==
X-Received: by 2002:a05:6000:1f8a:b0:391:2a79:a110 with SMTP id ffacd0b85a97d-3996bb57561mr3621625f8f.29.1742321687133;
        Tue, 18 Mar 2025 11:14:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8975d65sm19100205f8f.56.2025.03.18.11.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 11:14:46 -0700 (PDT)
Message-ID: <fa3c4676-f78c-42af-b572-559640c0e4f7@linaro.org>
Date: Tue, 18 Mar 2025 19:14:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] target/arm/cpu: always define kvm related registers
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-8-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250318045125.759259-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vfxpDZj6lOaa

On 18/3/25 05:51, Pierrick Bouvier wrote:
> This does not hurt, even if they are not used.

I'm not convinced by the rationale.

> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/cpu.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 23c2293f7d1..96f7801a239 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -971,7 +971,6 @@ struct ArchCPU {
>        */
>       uint32_t kvm_target;
>   
> -#ifdef CONFIG_KVM
>       /* KVM init features for this CPU */
>       uint32_t kvm_init_features[7];
>   
> @@ -984,7 +983,6 @@ struct ArchCPU {
>   
>       /* KVM steal time */
>       OnOffAuto kvm_steal_time;
> -#endif /* CONFIG_KVM */

Maybe we need an opaque ArchAccelCpuState structure...

>   
>       /* Uniprocessor system with MP extensions */
>       bool mp_is_up;
