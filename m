Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4855569lfb;
        Tue, 27 Apr 2021 07:51:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhgVpJ4CBs0cxi4DlLnrLMV/gxKh2yKzDnnZ4uwPZFtpaqptHGaJTLBkoCL7fxZ3zza2mv
X-Received: by 2002:a05:6e02:10c5:: with SMTP id s5mr2769502ilj.88.1619535074655;
        Tue, 27 Apr 2021 07:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619535074; cv=none;
        d=google.com; s=arc-20160816;
        b=ThylniLsU7NZB+JdiWA5t/pcCgiZhCykO1ccoAZkTieiRexQZzU+fq0dqzv3ucPwiT
         J3pcppVsmLYEvTjiVPqR5OXldIOhMMP8lNnLfA+Krw6dYJxuewjMgq/K+G1mdW/YVZ6S
         arWNbkgOmLVO8keXbnNoNSRilgQ0cHOOIn+2pHYXcEI1wDuYQxC0K4eW8MEcvEIW4OS2
         bidt/DRDeeJRnaxFNIEHDzPCdZ9bYMmu3aWylJ9LOtk5F1FYVRolxgg9A/y0PQjRmNvq
         0XWXj0kKMl2n9agyuzUnt7uFjYkxQEqTYRx7UZYAKMm+rSuexNcW2XEDpM0qKyacL9i4
         5jCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=/9wrnID7hPwAUdcpkdIi3VMq8TEWSL+xoPsMVyx+6eA=;
        b=LuZBYd2qWGJjXW5yi0Ph4hdpKxg0CgbLTGozrivCesMmcLq2Nce4Y5MepUB2WAiA8X
         V1SLyi4uHbYNKDln1lctbdBFKYgb3C8jzVHrn9gw56H8ptZjVXatVMHYLFxzEYonh7tx
         DgY1jmEmdpd/GPdKNL0IMMugrMEGqy4JaH4bq6FEWCuwww9fTkCpvEfSSVJQmQncoOfs
         UrYOHeF40csxyhUSZzkNCWtijvnN/ZMp/o57FzQvq8U8Hh8CZOTCAlmYVrQReKQffppV
         SpPa276dOC8TI6l2vkJBSqmdx1WmVm9gw5PXFILOIwgc7Ff9jWyOQ5UMO9MnHQGauy4g
         rSrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MtMaQ5vo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14si20494ioj.12.2021.04.27.07.51.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 07:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MtMaQ5vo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbP3R-0000C4-Tu
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 10:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbP30-0000AN-FL
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 10:50:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbP2y-0008DS-Ey
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 10:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619535043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/9wrnID7hPwAUdcpkdIi3VMq8TEWSL+xoPsMVyx+6eA=;
 b=MtMaQ5vo3wQuEAhQZcaCoHzae/eFW6EIB6L+xxiVnG5icXQYq2TUTeFUvpCkD7aGIfSHfc
 pNYnBuG99WG6ayS15UEUua59JAWeV3RniETTJPknoUPWyivjuIuJU26Kt9paxGvPKkXyA6
 nJU0GuNXvViFg6zCO3gPjB3EGSOV1Xw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-n19DqMg5NyasZ_vLBYD6NQ-1; Tue, 27 Apr 2021 10:50:40 -0400
X-MC-Unique: n19DqMg5NyasZ_vLBYD6NQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 16-20020a1709063010b029037417ca2d43so11310622ejz.5
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 07:50:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/9wrnID7hPwAUdcpkdIi3VMq8TEWSL+xoPsMVyx+6eA=;
 b=pPozjWZXyNNTLZtlDIJIkCRT8HmMOXID/xOY26ug7T7gmfiHPVIGOpr4bf+hDLlKg+
 XctU9FjYA5CwuCbWbAI1L+Fw2Mci07P/pQOjwYYDqqW0F6dmpmErcAdGVJFo6QgwVaS6
 SM/YQqk32zASaXqSX1/ri2ScHka5awn4roLefIeg+vXUUNGwyzkLQ9U5Ul5o6TWl1IuH
 3ELmf/RqRuge6egoKB/mI0ZekC7FaClQeUmA4ABjlglvlxXGQG2gJ8Qa2avWMMUxyubb
 tdajz6Kg2xRbxCVjRRaK85tmd16AY+xZvHlvr4VPd0lF5aq8nWYZkdZzSUpmi84mzYPv
 B5fA==
X-Gm-Message-State: AOAM532wo3bnXUN8jK/v3NVakRZjfO1YlluWO+Z7ppm1nvfiwWi5r4yf
 HzLaSUp1l8PSToe8SXhG95mpImXFYjpYpdBWDKQ1TreuV4wV12HXLnTeHDL9Y0zgJrc7cCNS+1r
 +8kJD5q4HzUzR
X-Received: by 2002:a50:c44f:: with SMTP id w15mr4853272edf.79.1619535039170; 
 Tue, 27 Apr 2021 07:50:39 -0700 (PDT)
X-Received: by 2002:a50:c44f:: with SMTP id w15mr4853229edf.79.1619535038906; 
 Tue, 27 Apr 2021 07:50:38 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id o6sm2540424edw.24.2021.04.27.07.50.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 07:50:38 -0700 (PDT)
Date: Tue, 27 Apr 2021 16:50:36 +0200
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [RFC PATCH v2 3/6] hw/arm/virt-acpi-build: Distinguish possible
 and present cpus
Message-ID: <20210427145036.snne6xunr6cnyxln@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-4-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-devel@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 prime.zeng@hisilicon.com, yangyicong@huawei.com, yuzenghui@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Ying Fang <fangying1@huawei.com>,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ETxbbypTWqi

On Tue, Apr 13, 2021 at 04:07:42PM +0800, Yanan Wang wrote:
> From: Ying Fang <fangying1@huawei.com>
> 
> When building ACPI tables regarding CPUs we should always build
> them for the number of possible CPUs, not the number of present
> CPUs. We then ensure only the present CPUs are enabled in MADT.
> Furthermore, it is also needed if we are going to support CPU
> hotplug in the future.
> 
> This patch is a rework based on Andrew Jones's contribution at
> https://lists.gnu.org/archive/html/qemu-arm/2018-07/msg00076.html

Thank you for this credit, but I think I'd prefer a Co-developed-by
tag instead, if you don't mind.

Thanks,
drew

