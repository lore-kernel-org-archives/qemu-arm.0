Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp341280wrs;
        Thu, 15 Aug 2019 21:28:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgRWdAc/Jd21/uSEFq1R+97qJCHZ4GaqeeWZ001H7VxFQzwPq41Ugi/booNVC+aiVUvZVo
X-Received: by 2002:aa7:d8d5:: with SMTP id k21mr8791826eds.167.1565929699921;
        Thu, 15 Aug 2019 21:28:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565929699; cv=none;
        d=google.com; s=arc-20160816;
        b=J1ehtYnmc6kvAqbQ80KwTZQ59Y/kA2ny8grgOiP6Kj69Z9k74OEuBHXdkV1WQTDNT2
         AIT9MmqS77tXTEuymY4/JFQyk6Q6ljw8hkklqR5hQCJ5TbKem7no5HMgjgZpGhhUFREm
         oOTU+8TuCXw08cZj6TDgvOJHTmUdD7SesefxWBpOh0JKAkUyghAwk/UGQfwNmPPlPjs7
         q+OCHyfzvGi5qoOTOAA/r+BltAABLo0kH/96Ys+nJ8iKpR5FEZ68SpL51VZ0VTjRzN4R
         FU6XAv4XshaIJg+EOHmT7xiCfX5kXeP2ZWbFWFGHmwIPge6/t8abkLDOmaF/G+owrzM5
         0vkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=3u3ukdBsD3ecgQxpmyv7waCPQyX01dzxGzwo89XfmBI=;
        b=WMbiGyjuqJ+QyrDLs84VTN4UQkHapocqSSUWeQMo5AC6tLAfa8W8jtKTiKGzS2AP9Q
         WWS29rusVWNt6611YWdaRlO1E8a6bfXp/+vwZLt9qG3Ks60yEaIuUuCmB0DHnBJ5S4RY
         t89B60scCxSnX5pFqmuMIyRxkExK8sPIjuFfNezTE/6zyVBoqMgsD8jXj/0VYMKkY1R7
         kx9xCWizXG8fSAJioZBrZ7c2uHvGB/eqHTkzFse8pxVBYaoq+dsJXf1ys36rNkKRrkHd
         D/cx/DwLR8uuwZfffzmxCUUqPHHNuS9w2AC9XWwopXOSZVl6ujjElMX0TThPT58b/JDZ
         6JRA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd1si2431061ejb.286.2019.08.15.21.28.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Aug 2019 21:28:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyTqc-0005uP-V2
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 00:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43966)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1hyTqP-0005uB-BW
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 00:28:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hyTqN-0000FT-Eo
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 00:28:05 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33061)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hyTqN-0000DQ-5f
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 00:28:03 -0400
Received: by mail-pf1-f193.google.com with SMTP id g2so2481589pfq.0
 for <qemu-arm@nongnu.org>; Thu, 15 Aug 2019 21:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3u3ukdBsD3ecgQxpmyv7waCPQyX01dzxGzwo89XfmBI=;
 b=m3glMS1UYjSRSS+icJgNWa4BGwn+JR6MIfdsHuidMGkBRCot2Q5EuTuQAxLjntOflj
 ygaF4xwlsbmKeoo2s/3Vu/3NsbAW1TAgjTtL/eHhcqDwptusRa7e8V0/0zxrVGpq3ZfP
 sp0BBYMo/ekFVxcs0elajdIxhigdA7cB09WqQhdwZRIsP35ncYbdm11/9ds0/4xOSuVg
 Zc6NlKKxFhMdcAYHjwe77/y7PWiwUKrR/7RTJ4bX6skwCuA0dMHXyYdEQVrp+5ZEDxz7
 oBZjqV4cR7Qbk5UqT72ymKYb+aWcymI6U/hpu1ojG03p1nC/7P2UoltHx2FDkvK/ed3H
 jDLw==
X-Gm-Message-State: APjAAAXx/l/H1v4ZagBsmaSB7aHsU2fG/7ZBF31yHKiiPOZN2jWaqAXh
 J9uF3bx+MdZgVfOctVp8zi7UMg==
X-Received: by 2002:a63:3281:: with SMTP id y123mr6015867pgy.72.1565929681989; 
 Thu, 15 Aug 2019 21:28:01 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id a15sm4924448pfg.102.2019.08.15.21.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 21:28:01 -0700 (PDT)
Date: Fri, 16 Aug 2019 12:27:49 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190816042749.GC3114@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-8-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-8-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.193
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 07/15] virtio-iommu: Implement
 attach/detach command
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
X-TUID: PtIeVtDHEw7I

On Tue, Jul 30, 2019 at 07:21:29PM +0200, Eric Auger wrote:
> This patch implements the endpoint attach/detach to/from
> a domain.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> ---
>  hw/virtio/virtio-iommu.c | 40 ++++++++++++++++++++++++++++++++++------
>  1 file changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 77dccecc0a..5ea0930cc2 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -80,8 +80,8 @@ static void virtio_iommu_detach_endpoint_from_domain(viommu_endpoint *ep)
>      ep->domain = NULL;
>  }
>  
> -viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id);
> -viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s, uint32_t ep_id)

These lines were just introduced in previous patch, I wanted to ask
why the definition was needed but I don't know whether it'll be used
in follow up patches.  Looks like it wasn't really used.

I would prefer patches like these to be squashed together not only to
avoid the maintainance of diffs like this between patches, but also as
a reviewer it'll be easier too when with all the contexts together.
But I won't ask for it because it can be a personal preference only...

> +static viommu_endpoint *virtio_iommu_get_endpoint(VirtIOIOMMU *s,
> +                                                  uint32_t ep_id)
>  {
>      viommu_endpoint *ep;
>  
> @@ -110,8 +110,8 @@ static void virtio_iommu_put_endpoint(gpointer data)
>      g_free(ep);
>  }
>  
> -viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id);
> -viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s, uint32_t domain_id)
> +static viommu_domain *virtio_iommu_get_domain(VirtIOIOMMU *s,
> +                                              uint32_t domain_id)
>  {
>      viommu_domain *domain;
>  
> @@ -187,10 +187,27 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
>  {
>      uint32_t domain_id = le32_to_cpu(req->domain);
>      uint32_t ep_id = le32_to_cpu(req->endpoint);
> +    viommu_domain *domain;
> +    viommu_endpoint *ep;
>  
>      trace_virtio_iommu_attach(domain_id, ep_id);
>  
> -    return VIRTIO_IOMMU_S_UNSUPP;
> +    ep = virtio_iommu_get_endpoint(s, ep_id);
> +    if (ep->domain) {
> +        /*
> +         * the device is already attached to a domain,
> +         * detach it first
> +         */
> +        virtio_iommu_detach_endpoint_from_domain(ep);

Hmm... so this can be called without virtio_iommu_put_endpoint().
Then I think we'd better move:

        g_tree_unref(ep->domain->mappings);

From virtio_iommu_put_endpoint() to inside
virtio_iommu_detach_endpoint_from_domain() otherwise domain refs might
leak?

> +    }
> +
> +    domain = virtio_iommu_get_domain(s, domain_id);
> +    QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
> +
> +    ep->domain = domain;
> +    g_tree_ref(domain->mappings);
> +
> +    return VIRTIO_IOMMU_S_OK;
>  }

Regards,

-- 
Peter Xu
