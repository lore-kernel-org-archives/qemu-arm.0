Received: by 10.223.159.74 with SMTP id f10csp2368142wrg;
        Mon, 4 Dec 2017 20:14:06 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZIEWUhXGr+VV4dAefqEDcIrC77OaomfVEHKKakk0/66zHdp2E6FpH15T/dpPGo95QaiJGB
X-Received: by 10.37.219.209 with SMTP id g200mr10900880ybf.508.1512447246301;
        Mon, 04 Dec 2017 20:14:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512447246; cv=none;
        d=google.com; s=arc-20160816;
        b=K9U+xRhcg77oFREB23S7krdGhS1JH7Mr7DDD2Q0qBBn8dHkj/9dQCQlxEHVWhKIN3d
         ere7TazCVl2K1Rczg5G3HTyDkUKeqJ2FKbaURRegTamBdxpZKARNhwOXrPlFFHg/Sobv
         nGusw/1uXoIeuRBC7YGd6psX5ESkCNNO7mRaAoJcNFy7KTYbf0XaGovJ5Xkq//OMRveL
         UPKCDr3xfggITdw26WwfFrktjAFkaq3P1IMs2cPP81WUfaV4d1uGNYs0Xp8h9MKAQrNN
         E17InC8P1HZ7Xn2mg6juTVmF35aKl0rNOh1d6UMW0Z8tkYAf/08jdhypQ9QR3Cpcum1G
         66BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=KHF1fT6heaHY3OU5zW0cgdQ3YdSmX6e907hDeTFJgnY=;
        b=OyGv9EJL8Tud2XzfJez2Ct67+F017dxYvKFp+T4/l3fKDTCelD0fALVT07ewGFU7hM
         QPOfS8MeRVisQ9FIvOH+n/3YAOZ5sOck6rROdu0Z3Y08VHTGfbTtdOGE72QFhvG524El
         OOe66tmGopnUlTfAcvmU4DnuIPEpTnZs7mnL0Mtq2Zz6ixTjHKKRx/hgaQNqdXXNTc6M
         iUIeAeymJZklN+cfz/ovnVDBkQNpKrfoXnRE3/SZbqIJ5/0HgjEOGRiXqVGtAv4jtv3e
         3Tqt+5DSt4TwRdD1LK6v3OU+4MjcLNxlTFe1bA7zM7BBaX+UkC85AicchFyProcv7gmV
         vDMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YIZMWcor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n204si329008ywb.515.2017.12.04.20.14.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Dec 2017 20:14:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YIZMWcor;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46317 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eM4cP-00050b-NJ
	for alex.bennee@linaro.org; Mon, 04 Dec 2017 23:14:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38931)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4cD-0004yM-3T
	for qemu-arm@nongnu.org; Mon, 04 Dec 2017 23:13:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4cB-0006RF-Ot
	for qemu-arm@nongnu.org; Mon, 04 Dec 2017 23:13:53 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:45533)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eM4c3-0006Hm-Ml; Mon, 04 Dec 2017 23:13:43 -0500
Received: by mail-qt0-x242.google.com with SMTP id g10so26175599qtj.12;
	Mon, 04 Dec 2017 20:13:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=KHF1fT6heaHY3OU5zW0cgdQ3YdSmX6e907hDeTFJgnY=;
	b=YIZMWcor9qxjltkL6F5JqDj95HhOLpEEyZvTdb93CVrNpuIY2TLnGK0JFTCWHafoN+
	IR9mFOy+c5sphMqGqzNIohPZEF2MpznDNX1OO9B8QksRg9QBj+/NzHMhoI3xrF1/eCxs
	PYT5gWG9vjU3vijHmEnDxm7nMrhVNfQOG6hDM/cspG9nTg5wIHWGXIgT4N+CIzDnT6JA
	KUtJRtIqa9TCdlGZDwW31vQd7u23RKznqYO/AtdNI0p8ClS3ukmx+Tr9AQoue3PsO1AU
	ePjMN/gyADfnUZ984ue5T7fj0wE1YEuTNV/Vs193RgP5XBehYQc6Bo3dTOx2o01Kbr2e
	mBEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=KHF1fT6heaHY3OU5zW0cgdQ3YdSmX6e907hDeTFJgnY=;
	b=pEztBihwCxU+fd9TOkcS/qNPdICfN6Vl9ngO1b7h2HD76GThdKxs31XRwUYCFYD8QQ
	kvNJkzfKBW16ujfj42qD/+ziXjPV0uboXJdIOLTzaSFO6QJdYA26Y75ozl8LYQT33xYk
	PwbhLGa/uYoWwciwPoRQ/C0egUNyxjFuyuuBv9efs0DaH7LxFtPGtxhkiXyKeT/uhVvN
	HRPdPBTq6TAdxxlJrUqJ8UxI98QTiYSkFp5AtfQBVNd8/HOU4+w5TL4/oa80FvAATEbF
	RjFdMIRPMw0PH5HqnHmVkU+XNfhFTkwR/NhqhFGGYXdgVTCjultG6vqgGDybmlCpQ/gt
	DMSw==
X-Gm-Message-State: AKGB3mITogTWuA42BxOUa/043fldKcMD1iOF8h+jHlVHVk/XvkNLaOYE
	zQsp4yrO27nd/Cfjo3vr07g=
X-Received: by 10.55.192.90 with SMTP id o87mr22256961qki.15.1512447223059;
	Mon, 04 Dec 2017 20:13:43 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.211])
	by smtp.gmail.com with ESMTPSA id
	w41sm10149507qtc.19.2017.12.04.20.13.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Dec 2017 20:13:42 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1512154296-5652-1-git-send-email-peter.maydell@linaro.org>
	<1512154296-5652-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b8fdafd1-d8d8-056f-681e-d5469dc79edd@amsat.org>
Date: Tue, 5 Dec 2017 01:13:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512154296-5652-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-arm] [PATCH 2/2] nvic: Make systick banked
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SkhzGZhTziSr

Hi Peter,

On 12/01/2017 03:51 PM, Peter Maydell wrote:
> For the v8M security extension, there should be two systick
> devices, which use separate banked systick exceptions. The
> register interface is banked in the same way as for other
> banked registers, including the existence of an NS alias
> region for secure code to access the nonsecure timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/intc/armv7m_nvic.h |  4 ++-
>  hw/intc/armv7m_nvic.c         | 81 ++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 72 insertions(+), 13 deletions(-)
> 
> diff --git a/include/hw/intc/armv7m_nvic.h b/include/hw/intc/armv7m_nvic.h
> index ac7997c..8bc2911 100644
> --- a/include/hw/intc/armv7m_nvic.h
> +++ b/include/hw/intc/armv7m_nvic.h
> @@ -78,13 +78,15 @@ typedef struct NVICState {
>  
>      MemoryRegion sysregmem;
>      MemoryRegion sysreg_ns_mem;
> +    MemoryRegion systickmem;
> +    MemoryRegion systick_ns_mem;
>      MemoryRegion container;
>  
>      uint32_t num_irq;
>      qemu_irq excpout;
>      qemu_irq sysresetreq;
>  
> -    SysTickState systick;
> +    SysTickState systick[M_REG_NUM_BANKS];
>  } NVICState;
>  
>  #endif
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 63f2743..5cb44f4 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -1827,6 +1827,36 @@ static const MemoryRegionOps nvic_sysreg_ns_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>  
> +static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
> +                                      uint64_t value, unsigned size,
> +                                      MemTxAttrs attrs)
> +{
> +    NVICState *s = opaque;
> +    MemoryRegion *mr;
> +
> +    /* Direct the access to the correct systick */
> +    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> +    return memory_region_dispatch_write(mr, addr, value, size, attrs);
> +}
> +
> +static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
> +                                     uint64_t *data, unsigned size,
> +                                     MemTxAttrs attrs)
> +{
> +    NVICState *s = opaque;
> +    MemoryRegion *mr;
> +
> +    /* Direct the access to the correct systick */
> +    mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
> +    return memory_region_dispatch_read(mr, addr, data, size, attrs);
> +}
> +
> +static const MemoryRegionOps nvic_systick_ops = {
> +    .read_with_attrs = nvic_systick_read,
> +    .write_with_attrs = nvic_systick_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +};
> +
>  static int nvic_post_load(void *opaque, int version_id)
>  {
>      NVICState *s = opaque;
> @@ -2005,17 +2035,16 @@ static void nvic_systick_trigger(void *opaque, int n, int level)
>          /* SysTick just asked us to pend its exception.
>           * (This is different from an external interrupt line's
>           * behaviour.)
> -         * TODO: when we implement the banked systicks we must make
> -         * this pend the correct banked exception.
> +         * n == 0 : NonSecure systick
> +         * n == 1 : Secure systick
>           */
> -        armv7m_nvic_set_pending(s, ARMV7M_EXCP_SYSTICK, false);
> +        armv7m_nvic_set_pending(s, ARMV7M_EXCP_SYSTICK, n);
>      }
>  }
>  
>  static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>  {
>      NVICState *s = NVIC(dev);
> -    SysBusDevice *systick_sbd;
>      Error *err = NULL;
>      int regionlen;
>  
> @@ -2032,15 +2061,30 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>      /* include space for internal exception vectors */
>      s->num_irq += NVIC_FIRST_IRQ;
>  
> -    object_property_set_bool(OBJECT(&s->systick), true, "realized", &err);
> +    object_property_set_bool(OBJECT(&s->systick[M_REG_NS]), true,
> +                             "realized", &err);
>      if (err != NULL) {
>          error_propagate(errp, err);
>          return;
>      }
> -    systick_sbd = SYS_BUS_DEVICE(&s->systick);
> -    sysbus_connect_irq(systick_sbd, 0,
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), 0,
>                         qdev_get_gpio_in_named(dev, "systick-trigger", 0));
>  
> +    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY)) {
> +        object_initialize(&s->systick[M_REG_S], sizeof(s->systick[M_REG_NS]),
> +                          TYPE_SYSTICK);
> +        qdev_set_parent_bus(DEVICE(&s->systick[M_REG_S]), sysbus_get_default());

I got stuck here some time wondering why you init the S systick in this
realize(), then continue and read your comment in
armv7m_nvic_instance_init() and it made sens. I'm tempted to add a
similar comment here.

> +
> +        object_property_set_bool(OBJECT(&s->systick[M_REG_S]), true,
> +                                 "realized", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        sysbus_connect_irq(SYS_BUS_DEVICE(&s->systick[M_REG_S]), 0,
> +                           qdev_get_gpio_in_named(dev, "systick-trigger", 1));
> +    }
> +
>      /* The NVIC and System Control Space (SCS) starts at 0xe000e000
>       * and looks like this:
>       *  0x004 - ICTR
> @@ -2073,15 +2117,24 @@ static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&s->sysregmem, OBJECT(s), &nvic_sysreg_ops, s,
>                            "nvic_sysregs", 0x1000);
>      memory_region_add_subregion(&s->container, 0, &s->sysregmem);
> +
> +    memory_region_init_io(&s->systickmem, OBJECT(s),
> +                          &nvic_systick_ops, s,
> +                          "nvic_systick", 0xe0);
> +
>      memory_region_add_subregion_overlap(&s->container, 0x10,
> -                                        sysbus_mmio_get_region(systick_sbd, 0),
> -                                        1);
> +                                        &s->systickmem, 1);
>  
>      if (arm_feature(&s->cpu->env, ARM_FEATURE_V8)) {
>          memory_region_init_io(&s->sysreg_ns_mem, OBJECT(s),
>                                &nvic_sysreg_ns_ops, &s->sysregmem,
>                                "nvic_sysregs_ns", 0x1000);
>          memory_region_add_subregion(&s->container, 0x20000, &s->sysreg_ns_mem);
> +        memory_region_init_io(&s->systick_ns_mem, OBJECT(s),
> +                              &nvic_sysreg_ns_ops, &s->systickmem,
> +                              "nvic_systick_ns", 0xe0);
> +        memory_region_add_subregion_overlap(&s->container, 0x20010,
> +                                            &s->systick_ns_mem, 1);
>      }
>  
>      sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->container);
> @@ -2099,12 +2152,16 @@ static void armv7m_nvic_instance_init(Object *obj)
>      NVICState *nvic = NVIC(obj);
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>  
> -    object_initialize(&nvic->systick, sizeof(nvic->systick), TYPE_SYSTICK);
> -    qdev_set_parent_bus(DEVICE(&nvic->systick), sysbus_get_default());
> +    object_initialize(&nvic->systick[M_REG_NS],
> +                      sizeof(nvic->systick[M_REG_NS]), TYPE_SYSTICK);
> +    qdev_set_parent_bus(DEVICE(&nvic->systick[M_REG_NS]), sysbus_get_default());
> +    /* We can't initialize the secure systick here, as we don't know
> +     * yet if we need it.
> +     */
>  
>      sysbus_init_irq(sbd, &nvic->excpout);
>      qdev_init_gpio_out_named(dev, &nvic->sysresetreq, "SYSRESETREQ", 1);
> -    qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger", 1);
> +    qdev_init_gpio_in_named(dev, nvic_systick_trigger, "systick-trigger", 2);

Using this #define helps (me) while reviewing:

    qdev_init_gpio_in_named(dev, nvic_systick_trigger,
                            "systick-trigger", M_REG_NUM_BANKS);

One more line but you are still under a 100 diffstat series ;)

Anyway:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>  }
>  
>  static void armv7m_nvic_class_init(ObjectClass *klass, void *data)
> 
