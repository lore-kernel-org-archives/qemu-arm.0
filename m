Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp523995ejb;
        Thu, 14 Sep 2023 06:39:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuMEiyrNXAQ5y4d4a5iZxRmqEVRiDpdpH+GQgEF4hEz52JmCr4AM3/cG0wplZUVJ5B4Xet
X-Received: by 2002:a05:622a:1817:b0:416:5e11:f7ec with SMTP id t23-20020a05622a181700b004165e11f7ecmr6283033qtc.52.1694698761666;
        Thu, 14 Sep 2023 06:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694698761; cv=none;
        d=google.com; s=arc-20160816;
        b=Vld9z5ZtHu5y4L74uTmjYFhMIj3HVUYO+cElQoi7vWDPUZt8U8UoI19Fxnt5z6FtVl
         N+sOSAQLorUjDhw8M4ENgg9WigxdKG6gyfGclXgy786JKJbdHlDnL1DzPQRkDxbpvIxx
         H57HpQGjNEhcXQ6rwtHkdlcDHz4SNw2eC8ETOcxwM9oGpXRZE46iU5jtCiziJcCyjcNY
         71JvJMMVj6Abrnh2mBn0yTLvnZN1BGyVfvf7skcQxHXYS1uvwSBCF0HtyecBdq8YHgyc
         HMPqFyRaQgjuYklqR8QlTpoRqVh6OSAVO1qFTXnyXTSSexY0xx8UfY5XzC0FFqCQqSJH
         9x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:organization:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=8krgu7SjpZQSk8RcsUTkY2dK6xz/Np1YkmMHVnP5aSk=;
        fh=fv2/EASNYO7KwcwKSBCrRDx0gQA4VOsl5HYkxK5MVEw=;
        b=mLYe+hOzVpNGWc5djrIgeLCjhZ7+ZV+f657eXjEKygSU8Ac0fcBjgHq83MAC8BQ1y2
         E5H55E9STZKDhFH6jc6qNWHAHQSUC0HY4b58kyB41o6HAi1e13dSXFAE4Yk0+6/wd771
         4A87ArGQMPd5BlWAXWZRtE5Nz6HGfiAtqzW8+c3LBLb0uTMafX5+tqzr22acXTPwYhLT
         zliEI/x6SEsXIJcfaA1s5dihU+INMGQJh3UnPLkRCC/uMpiwcxFXf//9Ps4k5s6lns+w
         xMJI0+MiMv2vOrC0eQZtZjmsPajwg2vY6NJMy2XLqiGB/3mxZdtIsgmUoNV2satxy66g
         FY3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WMzsvPg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020a05622a04cd00b00408c10b50e0si884011qtx.204.2023.09.14.06.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Sep 2023 06:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WMzsvPg0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qgmYP-0001bK-E3; Thu, 14 Sep 2023 09:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qgmYN-0001aW-Ic
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 09:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1qgmYJ-00056w-0f
 for qemu-arm@nongnu.org; Thu, 14 Sep 2023 09:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694698718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8krgu7SjpZQSk8RcsUTkY2dK6xz/Np1YkmMHVnP5aSk=;
 b=WMzsvPg0FCPhqphfGNTblKCcqbFE2W2bhiXBbQ7gJviF+SAqogszA3iyM6PbRPi81xbKQQ
 OTMjcpUhPNfLCDOh944WpzwlqpvQ6bWoz7wawKFOSX6IweqH6pCoWP+QMnYwlFjqACagPg
 1CHgTtE/+ee64iskNYV6RKWZQOtFwMU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-2xiQWVkcNkK4Ij3DGl8BEQ-1; Thu, 14 Sep 2023 09:38:36 -0400
X-MC-Unique: 2xiQWVkcNkK4Ij3DGl8BEQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-401be705672so7266505e9.2
 for <qemu-arm@nongnu.org>; Thu, 14 Sep 2023 06:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694698715; x=1695303515;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8krgu7SjpZQSk8RcsUTkY2dK6xz/Np1YkmMHVnP5aSk=;
 b=dUzHAesqaIIRyYfXMamtzMP9cplKpYftRIab0B6qtDdCICxzQqFE0da0D2oEVo2Js5
 iYcdv0atN9lz0NRz4rUkrIMIG906zrjDHTSXcKDNcsLiQmJazYnJlP3S8UeIXIL1tZak
 ZGjMlIZlEwgnjkuVqf4NDo5Jo0PWXAf3URD3EgWQ7PUQuo3WOooFumiubm/X06ksZ5z8
 Xkdqp2ynFtgT8Brc2r/5m7BQZiPit/3OLafatajJyhtTLH1AflDAVy6VdfzKCjhJNT5A
 2HpWcvDwp3kNP/IrqBTJCZFQh70INLf5miVlZqwu7X3Re1LdIwp8c8QLgkb9kdq2k3a9
 9yBA==
X-Gm-Message-State: AOJu0Yz1oXRNiyLGQThi2cRlSWPooq3meG5M2BqURLWI7FG8jrkKGZ4r
 Iak0JYFKqP28CoeZHjutjGh2QcUR9uar8uX0Y3NVDIv7VStyOertOj/492bKLPdEwmaYdUls5A7
 RPqetk4/v1N6q
X-Received: by 2002:a7b:cd88:0:b0:401:c52c:5ed9 with SMTP id
 y8-20020a7bcd88000000b00401c52c5ed9mr4780320wmj.32.1694698714914; 
 Thu, 14 Sep 2023 06:38:34 -0700 (PDT)
X-Received: by 2002:a7b:cd88:0:b0:401:c52c:5ed9 with SMTP id
 y8-20020a7bcd88000000b00401c52c5ed9mr4780299wmj.32.1694698714533; 
 Thu, 14 Sep 2023 06:38:34 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7?
 ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
 by smtp.gmail.com with ESMTPSA id
 u20-20020a05600c211400b003fe1fe56202sm2004143wml.33.2023.09.14.06.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Sep 2023 06:38:34 -0700 (PDT)
Message-ID: <4912d0d7-ea57-9317-43d7-1971d7b0f2e9@redhat.com>
Date: Thu, 14 Sep 2023 15:38:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 02/13] memory: Introduce
 memory_region_iommu_set_iova_ranges
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, philmd@linaro.org
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <20230904080451.424731-3-eric.auger@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230904080451.424731-3-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.473, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: bUqtdkFCx9Fs

On 04.09.23 10:03, Eric Auger wrote:
> This helper will allow to convey information about valid
> IOVA ranges to virtual IOMMUS.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/exec/memory.h | 26 ++++++++++++++++++++++++++
>   softmmu/memory.c      | 15 +++++++++++++++
>   2 files changed, 41 insertions(+)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 184cb3a01b..f6fb99dd3f 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -519,6 +519,27 @@ struct IOMMUMemoryRegionClass {
>        int (*iommu_set_page_size_mask)(IOMMUMemoryRegion *iommu,
>                                        uint64_t page_size_mask,
>                                        Error **errp);
> +    /**
> +     * @iommu_set_iova_ranges:
> +     *
> +     * Propagate information about the usable IOVA ranges for a given IOMMU
> +     * memory region. Used for example to propagate host physical device
> +     * reserved memory region constraints to the virtual IOMMU.
> +     *
> +     * Optional method: if this method is not provided, then the default IOVA
> +     * aperture is used.
> +     *
> +     * @nr_ranges: number of IOVA ranges
> +     *
> +     * @iova_ranges: an array of @nr_ranges usable IOVA ranges
> +     *
> +     * Returns 0 on success, or a negative error. In case of failure, the error
> +     * object must be created.
> +     */
> +     int (*iommu_set_iova_ranges)(IOMMUMemoryRegion *iommu,
> +                                  uint32_t nr_ranges,
> +                                  struct Range *iova_ranges,
> +                                  Error **errp);
>   };
>   
>   typedef struct RamDiscardListener RamDiscardListener;
> @@ -1845,6 +1866,11 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
>                                              uint64_t page_size_mask,
>                                              Error **errp);
>   
> +int memory_region_iommu_set_iova_ranges(IOMMUMemoryRegion *iommu,
> +                                        uint32_t nr_ranges,
> +                                        struct Range *iova_ranges,
> +                                        Error **errp);
> +
>   /**
>    * memory_region_name: get a memory region's name
>    *
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7d9494ce70..07499457aa 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1905,6 +1905,21 @@ int memory_region_iommu_set_page_size_mask(IOMMUMemoryRegion *iommu_mr,
>       return ret;
>   }
>   
> +int memory_region_iommu_set_iova_ranges(IOMMUMemoryRegion *iommu_mr,
> +                                        uint32_t nr_ranges,
> +                                        struct Range *iova_ranges,
> +                                        Error **errp)
> +{
> +    IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
> +    int ret = 0;
> +
> +    if (imrc->iommu_set_iova_ranges) {
> +        ret = imrc->iommu_set_iova_ranges(iommu_mr, nr_ranges,
> +                                          iova_ranges, errp);
> +    }
> +    return ret;
> +}
> +
>   int memory_region_register_iommu_notifier(MemoryRegion *mr,
>                                             IOMMUNotifier *n, Error **errp)
>   {

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

