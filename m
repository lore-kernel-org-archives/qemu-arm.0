Received: by 10.25.15.230 with SMTP id 99csp647593lfp;
        Thu, 23 Mar 2017 01:48:47 -0700 (PDT)
X-Received: by 10.200.36.194 with SMTP id t2mr1189629qtt.61.1490258927752;
        Thu, 23 Mar 2017 01:48:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o16si3159044qto.176.2017.03.23.01.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 01:48:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqyQJ-0006tF-4v
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 04:48:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqyQE-0006sE-Pf
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 04:48:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1cqyQB-0002UQ-NZ
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 04:48:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60414)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1cqyQB-0002UB-H9; Thu, 23 Mar 2017 04:48:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DC088046B;
	Thu, 23 Mar 2017 08:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4DC088046B
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 4DC088046B
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DB445DD62;
	Thu, 23 Mar 2017 08:48:36 +0000 (UTC)
Date: Thu, 23 Mar 2017 09:48:34 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Bharata B Rao <bharata.rao@gmail.com>
Message-ID: <20170323094834.0de7c3cb@nial.brq.redhat.com>
In-Reply-To: <CAGZKiBpD=uLyJWFPhxKYfn0-wLL2WYnUm5h4KJhZ_fVHi+1z-w@mail.gmail.com>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-6-git-send-email-imammedo@redhat.com>
	<CAGZKiBpD=uLyJWFPhxKYfn0-wLL2WYnUm5h4KJhZ_fVHi+1z-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 23 Mar 2017 08:48:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 05/23] numa: move
 source of default CPUs to NUMA node mapping into boards
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org, "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cePKcZw1mIit

On Thu, 23 Mar 2017 11:40:29 +0530
Bharata B Rao <bharata.rao@gmail.com> wrote:

> On Wed, Mar 22, 2017 at 7:02 PM, Igor Mammedov <imammedo@redhat.com> wrote:
> 
> > diff --git a/numa.c b/numa.c
> > index e01cb54..b6e71bc 100644
> > --- a/numa.c
> > +++ b/numa.c
> > @@ -294,9 +294,10 @@ static void validate_numa_cpus(void)
> >      g_free(seen_cpus);
> >  }
> >
> > -void parse_numa_opts(MachineClass *mc)
> > +void parse_numa_opts(MachineState *ms)
> >  {
> >      int i;
> > +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> >
> >      for (i = 0; i < MAX_NODES; i++) {
> >          numa_info[i].node_cpu = bitmap_new(max_cpus);
> > @@ -378,14 +379,16 @@ void parse_numa_opts(MachineClass *mc)
> >           * rule grouping VCPUs by socket so that VCPUs from the same
> > socket
> >           * would be on the same node.
> >           */
> > +        if (!mc->cpu_index_to_instance_props) {
> > +            error_report("default CPUs to NUMA node mapping isn't
> > supported");
> > +            exit(1);
> > +        }
> >  
> 
> Just trying to understand the impact of the above enforcement. So targets
> and machine types that don't define ->cpu_index_to_instance_props() are
> expected not to boot ? Shouldn't they have a default to fall back upon ?
Currently there are 3 boards that support numa and with this series
they all implement cpu_index_to_instance_props callback,
so boards that has supported numa shouldn't be affected.

But if someone used '-numa' with a board that doesn't support numa,
it would stop booting with error message instead of silently parsing
not supported option or falling back bogus defaults (which aren't
used anyway).


> Regards,
> Bharata.

