Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3851850lff;
        Fri, 20 Dec 2019 08:51:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqygz8lsWBUNfSJlbbVMVVvV5F8+vw0i0VMpIT1Rk/B9UvCMr3fMqZFCE5XRfBi+7vJMu+ob
X-Received: by 2002:aca:5303:: with SMTP id h3mr4053288oib.109.1576860686078;
        Fri, 20 Dec 2019 08:51:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576860686; cv=none;
        d=google.com; s=arc-20160816;
        b=GkawBwZugPUx0SE4HE/t5W/34MjLyTTkVbVMvqiab4A0gLPc1pvfio1CLZtz/bdVrw
         OSjOg8LsADMr++Bzw6ThVnaH8qIfCvDWeB5tTmBuQo0VVnHa4LSgXYt6KAQ5iZNkjg4r
         kvlsC1HqQHXC2Cz+Byd2Wv/eanWtWpFXpKQnQoW+bCW1LQr7P5JHQ4uFQDKidyXWZ5Zs
         Epw94Cn/y7gdgshIWMQDOJew0cmtIRk/ho0JLf+9id59ygPJdfbChVwoiKJ7OfJUWjkM
         OD2d1JvUa23odF4EfuDl7RA44ixqAhRbs1vrqmvuUMBUrywM66rM+4u9pq+9Vzc2iVOq
         cEZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=fgDeFh4F3QrW0JWVNUfCDpbGQwy2NPJTa62L0c+x87Q=;
        b=FIQjqEobjhmp/+0mxC2bg0SeNsI7G7DZwkF4P2+RAbuCKNUgGCFFFD86i71qXKTd7X
         8SRPi+UqvfyLI9lU67cFuv256SzD/rBx7yB1e3KwKSzbSwGJrQsrXcazh95wi2LzG7DP
         8oplPhySu2Rg+dHiML2v7l2kRarKTJg8GkJoZtmhgHPF/tdJC6ngdW6s2JAIiExWekgl
         qYBtQf5LhvZd18XXRKtu/hlBOlI13nI5+DnKlgBxcLsA5j0kP+BQ7f0MxD9zX564O0jq
         a3PJaBCvDtsmDrb/nUnABcQYbWJNhSWfR5ZAJAiFcO6PvznDswyd60LnZLRI9+BXaYAM
         ZxsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RAhaKftn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si4658522oic.225.2019.12.20.08.51.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Dec 2019 08:51:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RAhaKftn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iiLUr-0004xa-7h
	for alex.bennee@linaro.org; Fri, 20 Dec 2019 11:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58012)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iiLUd-0004wz-Du
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 11:51:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iiLUb-0004cm-2j
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 11:51:10 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48268
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iiLUa-0004ac-Ux
 for qemu-arm@nongnu.org; Fri, 20 Dec 2019 11:51:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576860665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgDeFh4F3QrW0JWVNUfCDpbGQwy2NPJTa62L0c+x87Q=;
 b=RAhaKftn/CbE+XljeBS3Mi/epoax9zeSvBdarztp/xJ1MfFREoZaFO4JuRK5HIgeoxcY21
 aNGOG9jvsIEeG0fmNniHe773KcG9/JV44QbJfn+PhhqGMD0LGKSaJIQgYLXy+Io1+hUnch
 Cg63QOjtrKXk9rrWT6t50daa+O7r+Wg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-MDNAwYF_Pj-n3VqHm1slzg-1; Fri, 20 Dec 2019 11:51:04 -0500
Received: by mail-qk1-f199.google.com with SMTP id w64so6321330qka.3
 for <qemu-arm@nongnu.org>; Fri, 20 Dec 2019 08:51:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dqOt5cZrKPUthXykYWOf9AFQe5eQNRQAfjnOmuE7SuI=;
 b=YGFf48Vz4dLXncT28SmuBsqlL0Fasi/b1S0WNcbVGg32U7Bh4+La9fByJ1eVJ29+54
 zZjFdJVvwUayceU2PjFOIq7B8IXyHN+n8R37+YZRh+S6S02XmoYI5usOET8vcVRaqBBF
 ePmu5snjmwrQOFaNDRU56shC8tcIzoPRW+msDcAnNy/28Ze+w9SjE+b84ZNvYqoNzy2m
 BhjwS5DTdA0D01W9OZyV0yQFSLMCDvk/exOQlp4aLN92/OqhKQDIX2hpguSPQBka6xJD
 y5fXXNzmpMhpD/UF4MnQOcEHBsOtKDNVWlStHYA/S6NuUq4Hsin9ir03PRoFIRhUJcZM
 W8HQ==
X-Gm-Message-State: APjAAAWdvy0TGERTALATtFsRe9mBsNdG0Ld5lEntRiDxU+d4hPSK79rR
 5egiKROm30s8kMWRRc7AtKdxDAaCMMU+26yB/ArhOc8TxAF60uTQGDTUp0AQQVFvIH0zuWyhSeM
 ia/Y4meIhAN+h
X-Received: by 2002:ac8:64a:: with SMTP id e10mr12270078qth.292.1576860663546; 
 Fri, 20 Dec 2019 08:51:03 -0800 (PST)
X-Received: by 2002:ac8:64a:: with SMTP id e10mr12270058qth.292.1576860663224; 
 Fri, 20 Dec 2019 08:51:03 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id 2sm3002867qkv.98.2019.12.20.08.51.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 08:51:02 -0800 (PST)
Date: Fri, 20 Dec 2019 11:51:00 -0500
From: Peter Xu <peterx@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
Message-ID: <20191220165100.GA3780@xz-x1>
References: <20191122182943.4656-1-eric.auger@redhat.com>
 <20191122182943.4656-9-eric.auger@redhat.com>
 <20191210193342.GJ3352@xz-x1>
 <44c0041d-68ad-796f-16cc-4bab7ba0f164@redhat.com>
 <20191219133308.GA4246@xz-x1>
 <9d58b293-ada0-353e-bba2-ad1f538dfc62@redhat.com>
 <20191219144936.GB50561@xz-x1>
 <9ec9d0d5-062b-f96b-c72c-4d15865ff9a1@redhat.com>
 <20191220162642.GA2626852@myrica>
MIME-Version: 1.0
In-Reply-To: <20191220162642.GA2626852@myrica>
X-MC-Unique: MDNAwYF_Pj-n3VqHm1slzg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
 quintela@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 Auger Eric <eric.auger@redhat.com>, bharatb.linux@gmail.com,
 qemu-arm@nongnu.org, dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BaQ52cAQETr7

On Fri, Dec 20, 2019 at 05:26:42PM +0100, Jean-Philippe Brucker wrote:
> There is at the virtio transport level: the driver sets status to
> FEATURES_OK once it accepted the feature bits, and to DRIVER_OK once its
> fully operational. The virtio-iommu spec says:
>=20
>   If the driver does not accept the VIRTIO_IOMMU_F_BYPASS feature, the
>   device SHOULD NOT let endpoints access the guest-physical address space=
.
>=20
> So before features negotiation, there is no access. Afterwards it depends
> if the VIRTIO_IOMMU_F_BYPASS has been accepted by the driver.

Before enabling virtio-iommu device, should we still let the devices
to access the whole system address space?  I believe that's at least
what Intel IOMMUs are doing.  From code-wise, its:

    if (likely(s->dmar_enabled)) {
        success =3D vtd_do_iommu_translate(vtd_as, vtd_as->bus, vtd_as->dev=
fn,
                                         addr, flag & IOMMU_WO, &iotlb);
    } else {
        /* DMAR disabled, passthrough, use 4k-page*/
        iotlb.iova =3D addr & VTD_PAGE_MASK_4K;
        iotlb.translated_addr =3D addr & VTD_PAGE_MASK_4K;
        iotlb.addr_mask =3D ~VTD_PAGE_MASK_4K;
        iotlb.perm =3D IOMMU_RW;
        success =3D true;
    }

From hardware-wise, an IOMMU should be close to transparent if you
never enable it, imho.

Otherwise I'm confused on how a guest (with virtio-iommu) could boot
with a normal BIOS that does not contain a virtio-iommu driver.  For
example, what if the BIOS needs to read some block sectors (as you
mentioned)?

> > >   - This flag is a must for all virtio-iommu emulation, right?
> > >     (otherwise I can't see how system bootstraps..)
>=20
> What do you mean by system bootstrap?

Sorry, I meant when the system boots before the OS.

>=20
> One thing I've been wondering, and may be related, is how to handle a
> bootloader that wants to read for example an initrd from a virtio-block
> device that's behind the IOMMU.

My understanding is that virtio devices are special in that they can
use the VIRTIO_F_IOMMU_PLATFORM flag to bypass any vIOMMU (though, I
don't think that'll work when virtio hardwares comes to the
world.. because they can't really bypass the IOMMU hardware).

> Either we allow the device to let any DMA
> bypass the device until FEATURES_OK, which is a source of vulnerabilities
> [1], or we have to implement some support for the virtio-iommu in the
> BIOS. Again the F_BYPASS bit would help for this, since all the BIOS has
> to do is set it on boot. However, F_BYPASS is optional, and more complex
> support is needed for setting up identity mappings.
>=20
> [1] See "IOMMU protection against I/O attacks: a vulnerability and a proo=
f
> of concept" by Morgan et al, where a malicious device bypassing the IOMMU
> overwrites the IOMMU configuration as it is being created by the OS.
> Arguably we're not too concerned about malicious devices at the moment,
> but I'm not comfortable relaxing this.
>=20
> > >   - Should this flag be gone right after OS starts (otherwise I think
> > >     we still have the issue that any malicious device can be seen as
> > >     in PT mode as default)?  How is that done?
>=20
> Yes bypass mode assumes that devices and drivers aren't malicious, and th=
e
> IOMMU is only used for things like assigning devices to guest userspace,
> or having large contiguous DMA buffers.

Yes I agree.  However again when the BYPASS flag was introduced, have
you thought of introducing that flag per-device?  IMHO that could be
better because you have a finer granularity on controlling all these,
so you'll be able to reject malicious devices but at the meantime
grant permission to trusted devices.

Thanks,

--=20
Peter Xu

