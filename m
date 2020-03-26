Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1746094lfi;
        Thu, 26 Mar 2020 04:01:27 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtKyAHeUJxoH+Gcy95vDY5l5KOidTxjtkpED3kWfAbcaIKkp3iY5ooWZjJFMn3ZjKqbdThY
X-Received: by 2002:a37:687:: with SMTP id 129mr7060190qkg.321.1585220487369;
        Thu, 26 Mar 2020 04:01:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585220487; cv=none;
        d=google.com; s=arc-20160816;
        b=l8Z7XVmz87cl45H6mCZpy2ZHGs+vyfzTWAtyTi2PCBFVzgkXmg/KVgoxAsBeHCRuCE
         CL34SuDcBRFFfrRWVieh6eUfg+sETFsKzMUd+BeDiUmrGXXRcotaxTRDZ8ZDdT0p3TA7
         /EhWXycYQ6empTiKI5x6qwBV9dD8HzrAE9/ToYXmDoCIn+1OkPMEQcc+VOJZ4d6Bjj/u
         gqUi4E5X6K3PMOREjzxhotx1O4mkGAO/pdLo4w1LGInqauZxf1fBg4YaR5iLGAVu2P2r
         0lin/qx273Q4J8YS2ze8e05c1B1/w9puRpWncuYiGtlQgNg3efa8UxvIxfiuhvDKBZ6o
         GhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2/2wrMEwU8K1EQxN273Pr7zZuw6dVXbtyGGdt5alEzs=;
        b=lAZWChCbbZYfhXGgp6NvzK6bMXGB6xdFGqgGM08A/y9UbCSBRVf/craF971Ief+eEc
         hfNuW2oDLWAC3ZBaTVo3E20Kew4oHMblhHfbo/MYFjxqf/Oh9wAswqbEIBXoTTTRJDU0
         Y0R9b29JrMRDlErY2MOVqpnQPSjZqCpAzFLpS1CX7ogGXCxSnZKB0W3PWTbJP3f5bffq
         qXmq2QV3uF5D3PQNHAxpBPGr/2brs6oN/3sb/9F6bjShnPMWvs0J1eH2l3graD1tKGHO
         MstzUJqDz/8kyo6ByDn1S9bZpuQ76L8kANgeWwx//7qopNTQgdC6InN4CbWWkcHiH0jk
         63NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ekF84Wg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si915653qkr.89.2020.03.26.04.01.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 04:01:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ekF84Wg9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHQGM-0003Ov-QF
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 07:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jHQG7-0003Du-An
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 07:01:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jHQG5-0003eV-EB
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 07:01:11 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:31787)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jHQG5-0003e4-8Z
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 07:01:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585220468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2/2wrMEwU8K1EQxN273Pr7zZuw6dVXbtyGGdt5alEzs=;
 b=ekF84Wg9FUrpAr1KzhKxr7VE3ueSLTvhhbw5nGuhht4VvW/K1xURn0B5VNeB3eJ9xYSIYk
 oWUlC936w6WQTyrTToVlNozhKn3ekBeMMMtweSQFSUVj8jU1SsZQQq0uHici3MybXE4G+X
 qyvsHCHJiKW+MrJRRj30twewKyMhlBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-vsKMGt80N7S49sCooT3n1A-1; Thu, 26 Mar 2020 07:01:02 -0400
X-MC-Unique: vsKMGt80N7S49sCooT3n1A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0AE5318B9FC4;
 Thu, 26 Mar 2020 11:01:01 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AE1D19925;
 Thu, 26 Mar 2020 11:00:55 +0000 (UTC)
Subject: Re: [RFC v1] arm/virt: Add memory hot remove support
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20200318123722.19736-1-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b6c6f33b-7e4f-0b46-b67d-2de572e12626@redhat.com>
Date: Thu, 26 Mar 2020 12:00:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200318123722.19736-1-shameerali.kolothum.thodi@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: peter.maydell@linaro.org, mst@redhat.com,
 Anshuman Khandual <anshuman.khandual@arm.com>, linuxarm@huawei.com,
 xuwei5@hisilicon.com, prime.zeng@hisilicon.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Wg3UVTGJdwe

Hi Shameer,

On 3/18/20 1:37 PM, Shameer Kolothum wrote:
> This adds support for memory hot remove on arm/virt that
> uses acpi ged device.

I gave this a try and it works fine if the PCDIMM slot was initially
hotplugged:
(QEMU) object-add qom-type=memory-backend-ram id=mem1 props.size=4294967296
{"return": {}}
(QEMU) device_add driver=pc-dimm  id=pcdimm1 memdev=mem1
(QEMU) device_del id=pcdimm1
{"return": {}}

on guest I can see:
[   82.466321] Offlined Pages 262144
[   82.541712] Offlined Pages 262144
[   82.589236] Offlined Pages 262144
[   82.969166] Offlined Pages 262144

However I noticed that if qemu is launched directly with

-m 16G,maxmem=32G,slots=2 \
-object memory-backend-ram,id=mem1,size=4G \
-device pc-dimm,memdev=mem1,id=dimm1,driver=pc-dimm -device

and then in the qmp shell:
(QEMU) device_del id=dimm1

the hot-unplug fails in guest:

[   78.897407] Offlined Pages 262144
[   79.260811] Offlined Pages 262144
[   79.308105] Offlined Pages 262144
[   79.333675] page:fffffe00137d1f40 refcount:1 mapcount:0
mapping:ffff0004ea9f20b1 index:0xaaab11c6e
[   79.335927] anon flags: 0x17ffff8000080024(uptodate|active|swapbacked)
[   79.337571] raw: 17ffff8000080024 dead000000000100 dead000000000122
ffff0004ea9f20b1
[   79.339502] raw: 0000000aaab11c6e 0000000000000000 00000001ffffffff
ffff0004fd4e3000
[   79.341701] page dumped because: unmovable page
[   79.342887] page->mem_cgroup:ffff0004fd4e3000
[   79.354729] page:fffffe00137d1f40 refcount:1 mapcount:0
mapping:ffff0004ea9f20b1 index:0xaaab11c6e
[   79.357012] anon flags: 0x17ffff8000080024(uptodate|active|swapbacked)
[   79.358658] raw: 17ffff8000080024 dead000000000100 dead000000000122
ffff0004ea9f20b1
[   79.360611] raw: 0000000aaab11c6e 0000000000000000 00000001ffffffff
ffff0004fd4e3000
[   79.362560] page dumped because: unmovable page
[   79.363742] page->mem_cgroup:ffff0004fd4e3000
[   79.368636] memory memory20: Offline failed.

I did not expect this. The PCDIMM slot in that case does not seem to be
interpreted as a hot-unpluggable one (?). I added Anshuman in cc.

Thanks

Eric



> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
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
> 

