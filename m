Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6060852lff;
        Tue, 10 Dec 2019 08:43:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqxATLCCWeHOKkMAxXoNGnw8oC3qchYmyZxpCGTEKt735Xk+snGKLrci3niBInGn0LRJrBKp
X-Received: by 2002:a37:a4cf:: with SMTP id n198mr13549683qke.483.1575996214282;
        Tue, 10 Dec 2019 08:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575996214; cv=none;
        d=google.com; s=arc-20160816;
        b=bWwOR23xm8yy3yfLTAtFhD83QtHUI+06tbT1z5M6yy5QN8OBnti+57zkpbOQ/8mtvk
         KGDSR/6Z4BXwA8AN94ThrhGFrMOoalIn+mSGAfdTQb5ggHiPNR9ZZm5UZn9ZeVjX/hHe
         O+VOUAGDysliMiMo1fiTXJGYau1i6gwcP2mR6ypp5Ibm7Ap5sWrAZd4hmQlivBylNS0U
         AJZf0Ggb7qYeGXHEzesJ0YZQlCAP2eHaDvlJUzOMJxK9spJUvzjeB3ULSbJldnUQSjSc
         8qbrnIL+iwT7C9V2oc1y7NI4/8MNsQ1jznIkzN3yl6dkGwpI/jNI0lc9ZD3K0EQwQIf4
         1wvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=gqtOT5wE759za0LpbvnxJtRB0nZSfy/DZcdzVo4pDRI=;
        b=uSPfVAaF4vI8nA4YJ79OWNxWjtNDrnNY9PYrLciVqasaPSMNIwVHVBhJHCWR6pEGX4
         fW0BmuxzsIK2z3wx8TirywtcyqRUmJ1Ys48oUg8hh5a98j0CvkNh6jQnmIaSptf0CedZ
         Sm/KLmguFwePDf02CJtimzp5HC+zKZj4drutrBUjhuFa+HGDcy7K0mkqJ48RcWiu3tA1
         9VzCfo2fYoVDy41YJWzygDyRt6HtfbWnbZM8g3qQuriNvNnT6WMhC+jjoFnoQcu/EcZx
         f3blx2UAExr6wVtrOAbFUAL34n7nrtKCxN2xqXeAPXtuxrDEb5HLni/v3KDsERaF2qE5
         PXMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="lLCV/4Kj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h3si2102710qvs.71.2019.12.10.08.43.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2019 08:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="lLCV/4Kj";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieibl-0001hA-OP
	for alex.bennee@linaro.org; Tue, 10 Dec 2019 11:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58295)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiaL-0000mZ-FM
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:42:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1ieiaK-0003he-BB
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:42:05 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35070)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1ieiaK-0003hP-3L
 for qemu-devel@nongnu.org; Tue, 10 Dec 2019 11:42:04 -0500
Received: by mail-wr1-x441.google.com with SMTP id g17so20886806wro.2
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2019 08:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gqtOT5wE759za0LpbvnxJtRB0nZSfy/DZcdzVo4pDRI=;
 b=lLCV/4KjY237HMPohF0mo2sSICkE5JBX794nSpAY+rZx6y/ynvDvsy48mtIzV4pzHS
 xbgVZ9JUDviRDv3KleVVmodHwqH1Bh5TDjOMb3MmhmE1J67RYHFtoDb4NH75EcJ90R4u
 q5wlb+wIMNeFVqYpnamEzMOO9IrIS78NeAUBrhFk0WxqlFuj8dipHRszGbzZU0wmfLLc
 s93pqsexqAAf1dNG0RrRmoeMnB4GVeb0459lyZE9Qqru4HBz709oEsuca58h++gMGB+O
 jwx30o5OzVspUdv36R5YLjTU9EYZts1t80PIRbShq5L3Ph7whBKvhj1BR8o/HAV/b0GS
 3U+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gqtOT5wE759za0LpbvnxJtRB0nZSfy/DZcdzVo4pDRI=;
 b=sMv1lRDTmhkOegQ+HsUyKdW1r2/hJmz/PBzEeV/2Ft6FxHyu9ZTx2tVyQpMmT7Bu2x
 yowqcIVppVMeK9VkJugT7/eM/8+TfHWVQjrumrmvUQKKeQIksRM069OfGrVEXJEMxynU
 2EFiWR/Ftk6Z+WHSi96JlS5TPXRmsuXD8mKQ293z+pNqowWQkAGNufZkbIf/ERxakB1i
 heNEeft6Wse5O+z1v6z5AsqLTP+ZbucafkCSP7CfTncoTi1qy/GrIsWHTXyKwZ/sNqzp
 D7xWNfaszLTFHjdzP1BQi7pH63MZu8bn+3//1W09I7o0LpMB3zzXID13lmsgkW1UJdjM
 YVUw==
X-Gm-Message-State: APjAAAUAjlfP0Qdqxwot2JBp/MCCHWHtITygDgFRnVqZcmXBM2DRclfI
 +TdgGLQMyEmFrYH4gHXI+mLPGA==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr4213902wrt.70.1575996123027;
 Tue, 10 Dec 2019 08:42:03 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id e8sm3824236wrt.7.2019.12.10.08.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 08:42:02 -0800 (PST)
Date: Tue, 10 Dec 2019 17:41:56 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 06/20] virtio-iommu: Implement attach/detach
 command
Message-ID: <20191210164156.GE277340@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-7-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122182943.4656-7-eric.auger@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X6LL5lexUM1g

On Fri, Nov 22, 2019 at 07:29:29PM +0100, Eric Auger wrote:
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 235bde2203..138d5b2a9c 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -77,11 +77,12 @@ static gint interval_cmp(gconstpointer a, gconstpointer b, gpointer user_data)
>  static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
>  {
>      QLIST_REMOVE(ep, next);
> +    g_tree_unref(ep->domain->mappings);
>      ep->domain = NULL;
>  }
>  
> -viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id);
> -viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id)
> +static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
> +                                                  uint32_t ep_id)
>  {
>      viommu_endpoint *ep;
>  
> @@ -102,15 +103,14 @@ static void virtio_iommu_put_endpoint(gpointer data)
>  
>      if (ep->domain) {
>          virtio_iommu_detach_endpoint_from_domain(ep);
> -        g_tree_unref(ep->domain->mappings);
>      }
>  
>      trace_virtio_iommu_put_endpoint(ep->id);
>      g_free(ep);
>  }
>  
> -viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id);
> -viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id)
> +static viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s,
> +                                              uint32_t domain_id)

Looks like the above change belong to patch 5?

>  {
>      viommu_domain *domain;
>  
> @@ -137,7 +137,6 @@ static void virtio_iommu_put_domain(gpointer data)
>      QLIST_FOREACH_SAFE(iter, &domain->endpoint_list, next, tmp) {
>          virtio_iommu_detach_endpoint_from_domain(iter);
>      }
> -    g_tree_destroy(domain->mappings);

When created by virtio_iommu_get_domain(), mappings has one reference.
Then for each attach (including the first one) an additional reference is
taken, and freed by virtio_iommu_detach_endpoint_from_domain(). So I think
there are two problems:

* virtio_iommu_put_domain() drops one ref for each endpoint, but we still
  have one reference to mappings, so they're not freed. We do need this
  g_tree_destroy()

* After detaching all the endpoints, the guest may reuse the domain ID for
  another domain, but the previous mappings haven't been erased. Not sure
  how to fix this using the g_tree refs, because dropping all the
  references will free the internal tree data and it won't be reusable.

Thanks,
Jean
