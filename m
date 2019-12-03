Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1382537lfc;
        Tue, 3 Dec 2019 03:38:40 -0800 (PST)
X-Google-Smtp-Source: APXvYqx90QsIvqC6LpwnWztJahimItFhHJtB18icweODvzVE+HDh88d29WJnwGzP2S33uvnLtBtR
X-Received: by 2002:ac8:3f83:: with SMTP id d3mr4458932qtk.209.1575373120206;
        Tue, 03 Dec 2019 03:38:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575373120; cv=none;
        d=google.com; s=arc-20160816;
        b=rjRdl9WX14YhMmvw2S9BXPJNR2mh2K+ktTKG+g4B7Absm+QHxftEsBsTA9SUuVSh/x
         /L36YXGzIe8ghpDg9xT8Ier0tZiKd1Z+LDLHWxw3izlNy5VQ/0kayzV66Dtp993Rhi83
         GS+rI0rFBVJUnt0UdkwDNPyOFIStnHlYQTcH0I1elEVO/u4tYB9O3J/rcCrEIgXSR7Io
         PJqSvMqinyLe1nx6vxW8AE36lE60w5WGwKqByW9xacP2l2t4N9pH5wmrTEvDz6VaEgAo
         n1NQyRBLQ9ViMKOMvce5pyaq1jZU5QsTyQ+fV9lBvDzVm+cZqxGD+xDzmbg+zIrf6tKK
         sRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=5k+TVu0cIfGxnOX/ynMd2OfHm/k4ejo/NeyD3pZO+z8=;
        b=vgmPHFXk7NVj7ddzXVaUj4wVz2mEFbBQgYir2e9W0jn0PS0Gc0hcnrkmA+VW2vYHl6
         Ed0SRoB03ftE1tEXkNNaPLzJbeJxWmDla5tbOw+xcPB4vME+1QQoTsJH3wiRbc60qOjs
         Crs+fvD5X3cRIT+fUnJy2uRmYVwNzJMyx1syr54icr2q2Z9+p8YUJ+nv0noymRYqGfp2
         KNCC1ENHMcvXJ5+hFYGIhyGNn1B4urag0HJRaqUWKjrwLOeKPNxvB77ciOGUqlfnapoA
         TjduawZUqz3B3FWGQ9ETqiO+Q8tYmqiEzjws7b7FQ9JxSSxz+cc/kNcXQnuTomLBAQ2+
         CrbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QISeKQpp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t42si1780528qvt.179.2019.12.03.03.38.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 03:38:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=QISeKQpp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic6Vr-0007Uj-Lq
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 06:38:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ic6Ur-0007SC-03
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 06:37:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ic6Up-0004bV-Dr
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 06:37:36 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35668
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ic6Uk-0004Xt-2f
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 06:37:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575373046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5k+TVu0cIfGxnOX/ynMd2OfHm/k4ejo/NeyD3pZO+z8=;
 b=QISeKQppfG51B+XruD9HCl0bu7Fmj/ApcHXs+UdNG4NtcFGF65eoqcYVkZeGpSFkltIoV9
 VFxuDGpWrd7Sixiyn6ZXh9rnDt5AwA2FeKLEgJ1pPcEyBw3jtFSS2QqN5Jo7u4xnCWTM70
 rno2MFf6zNHhm9rS1Jp86NeErw1x6Hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-bM7UFjCbPN2XtgtErmpyxA-1; Tue, 03 Dec 2019 06:37:25 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A42E51005502;
 Tue,  3 Dec 2019 11:37:23 +0000 (UTC)
Received: from gondolin (ovpn-116-214.ams2.redhat.com [10.36.116.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66D955D6A7;
 Tue,  3 Dec 2019 11:37:17 +0000 (UTC)
Date: Tue, 3 Dec 2019 12:37:14 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v5 06/13] hw/core/qdev: handle parent bus change
 regarding resettable
Message-ID: <20191203123714.0886e34f.cohuck@redhat.com>
In-Reply-To: <CAFEAcA981i_W=8y+7_8JV=oMLT51TBMB8bTJJaiJJZqj6MuSAQ@mail.gmail.com>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-7-damien.hedde@greensocs.com>
 <CAFEAcA981i_W=8y+7_8JV=oMLT51TBMB8bTJJaiJJZqj6MuSAQ@mail.gmail.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: bM7UFjCbPN2XtgtErmpyxA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, "Daniel
 P. Berrange" <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Edgar Iglesias <edgari@xilinx.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGll?= =?UTF-8?B?dS1EYXVkw6k=?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6C8LRcVB7oZM

On Fri, 29 Nov 2019 18:41:26 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 18 Oct 2019 at 16:07, Damien Hedde <damien.hedde@greensocs.com> wrote:
> >
> > In qdev_set_parent_bus(), when changing the parent bus of a
> > realized device, if the source and destination buses are not in the
> > same reset state, some adaptation are required. This patch adds  
> 
> "adaptations"
> 
> > needed call to resettable_change_parent() to make sure a device reset
> > state stays coherent with its parent bus.
> >
> > The addition is a no-op if:
> > 1. the device being parented is not realized.
> > 2. the device is realized, but both buses are not under reset.
> >
> > Case 2 means that as long as qdev_set_parent_bus() is called
> > during the machine realization procedure (which is before the
> > machine reset so nothing is in reset), it is a no op.
> >
> > There are 49 call sites of qdev_set_parent_bus(). All but one fall
> > into the no-op case:
> > + 28 calls related to virtio (in hw/{s390x,display,virtio}/
> >   {vhost,virtio}-xxx.c) to set a _vdev_/_vgpu_ composing device
> >   parent bus just before realizing the _vdev_/_vgpu_.
> > + hw/qdev.c: when creating a device in qdev_try_create()
> > + hw/sysbus.c: when initializing a device in the sysbus
> > + hw/display/virtio-gpu-pci.c: before realizing VirtIOGPUPCIBase/vgpu
> > + hw/display/virtio-vga.c: before realizing VirtIOVGABase/vgpu
> > + hw/i386/amd_iommu.c: before realizing AMDVIState/pci
> > + hw/misc/auxbus.c: when creating an AUXBus
> > + hw/misc/auxbus.c: when creating an AUXBus child
> > + hw/misc/macio/macio.c: when initializing a MACIOState child
> > + hw/misc/macio/macio.c: before realizing NewWorldMacIOState/pmu
> > + hw/misc/macio/macio.c: before realizing NewWorldMacIOState/cuda
> > + hw/pci-host/designware.c: before realizing DesignwarePCIEHost/root
> > + hw/pci-host/gpex.c: before realizing GPEXHost/root
> > + hw/pci-host/prep.c: when initializaing PREPPCIState/pci_dev
> > + hw/pci-host/q35.c: before realizing Q35PCIHost/mch
> > + hw/pci-host/versatile.c: when initializing PCIVPBState/pci_dev
> > + hw/pci-host/xilinx-pcie.c: before realizing XilinxPCIEHost/root
> > + hw/s390x/event-facility.c: when creating SCLPEventFacility/
> >                              TYPE_SCLP_QUIESCE
> > + hw/s390x/event-facility.c: ditto with SCLPEventFacility/
> >                              TYPE_SCLP_CPU_HOTPLUG
> > + hw/s390x/sclp.c: Not trivial because it is called on a SLCPDevice
> >   just after realizing it. Ok because at this point the destination
> >   bus (sysbus) is not in reset; the realize step is before the
> >   machine reset.
> > + hw/sd/core.c: Not OK. Used in sdbus_reparent_card(). See below.
> > + hw/ssi/ssi.c: Used to put spi slave on spi bus and connect the cs
> >   line in ssi_auto_connect_slave(). Ok because this function is only
> >   used in realize step in hw/ssi/aspeed_smc.ci, hw/ssi/imx_spi.c,
> >   hw/ssi/mss-spi.c, hw/ssi/xilinx_spi.c and hw/ssi/xilinx_spips.c.
> > + hw/xen/xen-legacy-backend.c: when creating a XenLegacyDevice device
> > + qdev-monitor.c: in device hotplug creation procedure before realize  
> 
> This is a really useful analysis to have in the commit message;
> thanks!
> 
> (Side note: I wonder if the sclp.c case could be reordered so
> it realizes the device after parenting it? Anyway, not something
> to worry about now.)

As far as I can see, that should work. This code is a bit weird anyway;
the problem is that we need the sysbus somewhere in there... I'm
wondering if that can be handled in a different way. But agreed, that
is something we can revisit later.

> 
> > Note that this commit alone will have no effect, right now there is no
> > use of resettable API to reset anything. So a bus will never be tagged
> > as in-reset by this same API.
> >
> > The one place where side-effect will occurs is in hw/sd/core.c in
> > sdbus_reparent_card(). This function is only used in the raspi machines,
> > including during the sysbus reset procedure. This case will be fixed by
> > a following commit before globally enabling resettable API for sysbus
> > reset.
> >
> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>  
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 

