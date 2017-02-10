Received: by 10.25.77.65 with SMTP id a62csp506894lfb;
        Fri, 10 Feb 2017 06:23:06 -0800 (PST)
X-Received: by 10.55.33.136 with SMTP id f8mr8961904qki.132.1486736586227;
        Fri, 10 Feb 2017 06:23:06 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-qt0-x241.google.com (mail-qt0-x241.google.com. [2607:f8b0:400d:c0d::241])
        by mx.google.com with ESMTPS id q124si1341377qkd.203.2017.02.10.06.23.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 06:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) client-ip=2607:f8b0:400d:c0d::241;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 2607:f8b0:400d:c0d::241 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Received: by mail-qt0-x241.google.com with SMTP id n13so4721304qtc.0;
        Fri, 10 Feb 2017 06:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=xnma+PjvgSDKanO9ttb70r9zcKXFTzyBslSvoavcMvc=;
        b=pJz+Kk/HAXnL7zfpBzUbNT2M8eTRvAGlgBOcV22XcHyeFWAiPV8VRyWLC7sJqmOa88
         QWEZ38I4UGqgjAO82hogQTcU2oggZm5abu9ZE9uUetnGDNs9obfIIW2uaVXSo3FlGg/R
         niplx+AYA624OljfH3RS+6kyyG825jV+eZfK5WEk3jXH/4X5Qr6heE763HEGvfO7Ekss
         hyDA58HUTQ2odY11S8RcIdoICIkfyzkUVV0pl+EbSRvissiKPInctAZeK6kdKP6xlw5h
         P18Xnb+oF/UkthwKsfoCSPmCJv7Hwd0SNOscdl86K9hegHaGZFNYTWUOyCs5r+G0zp0c
         zwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=xnma+PjvgSDKanO9ttb70r9zcKXFTzyBslSvoavcMvc=;
        b=MP5INJmQKrfg9a1cgQO0a6Q5VbDG79Ixk0K1EHGZq2jGN1vlTUZ7MsR1tSDS/sWDxd
         CnIelUds8b5DKvibUxbDMLZ/EPynYRyc2PS9f4glUKMvrOSwoFNer9cn6XOtmaiJrJjh
         bk9K9nLg4VzxKNcZfbNNT2LmD9y4sLdZrBr0nWJeYUVuGGzVoAV2icWVvic9bfZVv1Ig
         oWCC0/MfQchqMBjZtcI6SjH6MBj5TDznpDauIIWO/qLcFH6QDpkFAeo/2SD7DyXdv3rz
         QPhCx/Ya+5xn5odfCKTajRHmniUJ3nbxSYYp6EpZ/buuL8Y219oht6Pg/M6Kmtfh2Oho
         yp+g==
X-Gm-Message-State: AMke39lHLj6PEHq1wRpapCGM4fMO3F4kAszqu1o3GMW9OC2It8B1u1VOx2kS+303Lo+C8w==
X-Received: by 10.200.47.129 with SMTP id l1mr8108168qta.148.1486736585579;
        Fri, 10 Feb 2017 06:23:05 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.10] ([138.117.48.226])
        by smtp.gmail.com with ESMTPSA id i132sm1650706qke.44.2017.02.10.06.23.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Feb 2017 06:23:04 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 1/9] armv7m: Rename nvic_state to NVICState
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <1486065742-28639-1-git-send-email-peter.maydell@linaro.org>
 <1486065742-28639-2-git-send-email-peter.maydell@linaro.org>
Cc: Liviu Ionescu <ilg@livius.net>, Michael Davidsaver
 <mdavidsaver@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, patches@linaro.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e040715d-5d3a-fe9a-eeae-776250fe5f61@amsat.org>
Date: Fri, 10 Feb 2017 11:23:01 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1486065742-28639-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6uKx8zg8BdYN

On 02/02/2017 05:02 PM, Peter Maydell wrote:
> Rename the nvic_state struct to NVICState, to match
> our naming conventions.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/intc/armv7m_nvic.c | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index fe5c303..09975f3 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -21,7 +21,7 @@
>  #include "gic_internal.h"
>  #include "qemu/log.h"
>
> -typedef struct {
> +typedef struct NVICState {
>      GICState gic;
>      ARMCPU *cpu;
>      struct {
> @@ -35,7 +35,7 @@ typedef struct {
>      MemoryRegion container;
>      uint32_t num_irq;
>      qemu_irq sysresetreq;
> -} nvic_state;
> +} NVICState;
>
>  #define TYPE_NVIC "armv7m_nvic"
>  /**
> @@ -57,7 +57,7 @@ typedef struct NVICClass {
>  #define NVIC_GET_CLASS(obj) \
>      OBJECT_GET_CLASS(NVICClass, (obj), TYPE_NVIC)
>  #define NVIC(obj) \
> -    OBJECT_CHECK(nvic_state, (obj), TYPE_NVIC)
> +    OBJECT_CHECK(NVICState, (obj), TYPE_NVIC)
>
>  static const uint8_t nvic_id[] = {
>      0x00, 0xb0, 0x1b, 0x00, 0x0d, 0xe0, 0x05, 0xb1
> @@ -74,7 +74,7 @@ static const uint8_t nvic_id[] = {
>  int system_clock_scale;
>
>  /* Conversion factor from qemu timer to SysTick frequencies.  */
> -static inline int64_t systick_scale(nvic_state *s)
> +static inline int64_t systick_scale(NVICState *s)
>  {
>      if (s->systick.control & SYSTICK_CLKSOURCE)
>          return system_clock_scale;
> @@ -82,7 +82,7 @@ static inline int64_t systick_scale(nvic_state *s)
>          return 1000;
>  }
>
> -static void systick_reload(nvic_state *s, int reset)
> +static void systick_reload(NVICState *s, int reset)
>  {
>      /* The Cortex-M3 Devices Generic User Guide says that "When the
>       * ENABLE bit is set to 1, the counter loads the RELOAD value from the
> @@ -101,7 +101,7 @@ static void systick_reload(nvic_state *s, int reset)
>
>  static void systick_timer_tick(void * opaque)
>  {
> -    nvic_state *s = (nvic_state *)opaque;
> +    NVICState *s = (NVICState *)opaque;
>      s->systick.control |= SYSTICK_COUNTFLAG;
>      if (s->systick.control & SYSTICK_TICKINT) {
>          /* Trigger the interrupt.  */
> @@ -114,7 +114,7 @@ static void systick_timer_tick(void * opaque)
>      }
>  }
>
> -static void systick_reset(nvic_state *s)
> +static void systick_reset(NVICState *s)
>  {
>      s->systick.control = 0;
>      s->systick.reload = 0;
> @@ -126,7 +126,7 @@ static void systick_reset(nvic_state *s)
>     IRQ is #16.  The internal GIC routines use #32 as the first IRQ.  */
>  void armv7m_nvic_set_pending(void *opaque, int irq)
>  {
> -    nvic_state *s = (nvic_state *)opaque;
> +    NVICState *s = (NVICState *)opaque;
>      if (irq >= 16)
>          irq += 16;
>      gic_set_pending_private(&s->gic, 0, irq);
> @@ -135,7 +135,7 @@ void armv7m_nvic_set_pending(void *opaque, int irq)
>  /* Make pending IRQ active.  */
>  int armv7m_nvic_acknowledge_irq(void *opaque)
>  {
> -    nvic_state *s = (nvic_state *)opaque;
> +    NVICState *s = (NVICState *)opaque;
>      uint32_t irq;
>
>      irq = gic_acknowledge_irq(&s->gic, 0, MEMTXATTRS_UNSPECIFIED);
> @@ -148,13 +148,13 @@ int armv7m_nvic_acknowledge_irq(void *opaque)
>
>  void armv7m_nvic_complete_irq(void *opaque, int irq)
>  {
> -    nvic_state *s = (nvic_state *)opaque;
> +    NVICState *s = (NVICState *)opaque;
>      if (irq >= 16)
>          irq += 16;
>      gic_complete_irq(&s->gic, 0, irq, MEMTXATTRS_UNSPECIFIED);
>  }
>
> -static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
> +static uint32_t nvic_readl(NVICState *s, uint32_t offset)
>  {
>      ARMCPU *cpu = s->cpu;
>      uint32_t val;
> @@ -294,7 +294,7 @@ static uint32_t nvic_readl(nvic_state *s, uint32_t offset)
>      }
>  }
>
> -static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
> +static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value)
>  {
>      ARMCPU *cpu = s->cpu;
>      uint32_t oldval;
> @@ -425,7 +425,7 @@ static void nvic_writel(nvic_state *s, uint32_t offset, uint32_t value)
>  static uint64_t nvic_sysreg_read(void *opaque, hwaddr addr,
>                                   unsigned size)
>  {
> -    nvic_state *s = (nvic_state *)opaque;
> +    NVICState *s = (NVICState *)opaque;
>      uint32_t offset = addr;
>      int i;
>      uint32_t val;
> @@ -454,7 +454,7 @@ static uint64_t nvic_sysreg_read(void *opaque, hwaddr addr,
>  static void nvic_sysreg_write(void *opaque, hwaddr addr,
>                                uint64_t value, unsigned size)
>  {
> -    nvic_state *s = (nvic_state *)opaque;
> +    NVICState *s = (NVICState *)opaque;
>      uint32_t offset = addr;
>      int i;
>
> @@ -486,17 +486,17 @@ static const VMStateDescription vmstate_nvic = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> -        VMSTATE_UINT32(systick.control, nvic_state),
> -        VMSTATE_UINT32(systick.reload, nvic_state),
> -        VMSTATE_INT64(systick.tick, nvic_state),
> -        VMSTATE_TIMER_PTR(systick.timer, nvic_state),
> +        VMSTATE_UINT32(systick.control, NVICState),
> +        VMSTATE_UINT32(systick.reload, NVICState),
> +        VMSTATE_INT64(systick.tick, NVICState),
> +        VMSTATE_TIMER_PTR(systick.timer, NVICState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
>
>  static void armv7m_nvic_reset(DeviceState *dev)
>  {
> -    nvic_state *s = NVIC(dev);
> +    NVICState *s = NVIC(dev);
>      NVICClass *nc = NVIC_GET_CLASS(s);
>      nc->parent_reset(dev);
>      /* Common GIC reset resets to disabled; the NVIC doesn't have
> @@ -513,7 +513,7 @@ static void armv7m_nvic_reset(DeviceState *dev)
>
>  static void armv7m_nvic_realize(DeviceState *dev, Error **errp)
>  {
> -    nvic_state *s = NVIC(dev);
> +    NVICState *s = NVIC(dev);
>      NVICClass *nc = NVIC_GET_CLASS(s);
>      Error *local_err = NULL;
>
> @@ -569,7 +569,7 @@ static void armv7m_nvic_instance_init(Object *obj)
>       */
>      GICState *s = ARM_GIC_COMMON(obj);
>      DeviceState *dev = DEVICE(obj);
> -    nvic_state *nvic = NVIC(obj);
> +    NVICState *nvic = NVIC(obj);
>      /* The ARM v7m may have anything from 0 to 496 external interrupt
>       * IRQ lines. We default to 64. Other boards may differ and should
>       * set the num-irq property appropriately.
> @@ -594,7 +594,7 @@ static const TypeInfo armv7m_nvic_info = {
>      .name          = TYPE_NVIC,
>      .parent        = TYPE_ARM_GIC_COMMON,
>      .instance_init = armv7m_nvic_instance_init,
> -    .instance_size = sizeof(nvic_state),
> +    .instance_size = sizeof(NVICState),
>      .class_init    = armv7m_nvic_class_init,
>      .class_size    = sizeof(NVICClass),
>  };
>
