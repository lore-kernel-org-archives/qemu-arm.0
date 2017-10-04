Received: by 10.223.197.9 with SMTP id q9csp5627453wrf;
        Wed, 4 Oct 2017 06:09:07 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA4rgJJAZM/OFjty4+kAfHYu3+5jggKpqgNX/72QWhDclzxWfu5D3z5RrHaiWc9cv+rmJjX
X-Received: by 10.55.46.196 with SMTP id u187mr24560896qkh.174.1507122547350;
        Wed, 04 Oct 2017 06:09:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507122547; cv=none;
        d=google.com; s=arc-20160816;
        b=YK/CHKy8QZZTQKzeLhqbiWbxQQBMQ+8JT9gs10+b5bjPjv1L93cm1hS4gj8KLk3yYB
         Lq/m4nRBWMtfCbl3MdBpUsxmJdi+tibIfeHmAJMZvQQFTaMZQbUxFDj61I5W2ejQnHh8
         BR+N1aIZBa3aBmJtcurf057mUQI4/hSLfNvpSi4yJQ6o4pKiM29auYiSCDpIZ/JuxqFu
         g9YPJQraqPwuSp8WDUUZ5J9748aRHDpdx0AjZqtkRPVAjanshz9fZ0mKzD/l7L5Rbn5z
         w8X+mHruiZBR9Qz5PASE7kkygjEPYOQrsz8AQKmznpIm9JPz0D+bnYPp4gU3rdtzApxD
         PLVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=HAG6G9R8Mmk4FZKmJgOrQ/8znrsZbBZ7hl9JwDnpMpM=;
        b=PjdDYKD2tjvrEobP0gjeqBvL3W4B72HKgjg4Lj90BsMnFGSGUsxb2CLObv561ddT3y
         cl5uO638LJeIiTkv4NOHj2ZUKhqWZFEM9Op/ztGek7CCOHiRSBhjRh/lyPLomhHEqxMg
         9XXFfdFdaZPGHcKIP8MPtBYZ63/wg+4kwTF3Rzbp7DGcuMLxnaMidjCSYUAQLPKb0d41
         sGlszjJs+wik2+NKNUxjt2jyB/3IMfz8LFHELEAHmZA28jxZ64ox7IV/D6qZ1wrsj6lQ
         zmiY3rNa/0vHxRo8XyC7Mf1SG2FTkUcDHz8lfh8n22phvj1Do1wu11ywzqzHNR+pgtz9
         McaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r27si1408783qtc.76.2017.10.04.06.09.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 06:09:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzjQA-0001pZ-PX
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 09:09:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42322)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dzjOq-0001FW-Po
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 09:07:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dzjOl-00061V-10
	for qemu-devel@nongnu.org; Wed, 04 Oct 2017 09:07:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42886)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dzjOV-0005lg-Cm; Wed, 04 Oct 2017 09:07:23 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED9AF356FC;
	Wed,  4 Oct 2017 13:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ED9AF356FC
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-35.gru2.redhat.com [10.97.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C23E15C8B3;
	Wed,  4 Oct 2017 13:06:57 +0000 (UTC)
Date: Wed, 4 Oct 2017 10:06:55 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20171004130655.GK4760@localhost.localdomain>
References: <20170927195635.16014-1-ehabkost@redhat.com>
	<20170927195635.16014-5-ehabkost@redhat.com>
	<59CCD0150200007800180507@prv-mh.provo.novell.com>
	<20170928131234.GP4115@localhost.localdomain>
	<20171003001257.GA7087@localhost.localdomain>
	<59D4C11F0200007800181F48@prv-mh.provo.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59D4C11F0200007800181F48@prv-mh.provo.novell.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 04 Oct 2017 13:07:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
	David Gibson <dgibson@redhat.com>, Jiri Slaby <jslaby@suse.cz>,
	Hannes Reinecke <hare@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	Marcel Apfelbaum <marcel@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Laine Stump <laine@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Alistair Francis <alistair23@gmail.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F+zldrxph6kA
Message-ID: <20171004130655.XSDaa-tGoP_rEr_7kgyzMoWHPrC1LwzJhDj-hp1uiKk@z>

On Wed, Oct 04, 2017 at 03:08:15AM -0600, Jan Beulich wrote:
> >>> On 03.10.17 at 02:12, <ehabkost@redhat.com> wrote:
> > On Thu, Sep 28, 2017 at 10:12:34AM -0300, Eduardo Habkost wrote:
> >> On Thu, Sep 28, 2017 at 02:33:57AM -0600, Jan Beulich wrote:
> >> > >>> On 27.09.17 at 21:56, <ehabkost@redhat.com> wrote:
> >> > > --- a/hw/xen/xen_pt.c
> >> > > +++ b/hw/xen/xen_pt.c
> >> > > @@ -964,6 +964,10 @@ static const TypeInfo xen_pci_passthrough_info = {
> >> > >      .instance_size = sizeof(XenPCIPassthroughState),
> >> > >      .instance_finalize = xen_pci_passthrough_finalize,
> >> > >      .class_init = xen_pci_passthrough_class_init,
> >> > > +    .interfaces = (InterfaceInfo[]) {
> >> > > +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> >> > > +        { },
> >> > > +    },
> >> > >  };
> >> > 
> >> > Passed through devices can be both PCI and PCIe, so following
> >> > the description of the patch I don't think these can be statically
> >> > given either property. Granted quite a bit of PCIe specific
> >> > functionality may be missing in the Xen code ...
> >> 
> >> This is just static data about what the device type supports, not
> >> about what a given device instance really is.  Deciding if the
> >> device is PCIe or Conventional at runtime is out of the scope of
> >> this series.
> >> 
> >> That said, if passed through PCI Express devices are really
> >> supported, it looks like this should be marked as hybrid.
> > 
> > Can anybody confirm if PCI Express devices are really supported
> > by xen-pci-passthrough?
> 
> I think I've clearly said they're supported, with some limitations.

Sorry, thanks.  I thought the possible missing PCIe functionality
could mean the device couldn't appear as PCI Express to the
guest.

I will submit a follow-up patch adding INTERFACE_PCIE_DEVICE to
xen-pci-passthrough.

-- 
Eduardo
