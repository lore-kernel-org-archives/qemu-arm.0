Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1525026ejc;
        Mon, 13 Nov 2023 10:12:59 -0800 (PST)
X-Received: by 2002:a05:6870:2247:b0:1f0:8122:554c with SMTP id j7-20020a056870224700b001f08122554cmr10526332oaf.45.1699899179629;
        Mon, 13 Nov 2023 10:12:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699899179; cv=none;
        d=google.com; s=arc-20160816;
        b=cTlzQLmzJ7FX905Q5v9KKx6dk+Zs7/XmtCk26xh1GhLEzOsNC11SeJJelHmwNTaTqa
         u5MuGFXfQK0GH/uifmA8tzErUZkTqdai4iKOpuHPC09B71VJdEINVl4ESi+t0HhSXYpW
         lDaFv4gQRYnT9SpWtS0CbTiMciPBzZ6goIaDgtoP2CKEabQ96t1gAzwMn0oh5JW6zN3I
         lkVVp4YogPUp8C3Ho0yZUIyTrbLjGLKZ+Dn3OY1KO8OMdnVpcbP6PetD8H5+ZT1YBs6s
         BaH9N3svFkLAO5EVSagZv4A/rO66qRqSIo+362BM47FPKJYa6lY1YR0HVFC2g9mknBKx
         hqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZBVS57ugFH+dWwwgJQNw/EdC1LQ7A71bAIRGFWgr9qQ=;
        fh=EvOKQYaIe4I9Kcy6c/Ll7Qwfc3jBPyyxi3MLAzaX1fM=;
        b=Lr7G3ZHoBL4kwW+gpLDkCvI4zipLvRvlRv2BGc3ungXMnb/S10dTEIGPKgMSHPIJRY
         ksBwZ2n5IlBhibbGgNtAES/ltHyZKU7LjqlpJf85/ECclQjttrHzaGVb2dLI71NGFfO2
         64S1t+1FQDdcSGvWqGouBkb+632f5pScinibv2N8CrAWj6cfpZVeuDEvjij6VPLObS1x
         hqABJGykGn9JCPCXXV/3M1Vc5KuarB9d84vCqRrtgkkHSAv5uXaBWjpqUdfIVhQ2TiB2
         kh3Qvu55/71W4bPFwpa6caAqgyMZxJLVgiDPbMfAywrK6S2iZ8W7zgL1mX9avMLSA9Ua
         GSEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I2LmqhLX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dt48-20020a0568705ab000b001e1919610e5sor1945134oab.14.2023.11.13.10.12.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 10:12:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I2LmqhLX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899179; x=1700503979; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBVS57ugFH+dWwwgJQNw/EdC1LQ7A71bAIRGFWgr9qQ=;
        b=I2LmqhLXpqn0WsoIfoBOYIjwPaaX5kRR+5LGuC4kbaTnIfFTG8eM6t8bGKkbwDn7Lx
         fFER+cMozV3bbT5zuDW9M6hNnF5BTcf8agtlvovaRNfGSGsbNCLUrgvEd20nkAvpLewK
         pTzRAhOj2deTt6/te912LxIaIgOV4HeEnsbYgB4cb4xx3MMg11af0Gg5t3IGCm7BLRhT
         E31GD7Hm/mn2SL1hJbSGGscyz8G5CGf+GJwdTbUFaQ34BDxCkodOXaMnGRKMB2QEduna
         Sv2NUWI13xsgA9UerpzgiH3S6pvq9lbh+sVRggc/wovA0287PDra++Qu+TUxo8yluT39
         7iFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899179; x=1700503979;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBVS57ugFH+dWwwgJQNw/EdC1LQ7A71bAIRGFWgr9qQ=;
        b=HKgrqF7HUhMf+W9V3fHeoCgIKedNSVgw6A6guepYHbCGLuE91NDHQHHzCShgcO3Nnx
         Key8XL3FLVpieqvUVEeG238JcBX9K3az01kbc0kO0fv1fYB+oOXUu+9v6sICIH2Oe3Lm
         osgnmTasRDUsXxwjhBMsr/rSkQRPfxwnT0haBHTxFR0Vx/RBkEC4KnhwFl8212wqyZm+
         9Qrg3W08xOgNpI6t7vb65nrqsUrJFmGZc8wIr0nb2/F66ZBaAyjjgSrsWQ7j0Wh6OLHq
         N+/gqjt6HIaGnYXbs/h6MuBJr3na9zYIOsHRxuyFyNCLBad4I5Q6XK6O5R2Mpm8Ae+OP
         KvAg==
X-Gm-Message-State: AOJu0Yxxu4Dip97O3BokA4SzKFnWdF9grdrtHTWxeK0dHafE8VYnHb0E
	N6sXR4yShPwZDdC1/7cYCNloh2uz
X-Google-Smtp-Source: AGHT+IHouUBCiMX9KBY+uYOICqzQx66TRgfPBXn9EutFo+KHFLUOx3FPF3CRi5Kl+BGT8JiIk0Cxfw==
X-Received: by 2002:a05:6870:3045:b0:1ef:c944:222b with SMTP id u5-20020a056870304500b001efc944222bmr9441610oau.11.1699899179250;
        Mon, 13 Nov 2023 10:12:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id it13-20020a056a00458d00b006b58af8aae3sm4092255pfb.77.2023.11.13.10.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:12:58 -0800 (PST)
Message-ID: <1c57d09a-14ab-4dc3-bc23-31e1ac906f82@linaro.org>
Date: Mon, 13 Nov 2023 10:12:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 02/10] hw/xen/xen_arch_hvm: Rename prototypes
 using 'xen_arch_' prefix
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zo57nMMWHwoZ

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> Use a common 'xen_arch_' prefix for architecture-specific functions.
> Rename xen_arch_set_memory() and xen_arch_handle_ioreq().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/xen_arch_hvm.h  | 4 ++--
>   include/hw/i386/xen_arch_hvm.h | 4 ++--
>   hw/arm/xen_arm.c               | 4 ++--
>   hw/i386/xen/xen-hvm.c          | 6 +++---
>   hw/xen/xen-hvm-common.c        | 4 ++--
>   5 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
