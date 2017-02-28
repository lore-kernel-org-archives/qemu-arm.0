Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id i82sm18504820wmf.1.2017.02.28.06.02.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Feb 2017 06:02:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 979EE3E0092;
	Tue, 28 Feb 2017 14:02:36 +0000 (GMT)
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org> <1487604965-23220-6-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.19; emacs 25.2.7
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org, Alistair Francis <alistair23@gmail.com>, Michael Davidsaver <mdavidsaver@gmail.com>
Subject: Re: [PATCH 05/11] armv7m: Make ARMv7M object take memory region link
In-reply-to: <1487604965-23220-6-git-send-email-peter.maydell@linaro.org>
Date: Tue, 28 Feb 2017 14:02:36 +0000
Message-ID: <87fuiy2z2b.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: JSzI30Ujthg2


Peter Maydell <peter.maydell@linaro.org> writes:

> Make the ARMv7M object take a memory region link which it uses
> to wire up the bitband rather than having them always put
> themselves in the system address space.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  include/hw/arm/armv7m.h | 10 ++++++++++
>  hw/arm/armv7m.c         | 23 ++++++++++++++++++++++-
>  2 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> index 193ad71..3333c91 100644
> --- a/include/hw/arm/armv7m.h
> +++ b/include/hw/arm/armv7m.h
> @@ -35,6 +35,9 @@ typedef struct {
>   * + Named GPIO output SYSRESETREQ: signalled for guest AIRCR.SYSRESETREQ
>   * + Property "cpu-model": CPU model to instantiate
>   * + Property "num-irq": number of external IRQ lines
> + * + Property "memory": MemoryRegion defining the physical address space
> + *   that CPU accesses see. (The NVIC, bitbanding and other CPU-internal
> + *   devices will be automatically layered on top of this view.)
>   */
>  typedef struct ARMv7MState {
>      /*< private >*/
> @@ -44,8 +47,15 @@ typedef struct ARMv7MState {
>      BitBandState bitband[ARMV7M_NUM_BITBANDS];
>      ARMCPU *cpu;
>
> +    /* MemoryRegion we pass to the CPU, with our devices layered on
> +     * top of the ones the board provides in board_memory.
> +     */
> +    MemoryRegion container;
> +
>      /* Properties */
>      char *cpu_model;
> +    /* MemoryRegion the board provides to us (with its devices, RAM, etc) */
> +    MemoryRegion *board_memory;
>  } ARMv7MState;
>
>  #endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 36f213c..638c597 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -18,6 +18,7 @@
>  #include "elf.h"
>  #include "sysemu/qtest.h"
>  #include "qemu/error-report.h"
> +#include "exec/address-spaces.h"
>
>  /* Bitbanded IO.  Each word corresponds to a single bit.  */
>
> @@ -148,6 +149,14 @@ static void armv7m_instance_init(Object *obj)
>
>      /* Can't init the cpu here, we don't yet know which model to use */
>
> +    object_property_add_link(obj, "memory",
> +                             TYPE_MEMORY_REGION,
> +                             (Object **)&s->board_memory,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             &error_abort);
> +    memory_region_init(&s->container, obj, "armv7m-container", UINT64_MAX);
> +
>      object_initialize(&s->nvic, sizeof(s->nvic), "armv7m_nvic");
>      qdev_set_parent_bus(DEVICE(&s->nvic), sysbus_get_default());
>      object_property_add_alias(obj, "num-irq",
> @@ -170,6 +179,13 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>      const char *typename;
>      CPUClass *cc;
>
> +    if (!s->board_memory) {
> +        error_setg(errp, "memory property was not set");
> +        return;
> +    }
> +
> +    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
> +
>      cpustr = g_strsplit(s->cpu_model, ",", 2);
>
>      oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
> @@ -194,6 +210,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +    object_property_set_link(OBJECT(s->cpu), OBJECT(&s->container), "memory",
> +                             &error_abort);
>      object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
>      if (err != NULL) {
>          error_propagate(errp, err);
> @@ -234,7 +252,8 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
>              return;
>          }
>
> -        sysbus_mmio_map(sbd, 0, bitband_output_addr[i]);
> +        memory_region_add_subregion(&s->container, bitband_output_addr[i],
> +                                    sysbus_mmio_get_region(sbd, 0));
>      }
>  }
>
> @@ -282,6 +301,8 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
>      armv7m = qdev_create(NULL, "armv7m");
>      qdev_prop_set_uint32(armv7m, "num-irq", num_irq);
>      qdev_prop_set_string(armv7m, "cpu-model", cpu_model);
> +    object_property_set_link(OBJECT(armv7m), OBJECT(get_system_memory()),
> +                                     "memory", &error_abort);
>      /* This will exit with an error if the user passed us a bad cpu_model */
>      qdev_init_nofail(armv7m);


--
Alex Bennée
