Received: by 10.25.0.144 with SMTP id 138csp454087lfa;
        Wed, 19 Apr 2017 14:23:56 -0700 (PDT)
X-Received: by 10.55.81.196 with SMTP id f187mr4886971qkb.278.1492637036636;
        Wed, 19 Apr 2017 14:23:56 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b43si3674594qtb.70.2017.04.19.14.23.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 14:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50480 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0x4u-00078W-1v
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 17:23:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0x19-0004Au-Ff
	for qemu-devel@nongnu.org; Wed, 19 Apr 2017 17:20:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0x18-0007sR-EU
	for qemu-devel@nongnu.org; Wed, 19 Apr 2017 17:20:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58270)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d0x13-0007qa-QJ; Wed, 19 Apr 2017 17:19:58 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17B182E6041;
	Wed, 19 Apr 2017 21:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 17B182E6041
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 17B182E6041
Received: from localhost (ovpn-116-28.gru2.redhat.com [10.97.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20F921710A;
	Wed, 19 Apr 2017 21:19:51 +0000 (UTC)
Date: Wed, 19 Apr 2017 18:19:49 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <20170419211949.GA32287@thinpad.lan.raisama.net>
References: <20170418221724.5707-1-ehabkost@redhat.com>
	<20170418221724.5707-4-ehabkost@redhat.com>
	<20170419002926.GC23273@umbus.fritz.box>
	<20170419014207.GT25239@thinpad.lan.raisama.net>
	<20170419140522.391f0b50.cornelia.huck@de.ibm.com>
	<387c438e-d993-bd59-a59a-83c58d447eab@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <387c438e-d993-bd59-a59a-83c58d447eab@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 19 Apr 2017 21:19:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v2 3/6] pci: Rename and change signatures of
 pci_bus_new() & related functions
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
	Paul Burton <paul.burton@imgtec.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
	Yongbok Kim <yongbok.kim@imgtec.com>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Scott Wood <scottwood@freescale.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	David Gibson <dgibson@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laszlo Ersek <lersek@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Sffx90rUnq43

On Wed, Apr 19, 2017 at 09:41:19PM +0300, Marcel Apfelbaum wrote:
> On 04/19/2017 03:05 PM, Cornelia Huck wrote:
> > On Tue, 18 Apr 2017 22:42:07 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:
> > 
> > > On Wed, Apr 19, 2017 at 10:29:26AM +1000, David Gibson wrote:
> > > > On Tue, Apr 18, 2017 at 07:17:21PM -0300, Eduardo Habkost wrote:
> > > > > pci_bus_new*() and pci_register_bus() work only when the 'parent'
> > > > > argument is a PCI_HOST_BRIDGE object. Rename them to reflect that they
> > > > > are meant to initialize a bus that's in a PCI host bridge.
> > > > > 
> > > > > The new function names are:
> > > > > * pci_host_bus_init() (replacing pci_bus_new())
> > > > > * pci_host_bus_init_inplace() (replacing pci_bus_new_inplace())
> > > > > * pci_host_bus_init_irqs() (replacing pci_register_bus())
> > > > 
> > > > I like the idea, but I'm not terribly convinced by these names.
> > > > Aren't functions which allocate objects usually called whatever_new()
> > > > rather than whatever_init()?  And pci_register_bus() appears to do
> > > > more than just initialize irqs.
> > > 
> > > I agree the names aren't terribly clear. This is what they are
> > > supposed to mean:
> > > 
> > > * pci_host_bus_init(phb) initializes phb->bus.
> > > * pci_host_bus_init(phb) initializes phb->bus using an
> > >   already-allocated object.
> > > * pci_host_bus_init_irqs() does the same as pci_host_bus_init(),
> > >   but also calls pci_bus_irqs().
> > > 
> > > I plan to submit API documentation comments later. I am open to
> > > alternative name suggestions.
> > > 
> > 
> > pci_host_bus_init_irqs() sounds as if it would only init irqs. What
> 
> Right! This is what I thought too.
> 
> > about:
> > 
> > pci_host_bus_new()
> > pci_host_bus_new_inplace()
> > pci_host_bus_new_with_irqs()
> 
> I like the names, but a following patch (5/6) modifies
> the above functions to return void and create the bus
> as a side effect.
> So now we have a pci_host_bus_new that returns nothing?

I plan to change the approach, and not get rid of pci_bus_new().
I will probably just move the PCI_HOST_BRIDGE-specific code to a
separate function (probably I will name it pci_host_init_bus()),
that will call pci_bus_new(), append the bridge to
pci_host_bridges, and set PCIHostState::bus.

After that, we can change pci_bridge_initfn() to use
pci_bus_new() instead of reimplementing it.

-- 
Eduardo
