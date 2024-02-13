Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp55312eje;
        Tue, 13 Feb 2024 03:07:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXC3QT0v+7RkdjdsjENHbOl4Si7MU+lEcgbmLHSvGXL/hYtDXUif66xj+h9w2B58WAXnRJcJ63PupGCdzl6nx/2o9vZPNn9
X-Google-Smtp-Source: AGHT+IGXjlGKWX3eC4ANedZneYs6D5+Y2m240eBkemraDK1cqshWoG4eAYgJvjYX9igo2DuP0/la
X-Received: by 2002:a05:6214:2628:b0:68c:a73e:f3dd with SMTP id gv8-20020a056214262800b0068ca73ef3ddmr13232387qvb.10.1707822463321;
        Tue, 13 Feb 2024 03:07:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707822463; cv=none;
        d=google.com; s=arc-20160816;
        b=fWSeVI5Qembv00UnYjIVQj5XP5AIBhMlm8vGniY1tUAHJN4serqGhv/bY6vIFJ6tHC
         bbtxHLtEGUJMqTMXr3lQzZZYaxQ3zF+QryudiLa9qszlvbDgGmVynlUa48ZK3CWNEX+L
         lj5go/vpQ07zhP9qDfySIWfUrMdO1rm0WIR4rvkbLg/LWBJBPycMo+9v6OGYrIpmMMwj
         xSPVAkiFWWB16UjRyde4eGMJEZcA7W8R+b+kUt/R2WfI7mj5CixJzN3n3aVGbqSINQYd
         MbNz/emCBEaBV3eT8Q0GSSoWR8JrMg09s8DvaN6opkpzu4mYBQqj5qj6OFPlk0qi7QTa
         PdyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ASyIKhSA4StI4MoNK8wEtVUg822eLHNPBDgnBO1FArQ=;
        fh=nGZzJ3rhWsUSVYR1FLM2GiHdkzhhDRQE3RNKl3JAwqc=;
        b=lhHrlmNZilcbWo/qKqtdxs+5/0n9aotpsLWxpF59hW2YaD16rEadFac2RuDwrLSToe
         Zqzx9iM9Ghv4rJxFIMMTWU+4Dy2hbltKxD09adbUp9A8QD7BUNmolar1hPDvHuHe7G9d
         yUgi7m2mX69IracACOQ7uYbqXnYOkJWfSLNK9YPUWaOv0B0XbgNWhxB/S9wGX3hHV0nJ
         FoMLP0oN3kuD/7eyPX0LVadI/OReT7WHKb+zjE3TIzISDKmoxP5QkLT0AsZTFy52CBFj
         e44NWhVjLtIg0xFMKC/mF4gxw2ZU9NbCD2+4+BLyDfC7ozT8iPStxAf/emlwK39vwSQZ
         wYYw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MNhXZBAy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCXHyu8TPo0qUdYiHvskUamPnGaqYltWHH2AYHfVtlswrhF3w+pgHINQGI849Q/ZRXH+I43KqO1TqW45J52iGhqq15D43d9k
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im15-20020a056214246f00b0068cc2708676si2552617qvb.610.2024.02.13.03.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 03:07:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MNhXZBAy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZqdO-0001BJ-Jh; Tue, 13 Feb 2024 06:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZqdM-00019S-Jn
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:07:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZqdJ-0007ZK-PI
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:07:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707822445;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ASyIKhSA4StI4MoNK8wEtVUg822eLHNPBDgnBO1FArQ=;
 b=MNhXZBAyPWil6iHa0MRsZuUoOAcb+hX3r3jgJfrtzKUaKWYAQrVda9ZYxjwpqxBbH9TUCj
 9mpn7kZGWMHJK0AwlfHjbhXGW6PUEU6wmEo5KTunF7PmHtoUuY6RkZlpBlLiUDWWoCxLl1
 FwbAUN9hoBCJbznKNTMwjAL9piEpmGM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-VEi4zAVoObaGaMO-2jghnQ-1; Tue, 13 Feb 2024 06:07:23 -0500
X-MC-Unique: VEi4zAVoObaGaMO-2jghnQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-5611e1da4c6so2782988a12.1
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 03:07:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707822442; x=1708427242;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ASyIKhSA4StI4MoNK8wEtVUg822eLHNPBDgnBO1FArQ=;
 b=DA2R7pwOQ190lYKRzb/sF9HyF3qxCxRt7ufbFIjXcQkpWS8yNYJKGvj7a8ohX3B4OE
 bknOAI6QtQDMbkshvp7urXj3xH4jwlxVG9jPFpqeYkOPc22TwoAtEIAsaeOG5fqjQNR0
 G1iRJqbDr6RTKAZ5ia+qHlr5SBac4fEKzyj/H/6BTsAlzmpX13MKQix8s2vieypiQ39+
 DRmfVk4CLvfHj+Dewta2mJerPpSjDFVJjdH38x3V4tbSkzFnD24bF0+nUo7h3cH0ycb/
 EfExwOKtolfZzZzpegRKMj/Z25aAnBhkJpC4x2FDMGNHMgkEpcJV+HCjuluE1o/96w1Q
 mMog==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6v5ESWbYzArA8zmeeeYWdYYE+UMxJResq5qooY7X5l2P+/0XBkrp9rJXDR2ozauv80w+xvpO+9NF/jymKMcYxlnCX
X-Gm-Message-State: AOJu0Yzws8OyiYgDAknFeU0Z1evLwUXTc0CChnZwfMPpnjk782IVlCZ/
 7RXuqyKWz2++5gHSOLSOT3X2Pf1eh8KFN+5tLu6KA364w1lSJ7sMevBCIXbCy3fSdms5SFQ0IWW
 eKrlIrdTrQU6ZyjNzFMN+32nUDczL5nH0BO/dejzbBeKg0E6BMA==
X-Received: by 2002:aa7:c1d9:0:b0:55d:30b2:983e with SMTP id
 d25-20020aa7c1d9000000b0055d30b2983emr7068116edp.4.1707822442417; 
 Tue, 13 Feb 2024 03:07:22 -0800 (PST)
X-Received: by 2002:aa7:c1d9:0:b0:55d:30b2:983e with SMTP id
 d25-20020aa7c1d9000000b0055d30b2983emr7068099edp.4.1707822442046; 
 Tue, 13 Feb 2024 03:07:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUuCy+uNoYo+2JbvOtWGmmBrZepaql9N90vm/DAV0zBOWikdoXUU6f106PBe1Edc18bZglqYY1Ci+R0C4KZbdV5qaCVFq6kcPaiw+gPcO74qB+mBzWZaYck9PuEBid7MXrG3RCDVYFXsShr4GZFNRh8qzNZ2b1UQcvfDc7F3bSNhMriaHPGiwbiVQ5w6HLNbFrVYsptqlCUVCpoeoKRL+d5PVGCRzJNQTCMP9lpgwPnhgdN9ktMwCTAdwU=
Received: from redhat.com ([2.52.146.238]) by smtp.gmail.com with ESMTPSA id
 c16-20020a056402121000b0056183062ef9sm3011247edw.91.2024.02.13.03.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:07:21 -0800 (PST)
Date: Tue, 13 Feb 2024 06:07:15 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com,
 clg@redhat.com, peter.maydell@linaro.org
Subject: Re: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
Message-ID: <20240213060544-mutt-send-email-mst@kernel.org>
References: <20240117132039.332273-1-eric.auger@redhat.com>
 <20240213044312-mutt-send-email-mst@kernel.org>
 <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
X-TUID: tLVN1c1I/UfS

On Tue, Feb 13, 2024 at 11:32:13AM +0100, Eric Auger wrote:
> Hi Michael,
> 
> On 2/13/24 10:43, Michael S. Tsirkin wrote:
> > On Wed, Jan 17, 2024 at 02:20:39PM +0100, Eric Auger wrote:
> >> We used to set default page_size_mask to qemu_target_page_mask() but
> >> with VFIO assignment it makes more sense to use the actual host page mask
> >> instead.
> >>
> >> So from now on qemu_real_host_page_mask() will be used as a default.
> >> To be able to migrate older code, we increase the vmstat version_id
> >> to 3 and if an older incoming v2 stream is detected we set the previous
> >> default value.
> >>
> >> The new default is well adapted to configs where host and guest have
> >> the same page size. This allows to fix hotplugging VFIO devices on a
> >> 64kB guest and a 64kB host. This test case has been failing before
> >> and even crashing qemu with hw_error("vfio: DMA mapping failed,
> >> unable to continue") in VFIO common). Indeed the hot-attached VFIO
> >> device would call memory_region_iommu_set_page_size_mask with 64kB
> >> mask whereas after the granule was frozen to 4kB on machine init done.
> >> Now this works. However the new default will prevent 4kB guest on
> >> 64kB host because the granule will be set to 64kB which would be
> >> larger than the guest page size. In that situation, the virtio-iommu
> >> driver fails on viommu_domain_finalise() with
> >> "granule 0x10000 larger than system page size 0x1000".
> >>
> >> The current limitation of global granule in the virtio-iommu
> >> should be removed and turned into per domain granule. But
> >> until we get this upgraded, this new default is probably
> >> better because I don't think anyone is currently interested in
> >> running a 4kB page size guest with virtio-iommu on a 64kB host.
> >> However supporting 64kB guest on 64kB host with virtio-iommu and
> >> VFIO looks a more important feature.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> >> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > What about migration compatibility? In particular, cross-version one?
> > Don't we need compat machinery for this?
> See below
> >
> >> ---
> >>
> >> v1 -> v2:
> >> - fixed 2 typos in the commit msg and added Jean's R-b and T-b
> >> ---
> >>  hw/virtio/virtio-iommu.c | 7 +++++--
> >>  1 file changed, 5 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> >> index 8a4bd933c6..ec2ba11d1d 100644
> >> --- a/hw/virtio/virtio-iommu.c
> >> +++ b/hw/virtio/virtio-iommu.c
> >> @@ -1313,7 +1313,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
> >>       * in vfio realize
> >>       */
> >>      s->config.bypass = s->boot_bypass;
> >> -    s->config.page_size_mask = qemu_target_page_mask();
> >> +    s->config.page_size_mask = qemu_real_host_page_mask();
> >>      s->config.input_range.end = UINT64_MAX;
> >>      s->config.domain_range.end = UINT32_MAX;
> >>      s->config.probe_size = VIOMMU_PROBE_SIZE;
> >> @@ -1491,13 +1491,16 @@ static int iommu_post_load(void *opaque, int version_id)
> >>       * still correct.
> >>       */
> >>      virtio_iommu_switch_address_space_all(s);
> >> +    if (version_id <= 2) {
> >> +        s->config.page_size_mask = qemu_target_page_mask();
> I tested migration from v2 -> v3 and the above code is overriding the
> new default by the older one.
> 
> Do you have an other concern?
> 
> Thanks
> 
> Eric



> >> +    }
> >>      return 0;
> >>  }
> >>  
> >>  static const VMStateDescription vmstate_virtio_iommu_device = {
> >>      .name = "virtio-iommu-device",
> >>      .minimum_version_id = 2,
> >> -    .version_id = 2,
> >> +    .version_id = 3,
> >>      .post_load = iommu_post_load,
> >>      .fields = (const VMStateField[]) {
> >>          VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 2,

Oh I missed the version change. But then migration  to older version
is completely broken isn't it? Old qemu can not handle version_id 3 at
all.


Generally, compat machinery is nicer than the old version hacks.


> >> -- 
> >> 2.41.0

