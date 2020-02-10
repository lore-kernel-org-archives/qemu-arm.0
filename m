Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4048404lfp;
        Mon, 10 Feb 2020 08:48:44 -0800 (PST)
X-Google-Smtp-Source: APXvYqz4J9tFO24SvFhgRTUYnBlmc2lBDSK877/vi62qFeTE1ViMocm9Hp7Bv/RibhNV/mRT6UDx
X-Received: by 2002:ac8:46d1:: with SMTP id h17mr10421408qto.309.1581353324642;
        Mon, 10 Feb 2020 08:48:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581353324; cv=none;
        d=google.com; s=arc-20160816;
        b=KUGWsrlZLsPIuHZNKYZMdTZoZz0f2gSog1yPc30FR4tGJx/ATn/WXj9FbSY8M/X58v
         mCfRTAHcUi2ZSIdfOM9Z4JwcnwaNtHEiueO1YQ+6j7KKfiDvLmWJawJHrjj/X87OmD2o
         1YGr0X8CRXmsMct8sTi+vnoBsmZDCdny/f3W+DcMRCQEaiLOaqI4Kzrvvglwx7CHY4qx
         R4DQGmUJtr3uEx7BWul8C6ejfEM1o3UfDjJar7OvRADPtKHUv4+/PrD15IIyoWf1r+jB
         9N6lASZX/+PhtdAr2gkViimzjGNZSHxsOUUyOMTtKfm6drvo7ZN1N4uEf5bBVxQrcmGN
         nugg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=P1vT7iDzp+N4qrYfTKdhYCOm3Fo8J0+gxRH4P3qKCj4=;
        b=ER/szrzaqG9VRGg7hszHgtMk3JgOo/UK3PiITVJyjIVDbt1Lf4tQcmScU60y+6yyOd
         ol2j3Q/ildAcqIr2Vf5cyjjoCAqr72dhz8YK60QHD1cKR1UyNMUl2p1eSo6ae0+2kL2N
         zHlliHnSZAaxTzpaJ0Ntw7VqGehNmBhBkdceDJOBdbhTjvw3dC1y8uLdrrH27fQGfqU0
         7O9VuCL8SyAGgY2kpsDwkfaKnfxDoJgzqKA8G4FU850In4ysoFwN3JpSGiTj1sbuLgaU
         70L74UfH4yrNSGct3MOeXPXiMGyNwox/W76OvDHauXzOzaUunOCVbWQxLHhhA2uPLPEq
         oiDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VVYv1IlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n21si277296qtp.21.2020.02.10.08.48.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 08:48:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VVYv1IlM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1CEm-0008Ev-2L
	for alex.bennee@linaro.org; Mon, 10 Feb 2020 11:48:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55929)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j1CEf-0008Ep-J3
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 11:48:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j1CEe-0004mA-9l
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 11:48:37 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49887
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j1CEe-0004kz-5Q
 for qemu-arm@nongnu.org; Mon, 10 Feb 2020 11:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581353315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P1vT7iDzp+N4qrYfTKdhYCOm3Fo8J0+gxRH4P3qKCj4=;
 b=VVYv1IlMoaQJNEH7yB1OAxzgq+gNAD1HXMM+dMQYtDb52ISZRXi3BXmzmdliLUXFtWkvCr
 +/6/Xcv7qU+6asuZ3TzSaqIx/+gnRD+TY5Tn0icNAiEkJEBR1eWEDuCsw5fvMkwrhsLJJD
 PzNoX8TPe/hH8wNMCTMBhTwfRtR9l7w=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-upcMLStTPUe3QXAHsTdc1Q-1; Mon, 10 Feb 2020 11:48:19 -0500
Received: by mail-qv1-f69.google.com with SMTP id v3so5342805qvm.2
 for <qemu-arm@nongnu.org>; Mon, 10 Feb 2020 08:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Pi4YybGUTTc+BjimB7b1zIGQESShXY5/8aaRQ8nPS/Q=;
 b=q75kMRN07YtmDMeqOhBL8snDwketdxn6oCuPn0s8unDpOHS4g34fKAGoLUdDltXbyK
 ixxn85+BLQKCeFPpwC0AJKxrCMkPPX/tV1v0hSDHvXRO7oMVI1f3oId7Xp39oPl3xA6L
 xDuA4cn2wcMRZiEY4flzt3EEGZzNIMmseCJav30o3wSlGAuo3kNQwSXPXRyQA4qZHT2B
 1DWsr53Nj2khpbGznbn/Ein0hJ8F/bjpk2TGhwXp1lIRhUAwAuxnJ4Y7s3SBENC58BGi
 21rvcb7oF6tNbW61+gTEKW8PJPlufoCamPyDRZqRxnnISog9Z0YQjrvmywWyTZAIhO/7
 k66A==
X-Gm-Message-State: APjAAAXrawCJCeEg3V9CHvpuRFtE5A+p9TAbLp6wlTkfWvzbLddmxer6
 8+XB4rzukz/18zMpmYAHPMxUXlKVjb9CPQqAtvnq3zek2SWt7KRW3u4uPBaKPgdhPOUy32PUGNb
 A/PrPGlb+x3fF
X-Received: by 2002:a37:a8ca:: with SMTP id r193mr2160498qke.335.1581353298535; 
 Mon, 10 Feb 2020 08:48:18 -0800 (PST)
X-Received: by 2002:a37:a8ca:: with SMTP id r193mr2160472qke.335.1581353298244; 
 Mon, 10 Feb 2020 08:48:18 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
 by smtp.gmail.com with ESMTPSA id x197sm401422qkb.28.2020.02.10.08.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 08:48:17 -0800 (PST)
Date: Mon, 10 Feb 2020 11:48:14 -0500
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
Message-ID: <20200210164814.GB964285@xz-x1>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
 <20200207100540.GA1999431@myrica>
 <20200207052405-mutt-send-email-mst@kernel.org>
 <20200207230405.GJ720553@xz-x1>
 <20200209155639-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200209155639-mutt-send-email-mst@kernel.org>
X-MC-Unique: upcMLStTPUe3QXAHsTdc1Q-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, quintela@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, Eric Auger <eric.auger@redhat.com>,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O/vkh3Dii6tp

On Sun, Feb 09, 2020 at 03:58:57PM -0500, Michael S. Tsirkin wrote:
> On Fri, Feb 07, 2020 at 06:04:05PM -0500, Peter Xu wrote:
> > On Fri, Feb 07, 2020 at 05:24:54AM -0500, Michael S. Tsirkin wrote:
> > > On Fri, Feb 07, 2020 at 11:05:40AM +0100, Jean-Philippe Brucker wrote=
:
> > > > Hi Eric,
> > > >=20
> > > > On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
> > > > > At the moment, the kernel only supports device tree
> > > > > integration of the virtio-iommu. DT bindings between the
> > > > > PCI root complex and the IOMMU must be created by the machine
> > > > > in conformance to:
> > > > >=20
> > > > > Documentation/devicetree/bindings/virtio/iommu.txt.
> > > > >=20
> > > > > To make sure the end-user is aware of this, force him to use the
> > > > > temporary device option "x-dt-binding" and also double check the
> > > > > machine has a hotplug handler for the virtio-iommu-pci device.
> > > > > This hotplug handler is in charge of creating those DT bindings.
> > > > >=20
> > > > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > > > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > > > [...]
> > > > > @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCI=
Proxy *vpci_dev, Error **errp)
> > > > >      VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
> > > > >      DeviceState *vdev =3D DEVICE(&dev->vdev);
> > > > > =20
> > > > > +    if (!dev->dt_binding) {
> > > > > +        error_setg(errp,
> > > > > +                   "Instantiation currently only is possible if =
the machine "
> > > > > +                   "creates device tree iommu-map bindings, ie. =
ACPI is not "
> > > > > +                   "yet supported");
> > > > > +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-bind=
ing\n");
> > > >=20
> > > > "use -device virtio-iommu-pci,x-dt-binding"?
> > > >=20
> > > > Can the option be safely removed as soon as we implement a topology
> > > > description for the remaining platforms?  Or will we need to carry =
it
> > > > forever for backward-compatibility (ie. ensure that an old command-=
line
> > > > invocation that contains this option still works)?
> > > >=20
> > > > Thanks,
> > > > Jean
> > >=20
> > > I'd worry that if we actually document it then users will come to
> > > depend on it for sure, even though it starts with x-.
> >=20
> > I thought x- parameters can be dropped directly with totally no
> > grarantee...  Otherwise how do we differenciate x- with the common
> > parameters, and how do we introduce remove-prone parameters?
> >=20
> > Thanks,
>=20
> It's all about not breaking users. Yes we document that x-
> interfaces are unstable. But that documentation is only=20
> good for well-behaved users such as libvirt. End-users
> tend not to read the docs and the subtleties of
> stable/unstable interface are lost on them, so we really must never
> actively ask end users to set an x- flag.

Ah I see the point.  Yes we should never suggest that, or at least
also mention that it's experimental and prone to change.  Thanks,

--=20
Peter Xu

