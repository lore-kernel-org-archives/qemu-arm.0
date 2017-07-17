Received: by 10.25.44.15 with SMTP id s15csp4001696lfs;
        Sun, 16 Jul 2017 18:28:31 -0700 (PDT)
X-Received: by 10.55.78.88 with SMTP id c85mr22586274qkb.134.1500254911086;
        Sun, 16 Jul 2017 18:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500254911; cv=none;
        d=google.com; s=arc-20160816;
        b=JtQjN+hS06FNBMn/1zkiLkVaWCR5+OHg3mNhe0OLnD+nCJfAl773NhWYt+HfSVhKRZ
         3m7CyhlJj7MIeH61/LmWr0N5EFdtqyzsznsC/yXqabUXBzwutRjdz9qnVOdQ2+f5To6h
         H4d0M6135gYfuQNHqaPYgrLlLkbQv8Ou130i0ELDk1YrdJTEl1051HasnW2lcRgPLQTQ
         7gXFAVdrbtadMN/O8U4Ryq79OB4ClxKbME3OFOp9cG5Qit1RMPkA07fjZeij4KGMjzcx
         VEJ4nB1woaVpCgslhV1HylMYQNeIcEgucB6wQg3uM7WWAn0Z0xdAomJjlVwUv/pwlCfu
         ++jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=H9i2McHO/6o1Z/pIp91VlJk4VvT95r1855OhtRVLP2Q=;
        b=AI2zyO7cDLP9TQmun+/1O0M2ICy1qdxv1nfhwT26TANjuDzKfbimeDFib4EfJD5bxK
         JgYi/basg7SA0nwU9QcEMCFYncWyzgOXS2wDwL48BNXOwIrn3xAP9HX+ejo9vfCmXUrk
         igixSfLFzD516/fewpv/2r9dr2K7lqfVmuojkfpacjcHuvwf05NuSvJnvAsoQC8c7OK5
         P55Jd4i0vxdAGZ61V86arpG8efiMwyRwjNgqdY8vA1BLOG8LKOhGr7CVhYwn49wLj52s
         A2UgNQcHq8nlMsbUJCjq1AFlTxdTFwp/g498z2vUkgJ0nXfzBxzHKYivsXg7wImaVU7p
         5gOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e39si14651562qte.147.2017.07.16.18.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 18:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47426 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWupo-0004gt-E3
	for alex.bennee@linaro.org; Sun, 16 Jul 2017 21:28:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dWupk-0004gb-CC
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 21:28:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1dWupg-00024x-J3
	for qemu-arm@nongnu.org; Sun, 16 Jul 2017 21:28:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44804)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>)
	id 1dWupg-00024U-9Q; Sun, 16 Jul 2017 21:28:20 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBB0A85A05;
	Mon, 17 Jul 2017 01:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DBB0A85A05
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=peterx@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com DBB0A85A05
Received: from pxdev.xzpeter.org (ovpn-12-53.pek2.redhat.com [10.72.12.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52D727767D;
	Mon, 17 Jul 2017 01:28:05 +0000 (UTC)
Date: Mon, 17 Jul 2017 09:28:09 +0800
From: Peter Xu <peterx@redhat.com>
To: Bharat Bhushan <bharat.bhushan@nxp.com>
Message-ID: <20170717012809.GO27284@pxdev.xzpeter.org>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<1496851287-9428-7-git-send-email-eric.auger@redhat.com>
	<20170714021733.GA27284@pxdev.xzpeter.org>
	<AM5PR0401MB2545B52A31CCA827DB3EE5A79AAD0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM5PR0401MB2545B52A31CCA827DB3EE5A79AAD0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Mon, 17 Jul 2017 01:28:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement
 the translation and commands
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>,
	"jean-philippe.brucker@arm.com" <jean-philippe.brucker@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TT6ljHjrHuMl

On Fri, Jul 14, 2017 at 06:40:34AM +0000, Bharat Bhushan wrote:
> Hi Peter,
> 
> > -----Original Message-----
> > From: Peter Xu [mailto:peterx@redhat.com]
> > Sent: Friday, July 14, 2017 7:48 AM
> > To: Eric Auger <eric.auger@redhat.com>
> > Cc: eric.auger.pro@gmail.com; peter.maydell@linaro.org;
> > alex.williamson@redhat.com; mst@redhat.com; qemu-arm@nongnu.org;
> > qemu-devel@nongnu.org; jean-philippe.brucker@arm.com;
> > wei@redhat.com; kevin.tian@intel.com; Bharat Bhushan
> > <bharat.bhushan@nxp.com>; marc.zyngier@arm.com; tn@semihalf.com;
> > will.deacon@arm.com; drjones@redhat.com; robin.murphy@arm.com;
> > christoffer.dall@linaro.org
> > Subject: Re: [Qemu-devel] [RFC v2 6/8] virtio-iommu: Implement the
> > translation and commands
> > 
> > On Wed, Jun 07, 2017 at 06:01:25PM +0200, Eric Auger wrote:
> > > This patch adds the actual implementation for the translation routine
> > > and the virtio-iommu commands.
> > >
> > > Signed-off-by: Eric Auger <eric.auger@redhat.com>
> > 
> > [...]
> > 
> > >  static int virtio_iommu_attach(VirtIOIOMMU *s,
> > >                                 struct virtio_iommu_req_attach *req)
> > > @@ -95,10 +135,34 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
> > >      uint32_t asid = le32_to_cpu(req->address_space);
> > >      uint32_t devid = le32_to_cpu(req->device);
> > >      uint32_t reserved = le32_to_cpu(req->reserved);
> > > +    viommu_as *as;
> > > +    viommu_dev *dev;
> > >
> > >      trace_virtio_iommu_attach(asid, devid, reserved);
> > >
> > > -    return VIRTIO_IOMMU_S_UNSUPP;
> > > +    dev = g_tree_lookup(s->devices, GUINT_TO_POINTER(devid));
> > > +    if (dev) {
> > > +        return -1;
> > > +    }
> > > +
> > > +    as = g_tree_lookup(s->address_spaces, GUINT_TO_POINTER(asid));
> > > +    if (!as) {
> > > +        as = g_malloc0(sizeof(*as));
> > > +        as->id = asid;
> > > +        as->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
> > > +                                         NULL, NULL, (GDestroyNotify)g_free);
> > > +        g_tree_insert(s->address_spaces, GUINT_TO_POINTER(asid), as);
> > > +        trace_virtio_iommu_new_asid(asid);
> > > +    }
> > > +
> > > +    dev = g_malloc0(sizeof(*dev));
> > > +    dev->as = as;
> > > +    dev->id = devid;
> > > +    as->nr_devices++;
> > > +    trace_virtio_iommu_new_devid(devid);
> > > +    g_tree_insert(s->devices, GUINT_TO_POINTER(devid), dev);
> > 
> > Here do we need to record something like a refcount for address space?
> > Since...
> 
> We are using "nr_devices" as number of devices attached to an address-space
> 
> > 
> > > +
> > > +    return VIRTIO_IOMMU_S_OK;
> > >  }
> > >
> > >  static int virtio_iommu_detach(VirtIOIOMMU *s, @@ -106,10 +170,13 @@
> > > static int virtio_iommu_detach(VirtIOIOMMU *s,  {
> > >      uint32_t devid = le32_to_cpu(req->device);
> > >      uint32_t reserved = le32_to_cpu(req->reserved);
> > > +    int ret;
> > >
> > >      trace_virtio_iommu_detach(devid, reserved);
> > >
> > > -    return VIRTIO_IOMMU_S_UNSUPP;
> > > +    ret = g_tree_remove(s->devices, GUINT_TO_POINTER(devid));
> > 
> > ... here when detach, imho we should check the refcount: if there is no
> > device using specific address space, we should release the address space as
> > well.
> > 
> > Otherwise there would have no way to destroy an address space?
> 
> 
> Here if nr_devices == 0 then release the address space, is that ok? 
> 
> This is how I implemented as part of VFIO integration over this patch series.
> 	"[RFC PATCH 2/2] virtio-iommu: vfio integration with virtio-iommu"

Sorry I didn't read that when posting. It is what I mean.  Thanks,

-- 
Peter Xu
