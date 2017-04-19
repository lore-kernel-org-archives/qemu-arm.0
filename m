Received: by 10.25.0.144 with SMTP id 138csp252856lfa;
        Wed, 19 Apr 2017 05:50:32 -0700 (PDT)
X-Received: by 10.200.38.21 with SMTP id u21mr2204855qtu.96.1492606232799;
        Wed, 19 Apr 2017 05:50:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b18si2213524qkj.183.2017.04.19.05.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 05:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47986 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0p44-0003z5-C6
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 08:50:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0p41-0003yu-6v
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 08:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0p3w-0000OT-8W
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 08:50:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46262)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d0p3w-0000O9-2u; Wed, 19 Apr 2017 08:50:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 809023DBD3;
	Wed, 19 Apr 2017 12:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 809023DBD3
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 809023DBD3
Received: from localhost (ovpn-116-28.gru2.redhat.com [10.97.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 014007F371;
	Wed, 19 Apr 2017 12:50:02 +0000 (UTC)
Date: Wed, 19 Apr 2017 09:50:01 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170419125001.GU25239@thinpad.lan.raisama.net>
References: <20170418221724.5707-1-ehabkost@redhat.com>
	<20170418221724.5707-4-ehabkost@redhat.com>
	<CAFEAcA_Ky5SecogNFq3+RO8pX4sqxvsSbw0KihAv=8teqCSJbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_Ky5SecogNFq3+RO8pX4sqxvsSbw0KihAv=8teqCSJbw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 19 Apr 2017 12:50:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC v2 3/6] pci: Rename and change signatures of
 pci_bus_new() & related functions
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Paul Burton <paul.burton@imgtec.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Yongbok Kim <yongbok.kim@imgtec.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Scott Wood <scottwood@freescale.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>, David Gibson <dgibson@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Laszlo Ersek <lersek@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L7wIpdYsEZbZ

On Wed, Apr 19, 2017 at 09:41:42AM +0100, Peter Maydell wrote:
> On 18 April 2017 at 23:17, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > pci_bus_new*() and pci_register_bus() work only when the 'parent'
> > argument is a PCI_HOST_BRIDGE object. Rename them to reflect that they
> > are meant to initialize a bus that's in a PCI host bridge.
> >
> > The new function names are:
> > * pci_host_bus_init() (replacing pci_bus_new())
> > * pci_host_bus_init_inplace() (replacing pci_bus_new_inplace())
> > * pci_host_bus_init_irqs() (replacing pci_register_bus())
> 
> This is moving these functions away from the convention that
> we seem to mostly follow for buses (eg ISA, SCSI) of
> foo_bus_new() to allocate and return a new bus, and
> foo_bus_new_inplace() to initialize a bus that's inline in
> some other struct.
> 
> I'm not sure this is a good idea unless we have a plan to
> convert all the other QOM buses and document that this is
> the right way to implement init for a bus.

The point of the rename is that those functions are doing more
than just allocating a PCIBus. They do some initialization of
PCIHostState as well. That's why non-root PCI buses can't be
created by pci_bus_new*() today.

Maybe the answer here is to move the PCI_HOST_BRIDGE-specific
code somewhere else, and make pci_bus_new*() more generic. This
would allow us to reuse pci_bus_new*() when creating non-root PCI
buses, later.

-- 
Eduardo
