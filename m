Received: by 10.223.197.9 with SMTP id q9csp3891558wrf;
        Mon, 2 Oct 2017 17:15:09 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAaLRBOCL9oagzzbnB2oEpYREl45CWPeL7UmjUXmLGuNAyW9RWRiUPWc6fpoCCK53m9z5Ld
X-Received: by 10.55.20.151 with SMTP id 23mr18059698qku.78.1506989709592;
        Mon, 02 Oct 2017 17:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506989709; cv=none;
        d=google.com; s=arc-20160816;
        b=nMmSPJpbC6tF2htPpsVauXXOZa67MBqPBPLKx0/goxQ20IZKoWJoDry0AwfcN1O/rT
         kVWySJF+rpPBERFVig1sPNvhukzOJOdjsPzzpmTrdbUnfHAqhM+HeGrWPekVrWdcMVek
         mBFq4L7rY9+iN8jMBgo4g+UIRr8ZrwRgrGOVZEoZgWIesJRY8jr7lRFBuOfJ5fmcxIuR
         LquNktRdJas2pDWgYspd5fVnGywFZPPRppJS3RaZO0crMrVg8AF4gDlskJ5XBRuUJuw5
         zmy6hndj07JexiaK3/ZB02Ujw5QXl+7EUH3fyEsUQdUtcTGNmNmXvSTDVgDNyYGLfR1f
         2oDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=QzIj8K7uZtbzeuwDKFdAFwixLzVVeeZ+FMk1OZxb178=;
        b=c5d4DxZZFmyrwtgFWrNDifjEItkj32ERhnl270LkNX8DMH8HlCYusFrsT7EcPO/aL7
         djAQUmJbySnRS8NX4sPFoRwNLnTXTrmaLYKon+vJeL1l1uZumjQBvVTkyGVzkVv7/7LY
         zBy7Cm8g44DoERFPkqNSs3oXr3MCi9MSwBgrvUUDOpu/K5UvcIv1d2MjMp2lW9/3BS7x
         fsd6cWDZem2p/6EIIYwKqSAojd9iZN6L3AYC/k7lV4BsWQqmbUJNJxEVzHtQJUtY5n2T
         B2kBe8Fncah3redquaMg2d+cktAQ16L65vXKgMcd4PBWbMS0AjhrbK6WBXpfzeKXeLHS
         hmMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z123si1690954qke.308.2017.10.02.17.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Oct 2017 17:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55298 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzArb-0006RZ-Hp
	for alex.bennee@linaro.org; Mon, 02 Oct 2017 20:15:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dzApz-0005Wh-6W
	for qemu-devel@nongnu.org; Mon, 02 Oct 2017 20:13:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dzApy-0001Py-45
	for qemu-devel@nongnu.org; Mon, 02 Oct 2017 20:13:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dzApo-00014p-Mz; Mon, 02 Oct 2017 20:13:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED7D64ACA7;
	Tue,  3 Oct 2017 00:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ED7D64ACA7
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-6.gru2.redhat.com [10.97.116.6])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A98AD6FDB0;
	Tue,  3 Oct 2017 00:12:58 +0000 (UTC)
Date: Mon, 2 Oct 2017 21:12:57 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20171003001257.GA7087@localhost.localdomain>
References: <20170927195635.16014-1-ehabkost@redhat.com>
	<20170927195635.16014-5-ehabkost@redhat.com>
	<59CCD0150200007800180507@prv-mh.provo.novell.com>
	<20170928131234.GP4115@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170928131234.GP4115@localhost.localdomain>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 03 Oct 2017 00:13:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] xen-pci-passthrough PCI Express support? (Re:
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
X-TUID: RIfPATPKBDj2
Message-ID: <20171003001257.wvPipRf1XPQjuFeO68kpEXJBlU_gbjkCOdbXnmUghXc@z>

On Thu, Sep 28, 2017 at 10:12:34AM -0300, Eduardo Habkost wrote:
> On Thu, Sep 28, 2017 at 02:33:57AM -0600, Jan Beulich wrote:
> > >>> On 27.09.17 at 21:56, <ehabkost@redhat.com> wrote:
> > > --- a/hw/xen/xen_pt.c
> > > +++ b/hw/xen/xen_pt.c
> > > @@ -964,6 +964,10 @@ static const TypeInfo xen_pci_passthrough_info = {
> > >      .instance_size = sizeof(XenPCIPassthroughState),
> > >      .instance_finalize = xen_pci_passthrough_finalize,
> > >      .class_init = xen_pci_passthrough_class_init,
> > > +    .interfaces = (InterfaceInfo[]) {
> > > +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > > +        { },
> > > +    },
> > >  };
> > 
> > Passed through devices can be both PCI and PCIe, so following
> > the description of the patch I don't think these can be statically
> > given either property. Granted quite a bit of PCIe specific
> > functionality may be missing in the Xen code ...
> 
> This is just static data about what the device type supports, not
> about what a given device instance really is.  Deciding if the
> device is PCIe or Conventional at runtime is out of the scope of
> this series.
> 
> That said, if passed through PCI Express devices are really
> supported, it looks like this should be marked as hybrid.

Can anybody confirm if PCI Express devices are really supported
by xen-pci-passthrough?

I suggest we add only INTERFACE_CONVENTIONAL_PCI_DEVICE to the
class info until we confirm that.

(In other words, apply this patch as-is, and add
INTERFACE_PCIE_DEVICE later as a follow-up patch if appropriate.)

-- 
Eduardo
