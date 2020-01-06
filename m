Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp23657259lff;
        Mon, 6 Jan 2020 09:59:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyt4Bk15wgJLAgOvMIFtPn3Vq8svwlIvAt9x0fBaXehyebxMc3dpa3y9qhuGHaGeD6njQKX
X-Received: by 2002:a05:6214:108a:: with SMTP id o10mr70631671qvr.246.1578333549802;
        Mon, 06 Jan 2020 09:59:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578333549; cv=none;
        d=google.com; s=arc-20160816;
        b=lPeWmdwP4t0Cik6ftJCcnLmSnTD8y3hsjiStU0/0TOVzKUcF0w3N/Geo5Qo6SEVfRW
         ZsFkfpdwxH+2X+e2+LsXPcf82SU4GVgH063vEk5gwMNidwZI/8QGv06s3SOYSp+noNap
         5/iuLPtGqh71Lj21E7QGiG4W8KM5AkvxejCugZKSZK2o8smSv7l+ABVdpHDPJh7TzOxT
         2vWzVKYW7vG4FM1UmjTba/cDDXvOSvyGffgIsiDadWzh8dak2g5olWyVb0lMcK6GP1Vk
         JBcgvRAFK3/uK53C7vKEArcqj6BlmjxFAFDfPM0XyZDLGejVcteV/qo6PZPJza9NHbsC
         bZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=AxXypkOtmxMjckzIw7oEd8YyuFImnIzPQegxQ5WOL5Q=;
        b=aOHqzEXwFbCU/pDZ8hFzMlJdfoFPwxz7Xszq/0d8qFoHe5oUjdRetleMSUF+PYiwA/
         hc7Ltu5RJaoq651ubSeHXTmKqHnGxAX35BCPgaWi/nR4zaxh+2FrArQ43jt1ddtCTvQ9
         EAd1mbKPj/6/wfBLRdbrLerCzK2+vsqYjo3fHdDjCCxJCXbrAkWtbwGJczvLl2oZuGqA
         J3UfVvveCnvyCYixTaLiX/x7EN6xM1mfGORfVeope9SfosZpoHP++2t0cJI2LUwHhVXn
         Povxs99wwCsR+z4auIH8hhRIBDyKNlS1/9XGuaBuUz+p7j/k5g2SdR134Yz2yLLloqBk
         d3+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E6XBUQpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si28737409qtc.78.2020.01.06.09.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jan 2020 09:59:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E6XBUQpq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioWej-00066X-2I
	for alex.bennee@linaro.org; Mon, 06 Jan 2020 12:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37827)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1ioWeX-00065A-Ps
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:58:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1ioWeW-0000nR-Bk
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:58:57 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54738
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1ioWeW-0000n1-7B
 for qemu-arm@nongnu.org; Mon, 06 Jan 2020 12:58:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578333535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxXypkOtmxMjckzIw7oEd8YyuFImnIzPQegxQ5WOL5Q=;
 b=E6XBUQpqPgZ16oGeZUhnQsAmlWmAtXjuSQYNwKjTVd8Q4OwvHI6vDjqm2EMOJbTAZISp+i
 1DVi0lMDl7tZDfeeXoudGSYLBfDOZToqFyHTHQkjixC4RhHmM6wFVVBMyTVaCcTryxfM02
 A4zFiX2SyYckS+HSon8O8VwBc89uFfM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-rBRV-2T0Ph6ys_mHaViXsQ-1; Mon, 06 Jan 2020 12:58:54 -0500
Received: by mail-qt1-f200.google.com with SMTP id m8so34738854qta.20
 for <qemu-arm@nongnu.org>; Mon, 06 Jan 2020 09:58:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=op9On8DDOer3l7W7JIrvHjaaFvX4kSx17qOLVhEXkZI=;
 b=YxHWCJYPhiozpp4kCWODbBNEOr5v8DncoqAijvxjoi/pt8rcaMbYFHt1NlBOXiOAXG
 mB5DwvmUGGOKgKsLTVDnIdT8K1GczWe5BnNsHIbmuGDYimYO3Q8pZeZ5g/KoBYDIO94s
 /JxoD5QonSr+RJq+Kmq+riC3INScumBJHGu/nsGX9UAnCdAw6TRPVA1uP4uVjgkyxSK8
 n2nJNeLDwIJYy+VmuAXMvf4H6Nk4RYUKTuWdUnl/81nlC7XL+a1/bwSxBcIIX5A8EATy
 JpMstAyvI/uKDAoHgqiMul0oi6yBW5QNO9hceYc4n5SrKNRv67CQ9CHW+j/Fq/rjBylA
 Oi3w==
X-Gm-Message-State: APjAAAU/YdnNt2yBYqU8iTIyx7MNsDorhdCvHMUff43QboOGnSCVddlM
 FHwmsG5WaGDAXdtSmVZGBAnPO76ojhTJpT1tWJpG4k1+obqb7JlVK3zuz3rjX3Z70DK/j4KPvn4
 tFUcd9xtMFDhB
X-Received: by 2002:ae9:e710:: with SMTP id m16mr76109955qka.242.1578333533868; 
 Mon, 06 Jan 2020 09:58:53 -0800 (PST)
X-Received: by 2002:ae9:e710:: with SMTP id m16mr76109935qka.242.1578333533504; 
 Mon, 06 Jan 2020 09:58:53 -0800 (PST)
Received: from xz-x1 ([104.156.64.74])
 by smtp.gmail.com with ESMTPSA id b42sm17721288qtb.36.2020.01.06.09.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 09:58:52 -0800 (PST)
Date: Mon, 6 Jan 2020 12:58:50 -0500
From: Peter Xu <peterx@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
Message-ID: <20200106175850.GC219677@xz-x1>
References: <20191122182943.4656-9-eric.auger@redhat.com>
 <20191210193342.GJ3352@xz-x1>
 <44c0041d-68ad-796f-16cc-4bab7ba0f164@redhat.com>
 <20191219133308.GA4246@xz-x1>
 <9d58b293-ada0-353e-bba2-ad1f538dfc62@redhat.com>
 <20191219144936.GB50561@xz-x1>
 <9ec9d0d5-062b-f96b-c72c-4d15865ff9a1@redhat.com>
 <20191220162642.GA2626852@myrica> <20191220165100.GA3780@xz-x1>
 <20200106170634.GF2062@myrica>
MIME-Version: 1.0
In-Reply-To: <20200106170634.GF2062@myrica>
X-MC-Unique: rBRV-2T0Ph6ys_mHaViXsQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
X-TUID: kJMfKwQA0mGe

On Mon, Jan 06, 2020 at 06:06:34PM +0100, Jean-Philippe Brucker wrote:
> On Fri, Dec 20, 2019 at 11:51:00AM -0500, Peter Xu wrote:
> > On Fri, Dec 20, 2019 at 05:26:42PM +0100, Jean-Philippe Brucker wrote:
> > > There is at the virtio transport level: the driver sets status to
> > > FEATURES_OK once it accepted the feature bits, and to DRIVER_OK once =
its
> > > fully operational. The virtio-iommu spec says:
> > >=20
> > >   If the driver does not accept the VIRTIO_IOMMU_F_BYPASS feature, th=
e
> > >   device SHOULD NOT let endpoints access the guest-physical address s=
pace.
> > >=20
> > > So before features negotiation, there is no access. Afterwards it dep=
ends
> > > if the VIRTIO_IOMMU_F_BYPASS has been accepted by the driver.
> >=20
> > Before enabling virtio-iommu device, should we still let the devices
> > to access the whole system address space?  I believe that's at least
> > what Intel IOMMUs are doing.  From code-wise, its:
> >=20
> >     if (likely(s->dmar_enabled)) {
> >         success =3D vtd_do_iommu_translate(vtd_as, vtd_as->bus, vtd_as-=
>devfn,
> >                                          addr, flag & IOMMU_WO, &iotlb)=
;
> >     } else {
> >         /* DMAR disabled, passthrough, use 4k-page*/
> >         iotlb.iova =3D addr & VTD_PAGE_MASK_4K;
> >         iotlb.translated_addr =3D addr & VTD_PAGE_MASK_4K;
> >         iotlb.addr_mask =3D ~VTD_PAGE_MASK_4K;
> >         iotlb.perm =3D IOMMU_RW;
> >         success =3D true;
> >     }
> >=20
> > From hardware-wise, an IOMMU should be close to transparent if you
> > never enable it, imho.
>=20
> For hardware that's not necessarily the best choice. As cited in my
> previous reply it has been shown to introduce vulnerabilities since
> malicious devices can DMA during boot, before the OS takes control of the
> IOMMU. The Arm SMMU allows an implementation to adopt a deny policy by
> default.

I see.  But then how to read a sector from the block to at least boot
an OS if we use a default-deny policy?  Does it still need a mapping
that is established somehow by someone before hand?

>=20
> > Otherwise I'm confused on how a guest (with virtio-iommu) could boot
> > with a normal BIOS that does not contain a virtio-iommu driver.  For
> > example, what if the BIOS needs to read some block sectors (as you
> > mentioned)?
>=20
> Ideally we should aim at supporting the device in both the BIOS and the
> OS. Failing that, there should at least be a way to instantiate a
> virtio-iommu device that is blocking by default, that cannot be bypassed
> unless the controlling software decides to allow it. Could the bypass
> policy be a command-line option to the virtio-iommu device?
>=20
> [...]
> > > Yes bypass mode assumes that devices and drivers aren't malicious, an=
d the
> > > IOMMU is only used for things like assigning devices to guest userspa=
ce,
> > > or having large contiguous DMA buffers.
> >=20
> > Yes I agree.  However again when the BYPASS flag was introduced, have
> > you thought of introducing that flag per-device?  IMHO that could be
> > better because you have a finer granularity on controlling all these,
> > so you'll be able to reject malicious devices but at the meantime
> > grant permission to trusted devices.
>=20
> At the moment that per-device behavior can be emulated by sending an
> ATTACH request followed by identity MAP. It could be a little more
> efficient to add a "bypass" flag to the ATTACH request and avoid setting
> up the identity mapping manually, since the device then wouldn't need to
> look up the mapping on translation, but I don't know how much it would
> improve performance. The device could also cache the fact that the addres=
s
> space is identity-mapped, for the same result. The domain lookup has to
> happen in any case, so you can never get the full iommu-free performance
> with these mechanisms.

IMHO it's really a matter of whether virtio-iommu wants to have a
device layer besides the domain layer for the initial versions (just
like VT-d has a device context, then it points to a domain, so it has
these two layers).  But I agree for the bypass feature it should work
(though trying to detect "a device is put into an identital domain is
bypassed" is still a bit tricky to me).  And after all virtio-iommu is
always extensible when needs come.

Thanks,

--=20
Peter Xu

