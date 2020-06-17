Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp438890lfm;
        Wed, 17 Jun 2020 02:19:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjFfohJiNC/Kgqvxg6o9dOgtaHv/aNZHay2txJoXhJpOANTJ7h3ZODoNblH+vxPZ3dXDoC
X-Received: by 2002:a25:abd2:: with SMTP id v76mr10625872ybi.463.1592385556994;
        Wed, 17 Jun 2020 02:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592385556; cv=none;
        d=google.com; s=arc-20160816;
        b=q/6WK08nEUDEBCX+S9HVndUYqN+FCgzSb13oW7Zb1IzdhV4FO+2fx2Jm1JwIszuW1L
         VPxASrcs0JOxStrnsu1J9DUdzOn1ESNyODh5ASBB9/FGc4MICFul6GmS+BpOeC79brB/
         Wqhl4zEelX0RPsflQXktDyFi+apuhmKL7vvqwMAx0pzHqQWG9IiQldkfBkTOlx781ugO
         1u3UCaBVk6FWtGpfdCljiHsZ0OpffeiuzILOPwoVL2rydE3sHhwTTow7eiOp1LlKawzc
         DhvL8biO5EUc+4dgllY56eN9343czbS7QC1Ng8ssdRJCy/uxLmMW/w0nVGck4vQ0PPpy
         zRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=av6R9ayZL9WdcrzKT4i7dDrzpzLAavW93Q2B21s9tcY=;
        b=FTV5PJ4t8fKwIi83xLH0jDHSbuEk2xjdpDhlD5UBYXnwy5xp9TxaFZhFhI9f/uIS4c
         GX0gTEJnPJatfSG6BGCj84A/gaQNOH1RgEWObr4OePkklqC+y6CQD2mhrxn1+F5wMen9
         Fo1a5fw3pbhJEtpPkt+P1Vnh8RaUVi74ZBZLgbwLstCk7dqs+QDP1dPwbKgi+G9R64iw
         onDKIMNCXNp2OFyd6x2dUtI+aFZ7xqd5f+xmHJiMnoY8YlowzJlusVd5zhNM7QGN+WQp
         +vKWkIVayyLtzB9EZL4o9+EAQR3/gIhFsDkuC8KJNQoLLGhvgZMNtDOBW4EKk3RsO1M0
         MgAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BfEnXo0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f13si19754521ybk.162.2020.06.17.02.19.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 02:19:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BfEnXo0d;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlUE0-0000fi-AY
	for alex.bennee@linaro.org; Wed, 17 Jun 2020 05:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1jlUDr-0000fI-KP
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 05:19:07 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:43330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1jlUDp-0004Oy-E4
 for qemu-arm@nongnu.org; Wed, 17 Jun 2020 05:19:07 -0400
Received: by mail-ed1-x543.google.com with SMTP id d15so1338022edm.10
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=av6R9ayZL9WdcrzKT4i7dDrzpzLAavW93Q2B21s9tcY=;
 b=BfEnXo0d7Z1baF9+oRBKAs9KEof9MHEZ7/y80p6QSuZJu5Zh+BFUgkVoiRNB4EYdib
 p9WaKZI9UZQ+kD38vgsoAEUpza0AcAOkoQJLb5rh1wwcMS1U6wX0tl28IFHSJQpnsgHw
 Gd1p5X11uSIF7L8+d3jG76hY0YgFGzr0E0IcoQ60c16+UGqNeebTvSFczVHMzwlv/dOc
 6ASJPwHkM5nV8sftH8xosOqwaWqmTHC3KFbJlabqw/3lkKWNMmKj3eMfdhS/S0SDhTEC
 E/q7/bveB0YyXx360Hu1gM/U4e59qYCux50RKkpgCv+4MHQhO+OBSmlXd0rbDI7gf9Zo
 l2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=av6R9ayZL9WdcrzKT4i7dDrzpzLAavW93Q2B21s9tcY=;
 b=Icx2Rm1r+i3eRUfpDCZQWlJ9qdgdcS4gDgti1P0emhkCprsE9hWP2xFQ64r4p2ICIl
 8uZWjqK5WjLYoRpZxo4EW5iLvSYUk4jl1d0Nho8M6339nbF9NT1cTTC564Gia6melF0a
 sQS4XeQhow4T6nMLXY/+oPj+BNmWczcgpQKLKthKss8Kiy6vVG+rkGf7FfFJWoIcRzrT
 gWUQklbZXxbv+pPspznzWl5ybH+gx26df5R9jpvXbna1tL72H6jn44cP1+7XVebYjrAa
 DXjW6c0SIjj8DJdHVHhzs9F1XVs1EDylVLS786MfruevJjwkxqaJalArUtiYbGjmt6QY
 9z/Q==
X-Gm-Message-State: AOAM531YfuJ35TZH6hyjkXh//C7AbDnZA91ve557wdnhoo4mxsBPQZKs
 5Kk+7SgMgwsSq1KB4TNkgvm9dA==
X-Received: by 2002:aa7:de08:: with SMTP id h8mr6177790edv.164.1592385543933; 
 Wed, 17 Jun 2020 02:19:03 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id o27sm12927210ejc.95.2020.06.17.02.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 02:19:03 -0700 (PDT)
Date: Wed, 17 Jun 2020 11:18:53 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 5/5] hw/arm/virt: Let the virtio-iommu bypass MSIs
Message-ID: <20200617091853.GC871763@myrica>
References: <20200611151209.22547-1-eric.auger@redhat.com>
 <20200611151209.22547-6-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611151209.22547-6-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=jean-philippe@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-TUID: em5YYyu8G8C8

On Thu, Jun 11, 2020 at 05:12:09PM +0200, Eric Auger wrote:
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

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
> v2 -> v3:
> - Add a new value to VirtMSIControllerType
> 
> v1 -> v2:
> - Test which MSI controller is instantiated
> - If GICV2M is in use, declare its doorbell as an MSI doorbell too
> ---
>  include/hw/arm/virt.h |  7 +++++++
>  hw/arm/virt.c         | 18 ++++++++++++++++++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 31878ddc72..a18b6b397b 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -96,6 +96,12 @@ typedef enum VirtIOMMUType {
>      VIRT_IOMMU_VIRTIO,
>  } VirtIOMMUType;
>  
> +typedef enum VirtMSIControllerType {
> +    VIRT_MSI_CTRL_NONE,
> +    VIRT_MSI_CTRL_GICV2M,
> +    VIRT_MSI_CTRL_ITS,
> +} VirtMSIControllerType;
> +
>  typedef enum VirtGICType {
>      VIRT_GIC_VERSION_MAX,
>      VIRT_GIC_VERSION_HOST,
> @@ -136,6 +142,7 @@ typedef struct {
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
> +    VirtMSIControllerType msi_controller;
>      uint16_t virtio_iommu_bdf;
>      struct arm_boot_info bootinfo;
>      MemMapEntry *memmap;
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 37462a6f78..451b150459 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -602,6 +602,7 @@ static void create_its(VirtMachineState *vms)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, vms->memmap[VIRT_GIC_ITS].base);
>  
>      fdt_add_its_gic_node(vms);
> +    vms->msi_controller = VIRT_MSI_CTRL_ITS;
>  }
>  
>  static void create_v2m(VirtMachineState *vms)
> @@ -622,6 +623,7 @@ static void create_v2m(VirtMachineState *vms)
>      }
>  
>      fdt_add_v2m_gic_node(vms);
> +    vms->msi_controller = VIRT_MSI_CTRL_GICV2M;
>  }
>  
>  static void create_gic(VirtMachineState *vms)
> @@ -2149,8 +2151,24 @@ out:
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
> +        if (vms->msi_controller == VIRT_MSI_CTRL_ITS) {
> +            /* GITS_TRANSLATER page */
> +            qdev_prop_set_uint32(dev, "len-reserved-regions", 1);
> +            qdev_prop_set_string(dev, "reserved-regions[0]",
> +                                 "0x8090000, 0x809FFFF, 1");
> +        } else if (vms->msi_controller == VIRT_MSI_CTRL_GICV2M) {
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
