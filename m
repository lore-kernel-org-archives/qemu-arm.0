Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp4533351ejq;
        Thu, 11 May 2023 21:02:51 -0700 (PDT)
X-Received: by 2002:a7b:ce0a:0:b0:3f4:239c:f1a with SMTP id m10-20020a7bce0a000000b003f4239c0f1amr11188876wmc.10.1683864171065;
        Thu, 11 May 2023 21:02:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683864171; cv=none;
        d=google.com; s=arc-20160816;
        b=oqyhymmEkERyM/H/fnOdrykuYM9zj+HOnf6JdOZ/v/G5vWylRgCBLMH4uwrZ+dCbKJ
         DwEct4btAC6oBybY/xCm6TaL273y/2Om45pOWEP4aluRdYdEZ3ryey1Sw6vBlYpkqXNA
         sEozJw8CnWVJdWMqfSeZ/i1dwaYgg3MTu5bSVgTJEqL0fvuv4CMiS6ABjwkJUTWlIyvw
         QSwm8rDr2ebSLVTlE5tYwcKK+9aki5jQxyNPXnQ1gSLiC3pIbBZcT6TbOQYAqNZp3M7O
         CEjR3VeuNRePpsxJTkeLyiTPyI45OT6/I3ZY34Hgl5FVEdifxdmuziQaepZfdak5iriC
         O+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=t2o7w8RBwFGak+QYy/6Ay6dkOTj5vbc9lyltm5ngL+A=;
        b=qtLB8Fc2y0Htd+3FOxEo7qR7HOjOJyo64sDk5USTwcIQakgye9X/KBuqFhXras0LRM
         Rwu8wP2KwgCaLB0DsnUk28MS8O1bTFA1ipDimJ0NHejqKaDbHTE0KvO3Tocfw0ig5iZ0
         ohjn/z7v61wInDJntt0Y9k74QojfXKFQ1W0kLRNn3d0uFPMCAtz2Ul25h6LrEdDBWGKv
         7VY4eOoltAZ8q9/SBPQP6tZGS+fwCYpHc5xvpClksQJNOah+3ckHUpFpPvvu3IeT/3bK
         fjwRDmX5nX+WYo/baTtw3czC8VMeIGJz8XjrqjORLpefIr0AYntHXGled9GwLmTeYQDW
         775Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8evVbfY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n9-20020a1c7209000000b003f49a8325b0sor1527523wmc.4.2023.05.11.21.02.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 May 2023 21:02:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r8evVbfY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683864171; x=1686456171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t2o7w8RBwFGak+QYy/6Ay6dkOTj5vbc9lyltm5ngL+A=;
        b=r8evVbfYvi9j9NYAkfZO1GB+LU0VvlbuUhZAH9p6lbSC/tdwTJLAV4iNAMtFzWTzWa
         X2tCgwDCSLzGk61KI7qQwX3yNYH91AUyf56FsL+oA6LTjb9qdoOR2DF4+PW1GnZO2bp0
         ZWMuKiQJ7p9roMnJa0XzbSXOUq8Z3npXCG761XxXEPGtLMFD1UATZvSBYZMw1qOV4NYl
         N6INevl6qkOMW+bzEXpULRJYyDKNb5ABQ5EUr0ikXodDCXtbbbu0YQfhMO08roqQmHEv
         PglMWXz57wZiClqifmNpkbgH1UmanSpV5UYc599dnPKD2frHLMIFJe4WkFcbHG63KP7w
         rIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683864171; x=1686456171;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t2o7w8RBwFGak+QYy/6Ay6dkOTj5vbc9lyltm5ngL+A=;
        b=BDHXN/s4np7GK2UOcYj6wihxefjzhMStjgz4hv65KfyLoNKGgwN7muW8F1NVRmDEbC
         6K8OfGtvW6c9l6HD2X8Z3eejxmPEz5dJ4kVgZGhsi+8tiSGhP4x5Wba22XBvOTAiFW/Q
         gj8tm3SpcynPSnFrE6poMSVIR0eLbEGFXVwsp9eqyD2z3cHqiovfirAbNkZj8d5GB3jJ
         k9mxhL2xFQv2Q8j58g5TBvRfgwcnKEcYVF+tXNH11+Snkg6MUh0pXk5IOHO71dPuWotd
         emQyAYItQTXvkmLc+LbUm95yFm19zHCKGwAWQrEnUdZ90+cKMkXwkNM8VlBw1vw6O3a1
         o6QQ==
X-Gm-Message-State: AC+VfDx5XMQ376JGpMkLw08f6T8sppdafY3/XJVbo5fErM1W0KeTkjjc
	5cvI5G4PRDPNHjDR9maCtG/laTLE
X-Google-Smtp-Source: ACHHUZ7pSX0lcwtx2g1rtX0/FiIA39jLWr1j3u8jts6iD2l3KjBjqGWqYHvYPmxY1QClVIU4RfcYXQ==
X-Received: by 2002:a1c:7413:0:b0:3f4:bb58:d174 with SMTP id p19-20020a1c7413000000b003f4bb58d174mr5209156wmc.22.1683864170687;
        Thu, 11 May 2023 21:02:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.176.152.186])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c219300b003f173419e7asm27067886wme.43.2023.05.11.21.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 21:02:50 -0700 (PDT)
Message-ID: <aa83095b-64f5-584f-8ccc-0e1f6f2e6ae3@linaro.org>
Date: Fri, 12 May 2023 06:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PULL 03/16] ssi: cache SSIPeripheralClass to avoid GET_CLASS()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221025152042.278287-1-clg@kaod.org>
 <20221025152042.278287-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221025152042.278287-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: uTEslobZlfSm

Hi Alex,

On 25/10/22 17:20, Cédric Le Goater wrote:
> From: Alex Bennée <alex.bennee@linaro.org>
> 
> Investigating why some BMC models are so slow compared to a plain ARM
> virt machines I did some profiling of:
> 
>    ./qemu-system-arm -M romulus-bmc -nic user \
>      -drive
>      file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
>      -nographic -serial mon:stdio
> 
> And saw that object_class_dynamic_cast_assert was dominating the
> profile times. We have a number of cases in this model of the SSI bus.
> As the class is static once the object is created we just cache it and
> use it instead of the dynamic case macros.
> 
> Profiling against:
> 
>    ./tests/venv/bin/avocado run \
>      tests/avocado/machine_aspeed.py:test_arm_ast2500_romulus_openbmc_v2_9_0
> 
> Before: 35.565 s ±  0.087 s
> After: 15.713 s ±  0.287 s

Do you remember if you were using --enable-qom-cast-debug when
profiling this?

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cédric Le Goater <clg@kaod.org>
> Tested-by: Cédric Le Goater <clg@kaod.org>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> Message-Id: <20220811151413.3350684-6-alex.bennee@linaro.org>
> Message-Id: <20220923084803.498337-6-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/ssi/ssi.h |  3 +++
>   hw/ssi/ssi.c         | 18 ++++++++----------
>   2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index f411858ab083..6950f86810d3 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -59,6 +59,9 @@ struct SSIPeripheralClass {
>   struct SSIPeripheral {
>       DeviceState parent_obj;
>   
> +    /* cache the class */
> +    SSIPeripheralClass *spc;
> +
>       /* Chip select state */
>       bool cs;
>   };
> diff --git a/hw/ssi/ssi.c b/hw/ssi/ssi.c
> index 003931fb509e..d54a109beeb5 100644
> --- a/hw/ssi/ssi.c
> +++ b/hw/ssi/ssi.c
> @@ -38,9 +38,8 @@ static void ssi_cs_default(void *opaque, int n, int level)
>       bool cs = !!level;
>       assert(n == 0);
>       if (s->cs != cs) {
> -        SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(s);
> -        if (ssc->set_cs) {
> -            ssc->set_cs(s, cs);
> +        if (s->spc->set_cs) {
> +            s->spc->set_cs(s, cs);
>           }
>       }
>       s->cs = cs;
> @@ -48,11 +47,11 @@ static void ssi_cs_default(void *opaque, int n, int level)
>   
>   static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev, uint32_t val)
>   {
> -    SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev);
> +    SSIPeripheralClass *ssc = dev->spc;
>   
>       if ((dev->cs && ssc->cs_polarity == SSI_CS_HIGH) ||
> -            (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
> -            ssc->cs_polarity == SSI_CS_NONE) {
> +        (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
> +        ssc->cs_polarity == SSI_CS_NONE) {
>           return ssc->transfer(dev, val);
>       }
>       return 0;
> @@ -67,6 +66,7 @@ static void ssi_peripheral_realize(DeviceState *dev, Error **errp)
>               ssc->cs_polarity != SSI_CS_NONE) {
>           qdev_init_gpio_in_named(dev, ssi_cs_default, SSI_GPIO_CS, 1);
>       }
> +    s->spc = ssc;
>   
>       ssc->realize(s, errp);
>   }
> @@ -115,13 +115,11 @@ uint32_t ssi_transfer(SSIBus *bus, uint32_t val)
>   {
>       BusState *b = BUS(bus);
>       BusChild *kid;
> -    SSIPeripheralClass *ssc;
>       uint32_t r = 0;
>   
>       QTAILQ_FOREACH(kid, &b->children, sibling) {
> -        SSIPeripheral *peripheral = SSI_PERIPHERAL(kid->child);
> -        ssc = SSI_PERIPHERAL_GET_CLASS(peripheral);
> -        r |= ssc->transfer_raw(peripheral, val);
> +        SSIPeripheral *p = SSI_PERIPHERAL(kid->child);
> +        r |= p->spc->transfer_raw(p, val);
>       }
>   
>       return r;
