Received: by 10.25.21.156 with SMTP id 28csp455408lfv;
        Thu, 14 Jul 2016 23:40:22 -0700 (PDT)
X-Received: by 10.55.111.199 with SMTP id k190mr14158971qkc.22.1468564822381;
        Thu, 14 Jul 2016 23:40:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j128si4303259qkf.227.2016.07.14.23.40.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 23:40:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58738 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNwnN-0007mu-RW
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 02:40:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNwnJ-0007mn-PU
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 02:40:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNwnG-0002tY-IO
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 02:40:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bNwnG-0002tU-C2; Fri, 15 Jul 2016 02:40:14 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDB52D4D96;
	Fri, 15 Jul 2016 06:40:13 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6F6e9xE009034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 Jul 2016 02:40:11 -0400
Date: Fri, 15 Jul 2016 08:40:08 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160715064008.wndxd22jbf4k5dwb@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-15-git-send-email-drjones@redhat.com>
	<20160714204351.GG31865@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160714204351.GG31865@thinpad.lan.raisama.net>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 15 Jul 2016 06:40:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 14/16] hw/arm/virt: stash
 cpu topo info in VirtGuestInfo
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
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, agraf@suse.de,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	dgibson@redhat.com, imammedo@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6gLxtjqo3t0+

On Thu, Jul 14, 2016 at 05:43:51PM -0300, Eduardo Habkost wrote:
> On Fri, Jun 10, 2016 at 07:40:25PM +0200, Andrew Jones wrote:
> > This is a first step to preparing mach-virt for configurable
> > cpu topology, and is necessary now to prepare to move smbios
> > code away from using cpu topology globals smp_cores,smp_threads.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> I'd rather put a MachineState pointer inside VirtGuestInfo, and
> eventually eliminate VirtGuestInfo completely (like we already
> did with PCGuestInfo in x86).

I'll look at the history of PCGuestInfo's death. It sounds good to me.

> 
> > ---
> >  hw/arm/virt.c                    | 6 +++++-
> >  include/hw/arm/virt-acpi-build.h | 4 ++++
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 134b6e36623ba..769a49aa5be77 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1281,7 +1281,11 @@ static void machvirt_init(MachineState *machine)
> >      create_fw_cfg(vbi, &address_space_memory);
> >      rom_set_fw(fw_cfg_find());
> >  
> > -    guest_info->cpus = vbi->cpus;
> > +    guest_info->sockets = machine->sockets;
> > +    guest_info->cores   = machine->cores;
> > +    guest_info->threads = machine->threads;
> > +    guest_info->maxcpus = machine->maxcpus;
> > +    guest_info->cpus    = machine->cpus;
> >      guest_info->fw_cfg = fw_cfg_find();
> >      guest_info->memmap = vbi->memmap;
> >      guest_info->irqmap = vbi->irqmap;
> > diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
> > index d6c5982960403..a34fb04230e66 100644
> > --- a/include/hw/arm/virt-acpi-build.h
> > +++ b/include/hw/arm/virt-acpi-build.h
> > @@ -27,6 +27,10 @@
> >  #define ACPI_GICC_ENABLED 1
> >  
> >  typedef struct VirtGuestInfo {
> > +    int sockets;
> > +    int cores;
> > +    int threads;
> > +    int maxcpus;
> >      int cpus;
> >      FWCfgState *fw_cfg;
> >      const MemMapEntry *memmap;
> > -- 
> > 2.4.11
> > 
> > 
> 
> -- 
> Eduardo
> 
