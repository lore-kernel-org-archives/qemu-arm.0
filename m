Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3963253lfm;
        Tue, 23 Jun 2020 03:15:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw7kh3NEPKl/LWfTmP+3AW9Z9aOFIwE6WsXu+SlIf9MN3h1uPmH4UyJLc/1uwD1JRppxU5
X-Received: by 2002:a25:7146:: with SMTP id m67mr36359690ybc.384.1592907327837;
        Tue, 23 Jun 2020 03:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592907327; cv=none;
        d=google.com; s=arc-20160816;
        b=s8rLMnY6sw5PsDfwUEvYLkdIooiG1yWH76p0Q5BZxSiS3zscAZGvZzmJPA3HeZTZ4r
         B3QwG4RvJmPK0SVFZV8hPZek8KAeieLBxhLZ71Hzgz1YPL50l6K4LNt5+kzUsn3sH7Jz
         a2B/0UwOK3dkF/230Dfagr7q7x5NFSuZMvyhB4K+kkZq35zVPwf7+Bm8Enav3xlEmNKh
         TLmSH779PBLFz9mkqj9gAwIL8eaW+xiaVHiyIaflkeckALG3lnvEPH/IwoEeS5Hehbc6
         xMlCx4JiBW6/udXOvBIJ6P0VM0OR6LGORa3hMZpkD/1XJxJ8TkyRyBn2WMjwnxbOdEHZ
         V3yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=iEfY+tZ2PCy8JeTN43UakEl6M1aqVSliq+4YVnuHaeE=;
        b=f2ihuHZPuy/JMwf+ibSm6bq6n/9D1lIquUlOcNZ4An8J/SHLWkWpDbFSDR8ObB/3vs
         EWTg5hKjLE1WYU8W7btciUC5NfhQR2F2GkLByVEk7bhA0CTX00/b9Nndd8pDt35K1FSo
         8Twn2SWHoj9Fg8Hjk6HJcwytTfOaUPKMQBZzvEB4iAMxB3viJSKqPvuyuKIsCZKr0ft4
         MRsJHJLSYevG1LVcBtGFnPFBqEdrWojw02TSdqIxV2hQBJ0UEZgNzfcKrZdgm26pff2W
         RBDPscESlbs0ccIg6z6nbB+nIP8niJnjUBm4RnajB52KUH+NqwUWZveVMHTM6qr0yMrg
         vnFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U6D6b5qj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l5si15928105ybo.454.2020.06.23.03.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 03:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=U6D6b5qj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnfxf-0006s5-6x
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 06:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnfxW-0006oj-Fx
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 06:15:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40077
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jnfxU-0001gw-Ps
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 06:15:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592907315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEfY+tZ2PCy8JeTN43UakEl6M1aqVSliq+4YVnuHaeE=;
 b=U6D6b5qj6SfBNkpE8HqC56Dv9YbIlewPmohySyCSgHKUxsk9XUaiAWFi96z5CT7dswMEul
 /CEKA/Hhe8cQll2YxNgBPrNHxiVTSAgMpq4F8Kx4TI90bqBNsFk9wNFsj18I9ufNNwebHX
 EFVA/aWe5gbUM4lXpe0KcnFQSYJXGA4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-U2OimACSOOCZGrmTGjBu8w-1; Tue, 23 Jun 2020 06:15:12 -0400
X-MC-Unique: U2OimACSOOCZGrmTGjBu8w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2056107ACF3;
 Tue, 23 Jun 2020 10:15:10 +0000 (UTC)
Received: from [10.36.114.197] (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0047160CD3;
 Tue, 23 Jun 2020 10:15:00 +0000 (UTC)
Subject: Re: [PATCH v4] arm/virt: Add memory hot remove support
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20200622124157.20360-1-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b4d4a654-3d45-f7d7-1009-8e9f055f88d4@redhat.com>
Date: Tue, 23 Jun 2020 12:14:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200622124157.20360-1-shameerali.kolothum.thodi@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 02:55:19
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
 xuwei5@hisilicon.com, prime.zeng@hisilicon.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hruFoOA6nZuR

Hi Shameer,

On 6/22/20 2:41 PM, Shameer Kolothum wrote:
> This adds support for memory(pc-dimm) hot remove on arm/virt that
> uses acpi ged device.
> 
> NVDIMM hot removal is not yet supported.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Works fine for me when passing "movable_node" in the guest kernel
params. I am able to hotplug and hotremove PCDIMM slots several times

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
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
> 

