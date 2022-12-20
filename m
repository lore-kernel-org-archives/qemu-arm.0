Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4386607ejb;
        Tue, 20 Dec 2022 06:59:49 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuMTS3dCisgRWacvbBiCuj6unWVyiHRhGFWCuQAFZv08gh869PN+JEQ6M18HQDTWEFZL4qn
X-Received: by 2002:ac8:6b82:0:b0:3a7:f4cc:8dd5 with SMTP id z2-20020ac86b82000000b003a7f4cc8dd5mr11788592qts.34.1671548389248;
        Tue, 20 Dec 2022 06:59:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671548389; cv=none;
        d=google.com; s=arc-20160816;
        b=jJUHUcCCZUwyq1Da7I/78u6ydmIIAV4VPxr1IwRFniOoM5IePM5MyAOOG97OPnBHdE
         QhSP3haukBK2QxFVlhRSktCeogmwG5ssuImVqB9MQMxgD4LETae67JH+Oz3PnknKReHo
         gsumzOy3KN9/L+0boX2Jy0dRVvp9nzQ1XF1B0noBylhbrT57BG/V/waMf5n2hSYETvA6
         jayI1By3ueC8OPbYXIKrsMbPgmmalQryp2qK+QSPvfxg2V2KDga3HJsLjyFnbulUOPk5
         2v4/o0riBpNPC6Ou1qYhP/Ll6n57/xW5xDyBACMbMEC0jiLF/1n74Q5Y2b4g8wHtrSXA
         Fvrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=v5JOjQ8Enft7RihZTm4+0dpJWjCA94F3I3MtLy5IAIA=;
        b=r7vFV+q+DIQm74ROp5c1Yukjadv+CZptU3e5tsIAe/lo5t+rZ1Nsmz9JEGLImJEb/F
         phkCd0o65+ETZd+pG+TDSa39rTCF2quJQI0Q4xZ3LRreAyEy1SMzeDjBzkgCSjQQEKRE
         b6AgbFA1zDsPBtq3bHcnVlyOB1Tp6KU7RN6KUX5RTu3Vt1Zr/Rb0yWdVECcymQ1GQRtK
         kn05rePhwiOWCfo+MJ49wDIJS2aBh3DrTBKXM11NS2nd/uIOrx7mcOOA9h2qM6hXICs8
         sKJ/9tFDprxWB3Ya8zG9lg8bIfnrjdkNZRXFByx+TiJPiGT+PWKR27iVRXLZ1pUQx+fb
         XM8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BD5HFgus;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9-20020a05620a254900b006f64a82024esi5232278qko.721.2022.12.20.06.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 06:59:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BD5HFgus;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7e5r-0004rF-EI; Tue, 20 Dec 2022 09:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7e5p-0004mX-R0
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 09:59:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7e5o-00054y-AI
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 09:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671548383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v5JOjQ8Enft7RihZTm4+0dpJWjCA94F3I3MtLy5IAIA=;
 b=BD5HFgusccFegR5X2FyFLbb0EubRuSrWN/gqGbydKfRADjNvOQtl4nNJa2PCnmYbNE2OMf
 eVQnyWkXykhfSB+ey5JT56y1oH3GwkpXlK3iCNNA/ibskctMjCN86D3RAWSFVFCBbhnxyC
 EY1FI7YODx+KHbQxo7+5jBObumtaqwI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-26-307NT4w5O-mOmveAbzSNaw-1; Tue, 20 Dec 2022 09:59:34 -0500
X-MC-Unique: 307NT4w5O-mOmveAbzSNaw-1
Received: by mail-qk1-f199.google.com with SMTP id
 bj4-20020a05620a190400b006fc7c5d454cso9559664qkb.14
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 06:59:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5JOjQ8Enft7RihZTm4+0dpJWjCA94F3I3MtLy5IAIA=;
 b=nk9PtXJJ/LPP4ITXf2f5YfVV5giR5+V8G3dK4UD8sNYrNLOGnQel3yt14pQKYgUVep
 OabDeowvlA1b6rtqsKrb8dab4EWNFHFGQ9a1C3Zkxu9IcY04ZmxUNPIcDCZ2tT8hAp4p
 uAAXWnmNQUo+sYVrxPaNaqlB6Auz2h6A7jHTw/yw12PyHyjXj+PHXxrd1Jra6992/Ocx
 9Sg1Fsjp0ehYNPrl78Vaezz10JUFQ63n80bKqiyfaDQaAFCA4X9rhMVN31ji6tWuUSIz
 fuH5Q40ew8VId2Q9XfLa75EOAkCPGbBH7U9herW9chlRWQ9yx8gqShCEChvXraXPKWFr
 5j1w==
X-Gm-Message-State: ANoB5pkRbQ5MITOiROdfgqRTmagG+9WdLJlEsGBb7xo4o4bR51XakOWh
 Q+4V4aSY1RXigMz4Drm5dGBagRBoEa9Xeb+A8D11MQpYcQy1NNb3KYst4sYVR5E+N1ufhsq6/aT
 QTdFyLchfaKB3
X-Received: by 2002:a05:6214:5e84:b0:4c7:4e21:fc95 with SMTP id
 mm4-20020a0562145e8400b004c74e21fc95mr61496889qvb.40.1671548374284; 
 Tue, 20 Dec 2022 06:59:34 -0800 (PST)
X-Received: by 2002:a05:6214:5e84:b0:4c7:4e21:fc95 with SMTP id
 mm4-20020a0562145e8400b004c74e21fc95mr61496859qvb.40.1671548373956; 
 Tue, 20 Dec 2022 06:59:33 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05620a408900b006cfc9846594sm8940437qko.93.2022.12.20.06.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 06:59:33 -0800 (PST)
Date: Tue, 20 Dec 2022 09:59:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 alex.williamson@redhat.com
Subject: Re: [PATCH for 8.0 0/2] virtio-iommu: Fix Replay
Message-ID: <20221220095908-mutt-send-email-mst@kernel.org>
References: <20221207133646.635760-1-eric.auger@redhat.com>
 <Y5EmmjKBBnjSlvd+@x1n>
 <a281b12b-d905-4c96-72ce-6e22e41d0cfb@redhat.com>
 <Y5H7fu2ikdXU8b3i@x1n>
MIME-Version: 1.0
In-Reply-To: <Y5H7fu2ikdXU8b3i@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: kXQsgihfjTHk

On Thu, Dec 08, 2022 at 09:58:06AM -0500, Peter Xu wrote:
> On Thu, Dec 08, 2022 at 08:48:09AM +0100, Eric Auger wrote:
> > Hi Peter,
> 
> Hi, Eric,
> 
> > 
> > On 12/8/22 00:49, Peter Xu wrote:
> > > Hi, Eric,
> > >
> > > On Wed, Dec 07, 2022 at 02:36:44PM +0100, Eric Auger wrote:
> > >> When assigning VFIO devices protected by a virtio-iommu we need to replay
> > >> the mappings when adding a new IOMMU MR and when attaching a device to
> > >> a domain. While we do a "remap" we currently fail to first unmap the
> > >> existing IOVA mapping and just map the new one. With some device/group
> > >> topology this can lead to errors in VFIO when trying to DMA_MAP IOVA
> > >> ranges onto existing ones.
> > > I'm not sure whether virtio-iommu+vfio will suffer from DMA races like when
> > > we were working on the vt-d replay for vfio.  The issue is whether DMA can
> > > happen right after UNMAP but before MAP of the same page if the page was
> > > always mapped.
> > 
> > I don't think it can race because a mutex is hold while doing the
> > virtio_iommu_replay(), and each time a virtio cmd is handled (attach,
> > map, unmap), see virtio_iommu_handle_command.
> > So I think it is safe.
> 
> It's not the race in the code, it's the race between modifying host IOMMU
> pgtable with DMA happening in parallel.  The bug triggered with DMA_MAP
> returning -EEXIST means there's existing mapping.
> 
> If during replay there's mapped ranges and the ranges are prone to DMA,
> then IIUC it can happen.
> 
> I didn't really check specifically for virtio-iommu and I mostly forget the
> details, just to raise this up.  It's possible for some reason it just
> can't trigger.  VT-d definitely can, in which case we'll see DMA errors on
> the host from the assigned device when the DMA triggers during the "unmap
> and map" window.
> 
> Thanks,

Eric any resolution on this?

> -- 
> Peter Xu

