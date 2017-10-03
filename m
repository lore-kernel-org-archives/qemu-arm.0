Received: by 10.223.197.9 with SMTP id q9csp4977375wrf;
        Tue, 3 Oct 2017 15:20:40 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QDJIN+QKXXB5NG0I8M8CWbvsiPVK9RQI+nRHw0f9Y2y0rH0+4MQRTqq8UnYadArjYA5Td6H
X-Received: by 10.55.72.81 with SMTP id v78mr21871537qka.333.1507069240659;
        Tue, 03 Oct 2017 15:20:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507069240; cv=none;
        d=google.com; s=arc-20160816;
        b=MpNVh6S8HTV8b2h6h/C3yVWfIo8qkS3trzrX8qVusYZEOKInIQDN9YxK8L2mL0mLgU
         Rd2SAGSoIEMXLXvyVhlqcqZth7l3ukoDCU28prh42geiVNKmnIuxwsHv2kHmRrHBkbBX
         LPlFKy7NxwxFTZxozatCLf6L2FyRey+BrBea33L/eON4QER0A6bF+iMgzZbTRRJ0QIUq
         93CnHsA7vHnA7lCtPRJF1CyGRz2ERwiL3WBCta0y+ow+8MYzqDUCm5Up1wRC2+snc4fP
         I0WWxAf0FJVwggBCGAQ+C5cdBvXbm6+VWzB3n5Bu2tcCC/+YeJvUvcrgf6fnQiUl+0ul
         nNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=MlIr8L5I7OfiyrrydrVMBnJRLuJvFAfwcCzdvfkE1Y4=;
        b=aZ8Ihiz45NQuRdEZfXT37aa2mNfHhzfXv0q105TAeHhPZbWFeEj9tSMplIZnapR9cE
         gSf+lPywuP4tQlw+rCsKbnI9GQ4lbykbJ3lylfkIpEbzHuA/hRl1L/lpH0NpmLY28h8L
         s1K26RbO+C2dCm8yz60Ailojn9cMYokavlzQeghKd3B5ZtyCDXbLhO/1vGwWZwKuu7aJ
         qH5qvEp+nNgb+focypZM50+zWNtxKGNbH8aRACZRvOhgp0ymVbA18uL5VY414tW8yrN7
         R3EdleBqkhfy/05WLBogHAr5WPRcExuZQcogcU/kOOxh5i3tPlSyaTymFMG9xlQuznaN
         Rl5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w187si7059750qka.23.2017.10.03.15.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Oct 2017 15:20:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60497 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzVYO-00032c-7L
	for alex.bennee@linaro.org; Tue, 03 Oct 2017 18:20:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55531)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1dzQk0-0006QQ-7S
	for qemu-arm@nongnu.org; Tue, 03 Oct 2017 13:12:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1dzQjv-00063O-9D
	for qemu-arm@nongnu.org; Tue, 03 Oct 2017 13:12:20 -0400
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
X-Mailman-Approved-At: Tue, 03 Oct 2017 18:19:17 -0400
Subject: Re: [Qemu-arm] xen-pci-passthrough PCI Express support? (Re:
 [Qemu-devel] [Xen-devel] [PATCH v2 4/5] pci: Add
 INTERFACE_CONVENTIONAL_PCI_DEVICE to Conventional PCI devices)
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G6+WW1o8gvBa
Message-ID: <20171003171211.prL8LzbqFYZ9np0qRZIgnsZAuPKfp7dti4pU_o8ceec@z>

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
