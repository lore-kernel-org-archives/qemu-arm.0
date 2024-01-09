Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp560447ejs;
        Tue, 9 Jan 2024 10:23:19 -0800 (PST)
X-Received: by 2002:a05:6512:e81:b0:50e:9354:374d with SMTP id bi1-20020a0565120e8100b0050e9354374dmr2777044lfb.89.1704824598935;
        Tue, 09 Jan 2024 10:23:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704824598; cv=none;
        d=google.com; s=arc-20160816;
        b=x7y0C1jz/rAdt6qkG7ECYRfEuqAlzPIE3zrqqbHLl8G8nGanvpAg5LBWb8eRnM2uLT
         M6zJM5BAqqsWR9y5kn0DTQear25srjGUkZMfseD8BS7gkAd6MtPKUDBKoMjLpKI4VkMG
         4EsicGlDZucJEZ472DhfQnBYUN/zgTQwdaAUPEBAKxSMqjqQ5As170f7P90kIRGsO2J3
         4cPtz1w2C2pP8nMFwCYbm/0R+cVt6yOjiaFVmc7SnjjizXx8czHudNnQGzQ/LGNC0vwO
         1eIWq/qu4uefWm6Z11iDzS2xLsSKX8kFQtLF7XDB+MGPaqM83RshBTQcdw5qTNExLbBJ
         hVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IwiYMRRiVitqny+M2/uSTF/IogCQlOZjF3fjjiHBnfg=;
        fh=tIPtNlFzeHxgf2SHuPpxDfNXaZCwv2ZxIDfoid7y1B4=;
        b=KDovwwPWDdDYReG30nS47WMwptZ386K+SBfgpSGGVxLQK8uXgPW/EsrSGqu+4/lUk0
         pwaLST+G/PJcyV+P3watfSjuIWNvHeVYisV31r5qmdlIdluDMU1dNdLvG0syLIqkPNDH
         QDJxY0yuRSuMZQ5cPbpo9erZ3Bgxs6LIhDV4S9BfCSju7VO/N7sEpuOA3ilA4lrqNNc7
         y8aloYyvJGeXJXfxzVnY7kbHbibCHNlhawza5FtTDIqP/LRIubYlsyq0DuE6XAeYWRC5
         8G+Ze+eOMXTSK0eTTBbUlfa2QiUsAx1h/8TDxapfMLjNVOoFcAvDIIG8S+Vt1dCI3hPh
         z/kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OqHE5mQj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f8-20020ac24988000000b0050e7fec36fasor472774lfl.30.2024.01.09.10.23.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 Jan 2024 10:23:18 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OqHE5mQj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704824598; x=1705429398; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IwiYMRRiVitqny+M2/uSTF/IogCQlOZjF3fjjiHBnfg=;
        b=OqHE5mQjdocy4yErFyxxyhb9LaTiKw2zAZgyNKeb5lvu1/TfG9KpUeQa/2Lc4MFhkh
         E5ihyQWqiW3av8mLA+5KdN2Lk4ERpAG6azCafxVgujzbmgG8mfr5BuWwESCfiq4lbShm
         app/QeD9bfWjO27Sv4oZ5AR/9KVQg9lMqZ5o6GYotOHhgNJOVKogQrEN1gwpAj9ZT5y5
         I8WQS5FIRmoFEBPVZEOtrMIeMSEACp4oLhJylF6vFrWVQw8ZoRY1TEEx9n4n+VpCTVHZ
         6hPea/oQKqecu4BWhRrasCPCbpBA8XfuY88Xb+pr+2/yAjqMXTgAGChFmbrt4GdrBlEs
         tTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704824598; x=1705429398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwiYMRRiVitqny+M2/uSTF/IogCQlOZjF3fjjiHBnfg=;
        b=r5DsgD4Z34YnMsfw4lpYHaxrMk/d7wftvbYeEJ9tpuOGgRkFTruFskFWQhfmtbXTvz
         /6xV68btJgzGyM41qJZcNMReByEXmiDeIDu2UJOL2230ieGf8sv4JeFn+C8KpFe5Pj44
         OpamH0K3MeO3+U/PRWagB0rlvCyplFv8OmgdH672p5ruj4Sgmr/wadkjdOjQanpYZy9H
         GkiOH687AX73QJrJqLrfSKPQBI+8NO4hwio2Kezze0nLDR/dhnYZC9i6EGdYnG2yVo3/
         UxphRqDKR4C61Si6Axx+YysJMZGSQtBJboy9+U8N9VLsWaQCVK3pwU8pbQRK/sn+6bls
         M4DQ==
X-Gm-Message-State: AOJu0YwmQ4ORP8ydXAv4lnA8W8VQBngyAmpfDtFqy0Zqia5ReKeV36iH
	vRDJmCzIWCUI4Vo4ZXd1TaDrJtDdj60cPD4I
X-Google-Smtp-Source: AGHT+IHEIR2743EpVRU2bJ5DdlpRvMkc9k+Jut6R9ZUI+r+wwOxB1WnLxr27Syz3Z0kGOSvPNoShdw==
X-Received: by 2002:a05:6512:3b24:b0:50e:55bb:a453 with SMTP id f36-20020a0565123b2400b0050e55bba453mr2831787lfv.3.1704824598519;
        Tue, 09 Jan 2024 10:23:18 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-47.dsl.sta.abo.bbox.fr. [176.184.32.47])
        by smtp.gmail.com with ESMTPSA id o15-20020a198c0f000000b0050e7dcc05a5sm425817lfd.102.2024.01.09.10.23.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jan 2024 10:23:18 -0800 (PST)
Message-ID: <c71a6872-6e67-4384-9d28-b1c2da0bd521@linaro.org>
Date: Tue, 9 Jan 2024 19:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/14] hw/arm: Prefer arm_feature(EL2) over
 object_property_find(has_el2)
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Rob Herring <robh@kernel.org>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
References: <20240109180930.90793-1-philmd@linaro.org>
 <20240109180930.90793-11-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240109180930.90793-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: gjUYtf0z6QAE

On 9/1/24 19:09, Philippe Mathieu-Daudé wrote:
> The "has_el2" property is added to ARMCPU when the
> ARM_FEATURE_EL2 feature is available. Rather than
> checking whether the QOM property is present, directly
> check the feature.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/vexpress.c  | 3 ++-
>   hw/arm/virt.c      | 2 +-
>   hw/cpu/a15mpcore.c | 6 ++++--
>   3 files changed, 7 insertions(+), 4 deletions(-)


> diff --git a/hw/cpu/a15mpcore.c b/hw/cpu/a15mpcore.c
> index cebfe142cf..1fa079b3b8 100644
> --- a/hw/cpu/a15mpcore.c
> +++ b/hw/cpu/a15mpcore.c
> @@ -73,9 +73,11 @@ static void a15mp_priv_realize(DeviceState *dev, Error **errp)
>               qdev_prop_set_bit(gicdev, "has-security-extensions", true);
>           }
>           /* Similarly for virtualization support */
> -        has_el2 = object_property_find(cpuobj, "has_el2") &&
> +        has_el2 = arm_feature(cpu_env(cpu), ARM_FEATURE_EL2);
> +        if (has_el2) {
>               object_property_get_bool(cpuobj, "has_el2", &error_abort);

Missing to be squashed on top:

-- >8 --
          if (has_el2) {
-            object_property_get_bool(cpuobj, "has_el2", &error_abort);
-            qdev_prop_set_bit(gicdev, "has-virtualization-extensions", 
true);
+            qdev_prop_set_bit(gicdev, "has-virtualization-extensions",
+                              object_property_get_bool(cpuobj, "has_el2",
+                                                       &error_abort));
          }
---

> -        qdev_prop_set_bit(gicdev, "has-virtualization-extensions", has_el2);
> +            qdev_prop_set_bit(gicdev, "has-virtualization-extensions", true);
> +        }
>       }
>   
>       if (!sysbus_realize(SYS_BUS_DEVICE(&s->gic), errp)) {
