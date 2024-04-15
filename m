Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1104828ejc;
        Mon, 15 Apr 2024 02:31:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXu+IENKtyBKjG9SxF3E9nOe1YMxUREflW7fL6SEX8t96xu+sDDAGpjbC+/3wxWvFQAToORgRSsMdwMZ1QJwmfAPhWt63uy
X-Google-Smtp-Source: AGHT+IGPeRLIsx6yx4fPRK/SkBbJbRxO7CDuSh8fKG/SrcK1EQizNrN6rinRWcmkic7KjeaseSqv
X-Received: by 2002:ac8:5d88:0:b0:434:f32c:248e with SMTP id d8-20020ac85d88000000b00434f32c248emr11287217qtx.65.1713173476609;
        Mon, 15 Apr 2024 02:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713173476; cv=none;
        d=google.com; s=arc-20160816;
        b=gURCFUWbR+60F+qaCxnAzAcwQRM4bR+uOlv7ACXQ3yxyp2TZyo6dFLiuh55SknEkRh
         rlKfXZKyKLGQ6k+TJ7u4DrM5xNyCU2DTxr9SgtGeDqKc5KndlFM01A+B7BnBwCwzcVgP
         H/fms6GHWjoj/TypJattdtLmMtxxOpeCu60y9llZDvmsN23rLOwWXPLpz+goYBdd/Rgg
         R1M57BuYq9JxPAG/1g6R2/pf5x8qlrN0/0YOVIXTdJw3aMyG1XE5IEU628eHcEtgCM4T
         wdNwxdCR3ImLietxaN0fJp77VIqW99tebophlzhYLsTsVSoVpn5n0nwY2zx0Gtlv8z6R
         E4Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=2VSaVO0jKEglRFYHwOI5PvU1TZFN7MEPyVaQBRQh+z0=;
        fh=9VLbG7gyERtKpEsaVXBGVs8HTtEnJ9FDgrPEmznWIfk=;
        b=y3EqO4wCs/H1BgQCf9F9BM6F9+6nRr1zuJSdSt/mHqGYC7x0TJMsSLln5IY3+kt+ro
         TWzT9HWat/782HLYKchBb0ixn0u7VfNs4Zw0AL3O+og6c3A/3xekdOW4cHC3SDR1SkLg
         ua/4dDmIFkz9QjQClyQZh3UCDySEu7M+XjQV35qDv5+hJAMJ/hcUA0pHY1KErueXo4P1
         P/eN6QIRUM9wRAlwcPcmgnD2cIcc4F64yNyDIlOJWziMocRl5e8nXoTYTV2xzEJiM5rx
         SZCElrmxZjeBxeIKUB8ysVBQ/xTt1RePdNLHJjCzdb1iCFshM+35XyOlDP2NWL6cOOOa
         OWmg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B15CJU3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11-20020a05622a054b00b00436634018e8si9736068qtx.102.2024.04.15.02.31.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2024 02:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B15CJU3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwIg1-00075C-UX; Mon, 15 Apr 2024 05:31:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwIfz-00074D-HE
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 05:31:00 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rwIfx-0003DI-Kk
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 05:30:59 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-418672b4714so2868395e9.3
 for <qemu-arm@nongnu.org>; Mon, 15 Apr 2024 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713173454; x=1713778254; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2VSaVO0jKEglRFYHwOI5PvU1TZFN7MEPyVaQBRQh+z0=;
 b=B15CJU3XnFWKYEp/NREhkLhsZmJWwUh2BbKaQS9Vtt0McusixDtIbUAo4lnEXUQAec
 md4NOKEGkORXZruOKTIu96l4pGxUr55dYaUqIszdjr3MxRUsqdYTxqItErG2LnhYr27Z
 rfWLSueLCHv00K6UaElPYjoA9JHAA3AIEor6ouBmTRiNrF/cmNJz9x7AUQ2FMHBmupB2
 HRVUgJBXuvAbbszllvMbQZqWsLHWQzT25bJ45RaLUNYYBYXCWhDsM+S+BNa0koZ01V/P
 ZTd1348+ZeTK7To7QTizNnUPkqr4bdq3gMRMK4Lf7cG6g27R1rtuRoz1RYjWnp8VoKWc
 qeQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713173454; x=1713778254;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2VSaVO0jKEglRFYHwOI5PvU1TZFN7MEPyVaQBRQh+z0=;
 b=GNFYjbbhkmeR2IrDDGcw9WMqoqLjIeoYOOft6zfn0W5kkjn8bEeq2XA+1heqTe+jEH
 utv1B6LM8twXYCyJM7OJD6GZDsSsHJywwaHLx45y1cjZ8s1ZpfDaI/9fLYTI5OUXWji2
 aX/fGX2U4/ChZI5OkPc++pt4ilPBHBFihLmX9X0JaHqTLQg8F1vmuVRX2HAlq4+ZHMWF
 SGyfHqTCXpExx5X3lVJqF8h8Uzra6ZqrTFtu1h1zpTUdf9xImzYn1IP37UjlsUXoqW4P
 e9VkrWWkb6zoeTFs78QEuAvp4gJicp7yDxCHOOLGC9VyUgL08G8VfwR0LeR0qZy5W/Yo
 6ghQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8ecGhCAM7z6caQNh+w6QLN/jXeAhnVQsGXI8C+IlwMhndRom9WUpnQ61vNSQUG8SANkI2YdzGOhLOwRRIiFdsTbmo
X-Gm-Message-State: AOJu0YwSkk77MCam2EmBPh13LBDm9YI6iU0d3zEejekUdHO25TloDl26
 NQK5HXWhgbTEkeaWRF6BHh1Qp+OWTQWo7QCZ2N0xSD9hazXND34orYbmbleYOBo=
X-Received: by 2002:adf:f40b:0:b0:343:facf:228a with SMTP id
 g11-20020adff40b000000b00343facf228amr5417701wro.19.1713173454445; 
 Mon, 15 Apr 2024 02:30:54 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.132.126])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a5d5941000000b0034722442e60sm8086547wri.61.2024.04.15.02.30.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 02:30:54 -0700 (PDT)
Message-ID: <14d2fa55-4938-4007-ac65-6ec6c48fbec9@linaro.org>
Date: Mon, 15 Apr 2024 11:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] hw/arm : Create Bl475eMachineState
To: =?UTF-8?Q?In=C3=A8s_Varhol?= <ines.varhol@telecom-paris.fr>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Samuel Tardieu <sam@rfc1149.net>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20240414130604.182059-1-ines.varhol@telecom-paris.fr>
 <20240414130604.182059-4-ines.varhol@telecom-paris.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240414130604.182059-4-ines.varhol@telecom-paris.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: +wuznDI8i3Zp

On 14/4/24 15:05, Inès Varhol wrote:
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
> ---
>   hw/arm/b-l475e-iot01a.c | 44 +++++++++++++++++++++++++++++------------
>   1 file changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/arm/b-l475e-iot01a.c b/hw/arm/b-l475e-iot01a.c
> index d862aa43fc..2b570b3e09 100644
> --- a/hw/arm/b-l475e-iot01a.c
> +++ b/hw/arm/b-l475e-iot01a.c
> @@ -2,8 +2,8 @@
>    * B-L475E-IOT01A Discovery Kit machine
>    * (B-L475E-IOT01A IoT Node)
>    *
> - * Copyright (c) 2023 Arnaud Minier <arnaud.minier@telecom-paris.fr>
> - * Copyright (c) 2023 Inès Varhol <ines.varhol@telecom-paris.fr>
> + * Copyright (c) 2024 Arnaud Minier <arnaud.minier@telecom-paris.fr>
> + * Copyright (c) 2024 Inès Varhol <ines.varhol@telecom-paris.fr>

2023-2024

>    *
>    * SPDX-License-Identifier: GPL-2.0-or-later
>    *
> @@ -32,33 +32,51 @@


> +static void bl475e_init(MachineState *machine)
>   {
> +    Bl475eMachineState *s = B_L475E_IOT01A(machine);
>       const Stm32l4x5SocClass *sc;
> -    DeviceState *dev;
>   
> -    dev = qdev_new(TYPE_STM32L4X5XG_SOC);
> -    object_property_add_child(OBJECT(machine), "soc", OBJECT(dev));
> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +    object_initialize_child(OBJECT(machine), "soc", &s->soc,
> +                            TYPE_STM32L4X5XG_SOC);
> +    sysbus_realize(SYS_BUS_DEVICE(&s->soc), &error_fatal);
>   
> -    sc = STM32L4X5_SOC_GET_CLASS(dev);
> +    sc = STM32L4X5_SOC_GET_CLASS(&s->soc);
>       armv7m_load_kernel(ARM_CPU(first_cpu),
> -                       machine->kernel_filename,
> -                       0, sc->flash_size);
> +        machine->kernel_filename, 0, sc->flash_size);

Spurious line change.

>   }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


