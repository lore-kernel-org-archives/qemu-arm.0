Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1405074njb;
        Thu, 6 Feb 2025 00:55:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXThj31P4AoJGc2J2vOnjq6ZmeAQqxdAudMlKNBQXRxJEtH24ak+bjclOrXlYViAEBOSgPJcZ/sSQ0FsA==@linaro.org
X-Google-Smtp-Source: AGHT+IGBbT/3jzEHVu+qY9vWvtH04yxIHlPnYrEk+lUQCMA9/4U0bbJeYm+9O4gpyvIuCGrL43zK
X-Received: by 2002:a05:622a:1343:b0:466:b122:5138 with SMTP id d75a77b69052e-470281a2f9cmr65620741cf.17.1738832127630;
        Thu, 06 Feb 2025 00:55:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738832127; cv=none;
        d=google.com; s=arc-20240605;
        b=V9rfAvZerJpM3o3jIlw8jQBzpA/FA4U8gQ2vJe3RHImWiZk5HVOVTx++zjl2YmMon9
         TN5XtjQIYUQyJzhil0RR2AG3ffzyWxRki2TvXX6RfMkAJPHvttNPbEkJpxGtUjYuSfQi
         +Kv+aG4Ctmo7qF3Bk6+6l2iRwzkxMbukqzlWVGorkK7NF1iPORvpyWPmb3iNqOnZA9F7
         0DrbRSVIOMKqxl0McLiZAU5PWlZUVpMVeVHObWnq0FXTDkX9oi/XNKHtxjakSzMV0OAV
         Z8qX6lHMVERx9SH0jQWT2RKJD1e7c3JRp0/EjukzNlhEdFrdlGTpASKDBP+UHnkSwToQ
         5VkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=/7DMP8RCz4MtWOgriPg2r75pBWlGZv8A4jVtyT4iTTM=;
        fh=YerOcnbmId3tuKElxsdoczYOJ/wCtg3QoI8Tyifx8SA=;
        b=dLxPeV6vBdo60fs02Vc5dTBhWGxCo15Ny33yjkbT5RKYFLN+ORlM0pOjwn/kD+NyU7
         bPOV32sxjlAiaQZr5ZBNKRcxe4hB18k9tuLbdKlzJVVYhmasrkZ1+Ak5szhToGtPMGxD
         upsU2b8xHp6ixvg7uxdlwDC6QWF5oynHuAcQUSrgZXUZSd1EjXmU9QTz9Jce4N3LwoF1
         CGg1NOTHj7c8F1nZkesnL2xQd55D3UHpQfCIdVM9oX6d1Cn8ZjffzW9INUXDCW65FJJ4
         CkLtEP+VhAycQuXgMC5BmhPbBM+uUk4Js/OkONkIoeV7HpRj69c4kW4P5n7RtVqZ9Eak
         GkyQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KzlikL7N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bc255asi6924571cf.528.2025.02.06.00.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 00:55:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KzlikL7N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfxfI-0001PO-LG; Thu, 06 Feb 2025 03:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tfxfA-0001Nt-OW
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 03:55:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1tfxf8-0002q3-Mn
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 03:55:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738832104;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7DMP8RCz4MtWOgriPg2r75pBWlGZv8A4jVtyT4iTTM=;
 b=KzlikL7NligxBy+tws/ONDnB7zjv0AvcY2IMjglF+XQIZRGGjvdtY/GLqP1xzsms/HwQDB
 KT8WEqhVV0Vr9DYb+wh3Fn80cqrUN0GpaW0eTEVgUJl2+dUs7LHqkHC6EIPZF9rJSalD/M
 HIMHg79uXqGSpkMxNaSHnpFoeqq2wfE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-tJbHVk_wPJapAgkX5lJ0Nw-1; Thu,
 06 Feb 2025 03:54:58 -0500
X-MC-Unique: tJbHVk_wPJapAgkX5lJ0Nw-1
X-Mimecast-MFC-AGG-ID: tJbHVk_wPJapAgkX5lJ0Nw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C70941955DDD; Thu,  6 Feb 2025 08:54:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.33])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9027D1800570; Thu,  6 Feb 2025 08:54:50 +0000 (UTC)
Date: Thu, 6 Feb 2025 08:54:46 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nathan Chen <nathanc@nvidia.com>
Cc: eric.auger@redhat.com, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>, Linuxarm <linuxarm@huawei.com>,
 "Wangzhou (B)" <wangzhou1@hisilicon.com>,
 jiangkunkun <jiangkunkun@huawei.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "zhangfei.gao@linaro.org" <zhangfei.gao@linaro.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 0/5] hw/arm/virt: Add support for user-creatable
 nested SMMUv3
Message-ID: <Z6R41tYpGR-mofbT@redhat.com>
References: <20241108125242.60136-1-shameerali.kolothum.thodi@huawei.com>
 <Z5uiGnAxUf4jXTEI@redhat.com>
 <7ecabe74e0514367baf28d67675e5db8@huawei.com>
 <fc91e1a798324390b2a556fae5d40f46@huawei.com>
 <20250131142404.GP5556@nvidia.com>
 <3efcea1171af4b2f81be842f2c55fe51@huawei.com>
 <20250131145411.GR5556@nvidia.com>
 <20039bbc40df453a8a41a863d74b9ff9@huawei.com>
 <c292ab40-3620-4e72-b043-4e3cbd7fd297@redhat.com>
 <5709592d-cd1c-4894-a1d4-c0c4c61a2e07@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5709592d-cd1c-4894-a1d4-c0c4c61a2e07@nvidia.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Yey10ZZDS5an

On Wed, Feb 05, 2025 at 12:53:42PM -0800, Nathan Chen wrote:
> 
> 
> On 1/31/2025 8:08 AM, Eric Auger wrote:
> > > > > > > And Qemu does some checking to make sure that the device is indeed
> > > > > > associated
> > > > > > > with the specified phys-smmuv3.  This can be done going through the
> > > > > > sysfs path checking
> > > > > > > which is what I guess libvirt is currently doing to populate the
> > > > topology.
> > > > > > So basically
> > > > > > > Qemu is just replicating that to validate again.
> > > > > > I would prefer that iommufd users not have to go out to sysfs..
> > > > > > 
> > > > > > > Or another option is extending the IOMMU_GET_HW_INFO IOCTL to
> > > > > > return the phys
> > > > > > > smmuv3 base address which can avoid going through the sysfs.
> > > > > > It also doesn't seem great to expose a physical address. But we could
> > > > > > have an 'iommu instance id' that was a unique small integer?
> > > > > Ok. But how the user space can map that to the device?
> > > > Why does it need to?
> > > > 
> > > > libvirt picks some label for the vsmmu instance, it doesn't matter
> > > > what the string is.
> > > > 
> > > > qemu validates that all of the vsmmu instances are only linked to PCI
> > > > device that have the same iommu ID. This is already happening in the
> > > > kernel, it will fail attaches to mismatched instances.
> > > > 
> > > > Nothing further is needed?
> > > -device pxb-pcie,id=pcie.1,bus_nr=8,bus=pcie.0 \
> > > -device pcie-root-port,id=pcie.port1,bus=pcie.1,chassis=1 \
> > > -device arm-smmuv3-accel,bus=pcie.1,id=smmuv1 \
> > I don't get what is the point of adding such an id if it is not
> > referenced anywhere?
> > 
> > Eric
> 
> Daniel mentions that the host-to-guest SMMU pairing must be chosen such that
> it makes conceptual sense w.r.t. the guest NUMA to host NUMA pairing [0].
> The current implementation allows for incorrect host to guest numa node
> pairings, e.g. pSMMU has affinity to host numa node 0, but it’s paired with
> a vSMMU paired with a guest numa node pinned to host numa node 1.
> 
> By specifying the host SMMU id, we can explicitly pair a host SMMU with a
> guest SMMU associated with the correct PXB NUMA node, vs. implying the
> host-to-guest SMMU pairing based on what devices are attached to the PXB.
> While it would not completely prevent the incorrect pSMMU/vSMMU pairing
> w.r.t. host to guest numa node pairings, specifying the pSMMU id would make
> the implications of host to guest numa node pairings more clear when
> specifying a vSMMU instance.

You've not specified any host SMMU id in the above CLI args though,
only the PXB association.

It needs something like

 -device arm-smmuv3-accel,bus=pcie.1,id=smmuv1,host-smmu=XXXXX

where 'XXXX' is some value to identify the host SMMU

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

