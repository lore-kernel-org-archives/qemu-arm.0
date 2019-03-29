Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1846450wrx;
        Fri, 29 Mar 2019 06:09:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqHzZufjdaFG8syMPeTPscmNQxUDggkhkSpSGfVKtYJ8hUiFwSim/1CTyW0YeFHzK3yP+3
X-Received: by 2002:a5e:8d12:: with SMTP id m18mr243315ioj.69.1553864979485;
        Fri, 29 Mar 2019 06:09:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553864979; cv=none;
        d=google.com; s=arc-20160816;
        b=t9kAMFCRp87/jAkdSedcsZ2Em+tczWzyq3Had9TO/i6W2+w5dt63sH5VhBjJ/h02bR
         eD0YHFCcfWoQ2HDyMFTxaxHZsKMgtkezfeQNiWtD7dbDdQ5lpTCUTEyAgZsenQA4B7Eg
         +wmEeixQKd/854Ig1UsN2mP+EfkU0Lr0sa0MX55BCdT8wRIkqY3QxRdV7zufp22yZFjs
         plKZf5QJ0d14+wAqaMTi5WZ1FC0bJFarReQI8q5G/Up+zZfPf1QLvgExgFGtsFiElDGK
         MWBuWB3n/yCPPIUW86JSp2u6OeWQM8datWXlFz/8E2NipARZyFM0h2rNh6n4BIN7o5s2
         RHgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=kjpzHC6yI+LKoLTbOYAXTOGQK1uyFxMCeXZRyP+aDOM=;
        b=DxLFnmurJRdFAe+unlVIV1VLpqojG96XSkLivOJc7tzR8s0yzkJf7otLl4aTD2rzUp
         3c6rBfBPUye/rLX+u5HF3jCBCGJDXRpp2C+JNUEW2doVVPLkBlllrdbrVv+6sPbTVhYd
         AJIg95NsgVVD+ZwH9w85/j2Q5fGC0yyPsAnVc3jOJ3FuGrNWh3Bn6qNmmmsZaFmKhYm3
         /0mBdDS7CtxWOzDCYKKLEk3v/sw0UVgm99B7YQVTIZCluUS88KCb0fOek2d5z6epL1wA
         Wfcq+sUNsRJE+asD6IXygK8KnApeEeQvNLtC6o5mwfkUzZ8yyQ4OC/eJZicK6WPrv5+O
         QcFw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si1019925iok.109.2019.03.29.06.09.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 06:09:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52732 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9rGM-00016f-NA
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 09:09:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9rGE-00016V-Fz
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:09:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9rGC-0004lz-Ml
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:09:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59354)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h9rGB-0004hP-TK; Fri, 29 Mar 2019 09:09:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADEA0307EABB;
	Fri, 29 Mar 2019 13:09:25 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6E0818A28;
	Fri, 29 Mar 2019 13:09:22 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-10-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f71419db-23fa-6978-f015-bb1a36548eb3@redhat.com>
Date: Fri, 29 Mar 2019 14:09:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190321104745.28068-10-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 29 Mar 2019 13:09:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 09/10] hw/acpi: Add ACPI Generic Event
 Device Support
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YPC0gQGk3ugI

Hi Shameer,

On 3/21/19 11:47 AM, Shameer Kolothum wrote:
> From: Samuel Ortiz <sameo@linux.intel.com>
> 
> The ACPI Generic Event Device (GED) is a hardware-reduced specific
> device that handles all platform events, including the hotplug ones.
> This patch generates the AML code that defines GEDs.
> 
> Platforms need to specify their own GedEvent array to describe what
> kind of events they want to support through GED.  Also this uses a
> a single interrupt for the  GED device, relying on IO memory region
> to communicate the type of device affected by the interrupt. This
> way, we can support up to 32 events with a unique interrupt.
> 
> This is in preparation for making use of GED for ARM/virt
> platform and for now supports only memory hotplug.

Personally I would squash this with PATCH 3.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/acpi/generic_event_device.c         | 200 +++++++++++++++++++++++++++++++++
>  include/hw/acpi/generic_event_device.h |  34 ++++++
>  2 files changed, 234 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 0b32fc9..9deaa33 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -23,6 +23,183 @@
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/mem/pc-dimm.h"
>  
> +static hwaddr ged_io_base;
> +static GedEvent *ged_events;
> +static uint32_t ged_events_size;
> +
> +static Aml *ged_event_aml(const GedEvent *event)
> +{
> +
> +    if (!event) {
> +        return NULL;
> +    }
> +
> +    switch (event->event) {
> +    case GED_MEMORY_HOTPLUG:
> +        /* We run a complete memory SCAN when getting a memory hotplug event */
> +        return aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD);
> +    default:
> +        break;
> +    }
> +
> +    return NULL;
> +}
> +
> +/*
> + * The ACPI Generic Event Device (GED) is a hardware-reduced specific
> + * device[ACPI v6.1 Section 5.6.9] that handles all platform events,
> + * including the hotplug ones. Platforms need to specify their own
> + * GedEvent array to describe what kind of events they want to support
> + * through GED. This routine uses a single interrupt for the GED device,
> + * relying on IO memory region to communicate the type of device
> + * affected by the interrupt. This way, we can support up to 32 events
> + * with a unique interrupt.

During last review I asked the question herefater. I may have missed
your answer but just in case.

5.6.9.1 says:
"
The platform declare its support for the GED, and query whether an OS
supports it, via the _OSC method
"
Is it something done?
> + */
> +void build_ged_aml(Aml *table, const char *name, uint32_t ged_irq,
> +                   AmlRegionSpace rs)
> +{
> +    Aml *crs = aml_resource_template();
> +    Aml *evt, *field;
> +    Aml *dev = aml_device("%s", name);
> +    Aml *irq_sel = aml_local(0);
> +    Aml *isel = aml_name(AML_GED_IRQ_SEL);
> +    uint32_t i;
> +
> +    if (!ged_io_base || !ged_events || !ged_events_size) {
> +        return;
> +    }
> +
> +    /* _CRS interrupt */
> +    aml_append(crs, aml_interrupt(AML_CONSUMER, AML_EDGE, AML_ACTIVE_HIGH,
> +                                  AML_EXCLUSIVE, &ged_irq, 1));
> +    /*
> +     * For each GED event we:
> +     * - Add an interrupt to the CRS section.
> +     * - Add a conditional block for each event, inside a while loop.
> +     *   This is semantically equivalent to a switch/case implementation.
> +     */
> +    evt = aml_method("_EVT", 1, AML_SERIALIZED);
> +    {
> +        Aml *ged_aml;
> +        Aml *if_ctx;
> +
> +        /* Local0 = ISEL */
> +        aml_append(evt, aml_store(isel, irq_sel));
> +
> +        /*
> +         * Here we want to call a method for each supported GED event type.
> +         * The resulting ASL code looks like:
> +         *
> +         * Local0 = ISEL
> +         * If ((Local0 & irq0) == irq0)
> +         * {
> +         *     MethodEvent0()
> +         * }
> +         *
> +         * If ((Local0 & irq1) == irq1)
> +         * {
> +         *     MethodEvent1()
> +         * }
I think we could have stopped here ;-) with a ../..
> +         *
> +         * If ((Local0 & irq2) == irq2)
> +         * {
> +         *     MethodEvent2()
> +         * }
> +         */
> +
> +        for (i = 0; i < ged_events_size; i++) {
> +            ged_aml = ged_event_aml(&ged_events[i]);
> +            if (!ged_aml) {
> +                continue;
> +            }
> +
> +            /* If ((Local1 == irq))*/
> +            if_ctx = aml_if(aml_equal(aml_and(irq_sel, aml_int(ged_events[i].selector), NULL), aml_int(ged_events[i].selector)));
doesn't check_patch complain here?
> +            {
> +                /* AML for this specific type of event */
> +                aml_append(if_ctx, ged_aml);
> +            }
> +
> +            /*
> +             * We append the first "if" to the "while" context.
> +             * Other "ifs" will be "elseifs".
> +             */
> +            aml_append(evt, if_ctx);
> +        }
> +    }
> +
> +    aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0013")));
> +    aml_append(dev, aml_name_decl("_UID", aml_string(GED_DEVICE)));
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +
> +    /* Append IO region */
> +    aml_append(dev, aml_operation_region(AML_GED_IRQ_REG, rs,
> +               aml_int(ged_io_base + ACPI_GED_IRQ_SEL_OFFSET),
> +               ACPI_GED_IRQ_SEL_LEN));
> +    field = aml_field(AML_GED_IRQ_REG, AML_DWORD_ACC, AML_NOLOCK,
> +                      AML_WRITE_AS_ZEROS);
> +    aml_append(field, aml_named_field(AML_GED_IRQ_SEL,
> +                                      ACPI_GED_IRQ_SEL_LEN * 8));
> +    aml_append(dev, field);
> +
> +    /* Append _EVT method */
> +    aml_append(dev, evt);
> +
> +    aml_append(table, dev);
> +}
> +
> +/* Memory read by the GED _EVT AML dynamic method */
> +static uint64_t ged_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    uint64_t val = 0;
> +    GEDState *ged_st = opaque;
> +
> +    switch (addr) {
> +    case ACPI_GED_IRQ_SEL_OFFSET:
> +        /* Read the selector value and reset it */
> +        qemu_mutex_lock(&ged_st->lock);
> +        val = ged_st->sel;
> +        ged_st->sel = 0;
> +        qemu_mutex_unlock(&ged_st->lock);
> +        break;
> +    default:
> +        break;
> +    }
> +
> +    return val;
> +}
> +
> +/* Nothing is expected to be written to the GED memory region */
> +static void ged_write(void *opaque, hwaddr addr, uint64_t data,
> +                      unsigned int size)
> +{
> +}
> +
> +static const MemoryRegionOps ged_ops = {
> +    .read = ged_read,
> +    .write = ged_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static void acpi_ged_event(GEDState *ged_st, uint32_t ged_irq_sel)
> +{
> +    /*
> +     * Set the GED IRQ selector to the expected device type value. This
> +     * way, the ACPI method will be able to trigger the right code based
> +     * on a unique IRQ.
> +     */
> +    qemu_mutex_lock(&ged_st->lock);
> +    ged_st->sel = ged_irq_sel;
> +    qemu_mutex_unlock(&ged_st->lock);
> +
> +    /* Trigger the event by sending an interrupt to the guest. */
> +    qemu_irq_pulse(ged_st->gsi[ged_st->irq]);
I don't get this. The devices uses a single irq, right?

Why can't we do like other sysbus devices, sysbus_init_irq(dev, &s->irq);
and use
sysbus_connect_irq(SYS_BUS_DEVICE(dev), i, pic); in virt?
> +}
> +
>  static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
>                                  DeviceState *dev, Error **errp)
>  {
> @@ -40,6 +217,21 @@ static void virt_device_plug_cb(HotplugHandler *hotplug_dev,
>  
>  static void virt_send_ged(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  {
> +    VirtAcpiState *s = VIRT_ACPI(adev);
> +    uint32_t sel;
> +
> +    if (ev & ACPI_MEMORY_HOTPLUG_STATUS) {
> +        sel = ACPI_GED_IRQ_SEL_MEM;
> +    } else {
> +        /* Unknown event. Return without generating interrupt. */
> +        return;
> +    }
> +
> +    /*
> +     * We inject the hotplug interrupt. The IRQ selector will make
> +     * the difference from the ACPI table.
> +     */
> +    acpi_ged_event(&s->ged_state, sel);
>  }
>  
>  static void virt_device_realize(DeviceState *dev, Error **errp)
> @@ -57,6 +249,11 @@ static Property virt_acpi_properties[] = {
>      DEFINE_PROP_UINT64("memhp_base", VirtAcpiState, memhp_base, 0),
>      DEFINE_PROP_BOOL("memory-hotplug-support", VirtAcpiState,
>                       memhp_state.is_enabled, true),
It may be worth to explain why the GED device owns the
MEMORY_HOTPLUG_MMIO region. This was and still is confusing me I
acknowledge.
> +    DEFINE_PROP_PTR("gsi", VirtAcpiState, gsi),
see the comment abour irq above.
> +    DEFINE_PROP_UINT64("ged_base", VirtAcpiState, ged_base, 0),
> +    DEFINE_PROP_UINT32("ged_irq", VirtAcpiState, ged_irq, 0),
> +    DEFINE_PROP_PTR("ged_events", VirtAcpiState, ged_events),
> +    DEFINE_PROP_UINT32("ged_events_size", VirtAcpiState, ged_events_size, 0),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -70,6 +267,9 @@ static void virt_acpi_class_init(ObjectClass *class, void *data)
>      dc->props = virt_acpi_properties;
>      dc->realize = virt_device_realize;
>  
> +    /* Reason: pointer properties "gsi" and "gde_events" */
ged_events
> +    dc->user_creatable = false;
> +
>      hc->plug = virt_device_plug_cb;
>  
>      adevc->send_event = virt_send_ged;
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index 262ca7d..7f130f3 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -24,11 +24,45 @@
>  #define VIRT_ACPI(obj) \
>      OBJECT_CHECK(VirtAcpiState, (obj), TYPE_VIRT_ACPI)
>  
> +#define ACPI_GED_IRQ_SEL_OFFSET 0x0
> +#define ACPI_GED_IRQ_SEL_LEN    0x4
> +#define ACPI_GED_IRQ_SEL_MEM    0x1
> +#define ACPI_GED_REG_LEN        0x4
> +
> +#define GED_DEVICE      "GED"
> +#define AML_GED_IRQ_REG "IREG"
> +#define AML_GED_IRQ_SEL "ISEL"
> +
> +typedef enum {
> +    GED_MEMORY_HOTPLUG = 1,
> +} GedEventType;
> +
> +typedef struct GedEvent {
> +    uint32_t     selector;
> +    GedEventType event;
> +} GedEvent;
> +
> +typedef struct GEDState {
> +    MemoryRegion io;
> +    uint32_t     sel;
> +    uint32_t     irq;
> +    qemu_irq     *gsi;
> +    QemuMutex    lock;
> +} GEDState;
> +
>  typedef struct VirtAcpiState {
>      SysBusDevice parent_obj;
>      MemHotplugState memhp_state;
>      hwaddr memhp_base;
> +    void *gsi;
> +    hwaddr ged_base;
> +    GEDState ged_state;
> +    uint32_t ged_irq;
> +    void *ged_events;
> +    uint32_t ged_events_size;
>  } VirtAcpiState;
>  
> +void build_ged_aml(Aml *table, const char* name, uint32_t ged_irq,
> +                   AmlRegionSpace rs);
>  
>  #endif
> 

Thanks

Eric
