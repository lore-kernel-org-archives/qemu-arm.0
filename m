Received: by 10.25.141.12 with SMTP id p12csp50208lfd;
        Mon, 13 Jun 2016 23:04:26 -0700 (PDT)
X-Received: by 10.55.160.211 with SMTP id j202mr18977604qke.0.1465884266794;
        Mon, 13 Jun 2016 23:04:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s4si17431816qge.8.2016.06.13.23.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 23:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bChSc-00008o-66
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 02:04:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bChNT-0003cx-Mv
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 01:59:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bChNP-00054W-HH
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 01:59:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bChNP-00054M-9W; Tue, 14 Jun 2016 01:59:03 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8C6D8553F;
	Tue, 14 Jun 2016 05:59:01 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5E5wvPH005879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 14 Jun 2016 01:58:59 -0400
Date: Tue, 14 Jun 2016 07:58:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20160614055856.6ixqhiuezthebact@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-5-git-send-email-drjones@redhat.com>
	<20160614013037.GG4882@voom.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160614013037.GG4882@voom.fritz.box>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 14 Jun 2016 05:59:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 04/16] hw/core/machine:
 Introduce pre_init
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
X-TUID: hOgHmq42f/Cp

On Tue, Jun 14, 2016 at 11:30:37AM +1000, David Gibson wrote:
> On Fri, Jun 10, 2016 at 07:40:15PM +0200, Andrew Jones wrote:
> > From: Igor Mammedov <imammedo@redhat.com>
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> I think this needs some kind of rationale.
> 
> Since with this patch it is called immediately before ->init, I'm not
> really seeing the point of this.

Many machines already override ->init, so if we want to move code
from vl.c into machine methods, but be sure that they run it now,
then we have to invent a pre-init. I (or Igor) can add something
like that to the commit message for the next round.

Thanks,
drew

> 
> > ---
> >  hw/core/machine.c   | 6 ++++++
> >  include/hw/boards.h | 1 +
> >  vl.c                | 1 +
> >  3 files changed, 8 insertions(+)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index ccdd5fa3e7728..3dce9020e510a 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -368,10 +368,16 @@ static void machine_init_notify(Notifier *notifier, void *data)
> >      foreach_dynamic_sysbus_device(error_on_sysbus_device, NULL);
> >  }
> >  
> > +static void machine_pre_init(MachineState *ms)
> > +{
> > +}
> > +
> >  static void machine_class_init(ObjectClass *oc, void *data)
> >  {
> >      MachineClass *mc = MACHINE_CLASS(oc);
> >  
> > +    mc->pre_init = machine_pre_init;
> > +
> >      /* Default 128 MB as guest ram size */
> >      mc->default_ram_size = 128 * M_BYTE;
> >      mc->rom_file_has_mr = true;
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index d268bd00a9f7d..4e8dc68b07a24 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -92,6 +92,7 @@ struct MachineClass {
> >      const char *alias;
> >      const char *desc;
> >  
> > +    void (*pre_init)(MachineState *state);
> >      void (*init)(MachineState *state);
> >      void (*reset)(void);
> >      void (*hot_add_cpu)(const int64_t id, Error **errp);
> > diff --git a/vl.c b/vl.c
> > index 8d482cb1bf020..4849dd465d667 100644
> > --- a/vl.c
> > +++ b/vl.c
> > @@ -4500,6 +4500,7 @@ int main(int argc, char **argv, char **envp)
> >      current_machine->boot_order = boot_order;
> >      current_machine->cpu_model = cpu_model;
> >  
> > +    machine_class->pre_init(current_machine);
> >      machine_class->init(current_machine);
> >  
> >      realtime_init();
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson


