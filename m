Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2639077lfb;
        Fri, 22 May 2020 07:43:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7MpU844p/i8HJsZWxAAZpEJ9U7Gj/f+36NuA4w8hy4veQZUfY+a6K45zBtk2xUXwCr6YT
X-Received: by 2002:a25:4888:: with SMTP id v130mr22262659yba.211.1590158619519;
        Fri, 22 May 2020 07:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590158619; cv=none;
        d=google.com; s=arc-20160816;
        b=jmWR8rlUo+c/8zsbUCKiQba87HH39KL52Q+mmhzPtYEvfkQTmpHAyObdvOT05WIPuV
         qFqSZDcoz1xbfPpEL5KTEbYWDG4b7/EW6vptuDY7JISoS9wRdk59ezzFAec5EX1be2qS
         QuYm8yq45fElY/by8FuUUxuCnkG8DbAr5Iff1kTRitjqiNz3PAvHklveMRpIpnFG5Ue5
         Tqll6k23sX8ONkZ7iqGEDK5+O3K/1fcdJ9zkKLGpnpuYpfn2z3o25mD8w1J1dLTMvuTz
         gbWYdnJJOGM6XYeRYWvco8YjhkJuATJLcyYrJL+roESR06KHmZvaFZu2Q1hWnsPRxeSw
         frOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=MzXM9ZTSVhAGl1xhNJfU6hscjoth3y+knm1AH12KcsM=;
        b=BP8GQARThnbt6KA0fDINShGbUwSWafIJHjcx+5nW3slXrEXVEIj0m8ENxzEGd44pmy
         FG1FJFmuUJLTAdR35cs3uSiSkgD6amvA5A/7fhtGYI9I5Riyy0BK5k9xHnJ+YFdx2zJ7
         eF8q2QZ2UWrMGvnbRT/qKZlqzjXAK8cAAODmI3/+SiUGTaAFyvgLpLb7x17xzCvo66tV
         nH6ds1+Ql8orDttxGaD7ALncMIRDWbuLpOHxT3YNuurE6Mj018DlOa2H4NeUXTbint6S
         DM0lSDu6f7krDlRdPvWwsSl47YrecxZX4vQi6oNv6SeCjiuw9HwLEh0X1Ezvw7lVVPLP
         PjCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pgWRDJDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w72si8277479ybe.394.2020.05.22.07.43.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 May 2020 07:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pgWRDJDf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jc8te-0002Z6-Tn
	for alex.bennee@linaro.org; Fri, 22 May 2020 10:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1jc8tY-0002Xz-T6
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:43:32 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1jc8tW-0003x4-QD
 for qemu-arm@nongnu.org; Fri, 22 May 2020 10:43:32 -0400
Received: by mail-wm1-x344.google.com with SMTP id f13so8861284wmc.5
 for <qemu-arm@nongnu.org>; Fri, 22 May 2020 07:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MzXM9ZTSVhAGl1xhNJfU6hscjoth3y+knm1AH12KcsM=;
 b=pgWRDJDfRcoJuttcwyI+yTrDi+pUBuIYkag0yzfHfVJRDe7+ItmXheyjCsci/z0fTf
 6NMtSBP4Qn/0g9Sf4qdYCFuIanCsaELFi6AMw54xNnBBrbpnypnoCYrR6AulzUwVnGBL
 GSGFzZBx4o51lxomAvJIhcrNuw3BfeXGFSuCb3xKHI8xhyu+z+rZ063/hdTBpgYfM9qS
 NDLJKpcjnSGdGMvU3dIi4LFOiFV2EodTVFb4y7OMQWomNErTg7kREQqsLOtY7U9M25VB
 EUfXzF/0ulbFJh8wxKLOHkqwWgKlCnD4KQeAdd/LRtnY2ZQ0H7WpThTSyyOY260aXpug
 AFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MzXM9ZTSVhAGl1xhNJfU6hscjoth3y+knm1AH12KcsM=;
 b=E86ZP19cuP5GP7789qut2bgS2Vhi37EHyKI00QXLXIPCnld915PkqiPxB6cAMNKzuM
 onbbCLb3Lojc0osW9fz0A3TtRbtLdH2PrXA9vqWzY2zRyv4LIRI770TWi6gbXmZtdVKq
 CWi1l84t6CW+1XRRLdq/HisiS2kvXEA4iS3fBJA/3Q+HgziW/0tdG4LoOXaoXUAT3XuZ
 J2lUkYC3Z7/MN8W0tIp39LKD5zUed/fS4gMuaJ7k6OUDhnkOh7l+e/aV+tkVTAS3BNwi
 dUQ4vzm4HA+8gqyWw/W+gAjpRT26KFyaaemKZiHngWU3/oAUomq+FbWCpX2sq0IJETRD
 pBuw==
X-Gm-Message-State: AOAM5311MXKh0lWguEjj+1MjggMh4fSnqKabO3+9MRsnblS+TNedWdEm
 kUKQbSaMRagvyTHG3o3wDcidwg==
X-Received: by 2002:a1c:96d8:: with SMTP id y207mr6574623wmd.167.1590158608911; 
 Fri, 22 May 2020 07:43:28 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id x5sm10154315wro.12.2020.05.22.07.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 07:43:27 -0700 (PDT)
Date: Fri, 22 May 2020 16:43:17 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 5/5] hw/arm/virt: Let the virtio-iommu bypass MSIs
Message-ID: <20200522144317.GB3453945@myrica>
References: <20200508173057.32215-1-eric.auger@redhat.com>
 <20200508173057.32215-6-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508173057.32215-6-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, mst@redhat.com, qemu-devel@nongnu.org,
 peterx@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hVRoGDB+fr6W

On Fri, May 08, 2020 at 07:30:57PM +0200, Eric Auger wrote:
> At the moment the virtio-iommu translates MSI transactions.
> This behavior is inherited from ARM SMMU. The virt machine
> code knows where the guest MSI doorbells are so we can easily
> declare those regions as VIRTIO_IOMMU_RESV_MEM_T_MSI. With that
> setting the guest will not map MSIs through the IOMMU and those
> transactions will be simply bypassed.
> 
> Depending on which MSI controller is in use (ITS or GICV2M),
> we declare either:
> - the ITS interrupt translation space (ITS_base + 0x10000),
>   containing the GITS_TRANSLATOR or
> - The GICV2M single frame, containing the MSI_SETSP_NS register.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v1 -> v2:
> - Test which MSI controller is instantiated
> - If GICV2M is in use, declare its doorbell as an MSI doorbell too
> ---
>  include/hw/arm/virt.h |  6 ++++++
>  hw/arm/virt.c         | 18 ++++++++++++++++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 6d67ace76e..ad20cb6e15 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -96,6 +96,11 @@ typedef enum VirtIOMMUType {
>      VIRT_IOMMU_VIRTIO,
>  } VirtIOMMUType;
>  
> +typedef enum VirtMSIControllerType {
> +    VIRT_GICV2M,
> +    VIRT_ITS,
> +} VirtMSIControllerType;

I think you need a third value for msi_controller == 0. If I instantiate a
GICv3 without ITS at the moment the V2M region gets reserved. Not a big
deal since MSIs aren't supported at all in this case, but it would be
cleaner to skip any reservation.

Thanks,
Jean

> +
>  typedef enum VirtGICType {
>      VIRT_GIC_VERSION_MAX,
>      VIRT_GIC_VERSION_HOST,
> @@ -135,6 +140,7 @@ typedef struct {
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> +    VirtMSIControllerType msi_controller;
>      uint16_t virtio_iommu_bdf;
>      struct arm_boot_info bootinfo;
>      MemMapEntry *memmap;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 634db0cfe9..d2dd07885b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -602,6 +602,7 @@ static void create_its(VirtMachineState *vms)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_ITS].base);
>  
>      fdt_add_its_gic_node(vms);
> +    vms->msi_controller = VIRT_ITS;
>  }
>  
>  static void create_v2m(VirtMachineState *vms)
> @@ -622,6 +623,7 @@ static void create_v2m(VirtMachineState *vms)
>      }
>  
>      fdt_add_v2m_gic_node(vms);
> +    vms->msi_controller = VIRT_GICV2M;
>  }
>  
>  static void create_gic(VirtMachineState *vms)
> @@ -2136,8 +2138,24 @@ out:
>  static void virt_machine_device_pre_plug_cb(HotplugHandler *hotplug_dev,
>                                              DeviceState *dev, Error **errp)
>  {
> +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> +
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
>          virt_memory_pre_plug(hotplug_dev, dev, errp);
> +    } else if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
> +        /* we declare a VIRTIO_IOMMU_RESV_MEM_T_MSI region */
> +
> +        if (vms->msi_controller == VIRT_ITS) {
> +            /* GITS_TRANSLATER page */
> +            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> +            qdev_prop_set_string(dev, "reserved-regions[0]",
> +                                 "0x8090000, 0x809FFFF, 1");
> +        } else if (vms->msi_controller == VIRT_GICV2M) {
> +            /* MSI_SETSPI_NS page */
> +            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> +            qdev_prop_set_string(dev, "reserved-regions[0]",
> +                                 "0x8020000, 0x8020FFF, 1");
> +        }
>      }
>  }
>  
> -- 
> 2.20.1
> 
