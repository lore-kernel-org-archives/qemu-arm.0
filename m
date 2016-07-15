Received: by 10.25.21.156 with SMTP id 28csp457064lfv;
        Thu, 14 Jul 2016 23:45:47 -0700 (PDT)
X-Received: by 10.200.51.34 with SMTP id t31mr26580118qta.61.1468565147329;
        Thu, 14 Jul 2016 23:45:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i129si4348465qkc.23.2016.07.14.23.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 23:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58768 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNwsc-0005De-OM
	for alex.bennee@linaro.org; Fri, 15 Jul 2016 02:45:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59864)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNws8-0004vt-L7
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 02:45:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bNws3-00041q-O2
	for qemu-arm@nongnu.org; Fri, 15 Jul 2016 02:45:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47438)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1bNws3-00040N-IX; Fri, 15 Jul 2016 02:45:11 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC3A465F45;
	Fri, 15 Jul 2016 06:45:07 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-66.brq.redhat.com [10.40.204.66])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6F6j3vI028087
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 Jul 2016 02:45:05 -0400
Date: Fri, 15 Jul 2016 08:45:03 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20160715064503.zzbhgzkubx7sy26p@hawk.localdomain>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-16-git-send-email-drjones@redhat.com>
	<20160714205119.GH31865@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160714205119.GH31865@thinpad.lan.raisama.net>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 15 Jul 2016 06:45:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH RFC 15/16] smbios: don't use
 smp_cores, smp_threads
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
X-TUID: 9fiq0MEX+3qp

On Thu, Jul 14, 2016 at 05:51:19PM -0300, Eduardo Habkost wrote:
> On Fri, Jun 10, 2016 at 07:40:26PM +0200, Andrew Jones wrote:
> > SMBIOS needs cpu topology for Type4 tables, so we need to pass
> > it in. There are several parameters so we use a structure. There
> > are two callers (of non-legacy, which generates Type4 tables),
> > x86 and arm, so we also update both to pass the topology
> > parameters from their MachineState properties (directly in the
> > case of x86, indirectly through VirtGuestInfo in the case of arm).
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> [...]
> > @@ -701,12 +701,19 @@ static uint32_t x86_cpu_apic_id_from_index(MachineState *ms,
> >      }
> >  }
> >  
> > -static void pc_build_smbios(FWCfgState *fw_cfg)
> > +static void pc_build_smbios(MachineState *ms, FWCfgState *fw_cfg)
> >  {
> >      uint8_t *smbios_tables, *smbios_anchor;
> >      size_t smbios_tables_len, smbios_anchor_len;
> >      struct smbios_phys_mem_area *mem_array;
> >      unsigned i, array_count;
> > +    struct smbios_cpu_topology topo = {
> > +        .sockets = ms->sockets,
> > +        .cores   = ms->cores,
> > +        .threads = ms->threads,
> > +        .maxcpus = ms->maxcpus,
> > +        .cpus    = ms->cpus,
> > +    };
> >  
> 
> Do we really need to manually copy data around this way when
> smbios.c could just use qdev_get_machine() directly?

You tell me. The art of writing object-oriented-ish code in C with
qom and qdev and a pile of qemu-best-practices is still something
I'm trying to sort out :-)

Using qdev_get_machine() sounds good to me though.

drew

> 
> -- 
> Eduardo
> 
