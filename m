Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3865045lff;
        Fri, 20 Dec 2019 09:02:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqx0RxthhUa7l+Ck7/L4NhbSCV9HENjRVNz483+2EYBVqiRHi4GRUCnxKQiO0YZStNCADKdQ
X-Received: by 2002:a37:693:: with SMTP id 141mr14205305qkg.134.1576861372489;
        Fri, 20 Dec 2019 09:02:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576861372; cv=none;
        d=google.com; s=arc-20160816;
        b=UV5lZwvOMmLfCwHSikDigsuguWqDnSn3J8zHYZW2d3pcIRNDA/aLkFsLX0xA2SNMjn
         6nVdo2TvgMM4dxAQYcWkx5MaOGN99G5kROq7AV3btmdYIKYLuPvob+AQkQ22+YAcpLLi
         aIqMLRj12Cww94BgdQqKfQ/ITR0Hu+XUs3WxOdoH9zVjXBMIeak780nWu/2rhF6f1444
         uGm01izAHgsoiC6t9nPLoJVZbNm3ZSEY8ocrYZ8CZYoWq1M+2mc9HNozRLPCpk+U84NR
         0Pp5jx542cYeD8KjRROd55l3Z/lQ5aBe3YgrbQb1mO5MI9CJlDTUGzUsdbQ+q3LvUb/w
         MrhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WS8ChejV4YO4dWg6kHYPfKg+xFnECZ3CCJJ2MBa8TKg=;
        b=pyglfmcEum8L6b+7bG21arRilnlzaWkzgag8EVt2QDjHBLr5QEHsqWoYuQdIBdazkN
         mqADUw1ufCpvFa7Sd6S7Kr4w2eBGUy9O978FHEW4GM4+Mo+/88pc5bZNkr9vlo0+qDAk
         A51H1NctDR8SKr7ToaimzNeReBsYrda7zdVWEMr4sYwkLssB4ly5Gzj/rkAEBOETHwjn
         AS7zNKkEcz85+SMG31GB5Yx6q/WtIRjFcxhKQt0YsKVQq51U2ZN+WhNrd5zHKAvjaouF
         ZGwNJ819NesIEcha2upBRca/vGFG9BcNk8vGRChYEClPdIibe9tMvOpHDVAbIZFGoCcu
         hwLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R6Wb0GI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si5412275qkh.275.2019.12.20.09.02.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 09:02:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R6Wb0GI3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiLfu-0002A7-SB
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 12:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40077)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1iiLdm-0000Cb-4s
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 12:00:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1iiLdk-0007js-EN
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 12:00:37 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:35896)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1iiLdk-0007hz-2n
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 12:00:36 -0500
Received: by mail-wr1-x441.google.com with SMTP id z3so10108251wru.3
 for <qemu-arm@nongnu.org>; Fri, 20 Dec 2019 09:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WS8ChejV4YO4dWg6kHYPfKg+xFnECZ3CCJJ2MBa8TKg=;
 b=R6Wb0GI3tLLJX1jKbcK6dL58ItO88nB1eLyPF9Xal+jobILpJSw3vgUjiZjljSuPKe
 j2xj5ZZDj1fBgRP1ge6bMhNq6Pa57PW5XG/S55HtjqxPX1/KqiVWr14CdiZQOwaBhbou
 e9CL5yV3YzWwb1CINwwlTS18Y8ZGo9fg75fPqdCojqI/4UdHHlcBsudznM82wbntNJ2H
 hWjCrtmnmMkdZmmL9ZUpWqtl6uUZft91JFAWwJCMojwRgIFvy4G5pgClZeX8EJYd77R0
 hd5la9W/Ys14oieLR8SYbYFM7cSaNG7qG+cCojMEA9AT03FogkPuev5C5iT5oROZVxXE
 rpLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WS8ChejV4YO4dWg6kHYPfKg+xFnECZ3CCJJ2MBa8TKg=;
 b=QOUUGt+D2Qs0VZWXG4I3JZEh108jyUkuP63tu/frH5kcG03aqUCJ7rS81YDu5txxxd
 V/Qe2pOAO6GqkRRgatvCw5/cPDNacbVmvylWxmOhWtTj75nKEMtVgGAfTlBh3p2aMCXk
 6hJ7opWZsnu1QgwNp5Nv9nYBb8b6FxHHiwwheexVeAf3C1lan56IM+2bT6xZ7EhpR7xw
 85WdS+KaMV2d0gxt3Xu94Q7lt6P0hBUzOWimZsZA/zfLuf7kB+FOdhImajh2irvExA7d
 Vn62z+nNDF/xgaVLdEnmtXD0Jxzilsnl4AlFnVji1FnRkgQb+FvlWyegEICxpZg2we8T
 60TQ==
X-Gm-Message-State: APjAAAW7FGR+UemDI8KjCx85TMDVbJr3kdeCyeDAYH6BTlB8/5P995s0
 ut7ecvQRlzRRZAlzIX+dWEzp7w==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr15575656wru.99.1576861234459; 
 Fri, 20 Dec 2019 09:00:34 -0800 (PST)
Received: from myrica (adsl-84-227-176-239.adslplus.ch. [84.227.176.239])
 by smtp.gmail.com with ESMTPSA id x11sm10337438wmg.46.2019.12.20.09.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 09:00:33 -0800 (PST)
Date: Fri, 20 Dec 2019 18:00:28 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH for-5.0 v11 05/20] virtio-iommu: Endpoint and domains
 structs and helpers
Message-ID: <20191220170028.GB2626852@myrica>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-6-eric.auger@redhat.com>
 <20191210163716.GD277340@myrica>
 <28597404-b9ac-8c16-e9e8-ad5793f2f5a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28597404-b9ac-8c16-e9e8-ad5793f2f5a3@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 82UArmnFS8cD

On Thu, Dec 19, 2019 at 07:31:08PM +0100, Auger Eric wrote:
> Hi Jean,
> 
> On 12/10/19 5:37 PM, Jean-Philippe Brucker wrote:
> > On Fri, Nov 22, 2019 at 07:29:28PM +0100, Eric Auger wrote:
> >> +typedef struct viommu_domain {
> >> +    uint32_t id;
> >> +    GTree *mappings;
> >> +    QLIST_HEAD(, viommu_endpoint) endpoint_list;
> >> +} viommu_domain;
> >> +
> >> +typedef struct viommu_endpoint {
> >> +    uint32_t id;
> >> +    viommu_domain *domain;
> >> +    QLIST_ENTRY(viommu_endpoint) next;
> >> +} viommu_endpoint;
> > 
> > There might be a way to merge viommu_endpoint and the IOMMUDevice
> > structure introduced in patch 4, since they both represent one endpoint.
> > Maybe virtio_iommu_find_add_pci_as() could add the IOMMUDevice to
> > s->endpoints, and IOMMUDevice could store the endpoint ID rather than bus
> > and devfn.
> 
> On PCI bus enumeration we locally store the PCI bus hierarchy under the
> form of GHashTable of IOMMUDevice indexed by iommu_pci_bus pointer.
> Those are all the devices attached to the downstream buses. We also use
> an array of iommu pci bus pointers indexed by bus number that is lazily
> populated due to the fact, at enumeration time we do know the bus number
> yet. As you pointed, I haven't used the array of iommu pci bus pointers
> indexed by bus number in this series and I should actually. Currently I
> am not checking on attach that the sid effectively corresponds to a sid
> protected by this iommu. I will add this in my next version. The above
> structures are used in intel_iommu and smmu code as well and I think
> eventually this may be factorized a common base class..
> 
> on the other hand the gtree of viommu_endpoint - soon renamed in
> CamelCase form ;-) - corresponds to the EPs that are actually attached
> to any domain. It is indexed by sid and not by bus pointer. This is more
> adapted to the virtio-iommu case.
> 
> So, despite your suggestion, I am tempted to keep the different
> structures as the first ones are common to all iommu emulation code and
> the last is adapted to the virtio-iommu operations.
> 
> Thoughts?

Makes sense, it seems better to keep them separate. I had missed that the
PCI bus number is resolved later, and started to move the endpoint ID into
IOMMUDevice when adding MMIO support, but I'll need to revisit this.

I'll be off for two weeks, have a nice holiday!

Thanks,
Jean

