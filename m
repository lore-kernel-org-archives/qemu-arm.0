Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6636836wrv;
        Wed, 7 Aug 2019 07:42:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyvX8gsJ1hitsjdoUyGQi/nhDhYqLj5v2AZ9ZY8Cxxqt+82ER6QOwRPNACDJK3plSy9MwYj
X-Received: by 2002:aed:3aaa:: with SMTP id o39mr8585011qte.146.1565188930764;
        Wed, 07 Aug 2019 07:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565188930; cv=none;
        d=google.com; s=arc-20160816;
        b=NJ97DFhYiX+C+vVTag7elJgeDs1He9hQyLECCPECit1vsJlP28LnVkVuJxf53xBl/w
         UTuEZOHbQD7lUSL4ocxmQs8MHmGTSFAf6T2B26O2qby4trRSOKvjhpu8ffxN9/8NJl70
         QbXflIRRBHZk6fu5vLemlBzfQt8K4C5XakZwIcbakuyL/ZRQzprM6KYwM8Li+nGaC8As
         aLILWQFo+bmHXvOiLP/h2q+g5gOkL8amUgyZYrfenmsBQ+Mc6P6FJCjaJbKRVGZSa/sQ
         4NEDFUsQMtU0kzGRAwRrV33sONDIkpafDQpp+yfsET4jUyGi0ngTz1WmkAsOOPRRgV6R
         M25Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OmRu+jnHwqGKPuUgVGOMpBd2fWAvE1KkYz63JOIZuTc=;
        b=gLid8WlASIvpX0HuKW66arZqb2ODU5J+xfSqXOoHs8OSDfMRpSI7SABgVrxRgNEI4c
         tEyhOG0HTFUlZgd2IHryjn0mj/faa21zFq0Ukc7ovCIxVrnebV2G6HLlnJXH7GuZjTW0
         ZvNU3x7dLFPOn0Yrp3pDTmQ65PjeH8pzTLNtI1w7yas3+mux4qQ/6mw5hBO9apAW+5Px
         r09YBRtIUfOFg09DpPRD8ypyNSGHvShi53haELIxm5GMVB7F3jiTtNpWqxvwrx/spEtB
         C42gDeKZ5qIPX+N5cBy7jlNuPqoNBvQH88APpSSTZiTSdC9eWqmxXIti86koQu+HR+WC
         WNiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uzn5I3GQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r131si34787958qke.339.2019.08.07.07.42.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 07:42:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uzn5I3GQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvN8k-0000LY-9u
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 10:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42872)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvN8X-00007b-If
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:41:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvN8V-0001i5-AI
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:41:57 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:35166)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvN8V-0001hG-28
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:41:55 -0400
Received: by mail-ot1-x344.google.com with SMTP id j19so28569897otq.2
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OmRu+jnHwqGKPuUgVGOMpBd2fWAvE1KkYz63JOIZuTc=;
 b=Uzn5I3GQwLjttHv+Mw6xX+EXG1lxcb39AtJUhWTvnWeBf+bX59vRzfIKUJpnfha8UN
 AF4FlOBendn2sB0QboqOip11HqzIU0RnyfIfBCHX/AhGpdcpVAcqh2rOznqadLE3acXE
 Xe0jsVSSPbzT+VzxnoY3CW2UZv051PHX8oPpBR5nZn5rneQQY8lct5HLerdqDShddMK3
 nM68Rb2KIuFM5NLQVNkSm98y8xr1iX8Wu73G92bm+MM90c+drqLY848yhAl95zout79n
 vJDt3YcMZIg+g3HQtkROGrpB833/UF9kn4E1//ZST3MKBC/+BcSZGMjXhZyVo5PT11ke
 MD0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OmRu+jnHwqGKPuUgVGOMpBd2fWAvE1KkYz63JOIZuTc=;
 b=m49xbFQQwDOhowqLr6t8urEzKzKSPKBhfmpeuclb1PXuyaINN0v+sZLWUXSxDwCtet
 z/6PqIuzfmQcjfRj4M3u47/ag0+npaDJX7XMnc4uMfz4AlNq8l9lgKaqklI1nRL/8+8/
 R1J4GSEvdky2//LF4hilN6yvYxMnQP/IR6blMZRejBeq59mZL70+kv+smWcJ7tqrAyEO
 0zpIGyxSK+NuqiYmsq2VF1KqddV8yOoL85DTAf983IjVeWM2gQseMWdwGJ97P4XYBpZL
 XUVj4ic45+QUzG/OBzQJcu/3JQv7KtqVJ+NetabPkDQsqwqhvBq4a3ocsD25B31+69xM
 JVBw==
X-Gm-Message-State: APjAAAUlt6ApTNLyoIZpW57S0ZRQvR9nCwry1tZzVAYYJPPpFgZTeWnG
 VsD3knuwhxEr385lY5EJ5TT9WGzZfVQABJ7Q50W0fw==
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr219528oij.98.1565188913910; 
 Wed, 07 Aug 2019 07:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-5-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-5-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 15:41:42 +0100
Message-ID: <CAFEAcA_WEf6YKwMWbE0=Qqn1NfUN-Hwr9iMk1PKe0ZxZfVfwVA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v3 04/33] make Device and Bus Resettable
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0BBSAghSGxLp

On Mon, 29 Jul 2019 at 15:58, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> This add Resettable interface implementation for both Bus and Device.
>
> *resetting* counter and *reset_is_cold* flag are added in DeviceState
> and BusState.
>
> Compatibility with existing code base is ensured.
> The legacy bus or device reset method is called in the new exit phase
> and the other 2 phases are let empty. Using the exit phase guarantee that

"left". "guarantees"

> legacy resets are called in the "post" order (ie: children then parent)
> in hierarchical reset. That is the same order as legacy qdev_reset_all
> or qbus_reset_all were using.

This is true, but on the other hand the semantics of most device
reset methods match "init", not "exit" -- they just set device
internal fields to the correct reset state.

> New *device_reset* and *bus_reset* function are proposed with an
> additional boolean argument telling whether the reset is cold or warm.
> Helper functions *device_reset_[warm|cold]* and *bus_reset_[warm|cold]*
> are defined also as helpers.
>
> Also add a [device|bus]_is_resetting and [device|bus]_is_reset_cold
> functions telling respectively whether the object is currently under reset and
> if the current reset is cold or not.

I was expecting this patch to contain handling for migration
of the new data fields. That's in a later patch, so the
commit message here should say something like:

"This commit adds new fields to BusState and DeviceState, but
does not set up migration handling for them; so the new functions
can only be called after the subsequent commit which adds the
migration support."

> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  hw/core/bus.c          | 85 ++++++++++++++++++++++++++++++++++++++++++
>  hw/core/qdev.c         | 82 ++++++++++++++++++++++++++++++++++++++++
>  include/hw/qdev-core.h | 84 ++++++++++++++++++++++++++++++++++++++---
>  tests/Makefile.include |  1 +
>  4 files changed, 247 insertions(+), 5 deletions(-)
>
> diff --git a/hw/core/bus.c b/hw/core/bus.c
> index 17bc1edcde..08a97addb6 100644
> --- a/hw/core/bus.c
> +++ b/hw/core/bus.c
> @@ -22,6 +22,7 @@
>  #include "qemu/module.h"
>  #include "hw/qdev.h"
>  #include "qapi/error.h"
> +#include "hw/resettable.h"
>
>  void qbus_set_hotplug_handler(BusState *bus, Object *handler, Error **errp)
>  {
> @@ -68,6 +69,75 @@ int qbus_walk_children(BusState *bus,
>      return 0;
>  }
>
> +void bus_reset(BusState *bus, bool cold)
> +{
> +    resettable_reset(OBJECT(bus), cold);
> +}
> +
> +bool bus_is_resetting(BusState *bus)
> +{
> +    return (bus->resetting != 0);
> +}
> +
> +bool bus_is_reset_cold(BusState *bus)
> +{
> +    return bus->reset_is_cold;
> +}
> +
> +static uint32_t bus_get_reset_count(Object *obj)
> +{
> +    BusState *bus = BUS(obj);
> +    return bus->resetting;
> +}
> +
> +static uint32_t bus_increment_reset_count(Object *obj)
> +{
> +    BusState *bus = BUS(obj);
> +    return ++bus->resetting;
> +}
> +
> +static uint32_t bus_decrement_reset_count(Object *obj)
> +{
> +    BusState *bus = BUS(obj);
> +    return --bus->resetting;
> +}
> +
> +static bool bus_set_reset_cold(Object *obj, bool cold)
> +{
> +    BusState *bus = BUS(obj);
> +    bool old = bus->reset_is_cold;
> +    bus->reset_is_cold = cold;
> +    return old;
> +}
> +
> +static bool bus_set_hold_needed(Object *obj, bool hold_needed)
> +{
> +    BusState *bus = BUS(obj);
> +    bool old = bus->reset_hold_needed;
> +    bus->reset_hold_needed = hold_needed;
> +    return old;
> +}
> +
> +static void bus_foreach_reset_child(Object *obj, void (*func)(Object *))
> +{
> +    BusState *bus = BUS(obj);
> +    BusChild *kid;
> +
> +    QTAILQ_FOREACH(kid, &bus->children, sibling) {
> +        func(OBJECT(kid->child));
> +    }
> +}
> +
> +static void bus_obj_legacy_reset(Object *obj)
> +{
> +    BusState *bus = BUS(obj);
> +    BusClass *bc = BUS_GET_CLASS(obj);
> +
> +    if (bc->reset) {
> +        bc->reset(bus);
> +    }
> +}
> +
>  static void qbus_realize(BusState *bus, DeviceState *parent, const char *name)
>  {
>      const char *typename = object_get_typename(OBJECT(bus));
> @@ -192,6 +262,8 @@ static void qbus_initfn(Object *obj)
>                               NULL);
>      object_property_add_bool(obj, "realized",
>                               bus_get_realized, bus_set_realized, NULL);
> +
> +    bus->resetting = 0;
>  }
>
>  static char *default_bus_get_fw_dev_path(DeviceState *dev)
> @@ -202,9 +274,18 @@ static char *default_bus_get_fw_dev_path(DeviceState *dev)
>  static void bus_class_init(ObjectClass *class, void *data)
>  {
>      BusClass *bc = BUS_CLASS(class);
> +    ResettableClass *rc = RESETTABLE_CLASS(class);
>
>      class->unparent = bus_unparent;
>      bc->get_fw_dev_path = default_bus_get_fw_dev_path;
> +
> +    rc->phases.exit = bus_obj_legacy_reset;
> +    rc->get_count = bus_get_reset_count;
> +    rc->increment_count = bus_increment_reset_count;
> +    rc->decrement_count = bus_decrement_reset_count;
> +    rc->foreach_child = bus_foreach_reset_child;
> +    rc->set_cold = bus_set_reset_cold;
> +    rc->set_hold_needed = bus_set_hold_needed;
>  }
>
>  static void qbus_finalize(Object *obj)
> @@ -223,6 +304,10 @@ static const TypeInfo bus_info = {
>      .instance_init = qbus_initfn,
>      .instance_finalize = qbus_finalize,
>      .class_init = bus_class_init,
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_RESETTABLE },
> +        { }
> +    },
>  };
>
>  static void bus_register_types(void)
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 043e058396..559ced070d 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -254,6 +254,64 @@ HotplugHandler *qdev_get_hotplug_handler(DeviceState *dev)
>      return hotplug_ctrl;
>  }
>
> +void device_reset(DeviceState *dev, bool cold)
> +{
> +    resettable_reset(OBJECT(dev), cold);
> +}
> +
> +bool device_is_resetting(DeviceState *dev)
> +{
> +    return (dev->resetting != 0);
> +}
> +
> +bool device_is_reset_cold(DeviceState *dev)
> +{
> +    return dev->reset_is_cold;
> +}
> +
> +static uint32_t device_get_reset_count(Object *obj)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    return dev->resetting;
> +}
> +
> +static uint32_t device_increment_reset_count(Object *obj)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    return ++dev->resetting;
> +}
> +
> +static uint32_t device_decrement_reset_count(Object *obj)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    return --dev->resetting;
> +}
> +
> +static bool device_set_reset_cold(Object *obj, bool cold)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    bool old = dev->reset_is_cold;
> +    dev->reset_is_cold = cold;
> +    return old;
> +}
> +
> +static bool device_set_hold_needed(Object *obj, bool hold_needed)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    bool old = dev->reset_hold_needed;
> +    dev->reset_hold_needed = hold_needed;
> +    return old;
> +}
> +
> +static void device_foreach_reset_child(Object *obj, void (*func)(Object *))
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    BusState *bus;
> +    QLIST_FOREACH(bus, &dev->child_bus, sibling) {
> +        func(OBJECT(bus));
> +    }
> +}
> +
>  static int qdev_reset_one(DeviceState *dev, void *opaque)
>  {
>      device_legacy_reset(dev);
> @@ -954,6 +1012,7 @@ static void device_initfn(Object *obj)
>
>      dev->instance_id_alias = -1;
>      dev->realized = false;
> +    dev->resetting = 0;
>
>      object_property_add_bool(obj, "realized",
>                               device_get_realized, device_set_realized, NULL);
> @@ -1046,9 +1105,20 @@ static void device_unparent(Object *obj)
>      }
>  }
>
> +static void device_obj_legacy_reset(Object *obj)
> +{
> +    DeviceState *dev = DEVICE(obj);
> +    DeviceClass *dc = DEVICE_GET_CLASS(dev);
> +
> +    if (dc->reset) {
> +        dc->reset(dev);
> +    }
> +}
> +
>  static void device_class_init(ObjectClass *class, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(class);
> +    ResettableClass *rc = RESETTABLE_CLASS(class);
>
>      class->unparent = device_unparent;
>
> @@ -1060,6 +1130,14 @@ static void device_class_init(ObjectClass *class, void *data)
>       */
>      dc->hotpluggable = true;
>      dc->user_creatable = true;
> +
> +    rc->phases.exit = device_obj_legacy_reset;
> +    rc->get_count = device_get_reset_count;
> +    rc->increment_count = device_increment_reset_count;
> +    rc->decrement_count = device_decrement_reset_count;
> +    rc->foreach_child = device_foreach_reset_child;
> +    rc->set_cold = device_set_reset_cold;
> +    rc->set_hold_needed = device_set_hold_needed;
>  }
>
>  void device_class_set_parent_reset(DeviceClass *dc,
> @@ -1117,6 +1195,10 @@ static const TypeInfo device_type_info = {
>      .class_init = device_class_init,
>      .abstract = true,
>      .class_size = sizeof(DeviceClass),
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_RESETTABLE },
> +        { }
> +    },
>  };
>
>  static void qdev_register_types(void)
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 690ce72433..eeb75611c8 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -7,6 +7,7 @@
>  #include "hw/irq.h"
>  #include "hw/hotplug.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/resettable.h"
>
>  enum {
>      DEV_NVECTORS_UNSPECIFIED = -1,
> @@ -132,6 +133,10 @@ struct NamedGPIOList {
>  /**
>   * DeviceState:
>   * @realized: Indicates whether the device has been fully constructed.
> + * @resetting: Indicates whether the device is under reset. Also
> + * used to count how many times reset has been initiated on the device.
> + * @reset_is_cold: If the device is under reset, indicates whether it is cold
> + * or warm.

We should put a doc comment entry for @reset_hold_needed here too.

>   *
>   * This structure should not be accessed directly.  We declare it here
>   * so that it can be embedded in individual device state structures.
> @@ -153,6 +158,9 @@ struct DeviceState {
>      int num_child_bus;
>      int instance_id_alias;
>      int alias_required_for_version;
> +    uint32_t resetting;
> +    bool reset_is_cold;
> +    bool reset_hold_needed;
>  };
>
>  struct DeviceListener {
> @@ -199,6 +207,10 @@ typedef struct BusChild {
>  /**
>   * BusState:
>   * @hotplug_handler: link to a hotplug handler associated with bus.
> + * @resetting: Indicates whether the bus is under reset. Also
> + * used to count how many times reset has been initiated on the bus.
> + * @reset_is_cold: If the bus is under reset, indicates whether it is cold
> + * or warm.

@reset_hold_needed missing.

>   */
>  struct BusState {
>      Object obj;
> @@ -210,6 +222,9 @@ struct BusState {
>      int num_children;
>      QTAILQ_HEAD(, BusChild) children;
>      QLIST_ENTRY(BusState) sibling;
> +    uint32_t resetting;
> +    bool reset_is_cold;
> +    bool reset_hold_needed;
>  };
>
>  /**
> @@ -376,6 +391,70 @@ int qdev_walk_children(DeviceState *dev,
>                         qdev_walkerfn *post_devfn, qbus_walkerfn *post_busfn,
>                         void *opaque);
>
> +/**
> + * device_reset:
> + * Resets the device @dev, @cold tell whether to do a cold or warm reset.

"Resets the device @dev. @cold is true if this is a cold reset."


> + * Uses the ressetable interface.

"Resettable".

> + * Base behavior is to reset the device and its qdev/qbus subtree.

What do you mean by "base behavior" here? When would this ever
do anything else?

> + */
> +void device_reset(DeviceState *dev, bool cold);
> +
> +static inline void device_reset_warm(DeviceState *dev)
> +{
> +    device_reset(dev, false);
> +}
> +
> +static inline void device_reset_cold(DeviceState *dev)
> +{
> +    device_reset(dev, true);
> +}
> +
> +/**
> + * bus_reset:
> + * Resets the bus @bus, @cold tell whether to do a cold or warm reset.
> + * Uses the ressetable interface.
> + * Base behavior is to reset the bus and its qdev/qbus subtree.

Same remarks as for device_reset above.

> + */
> +void bus_reset(BusState *bus, bool cold);
> +
> +static inline void bus_reset_warm(BusState *bus)
> +{
> +    bus_reset(bus, false);
> +}
> +
> +static inline void bus_reset_cold(BusState *bus)
> +{
> +    bus_reset(bus, true);
> +}
> +
> +/**
> + * device_is_resetting:
> + * Tell whether the device @dev is currently under reset.

"Return true if the device @dev is currently being reset."

> + */
> +bool device_is_resetting(DeviceState *dev);
> +
> +/**
> + * device_is_reset_cold:
> + * Tell whether the device @dev is currently under reset cold or warm reset.

"Return true if the reset currently in progress for @dev is
a cold reset."

> + *
> + * Note: only valid when device_is_resetting returns true.
> + */
> +bool device_is_reset_cold(DeviceState *dev);
> +
> +/**
> + * bus_is_resetting:
> + * Tell whether the bus @bus is currently under reset.

[similar rephrasings as above for 'tell whether']

> + */
> +bool bus_is_resetting(BusState *bus);
> +
> +/**
> + * bus_is_reset_cold:
> + * Tell whether the bus @bus is currently under reset cold or warm reset.
> + *
> + * Note: only valid when bus_is_resetting returns true.
> + */
> +bool bus_is_reset_cold(BusState *bus);
> +
>  void qdev_reset_all(DeviceState *dev);
>  void qdev_reset_all_fn(void *opaque);
>
> @@ -413,11 +492,6 @@ void qdev_machine_init(void);
>   */
>  void device_legacy_reset(DeviceState *dev);
>
> -static inline void device_reset(DeviceState *dev)
> -{
> -    device_legacy_reset(dev);
> -}
> -
>  void device_class_set_parent_reset(DeviceClass *dc,
>                                     DeviceReset dev_reset,
>                                     DeviceReset *parent_reset);
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index fd7fdb8658..1c0a5345b9 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -561,6 +561,7 @@ tests/fp/%:
>
>  tests/test-qdev-global-props$(EXESUF): tests/test-qdev-global-props.o \
>         hw/core/qdev.o hw/core/qdev-properties.o hw/core/hotplug.o\
> +       hw/core/resettable.o \
>         hw/core/bus.o \
>         hw/core/irq.o \
>         hw/core/fw-path-provider.o \
> --
> 2.22.0

thanks
-- PMM
