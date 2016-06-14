Received: by 10.25.141.12 with SMTP id p12csp62142lfd;
        Mon, 13 Jun 2016 23:43:21 -0700 (PDT)
X-Received: by 10.200.56.184 with SMTP id f53mr13321248qtc.39.1465886601020;
        Mon, 13 Jun 2016 23:43:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d52si17501357qga.57.2016.06.13.23.43.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 23:43:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCi4G-0001iJ-Ex
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 02:43:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bCi4A-0001fl-Gd
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 02:43:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bCi45-0005vD-9R
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 02:43:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60580)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bCi45-0005uI-12; Tue, 14 Jun 2016 02:43:09 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 641983B709;
	Tue, 14 Jun 2016 06:43:08 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5E6h3hZ019729
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 14 Jun 2016 02:43:06 -0400
Date: Tue, 14 Jun 2016 08:43:03 +0200
From: Andrew Jones <drjones@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20160614064303.prf7npx7c6vtorw7@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-3-git-send-email-drjones@redhat.com>
	<20160614012852.GF4882@voom.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160614012852.GF4882@voom.fritz.box>
User-Agent: Mutt/1.5.23.1 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 14 Jun 2016 06:43:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 02/16] vl: smp: add checks
 for maxcpus based topologies
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
X-TUID: 1FNhxwo+fpGV

On Tue, Jun 14, 2016 at 11:28:52AM +1000, David Gibson wrote:
> On Fri, Jun 10, 2016 at 07:40:13PM +0200, Andrew Jones wrote:
> > smp_parse computes missing smp options. Unfortunately cores and
> > threads are computed by dividing smp_cpus, instead of max_cpus.
> > This is incorrect because the topology doesn't leave room for
> > hotplug. More unfortunately, we can't change it easily, as doing
> > so would impact existing command lines. This patch adds a warning
> > when the topology doesn't add up, and then checks that the topology
> > at least computes when sockets are recalculated. If not, then it
> > does fail.
> > 
> > Adding the new failure is justified by the fact that we don't
> > store the number of input sockets, and thus all consumers of
> > cpu topology information recalculate it. If they choose to
> > (correctly) calculate it based on maxcpus, then we need to
> > guard them against building topologies which provide more cpu
> > slots than are the maximum allowed cpus.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> 
> Hmm.. this makes sense to me.  Except that I've never been clear if
> sockets= was supposed to match initial cpus or maxcpus.

The topology we describe in DT and ACPI (at least ACPI) must describe
all possible cpus (maxcpus).

Thanks,
drew

> 
> > ---
> >  vl.c | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> > 
> > diff --git a/vl.c b/vl.c
> > index 7b96e787922f9..8d482cb1bf020 100644
> > --- a/vl.c
> > +++ b/vl.c
> > @@ -1227,6 +1227,7 @@ static void smp_parse(QemuOpts *opts)
> >          unsigned sockets = qemu_opt_get_number(opts, "sockets", 0);
> >          unsigned cores   = qemu_opt_get_number(opts, "cores", 0);
> >          unsigned threads = qemu_opt_get_number(opts, "threads", 0);
> > +        bool sockets_input = sockets > 0;
> >  
> >          /* compute missing values, prefer sockets over cores over threads */
> >          if (cpus == 0 || sockets == 0) {
> > @@ -1269,6 +1270,24 @@ static void smp_parse(QemuOpts *opts)
> >              exit(1);
> >          }
> >  
> > +        if (sockets_input && sockets * cores * threads != max_cpus) {
> > +            unsigned sockets_rounded = DIV_ROUND_UP(max_cpus, cores * threads);
> > +
> > +            error_report("warning: cpu topology: "
> > +                         "sockets (%u) * cores (%u) * threads (%u) != "
> > +                         "maxcpus (%u). Trying sockets=%u.",
> > +                         sockets, cores, threads, max_cpus, sockets_rounded);
> > +            sockets = sockets_rounded;
> > +
> > +            if (sockets * cores * threads > max_cpus) {
> > +                error_report("cpu topology: "
> > +                             "sockets (%u) * cores (%u) * threads (%u) > "
> > +                             "maxcpus (%u)",
> > +                             sockets, cores, threads, max_cpus);
> > +                exit(1);
> > +            }
> > +        }
> > +
> >          smp_cpus = cpus;
> >          smp_cores = cores;
> >          smp_threads = threads;
> 
> -- 
> David Gibson			| I'll have my music baroque, and my code
> david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
> 				| _way_ _around_!
> http://www.ozlabs.org/~dgibson


