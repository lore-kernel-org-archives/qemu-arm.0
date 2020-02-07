Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1114782lfp;
        Fri, 7 Feb 2020 15:04:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyts1gvDahrIBZAF//SghuJE2qXuHT7eJKbIFxJ8vUOthtXQTKS691evrpIPu+/PVyaMcTu
X-Received: by 2002:a05:620a:2047:: with SMTP id d7mr1255885qka.167.1581116665270;
        Fri, 07 Feb 2020 15:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581116665; cv=none;
        d=google.com; s=arc-20160816;
        b=LTLeWVF/dKCg/h3YU9zX7BUa8YezOvh9owCIFhGK3JnPj93kv/MLBjqtTLh8RXPhQt
         i1ooQJ8RrbPsu/GKlJg7ZGSKywgrWReePE+dBMnlFT1vaEw7qApvTV+A4fQI8fp9K168
         kYFX5mFmpil1rbxSQVD6bth6n+owSnBybKdtCBdEBjLnoggIpthlvFzjfS9EXNKGTPlQ
         XiOn25Y3uJXT5NGPuxegbL883CP2qJGx4g25olw7dEzxs3ZIR7ydZvlFy80jfrapLTFS
         kAWkdAeA9wRgSTslTJrXQwaTjTv5LysC95HoxHVrH93pklP9RnasQIfps1Im38FfeyAa
         taWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=QbIFO7Oxc9JmMQe9oFXeh2qJJYelsG+d0X1l7OckJLI=;
        b=LNvVlB7jD3V4LpM0MO75wVewxbQkaBxmt2ZBBvtnH1R3f944Z/3hyDACYEVa4JKns0
         4jeCN80LbSEA+pwgHAUssoE0sSTDvwgRrWg2WAsCKKXjmzHrPkssr5Z+pRDvxH3hQuJw
         rgT4gWCg0ylIVxPYfe8bPVLMhn3fmkxtANSJZa5g014rAXPIVZ6aaduiU9mqs23qAWeB
         c+XAFptKrK+ss85Qs2q1nHkIVd5pI7Qd+2hhSo1Uu11iNGXFDl+eaP5WNvcGh+WsO5KN
         jHwZnrh4v54L2sf5FsBdx9bh5TDuImV9yqQcXO9LLr4EhmW6Gl4lwVjg7d4WuxASI4kD
         15dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cyW4qco6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1si62169qvw.47.2020.02.07.15.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 15:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cyW4qco6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0Cfg-0004j5-NY
	for alex.bennee@linaro.org; Fri, 07 Feb 2020 18:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57952)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1j0CfY-0004hr-09
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 18:04:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1j0CfV-0006nj-Us
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 18:04:14 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:21918
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1j0CfV-0006ly-Hn
 for qemu-arm@nongnu.org; Fri, 07 Feb 2020 18:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581116652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QbIFO7Oxc9JmMQe9oFXeh2qJJYelsG+d0X1l7OckJLI=;
 b=cyW4qco6j1BgYAMjAOC6H29MMMH1tGktCeephT+Nxv2XCOlaKSZffGIUKtUihABCQ5B9Dv
 LFB5PZ0Aa5gMq4fveHHavsyu1DVqXM3/UsPmNVWOonzpvH5GWRKIo1MoNjUFoX4tdtvOMK
 Y7UUVDyQH5Q3xza4RuG5cRWBQ0thnxw=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-UxN5REejNeOXPc3wQAJgdw-1; Fri, 07 Feb 2020 18:04:08 -0500
Received: by mail-qk1-f199.google.com with SMTP id n126so509060qkc.18
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2020 15:04:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aXUqDz/U9ZcLQH+8OSUrnfufM7Gxds5/ddEtUUb4k3w=;
 b=q1Zk1vO6NvEn4NFhdIs7JVLvdLRCps3Za3v4ASwKf5i0Au2CPjhPJmc50rqdG5LIEH
 t/yTS0rp94B4kiRAq232NMxqcXHUigaIWzpPagxR95cbkIvWSRQxxJTTgMwqY/7zZcwy
 52B4KfXPfUF/sc5QHdySLQJAG2aSCUEPnQYQjtd/wsELCshFbkxUOwB+MNpjl7tWoyiK
 U5+e1eaWytc86OijbbS46WIRU0ZWhOBbijiR8aUlCWjOn7k+29FkhvlupIQfGESvftCQ
 ypXF6rMcoGERI5rAWyihiOxGk6Qf6y8UEci/X3DL26A/o3k1dBHDjvNovqgRGAJCIvmY
 seoA==
X-Gm-Message-State: APjAAAWWV5FzhK1hIc7/VkxCPNtuSNianrclmK5mhk6s7gv/OS7sJqph
 nI02LJmZroc2RafsPN7OZb3Q0lTUMq2i5gRGzv8a0v2eUSp/xPdSZJ1jo46vwYTSv3dY2V6h9j8
 QFVNRke6MA9eZ
X-Received: by 2002:a37:47c4:: with SMTP id u187mr1248020qka.165.1581116647922; 
 Fri, 07 Feb 2020 15:04:07 -0800 (PST)
X-Received: by 2002:a37:47c4:: with SMTP id u187mr1247994qka.165.1581116647667; 
 Fri, 07 Feb 2020 15:04:07 -0800 (PST)
Received: from xz-x1 ([2607:9880:19c8:32::2])
 by smtp.gmail.com with ESMTPSA id k29sm2093779qtu.54.2020.02.07.15.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 15:04:06 -0800 (PST)
Date: Fri, 7 Feb 2020 18:04:05 -0500
From: Peter Xu <peterx@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v14 08/11] virtio-iommu-pci: Introduce the x-dt-binding
 option
Message-ID: <20200207230405.GJ720553@xz-x1>
References: <20200207093203.3788-1-eric.auger@redhat.com>
 <20200207093203.3788-9-eric.auger@redhat.com>
 <20200207100540.GA1999431@myrica>
 <20200207052405-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200207052405-mutt-send-email-mst@kernel.org>
X-MC-Unique: UxN5REejNeOXPc3wQAJgdw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, quintela@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, Eric Auger <eric.auger@redhat.com>,
 bharatb.linux@gmail.com, qemu-arm@nongnu.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d/5GHOMsvm9l

On Fri, Feb 07, 2020 at 05:24:54AM -0500, Michael S. Tsirkin wrote:
> On Fri, Feb 07, 2020 at 11:05:40AM +0100, Jean-Philippe Brucker wrote:
> > Hi Eric,
> >=20
> > On Fri, Feb 07, 2020 at 10:32:00AM +0100, Eric Auger wrote:
> > > At the moment, the kernel only supports device tree
> > > integration of the virtio-iommu. DT bindings between the
> > > PCI root complex and the IOMMU must be created by the machine
> > > in conformance to:
> > >=20
> > > Documentation/devicetree/bindings/virtio/iommu.txt.
> > >=20
> > > To make sure the end-user is aware of this, force him to use the
> > > temporary device option "x-dt-binding" and also double check the
> > > machine has a hotplug handler for the virtio-iommu-pci device.
> > > This hotplug handler is in charge of creating those DT bindings.
> > >=20
> > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > > Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> > [...]
> > > @@ -39,6 +42,21 @@ static void virtio_iommu_pci_realize(VirtIOPCIProx=
y *vpci_dev, Error **errp)
> > >      VirtIOIOMMUPCI *dev =3D VIRTIO_IOMMU_PCI(vpci_dev);
> > >      DeviceState *vdev =3D DEVICE(&dev->vdev);
> > > =20
> > > +    if (!dev->dt_binding) {
> > > +        error_setg(errp,
> > > +                   "Instantiation currently only is possible if the =
machine "
> > > +                   "creates device tree iommu-map bindings, ie. ACPI=
 is not "
> > > +                   "yet supported");
> > > +        error_append_hint(errp, "use -virtio-iommu-pci,x-dt-binding\=
n");
> >=20
> > "use -device virtio-iommu-pci,x-dt-binding"?
> >=20
> > Can the option be safely removed as soon as we implement a topology
> > description for the remaining platforms?  Or will we need to carry it
> > forever for backward-compatibility (ie. ensure that an old command-line
> > invocation that contains this option still works)?
> >=20
> > Thanks,
> > Jean
>=20
> I'd worry that if we actually document it then users will come to
> depend on it for sure, even though it starts with x-.

I thought x- parameters can be dropped directly with totally no
grarantee...  Otherwise how do we differenciate x- with the common
parameters, and how do we introduce remove-prone parameters?

Thanks,

--=20
Peter Xu

