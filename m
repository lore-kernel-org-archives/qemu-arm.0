Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7294433wrv;
        Wed, 7 Aug 2019 20:07:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzHmOLzbtNT3y6nmCEhe6QHgRtK1SyQLIEYHeN1w+U5s0UlvgSpSqe5Gyb6kc1qY6sQLVRo
X-Received: by 2002:a17:906:1b0d:: with SMTP id o13mr11239429ejg.96.1565233672145;
        Wed, 07 Aug 2019 20:07:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565233672; cv=none;
        d=google.com; s=arc-20160816;
        b=JwmRGMyu6kGJvNeGjQPt1AVoQ0vJqYlp966/4K6GybjnZehMe2XgcwQMY5ccFBKa0e
         SZ+xW4ZeM9fVVQfspbBLmsdy/hRXs00NWzhLKFknCCLKvaz33L3U46A38aT5WS2KkrnR
         qyh9rF3JeK/uHTXoO1e/wS1WnmsA4cK4TBENg1mnL5GvZhdataOQEOsVjhFkY50zncxd
         YZLmkWf+W40wYzVX+z4p0BWgXMHXCh0tKLbYd18kEh41BWAS85GpK1OJYCeYbTl3efUj
         h9i0eo0aLw3j3TiIwgL1QGOfZgFVeSXdQ2CYZ2kR57Xael1M74+UT5jJeh1P993J69he
         fGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=vBaYURGGJYbPA/7Qzl4wJDc4C0/8igxKw5pKAZ+1dc8=;
        b=Q9ESatTnbiE8CZGGqKqnM8A4rRLUn/j9CzNyGfIcl1VJyFyf6pApOx/OxPkVz+sMyh
         W0Faf7x9fo/2PbRQb/hL18L6DNquuQmbKN7UzW/OpqMcFS1sy5tl4vNGRc0BlbFy49E2
         UFFFXdka/UK00P3cBQw8KkcP3ZNxwCGuSbhdyt8CfH8ZhGDHDamnWQ9T3V6/lL9LPOio
         gknqz07CTJ32GE+gUZZciqI2nyGk7Vjp/7L6GIMmZ6SMpcGcm7CYgmjbg4PjUArTpkW/
         7Lc0FPid1ioNRsONEM8h36/EH2AwxuTEqS0bM1bA1ACPH6+S+pJ9zdlptedq/eMCBcUs
         6cWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si35011279eda.220.2019.08.07.20.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 20:07:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvYmN-0003q9-92
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 23:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36337)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.williamson@redhat.com>) id 1hvYmH-0003pr-Vd
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 23:07:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1hvYmG-000662-RM
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 23:07:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43620)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1hvYmG-00065U-Lf; Wed, 07 Aug 2019 23:07:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DE443001A6C;
 Thu,  8 Aug 2019 03:07:43 +0000 (UTC)
Received: from x1.home (ovpn-116-99.phx2.redhat.com [10.3.116.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 214585D71C;
 Thu,  8 Aug 2019 03:07:37 +0000 (UTC)
Date: Wed, 7 Aug 2019 21:07:36 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190807210736.7703cdfd@x1.home>
In-Reply-To: <20190711061857.13086-3-eric.auger@redhat.com>
References: <20190711061857.13086-1-eric.auger@redhat.com>
 <20190711061857.13086-3-eric.auger@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 08 Aug 2019 03:07:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v3 2/5] memory: Add
 IOMMU_ATTR_VFIO_NESTED IOMMU memory region attribute
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, peterx@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qqPBOEnDojqm

On Thu, 11 Jul 2019 08:18:54 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> We introduce a new IOMMU Memory Region attribute,
> IOMMU_ATTR_VFIO_NESTED that tells whether the virtual IOMMU
> requires HW nested paging for VFIO integration.
> 
> Current Intel virtual IOMMU device supports "Caching
> Mode" and does not require 2 stages at physical level to be
> integrated with VFIO. However SMMUv3 does not implement such
> "caching mode" and requires to use HW nested paging.
> 
> As such SMMUv3 is the first IOMMU device to advertise this
> attribute.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/smmuv3.c       | 12 ++++++++++++
>  include/exec/memory.h |  3 ++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e96d5beb9a..384c02cb91 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -1490,6 +1490,17 @@ static void smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
>      }
>  }
>  
> +static int smmuv3_get_attr(IOMMUMemoryRegion *iommu,
> +                           enum IOMMUMemoryRegionAttr attr,
> +                           void *data)
> +{
> +    if (attr == IOMMU_ATTR_VFIO_NESTED) {
> +        *(bool *) data = true;
> +        return 0;
> +    }
> +    return -EINVAL;
> +}
> +
>  static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>                                                    void *data)
>  {
> @@ -1497,6 +1508,7 @@ static void smmuv3_iommu_memory_region_class_init(ObjectClass *klass,
>  
>      imrc->translate = smmuv3_translate;
>      imrc->notify_flag_changed = smmuv3_notify_flag_changed;
> +    imrc->get_attr = smmuv3_get_attr;
>  }
>  
>  static const TypeInfo smmuv3_type_info = {
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index a078cd033f..e477a630a8 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -204,7 +204,8 @@ struct MemoryRegionOps {
>  };
>  
>  enum IOMMUMemoryRegionAttr {
> -    IOMMU_ATTR_SPAPR_TCE_FD
> +    IOMMU_ATTR_SPAPR_TCE_FD,
> +    IOMMU_ATTR_VFIO_NESTED,
>  };
>  
>  /**

Why VFIO_NESTED vs simply NESTED?  I figure any time we need to include
"VFIO" in the descriptions of something, we're probably not describing
the requirement correctly and it just becomes a meaningless tag that
gets ignored outside of VFIO related things.  If we're trying to
describe an IOMMU MemoryRegion that supports dynamic faulting rather
than requiring a replay to pre-populate it, then simply define that
semantic rather than hand waving some vfio specific interaction.
Thanks,

Alex
