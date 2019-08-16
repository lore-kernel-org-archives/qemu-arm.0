Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp335342wrs;
        Thu, 15 Aug 2019 21:18:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy172naXtq175c5uZiri/5UUZWKQ46FMQbTlG677SsLTvEa1dxSeV3NOscqNyB92OcgsOA8
X-Received: by 2002:a50:e001:: with SMTP id e1mr8853741edl.177.1565929086548;
        Thu, 15 Aug 2019 21:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565929086; cv=none;
        d=google.com; s=arc-20160816;
        b=gVy4PZP7iUXFmcvwgG0LttmGqvlomsAKvIjTgRl4HIakPJhfZj96oBU19FqiL2PbXB
         tJyD7SOZ9kFPHQu1IlDpi6HfSEQJstWtf0KRCzJppZNyULc71LTORqi9KVj9eHHzVtPR
         nQ0pKOMhPgUitbSaUzCn2cxYMwMnFnoApc5Un2O0+y3t47XembQctiQGc//sTIcOd036
         FsW76D2LO6a40jHYK3FskQxMEuVPT5xPC/EzURr0y8JtVEeGoV9WVGKG3zFWPamgwrdo
         JH7NoFgRFnFv/ocmyjimNd4zVQp22+wu3Ydzc86/ufGE/LPkO2qANWxUZwew9iWTKg3O
         B7qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=D916J5lQmpyNIxpQMnm1h0/DyfcbEBR1HCuIX91921w=;
        b=VsiL2zo33aBsM3sJE40u9drSy4CXqHjTOvn9kmxACfgQfn78KdnCxnipaEav0Yg50v
         MnG5eaf2QgiV/QKN47foKlXZagBv84Yn7q4spL9Mw8otcJWDCOyXvVdUEJmmbmOtC8Og
         NZYTwm9pJF4PREI3IqZdQx80RcSPtMpoWqtDBPbFzvXt909/Y2NgQoQnb1RE6HJAonIJ
         YCv9yIcRJuEhqL1/+ZzPy2P20T1HhKGX2h/ZyxPzPq0WSguHfGVW69HKFDhErtKAptmf
         ZPBwNeBI999jiIMoNqMo+alCQUwFCF8zkEHzqIPwUGgIzvxAIHXxD/kfm8Py8f8X1gju
         pZ7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s23si2884163eda.108.2019.08.15.21.18.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2019 21:18:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyTgj-0003lF-3q
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 00:18:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43077)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1hyTga-0003jh-AU
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 00:17:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hyTgZ-000811-3Z
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 00:17:55 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38063)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hyTgY-00080I-UH
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 00:17:55 -0400
Received: by mail-pf1-f193.google.com with SMTP id o70so2447253pfg.5
 for <qemu-arm@nongnu.org>; Thu, 15 Aug 2019 21:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D916J5lQmpyNIxpQMnm1h0/DyfcbEBR1HCuIX91921w=;
 b=hvm8oJp41L26YKBY7NHdIcIeTPkuKKTdt0ZMuU91IqZ/R5bC3ldNWEDdJPHJbjWL5w
 rS81kCZdarwyOd6RM3OGfwJe7VTW8pXo1mmu2hG2/vqr8yitILZNTkOShLPdTyJMi0gV
 81eF2atiVLiGuU98QENApnvi49P8CLDfTxJll+E3wj4NIPz7P5gsf+DOwuAHfLtdYVqI
 tcHI4p/aq2bQWETWhmJu68TPjKTGhjfk4LKSQS2Afc63faiBDx/bTILjJW2ca+pAe7sA
 KtDHjwNn0k0J8xjxk6EMC+2xfQZySZLy/+or9GbgApSAEGSvmQ9DXzt3yWn6awHm2Cdr
 1JrA==
X-Gm-Message-State: APjAAAVvafRB8SbSYg5qOUgacscT0pQY0u4y/VzpHru+koV/4MXzk7/m
 zn8kkLID3wdzQqexf4yGa9W4hg==
X-Received: by 2002:a17:90a:3465:: with SMTP id
 o92mr5227953pjb.20.1565929073839; 
 Thu, 15 Aug 2019 21:17:53 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id f12sm3614701pgq.52.2019.08.15.21.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 21:17:52 -0700 (PDT)
Date: Fri, 16 Aug 2019 12:17:41 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190816041741.GB3114@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-7-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-7-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 06/15] virtio-iommu: Endpoint and
 domains structs and helpers
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, mst@redhat.com,
 tn@semihalf.com, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vJT2ZN7nvGOv

On Tue, Jul 30, 2019 at 07:21:28PM +0200, Eric Auger wrote:
>  static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
> @@ -334,6 +444,8 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_BYPASS);
>      virtio_add_feature(&s->features, VIRTIO_IOMMU_F_MMIO);
>  
> +    qemu_mutex_init(&s->mutex);

It's a bit strange to init a mutex which has already been used in
patch 3. :)

Thanks,

> +
>      memset(s->as_by_bus_num, 0, sizeof(s->as_by_bus_num));
>      s->as_by_busptr = g_hash_table_new(NULL, NULL);
>  
> @@ -342,11 +454,20 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>      } else {
>          error_setg(errp, "VIRTIO-IOMMU is not attached to any PCI bus!");
>      }
> +
> +    s->domains = g_tree_new_full((GCompareDataFunc)int_cmp,
> +                                 NULL, NULL, virtio_iommu_put_domain);
> +    s->endpoints = g_tree_new_full((GCompareDataFunc)int_cmp,
> +                                   NULL, NULL, virtio_iommu_put_endpoint);
>  }

-- 
Peter Xu
