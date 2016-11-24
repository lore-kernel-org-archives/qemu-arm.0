Received: by 10.25.150.194 with SMTP id y185csp276891lfd;
        Thu, 24 Nov 2016 09:42:33 -0800 (PST)
X-Received: by 10.237.59.150 with SMTP id r22mr3025356qte.162.1480009353200;
        Thu, 24 Nov 2016 09:42:33 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g63si23020415qke.185.2016.11.24.09.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Nov 2016 09:42:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c9y2a-0002aF-LB
	for alex.bennee@linaro.org; Thu, 24 Nov 2016 12:42:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c9y2W-0002a8-Rm
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 12:42:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c9y2S-0002Fx-Vy
	for qemu-arm@nongnu.org; Thu, 24 Nov 2016 12:42:28 -0500
Received: from mx1.redhat.com ([209.132.183.28]:50580)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1c9y2S-0002Fa-N1; Thu, 24 Nov 2016 12:42:24 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11E6DC056800;
	Thu, 24 Nov 2016 17:42:23 +0000 (UTC)
Received: from localhost (ovpn-116-207.phx2.redhat.com [10.3.116.207])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAOHgJOw013232; Thu, 24 Nov 2016 12:42:19 -0500
Date: Thu, 24 Nov 2016 15:42:18 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cornelia.huck@de.ibm.com>
Message-ID: <20161124174218.GJ21830@thinpad.lan.raisama.net>
References: <1479777133-23567-1-git-send-email-ehabkost@redhat.com>
	<20161122223450.GD21830@thinpad.lan.raisama.net>
	<20161123171047.GA27297@thinpad.lan.raisama.net>
	<20161124015119.GS17795@umbus.fritz.box>
	<20161124173019.1d3f1b39.cornelia.huck@de.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161124173019.1d3f1b39.cornelia.huck@de.ibm.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 24 Nov 2016 17:42:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] -nodefaults and available buses (was
 Re: [RFC 00/15] qmp: Report supported device types on 'query-machines')
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jia Liu <proljc@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Markus Armbruster <armbru@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Beniamino Galvani <b.galvani@gmail.com>, libvir-list@redhat.com,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Laine Stump <laine@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Greg Kurz <groug@kaod.org>,
	Andrea Bolognani <abologna@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UoUwtOnSlqCb

On Thu, Nov 24, 2016 at 05:30:19PM +0100, Cornelia Huck wrote:
> On Thu, 24 Nov 2016 12:51:19 +1100
> David Gibson <david@gibson.dropbear.id.au> wrote:
> 
> > On Wed, Nov 23, 2016 at 03:10:47PM -0200, Eduardo Habkost wrote:
> > > (CCing the maintainers of the machines that crash when using
> > > -nodefaults)
> > > 
> > > On Tue, Nov 22, 2016 at 08:34:50PM -0200, Eduardo Habkost wrote:
> > > [...]
> > > > "default defaults" vs "-nodefault defaults"
> > > > -------------------------------------------
> > > > 
> > > > Two bad news:
> > > > 
> > > > 1) We need to differentiate buses created by the machine with
> > > >    "-nodefaults" and buses that are created only without
> > > >    "-nodefaults".
> > > > 
> > > > libvirt use -nodefaults when starting QEMU, so knowing which
> > > > buses are available when using -nodefaults is more interesting
> > > > for them.
> > > > 
> > > > Other software, on the other hand, might be interested in the
> > > > results without -nodefaults.
> > > > 
> > > > We need to be able model both cases in the new interface.
> > > > Suggestions are welcome.
> > > 
> > > The good news is that the list is short. The only[1] machines
> > > where the list of buses seem to change when using -nodefaults
> > > are:
> > > 
> > > * mpc8544ds
> > > * ppce500
> > > * mpc8544ds
> > > * ppce500
> > > * s390-ccw-virtio-*
> > > 
> > > On all cases above, the only difference is that a virtio bus is
> > > available if not using -nodefaults.
> > 
> > Hrm.. that's odd.  Well, it makes sense for the s390 which has special
> > virtio arrangements.  
> 
> I don't think it makes much sense for s390 either... is this a 'virtio'
> bus or a 'virtio-{pci,ccw}' bus? The transport bus should be present
> with -nodefaults; the virtio bus is basically a glue bus for virtio
> devices...

I mean no device of type "virtio-ccw-bus" (which is a subtype of
"virtio-bus") is present on the device tree.

Is the TYPE_VIRTIO_BUS bus supposed to be user-visible, or is it
just internal?

-- 
Eduardo
