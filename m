Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp2356507wrs;
        Mon, 19 Aug 2019 01:12:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRg7NlAMu2UpN4kKVNgxj8V2e8HaLvZxZ7sOkGjQfFX7C8IdEmPEXOJkUs8MjBeSIlDEW6
X-Received: by 2002:a37:4cd5:: with SMTP id z204mr19155964qka.67.1566202325652;
        Mon, 19 Aug 2019 01:12:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566202325; cv=none;
        d=google.com; s=arc-20160816;
        b=CQq65bZS8MD2/3F3d8XrMEg+heCErzVoYuAjar7gicAvWQURy6kUsklFzJqQaqfCW+
         o0UMk5TuGctita4ibB2vnu5964pR7T/Yx5uz5L3wlKtO0YAimwANO7V9LPGb0bsYVOzD
         FvuKriarvx2f64Lm3V4hoyvQmuOeIhOc//BdqkVEOo4xXPiu28n3wZq/Zrem3r8Bw50S
         0KVeQcqB7IYtL7DHQygdm8uj2KiaN3URdDm1Y5tpsv1FQeR1yicSvM0KkzXXsdxR+g2y
         8sykIzawVKJ3fcXYbJU5sXputWRZxhA4Dqb36w3z9MCTtP3pijCitHH/z7M7mYNhRPk+
         RWPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=XSXy7pHdR1hvvQkKuZCXV9uOJTR18d6BKBzT0zCNiwU=;
        b=aoEOqKO0KprGVeUa0TcHsXtG4PNYswtGndzG+2gBPqq2BGo97o86cgRI/jsw1bfwzs
         gnmwbNDUDy2p3UE65/8QC4JxHOVTS6xt5/AQppskJdzaPwPfPaF/wt4qMGHLYmWy8g5q
         hoHYpY5iDJiJDSlXHXgamtp+1ex0iv3aNjaOa+6wQO46tHptIQEgKIDiwks/kE2jEOHv
         qyTj4Y6t0bfSFHKOfFetGIAeX5e7if6+w+7vjPPahDslS+IkMABkWRTZfxnSLVkq3P9Y
         7ODqtrAHQ2w/2WpEPA4ksFrs/dgzjZhERZtPcdoRv1l2r4qs6vWbDKBJULpjfAtgXecJ
         XvWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q1si8634607qvf.166.2019.08.19.01.12.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2019 01:12:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzclp-0002F8-2c
	for alex.bennee@linaro.org; Mon, 19 Aug 2019 04:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38215)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1hzclh-0002Eu-90
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 04:11:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1hzclg-0003Ts-7A
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 04:11:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56156)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hzclf-0003T8-VK
 for qemu-arm@nongnu.org; Mon, 19 Aug 2019 04:11:56 -0400
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9BB15BAE9
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 08:11:54 +0000 (UTC)
Received: by mail-pl1-f197.google.com with SMTP id s13so1587993plp.7
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2019 01:11:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XSXy7pHdR1hvvQkKuZCXV9uOJTR18d6BKBzT0zCNiwU=;
 b=qjX4ZoclUN93m1O7f7ZQnKxCWgi20s4OAa9KQWtRHuVnuyjvck/8eGgoNnPN3yzKpN
 o2HnSnI2oJJ/4mHrctFgNT/K3HHv8rdq0AGlaUoNGJz++6RkYN5Z41z3fhGvj1tyDzQp
 LMmhgUmXe6u5k2udmlreixNvCGEsp9jlIBzsNc4QSKs+HySv3aenoq2DtRs/M3lo3RTA
 CZdpjlldXq4AhmCYXa5rpFW5SGZVyPf3p9JpPTedZaiPZyHSwG51xmZqLNT0s1D5JdUI
 gjqsHRkxEQn6UUHuJdZhJBmsOf/lvlxHjr0HAC76a464uHVIbAzWXgDJ4+XQmoX7SelT
 Wwrg==
X-Gm-Message-State: APjAAAVHsk8gwvsoB4wyyyF2WIlhkydb2h8p1ZIIk7xefzjhhvb/j7gp
 YCczWPm7EG2AYtPeYyXbwbodTNO/STyEaope2dOGSJ+aIPzSBu+jwAiGWl2A0rmkJoF/xfIBgpP
 w5pkbi9DqSMbD
X-Received: by 2002:a17:90a:e2c5:: with SMTP id
 fr5mr5710961pjb.122.1566202314108; 
 Mon, 19 Aug 2019 01:11:54 -0700 (PDT)
X-Received: by 2002:a17:90a:e2c5:: with SMTP id
 fr5mr5710945pjb.122.1566202313830; 
 Mon, 19 Aug 2019 01:11:53 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 185sm22329016pff.54.2019.08.19.01.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 01:11:53 -0700 (PDT)
Date: Mon, 19 Aug 2019 16:11:43 +0800
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20190819081143.GA13560@xz-x1>
References: <20190730172137.23114-1-eric.auger@redhat.com>
 <20190730172137.23114-9-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190730172137.23114-9-eric.auger@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-4.2 v10 08/15] virtio-iommu: Implement
 map/unmap
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
X-TUID: YAowN20tIN5x

On Tue, Jul 30, 2019 at 07:21:30PM +0200, Eric Auger wrote:

[...]

> +    mapping = g_tree_lookup(domain->mappings, (gpointer)(&interval));
> +
> +    while (mapping) {
> +        viommu_interval current;
> +        uint64_t low  = mapping->virt_addr;
> +        uint64_t high = mapping->virt_addr + mapping->size - 1;
> +
> +        current.low = low;
> +        current.high = high;
> +
> +        if (low == interval.low && size >= mapping->size) {
> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> +            interval.low = high + 1;
> +            trace_virtio_iommu_unmap_left_interval(current.low, current.high,
> +                interval.low, interval.high);
> +        } else if (high == interval.high && size >= mapping->size) {
> +            trace_virtio_iommu_unmap_right_interval(current.low, current.high,
> +                interval.low, interval.high);
> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> +            interval.high = low - 1;
> +        } else if (low > interval.low && high < interval.high) {
> +            trace_virtio_iommu_unmap_inc_interval(current.low, current.high);
> +            g_tree_remove(domain->mappings, (gpointer)(&current));
> +        } else {
> +            break;
> +        }
> +        if (interval.low >= interval.high) {
> +            return VIRTIO_IOMMU_S_OK;
> +        } else {
> +            mapping = g_tree_lookup(domain->mappings, (gpointer)(&interval));
> +        }
> +    }
> +
> +    if (mapping) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "****** %s: Unmap 0x%"PRIx64" size=0x%"PRIx64
> +                     " from 0x%"PRIx64" size=0x%"PRIx64" is not supported\n",
> +                     __func__, interval.low, size,
> +                     mapping->virt_addr, mapping->size);
> +    } else {
> +        return VIRTIO_IOMMU_S_OK;
> +    }
> +
> +    return VIRTIO_IOMMU_S_INVAL;

Could the above chunk be simplified as something like below?

  while ((mapping = g_tree_lookup(domain->mappings, &interval))) {
    g_tree_remove(domain->mappings, mapping);
  }

Thanks,

-- 
Peter Xu
