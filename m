Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp125131njc;
        Thu, 5 Jun 2025 02:58:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXwUSjawWzqMO1jx0jvEdySnE5IA4vO0Obg9cqcRcmBW/9GUUB7q+2jkqdpPo67V5xo3Z8bhnaHmXL/Vg==@linaro.org
X-Google-Smtp-Source: AGHT+IH9UWry88n+XuyVl2ZWf6cEAwPkdVPHTUwzWRSooCAN0MLZh8ESOnWsiU1qSkHugFe0X7l1
X-Received: by 2002:a05:6000:4021:b0:3a4:d975:7d6f with SMTP id ffacd0b85a97d-3a51d96d742mr4970070f8f.39.1749117495105;
        Thu, 05 Jun 2025 02:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749117495; cv=none;
        d=google.com; s=arc-20240605;
        b=JslkDtYtNLf5n0cqEJHrCt2Dfzup8l/f9vBodmco+VR9wkTNThZ9M8T/Zsj7eilTgC
         9IyDL/5ERfv2yS3Tg6++xvfe+7a0QOZpSc54JNCDrkH96LD2G2UGlc38h++QjwhH1/eD
         Mdm39ZU5wsbowkSdlG3eTqsvVd9Fb74zoUuaYTOgcpXVyurInhNQQpcxpZMviIuKzgFb
         bZ6n6N6XqGvO0VAJDfMsNoeN/IRCKU4jqjbctbPz+Gl+ubEXSYEQkojjZzd6yCsOZdh+
         j4kZTUJSmP2vRzq+9PgVEO8jyUGVQoUQ3mFv9ueV8iNE8D6nBNBz4Kj8R3/S8FgDXcw0
         uc7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TieOlgHooLkokUg3x114IwTpM6FU/JsGy69Sghmnwqc=;
        fh=XR9AV2ANcS8fplqz6LMJ2NJbWokSfs9NljldnPeuK2I=;
        b=EdA/bTJp1Vc2iArUrcu0N4TjfRxTghHgowbxHSl74M2Y4jZXjGWpJveny6127CIEm1
         +BlBDQqu2KZfdDx5D87M7zKYuzzINrexdjkXA8qmEZeEpoFa3ZqLFevu3F1QkllOz189
         yNZ0lHJU7I5EeQ9NpPI3GbXALIWIdkGLNYJQA8RgknpVyoD+X6vpPtKR9sqbf1tvlxR5
         QpkLIoxe/27EiP2Y5TPLZyurDw+5gfhcHne3O67+n/rVPKOIs5dD2mZrAojSGzGvhxoz
         8EUHDPDRMUFlYjmkqZl2c7apaBUmiI6mf799n9hr1nF8KQCQ1ODYBaE955yHNLt5xsdK
         Ou2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="iA+S/OJb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4efe5f247si12591608f8f.197.2025.06.05.02.58.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 02:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="iA+S/OJb";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uN7MJ-0007vW-SM; Thu, 05 Jun 2025 05:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN7M7-0007uA-3C
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 05:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uN7Lz-0003cl-5O
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 05:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749117461;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TieOlgHooLkokUg3x114IwTpM6FU/JsGy69Sghmnwqc=;
 b=iA+S/OJbt+MFT6FIYbKN2SKEhma+Jck5jN8ntARzQC+56AnlGb77+JXsizIo088VjQFYsO
 kwbwGBFVouChUjVeC5f6xPSnSFCBRufCsQ4m6DJ23+zALpdHYa7VUNYg5kvg3j8c0y046z
 R6v4qWgSnXbN4ExR71ToqWxQ3A3qzWQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-gmAv38FCPaWdQGbRjqNaDA-1; Thu, 05 Jun 2025 05:57:40 -0400
X-MC-Unique: gmAv38FCPaWdQGbRjqNaDA-1
X-Mimecast-MFC-AGG-ID: gmAv38FCPaWdQGbRjqNaDA_1749117459
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-451ac1b43c4so4450505e9.0
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 02:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749117459; x=1749722259;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TieOlgHooLkokUg3x114IwTpM6FU/JsGy69Sghmnwqc=;
 b=JfA2b2ZDK+35jX7GP+FHNCbME1i2GzHsg4p30Ge/2bd65BBnKuzM6lAvL8NCwCRqhl
 7Ehl6PTf8C6Rtq30uSTAJHHemPpzeFyGRFj80f5MEKY7Fzfg+ZCSIRpRqIyCw6rt8+m4
 jESlgjzSLPSuf0OfDS6lcTwJimW+BVuSanJV9n5UiTEbzpS3b7qOw1YrnWxbvoUjEjGD
 6aor0rbqSWoS8wZvbqblFAp1DwF3bXb9ojUgT+xR2ltjZL/K+R0P3zIDI+quB7lKmEpg
 K0wiclgTaaA/0qsblzNrnfzBueRAnPd0jPrMUpNkH9LSWXxqH57ScUlsz71+NWB425tV
 ENDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgKltlfMa1EZk3kFUPySH66oH27G2C7CngOw/RN4DuT5uDYg/6XlQWufvByFVUTQYVTjGuDmB70g==@nongnu.org
X-Gm-Message-State: AOJu0YyMSLvCMGyrkB8pu3d/pi5VjW/kw7olJl8z3WYWDxcW4PXKOn/2
 qM0UzYmYM3wPZlbRVGJHLqzmxPgG/wGsqMDP7ypLMqDGNhTjy20t7iTptvcTU1ECAf9iEUhLpDd
 8iPM1RgO7DpkS1WWM4BqdrgybazQ7ODW1sBP2UQPyMI1T0BKGhFhYWQ==
X-Gm-Gg: ASbGnct82/Omx747C1hPxivxm3ST1Iea2Sik/u7da+hZPe53mltKLv5obL1ULGMu2zs
 AiGRfee5I2+re4XNvvJYxlyMkQMaLsNlwqKqRV29Co/huefGmrha+svn/5hnQXs6gOzk8rX4dUa
 pWONuOqnZwQMCsQ9H3wlnGJdMD+pV1cAo0oY3gfoA1BWJ1Ycb7dTAOsjDtHIpxRHxOrjiNqzH/0
 uXJcOVS1GIk6AA/qXmiEi1Zgudnndvf1E+1fO1G7TR6BHyRDkdmarSBQNcoJg/qn2DK2jJPWZWR
 qVGegbpN7iwZlJ0+pOxkYp0arRqSxiIAJbFXTpqnc0gGS9k59DULHQITz7I=
X-Received: by 2002:a05:600c:1c96:b0:450:d019:263 with SMTP id
 5b1f17b1804b1-451f0b0f5a1mr64250445e9.18.1749117458718; 
 Thu, 05 Jun 2025 02:57:38 -0700 (PDT)
X-Received: by 2002:a05:600c:1c96:b0:450:d019:263 with SMTP id
 5b1f17b1804b1-451f0b0f5a1mr64250225e9.18.1749117458321; 
 Thu, 05 Jun 2025 02:57:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451fb220569sm13053125e9.29.2025.06.05.02.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 02:57:37 -0700 (PDT)
Message-ID: <af1f7082-dc4b-4f44-9b85-aa6ba9221e71@redhat.com>
Date: Thu, 5 Jun 2025 11:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] hw/arm/virt-acpi-build: Update IORT for multiple
 smmuv3 devices
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250602154110.48392-1-shameerali.kolothum.thodi@huawei.com>
 <20250602154110.48392-4-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250602154110.48392-4-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0BtnwADxpGAmlIDyjXToXOyoQ-UsKcw9ZEZLOld7QEA_1749117459
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.128,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: XApipipEAJrz

Hi Shameer,
On 6/2/25 5:41 PM, Shameer Kolothum wrote:
> With the soon to be introduced user-creatable SMMUv3 devices for
> virt, it is possible to have multiple SMMUv3 devices associated
> with different PCIe root complexes.
>
> Update IORT nodes accordingly.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt-acpi-build.c | 54 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index bd26853ef6..b4ff71b8b7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -43,6 +43,7 @@
>  #include "hw/acpi/generic_event_device.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/hmat.h"
> +#include "hw/arm/smmuv3.h"
>  #include "hw/pci/pcie_host.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_bus.h"
> @@ -288,6 +289,54 @@ get_smmuv3_legacy_dev(VirtMachineState *vms, void *opaque)
>      g_array_append_val(sdev_blob, sdev);
>  }
>  
> +static int smmuv3_dev_idmap_compare(gconstpointer a, gconstpointer b)
> +{
> +    AcpiIortSMMUv3Dev *sdev_a = (AcpiIortSMMUv3Dev *)a;
> +    AcpiIortSMMUv3Dev *sdev_b = (AcpiIortSMMUv3Dev *)b;
> +    AcpiIortIdMapping *map_a = &g_array_index(sdev_a->idmaps,
> +                                              AcpiIortIdMapping, 0);
> +    AcpiIortIdMapping *map_b = &g_array_index(sdev_b->idmaps,
> +                                              AcpiIortIdMapping, 0);
> +    return map_a->input_base - map_b->input_base;
> +}
> +
> +static int get_smmuv3_devices(Object *obj, void *opaque)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(qdev_get_machine());
> +    GArray *sdev_blob = opaque;
> +    AcpiIortIdMapping idmap;
> +    PlatformBusDevice *pbus;
> +    AcpiIortSMMUv3Dev sdev;
> +    int min_bus, max_bus;
> +    SysBusDevice *sbdev;
> +    PCIBus *bus;
> +
> +    if (!object_dynamic_cast(obj, TYPE_ARM_SMMUV3)) {
> +        return 0;
> +    }
> +
> +    bus = PCI_BUS(object_property_get_link(obj, "primary-bus", &error_abort));
> +    if (!bus) {
> +        return 0;
> +    }
can it happen after patch 1?
> +
> +    pbus = PLATFORM_BUS_DEVICE(vms->platform_bus_dev);
> +    sbdev = SYS_BUS_DEVICE(obj);
> +    sdev.base = platform_bus_get_mmio_addr(pbus, sbdev, 0);
> +    sdev.base += vms->memmap[VIRT_PLATFORM_BUS].base;
> +    sdev.irq = platform_bus_get_irqn(pbus, sbdev, 0);
> +    sdev.irq += vms->irqmap[VIRT_PLATFORM_BUS];
> +    sdev.irq += ARM_SPI_BASE;
> +
> +    pci_bus_range(bus, &min_bus, &max_bus);
> +    sdev.idmaps = g_array_new(false, true, sizeof(AcpiIortIdMapping));
> +    idmap.input_base = min_bus << 8,
> +    idmap.id_count = (max_bus - min_bus + 1) << 8,
> +    g_array_append_val(sdev.idmaps, idmap);
> +    g_array_append_val(sdev_blob, sdev);
> +    return 0;
> +}
> +
>  /*
>   * Input Output Remapping Table (IORT)
>   * Conforms to "IO Remapping Table System Software on ARM Platforms",
> @@ -319,6 +368,11 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>           */
>          sdev = &g_array_index(smmuv3_devs, AcpiIortSMMUv3Dev, 0);
>          g_array_sort(sdev->idmaps, iort_idmap_compare);
> +    } else {
> +        object_child_foreach_recursive(object_get_root(),
> +                                       get_smmuv3_devices, smmuv3_devs);
> +        /* Sort the smmuv3 devices(if any) by smmu idmap input_base */
> +        g_array_sort(smmuv3_devs, smmuv3_dev_idmap_compare);
Given the gorwing complexity of the IDMAP computation computation I
would suggest to add some IDMAP examples either in comment or commit msg
to illustrate how the idmaps look like (similar to what can be found in
the IORT spec).

Thanks

Eric
>      }
>  
>      num_smmus = smmuv3_devs->len;

