Received: by 10.25.0.144 with SMTP id 138csp1113912lfa;
        Sun, 16 Apr 2017 20:11:28 -0700 (PDT)
X-Received: by 10.55.46.194 with SMTP id u185mr6563641qkh.168.1492398688224;
        Sun, 16 Apr 2017 20:11:28 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qk0-x244.google.com (mail-qk0-x244.google.com. [2607:f8b0:400d:c09::244])
        by mx.google.com with ESMTPS id g17si9602430qta.51.2017.04.16.20.11.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Apr 2017 20:11:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) client-ip=2607:f8b0:400d:c09::244;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c09::244 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qk0-x244.google.com with SMTP id v75so17978084qkb.3;
        Sun, 16 Apr 2017 20:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=ExiO6H06UbUbn63c1v178TZx8LTS+xOwaYB6WEdO1+k=;
        b=IdLtugRinv6svfTFtrESB21TaLGICP0D/SZByv0Wn8R2LUIkxkUBsI6mGEUov9fcX6
         h+oh/59361I9L/Od6VKHc1Jg6/y9m39bTpPkg8zvmPJ1Fip4i8ap85fJ/w986a/V3Wzo
         C98b0SFX3IjXRfNNxpfy52yXzp9D66/lUlPWqRM92D6ooM4bkciqJXLySAV+my1e9mTc
         2o4QfMZ/9F6wcSDb8nYbv7hb9bVzN6x/ThpzNxxy6vilgO+hVbTMtbfnymMAru3EtjJk
         TMTMm/TvBrDbh8i8pRq5QNGJUFNRadPsXiDCZTyFIJUkyctb23Dz2XrcwuOBAZj6gs1M
         jVEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=ExiO6H06UbUbn63c1v178TZx8LTS+xOwaYB6WEdO1+k=;
        b=sAOjNYz5mCViNA8sMszAbE+c6W9vkDYa8hVPBW2FG+P7gCTbrf7TzafVkCwixa1MZy
         SK2tgl0+FyIqnHgVoSb8/B9Wnx1FigX6z4p/LhKJCN2f4dKVRwyKxsg22iaurBWCjYGZ
         R3Sl+iaVNjMFQFNNhLa83s0nm5R+uk9le/bwlD6+ammDzhxwPPl38vnUviLt8vMFBsKZ
         FQXOu7VcbP/OPxXvf8BM8EYHiSTtmxAV2nqfazNu6bVST6mZ1j9Y0pNOVoJtJ9ot9pFQ
         BhBEaQs/4fkErChQR9zYixZ9wHu4lylQvmQu5pf66CuI8h4RAa7JMMBjK63+NFa9H7Io
         NZJg==
X-Gm-Message-State: AN3rC/4oZuDFQReW8uBNrOGlXuLfCe3oaSg+0AUoEdyuKyxz2zxuD/xd
	qVHRRgPSMcG8gA==
X-Received: by 10.55.191.69 with SMTP id p66mr6754908qkf.77.1492398687704;
        Sun, 16 Apr 2017 20:11:27 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id m62sm3842816qte.5.2017.04.16.20.11.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Apr 2017 20:11:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 5/9] arm: gic: Remove references to NVIC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-6-git-send-email-peter.maydell@linaro.org>
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver
 <mdavidsaver@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fd287323-58d2-77a6-50b4-99c5f29428bd@amsat.org>
Date: Mon, 17 Apr 2017 00:11:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1486065742-28639-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lQ6cuLQDbUc+

On 02/02/2017 05:02 PM, Peter Maydell wrote:
> From: Michael Davidsaver <mdavidsaver@gmail.com>
>
> Now that the NVIC is its own separate implementation, we can
> clean up the GIC code by removing REV_NVIC and conditionals
> which use it.
>
> Signed-off-by: Michael Davidsaver <mdavidsaver@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/gic_internal.h   |  7 ++-----
>  hw/intc/arm_gic.c        | 31 +++++--------------------------
>  hw/intc/arm_gic_common.c | 23 ++++++++---------------
>  3 files changed, 15 insertions(+), 46 deletions(-)
>
> diff --git a/hw/intc/gic_internal.h b/hw/intc/gic_internal.h
> index 3f31174..7fe87b1 100644
> --- a/hw/intc/gic_internal.h
> +++ b/hw/intc/gic_internal.h
> @@ -25,9 +25,7 @@
>
>  #define ALL_CPU_MASK ((unsigned)(((1 << GIC_NCPU) - 1)))
>
> -/* The NVIC has 16 internal vectors.  However these are not exposed
> -   through the normal GIC interface.  */
> -#define GIC_BASE_IRQ ((s->revision == REV_NVIC) ? 32 : 0)
> +#define GIC_BASE_IRQ 0
>
>  #define GIC_SET_ENABLED(irq, cm) s->irq_state[irq].enabled |= (cm)
>  #define GIC_CLEAR_ENABLED(irq, cm) s->irq_state[irq].enabled &= ~(cm)
> @@ -75,7 +73,6 @@
>
>  /* The special cases for the revision property: */
>  #define REV_11MPCORE 0
> -#define REV_NVIC 0xffffffff
>
>  void gic_set_pending_private(GICState *s, int cpu, int irq);
>  uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs);
> @@ -87,7 +84,7 @@ void gic_set_priority(GICState *s, int cpu, int irq, uint8_t val,
>
>  static inline bool gic_test_pending(GICState *s, int irq, int cm)
>  {
> -    if (s->revision == REV_NVIC || s->revision == REV_11MPCORE) {
> +    if (s->revision == REV_11MPCORE) {
>          return s->irq_state[irq].pending & cm;
>      } else {
>          /* Edge-triggered interrupts are marked pending on a rising edge, but
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 521aac3..8e5a9d8 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -156,17 +156,6 @@ static void gic_set_irq_11mpcore(GICState *s, int irq, int level,
>      }
>  }
>
> -static void gic_set_irq_nvic(GICState *s, int irq, int level,
> -                                 int cm, int target)
> -{
> -    if (level) {
> -        GIC_SET_LEVEL(irq, cm);
> -        GIC_SET_PENDING(irq, target);
> -    } else {
> -        GIC_CLEAR_LEVEL(irq, cm);
> -    }
> -}
> -
>  static void gic_set_irq_generic(GICState *s, int irq, int level,
>                                  int cm, int target)
>  {
> @@ -214,8 +203,6 @@ static void gic_set_irq(void *opaque, int irq, int level)
>
>      if (s->revision == REV_11MPCORE) {
>          gic_set_irq_11mpcore(s, irq, level, cm, target);
> -    } else if (s->revision == REV_NVIC) {
> -        gic_set_irq_nvic(s, irq, level, cm, target);
>      } else {
>          gic_set_irq_generic(s, irq, level, cm, target);
>      }
> @@ -367,7 +354,7 @@ uint32_t gic_acknowledge_irq(GICState *s, int cpu, MemTxAttrs attrs)
>          return 1023;
>      }
>
> -    if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +    if (s->revision == REV_11MPCORE) {
>          /* Clear pending flags for both level and edge triggered interrupts.
>           * Level triggered IRQs will be reasserted once they become inactive.
>           */
> @@ -589,11 +576,6 @@ void gic_complete_irq(GICState *s, int cpu, int irq, MemTxAttrs attrs)
>              DPRINTF("Set %d pending mask %x\n", irq, cm);
>              GIC_SET_PENDING(irq, cm);
>          }
> -    } else if (s->revision == REV_NVIC) {
> -        if (GIC_TEST_LEVEL(irq, cm)) {
> -            DPRINTF("Set nvic %d pending mask %x\n", irq, cm);
> -            GIC_SET_PENDING(irq, cm);
> -        }
>      }
>
>      group = gic_has_groups(s) && GIC_TEST_GROUP(irq, cm);
> @@ -768,7 +750,7 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>      } else if (offset < 0xf10) {
>          goto bad_reg;
>      } else if (offset < 0xf30) {
> -        if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +        if (s->revision == REV_11MPCORE) {
>              goto bad_reg;
>          }
>
> @@ -802,9 +784,6 @@ static uint32_t gic_dist_readb(void *opaque, hwaddr offset, MemTxAttrs attrs)
>              case 2:
>                  res = gic_id_gicv2[(offset - 0xfd0) >> 2];
>                  break;
> -            case REV_NVIC:
> -                /* Shouldn't be able to get here */
> -                abort();
>              default:
>                  res = 0;
>              }
> @@ -1028,7 +1007,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>                  continue; /* Ignore Non-secure access of Group0 IRQ */
>              }
>
> -            if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +            if (s->revision == REV_11MPCORE) {
>                  if (value & (1 << (i * 2))) {
>                      GIC_SET_MODEL(irq + i);
>                  } else {
> @@ -1046,7 +1025,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>          goto bad_reg;
>      } else if (offset < 0xf20) {
>          /* GICD_CPENDSGIRn */
> -        if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +        if (s->revision == REV_11MPCORE) {
>              goto bad_reg;
>          }
>          irq = (offset - 0xf10);
> @@ -1060,7 +1039,7 @@ static void gic_dist_writeb(void *opaque, hwaddr offset,
>          }
>      } else if (offset < 0xf30) {
>          /* GICD_SPENDSGIRn */
> -        if (s->revision == REV_11MPCORE || s->revision == REV_NVIC) {
> +        if (s->revision == REV_11MPCORE) {
>              goto bad_reg;
>          }
>          irq = (offset - 0xf20);
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 4a8df44..70f1134 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -99,9 +99,7 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
>       *  [N+32..N+63] PPIs for CPU 1
>       *   ...
>       */
> -    if (s->revision != REV_NVIC) {
> -        i += (GIC_INTERNAL * s->num_cpu);
> -    }
> +    i += (GIC_INTERNAL * s->num_cpu);
>      qdev_init_gpio_in(DEVICE(s), handler, i);
>
>      for (i = 0; i < s->num_cpu; i++) {
> @@ -121,16 +119,12 @@ void gic_init_irqs_and_mmio(GICState *s, qemu_irq_handler handler,
>      memory_region_init_io(&s->iomem, OBJECT(s), ops, s, "gic_dist", 0x1000);
>      sysbus_init_mmio(sbd, &s->iomem);
>
> -    if (s->revision != REV_NVIC) {
> -        /* This is the main CPU interface "for this core". It is always
> -         * present because it is required by both software emulation and KVM.
> -         * NVIC is not handled here because its CPU interface is different,
> -         * neither it can use KVM.
> -         */
> -        memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
> -                              s, "gic_cpu", s->revision == 2 ? 0x2000 : 0x100);
> -        sysbus_init_mmio(sbd, &s->cpuiomem[0]);
> -    }
> +    /* This is the main CPU interface "for this core". It is always
> +     * present because it is required by both software emulation and KVM.
> +     */
> +    memory_region_init_io(&s->cpuiomem[0], OBJECT(s), ops ? &ops[1] : NULL,
> +                          s, "gic_cpu", s->revision == 2 ? 0x2000 : 0x100);
> +    sysbus_init_mmio(sbd, &s->cpuiomem[0]);
>  }
>
>  static void arm_gic_common_realize(DeviceState *dev, Error **errp)
> @@ -162,7 +156,7 @@ static void arm_gic_common_realize(DeviceState *dev, Error **errp)
>      }
>
>      if (s->security_extn &&
> -        (s->revision == REV_11MPCORE || s->revision == REV_NVIC)) {
> +        (s->revision == REV_11MPCORE)) {
>          error_setg(errp, "this GIC revision does not implement "
>                     "the security extensions");
>          return;
> @@ -255,7 +249,6 @@ static Property arm_gic_common_properties[] = {
>      DEFINE_PROP_UINT32("num-irq", GICState, num_irq, 32),
>      /* Revision can be 1 or 2 for GIC architecture specification
>       * versions 1 or 2, or 0 to indicate the legacy 11MPCore GIC.
> -     * (Internally, 0xffffffff also indicates "not a GIC but an NVIC".)
>       */
>      DEFINE_PROP_UINT32("revision", GICState, revision, 1),
>      /* True if the GIC should implement the security extensions */
>
