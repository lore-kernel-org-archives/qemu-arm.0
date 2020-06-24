Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp449548lfm;
        Wed, 24 Jun 2020 07:09:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzl4V3ICtJ3vMFDJ6GXI8AuXRDz7eDPZ51doc4FIHLvcTNfWcW7jSA8o8jU6qa+elv1Ym7o
X-Received: by 2002:a25:be02:: with SMTP id h2mr43900956ybk.315.1593007745029;
        Wed, 24 Jun 2020 07:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593007745; cv=none;
        d=google.com; s=arc-20160816;
        b=gi9KxWZwEtWZG9KDN2hyKvSSbHgenYl3YRx2x8kKB+XciCPtvVARHf8xxCSsV/b1x4
         lORenxXRdUCs58iEEAabQ0rYBzY9Thnc7pGuEc1e1J63QXwnrNBJQZWp92r+fEoUv0kG
         VYNjx/Ba6aI7HSzHIQ/D7EmTzHdqza2pz9BI02acFhGqktZnnoPhDc4/NB5giuEP2Mo8
         Hec13X6CEd2LNv0kT3KR7rZuVLPS8h5zP5wU9pcR8WXScIqjSZfOueBSuqhLDAW+K7Me
         2EqaT5W0vweZxmVUWkWe2CWQk1j+qLDQdafvxvvf4BR50Cu9V1U1HTzOR8rCoS61uN+h
         zHaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=jBMJMvbJpICrv0jM2pKWkiaC2LZ+F06Z/ZK/AOtK1e4=;
        b=GdWMQKGCRWrToc+mr/lCzKzsGt/k0yutK7EFKCvwTcYWZgtAihZVjCO7brM/Z2sGgX
         YbG9z5RvQ6mBVabcCc2UoYyLI37sREJ493mCUtLQ/rT5nnQPvbd7WEa/43Sfo9RB2+HY
         kSnkaDT+g21mtqsTyvYUpRMVoLyC8slnqDXfn7Cgz9YAMk+uTR1Ivr8Sy7rFQZ9+k8az
         XYNwPKsjdVxprT3bMYD4bp3S9+XHg0/CQa+3W/gJqRw8AxXgemFkrbRdWWzzuaTm5W4+
         ukTuxvgVAs2zjAFQ5zswNCWj8HgvPi2hsp1NwaOv6gZXc/J/BLVEk9GuHKszfYkT1lff
         9ORg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iYC9dxpX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si19570234ybb.279.2020.06.24.07.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jun 2020 07:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iYC9dxpX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jo65I-00061r-Ct
	for alex.bennee@linaro.org; Wed, 24 Jun 2020 10:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jo657-0005wJ-PK
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 10:08:53 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42558
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jo655-0004iZ-H5
 for qemu-arm@nongnu.org; Wed, 24 Jun 2020 10:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593007730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jBMJMvbJpICrv0jM2pKWkiaC2LZ+F06Z/ZK/AOtK1e4=;
 b=iYC9dxpX8PjyFIzFunDvXtmKX3zAFX8SXqKisPa5V5xiRD8rdrW1KIJtfWbZgKmx4k8OOp
 DsaoLSJYfCLR6QnON3+Qni9rjDyCKeltppHd08Duawq+auhdFMIZydM+4ViKRxeImFF/tm
 dySHLHVo3Amyc86HTVD59wJtJ9NyRtg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-ly0BFLBlMnOEGspFsl_dXA-1; Wed, 24 Jun 2020 10:08:48 -0400
X-MC-Unique: ly0BFLBlMnOEGspFsl_dXA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD0631937FC4;
 Wed, 24 Jun 2020 14:08:46 +0000 (UTC)
Received: from localhost (unknown [10.40.208.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3070778FC5;
 Wed, 24 Jun 2020 14:08:37 +0000 (UTC)
Date: Wed, 24 Jun 2020 16:08:34 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v4] arm/virt: Add memory hot remove support
Message-ID: <20200624160834.5191b73e@redhat.com>
In-Reply-To: <20200622124157.20360-1-shameerali.kolothum.thodi@huawei.com>
References: <20200622124157.20360-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 01:59:40
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, mst@redhat.com, linuxarm@huawei.com,
 xuwei5@hisilicon.com, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, prime.zeng@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HpSSPnmZnLOr

On Mon, 22 Jun 2020 13:41:57 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This adds support for memory(pc-dimm) hot remove on arm/virt that
> uses acpi ged device.
> 
> NVDIMM hot removal is not yet supported.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> v2 --> v3
>   -Addressed Eric's comments on v3. 
> v2 --> v3
>   -Addressed Eric's review comment and added check for NVDIMM.
> RFC v1 --> v2
>   -Rebased on top of latest Qemu master.
>   -Dropped "RFC" and tested with kernel 5.7-rc6
> ---
>  hw/acpi/generic_event_device.c | 29 ++++++++++++++++
>  hw/arm/virt.c                  | 62 ++++++++++++++++++++++++++++++++--
>  2 files changed, 89 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 1cb34111e5..b8abdefa1c 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -193,6 +193,33 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>      }
>  }
>  
> +static void acpi_ged_unplug_request_cb(HotplugHandler *hotplug_dev,
> +                                       DeviceState *dev, Error **errp)
> +{
> +    AcpiGedState *s = ACPI_GED(hotplug_dev);
> +
> +    if ((object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) &&
> +                       !(object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)))) {
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
> @@ -318,6 +345,8 @@ static void acpi_ged_class_init(ObjectClass *class, void *data)
>      dc->vmsd = &vmstate_acpi_ged;
>  
>      hc->plug = acpi_ged_device_plug_cb;
> +    hc->unplug_request = acpi_ged_unplug_request_cb;
> +    hc->unplug = acpi_ged_unplug_cb;
>  
>      adevc->send_event = acpi_ged_send_event;
>  }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index caceb1e4a0..80ef2d7b7a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2177,11 +2177,68 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
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
> +        error_setg(&local_err,
> +                   "memory hotplug is not enabled: missing acpi-ged device");
> +        goto out;
> +    }
> +
> +    if (object_dynamic_cast(OBJECT(dev), TYPE_NVDIMM)) {
> +        error_setg(&local_err,
> +                   "nvdimm device hot unplug is not supported yet.");
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
> +    qdev_unrealize(dev);

doesn't pc_dimm_unplug() do unrealize already?
(/me wonders why it doesn't explode here,
are we leaking a refference somewhere so dimm is still alive?)

> +
> +out:
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
> @@ -2262,6 +2319,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>      hc->pre_plug = virt_machine_device_pre_plug_cb;
>      hc->plug = virt_machine_device_plug_cb;
>      hc->unplug_request = virt_machine_device_unplug_request_cb;
> +    hc->unplug = virt_machine_device_unplug_cb;
>      mc->numa_mem_supported = true;
>      mc->nvdimm_supported = true;
>      mc->auto_enable_numa_with_memhp = true;

