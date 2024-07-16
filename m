Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp194426njk;
        Tue, 16 Jul 2024 07:03:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5A91gthg5ZBlX/e1AflDCF9hvgGiBLU+9O1UrqsiJSEbZxno6vR9sLqJeNszjHJhY7P08CCMxyOEAn3AeU939kFglHJue
X-Google-Smtp-Source: AGHT+IEc3Jwm4wTZl43B55zVCLYSu1CVQzXE8AVPiHyCdjSYAQHZtlq4pUe8ELg7Vc/w2wKTaTFZ
X-Received: by 2002:a05:620a:394a:b0:79f:7a0:fa9e with SMTP id af79cd13be357-7a17b720133mr249796785a.63.1721138597910;
        Tue, 16 Jul 2024 07:03:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721138597; cv=none;
        d=google.com; s=arc-20160816;
        b=bW8gzRHSZAd3SYDb3eBIA9e7blPBv3ADdtgSmQmko4rPmhmFH8OCr0aekNdDMGVn8o
         7HwIoPZaus2O2QlJeBw+hLbkPalpNFXZeIpIhEA6bdGOSi8ILkvJjaZS3lFB2KqMCXWt
         JFfC2W6vEyjTZlARbxTPUGxpmWz4IttSyrB6THVzl0ISbIQF7+RMEcD2bgB82LI0NpGw
         DFa9gF+bRLHhwhHJxfgBeenkO5jCUDhkjI5ZYdmNfdR/+L1PUY1+ciCpMbhWLHBuiOWj
         oGf/OzUnYDxFtaysD7cwPXuWE10U0WsPAI1JXgy/nq3fLaeSVJ6saNubY+nn9YHmhpQ5
         UDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=aO8mbhe8N0AV+I6/SCM/ZbHuea1bTs1IHvzVUC/H6vo=;
        fh=U386xbh7LfKUaSL/akvzvzbJdrgEKmn0Mc3Hrq7xjhM=;
        b=f7opmzP6yt+99K8mJ8o5DHdwLGmxwCKR7lqizVYaep01jPKU69WnRO5ySiiR3GMW+N
         3UMkNkqxBvHRO/jSf6G0U2IQznNZR5U82kvNiW/JmxJHgLdtgqlmKwjd/WXauVxARWle
         +6auxrjqGJW/Abu0FXMouUHBRJQPmDZybRenRWkOZg6js0jnmOW+1B6ZygVnA389EYir
         B1YXZIsIfDDcncmQ3XahARiafysZ7qzp33nmOSVSbBBXuejBuIY1a0RjEp40Z0XsLM9/
         3sl4jooT8uUwqN9vIjTiqA9S0+M27GdEOFy7glYYZLXg/7pIucrqNG6ENHd6sjdokHjQ
         fqMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KgevvBPc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c69d37si744702285a.481.2024.07.16.07.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 07:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KgevvBPc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTilq-0001un-JU; Tue, 16 Jul 2024 10:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTilp-0001uH-Kq
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 10:03:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTiln-0003JM-8N
 for qemu-arm@nongnu.org; Tue, 16 Jul 2024 10:03:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721138585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aO8mbhe8N0AV+I6/SCM/ZbHuea1bTs1IHvzVUC/H6vo=;
 b=KgevvBPc4h9YNoPUlk+j0j9O9Yy5g0i0kCkRxX5sHcS8HOycZ3oC8tFw5VZiFwGtyyNnKx
 BYAbKZ56stOM5r56MPahkuf6ChqQg5mrscH8/7W/fOLFz/cMttwVxiN8UofRP4J/Qbd3A/
 Doh93KjO2wwivrPvnrKJ+2y34DbOcCg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-Ojv1qMjRNHqprpTd4JB5XA-1; Tue, 16 Jul 2024 10:02:57 -0400
X-MC-Unique: Ojv1qMjRNHqprpTd4JB5XA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-426654e244dso39673195e9.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jul 2024 07:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721138575; x=1721743375;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aO8mbhe8N0AV+I6/SCM/ZbHuea1bTs1IHvzVUC/H6vo=;
 b=aaUtGLUq46CUwMEu0CK7ro28O8oPLfaxNAglq7PnvnmZgVfNff+nRVyKpNkk4vHr7m
 /JsfVLTuRdMI20hrI+os452nEO4AbiViWDXUf3MuQLGwF0FKU23F7YcQjQbh3rRA1Xqk
 xyzIBdc0sTwVVdwFMC72ifqYpZRt7/mLXSJRHI8fdtNc1g4085BMdgM4Eos9lCgCZniG
 qU3TR0i0t13UtkuF1l2DchnCCBc65+vjLPEq5UUVkDLb5LY0861UVIc+3E8bDIQEbMtO
 n4qukWnYgsmbsC0cLEHOXgAGXl6MCZPqXfDdXHCKXCxrEnbuVUN4Qg1dVJWhuoVB6YsF
 iLjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzXSW6Qy3J7SkGtT2yAhFhN4K/PF76SEk4We0MFmU7j6HeDmqj7YuHPj3PhhiC4cj1rfmUqcYPSuzHuwGE/GzyBwuC
X-Gm-Message-State: AOJu0Yz5jHVIxz/BAe3DBoawjb9FsMbRG7iz/spBAkIOT00/XvWg/BQt
 wdTl6RXtxT4I0qMnp5Jci2xCCFM7Ij53ehYnnggyIMpzroPFigmMIFp7GZ3GhF4Dz3wRpZb6iq2
 LH7QbwY/l7Qpa/JJ7c5QcO22UtAwS+vP/Z7RY4doenO64F2rHsQ==
X-Received: by 2002:a05:600c:45d2:b0:426:647b:1bf7 with SMTP id
 5b1f17b1804b1-427ba6b0e9emr17144395e9.32.1721138574901; 
 Tue, 16 Jul 2024 07:02:54 -0700 (PDT)
X-Received: by 2002:a05:600c:45d2:b0:426:647b:1bf7 with SMTP id
 5b1f17b1804b1-427ba6b0e9emr17144105e9.32.1721138574520; 
 Tue, 16 Jul 2024 07:02:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:9e2:9000:26c5:842:8baa:576b?
 ([2a01:e0a:9e2:9000:26c5:842:8baa:576b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427a5e994c6sm127643545e9.26.2024.07.16.07.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jul 2024 07:02:53 -0700 (PDT)
Message-ID: <5f64db5d-7690-4d18-8c31-cfe8e2083f5f@redhat.com>
Date: Tue, 16 Jul 2024 16:02:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] VIRTIO-IOMMU/VFIO: Revert IOMMUDevice clear and fix
 hotunplug
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com,
 jean-philippe@linaro.org, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, alex.williamson@redhat.com, jasowang@redhat.com
Cc: yanghliu@redhat.com
References: <20240716094619.1713905-1-eric.auger@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20240716094619.1713905-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: K6LboQA1U3B4

On 7/16/24 11:45, Eric Auger wrote:
> 1b889d6e39c3 ("virtio-iommu: Clear IOMMUDevice when VFIO
> device is unplugged" fixes the VFIO hotplug/hotunplug/hotplug
> sequence by clearing the IOMMUDevice which backs the VFIO device.
> However this brings other troubles such as a memory corruption.
> 
> Even when fixing some cleanups that were missed on the first
> attempt the memory corruption still exists if the IOMMUDevice is
> freed. Until we understand the exact cause let's make things simpler:
> let the backing IOMMUDevice survive the unplug as what is done
> on intel iommu for instance. Clean up/reset resources that would
> prevent the device from being hotplugged again (probe_done is removed,
> [host_]resv_regions are reset). By doing this we also rule out the
> use case of aliased BDFs which is known to be not functional with
> virtio-iommu (missing guest kernel support) and the virtio-iommu device
> implementation is not ready either.
> 
> This series can be found at:
> https://github.com/eauger/qemu/tree/virtio_iommu_device_clear_fixes_v1
> 
> 
> Eric Auger (6):
>    Revert "virtio-iommu: Clear IOMMUDevice when VFIO device is unplugged"
>    virtio-iommu: Remove probe_done
>    virtio-iommu: Free [host_]resv_ranges on unset_iommu_devices
>    virtio-iommu: Remove the end point on detach
>    hw/vfio/common: Add vfio_listener_region_del_iommu trace event
>    virtio-iommu: Add trace point on
>      virtio_iommu_detach_endpoint_from_domain
> 
>   include/hw/virtio/virtio-iommu.h |  1 -
>   hw/vfio/common.c                 |  3 +-
>   hw/virtio/virtio-iommu.c         | 88 +++++++++++---------------------
>   hw/vfio/trace-events             |  3 +-
>   hw/virtio/trace-events           |  1 +
>   5 files changed, 35 insertions(+), 61 deletions(-)
> 


Tested-by: Cédric Le Goater <clg@redhat.com>

with a vfio-pci device (mlx5 VF) and a virtio-net-pci device.

Thanks,

C.

