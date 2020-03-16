Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2859582lfc;
        Mon, 16 Mar 2020 04:10:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsojn7g/MhqV8cXN16kZbJAwixtqnPZi9wwBAeKlSw2LKwHnt7BY9X6jNMyr7p429vXecVm
X-Received: by 2002:ad4:4802:: with SMTP id g2mr23171623qvy.95.1584357002263;
        Mon, 16 Mar 2020 04:10:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584357002; cv=none;
        d=google.com; s=arc-20160816;
        b=b7pODqWZDdtCsjC5K30KFGYx5L5H6RH7uEk3EEPZBCa/1x4rb8f4I0wEG+kCgWBjPS
         1XmdoXwz87qO2VjL1ChEreZcxkMvbLN8kuUlF+qEXHlO+fRWfntAFifT8no02IeyV+1H
         QfxVLq3zJSAlhoAD71HeKAcwH51WpV4WSNbbivd1/1k7qe29TovNnavnC6cEj6Ghk6Vg
         zPVeEJr4vxhaXGd7SA1C1BV6SznSSY69TfpJGTKBX6gaFpQs2FHPUd8MrZaECNMzxC7B
         +4lbVXlbcrg0/n5DPBySk88epr0DKQ6rmqrWWP4iDWPaL46D6dF0OEIEjpUcHTE47FBx
         9F6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=BU/ZwEwcB5nZlqTst3L0l7esGc+qpviZb36MSldnOCM=;
        b=KzA2cyaJsUlHTTqD98DHDvIHe8bHLgtlUEGLi4BYcgsPmE9Bdbh5A+FXrKRDfPW1Gc
         aQSQRry7W13AjMjeTzUj8s+z5VqzRYhfNRtg4b6xEqTSXXiWDE7zNVL/ZoQf2l9Vm+mm
         r97MWd5DQGuk8xnukYbyH5gLhICZDYJRTDdTswcDTLYnEgZxboCWvIXxNhst1FDQBvuZ
         Rk5lVFIwUpB9E0Sapq1qLs4zpm9tHJOXt2wLq2eykGWW0PHJT+mbDoAbitCp4ThTo7vU
         RdZ6mNyfI6I2jwHnLrs2+fupBKXYyJ8NvZCmQWbuPgapzZb0pHKWPiv/PoEwO7Br2Re4
         Sf6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VkNFxLgo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x36si3271230qtd.247.2020.03.16.04.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Mar 2020 04:10:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VkNFxLgo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jDnd7-0002CD-7y
	for alex.bennee@linaro.org; Mon, 16 Mar 2020 07:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42630)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jean-philippe@linaro.org>) id 1jDmie-0006pQ-KB
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 06:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jean-philippe@linaro.org>) id 1jDmic-0004b8-8E
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 06:11:35 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:40184)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jean-philippe@linaro.org>)
 id 1jDmib-0004H7-Sn
 for qemu-arm@nongnu.org; Mon, 16 Mar 2020 06:11:34 -0400
Received: by mail-wm1-x342.google.com with SMTP id z12so8114345wmf.5
 for <qemu-arm@nongnu.org>; Mon, 16 Mar 2020 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BU/ZwEwcB5nZlqTst3L0l7esGc+qpviZb36MSldnOCM=;
 b=VkNFxLgoMWyM+DkzSSXTHrky2hFNhpBOcJ7CZGW93w8fyFtsuD9bgfixDd6zCWQ07m
 U17asqNYxTpDHTJw8TrdmyBUDKPNvf1f9nMVLE0Rdy7VczlD/KtKA45gbZxaRMha8Pf3
 Pjjy1qXccZc5SkxV8fuaqLfVDecmmSGb4GWd4I0FYU2KrWGescEAennoWnA3k56WpR2T
 cKt5MYr4CS2ZrvE10L5t4tCXR5yVvaUrxVrKx8d1MMFuSdBQBdRSnIzXX7chEvh/gSrq
 pvkOwPouOfBpA3a8RwnP547GNjahUUkD472BXBkZa91OjfcoEAt2NvgHGBcrQ41TrpV4
 rUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BU/ZwEwcB5nZlqTst3L0l7esGc+qpviZb36MSldnOCM=;
 b=Ni2JwC4Yof5Q9Yq13oUUdOye2jlJmmLaJ2AqmXqOWZtE0FtvteOQvpo41imeGYA1Ub
 7b09Lcz3VBe0KjU1ubReeCkA7hiFZ9RxarvGvMlSxCDoOfv68FLT/bBvnGp851JYGJWA
 fcRdBeOR90lSXwclC0De0qtZVMCkh/dQ9eVk68RaCokXu2LOd+AmxRvXLqdtQdGHhR0O
 gb35Yz0Rpkj4UEYrXiNwWnwtapGhFHgHQPi/CxQM6bOkY1zq5ZcuKnT8RsBAzWUlngcG
 95/elJSxNSQacBIXfGHjIsgtp3Jqf6yoYxUlY+ClCXL643Wn1nLDhlprBdQ9fUy5n5nu
 soiQ==
X-Gm-Message-State: ANhLgQ2kNH+YXOSSfam3vVUr+MfxN9soLORrtmG4K0oF0qFiRh8eoSr8
 4Me+LeA9KJpUD0zphwkW2GPN+A==
X-Received: by 2002:a1c:2048:: with SMTP id g69mr27767216wmg.187.1584353492386; 
 Mon, 16 Mar 2020 03:11:32 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id x24sm29248934wmc.36.2020.03.16.03.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 03:11:31 -0700 (PDT)
Date: Mon, 16 Mar 2020 11:11:24 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Bharat Bhushan <bharatb.linux@gmail.com>
Subject: Re: [PATCH v7 3/5] virtio-iommu: Call iommu notifier for attach/detach
Message-ID: <20200316101124.GA304669@myrica>
References: <20200313074811.27175-1-bbhushan2@marvell.com>
 <20200313074811.27175-4-bbhushan2@marvell.com>
 <da0a4d7b-c27d-839d-56b6-da67c94adeb7@redhat.com>
 <CAAeCc_m=PKV0T8DmaE06F9NMYfU792f9TDdoyKkaPaEN3597ag@mail.gmail.com>
 <9b4ab5e8-8848-50ba-17c8-652567483126@redhat.com>
 <CAAeCc_ksAdoNJcFWkoB4YcySAb5Hw7D+kLyHx-Nt0hZJY17AXA@mail.gmail.com>
 <CAAeCc_nnM-DGCyXjFJuk-6L8F+Oetq076SEjeV8kUAGxfJVQTw@mail.gmail.com>
 <cc447790-d1c5-784b-9706-fbcd76f0c94b@redhat.com>
 <CAAeCc_mSobL4oGcK-J3WJJq8BCS6M_oyPTrzJ9bk8yFgsUDBUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAeCc_mSobL4oGcK-J3WJJq8BCS6M_oyPTrzJ9bk8yFgsUDBUw@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 mst@redhat.com, drjones@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org,
 Auger Eric <eric.auger@redhat.com>, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, Bharat Bhushan <bbhushan2@marvell.com>,
 linuc.decode@gmail.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oPev1EdDjuK+

Hi Bharat,

Could you Cc me on your next posting?  Unfortunately I don't have much
hardware for testing this at the moment, but I might be able to help a
little on the review.

On Mon, Mar 16, 2020 at 02:40:00PM +0530, Bharat Bhushan wrote:
> > >>> First issue is: your guest can use 4K page and your host can use 64KB
> > >>> pages. In that case VFIO_DMA_MAP will fail with -EINVAL. We must devise
> > >>> a way to pass the host settings to the VIRTIO-IOMMU device.
> > >>>
> > >>> Even with 64KB pages, it did not work for me. I have obviously not the
> > >>> storm of VFIO_DMA_MAP failures but I have some, most probably due to
> > >>> some wrong notifications somewhere. I will try to investigate on my side.
> > >>>
> > >>> Did you test with VFIO on your side?
> > >>
> > >> I did not tried with different page sizes, only tested with 4K page size.
> > >>
> > >> Yes it works, I tested with two n/w device assigned to VM, both interfaces works
> > >>
> > >> First I will try with 64k page size.
> > >
> > > 64K page size does not work for me as well,
> > >
> > > I think we are not passing correct page_size_mask here
> > > (config.page_size_mask is set to TARGET_PAGE_MASK ( which is
> > > 0xfffffffffffff000))
> > I guess you mean with guest using 4K and host using 64K.
> > >
> > > We need to set this correctly as per host page size, correct?
> > Yes that's correct. We need to put in place a control path to retrieve
> > the page settings on host through VFIO to inform the virtio-iommu device.
> >
> > Besides this issue, did you try with 64kB on host and guest?
> 
> I tried Followings
>   - 4k host and 4k guest  - it works with v7 version
>   - 64k host and 64k guest - it does not work with v7
>     hard-coded config.page_size_mask to 0xffffffffffff0000 and it works

You might get this from the iova_pgsize bitmap returned by
VFIO_IOMMU_GET_INFO. The virtio config.page_size_mask is global so there
is the usual problem of aggregating consistent properties, but I'm
guessing using the host page size as a granule here is safe enough. 

If it is a problem, we can add a PROBE property for page size mask,
allowing to define per-endpoint page masks. I have kernel patches
somewhere to do just that.

Thanks,
Jean
