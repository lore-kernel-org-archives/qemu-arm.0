Received: by 10.25.0.147 with SMTP id 141csp592920lfa;
        Tue, 21 Feb 2017 09:08:13 -0800 (PST)
X-Received: by 10.200.45.137 with SMTP id p9mr6026156qta.201.1487696893202;
        Tue, 21 Feb 2017 09:08:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v33si15518569qtv.194.2017.02.21.09.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 09:08:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47013 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgDv8-0005YC-H6
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 12:08:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34266)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgD08-0007UR-Mc
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 11:09:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cgD07-0004SN-Go
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 11:09:16 -0500
Received: from mx1.redhat.com ([209.132.183.28]:37368)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cgD07-0004Ry-8g; Tue, 21 Feb 2017 11:09:15 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6136E61BB9;
	Tue, 21 Feb 2017 16:09:15 +0000 (UTC)
Received: from localhost (ovpn-116-33.gru2.redhat.com [10.97.116.33])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LG9EA7014297; Tue, 21 Feb 2017 11:09:14 -0500
Date: Tue, 21 Feb 2017 13:09:12 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170221160912.GF2778@thinpad.lan.raisama.net>
References: <1486996099-15820-1-git-send-email-peter.maydell@linaro.org>
	<1486996099-15820-5-git-send-email-peter.maydell@linaro.org>
	<20170220201029.441d825b@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170220201029.441d825b@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 21 Feb 2017 16:09:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 4/4] hw/arm/virt: Use new
 cpu_generic_new()
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZeLsZPTeXaBL

On Mon, Feb 20, 2017 at 08:10:29PM +0100, Igor Mammedov wrote:
> On Mon, 13 Feb 2017 14:28:19 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> 
> > Use the new cpu_generic_new() rather than calling
> > parse_features by hand.
> > 
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/arm/virt.c | 24 ++----------------------
> >  1 file changed, 2 insertions(+), 22 deletions(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index f3440f2..bcb9a6d 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -172,7 +172,6 @@ static const char *valid_cpus[] = {
> >  static bool cpuname_valid(const char *cpu)
> >  {
> >      int i;
> > -
> >      for (i = 0; i < ARRAY_SIZE(valid_cpus); i++) {
> >          if (strcmp(cpu, valid_cpus[i]) == 0) {
> >              return true;
> > @@ -1206,10 +1205,6 @@ static void machvirt_init(MachineState *machine)
> >      MemoryRegion *ram = g_new(MemoryRegion, 1);
> >      const char *cpu_model = machine->cpu_model;
> >      char **cpustr;
> > -    ObjectClass *oc;
> > -    const char *typename;
> > -    CPUClass *cc;
> > -    Error *err = NULL;
> >      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
> >      uint8_t clustersz;
> >  
> > @@ -1240,6 +1235,7 @@ static void machvirt_init(MachineState *machine)
> >          error_report("mach-virt: CPU %s not supported", cpustr[0]);
> >          exit(1);
> >      }
> > +    g_strfreev(cpustr);
> >  
> >      /* If we have an EL3 boot ROM then the assumption is that it will
> >       * implement PSCI itself, so disable QEMU's internal implementation
> > @@ -1309,24 +1305,8 @@ static void machvirt_init(MachineState *machine)
> >  
> >      create_fdt(vms);
> >  
> > -    oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
> > -    if (!oc) {
> > -        error_report("Unable to find CPU definition");
> > -        exit(1);
> > -    }
> > -    typename = object_class_get_name(oc);
> > -
> > -    /* convert -smp CPU options specified by the user into global props */
> > -    cc = CPU_CLASS(oc);
> > -    cc->parse_features(typename, cpustr[1], &err);
> > -    g_strfreev(cpustr);
> > -    if (err) {
> > -        error_report_err(err);
> > -        exit(1);
> > -    }
> > -
> >      for (n = 0; n < smp_cpus; n++) {
> > -        Object *cpuobj = object_new(typename);
> > +        Object *cpuobj = OBJECT(cpu_generic_new(TYPE_ARM_CPU, cpu_model));
> It unnecessarily pushes cpu_model parsing farther down the call stack
> when all we need for CPU creation is type name.

I don't see a problem in pushing it down the call stack.  It is
just replacing logic that is duplicated on lots of boards to a
wrapper. When we refactor the parsing logic, it will be easier to
do it if parsing is inside a single wrapper insted of being
duplicated on multiple boards.

> 
> Since I'm looking at adding '-device cpu' support to virt-arm,
> I would prefer to leave object_new() here so that creation logic
> would be similar to device_add and not mix '-cpu' parsing to typename
> + global properties that could be moved to generic machine code
> with actual CPU creation.

We can still move parsing to generic machine code, with the new
wrapper. While we don't do that, we can have a helper that makes
the current API easier to use. Once we move parsing to generic
machine code, we can easily replace cpu_generic_new() with
object_new().

> 
> 
> >          if (!vmc->disallow_affinity_adjustment) {
> >              /* Adjust MPIDR like 64-bit KVM hosts, which incorporate the
> >               * GIC's target-list limitations. 32-bit KVM hosts currently
> 

-- 
Eduardo
