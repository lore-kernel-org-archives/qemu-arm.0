Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4072418njc;
        Mon, 26 May 2025 02:16:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWVshqEgaPElzVhidsgEA/pWMRNpx6eUmsZa4WbuuTC0eSHrA/7tbM2u8qfkBFyQyUWB5lBtTsQmisAOA==@linaro.org
X-Google-Smtp-Source: AGHT+IGUJbx14GxPeduGKpFE4v3QkfXiMoRNudoKjq85Wzc9iuo0sVGUSjjU8QSHnZvSNJZHC+8Q
X-Received: by 2002:a05:6602:6e03:b0:86c:bbde:83bb with SMTP id ca18e2360f4ac-86cbbde83ddmr567600839f.0.1748251018304;
        Mon, 26 May 2025 02:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748251018; cv=none;
        d=google.com; s=arc-20240605;
        b=fBxEwDo77ZSSM535m7VXCIS5i+26jq3eXcMS1Jz1DgGRSTAeOKufDdsfsdK8tcvQQh
         Gdi8ej8EkYs/RZipCb3/dlWiNgmefE0qe7qHytb804uSWVm8fRpoGuyw88InUzVOJ4FS
         Dt9usQH5MhMgn4eYejisYt+2zDOpRIEM/mI+bBJXTqh9H9FNNyUVjnzixKNBeNVhfVxz
         8+BDJ4rjhyl5tqjTNWHc6J1he2nBZRL5kwy0nrPTC2XOeGGI5KLK7bI2atwo+9OcyiEO
         oGg/MD2AHN58EMOE5ZeQHQzE7l2aMIYH6UgkChFTL6476sygw4BhqJidA1tCfY2t5Rz/
         ygZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=gP7bhR/Bz7+K4YlN9kdxnUmT0MNeXQaa2VG/VtrbHus=;
        fh=qqBcMWpNUe+gcmCOs5/bYVuzGUlDiyh4YBTrPe1lOE0=;
        b=av2HvLAg5cWakvrEx1j9HBZiWQP8tusli0XpPTn4GEwP0qAYhIg9scz51X1hbwpunG
         /YslMUoZpuXGbmigIUN6o4pHHyOzsPFSZXUTizCB97RB6xsS40dEnKEPBPO3es1rvzE6
         bXH69hMx55sdWropH6vR5wnoOFzFy7knot8sg1WjMZfLxVzZw5ZmS/CK/lJs1qa37KUa
         ctogDJzwQfV8ecVndOoxOHJ+WPqEQEhQnNeqCH6pfXiIP8yEy1fZNgQYzlN8rjdWIYfF
         2pIepwSMfNkxYoK6ukE50VAArotEOj+2YalN4zXIuRUgR+/SOU0J3tEA8amRCJaDQyu8
         GnIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGLY75op;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca18e2360f4ac-86a236f9e11si2212700239f.86.2025.05.26.02.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 02:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RGLY75op;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJTwo-0007Zx-3i; Mon, 26 May 2025 05:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJTwi-0007ZX-Dm
 for qemu-arm@nongnu.org; Mon, 26 May 2025 05:16:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uJTwg-00029M-Dc
 for qemu-arm@nongnu.org; Mon, 26 May 2025 05:16:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748250992;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gP7bhR/Bz7+K4YlN9kdxnUmT0MNeXQaa2VG/VtrbHus=;
 b=RGLY75opSSprcAubJlpBpXniwTuhoK0hW/XdiD0AHlRGiXzDxq9uzv2Muw20UD486eP+Br
 Y5xhgt/8+ryk9OGps8MS79wt95qe8SUuPGmT1YHY2cD11hMPth0b5SPeiy4Tqg7Wqvj2uC
 l/mDIReKAWDh7Q/Z2Sk7vpbb1kLXik0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-5SCLSV2oNEu0tm_jtUy0Kw-1; Mon, 26 May 2025 05:16:30 -0400
X-MC-Unique: 5SCLSV2oNEu0tm_jtUy0Kw-1
X-Mimecast-MFC-AGG-ID: 5SCLSV2oNEu0tm_jtUy0Kw_1748250990
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-43f251dc364so11353235e9.2
 for <qemu-arm@nongnu.org>; Mon, 26 May 2025 02:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748250989; x=1748855789;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gP7bhR/Bz7+K4YlN9kdxnUmT0MNeXQaa2VG/VtrbHus=;
 b=A6m5eZqjRfjVphuMKO2pfJoxwunekeplG0ajM3SllTWiv1OhbQsnVo3y91ijIu12TF
 1Vk4zboaOPoLrBfV3UFxDKlP3oCjvypwPtNrFgM9m0KAVbdLr5BIiInyGc0vaJk9VSem
 hEVMwe/b9PViSnMheYUUXgqiTl2eHh6Mc+jC9YHg3zDCJHnjFV7HkLwmwQa0VehMBhXh
 OKORHCJ2oGDuFF0gZSp2DLJyPitN4yUOk8iBDcJiXK8o7U334xCKKvygpYQzp8ojZujv
 ocRpNMcuD+uQGfrx9uODFGt5Ollp552SeGpiLeWtVUUtQbgRhev3cK6eriWKNvzz21oG
 w1Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7TVGUSCrPtgkwas0xxxctlwyUIHqXcRWlKv68m0JhCSB5gC6M/TaFRINe46Ou7KQGqLc2ou+L6Q==@nongnu.org
X-Gm-Message-State: AOJu0YxfTNoUrfaB+QlNogxAaKVdVmevWIroiyxaMcBUhEIjmLlEyA6w
 NAO9vkK0APoxVb38IfQp2eWJ1eFfjD6Hw8S+Qlg5t19n6t1GmcLM1zJ7heoFuQufndCrQuqLS5/
 OxJk+q03g4wns3EU1kU5Z7UXjk0c2XqYjyr6w7X4AaYByDu3lr5qfRw==
X-Gm-Gg: ASbGncupsaZujrtYLf4A/IkViShs3hC4Hbf19m0Ah6/y4hAFV91WECwtCufee3oQd46
 x/sfDgOuCKLsaOaosMjnXkqVMANiWNLy7Ex7R37n2wrhzuVgRRws36lX5/xnMKjFZzLH0Q2gnT6
 cnV9vgM0mwg8yRvwnflmLZHQMX+kGXlHmYHWK7kc9mCij3srxg9aHtuGTYYm7DeQ4GQv3eMqjbh
 dHxfJbErI9FgUnBZhjAQka1seItkgknXxmljMXa3fV7Hfvznc16+aon6soO/cN2HL+K10dkGRKB
 OxfeQUAJmRssYHgOvWHfdIUy4BhijLkueUY35U8rpLuB7DSOJI0rSbiK1Zw=
X-Received: by 2002:a05:600c:511d:b0:442:cab1:e092 with SMTP id
 5b1f17b1804b1-44c91cc5591mr65988385e9.11.1748250989460; 
 Mon, 26 May 2025 02:16:29 -0700 (PDT)
X-Received: by 2002:a05:600c:511d:b0:442:cab1:e092 with SMTP id
 5b1f17b1804b1-44c91cc5591mr65988065e9.11.1748250989063; 
 Mon, 26 May 2025 02:16:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4d17266d5sm5082921f8f.68.2025.05.26.02.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 May 2025 02:16:28 -0700 (PDT)
Message-ID: <299fa5d3-7e05-4151-ab90-84447b3339cd@redhat.com>
Date: Mon, 26 May 2025 11:16:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] hw/i386/acpi-build: Introduce and use
 acpi_get_pci_host
To: Gustavo Romero <gustavo.romero@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-14-eric.auger@redhat.com>
 <9b996b3a-cc60-499e-a8a6-028f16156180@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <9b996b3a-cc60-499e-a8a6-028f16156180@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W2hndVgoV4O7ifB9yJ-oCCgMsQq8BX8vrC6fNVlBqiM_1748250990
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.904,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iJCWqYIfHlnV



On 5/20/25 10:00 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 5/14/25 14:01, Eric Auger wrote:
>> pcihp acpi_set_pci_info() generic code currently uses
>> acpi_get_i386_pci_host() to retrieve the pci host bridge.
>>
>> Let's rename acpi_get_i386_pci_host into acpi_get_pci_host and
>> move it in pci generic code.
>>
>> The helper is augmented with the support of ARM GPEX.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   include/hw/acpi/pci.h |  2 ++
>>   hw/acpi/pci.c         | 20 ++++++++++++++++++++
>>   hw/acpi/pcihp.c       |  3 ++-
>>   hw/i386/acpi-build.c  | 24 ++++--------------------
>>   4 files changed, 28 insertions(+), 21 deletions(-)
>>
>> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
>> index 4dca22c0e2..310cbd02db 100644
>> --- a/include/hw/acpi/pci.h
>> +++ b/include/hw/acpi/pci.h
>> @@ -41,4 +41,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml
>> *scope);
>>     void build_srat_generic_affinity_structures(GArray *table_data);
>>   +Object *acpi_get_pci_host(void);
>> +
>>   #endif
>> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
>> index d511a85029..4191886ebe 100644
>> --- a/hw/acpi/pci.c
>> +++ b/hw/acpi/pci.c
>> @@ -26,6 +26,7 @@
>>   #include "qemu/osdep.h"
>>   #include "qemu/error-report.h"
>>   #include "qom/object_interfaces.h"
>> +#include "qom/object.h"
>>   #include "qapi/error.h"
>>   #include "hw/boards.h"
>>   #include "hw/acpi/aml-build.h"
>> @@ -33,6 +34,9 @@
>>   #include "hw/pci/pci_bridge.h"
>>   #include "hw/pci/pci_device.h"
>>   #include "hw/pci/pcie_host.h"
>> +#include "hw/pci-host/i440fx.h"
>> +#include "hw/pci-host/q35.h"
>> +#include "hw/pci-host/gpex.h"
>>     /*
>>    * PCI Firmware Specification, Revision 3.0
>> @@ -301,3 +305,19 @@ void
>> build_srat_generic_affinity_structures(GArray *table_data)
>>       object_child_foreach_recursive(object_get_root(),
>> build_acpi_generic_port,
>>                                      table_data);
>>   }
>> +
>> +Object *acpi_get_pci_host(void)
>> +{
>> +    Object *host;
>> +
>> +    host =
>> object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE, NULL);
>> +    if (host) {
>> +        return host;
>> +    }
>> +    host = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE, NULL);
>> +    if (host) {
>> +        return host;
>> +    }
>> +    host = object_resolve_type_unambiguous(TYPE_GPEX_HOST, NULL);
>> +    return host;
>> +}
>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>> index 942669ea89..d800371ddc 100644
>> --- a/hw/acpi/pcihp.c
>> +++ b/hw/acpi/pcihp.c
>> @@ -36,6 +36,7 @@
>>   #include "hw/pci-bridge/xio3130_downstream.h"
>>   #include "hw/i386/acpi-build.h"
>>   #include "hw/acpi/acpi.h"
>> +#include "hw/acpi/pci.h"
>>   #include "hw/pci/pci_bus.h"
>>   #include "migration/vmstate.h"
>>   #include "qapi/error.h"
>> @@ -102,7 +103,7 @@ static void *acpi_set_bsel(PCIBus *bus, void
>> *opaque)
>>   static void acpi_set_pci_info(bool has_bridge_hotplug)
>>   {
>>       static bool bsel_is_set;
>> -    Object *host = acpi_get_i386_pci_host();
>> +    Object *host = acpi_get_pci_host();
>>       PCIBus *bus;
>>       BSELInfo info = { .bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT,
>>                         .has_bridge_hotplug = has_bridge_hotplug };
>> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>> index 06b4b8eed4..bcfba2ccb3 100644
>> --- a/hw/i386/acpi-build.c
>> +++ b/hw/i386/acpi-build.c
>> @@ -269,27 +269,11 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
>>   #endif
>>   }
>>   -/*
>> - * Because of the PXB hosts we cannot simply query
>> TYPE_PCI_HOST_BRIDGE.
>> - * On i386 arch we only have two pci hosts, so we can look only for
>> them.
>> - */
>> -Object *acpi_get_i386_pci_host(void)
>> -{
>> -    PCIHostState *host;
>> -
>> -    host = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx",
>> NULL));
>> -    if (!host) {
>> -        host = PCI_HOST_BRIDGE(object_resolve_path("/machine/q35",
>> NULL));
>> -    }
>> -
>> -    return OBJECT(host);
>> -}
>> -
>
> It's also possible to add a child prop to the TYPE_GPEX_HOST in
> create_pcie, like:
>
> @@ -1510,6 +1510,7 @@ static void create_pcie(VirtMachineState *vms)
>      MachineClass *mc = MACHINE_GET_CLASS(ms);
>  
>      dev = qdev_new(TYPE_GPEX_HOST);
> +    object_property_add_child(OBJECT(vms), "gpex", OBJECT(dev));
>
> then follow to logic in acpi_get_i386_pci_host via:
>
> PCI_HOST_BRIDGE(object_resolve_path("/machine/gpex", NULL))
indeed
>
> but I like better your solution of using the final class types, so:
>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

OK thanks! I described that change in the commit msg because it was
effectively not properly described.

Cheers

Eric
>
>
> Cheers,
> Gustavo
>
>>   static void acpi_get_pci_holes(Range *hole, Range *hole64)
>>   {
>>       Object *pci_host;
>>   -    pci_host = acpi_get_i386_pci_host();
>> +    pci_host = acpi_get_pci_host();
>>         if (!pci_host) {
>>           return;
>> @@ -1245,7 +1229,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>         sb_scope = aml_scope("\\_SB");
>>       {
>> -        Object *pci_host = acpi_get_i386_pci_host();
>> +        Object *pci_host = acpi_get_pci_host();
>>             if (pci_host) {
>>               PCIBus *pbus = PCI_HOST_BRIDGE(pci_host)->bus;
>> @@ -1306,7 +1290,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>>       if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
>>           bool has_pcnt;
>>   -        Object *pci_host = acpi_get_i386_pci_host();
>> +        Object *pci_host = acpi_get_pci_host();
>>           PCIBus *b = PCI_HOST_BRIDGE(pci_host)->bus;
>>             scope = aml_scope("\\_SB.PCI0");
>> @@ -1946,7 +1930,7 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>>       Object *pci_host;
>>       QObject *o;
>>   -    pci_host = acpi_get_i386_pci_host();
>> +    pci_host = acpi_get_pci_host();
>>       if (!pci_host) {
>>           return false;
>>       }
>

