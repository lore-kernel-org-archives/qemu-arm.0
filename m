Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD1CCCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:21:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDLI3-0003Lv-Lr; Mon, 27 Oct 2025 07:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDLHx-0003KM-1S
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:21:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDLHr-0001XX-RX
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761564077;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RUHh9fyYbo1gqOH2AfjhX3xtiiAOs0PKIRCN2UNeQrw=;
 b=hq3736TVcXZimXU1D30f0O3QVTy0TE/UENw2ZRRRj6cLnrGmUvjgHSeXs/FAPe7pT3eRsH
 JLfnYCsXu9X37yjDQiAftuwB5Ey8b5ifb9iCf7shrJVL1NcB3ooiSunVBZv6aEP0FV24NA
 O0bY5QyzK9h6a0qmqfa5gq2zacugHz0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-JWeHEd8YOWq6EvR-gMCcbw-1; Mon, 27 Oct 2025 07:21:06 -0400
X-MC-Unique: JWeHEd8YOWq6EvR-gMCcbw-1
X-Mimecast-MFC-AGG-ID: JWeHEd8YOWq6EvR-gMCcbw_1761564065
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-429893e2905so4527857f8f.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761564065; x=1762168865;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RUHh9fyYbo1gqOH2AfjhX3xtiiAOs0PKIRCN2UNeQrw=;
 b=v84nR7hjcX7PFccEy5nWhMqHNhs32KHURUZ33E1N/JiN/o33eTCsH3QcZo2NHPPdKP
 5kF+S6ELeJ4t/tTmjBBY8QLIuR56JxsHkfwTsDL8FRJDxTyasbTPxI1osFGhta8Jf7Gy
 CCn7IBmLRGY1WnLf+Crf2VCUSysfQ9Nr/nMmtRO4rF9V9Pi+GChdrMK2I7/epEFwY0KE
 ZxbjCvmmiU5Qy8knim780NxQ3TFK3eE7mUlVxVmv2R+nrIitStqGRccHJNGByW7Gqjqs
 8sZulkBwvvNWxnsRlohjeUg0/Rw1qMEVbVuj77NTUGkXKJ68daZ2cWZ5j/Th0EQGSWND
 R9Qg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM8rx3WV4DeBxssBc6WlE1S8jCvYrBZO4PA8OGYfMPpMnNQe50n33hrbsmYDsVeU6OHBODb5oMNw==@nongnu.org
X-Gm-Message-State: AOJu0YzUabU90/wJp/OqMs/JICLbdaarlLuzT5886oopsyRs5E5uFar0
 N0zD/tq93CCiJyUsqiKi/aGX6VzPwcZrXPVNSApNLiIj15PdxzNdmdZqo1H88hruWdhol8Vx6hX
 LCaLqb0Mmrl/ZOrLZ34/3guGugd7cC3zuU5Sp14BkHIAj8EKzdMyJUw==
X-Gm-Gg: ASbGncsYqBIvoe+nqvt5NF9XyHPcnkGkQ0sHe3fwYywB7Xy0z+NEUOFAD6XNDBuHu32
 Bqgw5uAObSZVXx9Ppm/UWkvbWEDdTdHPEqy68BWtZhVS/GFVUmBndMXY27O/mFWnw2CG5Y/eW64
 Q7Ebnw0SBoQwczBlwwYOjZtNshZl4SDjggTYJsbQ3wVJjibXYp3aizCzNlj5mWyR2KEEfGhRTuZ
 d2TYWSxn3FXLc28Ip7mpw1jBAcQxJQI+Q6h8OfCaqCES9qu0xDe/9OQiF/hS79HT6fID19FM/Al
 ZadW95Vc37hZkdzhwsqwfyDFgwlOXlrlO7x7s2MxDbgA9oRV7SJOhlZWwfhFwFvaoWhjNqn71il
 4E/49PcNbXLhjm0Gb0Wus4XwZWqYN4emammJwywHC+qEK5w==
X-Received: by 2002:a05:6000:2287:b0:428:1475:6a0f with SMTP id
 ffacd0b85a97d-42814756c75mr23271045f8f.54.1761564064965; 
 Mon, 27 Oct 2025 04:21:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVtMp4xI6bh+medUm2VqKSKslacg0C/StsVr5/Fjf1nymJzlpv2SHr9HYet1fGRF7/r3O9PA==
X-Received: by 2002:a05:6000:2287:b0:428:1475:6a0f with SMTP id
 ffacd0b85a97d-42814756c75mr23271021f8f.54.1761564064533; 
 Mon, 27 Oct 2025 04:21:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b43sm13992593f8f.6.2025.10.27.04.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:21:04 -0700 (PDT)
Message-ID: <ec1caa15-2d90-4289-8535-160e759199c4@redhat.com>
Date: Mon, 27 Oct 2025 12:21:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/27] hw/arm/virt: Set PCI preserve_config for accel
 SMMUv3
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-18-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-18-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bx8JpCcRqif8yWETLr3EJospR62PEaCNgSbHHYIvN0Y_1761564065
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> In a subsequent patch, SMMUv3 accel mode will make use of IORT RMR nodes
> to enable nested translation of MSI doorbell addresses. IORT RMR requires
> _DSM #5 to be set for the PCI host bridge so that the Guest kernel preserves
> the PCI boot configuration.

Does not really explain what the patch does:
introduce a new pci_preserve_config field in virt machine state which
allows the generation of DSM #5. This field is only set if accel SMMU is
instantiated
>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
>  hw/arm/virt-acpi-build.c | 8 ++++++++
>  hw/arm/virt.c            | 4 ++++
>  include/hw/arm/virt.h    | 1 +
>  3 files changed, 13 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 96830f7c4e..fd03b7f6a9 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -163,6 +163,14 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>          .pci_native_hotplug = !acpi_pcihp,
>      };
>  
> +    /*
> +     * Accel SMMU requires RMRs for MSI 1-1 mapping, which
> +     * require _DSM for preserving PCI Boot Configurations
_DSM function 5 (Ignore PCI Boot Configuration)
> +     */
> +    if (vms->pci_preserve_config) {
> +        cfg.preserve_config = true;
> +    }
> +
>      if (vms->highmem_mmio) {
>          cfg.mmio64 = memmap[VIRT_HIGH_PCIE_MMIO];
>      }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b533b0556e..6467d7cfc8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3087,6 +3087,10 @@ static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
>              }
>  
>              create_smmuv3_dev_dtb(vms, dev, bus);
> +            if (object_property_get_bool(OBJECT(dev), "accel", &error_abort) &&
> +                                         !vms->pci_preserve_config) {
> +                vms->pci_preserve_config = true;
why don't you put that in above "if
(object_property_get_bool(OBJECT(dev), "accel", &error_abort)) {"
block. Besides do you need to test !vms->pci_preserve_config? Eric
> +            }
>          }
>      }
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index ea2cff05b0..00287941a9 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -180,6 +180,7 @@ struct VirtMachineState {
>      bool ns_el2_virt_timer_irq;
>      CXLState cxl_devices_state;
>      bool legacy_smmuv3_present;
> +    bool pci_preserve_config;
>  };
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)


