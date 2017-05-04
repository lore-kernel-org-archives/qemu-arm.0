Received: by 10.25.0.198 with SMTP id 189csp493010lfa;
        Thu, 4 May 2017 02:54:46 -0700 (PDT)
X-Received: by 10.55.133.193 with SMTP id h184mr6594172qkd.150.1493891686021;
        Thu, 04 May 2017 02:54:46 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y5si1473303qkc.328.2017.05.04.02.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 02:54:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6DT9-0003Vj-8q
	for alex.bennee@linaro.org; Thu, 04 May 2017 05:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d6DRM-00025J-4y
	for qemu-devel@nongnu.org; Thu, 04 May 2017 05:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1d6DRL-0008FP-2M
	for qemu-devel@nongnu.org; Thu, 04 May 2017 05:52:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51218)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1d6DRE-0008BD-Mk; Thu, 04 May 2017 05:52:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7791980C1B;
	Thu,  4 May 2017 09:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7791980C1B
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7791980C1B
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7673E5DD67;
	Thu,  4 May 2017 09:52:40 +0000 (UTC)
Date: Thu, 4 May 2017 11:52:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170504115239.3bae3732@nial.brq.redhat.com>
In-Reply-To: <20170503175802.GU3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-24-git-send-email-imammedo@redhat.com>
	<20170503163543.GR3482@thinpad.lan.raisama.net>
	<5f71cfda-2a73-77e3-0bf7-85e2aed53811@redhat.com>
	<20170503173841.GT3482@thinpad.lan.raisama.net>
	<20170503175802.GU3482@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 04 May 2017 09:52:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 23/24] numa: add '-numa cpu,
 ...' option for property based node mapping
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vGEiWwuFFiaM

On Wed, 3 May 2017 14:58:02 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Wed, May 03, 2017 at 02:38:41PM -0300, Eduardo Habkost wrote:
> > On Wed, May 03, 2017 at 11:39:10AM -0500, Eric Blake wrote:  
> > > On 05/03/2017 11:35 AM, Eduardo Habkost wrote:
> > >   
> > > >> +
> > > >> +        memset(&cpu, 0, sizeof(cpu));
> > > >> +        cpu.has_node_id = object->u.cpu.has_node_id;
> > > >> +        cpu.node_id = object->u.cpu.node_id;
> > > >> +        cpu.has_socket_id = object->u.cpu.has_socket_id;
> > > >> +        cpu.socket_id = object->u.cpu.socket_id;
> > > >> +        cpu.has_core_id = object->u.cpu.has_core_id;
> > > >> +        cpu.core_id = object->u.cpu.core_id;
> > > >> +        cpu.has_thread_id = object->u.cpu.has_thread_id;
> > > >> +        cpu.thread_id = object->u.cpu.thread_id;  
> > > > 
> > > > We don't have a way to avoid copying each field individually?
> > > > Some visitor trick, maybe?
> > > > 
> > > > Eric, Markus, Michael, do you have any suggestions?  
> > > 
> > > Markus just added QAPI_CLONE_MEMBERS(), which sounds like what you want:
> > > 
> > > https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg04867.html  
> > 
> > Not sure if it would work in this case. Note that cpu and
> > object->u.cpu have different types. 'cpu' is CpuInstanceProps,
> > but object->u.cpu is NodeCpuOptions.
> > 
> > NodeCpuOptions has { 'base': 'CpuInstanceProps' }, and
> > CpuInstanceProps field declarations are duplicated in struct
> > NodeCpuOptions. Do you know why struct inheritance is implemented
> > by duplicating the fields of the base struct instead of embedding
> > the base struct?  
> 
> Nevermind, I just found out that QAPI generates a
> qapi_NumaCpuOptions_base() upcast helper. So this can be solved
> with no data copying at all:
> 
>  machine_set_cpu_numa_nodes(ms, qapi_NumaCpuOptions_base(&object->u.cpu), &err);
> 

Thanks for finding out, I'll try it this way
