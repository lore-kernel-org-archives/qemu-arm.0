Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp118619njb;
        Fri, 7 Feb 2025 03:10:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0dufTAXXQY2OrNxrb/38+nYmr50zy7jjTgvw/hRdjk6zk9OcXfOl1FR6+L/UYZHSTBBw8/XalFCENpg==@linaro.org
X-Google-Smtp-Source: AGHT+IHb5cS+25O7fkL1b+m+TNc8hGhy4df5tQ7P0OEzq8tCUlJn5dCkCemEr3D4qY7ZLeDwQBBD
X-Received: by 2002:a05:620a:454a:b0:7b6:d631:266f with SMTP id af79cd13be357-7c047bbc58fmr384350485a.14.1738926627972;
        Fri, 07 Feb 2025 03:10:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738926627; cv=none;
        d=google.com; s=arc-20240605;
        b=fk5upaaxGDKBucwofqkoaz996biMZiGZ5XdKrG624ygyfB+vLyba97AogekDDb5U9C
         4qUX/8g2P+TUmn4bzfmmFMy6kgszv61OGnHdMCYKxpQS0U7EAxsgurGQyF6l+XJaWQ37
         z0P5r7E2Pc9iMDY8NUCFzs+mkoG9NmG/KfTE1XJDr5Tqgbym9mO7kPp+B9+I/NTiRCj7
         9iK3MqGlsbcodPe/ziBRh7vrrVcgzTud1zBmYYYYgTXfHcLGdSw4LrvGI8Tpu/gR0Unt
         K0WkRU9kQufV1it0oILrpN1YjlfkNuPi/UfRGdOSSoq0rtQC/92wdOCvVKfjHL4GFTYZ
         V/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=vb2bbZYfMJmk7CtnqEzHJQalG3GcWGX7WKXDfRplJsQ=;
        fh=jVTi0jDyN9xjeakBVyy/c1/6+Sk6J5ZQhaXsRksd3Ms=;
        b=E16/GPyfirMhs3fl+vyziyfb9J3FKYVe8ECrl23aWIBxbKg/ImlfNlYQBYHpBdf7wg
         Nw+a1o7NfubvHe/nbkZHuZSwM5xxnI+OIWVzEtcgzM6JZqJnuXKGDzVk2XY9g4zqwhN3
         Jxbsm3Vt4CI0E21eQUQ19Vv0S4AbbjSrI5h9xYiwhTbQSoBR2jcbEZeiZ1NPJkdcJGyY
         BJmwNkWL3+9w+8m6SidyMdJgCTO56J3r4NEg78lkuxAYW4yOAj2eyb7ueK34HMJLRd2G
         BFCX2tBwhyzsqMMM46/8Sq+Yqm9nmnqJt5qDQOfO4uoJLUtcny9KpNV5340XPs5AufU8
         ZvXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IFfraZHk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153be1bf0si28752121cf.628.2025.02.07.03.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 03:10:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IFfraZHk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgMFL-0005sG-VS; Fri, 07 Feb 2025 06:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tgMFK-0005qM-JR
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 06:10:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1tgMFI-0003IY-TB
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 06:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738926603;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vb2bbZYfMJmk7CtnqEzHJQalG3GcWGX7WKXDfRplJsQ=;
 b=IFfraZHkAPqe9UX/QyDdpz4rpSCdGRtykU/CbJyZZBGrT0CNcwId1+KkUKGNxW3vDSVE1K
 ZF/XnlKvq+F//7U9SwvOyleK8jq4ouOgxeTjeXtIiLNpTenssJTczJthLcFX0/wETEv8Mz
 8HocNtxd9WaLwL8Z8aXre0DgA3npNVg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-TmKdEW8IP7-ftlDUb4wf4w-1; Fri, 07 Feb 2025 06:10:02 -0500
X-MC-Unique: TmKdEW8IP7-ftlDUb4wf4w-1
X-Mimecast-MFC-AGG-ID: TmKdEW8IP7-ftlDUb4wf4w
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-438e180821aso11988675e9.1
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 03:10:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738926601; x=1739531401;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vb2bbZYfMJmk7CtnqEzHJQalG3GcWGX7WKXDfRplJsQ=;
 b=Pdjy7VJfeLaA3ICDKw2UsMm/r8RvWc5u7mHKAjHQ/4ZLS3NuEZsWXmKt0tl9rYjRvD
 a/xHQ9iUCXRRd3v2tUbGqAJ0WCMRZSLVXYSQsLIXFFXK/lkgIFbftVIqfC5nHiV4Zhtg
 YN10HBpvM7PWSCkBL1I5JQToZsMjGgWOMF9D6xaJuqIfsj7EPVkD0G/NnZ6il2cWtmhw
 H4/N41tAJs7dA1IGTHYJN/O1vEuoYwmqF4bUEqmYzFNgoogPpJmNVZSJlRWt1DQFUHah
 8ux4J0FCqG8hhCXvHIQkfRPZySJGAHRQNapU7SH6drRG38Q82Fj1jFJASokAOJiXtuZY
 OyUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUH0bwWCPBPZzq5kRYXgRsDU1f83OyNiNZjULOzCNdTVUmrSWzYcCRyR6whnYiLy6TtqLSD+xiynw==@nongnu.org
X-Gm-Message-State: AOJu0Yx2IiQs2SrnRYO9WLC+eelx2vLT8zoVBeC4AJ2WYALJMCXH3dpD
 nKVVtzoR6IIHmbFU0ps4vT3UmVhfa3dKhMVAp9mqoDE1FnMncP0VwIm8LQVPuHJ48QLw+Ks14WR
 MA8rQzvCwroKCq7sgiKAzQt7wxVIvW3yeN9wneAVDff15TmwQBA==
X-Gm-Gg: ASbGnctASb94eVaS0gleyAsfnASdwrxvA/Rvm2mvR76Jp+9SwkphGNCa7XeYksKoow0
 gmsmIFrwH+xU42ql5/70ZWsPDBN6SkQFvFYmHbZ/9B964vJzjRvfilTMkGD0wRwQP86/v/hmvFt
 PJIrOtfvLjz94Sj2/nPLHifjraXwbeW9E0Td6H+WnelKJBHVgVn1aSlD/p/DnCHWlRJnCOTZS9l
 Q3+VOWPFcwISFLJ1ct9LwEC9jxSn+UTBalaC8zaxm54Y1yn0922KZyB+ME43VobU66nfNbj3Q==
X-Received: by 2002:a05:600c:1c07:b0:434:ff9d:a3a1 with SMTP id
 5b1f17b1804b1-4392497d81bmr23565575e9.2.1738926601090; 
 Fri, 07 Feb 2025 03:10:01 -0800 (PST)
X-Received: by 2002:a05:600c:1c07:b0:434:ff9d:a3a1 with SMTP id
 5b1f17b1804b1-4392497d81bmr23565295e9.2.1738926600706; 
 Fri, 07 Feb 2025 03:10:00 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:610a:fb15:126:1857:dec9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde0fe37sm4248023f8f.69.2025.02.07.03.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 03:09:59 -0800 (PST)
Date: Fri, 7 Feb 2025 06:09:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, jasowang@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, alex.williamson@redhat.com, clg@redhat.com,
 philmd@linaro.org, zhenzhong.duan@intel.com, ddutile@redhat.com
Subject: Re: [PATCH 0/5] Fix vIOMMU reset order
Message-ID: <20250207060822-mutt-send-email-mst@kernel.org>
References: <20250206142307.921070-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250206142307.921070-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r3A9PquqkTobmE_coCkMPKOtgRkEL9SiP6Kpq40yaUY_1738926601
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-TUID: MvO8Unl7V3t5

On Thu, Feb 06, 2025 at 03:21:51PM +0100, Eric Auger wrote:
> This is a follow-up of Peter's attempt to fix the fact that
> vIOMMUs are likely to be reset before the device they protect:
> 
> [PATCH 0/4] intel_iommu: Reset vIOMMU after all the rest of devices
> https://lore.kernel.org/all/20240117091559.144730-1-peterx@redhat.com/
> 
> This is especially observed with virtio devices when a qmp system_reset
> command is sent but also with VFIO devices.
> 
> This series puts the vIOMMU reset in the 3-phase exit callback.
> 
> This scheme was tested successful with virtio-devices and some
> VFIO devices. Nevertheless not all the topologies have been
> tested yet.
> 
> Best Regards
> 
> Eric



Looks good.


Acked-by: Michael S. Tsirkin <mst@redhat.com>

How should this be merged?
I supposed I can merge the 1st three and the other
two by the respective maintainers?
I don't think there's a dependency here, right?

> This series can be found at:
> https://github.com/eauger/qemu/tree/viommu-3phase-reset-v1
> 
> Eric Auger (4):
>   hw/virtio/virtio-iommu: Migrate to 3-phase reset
>   hw/i386/intel-iommu: Migrate to 3-phase reset
>   hw/arm/smmuv3: Move reset to exit phase
>   hw/vfio/common: Add a trace point in vfio_reset_handler
> 
> Peter Xu (1):
>   hw/i386/intel_iommu: Tear down address spaces before IOMMU reset
> 
>  hw/arm/smmuv3.c          |  9 +++++----
>  hw/i386/intel_iommu.c    | 10 ++++++----
>  hw/vfio/common.c         |  1 +
>  hw/virtio/virtio-iommu.c |  9 +++++----
>  hw/arm/trace-events      |  1 +
>  hw/i386/trace-events     |  1 +
>  hw/vfio/trace-events     |  1 +
>  hw/virtio/trace-events   |  2 +-
>  8 files changed, 21 insertions(+), 13 deletions(-)
> 
> -- 
> 2.47.1

