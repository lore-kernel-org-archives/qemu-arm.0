Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4332652ejy;
        Thu, 6 Jul 2023 07:36:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH0Yg4AMTA3utHDFXi6uE2lrAVKlhAPLqDKYegsDCZkRTwvU6CzqfwXAPb0mizkNW2boMWg
X-Received: by 2002:a05:620a:2454:b0:767:156e:dda6 with SMTP id h20-20020a05620a245400b00767156edda6mr6730752qkn.32.1688654205107;
        Thu, 06 Jul 2023 07:36:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688654205; cv=none;
        d=google.com; s=arc-20160816;
        b=sL/HGybkZmYaq6iZ3raDk+Xs/c0x1tsaiWssj7mcBWgW24eRwpEBV2sVg1tdsOBRkA
         EsndqaKIMBpAmK2JKfchpW+7h1Ueq7KjxqARiY6xZ2IDf44CZ1uEzSnxAsFiR4SG/nOi
         ryiUzHABZ+us6sQksIWwrFcGVAlr7veF7gxCjzVP4bSrHX8nJ7XRdbb8fuzpUbSUr+Mf
         Rxu+JJbDV4ewkFDDhmE8RFf1xYKUjsGF9c65nr9Aazk8wyB1/tYEFwzDfWaSsepVCvxg
         L81VavwthUCYhoPTOhcdFjL3sTRxQL1o31JlCbi5wSWH/M5wFVPYZX5idTRFEtsiuvnH
         cJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=eyiUSaebPET6ayqOPUfohu6nN2Lek0YUQPyQxh6i/zI=;
        fh=IdWDe6x4aEglEhvyA56WMB2S3opIrauFxSDoXRmDy6g=;
        b=TTtN9oWyGftaCwxB/9nyAmKQzcW6tcSaO1j4UxXeAIsh59sP+QgocFMleFe9gBa1D5
         /Dy2UjaRK2pQDuL3FQYD+qI41xfOgmkeBINYekO+0wc4yIvTHk33/eqMingEE1kXi5IZ
         ZVuFlq9KC1fJvnVmZlte/zHizCHUGLPD6Aa979DlC/+6XArqIS53gnCfbrzy/M9BIZ/y
         I+3FpRcGZvD9btKexhO5JLLIY9q/8A6929EOJ9PwfR1i0n3UG/GtdkgLxuxmY71GZgtP
         mUN7q2oT7BWumLp7g+CCZMj36xdMIJfHNh+GDuuSslD6GJNEyHHlYP+WCnkraz+Y607V
         H3oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vg8NmG1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020a0cc503000000b00631fe953d3asi956041qvi.539.2023.07.06.07.36.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 07:36:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vg8NmG1F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHQ56-0001IH-0s; Thu, 06 Jul 2023 10:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qHQ54-0001Ht-Pm
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 10:35:38 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qHQ53-0001En-2X
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 10:35:38 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fbf1b82dc7so8244155e9.2
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 07:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688654135; x=1691246135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eyiUSaebPET6ayqOPUfohu6nN2Lek0YUQPyQxh6i/zI=;
 b=vg8NmG1FAxdS566eWwh69uVFpo9Z0Me0T2LEmsPbWIlio1dROA4XZAaGASnys8xag9
 VamEb0xe86hWSvZ6TEuBn9SYnauW4V8NYDwNFlUJJZ8tNkIx4dWCXmkajbHcVPxPs5yH
 xOIrhV/5Jjtwn1N1QR92+OMMaX+jUtAy+eSmO4HvWhKdyGMVciTQMvxCn3npgw0O1vg6
 b5YCiUw0DXxxklHZA4ksA3urZPztJe2iDL8zLqY2iyXq56MApcw7Tk30T1AjbV2blt4X
 uPq9sG2C2zTixmODC4WR8Bk0a5Eyis2b9AAxnkN94BMb29SHQ+0AYYfPYQRNMB5cYeSm
 LOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688654135; x=1691246135;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eyiUSaebPET6ayqOPUfohu6nN2Lek0YUQPyQxh6i/zI=;
 b=GLnH/ptUym/pUuMbECJQ1OnHbhVNc7WJash08nd50D0TwwG2sGG8ahiEIox8pBXnGw
 wS18ZfsP4yiXSkUB30Lc3Shk8sRiDuAOobGPeirdFFR3fQBzcDgQkyal5DYT4+ftW9tu
 FLeN61lADcEpOaff4mGlv6mGDR0T4wMWPMY2hQdHIoBf24R6gnvKl+9kI4lsteNyd0ao
 DfHhZkURqHp8gHBBxrUSxuHoxVWE+cK9tZMiCmz5XfkxY2hZiXnLNgCs4Wuuq6Q7APv5
 CEMar9ULGOiL6WSvt0AMF7O7Tr5AiEluWzEtLnZ5GmgrfxBYrdzB9lv5Y0OvLRCjmgU9
 N3iA==
X-Gm-Message-State: ABy/qLZfgdHn6Apt/wxEtM/qW+CUA7r42Jvz1k07Ic5dZIvi36INRc3V
 a7EsL1qPPVWkHtpXvccA91AFiw==
X-Received: by 2002:a7b:c849:0:b0:3f7:aad8:4e05 with SMTP id
 c9-20020a7bc849000000b003f7aad84e05mr1497644wml.11.1688654135267; 
 Thu, 06 Jul 2023 07:35:35 -0700 (PDT)
Received: from myrica ([2.219.138.198]) by smtp.gmail.com with ESMTPSA id
 n3-20020a5d51c3000000b00313f7b077fesm2012410wrv.59.2023.07.06.07.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 07:35:35 -0700 (PDT)
Date: Thu, 6 Jul 2023 15:35:35 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Cc: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "clg@redhap.com" <clg@redhap.com>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] virtio-iommu: Rework the trace in
 virtio_iommu_set_page_size_mask()
Message-ID: <20230706143535.GA2570588@myrica>
References: <20230704111527.3424992-1-eric.auger@redhat.com>
 <20230704111527.3424992-3-eric.auger@redhat.com>
 <SJ0PR11MB6744FA4E41101F7EED607E9C922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <SJ0PR11MB6744AEDC41BE576A59908A30922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <a11b8c79-9efc-6686-6405-863abb8824ae@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a11b8c79-9efc-6686-6405-863abb8824ae@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: m3GFSBAi7oAQ

On Wed, Jul 05, 2023 at 03:16:31PM +0200, Eric Auger wrote:
> >>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c index
> >>> 1eaf81bab5..0d9f7196fe 100644
> >>> --- a/hw/virtio/virtio-iommu.c
> >>> +++ b/hw/virtio/virtio-iommu.c
> >>> @@ -1101,29 +1101,24 @@ static int
> >>> virtio_iommu_set_page_size_mask(IOMMUMemoryRegion *mr,
> >>>                                           new_mask);
> >>>
> >>>     if ((cur_mask & new_mask) == 0) {
> >>> -        error_setg(errp, "virtio-iommu page mask 0x%"PRIx64
> >>> -                   " is incompatible with mask 0x%"PRIx64, cur_mask, new_mask);
> >>> +        error_setg(errp, "virtio-iommu %s reports a page size mask 0x%"PRIx64
> >>> +                   " incompatible with currently supported mask 0x%"PRIx64,
> >>> +                   mr->parent_obj.name, new_mask, cur_mask);
> >>>         return -1;
> >>>     }
> >>>
> >>>     /*
> >>>      * Once the granule is frozen we can't change the mask anymore. If by
> >>>      * chance the hotplugged device supports the same granule, we can still
> >>> -     * accept it. Having a different masks is possible but the guest will use
> >>> -     * sub-optimal block sizes, so warn about it.
> >>> +     * accept it.
> >>>      */
> >>>     if (s->granule_frozen) {
> >>> -        int new_granule = ctz64(new_mask);
> >>>         int cur_granule = ctz64(cur_mask);
> >>>
> >>> -        if (new_granule != cur_granule) {
> >>> -            error_setg(errp, "virtio-iommu page mask 0x%"PRIx64
> >>> -                       " is incompatible with mask 0x%"PRIx64, cur_mask,
> >>> -                       new_mask);
> >>> +        if (!(BIT(cur_granule) & new_mask)) {
> > Sorry, I read this piece code again and got a question, if new_mask has finer
> > granularity than cur_granule, should we allow it to pass even though
> > BIT(cur_granule) is not set?
> I think this should work but this is not straightforward to test.
> virtio-iommu would use the current granule for map/unmap. In map/unmap
> notifiers, this is split into pow2 ranges and cascaded to VFIO through
> vfio_dma_map/unmap. The iova and size are aligned with the smaller
> supported granule.
> 
> Jean, do you share this understanding or do I miss something.

Yes, I also think that would work. The guest would only issue mappings
with the larger granularity, which can be applied by VFIO with a finer
granule. However I doubt we're going to encounter this case, because
seeing a cur_granule larger than 4k here means that a VFIO device has
already been assigned with a large granule like 64k, and we're trying to
add a new device with 4k. This indicates two HW IOMMUs supporting
different granules in the same system, which seems unlikely.

Hopefully by the time we actually need this (if ever) we will support
per-endpoint probe properties, which allow informing the guest about
different hardware properties instead of relying on one global property in
the virtio config.

Thanks,
Jean
