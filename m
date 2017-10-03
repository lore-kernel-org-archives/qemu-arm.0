Received: by 10.223.197.9 with SMTP id q9csp3890972wrf;
        Mon, 2 Oct 2017 17:14:26 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCpDz0aTjKz/DRFyxZJxcMdZM75EfqGSL8eB1z2JZ7csg4m0s6PRS/6l84nILnB/VhUkhw2
X-Received: by 10.55.215.202 with SMTP id t71mr14374465qkt.188.1506989666859;
        Mon, 02 Oct 2017 17:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506989666; cv=none;
        d=google.com; s=arc-20160816;
        b=gDExZjAjjFx2q2LlQ+J/lBoYCk+uit0gxlrWHsTo2lhMwc7voQhWQY6UA62gWeC7qj
         dRa1wUztpT6+zr2yHbWP8q8TekqPPDeIeu4Q75e8eZBM9vH6fxIhvUwaOG5MSRKvdY+5
         ER5kczYPiNC199Iv0JkKEnUlkK0vA6kenPwxf6zjMdpT9pm6mIVa9h+lbZLJoLYKtlPU
         nq8+gKFWARrO3FwyeC0xzeU0CR/4Xt5keh5Paxk6ID03/sOEpd2h3a1C+MOZY3v/WYsN
         a5sC/3QNqo+E857UsgNkRkOLvgG76PR679RdamY/khWbLhpe25vYqzyONdz4ukiKu9o7
         7mtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=QzIj8K7uZtbzeuwDKFdAFwixLzVVeeZ+FMk1OZxb178=;
        b=J+3fkcZfyMMCdBjz2brLhJQbIQTJoTKQmMfd9GsqTuasJUcBO7d8FxYD1GcWqtIcZ9
         dard8ZGsnW8MpTOZnT1jovbJwVuNKoWIfL+PtEGrkVmWXQzNk4C3Tl35SlodOGdvC9yq
         x/nKqImdFw0zbC0OvAHA07EMumOWEKW7tBdclS4uyXV5f62xsIpLkhbGL5XYXf7nsfXP
         KKLMThsqHSS9KaR3mc5zITMgb5exUsIt2KAniuTtVzqFkVz/3tUD2fGrZl3FaBxSeIRR
         WJYtDjdOENIwsFTPGPTxacZ5CB4Uvrooeldar71SFVtOAfG2av6qDu+Hr2Xs/skavEZ9
         fkRQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8si891171qta.516.2017.10.02.17.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Oct 2017 17:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzAqu-00066U-IL
	for alex.bennee@linaro.org; Mon, 02 Oct 2017 20:14:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dzApu-0005TA-M5
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 20:13:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dzApo-000199-Vt
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 20:13:22 -0400
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
Subject: [Qemu-arm] xen-pci-passthrough PCI Express support? (Re:
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RKlzrEdDOajm

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
