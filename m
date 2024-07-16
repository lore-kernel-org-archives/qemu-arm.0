Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp159428njk;
        Tue, 16 Jul 2024 06:06:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4RTtOAVy3YzzzR3ZJz+JqwheLHLoK2BanPEXeH+aSkAfzIpLDAFx4cCd5tigyz7YQdCXw0Uw7RomgBNgE/xbppREcVA8k
X-Google-Smtp-Source: AGHT+IFUyjXSRFM8n3U19wZKgSTD0Pq61Uw85PcCobz+qMmNo5pX4MmhGTpReokyPEpWluVg2A+k
X-Received: by 2002:a05:6214:21a6:b0:6b5:eba0:d0ab with SMTP id 6a1803df08f44-6b77f4ed75cmr26482586d6.15.1721135179190;
        Tue, 16 Jul 2024 06:06:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721135179; cv=none;
        d=google.com; s=arc-20160816;
        b=KY0uGKZtXqFPLUvnY50RhKhO8ifvQxBxgOz1bwImnaeRNbK2DOn6aO3FFQiJBQE28w
         F+eTB0N8JE26BzeEQzSbPM01r7Lv4Zk0juw6FCww1uTLShsVPAiS5ThwB36kaOgQq4Tp
         OGQqzzsYiQfqRTaUjux6CsYPgx+ucarVA3U6x6lWLXThUP3y3icmyTzoOIpL5ZqW3wI7
         yvILus28rOuiPvnlZnp8kaZ+kNFdUPoN/LxpYhUQbAnY7RaerNV88J60aSWZ6OGHeklq
         Q4ibF0YCJUvghOBGGckWh3EZT0FSId5Aj4sOc1zOEm42sUuyiHq+sN4qkGciU43S43YA
         CmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Yh9OERLQkLrXdyvBxGlZ2joiP5r19cWo6wbZFDEqUhE=;
        fh=kax1Oc2mX4tbsHDyYz8mALW6nl+wSLnqE+l2/3XTT20=;
        b=Yxhq5iGI5ZSI7hWjdYFYbj7V6Std9YPL3oBGEueLrQ91bSaP3wYxSGTqCsww/KTmKO
         770FyFsIXU8gngjfL58DirS4FFEDtgI5gc0jCO49knjSUaLxQHRzgowZSLEs81YBRgQs
         1VT0Bp3ZW9nEkXWvlT8kLyV25sQr151BqmZ4iCD5nLpPyq+l7wpsLC0GSfBxtDrgotD1
         G0mcoaykS1FUevtznzUyWIN/WJZCAJsqGh3c3/7zRCauxSdy1SLngsp4D+nTfGNJg2rG
         Hm9DK+YlnJw8Bk7iaLQRohg6cr1i/tuPlguuXeijTpOTLbAAwE0TC/bnxlx7A4IxVTjx
         RvOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U4QFlVGg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a3c745si73757606d6.454.2024.07.16.06.06.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 06:06:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=U4QFlVGg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sThsK-0007pZ-5J; Tue, 16 Jul 2024 09:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sThsI-0007o8-EY
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 09:05:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sThsG-0008Dy-I6
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 09:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721135143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yh9OERLQkLrXdyvBxGlZ2joiP5r19cWo6wbZFDEqUhE=;
 b=U4QFlVGgNs52pPGgjg0dmiG4HUXVjk8QUW6Ww8IOznluKFSj0cCFvuCWF1O5EhjEf1Vv+D
 JHNx/gzCgQCT/KDp165KoecR4UY0xGyEUrYRF84mnTXI8VGjVulQsTV0H+TcIqSb7aE44f
 L+yQZw7sEpMs/uAJq9JzfhVmlaX8IJU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-6hGnzjD8O2Kv1S1hU_Wa4g-1; Tue, 16 Jul 2024 09:05:41 -0400
X-MC-Unique: 6hGnzjD8O2Kv1S1hU_Wa4g-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-427b57e3c6fso11173925e9.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 06:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721135140; x=1721739940;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Yh9OERLQkLrXdyvBxGlZ2joiP5r19cWo6wbZFDEqUhE=;
 b=Oj850SHSfM8sFW/g2GWLYXn+bN3+nHlGtmt5Jsgl8KOp/ImnBqPOLLb/MjW2ygl4bY
 lfYKvU41a7uFaDTpG0QIhVjMwb437iZIFpG4IlabIN7ql+eOKiJpXNzGEbjfaR7RFgac
 wfcrCnWKIa5aWcfF0C0CRIU+UKrZECUNkmUCESUHDtqWn6ZJdmWTItWN0QhpFyc3VHSI
 tau1l79dxMDCIFsq2uEHNscNt+edEC1V8eE1GCK8o1AlfvalqrJecYEJQtshZAIpqPar
 MgH9N3hS8MKVYyFumnhuEhsqpjYb2ThRU7uE2lKOsa8ped36VPol6I5FnnOK7S8bIeOr
 r+mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVjD0Phkf468E4gLHRm3Ll8vYkjqCRBfjl80LnAKD8yvK9LAbHj2Vd35Hqo/nK+nGrY4G4aBwm5YkwRFLa78N+sIeL
X-Gm-Message-State: AOJu0Yy724vCMXN6Eg4B3V/TVoLu6P5/68nLtR8U1LIUewHnSOvwVr//
 hiY9J+WcARgJeLtgv2nwPsTkJMJ9TM2idtaHWzU+WjLuafLaxumtWBMov+YMx86czkA1ICKUhVv
 401SXeXX/zw6ZjjzdUDPiwXy7A6DQtBW2jMHfdSFkCVIrCWNgkg==
X-Received: by 2002:a05:600c:4fce:b0:426:8ee5:5d29 with SMTP id
 5b1f17b1804b1-427ba628f03mr15060035e9.9.1721135140741; 
 Tue, 16 Jul 2024 06:05:40 -0700 (PDT)
X-Received: by 2002:a05:600c:4fce:b0:426:8ee5:5d29 with SMTP id
 5b1f17b1804b1-427ba628f03mr15059845e9.9.1721135140331; 
 Tue, 16 Jul 2024 06:05:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:9e2:9000:26c5:842:8baa:576b?
 ([2a01:e0a:9e2:9000:26c5:842:8baa:576b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db04748sm8967576f8f.102.2024.07.16.06.05.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 06:05:39 -0700 (PDT)
Message-ID: <6f076ede-0939-4804-a878-6c1e094dff17@redhat.com>
Date: Tue, 16 Jul 2024 15:05:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] Revert "virtio-iommu: Clear IOMMUDevice when VFIO
 device is unplugged"
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com, jasowang@redhat.com
Cc: yanghliu@redhat.com
References: <20240716094619.1713905-1-eric.auger@redhat.com>
 <20240716094619.1713905-2-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240716094619.1713905-2-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: Y0unT6HRpCzk

On 7/16/24 11:45, Eric Auger wrote:
> This reverts commit 1b889d6e39c32d709f1114699a014b381bcf1cb1.
> There are different problems with that tentative fix:
> - Some resources are left dangling (resv_regions,
>    host_resv_ranges) and memory subregions are left attached to
>    the root MR although freed as embedded in the sdev IOMMUDevice.
>    Finally the sdev->as is not destroyed and associated listeners
>    are left.
> - Even when fixing the above we observe a memory corruption
>    associated with the deallocation of the IOMMUDevice. This can
>    be observed when a VFIO device is hotplugged, hot-unplugged
>    and a system reset is issued. At this stage we have not been
>    able to identify the root cause (IOMMU MR or as structs beeing
>    overwritten and used later on?).
> - Another issue is HostIOMMUDevice are indexed by non aliased
>    BDF whereas the IOMMUDevice is indexed by aliased BDF - yes the
>    current naming is really misleading -. Given the state of the
>    code I don't think the virtio-iommu device works in non
>    singleton group case though.
> 
> So let's revert the patch for now. This means the IOMMU MR/as survive
> the hotunplug. This is what is done in the intel_iommu for instance.
> It does not sound very logical to keep those but currently there is
> no symetric function to pci_device_iommu_address_space().

Fully agree.
  
> probe_done issue will be handled in a subsequent patch. Also
> resv_regions and host_resv_regions will be deallocated separately.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/virtio/virtio-iommu.c | 21 ---------------------
>   1 file changed, 21 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 33ae61c4a6..4e34dacd6e 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -467,26 +467,6 @@ static AddressSpace *virtio_iommu_find_add_as(PCIBus *bus, void *opaque,
>       return &sdev->as;
>   }
>   
> -static void virtio_iommu_device_clear(VirtIOIOMMU *s, PCIBus *bus, int devfn)
> -{
> -    IOMMUPciBus *sbus = g_hash_table_lookup(s->as_by_busptr, bus);
> -    IOMMUDevice *sdev;
> -
> -    if (!sbus) {
> -        return;
> -    }
> -
> -    sdev = sbus->pbdev[devfn];
> -    if (!sdev) {
> -        return;
> -    }
> -
> -    g_list_free_full(sdev->resv_regions, g_free);
> -    sdev->resv_regions = NULL;
> -    g_free(sdev);
> -    sbus->pbdev[devfn] = NULL;
> -}
> -
>   static gboolean hiod_equal(gconstpointer v1, gconstpointer v2)
>   {
>       const struct hiod_key *key1 = v1;
> @@ -728,7 +708,6 @@ virtio_iommu_unset_iommu_device(PCIBus *bus, void *opaque, int devfn)
>       }
>   
>       g_hash_table_remove(viommu->host_iommu_devices, &key);
> -    virtio_iommu_device_clear(viommu, bus, devfn);
>   }
>   
>   static const PCIIOMMUOps virtio_iommu_ops = {

