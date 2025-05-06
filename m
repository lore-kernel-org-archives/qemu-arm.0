Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3392396njj;
        Tue, 6 May 2025 13:50:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXHmR6r1041Cf9q2cwJeNNJxOU2PDU58uBtq08/ORS4W6JeaJKXbSkrV2dKxYq4GRxO3dSFO1EDnzt42Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHXHEP/1g0YmNKdQJbA1oXt9RsxU6WVW3pjpiGXjiDoBSUKJqh38PphBMu0/VcGznk2ywDU
X-Received: by 2002:a05:622a:4e:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-49225b39fdbmr9155781cf.20.1746564647402;
        Tue, 06 May 2025 13:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746564647; cv=none;
        d=google.com; s=arc-20240605;
        b=dXZ6wrBu8xWRuO+zgAyFFCKz1i4IBLRU7BG6cPI84toWiodW6BGHFSeS/i0pbmvagp
         PVvVEcRH1bWCs2Y2ioQwlt1huLYFwfd4G1N+v6YtLea1M2Wd3gEIfUcELlnfNJ1F/CXG
         vefFyjY9N1O0/ggMiMOQrniOuKtpvSoYiK3CuyUrRhN7RLLZdSv7v+kn+fE7voGaPhZl
         F33hCRJTtiOEwUx4lnupAUKA4STbIcvSeNY4R85hg9C1bsIsqD8Uc/eJw5blhQ8HV9Tr
         BJM2v+Ku6vDBBDvfuTDZo2yd7M0fgBoGH3TsE1I+6MEYjfxCdAy1k//nR41nzJhHLaip
         UNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8jd8PCgX8sR//GvZeqjasfe7QmEYtbm+ayeEYpi3Lvc=;
        fh=ZJI/KJp0ywQH8Py5+E/5a4frhk3vL1XV0aSqm3HDMJg=;
        b=cRnkzP2IdUaRXhK9aWmSadyIlnVL5ap1RgTpUbJ89fmX4Ea8VYR23HsjBUSLp8Y6nF
         z2FBg/kOS+8JCtdTrjOrDctFjRoXMlN3vo28dYbYl91RONjDu3MMDXd+tHmTIMnQh3QC
         yeEEc95AFxgswnYdUxlRUltA1hG3ogfZjdZBK+z38aw+KdfRbmNfiLKe6lsbzZWnRzCa
         b1FaTIzZJlSEXiG0CmQwxEQObzgMWWVHTs/rwkdkP00rZmcDo6Qte3K97AVUxGVABtlF
         EZuhMNrwsvcJOOjgHocZtIcOxQcRheJnpHOvdOEMFfjXAlbhvS7CogI//gP8rX9kOot+
         GxgQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DvcN0KHt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-492229a69d1si4212461cf.306.2025.05.06.13.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 13:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DvcN0KHt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCPFK-0000lh-Ea; Tue, 06 May 2025 16:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uCPFF-0000lE-3C
 for qemu-arm@nongnu.org; Tue, 06 May 2025 16:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ddutile@redhat.com>)
 id 1uCPFC-0000Q9-PB
 for qemu-arm@nongnu.org; Tue, 06 May 2025 16:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746564626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jd8PCgX8sR//GvZeqjasfe7QmEYtbm+ayeEYpi3Lvc=;
 b=DvcN0KHtcMHgHM2zbq9a4tR3eYTX5hMfcoh3wGftXJP9NaMTDL8bKQ/+LFNpfetyDPLlvX
 PH2F7DzYvHr4rryhXU+sfDsf2xgdZtILbLyx9CGkgKccQAsv1GY0Dlg9EPWcezCNOeDPRl
 wbQ1H/gkBI/oXxzhyDSDFknlEkg5NRg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-7eZKO51_OgCiUAhcF2nBLw-1; Tue, 06 May 2025 16:50:23 -0400
X-MC-Unique: 7eZKO51_OgCiUAhcF2nBLw-1
X-Mimecast-MFC-AGG-ID: 7eZKO51_OgCiUAhcF2nBLw_1746564623
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-47693206d3bso153717561cf.1
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 13:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746564623; x=1747169423;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8jd8PCgX8sR//GvZeqjasfe7QmEYtbm+ayeEYpi3Lvc=;
 b=PtTesHECG45KNOxKKMiBiRfdJInMYVzjeXEzjKU7trdAbU5EaLXxhn6NWWW0ujoLit
 JLiEhrwAH3dG8BhvUXepuul4NiX0IGNxOTFYwvms7Ph7tK5Xq+YSEV6VC7ulwxsAczIn
 1N/6xnbVWsBtxHEtbakn08QCpmleh0bwz5IJeSrPwjZ0rd+/czWnGiK34keQDVrrZvaA
 1rVP/5h5RWEa5GFxshVFHSGgeAYCSXORgwwFZO2PRzKsxFLwf9OvLVZ+/8LcnMvw1L/6
 2wEPD1LV+gXieQdhXyV6s7r7Z83v2KgRFmLIC0LUvQSt0glP98xpAGHwi3b5AMvYz1v1
 hgHg==
X-Gm-Message-State: AOJu0Yz1YFXzi2nNaDSt0NrvFDrvwmM+aRQV1PyYtT3kE3yCp5k34gDF
 yaBB2CRs7G0HZQwhg+Hm3OEl9KJa++HNNXAWGjtoJPWRzw19YOocguMyHTYFASPZiUSlzjkFuuE
 U1upf0LPjukQqQ5Jgfw4svNA1irmMqnHvR0N8AWtyJn3c3AE0dg==
X-Gm-Gg: ASbGncvTjfyxI2RyzbMC8CHTQXfRmtkAT+aTYfTUOmihS49Tw+JQXqj7joQ1phQeUey
 5d2VqK7lQbm8qvLELMKT9c2JzrWKQ+nTWqXYzuT0cBIynGM+pMwUkIWFf0LTb7K60XrQLPz5+p1
 h+PkCn0RQ1GBWSblwXhBLVSzf+5uKVTXHbPXQhaQANnf6tqIrqp5sdEgBVpx+GRoLAlBmsGOUa7
 H3ylsXhPOh6jIxs78Al2MMUfQ+cWZtmse0GVlUIKRpESci2n77oUWEWClxq1ghSeUnHrMNUTe6t
 HVfA/ohUSvC3
X-Received: by 2002:a05:622a:5c98:b0:476:739a:5cf3 with SMTP id
 d75a77b69052e-492255613d3mr11190891cf.1.1746564622786; 
 Tue, 06 May 2025 13:50:22 -0700 (PDT)
X-Received: by 2002:a05:622a:5c98:b0:476:739a:5cf3 with SMTP id
 d75a77b69052e-492255613d3mr11190061cf.1.1746564622059; 
 Tue, 06 May 2025 13:50:22 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4922174cc55sm2483521cf.39.2025.05.06.13.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 May 2025 13:50:21 -0700 (PDT)
Message-ID: <e02e884b-0f3d-4426-8a67-2cbd23e80e8c@redhat.com>
Date: Tue, 6 May 2025 16:48:57 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] hw/arm/smmuv3: Add support to associate a PCIe RC
To: Markus Armbruster <armbru@redhat.com>,
 Shameer Kolothum via <qemu-devel@nongnu.org>
Cc: qemu-arm@nongnu.org,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 eric.auger@redhat.com, peter.maydell@linaro.org, jgg@nvidia.com,
 nicolinc@nvidia.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250502102707.110516-1-shameerali.kolothum.thodi@huawei.com>
 <20250502102707.110516-2-shameerali.kolothum.thodi@huawei.com>
 <877c2ut0zk.fsf@pond.sub.org>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <877c2ut0zk.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ztiTYtgLtHUbOWrSwVt9qq5q594kpbJaAcsJUeK8Pa0_1746564623
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ddutile@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5hlzR11dP1UI



On 5/6/25 7:47 AM, Markus Armbruster wrote:
> Shameer Kolothum via <qemu-devel@nongnu.org> writes:
> 
>> Although this change does not affect functionality at present, it lays
>> the groundwork for enabling user-created SMMUv3 devices in
>> future patches
>>
>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>> ---
>>   hw/arm/smmuv3.c | 26 ++++++++++++++++++++++++++
>>   hw/arm/virt.c   |  3 ++-
>>   2 files changed, 28 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
>> index ab67972353..605de9b721 100644
>> --- a/hw/arm/smmuv3.c
>> +++ b/hw/arm/smmuv3.c
>> @@ -24,6 +24,7 @@
>>   #include "hw/qdev-properties.h"
>>   #include "hw/qdev-core.h"
>>   #include "hw/pci/pci.h"
>> +#include "hw/pci/pci_bridge.h"
>>   #include "cpu.h"
>>   #include "exec/target_page.h"
>>   #include "trace.h"
>> @@ -1874,6 +1875,25 @@ static void smmu_reset_exit(Object *obj, ResetType type)
>>       smmuv3_init_regs(s);
>>   }
>>   
>> +static int smmuv3_pcie_bus(Object *obj, void *opaque)
>> +{
>> +    DeviceState *d = opaque;
>> +    PCIBus *bus;
>> +
>> +    if (!object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
>> +        return 0;
>> +    }
>> +
>> +    bus = PCI_HOST_BRIDGE(obj)->bus;
>> +    if (d->parent_bus && !strcmp(bus->qbus.name, d->parent_bus->name)) {
>> +        object_property_set_link(OBJECT(d), "primary-bus", OBJECT(bus),
>> +                                 &error_abort);
>> +        /* Return non-zero as we got the bus and don't need further iteration.*/
>> +        return 1;
>> +    }
>> +    return 0;
>> +}
>> +
>>   static void smmu_realize(DeviceState *d, Error **errp)
>>   {
>>       SMMUState *sys = ARM_SMMU(d);
>> @@ -1882,6 +1902,10 @@ static void smmu_realize(DeviceState *d, Error **errp)
>>       SysBusDevice *dev = SYS_BUS_DEVICE(d);
>>       Error *local_err = NULL;
>>   
>> +    if (!object_property_get_link(OBJECT(d), "primary-bus", &error_abort)) {
>> +        object_child_foreach_recursive(object_get_root(), smmuv3_pcie_bus, d);
>> +    }
>> +
>>       c->parent_realize(d, &local_err);
>>       if (local_err) {
>>           error_propagate(errp, local_err);
>> @@ -1996,6 +2020,8 @@ static void smmuv3_class_init(ObjectClass *klass, const void *data)
>>       device_class_set_parent_realize(dc, smmu_realize,
>>                                       &c->parent_realize);
>>       device_class_set_props(dc, smmuv3_properties);
>> +    dc->hotpluggable = false;
>> +    dc->bus_type = TYPE_PCIE_BUS;
> 
> This is very, very wrong.
> 
> The function serves as .class_init() for QOM type "arm-smmuv3", defined
> as:
> 
>     static const TypeInfo smmuv3_type_info = {
>         .name          = TYPE_ARM_SMMUV3,
>         .parent        = TYPE_ARM_SMMU,
> 
> Subtype of "arm-smmuv3".
> 
>         .instance_size = sizeof(SMMUv3State),
>         .instance_init = smmuv3_instance_init,
>         .class_size    = sizeof(SMMUv3Class),
>         .class_init    = smmuv3_class_init,
>     };
> 
> 
>      static const TypeInfo smmu_base_info = {
>          .name          = TYPE_ARM_SMMU,
>          .parent        = TYPE_SYS_BUS_DEVICE,
> 
> Subtype of "sys-bus-device".
> 
>          .instance_size = sizeof(SMMUState),
>          .class_data    = NULL,
>          .class_size    = sizeof(SMMUBaseClass),
>          .class_init    = smmu_base_class_init,
>          .abstract      = true,
>      };
> 
> Have a look at the instance struct:
> 
>     struct SMMUv3State {
>         SMMUState     smmu_state;
> 
> Starts with the supertype's instance struct, as is proper.
> 
>         uint32_t features;
>         [more ...]
>     };
> 
> Here's the supertype's instance struct:
> 
>     struct SMMUState {
>         /* <private> */
>         SysBusDevice  dev;
> 
> Again, starts with the supertype's instance struct.
> 
>         const char *mrtypename;
>         [more...]
>     };
> 
> This is a sysbus device, not a PCI device.  Monkey-patching dc->bus_type
> from TYPE_SYSTEM_BUS to TYPE_PCIE_BUS won't change that.  All it
> accomplishes is making the qdev core believe it plugs into a PCIE bus.
> This can only end in tears.
> 
> In fact, when I build with the entire series applied (so the device can
> actually be used with -device), the result dies within seconds of my ad
> hoc testing:
> 
>      $ qemu-system-aarch64 -nodefaults -S -display none -monitor stdio -M virt -device pxb-pcie,id=pcie.1,bus_nr=2 -device arm-smmuv3,bus=pcie.1
>      QEMU 10.0.50 monitor - type 'help' for more information
>      qemu-system-aarch64: -device arm-smmuv3,bus=pcie.1: warning: SMMUv3 device only supported with pcie.0 for DT
>      (qemu) info qtree
>      bus: main-system-bus
>        type System
>        dev: pxb-host, id ""
>          x-config-reg-migration-enabled = true
>          bypass-iommu = false
>          bus: pcie.1
>            type pxb-pcie-bus
>            dev: arm-smmuv3, id ""
>              gpio-out "sysbus-irq" 4
>              stage = "nested"
>              bus_num = 0 (0x0)
>      Segmentation fault (core dumped)
> 
> Backtrace:
> 
>      #0  0x00005555557d8521 in pcibus_dev_print
>          (mon=0x55555826d0e0, dev=0x5555590ad360, indent=8)
>          at ../hw/pci/pci-hmp-cmds.c:140
>      #1  0x0000555555eac0a0 in bus_print_dev
>          (bus=<optimized out>, mon=<optimized out>, dev=0x5555590ad360, indent=8)
>          at ../system/qdev-monitor.c:773
>      #2  qdev_print (mon=<optimized out>, dev=<optimized out>, indent=8)
>          at ../system/qdev-monitor.c:805
>      #3  qbus_print
>          (mon=mon@entry=0x55555826d0e0, bus=bus@entry=0x5555590ac4a0, indent=6,
>          indent@entry=4, details=details@entry=true) at ../system/qdev-monitor.c:821
>      #4  0x0000555555eabd92 in qbus_print
>          (mon=0x55555826d0e0, bus=<optimized out>, indent=2, details=true)
>          at ../system/qdev-monitor.c:824
>      #5  0x0000555555979789 in handle_hmp_command_exec
>          (cmd=<optimized out>, mon=0x55555826d0e0, qdict=0x55555907d8e0)
>          at ../monitor/hmp.c:1106
>      #6  handle_hmp_command_exec
>          (mon=0x55555826d0e0, cmd=0x55555769d220 <hmp_info_cmds+2560>, qdict=0x55555907d8e0) at ../monitor/hmp.c:1098
>      #7  handle_hmp_command (mon=mon@entry=0x55555826d0e0, cmdline=<optimized out>,
>          cmdline@entry=0x555558657490 "info qtree") at ../monitor/hmp.c:1158
>      #8  0x000055555597983c in monitor_command_cb
> 
> Crash line is
> 
>      int class = pci_get_word(d->config + PCI_CLASS_DEVICE);
> 
> Debugger shows that d->config is invalid.  This is hardly surprising!
> 
> The qdev core is trying to print information on the "arm_smmuv3" device
> here.  It's working with a DeviceState.  Your monkey-patching convinced
> it it's a PCIDevice, so it duly calls pcibus_dev_print() to print PCI
> device information.  pcibus_dev_print() casts the DeviceState * to
> PCIDevice *.  This assumes the device's instance actually starts with
> PCIDevice.  It actually starts with SysBusDevice.
> 
> Unsurprisingly, and "make check" also fails:
> 
>      >>> MESON_TEST_ITERATION=1 MSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 RUST_BACKTRACE=1 QTEST_QEMU_BINARY=./qemu-system-aarch64 QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/work/armbru/qemu/tests/dbus-vmstate-daemon.sh ASAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1 PYTHON=/work/armbru/qemu/bld-arm/pyvenv/bin/python3 UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 MALLOC_PERTURB_=22 /work/armbru/qemu/bld-arm/tests/qtest/test-hmp --tap -k
>      ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
>      stderr:
>      qemu-system-aarch64: ../hw/core/qdev.c:113: qdev_set_parent_bus: Assertion `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)' failed.
>      Broken pipe
>      ../tests/qtest/libqtest.c:208: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
> 
> and
> 
>      >>> MESON_TEST_ITERATION=1 MSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 RUST_BACKTRACE=1 QTEST_QEMU_BINARY=./qemu-system-aarch64 MALLOC_PERTURB_=86 QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/work/armbru/qemu/tests/dbus-vmstate-daemon.sh ASAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1 PYTHON=/work/armbru/qemu/bld-arm/pyvenv/bin/python3 UBSAN_OPTIONS=halt_on_error=1:abort_on_error=1:print_summary=1:print_stacktrace=1 /work/armbru/qemu/bld-arm/tests/qtest/qom-test --tap -k
>      ――――――――――――――――――――――――――――――――――――― ✀  ―――――――――――――――――――――――――――――――――――――
>      stderr:
>      qemu-system-aarch64: ../hw/core/qdev.c:113: qdev_set_parent_bus: Assertion `dc->bus_type && object_dynamic_cast(OBJECT(bus), dc->bus_type)' failed.
>      Broken pipe
>      ../tests/qtest/libqtest.c:208: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
> 
> Please make sure "make check" passes before posting patches for review.
> If you need help getting there, post them marked RFC and with the bad
> test results right in the cover letter.
> 
>>   }
>>   
>>   static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 177f3dd22c..3bae4e374f 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -56,6 +56,7 @@
>>   #include "qemu/cutils.h"
>>   #include "qemu/error-report.h"
>>   #include "qemu/module.h"
>> +#include "hw/pci/pci_bus.h"
>>   #include "hw/pci-host/gpex.h"
>>   #include "hw/virtio/virtio-pci.h"
>>   #include "hw/core/sysbus-fdt.h"
>> @@ -1442,7 +1443,7 @@ static void create_smmu(const VirtMachineState *vms,
>>       }
>>       object_property_set_link(OBJECT(dev), "primary-bus", OBJECT(bus),
>>                                &error_abort);
>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +    qdev_realize_and_unref(dev, &bus->qbus, &error_fatal);
>>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, base);
>>       for (i = 0; i < NUM_SMMU_IRQS; i++) {
>>           sysbus_connect_irq(SYS_BUS_DEVICE(dev), i,
> 
> What are you trying to accomplish?
> 
> I *guess* you're trying to change the "arm-smmuv3" device to be a PCI
> device.  Correct?
> 
> The only way to do that is making it a subtype of PCIDevice, i.e. change
> the parent chain from
> 
>     arm-smmuv3 -> arm-smmu -> sys-bus-device -> device -> object
> 
> to something like
> 
>     arm-smmuv3 ->    ...   -> pci-device -> device -> object
> 
> Note you cannot have different subtypes of the same supertype (say
> "arm-smmu") plug into different buses.  If you need a common device core
> to plug into different buses, things get more complicated.  Here's how
> the "serial-FOO" devices do it:
> 
> * "serial-mm", a subtype of "sys-bus-device", thus plugs into system bus
> * "serial-isa", a subtype of "isa-device", thus plugs into ISA bus
> * "serial-pci", a subtype of "pci-device", thus plugs into PCI bus
> 
> They all *contain* the core "serial" device, which is a subtype of
> "device", and thus does not plug into any bus.  "Contain" is "has a",
> not "subtype of".
> 
> [...]
> 
The serial-FOO analogy doesn't quite work for iommu/smmu's, because one is plugging a 'serial device' INTO a FOO-bus.

In this series, an iommu/smmu needs to be placed -BETWEEN- a sysbus and a PCIe-tree,
or step-wise, plug an smmuv3 into a sysbus, and a pcie tree/domain/RC into an SMMUv3.

So, an smmu needs to be associated with a bus (tree), i.e., pcie.0, pcie.1...
One could model it as a PCIe device, attached at the pcie-RC ... but that's not how it's modelled in ARM hw.
SMMU's are discovered via ACPI tables.

That leaves us back to the 'how to associate an SMMUv3 to a PCIe tree(RC)',
and that leads me to the other discussion & format I saw btwn Eric & Shameer:
  -device arm-smmv3,id=smmuv3.3
  -device xxxx,smmuv3= smmuv3.3
where one tags a (PCIe) device to an smmuv3(id), which is needed to build the (proper) IORT for (pcie-)device<->SMMUv3 associativity in a multi-SMMUv3 configuration.

We could keep the bus=pcie.X option for the -device arm-smmuv3 to indicate that all PCIe devices connected to the pcie.0 tree go through that smmuv3;
qdev would model/config as the smmuv3 is 'attached to pcie.0'... which it sorta is...  and I think the IORT build could associate all devices on pcie.0 to be associated
with the proper smmuv3.



  

