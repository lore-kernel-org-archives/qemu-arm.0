Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2954565lfi;
        Tue, 24 Mar 2020 09:13:59 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs2CpKCyGabVy00qEoeB9IneyfXY7eS+mLDs2xQjOx/+fyggEBQww31ag0urXqBJeA7m5+O
X-Received: by 2002:ac8:33d2:: with SMTP id d18mr25905438qtb.325.1585066438922;
        Tue, 24 Mar 2020 09:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585066438; cv=none;
        d=google.com; s=arc-20160816;
        b=tZ+nPiZzfRW1aFnvtRTB+MW5AlLVBpM9wJ6OyTeAs4vALA1j5OvBejowrLhFODBx0v
         xl8NcJeWewmKkpH25olapKPJj96nif+40CFLaOZIMP+5NpoLO47ZNozNcbcKX6eUKzHx
         UF0D2HEuaqKPU92PRMs/wjc86of6/ebkK+LYgcctiC4v5J6HrCy714Pr/QDEPuOTPZOA
         1A1HqmVn0u089bLCYKjipuFJ+6l9uI2Cixp8LjOuFcYrr+kH4bEQbS9uNDOy3w6LEelw
         ANBpWJKCACLVyr5DR59RLKUeTyK1j/uvn9q3yNnElk1iuAk3dMEsIykkyWzYBWKbs+Bc
         cStw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=pv8bjtviCRxJ0jNBJudOu0UtVGtQU3f5vCwiJ2taSgs=;
        b=OoBgsOZFxH8BAw2lhJZnZMY6oYxHJFlT0qp42FBBy8D188WrdP7SE6zMq9LAwaLok3
         NOCwrkR8txyc9AEUFuDLVqNVXh0hjGZ2o3RK5SHL88U5fqx0IDgdKPUkqxFn57+wm5Wd
         NEwTthWfF/siJH94LISTqnkGd4XyoCYgZ1eQzb0D13b+EoyeAeClhuvUyjo1vRvXGaVX
         FVoETqgD1+3CgZDaeHm8hr0ZGZ3QKX1QDqFG9/e3peuZ+E+4TFa8I3ZaX5ZfCplC5Wgs
         dLabCGUcC+CPgg7hLC+cEAjHawHQKW4AME3qEts0gcJj5NayM3b/8JpFTrVYF8qdco9C
         XRTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nv7wID65;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16si3557159qkj.81.2020.03.24.09.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 09:13:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nv7wID65;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGmBi-0000kN-CT
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 12:13:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46526)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jGmB0-0000L2-1g
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jGmAy-00074H-O0
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:13:13 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:56475)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jGmAy-00073z-Jk
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 12:13:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585066392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pv8bjtviCRxJ0jNBJudOu0UtVGtQU3f5vCwiJ2taSgs=;
 b=Nv7wID65ZOKPy/PW50AX4A5auAJr2MZI0e7YZkFY+/QDqj+3n0Ij1IaBSK9KpjtfIC4cl/
 PsEdrtfXJ/xSX6djmJn1mg2zpoYR1WehKTB5DZR3uFXAoNE2GkhbSUfNB0ecGxO5wsTC1O
 eYiQLWF9Kjc15HYrPlHFqyXcZibwQns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-J84Vd0uLMx69521nsauxhQ-1; Tue, 24 Mar 2020 12:13:07 -0400
X-MC-Unique: J84Vd0uLMx69521nsauxhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A22FE1137845;
 Tue, 24 Mar 2020 16:13:05 +0000 (UTC)
Received: from localhost (unknown [10.40.208.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6AED2A0A72;
 Tue, 24 Mar 2020 16:12:54 +0000 (UTC)
Date: Tue, 24 Mar 2020 17:12:52 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [RFC v1] arm/virt: Add memory hot remove support
Message-ID: <20200324171252.7918e522@redhat.com>
In-Reply-To: <20200318123722.19736-1-shameerali.kolothum.thodi@huawei.com>
References: <20200318123722.19736-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: peter.maydell@linaro.org, mst@redhat.com, linuxarm@huawei.com,
 xuwei5@hisilicon.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, prime.zeng@hisilicon.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8pIhITh9iiD5

On Wed, 18 Mar 2020 12:37:22 +0000
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This adds support for memory hot remove on arm/virt that
> uses acpi ged device.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Looks fine to me,
please repost once 5.0 is released.

> ---
>  -RFC because linux kernel support for mem hot remove is just queued
>   for 5.7[1].
>  -Tested with guest kernel 5.6-rc5 + [1]
> 
> 1. https://patchwork.kernel.org/cover/11419301/
> ---
>  hw/acpi/generic_event_device.c | 28 +++++++++++++++++
>  hw/arm/virt.c                  | 56 ++++++++++++++++++++++++++++++++--
>  2 files changed, 82 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 021ed2bf23..3e28c110fa 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -182,6 +182,32 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>      }
>  }
>  
> +static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
> +                                       DeviceState *dev, Error **errp)
> +{
> +    AcpiGedState *s = ACPI_GED(hotplug_dev);
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        acpi_memory_unplug_request_cb(hotplug_dev, &s->memhp_state, dev, errp);
> +    } else {
> +        error_setg(errp, "acpi: device unplug request for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
> +static void acpi_ged_unplug_cb(HotplugHandler *hotplug_dev,
> +                               DeviceState *dev, Error **errp)
> +{
> +    AcpiGedState *s = ACPI_GED(hotplug_dev);
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        acpi_memory_unplug_cb(&s->memhp_state, dev, errp);
> +    } else {
> +        error_setg(errp, "acpi: device unplug for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
>  static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  {
>      AcpiGedState *s = ACPI_GED(adev);
> @@ -286,6 +312,8 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
>      dc->vmsd = &vmstate_acpi_ged;
>  
>      hc->plug = acpi_ged_device_plug_cb;
> +    hc->unplug_request = acpi_ged_unplug_request_cb;
> +    hc->unplug = acpi_ged_unplug_cb;
>  
>      adevc->send_event = acpi_ged_send_event;
>  }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 94f93dda54..91974e4e80 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2096,11 +2096,62 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>      }
>  }
>  
> +static void virt_dimm_unplug_request(HotplugHandler *hotplug_dev,
> +                                     DeviceState *dev, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    Error *local_err = NULL;
> +
> +    if (!vms->acpi_dev) {
> +        error_setg(errp,
> +                   "memory hotplug is not enabled: missing acpi-ged device");
> +        goto out;
> +    }
> +
> +    hotplug_handler_unplug_request(HOTPLUG_HANDLER(vms->acpi_dev), dev,
> +                                   &local_err);
> +out:
> +    error_propagate(errp, local_err);
> +}
> +
> +static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
> +                             DeviceState *dev, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +    Error *local_err = NULL;
> +
> +    hotplug_handler_unplug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &local_err);
> +    if (local_err) {
> +        goto out;
> +    }
> +
> +    pc_dimm_unplug(PC_DIMM(dev), MACHINE(vms));
> +    object_property_set_bool(OBJECT(dev), false, "realized", NULL);
> +
> + out:
> +    error_propagate(errp, local_err);
> +}
> +
>  static void virt_machine_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>                                            DeviceState *dev, Error **errp)
>  {
> -    error_setg(errp, "device unplug request for unsupported device"
> -               " type: %s", object_get_typename(OBJECT(dev)));
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_dimm_unplug_request(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "device unplug request for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
> +}
> +
> +static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
> +                                          DeviceState *dev, Error **errp)
> +{
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> +        virt_dimm_unplug(hotplug_dev, dev, errp);
> +    } else {
> +        error_setg(errp, "virt: device unplug for unsupported device"
> +                   " type: %s", object_get_typename(OBJECT(dev)));
> +    }
>  }
>  
>  static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
> @@ -2181,6 +2232,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->pre_plug = virt_machine_device_pre_plug_cb;
>      hc->plug = virt_machine_device_plug_cb;
>      hc->unplug_request = virt_machine_device_unplug_request_cb;
> +    hc->unplug = virt_machine_device_unplug_cb;
>      mc->numa_mem_supported = true;
>      mc->auto_enable_numa_with_memhp = true;
>      mc->default_ram_id = "mach-virt.ram";

