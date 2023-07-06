Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4494045ejy;
        Thu, 6 Jul 2023 11:53:32 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFx9eVTRqwxdwRHiNNaHuxF4p+zL8zHDV5hBufN4EMG9+C2VlHlsZHgPUu7RcXkILPzjmwd
X-Received: by 2002:a0c:f0c1:0:b0:636:47a5:4bc5 with SMTP id d1-20020a0cf0c1000000b0063647a54bc5mr2466057qvl.62.1688669611817;
        Thu, 06 Jul 2023 11:53:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688669611; cv=none;
        d=google.com; s=arc-20160816;
        b=THUr1/qJy9VQmW//b7zg1RpeiKcy1rAbS1ytQld26GxtLqvNzHwN0716tZtN29zfLd
         iBMLP+HYqRZt+d26xX7iWJ5zryvxcBIP0cCpReGxveh24y2QxGOpVU6wyO5ndh6DSlPu
         GA3RPfCyDtICUUQ7kr6HOn2CpqnbufTsaq4RYuFk1coSjyt7juHUbfw0R7QeF9wQW7PI
         Kg+xahZGTlljbzMzv38udwECglZAyqiJhrVTiRatRYxiQtF/brJJ2CqHrV7JAQcH1bp1
         pf3PsyByNV+wlV5Pv00Qhxjl7uhzPUVylb1MLdDuMfIHM1Y8taeWDu60DCAGpqpoHr+5
         HbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=oyb1Eugswk0N8xQj1J2WKT9qenfubXqukG75R08xjmw=;
        fh=C0DffGIM0qSpFqjwJqrNZbKklyQ0P3uE9Vq5zZYW/5U=;
        b=tN43Aco7fDFPxrfia3+IcTrp7DQX3AGjsQNj0g5jyToNNLDomWF7M2N70H9MgXvZgk
         n0hoTQF7h/7/aoOufkjUBpukb+Noo5UXc3u7Ypx5HGkd0q3LY6s41hEJ6zL45Vn5fP2X
         /enYLwgSewG7tPeKrImc/R3nB6tikHqJWiH92PhoDRv9NUipzK0PrWgjWf8wtmosuFgj
         KZdAhB1gU3EDSxvouffJimpa4LTj7519iufQ8QvEwiKJ6CzlddVPl2AZ1+QwSOMYS/UP
         P7GPhjsvNJ6oy/skYNySszljkC26DLyDByOM3Eyjv87xY10FePpXVcYYhpNrKV1vu1wQ
         Li0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E0tK+x9W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14-20020a0cdf0e000000b00626009daf22si1367829qvl.431.2023.07.06.11.53.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 11:53:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=E0tK+x9W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHU6D-0007Ts-6v; Thu, 06 Jul 2023 14:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qHU69-0007Sy-R1
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 14:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1qHU68-0005It-4i
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 14:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688669566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oyb1Eugswk0N8xQj1J2WKT9qenfubXqukG75R08xjmw=;
 b=E0tK+x9W5q+l6MgtQp2IYPUjgKIX3qBLWFF6n91vwLVPXwZf0yPhXnXfX5wQanDTKBSt8t
 FV8TT6vAovWyO/y0XA/e843S0z20KI34vnOGAGm5LPy+h5uln+evuabdsWaL0pc43qSFhU
 sba9wsJAji5ZUToqRpGD67EZQ02WCSc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-LAU2sxNDPrml9Y8MVr3Rjg-1; Thu, 06 Jul 2023 14:52:44 -0400
X-MC-Unique: LAU2sxNDPrml9Y8MVr3Rjg-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3141a98a29aso561891f8f.1
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 11:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688669563; x=1691261563;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oyb1Eugswk0N8xQj1J2WKT9qenfubXqukG75R08xjmw=;
 b=g61GC7x0zk7n0RKpXOV9byMlXaHdCmNBCL8abuxcP41K8N0pcSJYIXBLxLCO0tWPvI
 TlwEONOofN95mYB6wQHfL6voNfZ9BL5t9n5uT3HJvCsR1P0jMMdasghfz2yHJZBfBk6f
 dWZ7wT6tsdD+eF/gAy5fsBXhZJdmG/p1OX1wwpcZprI93ItaSE0pQUoEgftzXO1Il0bq
 3zi8xv/GJE/L1NcgxKoAfTLS/648c750uJLfCh6THjt0uYfni+T6r9ECkDUR3U6oAndc
 8DVN+P8dVxR92WKHe3hI4fydqQ/pfgXk+zhT6wyCtIiOArG/pYNR8vEIW9l9p0TbMZrc
 kwjQ==
X-Gm-Message-State: ABy/qLbX3qCQhKV8ld9ne/EfWFLVgI0+QlN0xTT91sZgNXUKGcqaKsCY
 1PhrKxvy3Z3WJIgV6GF7477oohZ2PTgplJW21KPvqP54eBafULdkY122vrUu44CghegM6gKoGql
 hRPbEqDHU2ThA
X-Received: by 2002:a5d:4ec6:0:b0:313:e391:e492 with SMTP id
 s6-20020a5d4ec6000000b00313e391e492mr2726179wrv.17.1688669563481; 
 Thu, 06 Jul 2023 11:52:43 -0700 (PDT)
X-Received: by 2002:a5d:4ec6:0:b0:313:e391:e492 with SMTP id
 s6-20020a5d4ec6000000b00313e391e492mr2726163wrv.17.1688669562977; 
 Thu, 06 Jul 2023 11:52:42 -0700 (PDT)
Received: from redhat.com ([2.52.13.33]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4742000000b0031434936f0dsm2511835wrs.68.2023.07.06.11.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 11:52:42 -0700 (PDT)
Date: Thu, 6 Jul 2023 14:52:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "clg@redhap.com" <clg@redhap.com>,
 "bharat.bhushan@nxp.com" <bharat.bhushan@nxp.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Subject: Re: [PATCH 2/2] virtio-iommu: Rework the trace in
 virtio_iommu_set_page_size_mask()
Message-ID: <20230706145221-mutt-send-email-mst@kernel.org>
References: <20230704111527.3424992-1-eric.auger@redhat.com>
 <20230704111527.3424992-3-eric.auger@redhat.com>
 <SJ0PR11MB6744FA4E41101F7EED607E9C922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <SJ0PR11MB6744AEDC41BE576A59908A30922FA@SJ0PR11MB6744.namprd11.prod.outlook.com>
 <a11b8c79-9efc-6686-6405-863abb8824ae@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a11b8c79-9efc-6686-6405-863abb8824ae@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6XHO4lQc0hpC

On Wed, Jul 05, 2023 at 03:16:31PM +0200, Eric Auger wrote:
> Hi Zhenghong,
> 
> On 7/5/23 10:17, Duan, Zhenzhong wrote:
> >
> >> -----Original Message-----
> >> From: Duan, Zhenzhong
> >> Sent: Wednesday, July 5, 2023 12:56 PM
> >> Subject: RE: [PATCH 2/2] virtio-iommu: Rework the trace in
> >> virtio_iommu_set_page_size_mask()
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Eric Auger <eric.auger@redhat.com>
> >>> Sent: Tuesday, July 4, 2023 7:15 PM
> >>> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
> >>> devel@nongnu.org; qemu-arm@nongnu.org; mst@redhat.com; jean-
> >>> philippe@linaro.org; Duan, Zhenzhong <zhenzhong.duan@intel.com>
> >>> Cc: alex.williamson@redhat.com; clg@redhap.com;
> >> bharat.bhushan@nxp.com;
> >>> peter.maydell@linaro.org
> >>> Subject: [PATCH 2/2] virtio-iommu: Rework the trace in
> >>> virtio_iommu_set_page_size_mask()
> >>>
> >>> The current error messages in virtio_iommu_set_page_size_mask() sound
> >>> quite similar for different situations and miss the IOMMU memory region
> >>> that causes the issue.
> >>>
> >>> Clarify them and rework the comment.
> >>>
> >>> Also remove the trace when the new page_size_mask is not applied as the
> >>> current frozen granule is kept. This message is rather confusing for
> >>> the end user and anyway the current granule would have been used by the
> >>> driver
> >>>
> >>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>> ---
> >>> hw/virtio/virtio-iommu.c | 19 +++++++------------
> >>> 1 file changed, 7 insertions(+), 12 deletions(-)
> >>>
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


Maybe add a comment down the road. Not urgent.

> Jean, do you share this understanding or do I miss something.
> 
> Nevertheless the current code would have rejected that case and nobody
> complained at that point ;-)
> 
> thanks
> 
> Eric
> 
> >
> > Thanks
> > Zhenzhong
> >
> >> Good catch.
> >>
> >> Reviewed-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> >>
> >> Thanks
> >> Zhenzhong
> >>
> >>> +            error_setg(errp, "virtio-iommu %s does not support frozen
> >>> + granule
> >>> 0x%"PRIx64,
> >>> +                       mr->parent_obj.name, BIT(cur_granule));
> >>>             return -1;
> >>> -        } else if (new_mask != cur_mask) {
> >>> -            warn_report("virtio-iommu page mask 0x%"PRIx64
> >>> -                        " does not match 0x%"PRIx64, cur_mask, new_mask);
> >>>         }
> >>>         return 0;
> >>>     }
> >>> --
> >>> 2.38.1

