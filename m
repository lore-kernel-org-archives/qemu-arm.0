Received: by 10.25.0.144 with SMTP id 138csp64116lfa;
        Tue, 18 Apr 2017 18:42:24 -0700 (PDT)
X-Received: by 10.237.44.162 with SMTP id g31mr298027qtd.43.1492566144782;
        Tue, 18 Apr 2017 18:42:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g55si833943qtc.87.2017.04.18.18.42.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Apr 2017 18:42:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0edU-0003B1-Ak
	for alex.bennee@linaro.org; Tue, 18 Apr 2017 21:42:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0edR-0003Aw-2g
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 21:42:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0edN-0001wK-WC
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 21:42:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56058)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d0edN-0001w9-QH; Tue, 18 Apr 2017 21:42:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 880619D0CB;
	Wed, 19 Apr 2017 01:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 880619D0CB
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 880619D0CB
Received: from localhost (ovpn-116-28.gru2.redhat.com [10.97.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9044C78428;
	Wed, 19 Apr 2017 01:42:09 +0000 (UTC)
Date: Tue, 18 Apr 2017 22:42:07 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20170419014207.GT25239@thinpad.lan.raisama.net>
References: <20170418221724.5707-1-ehabkost@redhat.com>
	<20170418221724.5707-4-ehabkost@redhat.com>
	<20170419002926.GC23273@umbus.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170419002926.GC23273@umbus.fritz.box>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 19 Apr 2017 01:42:16 +0000 (UTC)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Paul Burton <paul.burton@imgtec.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
	Yongbok Kim <yongbok.kim@imgtec.com>, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Scott Wood <scottwood@freescale.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Marcel Apfelbaum <marcel@redhat.com>, David Gibson <dgibson@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xdcd9IKQa6Tq

On Wed, Apr 19, 2017 at 10:29:26AM +1000, David Gibson wrote:
> On Tue, Apr 18, 2017 at 07:17:21PM -0300, Eduardo Habkost wrote:
> > pci_bus_new*() and pci_register_bus() work only when the 'parent'
> > argument is a PCI_HOST_BRIDGE object. Rename them to reflect that they
> > are meant to initialize a bus that's in a PCI host bridge.
> > 
> > The new function names are:
> > * pci_host_bus_init() (replacing pci_bus_new())
> > * pci_host_bus_init_inplace() (replacing pci_bus_new_inplace())
> > * pci_host_bus_init_irqs() (replacing pci_register_bus())
> 
> I like the idea, but I'm not terribly convinced by these names.
> Aren't functions which allocate objects usually called whatever_new()
> rather than whatever_init()?  And pci_register_bus() appears to do
> more than just initialize irqs.

I agree the names aren't terribly clear. This is what they are
supposed to mean:

* pci_host_bus_init(phb) initializes phb->bus.
* pci_host_bus_init(phb) initializes phb->bus using an
  already-allocated object.
* pci_host_bus_init_irqs() does the same as pci_host_bus_init(),
  but also calls pci_bus_irqs().

I plan to submit API documentation comments later. I am open to
alternative name suggestions.

-- 
Eduardo
