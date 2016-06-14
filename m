Received: by 10.25.141.12 with SMTP id p12csp51568lfd;
        Mon, 13 Jun 2016 23:08:25 -0700 (PDT)
X-Received: by 10.140.20.179 with SMTP id 48mr12564847qgj.32.1465884505467;
        Mon, 13 Jun 2016 23:08:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c126si15519221qkf.208.2016.06.13.23.08.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 23:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32862 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bChWS-0002uU-RR
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 02:08:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bChWM-0002sF-Ms
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 02:08:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bChWH-0006xG-JG
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 02:08:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52030)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bChWH-0006x6-B0; Tue, 14 Jun 2016 02:08:13 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DBC218553F;
	Tue, 14 Jun 2016 06:08:12 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5E687KL012222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 14 Jun 2016 02:08:10 -0400
Date: Tue, 14 Jun 2016 08:08:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20160614060807.tkdq2dy2kw6d3bw4@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-6-git-send-email-drjones@redhat.com>
	<20160614020026.GH4882@voom.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160614020026.GH4882@voom.fritz.box>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 14 Jun 2016 06:08:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 05/16] hw/core/machine: add
 smp properites
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
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	imammedo@redhat.com, pbonzini@redhat.com, dgibson@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UC++/OHhmCAX

On Tue, Jun 14, 2016 at 12:00:26PM +1000, David Gibson wrote:
> On Fri, Jun 10, 2016 at 07:40:16PM +0200, Andrew Jones wrote:
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  hw/core/machine.c   | 81 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  include/hw/boards.h |  6 ++++
> >  2 files changed, 87 insertions(+)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 3dce9020e510a..2625044002e57 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -172,6 +172,53 @@ static void machine_set_dumpdtb(Object *obj, const char *value, Error **errp)
> >      ms->dumpdtb = g_strdup(value);
> >  }
> >  
> > +static void machine_get_smp(Object *obj, Visitor *v, const char *name,
> > +                            void *opaque, Error **errp)
> > +{
> > +    MachineState *ms = MACHINE(obj);
> > +    int64_t value;
> > +
> > +    if (strncmp(name, "sockets", 7) == 0) {
> > +        value = ms->sockets;
> > +    } else if (strncmp(name, "cores", 5) == 0) {
> > +        value = ms->cores;
> > +    } else if (strncmp(name, "threads", 7) == 0) {
> > +        value = ms->threads;
> > +    } else if (strncmp(name, "maxcpus", 7) == 0) {
> > +        value = ms->maxcpus;
> > +    } else if (strncmp(name, "cpus", 4) == 0) {
> > +        value = ms->cpus;
> > +    }
> > +
> > +    visit_type_int(v, name, &value, errp);
> > +}
> 
> Any particular for multiplexing all the set / get, rather than having
> separate callbacks for each property?

Not really. This way just makes denser code. But I'll go whichever
direction people prefer. Actually I should probably add an
else { error_report(...) } in either case, which means the multifunction
direction would still contain strncmps.

> 
> > +
> > +static void machine_set_smp(Object *obj, Visitor *v, const char *name,
> > +                            void *opaque, Error **errp)
> > +{
> > +    MachineState *ms = MACHINE(obj);
> > +    Error *error = NULL;
> > +    int64_t value;
> > +
> > +    visit_type_int(v, name, &value, &error);
> > +    if (error) {
> > +        error_propagate(errp, error);
> > +        return;
> > +    }
> > +
> > +    if (strncmp(name, "sockets", 7) == 0) {
> > +        ms->sockets = value;
> > +    } else if (strncmp(name, "cores", 5) == 0) {
> > +        ms->cores = value;;
> > +    } else if (strncmp(name, "threads", 7) == 0) {
> > +        ms->threads = value;
> > +    } else if (strncmp(name, "maxcpus", 7) == 0) {
> > +        ms->maxcpus = value;
> > +    } else if (strncmp(name, "cpus", 4) == 0) {
> > +        ms->cpus = value;
> > +    }
> > +}
> > +
> >  static void machine_get_phandle_start(Object *obj, Visitor *v,
> >                                        const char *name, void *opaque,
> >                                        Error **errp)
> > @@ -368,8 +415,18 @@ static void machine_init_notify(Notifier *notifier, void *data)
> >      foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
> >  }
> >  
> > +static void machine_set_smp_parameters(MachineState *ms)
> > +{
> > +    if (ms->sockets != -1 || ms->cores != -1 || ms->threads != -1 ||
> > +        ms->maxcpus != -1 || ms->cpus != -1) {
> > +        error_report("warning: cpu topology: "
> > +                     "machine properties currently ignored");
> > +    }
> > +}
> > +
> >  static void machine_pre_init(MachineState *ms)
> >  {
> > +    machine_set_smp_parameters(ms);
> >  }
> >  
> >  static void machine_class_init(ObjectClass *oc, void *data)
> > @@ -403,6 +460,11 @@ static void machine_initfn(Object *obj)
> >      ms->dump_guest_core = true;
> >      ms->mem_merge = true;
> >      ms->enable_graphics = true;
> > +    ms->sockets = -1;
> > +    ms->cores = -1;
> > +    ms->threads = -1;
> > +    ms->maxcpus = -1;
> > +    ms->cpus = -1;
> >  
> >      object_property_add_str(obj, "accel",
> >                              machine_get_accel, machine_set_accel, NULL);
> > @@ -462,6 +524,25 @@ static void machine_initfn(Object *obj)
> >      object_property_set_description(obj, "dt-compatible",
> >                                      "Overrides the \"compatible\" property of the dt root node",
> >                                      NULL);
> > +    object_property_add(obj, "sockets", "int", machine_get_smp,
> > +                        machine_set_smp, NULL, NULL, NULL);
> > +    object_property_set_description(obj, "sockets", "Number of sockets", NULL);
> > +    object_property_add(obj, "cores", "int", machine_get_smp,
> > +                        machine_set_smp, NULL, NULL, NULL);
> > +    object_property_set_description(obj, "cores",
> > +                                    "Number of cores per socket", NULL);
> > +    object_property_add(obj, "threads", "int", machine_get_smp,
> > +                        machine_set_smp, NULL, NULL, NULL);
> > +    object_property_set_description(obj, "threads",
> > +                                    "Number of threads per core", NULL);
> > +    object_property_add(obj, "maxcpus", "int", machine_get_smp,
> > +                        machine_set_smp, NULL, NULL, NULL);
> > +    object_property_set_description(obj, "maxcpus", "Maximum number of cpus",
> > +                                    NULL);
> > +    object_property_add(obj, "cpus", "int", machine_get_smp,
> > +                        machine_set_smp, NULL, NULL, NULL);
> > +    object_property_set_description(obj, "cpus", "Number of online cpus",
> > +                                    NULL);
> >      object_property_add_bool(obj, "dump-guest-core",
> >                               machine_get_dump_guest_core,
> >                               machine_set_dump_guest_core,
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index 4e8dc68b07a24..53adbfe2a3099 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -166,6 +166,12 @@ struct MachineState {
> >      char *initrd_filename;
> >      const char *cpu_model;
> >      AccelState *accelerator;
> > +
> > +    int sockets;
> > +    int cores;
> > +    int threads;
> > +    int maxcpus;
> > +    int cpus;
> 
> Hrm.. as the tests added in earlier patches highlight, essentially one
> of these properties is redundant.  Is there a reason to include them
> all, rather than to pick one to drop?

Well, IMO, only maxcpus could be dropped. I'd prefer not to though
because it's a convenient state to have pre-calculated, and possibly
error prone to leave to all users to re-calculate.

Thanks,
drew

> 
> >  };
> >  
> >  #define DEFINE_MACHINE(namestr, machine_initfn) \
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson


