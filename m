Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp347863lfg;
        Tue, 17 Aug 2021 02:33:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8AfsVTPBn1xgfXqLhDLONdF2MKxrvO8akR6v4U5HCWWh+DmLE4qbrSqe8XUXxUNvFkKhw
X-Received: by 2002:a67:f490:: with SMTP id o16mr1766397vsn.57.1629192802519;
        Tue, 17 Aug 2021 02:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629192802; cv=none;
        d=google.com; s=arc-20160816;
        b=B3NIRhPAVr3QTge6qnVJHahKTImRH2c7hSGPvUxuO57kNlri1JlNmqUnsSjGE/f8bO
         7yoOWF/ifG+LUoUbDLNvQoYRfLW32uv2aql25wrM96EZazs6diiepAGKUzZaTsooVwvU
         T7buPk6VAcuYv0V2vTkvZxfsjq/3mFU3oXMqhekIw3I5jqtk+LD0BgzgBXISUMGLUuwr
         vQFOh4SIBmV/2Z06CgBb1Ndf5N1wNqOwJcciIJ66BGpbEloXgStCLMHvocVx20eK+XBU
         c2miC8SY+W73gU0popru2LOcd6XFKqegh3s8Nggt0gLDcwXO/3MsqVi/fTIjDJzm4OF3
         YK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=VyJ0GRCLg2eM6lXyjBhCquG669dGpXhKN4eB0u/eZDY=;
        b=uCcdpBoEIzL9Q/zUlbq8Cl3Uv5f322gbSKzhNtEOSU5xZTaGh0vZPGQavFzDu5vFCA
         ay7M751p8WF7MG8BexHtWF9ZqCdwlRANDnAeOGum1NdSJzcxvtV0p+T12bv807271sSJ
         wsF8ZXMCJy4tFRigFRCRwvHfVDu1+yWd1MBZyJ7skPNDRtoFJ3KHYk5X0NH4I1vnQ3MU
         9U7bzoCSmUlD+gvxKdJE4uauOC66Cw6TtiOlLZmI9xFrgUS0Sf49k/72AjQOzuBcM3WY
         3TQ9a5IXJLiCVfLF1kxu0s3iWze8JObGpA9XvqSeCWDuTrIvfKsyCq2rtqot7EGlx3BR
         FlzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=DWBAXRkY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si681455uap.115.2021.08.17.02.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Aug 2021 02:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@lmichel.fr header.s=pharaoh header.b=DWBAXRkY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=lmichel.fr
Received: from localhost ([::1]:40876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mFvTF-0003rE-LP
	for alex.bennee@linaro.org; Tue, 17 Aug 2021 05:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvSE-0002Tw-Ui; Tue, 17 Aug 2021 05:32:20 -0400
Received: from pharaoh.lmichel.fr ([149.202.28.74]:54124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1mFvSC-0001vR-1e; Tue, 17 Aug 2021 05:32:17 -0400
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 1E277C6019D;
 Tue, 17 Aug 2021 11:32:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1629192734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VyJ0GRCLg2eM6lXyjBhCquG669dGpXhKN4eB0u/eZDY=;
 b=DWBAXRkY72YMIaI1x8dKwxjcK2+ukVzfEvCfPXQ3IGbfwCv+hEwTvjwPOwZRVI5XZBaHOx
 upz+g6sWDJMaGgS8o78xEoFnvo0M/holWhubQXvFcgFKdsrowT1IbvMDY2iU4tDQxcspI6
 logpTibWVloXF9SbkdeNGbZ0+PKMfGWXomAt4Oqbi1mTV1AOp8rTsfScqDtMP2/HIWrSi/
 Ub4j+i+9N2urovr85DnVYM5aMUj8r5pMOy5m9L9GvDwFXzKb8R8lrQ5O8U2OLEmN4qwo8G
 AFxvvdMHRLW+UtugRqgPNZBISkf3Qk+FBeU2jXDAv8LpXa9IIoUMfvj6VTFUtA==
Date: Tue, 17 Aug 2021 11:34:26 +0200
From: Luc Michel <luc@lmichel.fr>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 06/25] hw/arm/armv7m: Create input clocks
Message-ID: <20210817093426.gndowlsipblhcwef@sekoia-pc.home.lmichel.fr>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-7-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210812093356.1946-7-peter.maydell@linaro.org>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>, Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q17Rt8dePhSe

On 10:33 Thu 12 Aug     , Peter Maydell wrote:
> Create input clocks on the armv7m container object which pass through
> to the systick timers, so that users of the armv7m object can specify
> the clocks being used.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Luc Michel <luc@lmichel.fr>

> ---
>  include/hw/arm/armv7m.h |  6 ++++++
>  hw/arm/armv7m.c         | 23 +++++++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index fe8b248a6c6..b7ba0ff409c 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -15,6 +15,7 @@
>  #include "hw/misc/armv7m_ras.h"
>  #include "target/arm/idau.h"
>  #include "qom/object.h"
> +#include "hw/clock.h"
>  
>  #define TYPE_BITBAND "ARM-bitband-memory"
>  OBJECT_DECLARE_SIMPLE_TYPE(BitBandState, BITBAND)
> @@ -51,6 +52,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MState, ARMV7M)
>   * + Property "vfp": enable VFP (forwarded to CPU object)
>   * + Property "dsp": enable DSP (forwarded to CPU object)
>   * + Property "enable-bitband": expose bitbanded IO
> + * + Clock input "refclk" is the external reference clock for the systick timers
> + * + Clock input "cpuclk" is the main CPU clock
>   */
>  struct ARMv7MState {
>      /*< private >*/
> @@ -82,6 +85,9 @@ struct ARMv7MState {
>      /* MR providing default PPB behaviour */
>      MemoryRegion defaultmem;
>  
> +    Clock *refclk;
> +    Clock *cpuclk;
> +
>      /* Properties */
>      char *cpu_type;
>      /* MemoryRegion the board provides to us (with its devices, RAM, etc) */
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 7e7fb7a3ad3..db1bfa98df0 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -14,12 +14,14 @@
>  #include "hw/arm/boot.h"
>  #include "hw/loader.h"
>  #include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
>  #include "elf.h"
>  #include "sysemu/reset.h"
>  #include "qemu/error-report.h"
>  #include "qemu/module.h"
>  #include "qemu/log.h"
>  #include "target/arm/idau.h"
> +#include "migration/vmstate.h"
>  
>  /* Bitbanded IO.  Each word corresponds to a single bit.  */
>  
> @@ -265,6 +267,9 @@ static void armv7m_instance_init(Object *obj)
>          object_initialize_child(obj, "bitband[*]", &s->bitband[i],
>                                  TYPE_BITBAND);
>      }
> +
> +    s->refclk = qdev_init_clock_in(DEVICE(obj), "refclk", NULL, NULL, 0);
> +    s->cpuclk = qdev_init_clock_in(DEVICE(obj), "cpuclk", NULL, NULL, 0);
>  }
>  
>  static void armv7m_realize(DeviceState *dev, Error **errp)
> @@ -416,6 +421,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      }
>  
>      /* Create and map the systick devices */
> +    qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "refclk", s->refclk);
> +    qdev_connect_clock_in(DEVICE(&s->systick[M_REG_NS]), "cpuclk", s->cpuclk);
>      if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_NS]), errp)) {
>          return;
>      }
> @@ -431,6 +438,10 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>           */
>          object_initialize_child(OBJECT(dev), "systick-reg-s",
>                                  &s->systick[M_REG_S], TYPE_SYSTICK);
> +        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "refclk",
> +                              s->refclk);
> +        qdev_connect_clock_in(DEVICE(&s->systick[M_REG_S]), "cpuclk",
> +                              s->cpuclk);
>  
>          if (!sysbus_realize(SYS_BUS_DEVICE(&s->systick[M_REG_S]), errp)) {
>              return;
> @@ -504,11 +515,23 @@ static Property armv7m_properties[] = {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> +static const VMStateDescription vmstate_armv7m = {
> +    .name = "armv7m",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_CLOCK(refclk, SysTickState),
> +        VMSTATE_CLOCK(cpuclk, SysTickState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static void armv7m_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->realize = armv7m_realize;
> +    dc->vmsd = &vmstate_armv7m;
>      device_class_set_props(dc, armv7m_properties);
>  }
>  
> -- 
> 2.20.1
> 

-- 
