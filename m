Received: by 10.25.159.19 with SMTP id i19csp341930lfe;
        Thu, 4 Feb 2016 01:19:05 -0800 (PST)
X-Received: by 10.55.78.207 with SMTP id c198mr7482512qkb.34.1454577545831;
        Thu, 04 Feb 2016 01:19:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b53si5718335qge.77.2016.02.04.01.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Feb 2016 01:19:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRG49-0006M5-0B
	for alex.bennee@linaro.org; Thu, 04 Feb 2016 04:19:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aRG45-0006Lx-Ts
	for qemu-arm@nongnu.org; Thu, 04 Feb 2016 04:19:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1aRG42-0001qy-LC
	for qemu-arm@nongnu.org; Thu, 04 Feb 2016 04:19:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1aRG42-0001qr-FH; Thu, 04 Feb 2016 04:18:58 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 10F51C0C235F;
	Thu,  4 Feb 2016 09:18:58 +0000 (UTC)
Received: from hawk.localdomain (dhcp-1-158.brq.redhat.com [10.34.1.158])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u149Ir8P017443
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Feb 2016 04:18:56 -0500
Date: Thu, 4 Feb 2016 10:18:48 +0100
From: Andrew Jones <drjones@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Message-ID: <20160204091848.GA3890@hawk.localdomain>
References: <1454511578-24863-1-git-send-email-drjones@redhat.com>
	<56B2AF65.3080402@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56B2AF65.3080402@huawei.com>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	shannon.zhao@linaro.org
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: fix max-cpus check
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Af6R/2N7oIMB

On Thu, Feb 04, 2016 at 09:54:45AM +0800, Shannon Zhao wrote:
> 
> 
> On 2016/2/3 22:59, Andrew Jones wrote:
> > mach-virt doesn't yet support hotplug, but command lines specifying
> > -smp <num>,maxcpus=<bigger-num> don't fail. Of course specifying
> > bigger-num as something bigger than the machine supports, e.g. > 8
> > on a gicv2 machine, should fail though. This fix also makes mach-
> > virt's max-cpus check truly consistent with the one in vl.c:main,
> > as the one there was already correctly checking max-cpus instead
> > of smp-cpus.
> > 
> > Reported-by: Shannon Zhao <shannon.zhao@linaro.org>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  hw/arm/virt.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 15658f49c4e06..44bbbea92b1cf 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -1013,7 +1013,7 @@ static void machvirt_init(MachineState *machine)
> >      MemoryRegion *sysmem = get_system_memory();
> >      MemoryRegion *secure_sysmem = NULL;
> >      int gic_version = vms->gic_version;
> > -    int n, max_cpus;
> > +    int n, virt_max_cpus;
> >      MemoryRegion *ram = g_new(MemoryRegion, 1);
> >      const char *cpu_model = machine->cpu_model;
> >      VirtBoardInfo *vbi;
> > @@ -1051,15 +1051,15 @@ static void machvirt_init(MachineState *machine)
> >       * many redistributors we can fit into the memory map.
> >       */
> >      if (gic_version == 3) {
> > -        max_cpus = vbi->memmap[VIRT_GIC_REDIST].size / 0x20000;
> > +        virt_max_cpus = vbi->memmap[VIRT_GIC_REDIST].size / 0x20000;
> >      } else {
> > -        max_cpus = GIC_NCPU;
> > +        virt_max_cpus = GIC_NCPU;
> >      }
> >  
> > -    if (smp_cpus > max_cpus) {
> > +    if (max_cpus > virt_max_cpus) {
> >          error_report("Number of SMP CPUs requested (%d) exceeds max CPUs "
> Does it need to change the SMP?    ^~~~

If we consider max_cpus to be [the maximum] "SMP CPUs" after hotplug, then
I think it's OK. When I changed smp_cpus to max_cpus in vl.c (c00cd995),
either that was my reasoning for leaving it (or it was just overlooked :-),
but now that the messages are consistent, I should change them both if that's
the consensus.

Thanks,
drew
