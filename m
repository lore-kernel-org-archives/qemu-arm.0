Received: by 10.25.21.156 with SMTP id 28csp1322534lfv;
        Thu, 14 Jul 2016 02:16:52 -0700 (PDT)
X-Received: by 10.55.7.14 with SMTP id 14mr15691056qkh.135.1468487812446;
        Thu, 14 Jul 2016 02:16:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x35si770724qtb.87.2016.07.14.02.16.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 02:16:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52416 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNclH-0004i0-TB
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 05:16:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54550)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNcl8-0004dn-QK
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 05:16:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNcl5-0006Hk-JE
	for qemu-arm@nongnu.org; Thu, 14 Jul 2016 05:16:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bNcl5-0006HE-CB; Thu, 14 Jul 2016 05:16:39 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DF2161A11;
	Thu, 14 Jul 2016 09:16:38 +0000 (UTC)
Received: from kamzik.localdomain (dhcp-1-220.brq.redhat.com [10.34.1.220])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6E9GYTe028388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 14 Jul 2016 05:16:36 -0400
Date: Thu, 14 Jul 2016 11:16:33 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org
Message-ID: <20160714091633.k6ilf5dnp5sfrmds@kamzik.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465580427-13596-1-git-send-email-drjones@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 14 Jul 2016 09:16:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 00/16] Rework SMP parameters
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, agraf@suse.de,
	pbonzini@redhat.com, imammedo@redhat.com, dgibson@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SKO5OSzCAwyb


Eduardo,

ping?

I'd like to spin a v1 soon, but have been putting it off until
I can get some input from you about this RFC.

Thanks,
drew


On Fri, Jun 10, 2016 at 07:40:11PM +0200, Andrew Jones wrote:
> This series is a first step in eliminating smp_* global
> variables (the last patch gets rid of two of them!) And, it's
> a first step in deprecating '-smp' in favor of using machine
> properties, e.g.
>  qemu -machine pc,sockets=2,cores=2,threads=2,maxcpus=8,cpus=8 ...
> 
> It's also a first step in allowing machine types to override
> the default parameter parsing, which makes assumptions that
> not all machine types may agree with. (mach-virt is coming...)
> 
> So, three first steps, I guess that's 3 steps. And a forth
> thing it does is some fixes for the smp parsing and also for
> SMBIOS use of cpu topology.
> 
> Tested with kvm-unit-tests on all five arches supported
> there, x86_64 both with KVM and TCG, and booting an x86_64
> guest (KVM) to check SMBIOS before and after in order to make
> sure it was the same. Also compile tested all targets.
> 
> Thanks,
> drew
> 
> 
> Andrew Jones (15):
>   vl: smp_parse: cleanups
>   vl: smp: add checks for maxcpus based topologies
>   hw/smbios/smbios: fix number of sockets calculation
>   hw/core/machine: add smp properites
>   vl: move smp parsing to machine pre_init
>   qom/cpu: make nr-cores,nr-threads real properties
>   hw/core/machine: set cpu global nr_cores,nr_threads in pre_init
>   hw/i386/pc: don't use smp_cores,smp_threads
>   hw/ppc/spapr: don't use smp_cores,smp_threads
>   target-ppc: don't use smp_threads
>   hw/arm/virt: rename *.smp_cpus to *.cpus
>   hw/arm/virt: don't use smp_cpus,max_cpus
>   hw/arm/virt: stash cpu topo info in VirtGuestInfo
>   smbios: don't use smp_cores,smp_threads
>   sysemu/cpus: bye, bye smp_cores,smp_threads
> 
> Igor Mammedov (1):
>   hw/core/machine: Introduce pre_init
> 
>  cpus.c                           |   2 -
>  hw/arm/virt-acpi-build.c         |  14 +--
>  hw/arm/virt.c                    |  41 +++++---
>  hw/core/machine.c                | 210 +++++++++++++++++++++++++++++++++++++++
>  hw/i386/pc.c                     |  39 +++++---
>  hw/ppc/spapr.c                   |   9 +-
>  hw/ppc/spapr_rtas.c              |   2 +-
>  hw/smbios/smbios.c               |  20 ++--
>  include/hw/arm/virt-acpi-build.h |   6 +-
>  include/hw/boards.h              |   7 ++
>  include/hw/smbios/smbios.h       |  10 ++
>  include/sysemu/cpus.h            |  10 --
>  qom/cpu.c                        |   8 ++
>  target-ppc/translate_init.c      |  15 ++-
>  vl.c                             | 101 +++++++------------
>  15 files changed, 356 insertions(+), 138 deletions(-)
> 
> -- 
> 2.4.11
> 
> 
