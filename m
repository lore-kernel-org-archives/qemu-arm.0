Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp69366eje;
        Tue, 13 Feb 2024 03:40:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXa1RTeMoaH087rWL2ASspEJJ5yz7bI+I/YL/bobsUg4eypzI3h+QVxv7ZpEvvQhtx2elUC1SCZjuxqx+hPB4aHZ17zbTkL
X-Google-Smtp-Source: AGHT+IGpmSVLuxMbuwCrJMZOMJSyVlQbrelrDYHqYhDfvhkxbTnHwteqSjTiPhhNkM4xkk93N5k4
X-Received: by 2002:a05:6214:234d:b0:68c:e799:ef4a with SMTP id hu13-20020a056214234d00b0068ce799ef4amr13958905qvb.49.1707824443504;
        Tue, 13 Feb 2024 03:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707824443; cv=none;
        d=google.com; s=arc-20160816;
        b=sTaKHQJqj5i4NrhG5k1DfKRIggZ4otB70GyEJ+MNN8tv+qb2GefYYvK4VH24yopyCH
         geM8g5YJ/9uGGAZFm0fHX0zh0Nye3NponUiwu+djygRNvz1tnvrLSJHCera7neUqCU8A
         tLPuQA6Rf8dyJgB6ELCP3anuxi6jJIjsE1nVtR0zFAvAoMBxo3XOI7EwQApEYR6Iffg9
         o8O4upGNLUPWwPtTAcMT4nEIKp8wCubFr3wQJK3hueQpGyWWZanUPRrE+EfUprFyR5RN
         zuyd2UGa4R1RYcjh+DfFqnbNYw196MD2afV4uFNgHyxvjGbbt1bMCp5WslfeDWCfhMk8
         jADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=f3zGg6I8zSOUsFZlLIUFWXMj4kAtc/F6l/Dsos6/JZY=;
        fh=vYrq4QMR8+cX/z8Y6LDMnGP4G1Ty6WzDdH6QGH6VDU4=;
        b=qYO9rgtq1PDtSPwA71q9ktdX2klaN1pi29Xs1P47s2HUTQRv24CMk/nxzMu++TbE3L
         g9IOoFFVimJgjCHgmXv2V5Ob+ogoTigBru9FfNMTWnFpTEKiXxp07X6N3MYKiobh2rbh
         VrywLByd5QkOLxHd7jtY3f0nJYDNN8gouMCzsHkAF0KeSi76VVszHQNqJd5fHFspZnXE
         Ybw4VWszY6F/6+jmw2t5xh+Fa7Igt9jY1CWp3C2Gh8WAoHwR5UYwo66WmP9jeOo8FMNK
         w8CYdN8KpcY6bT7txf5PF3UgbhrMnNRIo9d4ApCoT1K+jGznFdqJFrNOkgvODsf7CWvR
         iqpg==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LBjdnnpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCXWB/fBhaoXzfSPlonKLRekSVkCC+854Nl7cFtth8MdJhf8k1E+rHko1YbIBNP8Cdyd8p0JU/2JTscDugxMhdhfIr6dfGPT
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf15-20020a0562142a4f00b0068c515ce1cbsi2558869qvb.293.2024.02.13.03.40.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 03:40:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LBjdnnpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZr93-0000hB-MU; Tue, 13 Feb 2024 06:40:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZr90-0000gV-SQ
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:40:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZr8w-00059K-4O
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:40:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707824405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f3zGg6I8zSOUsFZlLIUFWXMj4kAtc/F6l/Dsos6/JZY=;
 b=LBjdnnpE4Ld52n6/esyRjyRLGSkbYNZPVUfjsRXab4R8YzZg0sa5ewY0fofWKlm7XO/DLE
 n3ry1Zv06uU4pymPtGT91gm21pi0zf6yYAom3UpulGqLdHSiDin0pOn+Z4kjLA5XHCEr7Y
 6lo6jgbGun4Pvu6BBYVVjwYxkzaSLOU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-8MAtUZPVPWWii4CtBsX9IA-1; Tue, 13 Feb 2024 06:40:03 -0500
X-MC-Unique: 8MAtUZPVPWWii4CtBsX9IA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-410e860c087so8139345e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 03:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707824403; x=1708429203;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f3zGg6I8zSOUsFZlLIUFWXMj4kAtc/F6l/Dsos6/JZY=;
 b=qbGOhdSLR/Psb8zR1JHMjDryEqxdYApQqWazo3Bt0lDQjm9InwCqvHIe/yTSt+V0A8
 VC/KIaV2Jw2ul4PwpQcRzqyVZZZBxChc49IJsKZiXrfHiuZzGjSV2AEObXVsAx5i1oG2
 N67GTSZDddp92lpHCMi2TXwxbI+A6GQnrcDVIoCJPE/haB3g/UpIEUtYq+zNcDzdjhka
 b/3drn4nQktTK5/3gTJBx0O0UKcO51Vw8I3CNfotrYZMa+c68rJEFv72f4/eTV74Ao+n
 NAPfxUXcgH1nOub8Z745d1CtijWB4f0ZaR6sy+cxvBIicQ+IQdH4cdBPVPZFAkmzIf79
 Z7lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU31N/q2T4QVzTfBPoEx7/mT9HcW+rUT0A9V6kk9q7ONLZwPNjZ7azQddZIyc74wHE+uc9kp1wXMvgaaf1PQEOl3Z4
X-Gm-Message-State: AOJu0Yy9zXXtXaO4LhfR6KhsaOKw6n4usrY2G3nqCNMglN+hnCXAjQb+
 AOpbaPhKG3XVWjwft7yVF6Qhnjfcs50W9iS9Oh//xsr2IeBMHz11potKoRvFNqX7r2/2WvK/xCr
 p+q3soEygdG+kx/Jp0bk8bzQNXpTuSe2P7CsXqDbhCYLOkPZF8A==
X-Received: by 2002:a5d:540d:0:b0:33c:ddc9:6926 with SMTP id
 g13-20020a5d540d000000b0033cddc96926mr665132wrv.4.1707824402754; 
 Tue, 13 Feb 2024 03:40:02 -0800 (PST)
X-Received: by 2002:a5d:540d:0:b0:33c:ddc9:6926 with SMTP id
 g13-20020a5d540d000000b0033cddc96926mr665116wrv.4.1707824402412; 
 Tue, 13 Feb 2024 03:40:02 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW0HM9OySlhu8pZ9de4ZGLtu/SAnlKU001tF11zg8ilzuk64Pqrm3gJv/OV14M+zgoJ1crWv7oSIPwDOCgpE7n1ucig3cTsv1MBUC59/Pm0oVDm8hz0iO1D0dSiaHA0J2PxtQ3ssFRGUfa+b/BIHR1UK8tT3KZm4rO4Ybn4WmKGR9S99M8pdXYmldCygMBMQMuYote+XOIV+T01dlHzpyEQhcjDetMaV+t6mW1m9moR62iAqC6qpXwwBgk=
Received: from redhat.com ([2a02:14f:17d:5d88:37b3:ce51:18b:36d9])
 by smtp.gmail.com with ESMTPSA id
 ce9-20020a5d5e09000000b0033cddadde6esm1061554wrb.80.2024.02.13.03.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:40:01 -0800 (PST)
Date: Tue, 13 Feb 2024 06:39:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com,
 clg@redhat.com, peter.maydell@linaro.org
Subject: Re: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
Message-ID: <20240213063755-mutt-send-email-mst@kernel.org>
References: <20240117132039.332273-1-eric.auger@redhat.com>
 <20240213044312-mutt-send-email-mst@kernel.org>
 <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
 <20240213060544-mutt-send-email-mst@kernel.org>
 <91f1b2d8-da88-43c3-871f-7c47ef0d9439@redhat.com>
MIME-Version: 1.0
In-Reply-To: <91f1b2d8-da88-43c3-871f-7c47ef0d9439@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.504,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: 2MF/TjtluDWN

On Tue, Feb 13, 2024 at 12:19:16PM +0100, Eric Auger wrote:
> 
> 
> On 2/13/24 12:07, Michael S. Tsirkin wrote:
> > On Tue, Feb 13, 2024 at 11:32:13AM +0100, Eric Auger wrote:
> >> Hi Michael,
> >>
> >> On 2/13/24 10:43, Michael S. Tsirkin wrote:
> >>> On Wed, Jan 17, 2024 at 02:20:39PM +0100, Eric Auger wrote:
> >>>> We used to set default page_size_mask to qemu_target_page_mask() but
> >>>> with VFIO assignment it makes more sense to use the actual host page mask
> >>>> instead.
> >>>>
> >>>> So from now on qemu_real_host_page_mask() will be used as a default.
> >>>> To be able to migrate older code, we increase the vmstat version_id
> >>>> to 3 and if an older incoming v2 stream is detected we set the previous
> >>>> default value.
> >>>>
> >>>> The new default is well adapted to configs where host and guest have
> >>>> the same page size. This allows to fix hotplugging VFIO devices on a
> >>>> 64kB guest and a 64kB host. This test case has been failing before
> >>>> and even crashing qemu with hw_error("vfio: DMA mapping failed,
> >>>> unable to continue") in VFIO common). Indeed the hot-attached VFIO
> >>>> device would call memory_region_iommu_set_page_size_mask with 64kB
> >>>> mask whereas after the granule was frozen to 4kB on machine init done.
> >>>> Now this works. However the new default will prevent 4kB guest on
> >>>> 64kB host because the granule will be set to 64kB which would be
> >>>> larger than the guest page size. In that situation, the virtio-iommu
> >>>> driver fails on viommu_domain_finalise() with
> >>>> "granule 0x10000 larger than system page size 0x1000".
> >>>>
> >>>> The current limitation of global granule in the virtio-iommu
> >>>> should be removed and turned into per domain granule. But
> >>>> until we get this upgraded, this new default is probably
> >>>> better because I don't think anyone is currently interested in
> >>>> running a 4kB page size guest with virtio-iommu on a 64kB host.
> >>>> However supporting 64kB guest on 64kB host with virtio-iommu and
> >>>> VFIO looks a more important feature.
> >>>>
> >>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>>> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >>>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >>> What about migration compatibility? In particular, cross-version one?
> >>> Don't we need compat machinery for this?
> >> See below
> >>>> ---
> >>>>
> >>>> v1 -> v2:
> >>>> - fixed 2 typos in the commit msg and added Jean's R-b and T-b
> >>>> ---
> >>>>  hw/virtio/virtio-iommu.c | 7 +++++--
> >>>>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> >>>> index 8a4bd933c6..ec2ba11d1d 100644
> >>>> --- a/hw/virtio/virtio-iommu.c
> >>>> +++ b/hw/virtio/virtio-iommu.c
> >>>> @@ -1313,7 +1313,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> >>>>       * in vfio realize
> >>>>       */
> >>>>      s->config.bypass = s->boot_bypass;
> >>>> -    s->config.page_size_mask = qemu_target_page_mask();
> >>>> +    s->config.page_size_mask = qemu_real_host_page_mask();
> >>>>      s->config.input_range.end = UINT64_MAX;
> >>>>      s->config.domain_range.end = UINT32_MAX;
> >>>>      s->config.probe_size = VIOMMU_PROBE_SIZE;
> >>>> @@ -1491,13 +1491,16 @@ static int iommu_post_load(void *opaque, int version_id)
> >>>>       * still correct.
> >>>>       */
> >>>>      virtio_iommu_switch_address_space_all(s);
> >>>> +    if (version_id <= 2) {
> >>>> +        s->config.page_size_mask = qemu_target_page_mask();
> >> I tested migration from v2 -> v3 and the above code is overriding the
> >> new default by the older one.
> >>
> >> Do you have an other concern?
> >>
> >> Thanks
> >>
> >> Eric
> >
> >
> >>>> +    }
> >>>>      return 0;
> >>>>  }
> >>>>  
> >>>>  static const VMStateDescription vmstate_virtio_iommu_device = {
> >>>>      .name = "virtio-iommu-device",
> >>>>      .minimum_version_id = 2,
> >>>> -    .version_id = 2,
> >>>> +    .version_id = 3,
> >>>>      .post_load = iommu_post_load,
> >>>>      .fields = (const VMStateField[]) {
> >>>>          VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 2,
> > Oh I missed the version change. But then migration  to older version
> > is completely broken isn't it? Old qemu can not handle version_id 3 at
> > all.
> Indeed, I considered migrating backyard was not that much important. Do
> you consider this is mandated?
> 
> Eric

Generally yes. We only ship downstream but e.g. any RHEL major version
migrates to same major version in any direction as people have clusters
mixing different versions. It's easier to maintain that guarantee
upstream than break it upstream and try to fix it downstream.


> >
> > Generally, compat machinery is nicer than the old version hacks.
> >
> >
> >>>> -- 
> >>>> 2.41.0
> >

