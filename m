Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp548346ejc;
        Wed, 11 Oct 2023 21:35:40 -0700 (PDT)
X-Received: by 2002:a17:906:144:b0:9b6:5811:d990 with SMTP id 4-20020a170906014400b009b65811d990mr18521896ejh.47.1697085340406;
        Wed, 11 Oct 2023 21:35:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697085340; cv=none;
        d=google.com; s=arc-20160816;
        b=UD9qpFohd6MLzfJa+xU0kiLy95CGOrUroVHsVMpSVXUY/xIM+jOpj6A3j+Afq81csD
         sqDW0nNbGBofXI6EjJ0R2Zx5cxWi/uSwleOIq2F7BOtqkU3yDM1cOBWuMoXzwujgfqYF
         fwR0Xdp+HnLm8TAdyJNMunjD0sD2CxBiMb5eWCtOSxxmVgQA7Igv8zFWw0NdiOSgZhs0
         6eLhbECEO72tnb0FaDLsEeniHHsaKBzEsgneF6V+DiXN0XunzoQXEqhBhH1QRHiwK4Rs
         YFdX8m3n/d6A9VRXmijCM+i2DeUp2kKP1hHFEfFKE0VQ/mRGZJ6HABAcI5mGenXDQdU6
         EnXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=EN0IDyE+rC9sar4CoPaHY6iTywNrc39u7yDiBEnnNqE=;
        fh=tebFjQw8nyYXdpHWOtCSmNiXXYif6WEiSPQxtAL9eeQ=;
        b=wRmVBJ2l09n1qZ9WVuQUiiyy4VpCNT3kajdQL9Jk/bQtx0sQuk3f7KqcbY3PdEwaMo
         HoGAQXlCHZ0bHVn4PdTF/CJ1JNQG5ynETq5D8r2/sQ4L9mkmoYLwPa+fm80W2Es7Tk05
         kXdMtrBlKeQEzJwusVgTHJkOwb6JyIx6j57lpjRaTPhNRo44tDQ+2xnFt//pJ8sJoIcG
         Y96FqXymaxRmH46hvRJNeYfjTDyrS68+cB0QMI2IXj8b+imkqY5cRWw5kcCe6Ql2C+Qg
         RB9RP9QueMPPCe2IIFL5mopPdDn4V2BrOk4eoUtbaoFpULe2GzP3/LRiJHJbIqvBHnpP
         zIXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7dF1w35;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ci18-20020a170907267200b009b2bdbda553sor2786293ejc.13.2023.10.11.21.35.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Oct 2023 21:35:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x7dF1w35;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697085340; x=1697690140; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EN0IDyE+rC9sar4CoPaHY6iTywNrc39u7yDiBEnnNqE=;
        b=x7dF1w3512pljdmRU7zF/8ZLAsEYUa9Eusb8rw+bgA9mxmv6IvBQalW4y/jWaA6e2i
         LTpp0hiEvHf1jDC0J0VE7P7QVg+pEUQZR8MHvqbfRsX3jhGEqUywEuGdxLdqo3FRgag9
         qvrPveNUSxJbW2EeUUkiPYuB59FRjNx85qHrL6SpvDRWDJ2xAas3ck4zN/N/pkC4FQek
         Qv72WH6OHGkqc3Oydsr31D+XeNHDk23F8CGUrx4KKaWTuBw/Z54KwXH1aYveKxVNu+uR
         JLZJqMUbV4V/TVYah1bykVtk3d3gfK4jvicA+VzzzMPS6RI/6Xe7cZc/ruskN1o9EK+l
         e0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697085340; x=1697690140;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EN0IDyE+rC9sar4CoPaHY6iTywNrc39u7yDiBEnnNqE=;
        b=iP4OffBEX+0QF2brTylCYxOfqIiDTPuyL0CI+wbNDH3snTs0XESN0vySb7i/UB+ibT
         h/WBxSlnd+VzivsrON9Haseo/lFa40m4qqDxORqlgTJSRWwZrWi0nXCxh3xc4o9yrIeM
         dcDezC3EI9Sh2IWReUMK1aR7cU04irz2i/zTjp1n/YMwysLkXJN1tpAdaBgITLp5vXQV
         A6rcPWG1OzXXkOzKUxQOrOoqo+kVZhbHXtVOLxpGlEY43+QZpF1vqL3OeYaymxrB7RvG
         QUhLC16uvi+BIIm0CptShHNDT1foEHkclyDjb4JPCw8z8dc/g2nAQ38Ewv0n3+vqrDoa
         MBcg==
X-Gm-Message-State: AOJu0YwA2oc8zG5HpVgVmF9/FHFmJ8qva9i9pUxylf/oHJqJWoCjfDgg
	hrKBop8wuklIM2cNlmYBl69mKRrm
X-Google-Smtp-Source: AGHT+IHqfTTeREdL7UgFh5Cs1S+vNAEcHOZ6kY1eJWqQLNipmRtaXlA6Q2NOzrlmsQEqljXXw+3WBA==
X-Received: by 2002:a17:906:73d3:b0:9b8:df8e:cbda with SMTP id n19-20020a17090673d300b009b8df8ecbdamr19464518ejl.59.1697085340024;
        Wed, 11 Oct 2023 21:35:40 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (dcs23-h01-176-173-173-31.dsl.sta.abo.bbox.fr. [176.173.173.31])
        by smtp.gmail.com with ESMTPSA id e5-20020a17090681c500b00993a37aebc5sm10508006ejx.50.2023.10.11.21.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 21:35:39 -0700 (PDT)
Message-ID: <557f2d41-e605-af72-b9a6-85dd67b310ab@linaro.org>
Date: Thu, 12 Oct 2023 06:35:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [RFC/PATCH v0 08/12] gunyah: Specific device-tree location
Content-Language: en-US
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>, peter.maydell@linaro.org,
 alex.bennee@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com, quic_cvanscha@quicinc.com,
 quic_mnalajal@quicinc.com
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-9-quic_svaddagi@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231011165234.1323725-9-quic_svaddagi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: VIZKqP9tzZjF

On 11/10/23 18:52, Srivatsa Vaddagiri wrote:
> Specify the location of device-tree and its size, as Gunyah requires the
> device-tree to be parsed before VM can begin its execution.
> 
> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
> ---
>   MAINTAINERS             |  1 +
>   hw/arm/virt.c           |  6 ++++++
>   include/sysemu/gunyah.h |  7 +++++++
>   target/arm/gunyah.c     | 45 +++++++++++++++++++++++++++++++++++++++++
>   target/arm/meson.build  |  4 ++++
>   5 files changed, 63 insertions(+)
>   create mode 100644 target/arm/gunyah.c


> diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
> index aded49cdf6..101e190619 100644
> --- a/include/sysemu/gunyah.h
> +++ b/include/sysemu/gunyah.h
> @@ -34,10 +34,17 @@ typedef struct GUNYAHState GUNYAHState;
>   DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
>                            TYPE_GUNYAH_ACCEL)
>   
> +int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);

By moving this declaration before the #ifdef ...

> +
>   #else   /* CONFIG_GUNYAH_IS_POSSIBLE */
>   
>   #define gunyah_enabled()    0
>   
> +static inline int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size)
> +{
> +    return -1;
> +}

... you don't need this stub.

> +
>   #endif  /* CONFIG_GUNYAH_IS_POSSIBLE */
>   
>   #endif  /* QEMU_GUNYAH_H */
