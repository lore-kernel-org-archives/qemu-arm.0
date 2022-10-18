Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3173916ejn;
        Tue, 18 Oct 2022 07:28:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7F1aoxaCSXBdjEFTamEnOnXGSz94O05DHKUlYztpxiYdNd47CzSgkIQXnsq6StpBLrgPZW
X-Received: by 2002:a05:622a:1b8e:b0:39c:ec9e:46c0 with SMTP id bp14-20020a05622a1b8e00b0039cec9e46c0mr2252978qtb.329.1666103293913;
        Tue, 18 Oct 2022 07:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666103293; cv=none;
        d=google.com; s=arc-20160816;
        b=nHMPIMN2jb5qU8M8yHdki2mPBxN745SjJCjFXjmGhtuPWrYTezv0Xv5tsQUvT/xfO+
         PBNsTbujxyUQABKZYTtKJMlMM2qnc/d98UEiwKj9BgS3TvcpxXg+287l4fisCJoQoV1g
         u3p6S68A7uMw9qD/6gaCQmMD6K1UZUDrxrGtNToz90GmkRA8NfnKkVnGTIysB0HMVeWH
         AqLAXZXzZ3zcw969p/xxC/ccqBxOmaPfvr2037DF48j3xB/8Q16KQvMqJEyZYlBl1sxG
         5mub0gX1XuveKbh3K2juA8UlPSRg5TzKuxY+KtP1H3zBkLqg0OKsTsjrb0nk+5fmAXjm
         dGog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=410OzJNn04fyP2bq9fmi0u1mwcJsI3OAG1rvBXCANSE=;
        b=0zU16MxZxQa+8xIiVhPMCqciOuiczVE99ydyU+f6LQ/7kLf5vbgq/E8K3Yy1hgrg2P
         UzDcghYtVXEcXQE+rBkVNOJBGQ84vhJ9pHB9exHLEKeTE6+7IBUVRXTxC5EmXFmx+0Zs
         Zkz0PKb+PsoPTbG2v3m++TeCB2TCda7/wkYukk3SKK23CnPCxUnL2pFe1yQw0juWMF2r
         zZp63d28ueTScYO6iMfSKT6I+Qea4gwbku806ZhESnStk+vSyTn+gprakS4KpLyuv9Gn
         9fz5mJ23rmXyt1U4S3fj2WK/U21t9QcaB8aKWw4JUUGvj8GVRJ03TWIOD4ZsowegW1P5
         DKaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M33K64s6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do10-20020a05620a2b0a00b006ee245aa4edsi7259672qkb.538.2022.10.18.07.28.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Oct 2022 07:28:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=M33K64s6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oknZl-0005qL-5C
	for alex.bennee@linaro.org; Tue, 18 Oct 2022 10:28:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oknWz-0005oE-Sr
 for qemu-arm@nongnu.org; Tue, 18 Oct 2022 10:25:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oknWw-0005zM-U3
 for qemu-arm@nongnu.org; Tue, 18 Oct 2022 10:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666103116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=410OzJNn04fyP2bq9fmi0u1mwcJsI3OAG1rvBXCANSE=;
 b=M33K64s6sT6/9tAbtA1yMg4d/nHbfq9fzAWcGk5i5m4yddeziWkyJHeKJkCS/rk1nlQ9Tt
 75lX/ytCnuzV8qVj3K5swhvEXTPDfBbMyEiopqAnI3zEeo3oKUQFxOKk9dqMrjcNmQGJgT
 JUc5orHZxv3Ymk9pQHFgPQlRfHQaS0s=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-378-Iyuk8qvjOK2lBvy7jt_9dQ-1; Tue, 18 Oct 2022 10:25:14 -0400
X-MC-Unique: Iyuk8qvjOK2lBvy7jt_9dQ-1
Received: by mail-il1-f199.google.com with SMTP id
 g13-20020a056e021e0d00b002fc57cd18e3so12350127ila.11
 for <qemu-arm@nongnu.org>; Tue, 18 Oct 2022 07:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=410OzJNn04fyP2bq9fmi0u1mwcJsI3OAG1rvBXCANSE=;
 b=KMFJssL/YnaLXdMsGNwauGHfIqgADKsJpUa5emcpWdvfAm14mYY3mlwUHjOcsjQ5Ow
 46mpi460mrKEN82Vx8hvirjBHo6Sba8LD40NsiKgLtuO0A8I5L/dHw42g2rSXk+QmRZj
 dQ6/bQd/kU2V6O2jKxE3D6+qTPT+CyGTh6do5V57Yemj3Q21TFHkPcbJk1iapUVm6aYl
 ZlQcQXkAO06VvYbZQqkyON+R6NEnvidR+VlEUwldFkMwLp3/ezai8Q4S2BHwMEIajuYu
 NCOVAX6IOcBsZ1YNeXtM2h3qhJReNZOoOEmhtLgRoXTHWYbF2e2jnc6Lldz1up6Eo3LL
 bB2w==
X-Gm-Message-State: ACrzQf3o2k06Fd5xn8Ai2+UgC3hrwulmbtIxloS5RVsailHKPulxBpVB
 lYM27RAJ6YvJAHqrCGhgrQYa43dHQz4K+nCICt62U+tzWgVJr6g+3j31q0IpcFLyC/cSDHvIWFr
 OAos/OUR9AAl6
X-Received: by 2002:a05:6e02:1aa8:b0:2fa:5239:c67a with SMTP id
 l8-20020a056e021aa800b002fa5239c67amr1862820ilv.166.1666103114002; 
 Tue, 18 Oct 2022 07:25:14 -0700 (PDT)
X-Received: by 2002:a05:6e02:1aa8:b0:2fa:5239:c67a with SMTP id
 l8-20020a056e021aa800b002fa5239c67amr1862805ilv.166.1666103113720; 
 Tue, 18 Oct 2022 07:25:13 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 y4-20020a92d804000000b002f66aacb98asm1019190ilm.70.2022.10.18.07.25.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Oct 2022 07:25:13 -0700 (PDT)
Date: Tue, 18 Oct 2022 10:25:09 -0400
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, eperezma@redhat.com, jasowang@redhat.com
Subject: Re: [PATCH] vhost: Warn if DEVIOTLB_UNMAP is not supported and ats
 is set
Message-ID: <Y063RZ4SkYcRM+SP@x1n>
References: <20221018122852.1185395-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221018122852.1185395-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lFs1dgD6ay22

Hi, Eric,

On Tue, Oct 18, 2022 at 02:28:52PM +0200, Eric Auger wrote:
> Since b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP
> IOMMUTLBNotificationType"), vhost attempts to register DEVIOTLB_UNMAP
> notifier. This latter is supported by the intel-iommu which supports
> device-iotlb if the corresponding option is set. Then 958ec334bca3
> ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support") allowed
> silent fallback to the legacy UNMAP notifier if the viommu does not
> support device iotlb.
> 
> Initially vhost/viommu integration was introduced with intel iommu
> assuming ats=on was set on virtio-pci device and device-iotlb was set
> on the intel iommu. vhost acts as an ATS capable device since it
> implements an IOTLB on kernel side. However translated transactions
> that hit the device IOTLB do not transit through the vIOMMU. So this
> requires a limited ATS support on viommu side.
> 
> However, in theory, if ats=on is set on a pci device, the
> viommu should support ATS for that device to work.

Pure question: what will happen if one ATS supported PCI device got plugged
into a system whose physical IOMMU does not support ATS?  Will ATS just be
ignored and the device keep working simply without ATS?

[1]

[...]

> @@ -760,8 +771,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
>      iommu->iommu_offset = section->offset_within_address_space -
>                            section->offset_within_region;
>      iommu->hdev = dev;
> -    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
> +    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, &err);
>      if (ret) {
> +        if (vhost_dev_ats_enabled(dev)) {
> +            error_reportf_err(err,
> +                              "vhost cannot register DEVIOTLB_UNMAP "
> +                              "although ATS is enabled, "
> +                              "fall back to legacy UNMAP notifier: ");

We want to use the warning message to either remind the user to (1) add the
dev-iotlb=on parameter for vIOMMU, or (2) drop the ats=on on device.  Am I
right?

As we've discussed - I remember Jason used to test with/without dev-iotlb
on vhost on Intel and dev-iotlb is faster on vt-d guest driver than without
it.  So that can make sense to me for (1).  I don't know whether it helps
for (2) because fundamentally it's the same question as [1] above, and
whether that's a legal configuration.

Thanks,

-- 
Peter Xu

