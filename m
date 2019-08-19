Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2365976wrs;
        Mon, 19 Aug 2019 01:24:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwqDz1PXVU5dUYNR5ikjLAzubc2RT5qZFRc3rJfL9jspTFuSwFrHXm81+AsdVxQhxw6NJYW
X-Received: by 2002:a17:906:f198:: with SMTP id gs24mr900952ejb.6.1566203086946;
        Mon, 19 Aug 2019 01:24:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566203086; cv=none;
        d=google.com; s=arc-20160816;
        b=0aiqz+HDWDCKt+1U7aiI9QAzO/ZWcG57+RajaBPlEvTNQy5nKuh0/JtMphvZZqlU/J
         X8UhoCRkMiR9LaokOPz0rNhsd85rNBydyML2nSQAyjSqnMteqebyXt5jga3dfODNCiwC
         bcKdIV6gWwteEq3c0nJdIpxpnF4qjofFqD0rqsQo11yQEB4cGT2nw4ljtSXwPIk1iZlx
         qZI6Q5Hf9suxY77QpVeKfnIlYwMWMy8oiCON3U7inD2YAmw3i8CVPy/Fyah3tyfNRCsg
         EIzx+/S7x/y+be8cqDFzzoy9/5OZquBxXTGShFAukq+meL2OecgOY9V8ahhAvNnM95YN
         wqHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=V8Qq6gIj/7UHNtF3Q/nrDQz402eJnQlcpzE+48iOFgs=;
        b=bpwLfTYxJ3PfYoOySDjiRr4HvB6kSllXbMfZcrHllSijb52mo0Qh9Gst2c+A1wm8zT
         O5lbf+q2eVCnxPtN5fJxeyaGmiaaww3JhFiG8rGnXYMIK2B22J8NQOh348CBmbhviilV
         buvykp0gv44w8uWlZI7YQn1YlO1pGRIHZamZ/xPjuhQPtTdtSB56028vu6ocb2WRIo0D
         v8OIThzHCbkQx+GrXNuXpWnj3/tx/Lfi310qBVM94w1HduV+0a6ehs03YSM25j9xBEbn
         HEZVNanaRlUhIMC4+ii9Fl4/1TJEcsUzvZeps3iEcthQuT8U5Qt/DgAcZm5tu9sble12
         WQMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a7si7463301edt.154.2019.08.19.01.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 01:24:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzcy6-0000zw-0A
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 04:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46071)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1hzcxy-0000zj-7B
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 04:24:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hzcxx-0005b0-13
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 04:24:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53962)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hzcxw-0005aW-Q2
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 04:24:36 -0400
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1BC3165F45
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 08:24:36 +0000 (UTC)
Received: by mail-pf1-f200.google.com with SMTP id i2so2064252pfe.1
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 01:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=V8Qq6gIj/7UHNtF3Q/nrDQz402eJnQlcpzE+48iOFgs=;
 b=SZ37SH0iNEWMWxcBj9OoQ/rFGKZbuO3X35bsXeJv/Q1MqD8oMyZ1RrAHuOiEq/Yx+y
 tKrqVKU0yxsDnsr20bQtne77UNWj9UQvYFZ0tpLNpY5MKC+SzGH/rgi4D7LelGWxmnSZ
 WVrk4uoPnv4OoHSl80mw7JCFx35YrFBM9PfA077Y8CUZeI0mcgLf3FO2Ut9+608++9Hr
 q+V2EjkYukRWpOaAxDt8c0VZiqEOdpIqYbNMMXw32Btbk9vBACwbO+AWaW2ANdvFRGKx
 rWv5d5enyOJPnzmCgwBAQAPzd/pTM46Iv/BtNb2Ymmbbp1Y8y1oSJ6gSZJV1NTpWlmFG
 mWBA==
X-Gm-Message-State: APjAAAVFfL/YQ4J4uP9NmIw6S8UmQbMZWedIFsrrA7+KxhpzNiZE/2WW
 o5+4TVucRLmyYFfnOgkOlsqp6mH3fBR4QSUZRY9tuJY6jysNWkNGtIAXnSSL6ttqVUPxGn4UeqF
 Zyr3as0GHi9oW
X-Received: by 2002:a63:221f:: with SMTP id i31mr19194645pgi.251.1566203075339; 
 Mon, 19 Aug 2019 01:24:35 -0700 (PDT)
X-Received: by 2002:a63:221f:: with SMTP id i31mr19194625pgi.251.1566203075064; 
 Mon, 19 Aug 2019 01:24:35 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 136sm20597897pfz.123.2019.08.19.01.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 01:24:34 -0700 (PDT)
Date: Mon, 19 Aug 2019 16:24:24 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190819082424.GB13560@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-10-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-10-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 09/15] virtio-iommu: Implement
 translate
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
X-TUID: 2gQX/LgrrtcH

On Tue, Jul 30, 2019 at 07:21:31PM +0200, Eric Auger wrote:
> @@ -464,19 +464,75 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
>                                              int iommu_idx)
>  {
>      IOMMUDevice *sdev = container_of(mr, IOMMUDevice, iommu_mr);
> +    VirtIOIOMMU *s = sdev->viommu;
>      uint32_t sid;
> +    viommu_endpoint *ep;
> +    viommu_mapping *mapping;
> +    viommu_interval interval;
> +    bool bypass_allowed;
> +
> +    interval.low = addr;
> +    interval.high = addr + 1;
>  
>      IOMMUTLBEntry entry = {
>          .target_as = &address_space_memory,
>          .iova = addr,
>          .translated_addr = addr,
> -        .addr_mask = ~(hwaddr)0,
> +        .addr_mask = (1 << ctz32(s->config.page_size_mask)) - 1,
>          .perm = IOMMU_NONE,
>      };
>  
> +    bypass_allowed = virtio_has_feature(s->acked_features,
> +                                        VIRTIO_IOMMU_F_BYPASS);
> +
>      sid = virtio_iommu_get_sid(sdev);
>  
>      trace_virtio_iommu_translate(mr->parent_obj.name, sid, addr, flag);
> +    qemu_mutex_lock(&s->mutex);
> +
> +    ep = g_tree_lookup(s->endpoints, GUINT_TO_POINTER(sid));
> +    if (!ep) {
> +        if (!bypass_allowed) {
> +            error_report("%s sid=%d is not known!!", __func__, sid);

Maybe use error_report_once() to avoid DOS attack?  Also would it be
good to unify the debug prints?  I see both error_report() and
qemu_log_mask() are used in the whole patchset.  Or is that attempted?

> +        } else {
> +            entry.perm = flag;
> +        }
> +        goto unlock;
> +    }
> +
> +    if (!ep->domain) {
> +        if (!bypass_allowed) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "%s %02x:%02x.%01x not attached to any domain\n",
> +                          __func__, PCI_BUS_NUM(sid),
> +                          PCI_SLOT(sid), PCI_FUNC(sid));
> +        } else {
> +            entry.perm = flag;
> +        }
> +        goto unlock;
> +    }
> +
> +    mapping = g_tree_lookup(ep->domain->mappings, (gpointer)(&interval));
> +    if (!mapping) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s no mapping for 0x%"PRIx64" for sid=%d\n",
> +                      __func__, addr, sid);
> +        goto unlock;
> +    }
> +
> +    if (((flag & IOMMU_RO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_READ)) ||
> +        ((flag & IOMMU_WO) && !(mapping->flags & VIRTIO_IOMMU_MAP_F_WRITE))) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "Permission error on 0x%"PRIx64"(%d): allowed=%d\n",
> +                      addr, flag, mapping->flags);
> +        goto unlock;
> +    }
> +    entry.translated_addr = addr - mapping->virt_addr + mapping->phys_addr;
> +    entry.perm = flag;
> +    trace_virtio_iommu_translate_out(addr, entry.translated_addr, sid);
> +
> +unlock:
> +    qemu_mutex_unlock(&s->mutex);
>      return entry;
>  }
>  
> -- 
> 2.20.1
> 

Regards,

-- 
Peter Xu
