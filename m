Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2519453wrs;
        Thu, 29 Aug 2019 11:15:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyt62XD2qpT1LjH8RozncGgcW8dLYzAJyZplFFuoImnOYnMb3JAziWU9kP02Cao+XXSArz
X-Received: by 2002:ac8:5455:: with SMTP id d21mr10913241qtq.63.1567102541124;
        Thu, 29 Aug 2019 11:15:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567102541; cv=none;
        d=google.com; s=arc-20160816;
        b=JyeAqwnYTI9IMCb/uxyrSqzmHnyqqZQT+SGmAGJFKFyeGnUfJSBj9oQchpokCoufMM
         83EbJRZLf41S7obZQoIKPkG5293QOFpF9/yURJjPYFWK0XAdnRrNgxDJLtYWWBmYCd3q
         5yh3RIDRDJgmllnmdc6+bhD9zLT/uH/oTRTT+AK9JCn7/Irlm19tg5+g4QzKQwZ/eld3
         FG2K7jHYtaID2bT4LGkIEbLXUycgOCoikgZVSOAaqhujmk+faN9vyScUoMthrtyaWiM8
         J5G51QVlMYjUMxGYE+bnPxzy3/22Y4synh10MkkEdb7pjcw/FAZaYQLYyXw3vZ4qYt8y
         D7Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date;
        bh=0eN5/0oiuDC/KdEctbK7U+vdoQhhr6sYyoSeZKOXjoU=;
        b=flquTSp/iRM9m8mHublGh2HC5dz6WIfWE+aAEmQq/rc8dBFuPO4gaX4kIliXC5s/P7
         /kzEt+L+zYx64Vg7RxwNBtlTkYxsMwmpfcik1BnF7o+Pch8AZAT2Homj7nTmC8Z+XI7c
         HLWT0ZdcXpAeih5cYWH0wjVU/rKeuObl3/omWn80ZzlQHWb/uGruMiSxJK3BwMsGw72a
         51kNUoOvcJU5sQsc9KB7f4OmY9bnrFTNXFT7u84itKBqm9S4JmWgXDK5ffm1JELtn4co
         ZDfH/RwIOLwg6zDbndY0E2oDKG2j5LUY8GOwpvYLtZH1aNJUWi2tjbkP/lb4RTE9LCrY
         Wn2A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si1333189qtt.172.2019.08.29.11.15.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Aug 2019 11:15:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i3OxQ-00050U-Be
	for alex.bennee@linaro.org; Thu, 29 Aug 2019 14:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42812)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.williamson@redhat.com>) id 1i3Ows-0004o0-Nm
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:15:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.williamson@redhat.com>) id 1i3Owq-0005TR-43
 for qemu-arm@nongnu.org; Thu, 29 Aug 2019 14:15:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58354)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
 id 1i3Owo-0005Qc-6h; Thu, 29 Aug 2019 14:15:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E1894807063;
 Thu, 29 Aug 2019 18:15:00 +0000 (UTC)
Received: from x1.home (ovpn-118-102.phx2.redhat.com [10.3.118.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04EE452C8;
 Thu, 29 Aug 2019 18:14:49 +0000 (UTC)
Date: Thu, 29 Aug 2019 12:14:49 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190829121449.5c42073e@x1.home>
In-Reply-To: <20190829090141.21821-3-eric.auger@redhat.com>
References: <20190829090141.21821-1-eric.auger@redhat.com>
 <20190829090141.21821-3-eric.auger@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 29 Aug 2019 18:15:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 2/2] hw/vfio/common: Fail on VFIO/HW
 nested paging detection
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
Cc: peter.maydell@linaro.org, aik@ozlabs.ru, qemu-devel@nongnu.org,
 peterx@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MkFIqUoWKSVH

On Thu, 29 Aug 2019 11:01:41 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> As of today, VFIO only works along with vIOMMU supporting
> caching mode. The SMMUv3 does not support this mode and
> requires HW nested paging to work properly with VFIO.
> 
> So any attempt to run a VFIO device protected by such IOMMU
> would prevent the assigned device from working and at the
> moment the guest does not even boot as the default
> memory_region_iommu_replay() implementation attempts to
> translate the whole address space and completely stalls
> the guest.

Why doesn't this stall an x86 guest?

I'm a bit confused about what this provides versus the flag_changed
notifier looking for IOMMU_NOTIFIER_MAP, which AIUI is the common
deficiency between VT-d w/o caching-mode and SMMUv3 w/o nested mode.
The iommu notifier is registered prior to calling iommu_replay, so it
seems we already have an opportunity to do something there.  Help me
understand why this is needed.  Thanks,

Alex

> 
> So let's fail on that case.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v3 -> v4:
> - use IOMMU_ATTR_HW_NESTED_PAGING
> - do not abort anymore but jump to fail
> ---
>  hw/vfio/common.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 3e03c495d8..e8c009d019 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -606,9 +606,19 @@ static void vfio_listener_region_add(MemoryListener *listener,
>      if (memory_region_is_iommu(section->mr)) {
>          VFIOGuestIOMMU *giommu;
>          IOMMUMemoryRegion *iommu_mr = IOMMU_MEMORY_REGION(section->mr);
> +        bool nested;
>          int iommu_idx;
>  
>          trace_vfio_listener_region_add_iommu(iova, end);
> +
> +        if (!memory_region_iommu_get_attr(iommu_mr,
> +                                          IOMMU_ATTR_NEED_HW_NESTED_PAGING,
> +                                          (void *)&nested) && nested) {
> +            error_report("VFIO/vIOMMU integration based on HW nested paging "
> +                         "is not yet supported");
> +            ret = -EINVAL;
> +            goto fail;
> +        }
>          /*
>           * FIXME: For VFIO iommu types which have KVM acceleration to
>           * avoid bouncing all map/unmaps through qemu this way, this

