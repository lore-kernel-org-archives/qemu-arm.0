Received: by 10.223.174.134 with SMTP id y6csp40680wrc;
        Thu, 28 Sep 2017 06:13:09 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCf5SS0WOGIbKjQKDMeeqzKrNfyHs8W5JXqLvE4E4cMuyZOb7CY9d5iQzyt6xNeVMHceLlw
X-Received: by 10.55.87.133 with SMTP id l127mr6619955qkb.212.1506604389297;
        Thu, 28 Sep 2017 06:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506604389; cv=none;
        d=google.com; s=arc-20160816;
        b=TIfoV1K0XN+sIPxNAewy3jO4GgMnByAoItPVBXlmzd3WOaxHvhznpmf64yRY78yDr/
         iNjyPHqf9ycdIl1wnO4NPdZQS9Vy/mPa3G2qwJxinHZzcaHKSqw9ATEoRLGZHFs9qA8p
         aDCGIYdRKtssQ9F09dwPXdle+w1v+fu6RbkOB7AZohlmsoi7XckX16Lx0O2WolNLnOP+
         vW5I++v7HDZpnVpLv2ol3EYmSQHRw+ZW3WjMmqPn2SawyXPXirTxZGgxSO01bAMLmGb0
         1QxUAIE4xLnEEtFgt3gnpqLmUHsz3vb5mnVVnewJKVnPb3Lu1wExxEM3O4GmJyd742O6
         8oxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=UHASkpWLc11zXweEuHmrjtNJn0vcN+cwyaYdUmHHSfc=;
        b=FDhIW0fgKW3t4dDS3yIuXpJFkTsvo459gfmzubnASrmv6gd6G0+BLB6Cc0oiO6kgr3
         O7Nv122HBXvw+mFZNnkRUQyFq1lC20mJvDsZSBA4oacs9ZZsqAWoT4fWdlm9TzHOYh+9
         tKABmw2C5Q9cyMwE11g3M+RDtHT0SEJFFhOwMTbgx/E3EjbvbdQr1Kjx31hJGXIkTjao
         r7mi+KetK9v3kgyt2lAtCAAVZzFIycq0fu3tj27Iq2+kGZUJcf3c7bTziX7dVVlGiMhl
         +HfDAHoQlhqNwAieZwxavGwXuY/Vkn6vl9cai+k035NOW0FodEOqDf2efr2lwBWrT3Se
         LD4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si1580223qtm.267.2017.09.28.06.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Sep 2017 06:13:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxYcl-0006tk-7r
	for alex.bennee@linaro.org; Thu, 28 Sep 2017 09:13:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dxYcf-0006te-Ip
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 09:13:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dxYcZ-0003Ia-TU
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 09:13:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58784)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dxYcZ-0003Hz-MX; Thu, 28 Sep 2017 09:12:55 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7DDF2C727E;
	Thu, 28 Sep 2017 13:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A7DDF2C727E
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=ehabkost@redhat.com
Received: from localhost (ovpn-116-3.gru2.redhat.com [10.97.116.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DF21EB32A8;
	Thu, 28 Sep 2017 13:12:35 +0000 (UTC)
Date: Thu, 28 Sep 2017 10:12:34 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20170928131234.GP4115@localhost.localdomain>
References: <20170927195635.16014-1-ehabkost@redhat.com>
	<20170927195635.16014-5-ehabkost@redhat.com>
	<59CCD0150200007800180507@prv-mh.provo.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59CCD0150200007800180507@prv-mh.provo.novell.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 28 Sep 2017 13:12:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Xen-devel] [PATCH v2 4/5] pci: Add
 INTERFACE_CONVENTIONAL_PCI_DEVICE to Conventional PCI devices
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NGpcllehTzbL

On Thu, Sep 28, 2017 at 02:33:57AM -0600, Jan Beulich wrote:
> >>> On 27.09.17 at 21:56, <ehabkost@redhat.com> wrote:
> > --- a/hw/xen/xen_pt.c
> > +++ b/hw/xen/xen_pt.c
> > @@ -964,6 +964,10 @@ static const TypeInfo xen_pci_passthrough_info = {
> >      .instance_size = sizeof(XenPCIPassthroughState),
> >      .instance_finalize = xen_pci_passthrough_finalize,
> >      .class_init = xen_pci_passthrough_class_init,
> > +    .interfaces = (InterfaceInfo[]) {
> > +        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> > +        { },
> > +    },
> >  };
> 
> Passed through devices can be both PCI and PCIe, so following
> the description of the patch I don't think these can be statically
> given either property. Granted quite a bit of PCIe specific
> functionality may be missing in the Xen code ...

This is just static data about what the device type supports, not
about what a given device instance really is.  Deciding if the
device is PCIe or Conventional at runtime is out of the scope of
this series.

That said, if passed through PCI Express devices are really
supported, it looks like this should be marked as hybrid.

-- 
Eduardo
