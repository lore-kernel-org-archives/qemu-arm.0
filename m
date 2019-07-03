Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp354985wru;
        Tue, 2 Jul 2019 22:43:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9fnUI0wDeJsFiDRICUQiq0kD7ko0Nqs/1FilCOqa4xg5sCvdO+/5ChJmXKkPWSIQrE5Ld
X-Received: by 2002:a50:86dc:: with SMTP id 28mr40212048edu.132.1562132588919;
        Tue, 02 Jul 2019 22:43:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562132588; cv=none;
        d=google.com; s=arc-20160816;
        b=lJav1/08lvJEB+Yydi/sKxjM12rIF36lXXKydWICTKSgmxfl9z4RgWVUhLIVVaA6wA
         gVLqyEkADIVQ6UPlCu6axLZOvkBsyTUaY8dtNXCBBLi5uEDJ5mRZZLmZc8c+tk2W/lN+
         DAYtefI6DIvxqhDn0fJ3N/EK94rCs/JWdpSUYyKDW7a7LcrJYG4PHJPZm9sjDHQhLx7f
         NNplqKGnRv9pjokVqWJbb6aYCh9V6STwf+lgI8VeRRD3d2doOPc83EhRn2CxHpE2//9X
         ng8o8kMgq+YHimnEwySv4ctJF71Q/S9jOzNoyhXetPhuMWdItl0vmfhGOt7uT260Db1V
         fGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=BppcYZAL9DlfxroITCpxQrKgtqYAahnr23HT2KFEeRI=;
        b=LgeFuCXjpUE6IZXCtBhh+tnSxRHwckX70UM4GmrQ7Pj0PM66dkuKAXAIvbmWO9Qm22
         0ggZ31v3tCmPPVkJ+aD2j3F5I4NplDFn3BTFOPRIiRBOfTsnR1wSJeMmiaUgJB5l3g1F
         L98VfPpftXvWh8PLZ+2ajLzJN3HgH/ZjczQJfch1lR/qdFyMw0/g+hMjF94JEK4tOJI0
         IcdlFPaXoyI76KGy7ZRzGbgF46fniKb/b2pmIhNDmZczMDoWbR9VgG/k/l4PNj7VKXuI
         jwIVP2A7ai3KqzXEzjWJxjugibKKdCw/ZFbWZGO9SD7GpzZ0T1uvmeCmSqcwClN0Sdca
         MMjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w42si1081282eda.142.2019.07.02.22.43.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 22:43:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiY2u-0007cM-1k
	for alex.bennee@linaro.org; Wed, 03 Jul 2019 01:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peterx@redhat.com>) id 1hiY2l-0007Yi-0R
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 01:42:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hiY2j-0000T0-1C
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 01:42:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34836)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>)
 id 1hiY2h-0000LF-1q; Wed, 03 Jul 2019 01:42:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE6F44E938;
 Wed,  3 Jul 2019 05:42:45 +0000 (UTC)
Received: from xz-x1 (unknown [10.66.60.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 53FF817480;
 Wed,  3 Jul 2019 05:42:38 +0000 (UTC)
Date: Wed, 3 Jul 2019 13:42:36 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190703054236.GF10408@xz-x1>
References: <20190701093034.18873-1-eric.auger@redhat.com>
 <20190701093034.18873-3-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190701093034.18873-3-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Wed, 03 Jul 2019 05:42:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 2/6] memory: Add IOMMU_ATTR_VFIO_NESTED
 IOMMU memory region attribute
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iQoWWQsfymsy

On Mon, Jul 01, 2019 at 11:30:30AM +0200, Eric Auger wrote:
> We introduce a new IOMMU Memory Region attribute,
> IOMMU_ATTR_VFIO_NESTED that tells whether the virtual IOMMU
> requires physical nested stages for VFIO integration.
> 
> Current Intel virtual IOMMU device supports "Caching
> Mode" and does not require 2 stages at physical level to be
> integrated with VFIO. However SMMUv3 does not implement such
> "caching mode" and requires to use physical stage 1 for VFIO
> integration.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/exec/memory.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index bdd76653a8..dd7ef23f96 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -204,7 +204,8 @@ struct MemoryRegionOps {
>  };
>  
>  enum IOMMUMemoryRegionAttr {
> -    IOMMU_ATTR_SPAPR_TCE_FD
> +    IOMMU_ATTR_SPAPR_TCE_FD,
> +    IOMMU_ATTR_VFIO_NESTED,

IMHO it'll be better if this patch can be squashed into the first user
of the new flag to better clarify itself on why it will be needed (if
finally we still would like to have this flag).

Regards,

-- 
Peter Xu
