Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3855473lfp;
        Mon, 10 Feb 2020 05:44:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqwDwhAFhqHYSrRII8gBsFxOXUqk72ssz6vxxtX/XudR61Jeis4vM3CNpQWDX/JQhSQ+dpqR
X-Received: by 2002:a37:9504:: with SMTP id x4mr1305802qkd.453.1581342259641;
        Mon, 10 Feb 2020 05:44:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581342259; cv=none;
        d=google.com; s=arc-20160816;
        b=c761T9yQe65JHsAl6YjkLsc7tx/9noeg4rqBD+QLaMDzphN5RtWiVH9I6hOgZ6MUW2
         PWjDrJPY3jsJop/5IHUflyuxHcGLUO1qtD3B7ep34jUF/BzeTxVIc0kE7oufOSkh7sR/
         TFBD0vZfnrD2H5LhtG4ySzzOq2TnSDBnerobegY1yvsRE3eheV/R532wyCCkSdV6/9E9
         cr8SR4dfWi28zrO0tOsEhqE6KJz5jSmGtl6w5wDJwpowGxJ+pMzzYsjufPLoMUGhOwiE
         QcA9ilrmb2D6OzXQma+PrIvUc6v/85+eZWt/F4PSABEUM/XcD9B3ntoVF/T13XLMxe0g
         5y5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=HQdUyuQyVZSg++rQvTdORNNiRypDOq5+9r3udxfImE0=;
        b=LwJENoiBHUi2w+QRtMVqoS+dOqvD7+jKariyi3iDkA/YMpRnaoIwq9GZKBEYPUO3Ji
         l0SKBHInV+2nVIcJ1tmgKRpfyn+Z4JijcqmpS6O7/5Ag+DI1jfdi+eZ30WUPTrmHaLed
         4XOAOaEIIR2NdznfaqGvcaSlYEN3zd7llM8p6tyHbBwX30DjGOFLWQeu7qdHu4kGuJFy
         hXaaWSFdvHUGdkP5rCvb//wswdFFAZperIbLvuTciv2ej5vLYmv9AFYHanNSTavjUKPV
         Rb9VgMebya9Jz2DUleqqbuU4LeT99ARQ+1sGDIgZXFi4vt4kJnlxF7kvtFgw1W3jXWf/
         NWvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QiSV4vKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v65si161141qkb.32.2020.02.10.05.44.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 05:44:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QiSV4vKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j19MJ-0004i1-1v
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 08:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50360)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1j19MC-0004hs-3z
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:44:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1j19MA-0006pX-Rs
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:44:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45533
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1j19MA-0006pL-Nv
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 08:44:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581342250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQdUyuQyVZSg++rQvTdORNNiRypDOq5+9r3udxfImE0=;
 b=QiSV4vKU2fdRRI7Dpy5tnuZLu4PFFTqtE/lMyOKxSNQ+SNbrBJEyZsNhtXlOP/SOvbFadJ
 DWDgylCfQZbJ3i30GZ6RiFqb6juxKmtFHP+5NQvRz2+TfLVm4r7CmZJOtCVPlqxaVIxACH
 XiXhZsX9Ywk1W/7KIejm9RIxZvI/CsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-lf9a2MXgOIKl9yT0PD8ITw-1; Mon, 10 Feb 2020 08:44:08 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62A148010C4;
 Mon, 10 Feb 2020 13:44:06 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 281D55C1D4;
 Mon, 10 Feb 2020 13:43:57 +0000 (UTC)
Date: Mon, 10 Feb 2020 14:43:55 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v2 5/7] hw/arm/virt: Add nvdimm hotplug support
Message-ID: <20200210144355.523c2e83@redhat.com>
In-Reply-To: <20200117174522.22044-6-shameerali.kolothum.thodi@huawei.com>
References: <20200117174522.22044-1-shameerali.kolothum.thodi@huawei.com>
 <20200117174522.22044-6-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: lf9a2MXgOIKl9yT0PD8ITw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, mst@redhat.com,
 shannon.zhaosl@gmail.com, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r4dsZMW47pX9

On Fri, 17 Jan 2020 17:45:20 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This adds support for nvdimm hotplug events through GED
> and enables nvdimm for the arm/virt. Now Guests with ACPI
> can have both cold and hot plug of nvdimms.
> 
> Hot removal functionality is not yet supported.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  docs/specs/acpi_hw_reduced_hotplug.rst |  1 +
>  hw/acpi/generic_event_device.c         | 13 +++++++++++++
>  hw/arm/virt.c                          | 16 +++++++++++-----
>  include/hw/acpi/generic_event_device.h |  1 +
>  4 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
> index 911a98255b..e3abe975bf 100644
> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
> @@ -63,6 +63,7 @@ GED IO interface (4 byte access)
>      bits:
>         0: Memory hotplug event
>         1: System power down event
> +       2: NVDIMM hotplug event
>      2-31: Reserved
>  
>  **write_access:**
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 9cee90cc70..ad1b684304 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -16,6 +16,7 @@
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/irq.h"
>  #include "hw/mem/pc-dimm.h"
> +#include "hw/mem/nvdimm.h"
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "qemu/error-report.h"
> @@ -23,6 +24,7 @@
>  static const uint32_t ged_supported_events[] = {
>      ACPI_GED_MEM_HOTPLUG_EVT,
>      ACPI_GED_PWR_DOWN_EVT,
> +    ACPI_GED_NVDIMM_HOTPLUG_EVT,
>  };
>  
>  /*
> @@ -110,6 +112,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                             aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
>                                        aml_int(0x80)));
>                  break;
> +            case ACPI_GED_NVDIMM_HOTPLUG_EVT:
> +                aml_append(if_ctx,
> +                           aml_notify(aml_name("\\_SB.NVDR"),
> +                                      aml_int(0x80)));
> +                break;
>              default:
>                  /*
>                   * Please make sure all the events in ged_supported_events[]
> @@ -175,7 +182,11 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>      AcpiGedState *s = ACPI_GED(hotplug_dev);
>  
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
> +            nvdimm_acpi_plug_cb(hotplug_dev, dev);
> +        } else {
>              acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
> +        }
>      } else {
>          error_setg(errp, "virt: device plug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> @@ -192,6 +203,8 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>          sel = ACPI_GED_MEM_HOTPLUG_EVT;
>      } else if (ev & ACPI_POWER_DOWN_STATUS) {
>          sel = ACPI_GED_PWR_DOWN_EVT;
> +    } else if (ev & ACPI_NVDIMM_HOTPLUG_STATUS) {
> +        sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
>      } else {
>          /* Unknown event. Return without generating interrupt. */
>          warn_report("GED: Unsupported event %d. No irq injected", ev);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7987c8f5b8..5ea2584491 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -543,6 +543,10 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>          event |= ACPI_GED_MEM_HOTPLUG_EVT;
>      }
>  
> +    if (ms->nvdimms_state->is_enabled) {
> +        event |= ACPI_GED_NVDIMM_HOTPLUG_EVT;
> +    }
> +
>      dev = qdev_create(NULL, TYPE_ACPI_GED);
>      qdev_prop_set_uint32(dev, "ged-event", event);
>  
> @@ -1928,19 +1932,20 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>                                   Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    const MachineState *ms = MACHINE(hotplug_dev);
>      const bool is_nvdimm = object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM);
>  
> -    if (is_nvdimm) {
> -        error_setg(errp, "nvdimm is not yet supported");
> -        return;
> -    }
> -
>      if (!vms->acpi_dev) {
>          error_setg(errp,
>                     "memory hotplug is not enabled: missing acpi-ged device");
>          return;
>      }
>  
> +    if (is_nvdimm && !ms->nvdimms_state->is_enabled) {
> +        error_setg(errp, "nvdimm is not enabled: missing 'nvdimm' in '-M'");
s/missing 'nvdimm' in '-M'/add 'nvdimm=on' to '-M'/

> +        return;
> +    }
> +
>      pc_dimm_pre_plug(PC_DIMM(dev), MACHINE(hotplug_dev), NULL, errp);
>  }
>  
> @@ -2071,6 +2076,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->plug = virt_machine_device_plug_cb;
>      hc->unplug_request = virt_machine_device_unplug_request_cb;
>      mc->numa_mem_supported = true;
> +    mc->nvdimm_supported = true;
>      mc->auto_enable_numa_with_memhp = true;
>  }
>  
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index d157eac088..9eb86ca4fd 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -82,6 +82,7 @@
>   */
>  #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
>  #define ACPI_GED_PWR_DOWN_EVT      0x2
> +#define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>  
>  typedef struct GEDState {
>      MemoryRegion io;

