Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp332207ejk;
        Mon, 29 Jan 2024 09:43:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtlxXcA8Qdoph5h0MiLkuK0qTQxJBgFR/ryNeuP0wnWFsb9bICAu4pezyJ9haNe/gOSRAL
X-Received: by 2002:a05:620a:564:b0:783:ad8b:8b37 with SMTP id p4-20020a05620a056400b00783ad8b8b37mr5086345qkp.57.1706550184454;
        Mon, 29 Jan 2024 09:43:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706550184; cv=none;
        d=google.com; s=arc-20160816;
        b=mbBiywQwtKVhPgqCzBRNcdelmdNxmB7PynS/+Z6dTYldFAfb+YrXgBKvx36rVDVeLP
         SBY3hU+A3SAMfXaBlWsS5BmO4NkTFg1s7yavzsbKJXaMTjLogI5XgEFSLMKV7F6XlV3Y
         4vDE1MXIH9NPf6CMIbIDLaqXv4V9UVtKzbZHEQPzwJoBMbKtRF5Oymf485RG6WbRmQg1
         Dm+6x2LqfhbQ1dW+/7Xj03JBJ436n6IyR/qL8DM6FUvabGokTqspVPOxOGD/lx+YpBxE
         jFwfpIoljOvmah4L3oUTW8tfRm1M4GfWSnyEWgSmZT5H7Yfhn/jvy9a9LB2LlBszg0bh
         3Apw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=hi/bPxvY91tpMbomroYUdB5TmR8GTew2hRnVvF7LSD0=;
        fh=S/JqU5Olik9Z3Q5mE8mDn4bnKe7nRGom4RyWaoivRO4=;
        b=S6MV64GdMXRMbwfmYL6KsUhrwinjF+1c+G+55D13ZdFuTAsZCYeZl2yzFiTqqW2vZh
         c48kK3FB0lyT3kdETOD8VdyE2/BAtN9DIzsh4DodPSGdqSnXolLrXyXR3T3tU+hV0nH8
         fhAEC2++8qUTEx9XR53GE2yhIOGqfHoxUdPLaYUVvjkoWhCfRdrLDXwsJa9JOzD9NWi5
         4Q0QFJnWbGZRhIcGsTJOyjKfG0y9PQHybyhdv1PWxoov5GhQuEtVuAYQ2eJK24nLdZJr
         TkTySqbaqIzP0ELnq2pOJX+rvwWy1BY1d8oTBrmjXNoGwG4RzL4t4scDjxQKvVogSXxd
         LDVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KSNTE8y8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o21-20020a05620a229500b0078400138351si2018179qkh.744.2024.01.29.09.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 09:43:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KSNTE8y8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUVeo-00067j-V9; Mon, 29 Jan 2024 12:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rUVen-00065Z-4g
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 12:42:53 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1rUVel-0000AE-0F
 for qemu-arm@nongnu.org; Mon, 29 Jan 2024 12:42:52 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40ef207c654so15765905e9.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jan 2024 09:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706550169; x=1707154969; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hi/bPxvY91tpMbomroYUdB5TmR8GTew2hRnVvF7LSD0=;
 b=KSNTE8y8pv/zSbokDKVbhQwzhkcqRhJ8NGzQ/7Pba55JbvwELwkyjEWl1/iN9vxyuL
 LmHVSt+j43sXNnOm6C/97IELZbvYDTbvHkfKI/pWjsBlrLswo+ZXsOOewfXvdY5OTc1O
 wHcUmgMyvBX9ep97swum7Y9LbVmGHna0b6Mn1Q62/LKcvUijwN1TkRAuwf5b3diGzbyt
 ybVIu+mimJ+Un5+Te9VMnmLglR98A5F6FhRbnwBHjObezmAgR3nY33BWXvtE9zxs/xaX
 i9DBmULd7pfJ17P60rIethbb5Fnw+W3l4XDIZePnSwTtnsfOVjL/rEZbIL8mFUrzRb7o
 YF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706550169; x=1707154969;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hi/bPxvY91tpMbomroYUdB5TmR8GTew2hRnVvF7LSD0=;
 b=mRwuySX6i0/iGFGM7UTQCW85SyxGPLn11Np7m2Qe2yPTOBWIf0lGWwJ8v5AYcq9Oqy
 ASWSDxFg+sxrpzmpzvLbEl1/XjcaKMrGMfgPU9hrhJCpRPKmJn7S8PLsth3H+I57dJ6H
 4z4nBoiLCQbNnrVCXJMdyqRDZGgCSUxn4hpxRebCLAjyiP2836ehVZXoBu6733hkbyv+
 eYyk+9+piaMwRG6XpqP+WnpgEKE8pCfWJumqEsYapBDjqRWBqTKb7PcuaegeiqiO2AM8
 X05k2KKl2tv4orkpviaKTTyxGE+635nDZDYV2m/5tfKbw6al8uOFZdqIU+3GhYGutM5Y
 FU9A==
X-Gm-Message-State: AOJu0Yz6AgZKQo42nX6PrZJ/kBV0cFk3IraIH5Y/W1P+V0wp+a0fPKeW
 YK8uB9KF95Xx2Zd62fvIb/IVcdqSvo5MNQN30SCWiG2e7A3CqfnZ4CTpTryVH+Q=
X-Received: by 2002:a1c:4b10:0:b0:40e:6922:7960 with SMTP id
 y16-20020a1c4b10000000b0040e69227960mr6101062wma.29.1706550169185; 
 Mon, 29 Jan 2024 09:42:49 -0800 (PST)
Received: from myrica ([2.221.137.100]) by smtp.gmail.com with ESMTPSA id
 c17-20020a5d5291000000b0033ae4ba8ca0sm6235735wrv.82.2024.01.29.09.42.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:42:48 -0800 (PST)
Date: Mon, 29 Jan 2024 17:42:50 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 alex.williamson@redhat.com, peter.maydell@linaro.org,
 zhenzhong.duan@intel.com, peterx@redhat.com, yanghliu@redhat.com,
 mst@redhat.com, clg@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH 0/3] VIRTIO-IOMMU: Introduce an aw-bits option
Message-ID: <20240129174250.GA1306334@myrica>
References: <20240123181753.413961-1-eric.auger@redhat.com>
 <20240129122332.GA909471@myrica>
 <670991f9-e483-4acb-9ae9-6bad47b962b1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <670991f9-e483-4acb-9ae9-6bad47b962b1@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: OJUD1Y4MHoJk

On Mon, Jan 29, 2024 at 03:07:41PM +0100, Eric Auger wrote:
> Hi Jean-Philippe,
> 
> On 1/29/24 13:23, Jean-Philippe Brucker wrote:
> > Hi Eric,
> >
> > On Tue, Jan 23, 2024 at 07:15:54PM +0100, Eric Auger wrote:
> >> In [1] and [2] we attempted to fix a case where a VFIO-PCI device
> >> protected with a virtio-iommu is assigned to an x86 guest. On x86
> >> the physical IOMMU may have an address width (gaw) of 39 or 48 bits
> >> whereas the virtio-iommu exposes a 64b input address space by default.
> >> Hence the guest may try to use the full 64b space and DMA MAP
> >> failures may be encountered. To work around this issue we endeavoured
> >> to pass usable host IOVA regions (excluding the out of range space) from
> >> VFIO to the virtio-iommu device so that the virtio-iommu driver can
> >> query those latter during the probe request and let the guest iommu
> >> kernel subsystem carve them out.
> >>
> >> However if there are several devices in the same iommu group,
> >> only the reserved regions of the first one are taken into
> >> account by the iommu subsystem of the guest. This generally
> >> works on baremetal because devices are not going to
> >> expose different reserved regions. However in our case, this
> >> may prevent from taking into account the host iommu geometry.
> >>
> >> So the simplest solution to this problem looks to introduce an
> >> input address width option, aw-bits, which matches what is
> >> done on the intel-iommu. By default, from now on it is set
> >> to 39 bits with pc_q35 and 64b with arm virt.
> > Doesn't Arm have the same problem?  The TTB0 page tables limit what can be
> > mapped to 48-bit, or 52-bit when SMMU_IDR5.VAX==1 and granule is 64kB.
> > A Linux host driver could configure smaller VA sizes:
> > * SMMUv2 limits the VA to SMMU_IDR2.UBS (upstream bus size) which
> >   can go as low as 32-bit (I'm assuming we don't care about 32-bit hosts).
> Yes I think we can ignore that use case.
> > * SMMUv3 currently limits the VA to CONFIG_ARM64_VA_BITS, which
> >   could be as low as 36 bits (but realistically 39, since 36 depends on
> >   16kB pages and CONFIG_EXPERT).
> Further reading "3.4.1 Input address size and Virtual Address size" ooks
> indeed SMMU_IDR5.VAX gives info on the physical SMMU actual
> implementation max (which matches intel iommu gaw). I missed that. Now I
> am confused about should we limit VAS to 39 to accomodate of the worst
> case host SW configuration or shall we use 48 instead?

I don't know what's best either. 48 should be fine if hosts normally
enable VA_BITS_48 (I see debian has it [1], not sure how to find the
others).

[1] https://salsa.debian.org/kernel-team/linux/-/blob/master/debian/config/arm64/config?ref_type=heads#L18

> If we set such a low 39b value, won't it prevent some guests from
> properly working?

It's not that low, since it gives each endpoint a private 512GB address
space, but yes there might be special cases that reach the limit. Maybe
assign a multi-queue NIC to a 256-vCPU guest, and if you want per-vCPU DMA
pools, then with a 39-bit address space you only get 2GB per vCPU. With
48-bit you get 1TB which should be plenty.

52-bit private IOVA space doesn't seem useful, I doubt we'll ever need to
support that on the MAP/UNMAP interface.

So I guess 48-bit can be the default, and users with special setups can
override aw-bits.

Thanks,
Jean
