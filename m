Received: by 10.25.0.144 with SMTP id 138csp1711964lfa;
        Tue, 18 Apr 2017 06:31:08 -0700 (PDT)
X-Received: by 10.200.53.187 with SMTP id k56mr13494156qtb.69.1492522268084;
        Tue, 18 Apr 2017 06:31:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c55si13896421qtb.120.2017.04.18.06.31.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Apr 2017 06:31:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41943 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d0TDn-0003qH-IY
	for alex.bennee@linaro.org; Tue, 18 Apr 2017 09:31:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0TD7-0003RN-Ht
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 09:30:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d0TD1-0004g9-Le
	for qemu-arm@nongnu.org; Tue, 18 Apr 2017 09:30:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35020)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d0TD1-0004fy-FR; Tue, 18 Apr 2017 09:30:19 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5FB828124F;
	Tue, 18 Apr 2017 13:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5FB828124F
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 5FB828124F
Received: from localhost (ovpn-116-28.gru2.redhat.com [10.97.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 339784DA3E;
	Tue, 18 Apr 2017 13:30:06 +0000 (UTC)
Date: Tue, 18 Apr 2017 10:30:05 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <20170418133005.GL25239@thinpad.lan.raisama.net>
References: <20170417215916.12431-1-ehabkost@redhat.com>
	<20170417215916.12431-4-ehabkost@redhat.com>
	<9cbafe84-88bb-ca3c-d85e-dae71af438ff@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cbafe84-88bb-ca3c-d85e-dae71af438ff@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 18 Apr 2017 13:30:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC 3/7] pci: Change pci_bus_new*() parameter to
 PCIHostState
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
	"Michael S. Tsirkin" <mst@redhat.com>, aik@ozlabs.ru,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	David Gibson <dgibson@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xPBX1qua5eM5

On Tue, Apr 18, 2017 at 04:27:23PM +0300, Marcel Apfelbaum wrote:
[...]
> > @@ -431,7 +430,7 @@ PCIBus *pci_register_bus(DeviceState *parent, const char *name,
> >  {
> >      PCIBus *bus;
> > 
> > -    bus = pci_bus_new(parent, name, address_space_mem,
> > +    bus = pci_bus_new(PCI_HOST_BRIDGE(parent), name, address_space_mem,
> 
> If you request the parent to be PCI_HOST_BRIDGE, why don't you change also the signature of
> pci_register_bus ?

I do it on patch 4/7.

-- 
Eduardo
