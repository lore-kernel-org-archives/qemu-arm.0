Received: by 10.223.197.9 with SMTP id q9csp4711874wrf;
        Tue, 3 Oct 2017 10:13:18 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBrOYP7NuxLrXUCln38biYbvNY9tbIFBLQrHSGLb1oLIAHooeR3b0WXr2BqpcNlUG7GNB9n
X-Received: by 10.55.145.199 with SMTP id t190mr21238131qkd.147.1507050798766;
        Tue, 03 Oct 2017 10:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507050798; cv=none;
        d=google.com; s=arc-20160816;
        b=FHRVfJBZirqAHFrLGyCPlH/CHUVLB0EKzvZ5s2MtsqY923LH34pDw2uKCAnv2rmeUA
         uOdXav8OAqBfKpDcrGpRZvlq4cIc6gXR1+/Giqof7cFHvz/BEyReyNfjJ77JmycFu7lp
         HN9w9gS1Pronhhqg8pLGNyCkZ2rDpfad373pocDy1xxXfS/yvX00eDg++4lpziM9xPLO
         BUnMUu8fwG2snBfM9YimG4PMqNqXCRrOn3kqLuxhSjcDisa4WbNChpS1wPMv9SWFSIBl
         nss9ItA5UR03lxFdcBMA37dzcN5o++qe8Kal/WsGO5lrFc8d7j22Yx7jliRRKnhyiFtF
         N7HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=MlIr8L5I7OfiyrrydrVMBnJRLuJvFAfwcCzdvfkE1Y4=;
        b=isWVAa2Ea86a/W7VpGPond4sDVHP4Ik3aKneECPyOWVyTy+c8OMe8Y5nDN/Hjb2F88
         LJrICoSIRa+9ID/AV/CEtu3yts1o20CUiz30XWu+OZSV+w4JqdRu/PgWqhEOktf5FWLk
         KlSW3UEB8qkI4vhJVH4GT5XO4226JXZq4N6J5fI4bsG3oQ3KhcOv+WNY1eCrH4l3eThr
         SUK1vJM3HPgdqoa1LtlE8sbIb/Ei6LCTIP0paQbVtD/ct06yPQ1PzJeTNCVNWMxhFBgx
         18h5jkIv+ePJB81j6dUc8knW7/3DDuE1GdmwtjwOH4vGZdKYn7Z7D9dwIr53ZdivJM3g
         F71w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j3si2887703qtf.175.2017.10.03.10.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Oct 2017 10:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzQkw-0006ly-7d
	for alex.bennee@linaro.org; Tue, 03 Oct 2017 13:13:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55565)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1dzQk4-0006Qq-PG
	for qemu-devel@nongnu.org; Tue, 03 Oct 2017 13:12:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1dzQk3-0006Gy-LL
	for qemu-devel@nongnu.org; Tue, 03 Oct 2017 13:12:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:34648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1dzQju-000604-Ve; Tue, 03 Oct 2017 13:12:15 -0400
Received: from [10.149.184.130] (162-198-228-33.lightspeed.wlfrct.sbcglobal.net
	[162.198.228.33])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E027B2188D;
	Tue,  3 Oct 2017 17:12:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E027B2188D
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Tue, 3 Oct 2017 10:12:11 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Eduardo Habkost <ehabkost@redhat.com>
In-Reply-To: <20171003001257.GA7087@localhost.localdomain>
Message-ID: <alpine.DEB.2.10.1710031003331.17914@sstabellini-ThinkPad-X260>
References: <20170927195635.16014-1-ehabkost@redhat.com>
	<20170927195635.16014-5-ehabkost@redhat.com>
	<59CCD0150200007800180507@prv-mh.provo.novell.com>
	<20170928131234.GP4115@localhost.localdomain>
	<20171003001257.GA7087@localhost.localdomain>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-devel] xen-pci-passthrough PCI Express support? (Re:
 [Xen-devel] [PATCH v2 4/5] pci: Add INTERFACE_CONVENTIONAL_PCI_DEVICE to
 Conventional PCI devices)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Jan Beulich <JBeulich@suse.com>,
	David Gibson <dgibson@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>, xen-devel@lists.xenproject.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	Anthony Perard <anthony.perard@citrix.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
	Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: k3XYps5b/LeK

On Mon, 2 Oct 2017, Eduardo Habkost wrote:
> On Thu, Sep 28, 2017 at 10:12:34AM -0300, Eduardo Habkost wrote:
> > On Thu, Sep 28, 2017 at 02:33:57AM -0600, Jan Beulich wrote:
> > > >>> On 27.09.17 at 21:56, <ehabkost@redhat.com> wrote:
> > > > --- a/hw/xen/xen_pt.c
> > > > +++ b/hw/xen/xen_pt.c
> > > > @@ -964,6 +964,10 @@ static const TypeInfo xen_pci_passthrough_info = {
> > > >      .instance_size = sizeof(XenPCIPassthroughState),
> > > >      .instance_finalize = xen_pci_passthrough_finalize,
> > > >      .class_init = xen_pci_passthrough_class_init,
> > > > +    .interfaces = (InterfaceInfo[]) {
> > > > +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > > > +        { },
> > > > +    },
> > > >  };
> > > 
> > > Passed through devices can be both PCI and PCIe, so following
> > > the description of the patch I don't think these can be statically
> > > given either property. Granted quite a bit of PCIe specific
> > > functionality may be missing in the Xen code ...
> > 
> > This is just static data about what the device type supports, not
> > about what a given device instance really is.  Deciding if the
> > device is PCIe or Conventional at runtime is out of the scope of
> > this series.
> > 
> > That said, if passed through PCI Express devices are really
> > supported, it looks like this should be marked as hybrid.
> 
> Can anybody confirm if PCI Express devices are really supported
> by xen-pci-passthrough?
> 
> I suggest we add only INTERFACE_CONVENTIONAL_PCI_DEVICE to the
> class info until we confirm that.
> 
> (In other words, apply this patch as-is, and add
> INTERFACE_PCIE_DEVICE later as a follow-up patch if appropriate.)

Yes, xen-pci-passthrough can expose PCI Express devices to the guest.  I
don't think the old xen-pci-passthrough code does anything special to
mark it as such internally in QEMU, but it can deal with the PCI Express
Capabilities and expose/emulate them for the guest's benefit.
