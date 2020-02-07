Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp405605lfp;
        Fri, 7 Feb 2020 02:25:39 -0800 (PST)
X-Google-Smtp-Source: APXvYqxL5RFprQ4qL2dDVgAUkwxyfhaOdvLUzi+djpebegYJh+sABZF27M8lyVueWExB9mhRgYMR
X-Received: by 2002:a37:4894:: with SMTP id v142mr6346608qka.220.1581071139819;
        Fri, 07 Feb 2020 02:25:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581071139; cv=none;
        d=google.com; s=arc-20160816;
        b=h6NMtv/hVKJneMo4SEe6Dqd4fMoq3ccNH/X+L4w0D10+wx+wiwlqRDWTI6x+AYPkUG
         ctmjMq+1rMy2cO1hvjYlMIorDO1iusYSrBnC1hsY9DSiCpGIEXT+IDhgEjWvStHTAc/d
         GGIRGroQYdOrfCIo1ycy+H1dMAubmwmpHToaked8XNAlyTXDNHYeuyNrLGo4Ampc6v9P
         Hhr/v1ry6PMbSort4X3wd9o2AhPDCmYJ3SC8yG3+nRvw9TwI3g4LVDKgwzR6Ef5BhDua
         LhNpWHN+bLahYNNpJcx1warqDuRJDhPucDJm6SGFoUXDy8ochsR0e47ZCyVys0MXB1oi
         bWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=bfrfUu7V3V/FOij6s8JiSmeD5eRiBLXYQoPDS4gYMVA=;
        b=LU/wUAzb1qe6P+aZtRBet7P3RMg+aiOpZhaeAHS1sD/phgvD+OEQa55o7TNiiepUzT
         OEdsmdqvM+A2dnUFrGjj0AyB8D+pahXqc/JOgVupF04rX7rn9CtB5mXalbLRKqz5+8zv
         oIHgsvsv5l0empI5nmvA0+67y0CtqLbsKLJO9ivXbuZWOCHRCSnCJz+Re332K32b1FTd
         iqsgDHPbM/NWcEFUACuyeGPcbfoqDpavxdmKZ/S4Nvgkiywaqbywwr45NimlJFvjaxFB
         gg3n7J5bIPZkixi0IZb2zS4nDRlyiQYDDR+kjFYE9Mk+LV66qbftgCvIMX8rAsnSFcGx
         d28w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M4GWs76R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v27si966324qvf.114.2020.02.07.02.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 02:25:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=M4GWs76R;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j00pP-0004D9-8x
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 05:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48941)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1j00or-0003js-Ig
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:25:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1j00oq-00052h-Dd
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:25:05 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56463
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1j00oq-00051v-9O
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 05:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfrfUu7V3V/FOij6s8JiSmeD5eRiBLXYQoPDS4gYMVA=;
 b=M4GWs76RJK6v4RzZ9eDuhrv1+MpJlGUpehtdC9eTUfQ9TVTji7+JZ6mPD7QWd7ijbVZJ0L
 81dK9/QfJvKYbEPuLzjCFl3ydp6rkb+RVHOVRAL20O7tTaqZrVjXhLcC8ekFNAxPtVYpfN
 b9gTwtzZoZuKuqMJk6AhZQznUO2aKjU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-WmmggItEMOy7sASqfkpUHQ-1; Fri, 07 Feb 2020 05:25:00 -0500
Received: by mail-qt1-f198.google.com with SMTP id g26so1331940qts.16
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 02:25:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KkfgzxJ5hnk0K/gG/Ng4whBs+Zv4G8xFGcL8nZlr36A=;
 b=iQeZbuWVa80/IKd43FPrdZN8Fo79D6Epl7ir9kH4Sgy3RTJ+gUtBj/zviXhAMSOaJE
 WdqhVI66apMcT/5zqerw65cbv3UQSv7wWDpLGWONOA8OdnIFk/hGOu9VTxVyNWYFBZZp
 JUQpcwWYoYRqq/C8xI37sC8ZD7DhzxVJTuzGgAqoWh3xxHnyTCCM9JjwR6GYlDWRCvWv
 OgfDXSYPVbCvP6OoRX4Grv8Kar721jHh79zfVU2MzSDsiNkd8pazn9blA95fA1SOqZLv
 nf1PmCIjZ9aF7zM60/ndsaIGFEJbqHk3CobhaqWoqDTIk37ffiASYBGWpLfLbfpfOJMQ
 FoKQ==
X-Gm-Message-State: APjAAAUwp9ZYt16+YYgYAmJxxPn0l+U8JGRmPi2lVqzr/O80997PMC/k
 RutV3mOvHs0g37lXiFxMexNkkSCbM+JBGCAGeYQ8BWF/yCwGFLcSqimSJKm6fM8d70aKPKJkIl4
 DSLDpUnV3hXClK4s=
X-Received: by 2002:a0c:ef0f:: with SMTP id t15mr6209961qvr.123.1581071099998; 
 Fri, 07 Feb 2020 02:24:59 -0800 (PST)
X-Received: by 2002:a0c:ef0f:: with SMTP id t15mr6209941qvr.123.1581071099781; 
 Fri, 07 Feb 2020 02:24:59 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id q7sm1069328qkc.43.2020.02.07.02.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 02:24:59 -0800 (PST)
Date: Fri, 7 Feb 2020 05:24:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
Message-ID: <20200207052405-mutt-send-email-mst@kernel.org>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
 <20200207100540.GA1999431@myrica>
MIME-Version: 1.0
In-Reply-To: <20200207100540.GA1999431@myrica>
X-MC-Unique: WmmggItEMOy7sASqfkpUHQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com, Eric Auger <eric.auger@redhat.com>,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tFPbfdGA65aC

On Fri, Feb 07, 2020 at 11:05:40AM +0100, Jean-Philippe Brucker wrote:
> Hi Eric,
>=20
> On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
> > At the moment, the kernel only supports device tree
> > integration of the virtio-iommu. DT bindings between the
> > PCI root complex and the IOMMU must be created by the machine
> > in conformance to:
> >=20
> > Documentation/devicetree/bindings/virtio/iommu.txt.
> >=20
> > To make sure the end-user is aware of this, force him to use the
> > temporary device option "x-dt-binding" and also double check the
> > machine has a hotplug handler for the virtio-iommu-pci device.
> > This hotplug handler is in charge of creating those DT bindings.
> >=20
> > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> [...]
> > @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy =
*vpci_dev, Error **errp)
> >      VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
> >      DeviceState *vdev =3D DEVICE(&dev->vdev);
> > =20
> > +    if (!dev->dt_binding) {
> > +        error_setg(errp,
> > +                   "Instantiation currently only is possible if the ma=
chine "
> > +                   "creates device tree iommu-map bindings, ie. ACPI i=
s not "
> > +                   "yet supported");
> > +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\n"=
);
>=20
> "use -device virtio-iommu-pci,x-dt-binding"?
>=20
> Can the option be safely removed as soon as we implement a topology
> description for the remaining platforms?  Or will we need to carry it
> forever for backward-compatibility (ie. ensure that an old command-line
> invocation that contains this option still works)?
>=20
> Thanks,
> Jean

I'd worry that if we actually document it then users will come to
depend on it for sure, even though it starts with x-.

--=20
MST

