Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp2018830lfj;
        Mon, 17 Jan 2022 04:27:33 -0800 (PST)
X-Received: by 2002:a05:6000:178b:: with SMTP id e11mr16590980wrg.126.1642422453141;
        Mon, 17 Jan 2022 04:27:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642422453; cv=none;
        d=google.com; s=arc-20160816;
        b=IiNLEwqbNb4uAgUhi0bBuvYT2C8HWckGpNB9QeDkU2/gDfeweTy24BLte8Thq+tI7n
         QYGijliG7WaJOTxT2QCf6MQRovojsTgzq7jjS0RqgnXpz/RGphS9NjveWPPkkfkLcSYh
         TKWll7t0li27a+byATtl0ySgVUBdFo+Bax79JD7+8layIYSy9mlKAzaXD9NpfSS0X7Qg
         IpHODyM91AajDAlfVATH0ZuV911+aNjzD80/ZW2lv5ruhfDsrWfkGHF9uiFNKl4C0Rd1
         V86BeXQPgShPmLMYWYheiYtd5Ysq0npfGFEYHtKKQDosolLMMleVJA6oOyojbSkvo3qs
         WlPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=GnX53MrZvincwz9JdkrvjmI09MWRx1r078gan7qeNjI=;
        b=ZWIGIxclpO7jBS3CHvohkCIzvd0aVcmX/sHgovn1zynVwh+Lal8EVawk1Y3/U9M0/U
         tZ/CwOPY0wNMK/ic0Lo/E0vcJKSV+IQuQcLjCG4/7BzqUIiiwkSxnLcP8MWdRaXrm5/w
         weiO4WKFyBhLVV4BAt3s7G05M9MNoJeAfjIclGwwEA8S0fR6QTsRd1yu91V32KARgY8p
         +mKUu8ZTrI/msImgOTtyiDNRlIel+xJA9Pr/DJIwXgsX4EDGQLeznnNSG4sBvxeaJI1W
         Zkr8pMPFSZ4Us4795pAaHfTPFMCnaFf6UhQTNT/zhY4lrFHw8b3dkhJum9A1xYIX0pMZ
         JOpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=koWFFzax;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n1sor6300245wmi.6.2022.01.17.04.27.33
        (Google Transport Security);
        Mon, 17 Jan 2022 04:27:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=koWFFzax;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GnX53MrZvincwz9JdkrvjmI09MWRx1r078gan7qeNjI=;
        b=koWFFzax93kXsPc2+nL86gOJV8HUj1Bd5Lbt7RFpUeYEuCk82bgvlTTrarWF9o6Xpw
         CI/TWRBQw2MIKD5RpxzjTvM+v3Mmo7u8YqIuItZpGp6RGFqXkSwWk5RBCk8QRBaD8WyX
         VBu47VGT5ZPoM3mgizxcNzTlJpFcQmi9Ct+0N8VCUB2o0WVjTqz7O1FpGVqC9SFi7VLa
         GBUN0FI1JDQT3sJQTlAHOTFAihs1D/S4D+YO+R5wh0fnBaOcRMo8jsattGaTW26Rv9/v
         HdiX5VvKWojoAN8ZhjE5vN1YsEB0319HCHIgLwDpTuDzm/Qp1AgVS5pxMK84hvjAVWMH
         bcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GnX53MrZvincwz9JdkrvjmI09MWRx1r078gan7qeNjI=;
        b=TuugHtojVRPfSncabR8PQdwZ0o1BqqdVQ4b8/CUUpHgSpYigiWlRWSfmuqoBoGjkOA
         c+Hm05cOF3G6RtWyO9I+OdHpnQz/mSsojQxr4YvZtDBzg2/L9Y5593nFGEwbMepcg5JM
         l7vA2u8Mi3cX8f5UMYUfunFgcsHCAD8A4epIWmSoNqYfCB7xQ22BnhG0Ylwu7IYCvyCb
         Y+xBE/Yho+FQth/sb+Qx/ziRfA3098au8MufyOT1vUfKr+Vh/c/ZKgXy5rfBREWAwlQC
         rg/d3reZ754AfMyFJ1d8DXK31vENqG6246jlaaBCrUwymtFm8jH/rXdVde2CVHkXT2Tf
         qhWA==
X-Gm-Message-State: AOAM530/uqiO3UGvJk4UtthADpTdWjl+nssFzbmUJ90BAQAPL+4Rk3YE
	qbgOpSUqSTqnvrdRNn0X8MwfTna4zCqtsy+m
X-Google-Smtp-Source: ABdhPJz87um2sYJ6OvTM0/OvuPq/Y6Pabx25ClP+1GFk/rVn/hPvcO0awHGT1xCd/axZbJEwB+qx4w==
X-Received: by 2002:a05:600c:154c:: with SMTP id f12mr24083041wmg.126.1642422452597;
        Mon, 17 Jan 2022 04:27:32 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net. [83.50.83.154])
        by smtp.gmail.com with ESMTPSA id i11sm12892722wrn.59.2022.01.17.04.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 04:27:32 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <4918a992-3903-6b78-c43e-76a487b651f5@amsat.org>
Date: Mon, 17 Jan 2022 13:27:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH 3/6] hw/arm: wire-up memory from the Pico board and
 the SoC
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20220110175104.2908956-1-alex.bennee@linaro.org>
 <20220110175104.2908956-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220110175104.2908956-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: biKnL88dziQN

On 1/10/22 18:51, Alex Bennée wrote:
> All the memory aside from the external flash is a feature of the SoC
> itself. However the flash is part of the board and different RP2040
> boards can choose to wire up different amounts of it.
> 
> For now add unimplemented devices for all the rp2040 peripheral
> blocks. Before we can boot more of the ROM we will need to model at
> least the SIO and CLOCKS blocks.
> 
> For now CPU#1 starts disabled as it needs a working CPUID register so
> it can identify itself before sleeping.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/hw/arm/rp2040.h |   9 +++-
>  hw/arm/raspi_pico.c     |  20 +++++++
>  hw/arm/rp2040.c         | 113 ++++++++++++++++++++++++++++++++++++++--
>  3 files changed, 137 insertions(+), 5 deletions(-)

> +static Property rp2040_soc_properties[] = {
> +    DEFINE_PROP_LINK("memory", RP2040State, memory, TYPE_MEMORY_REGION,
> +                     MemoryRegion *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
>  static void rp2040_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(oc);
> @@ -61,14 +167,13 @@ static void rp2040_class_init(ObjectClass *oc, void *data)
>  
>      bc->cpu_type = ARM_CPU_TYPE_NAME("cortex-m0");
>      dc->realize = rp2040_realize;
> -    /* any props? */
> +    device_class_set_props(dc, rp2040_soc_properties);
>  };
>  
>  static const TypeInfo rp2040_types[] = {
>      {
>          .name           = TYPE_RP2040,
> -        /* .parent         = TYPE_SYS_BUS_DEVICE, */
> -        .parent         = TYPE_DEVICE,
> +        .parent         = TYPE_SYS_BUS_DEVICE,
>          .instance_size  = sizeof(RP2040State),
>          .instance_init  = rp2040_init,
>          .class_size     = sizeof(RP2040Class),

Squash that in patch #1 without any MemoryRegion property?
