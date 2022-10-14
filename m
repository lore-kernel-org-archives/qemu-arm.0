Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp480756ejn;
        Fri, 14 Oct 2022 09:12:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DZiQcTE8OYs+WGwY291Az1F+PKjO8njwGy58izztnWpw09P/Rtcs/mCZe8mpeIyEDxh4d
X-Received: by 2002:a05:622a:c1:b0:390:e78:2015 with SMTP id p1-20020a05622a00c100b003900e782015mr4845411qtw.417.1665763933301;
        Fri, 14 Oct 2022 09:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665763933; cv=none;
        d=google.com; s=arc-20160816;
        b=eclEn89Yiyey/+nfT87VCSGkuFLhaJqYPi6VpsfLnhOhKBSUKSaCpBg3uRw96i9DH8
         vLIVsmVvYVPZdTo6utLyJTWcp112TPJtKWHu1U5pk5eQOusEP7ffewDhAB6ID7v3PS4w
         vVxg8FuPOT3XQqpWviQLklF1lyxUnZncWolo/66yzYqJlD6Om31KrM6Cv2uauJdI0qVA
         CRNZ+ago+a0QcArFlteR6bPrZ8/3P0vw6nmsPytElB/+UoUqmMQqDNDxmwfu0dyD0oK8
         AnidwwnMqQy2w8z0PhogV5+WxCfm7ec7SGCvqxZd0lLo0M7U9TZq+yX1wY0goeu+vVUc
         Ij6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=KQcJUmqZu88nfBtXApMM+zI67ONGbz1lPo6e59zltwQ=;
        b=Gl6R12fnFt7nG8jPIEo46JoGFwMQ2QYsqpGF0PK6EtIABNteFlEnVI+uvUmB3hwPfH
         pFAubE8qYibeRkU/llhP31ejivIfpK7Q3hbEsDK6uu3qQt0h55lGHzCRxW3LBRYA7sMX
         F/Y9hm2fOUmKpznYI1m4qFdswOR08mVvWM936I51HKL2JHHAWm6mhEgCfHP90D9i9dG4
         vUMOLVsSDG4SfHpdRVY5cdk89CfqeYs0qrt4ZJggXOTGElGO+a88Cpip9WmFV1R75IcF
         EgGWcmeIlCH1rH/hhpgYPydnDoFbkXhA76fjZ4xc9HFUVeA6+46uQP+pd4dXCwKnhduq
         bKVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhUiOjPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6-20020ac84906000000b00398533be759si1602670qtq.204.2022.10.14.09.12.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Oct 2022 09:12:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QhUiOjPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ojNIC-0007su-O4
	for alex.bennee@linaro.org; Fri, 14 Oct 2022 12:12:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1ojNFx-0004VG-O1
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 12:09:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:52215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1ojNFv-0002Cd-S3
 for qemu-arm@nongnu.org; Fri, 14 Oct 2022 12:09:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id n9so3392125wms.1
 for <qemu-arm@nongnu.org>; Fri, 14 Oct 2022 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KQcJUmqZu88nfBtXApMM+zI67ONGbz1lPo6e59zltwQ=;
 b=QhUiOjPCl3nRaenOv00DDl/23HaWplzSIrmlEmNOoV+LloRMudfAcivtEyFU97eCKT
 eCzTfOjkFTdKRfPR/2e2JNCNKjtrXYNSuAvN58odtyjzB2M3NjaBZP0t7jcLB/+ZSIfY
 r7EvVl3xbNajBpV8DXyogXlllh7l/mbZY2cW9Y4lRKExzpJeHh3xNjAroZiPlJSIh8P2
 vqprCjFvCF362aKiy1V7prn+oLsopn+DJfO15ZO1T2djQ1A8B7GHBJHCiN9Uj428UfoM
 mKtsKTlhWXWKfB2ezzANXqFK0ILrHunn7RD1Fv2/f73GxvVu5IqeTRgit28pjOXjdWBA
 KMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KQcJUmqZu88nfBtXApMM+zI67ONGbz1lPo6e59zltwQ=;
 b=dfBuGJxjjcqbE3vByDTVmsqh/Dvk1fQq8GP71Sstx3Ppu7IeIWSMkiB713vo/Bhbga
 uK4aPXaq2LjvDmZ6p0s5GWDL7uYdhN8ZuCycNvM8we1gdmUqtkPL7CFHEotc5hnX/S7N
 cMmcyU99AsBHrzBMLb5eg2adzbt+BIn1+Rrmp8zdXzc9e083n+0A+fOmlD2faFvOcdRH
 EAnY/pcMHGIstHIj/fnNNjPbjm4h6XZpxcmg4JhlslFTJ9LMt4XzET/2+2J7IeXUKrjF
 W8D1yhYtIh6WVrnbMtaF2CsdbG+NflWcm+vVRXNZgB10I1yr+T/DQgAAG91Vyx+e2g+2
 TDwg==
X-Gm-Message-State: ACrzQf2iDQYQu/5Mj+lVI91oELmwK+h5Z+wUaySk+2ZjHPAgrnZw2W7Y
 TrleoBwmTpDHGX0Qeb0fRHs6pQ==
X-Received: by 2002:a05:600c:214f:b0:3c6:ce02:8a68 with SMTP id
 v15-20020a05600c214f00b003c6ce028a68mr11161488wml.187.1665763789915; 
 Fri, 14 Oct 2022 09:09:49 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 bv20-20020a0560001f1400b00231a5fa1ae2sm2153599wrb.20.2022.10.14.09.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 09:09:49 -0700 (PDT)
Date: Fri, 14 Oct 2022 17:09:46 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] hw/virtio/virtio-iommu-pci: Enforce the device is
 plugged on the root bus
Message-ID: <Y0mJyjYmTh7DIE1f@myrica>
References: <20221012163448.121368-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221012163448.121368-1-eric.auger@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kRs9eP7/t8GR

On Wed, Oct 12, 2022 at 12:34:48PM -0400, Eric Auger wrote:
> In theory the virtio-iommu-pci could be plugged anywhere in the PCIe
> topology and as long as the dt/acpi info are properly built this should
> work. However at the moment we fail to do that because the
> virtio-iommu-pci BDF is not computed at plug time and in that case
> vms->virtio_iommu_bdf gets an incorrect value.
> 
> For instance if the virtio-iommu-pci is plugged onto a pcie root port
> and the virtio-iommu protects a virtio-block-pci device the guest does
> not boot.
> 
> So let's do not pretend we do support this case and fail the initialize()
> if we detect the virtio-iommu-pci is plugged anywhere else than on the
> root bus. Anyway this ability is not needed.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

I agree with the reasoning. It's not supported, difficult to support and
not needed, so let's make the error more obvious. If I remember correctly,
the problem with supporting an IOMMU behind a bridge is that static
topology descriptions like DT and ACPI identify devices using bus numbers,
which QEMU would need to allocate.

> ---
>  hw/virtio/virtio-iommu-pci.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> index 79ea8334f0..7ef2f9dcdb 100644
> --- a/hw/virtio/virtio-iommu-pci.c
> +++ b/hw/virtio/virtio-iommu-pci.c
> @@ -17,6 +17,7 @@
>  #include "hw/qdev-properties-system.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> +#include "hw/pci/pci_bus.h"
>  #include "qom/object.h"
>  
>  typedef struct VirtIOIOMMUPCI VirtIOIOMMUPCI;
> @@ -44,6 +45,7 @@ static Property virtio_iommu_pci_properties[] = {
>  static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>  {
>      VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
> +    PCIBus *pbus = pci_get_bus(&vpci_dev->pci_dev);
>      DeviceState *vdev = DEVICE(&dev->vdev);
>      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
>  
> @@ -57,11 +59,17 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>              s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_MSI) {
>              error_setg(errp, "reserved region %d has an invalid type", i);
>              error_append_hint(errp, "Valid values are 0 and 1\n");
> +            return;

Should this be a separate fix?  Anyway, for both changes

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>          }
>      }
> +    if (!pci_bus_is_root(pbus)) {
> +        error_setg(errp, "virtio-iommu-pci must be plugged on the root bus");
> +        return;
> +    }
> +
>      object_property_set_link(OBJECT(dev), "primary-bus",
> -                             OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
> -                             &error_abort);
> +                             OBJECT(pbus), &error_abort);
> +
>      virtio_pci_force_virtio_1(vpci_dev);
>      qdev_realize(vdev, BUS(&vpci_dev->bus), errp);
>  }
> -- 
> 2.31.1
> 
