Received: by 10.25.21.156 with SMTP id 28csp177844lfv;
        Tue, 2 Aug 2016 05:50:59 -0700 (PDT)
X-Received: by 10.129.75.6 with SMTP id y6mr46431860ywa.156.1470142254203;
        Tue, 02 Aug 2016 05:50:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si1485647qkc.230.2016.08.02.05.50.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Aug 2016 05:50:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bUZ9p-0006pm-LK
	for alex.bennee@linaro.org; Tue, 02 Aug 2016 08:50:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bUYea-0000p0-3J
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 08:18:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bUYeT-0004z3-FJ
	for qemu-devel@nongnu.org; Tue, 02 Aug 2016 08:18:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bUYeO-0004xR-LJ; Tue, 02 Aug 2016 08:18:24 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFDEC8553F;
	Tue,  2 Aug 2016 12:18:23 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u72CIKkp018478; Tue, 2 Aug 2016 08:18:21 -0400
Date: Tue, 2 Aug 2016 14:18:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160802141819.406aa754@nial.brq.redhat.com>
In-Reply-To: <CAFEAcA9cbsq5oWCABMww3EWkV8cPsaGJrO0NyPyc4Ph7aA_MQg@mail.gmail.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA_5jngVxajJxdJ0krz0inrkdjTNYYZ+5SNGOipoQo35ZA@mail.gmail.com>
	<79b91f02b26441be993e372cef44002d@nmail01.hynixad.com>
	<20160801094607.057cef2f@nial.brq.redhat.com>
	<CAFEAcA_6TQym4k3wiFEiAwwErJF0NDyqE8gDacfWK+n-rTsQyg@mail.gmail.com>
	<20160801111433.2af5c013@nial.brq.redhat.com>
	<CAFEAcA9cbsq5oWCABMww3EWkV8cPsaGJrO0NyPyc4Ph7aA_MQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 02 Aug 2016 12:18:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH 1/3] hw/arm/virt: add hotplug memory
 support
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	"kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Id3mW464h4Vm

On Tue, 2 Aug 2016 08:59:46 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 1 August 2016 at 10:14, Igor Mammedov <imammedo@redhat.com> wrote:
> > On Mon, 1 Aug 2016 09:13:34 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:  
> >> On 1 August 2016 at 08:46, Igor Mammedov <imammedo@redhat.com> wrote:  
> >> > Base alignment comes from max supported hugepage size,  
> >>
> >> Max hugepage size for any host? (if so, should be defined
> >> in a common header somewhere)
> >> Max hugepage size for ARM hosts? (if so, why is TCG
> >> different from KVM?, and should still be in a common
> >> header somewhere)  
> > It's the same for TCG but it probably doesn't matter much there,
> > main usage is to provide better performance with KVM.
> >
> > So I'd say it's host depended (for x86 it's 1Gb),
> > probably other values for ARM and PPC  
> 
> We probably don't want to make the memory layout depend
> on the host architecture, though :-(
Important here is not change it dynamically so it won't
break migration.
Otherwise it could be a value that makes a sense for
the use-case where performance matters most, i.e. KVM
which makes us to derive value from max supported page
size for a KVM host (meaning guest is the same arch)

In case of x86 value is constant hardcoded in target
specific code which applies to both KVM and TCG.

Perhaps there is a better way to handle it which I just
don't see.

> 
> >>  
> >> > while
> >> > size alignment should depend on backend's page size  
> >>
> >> Which page size do you have in mind here? TARGET_PAGE_SIZE
> >> is often not the right answer, since it doesn't
> >> correspond either to the actual page size being used
> >> by the host kernel or to the actual page size used
> >> by the guest kernel...  
> > alignment comes from here: memory_region_get_alignment()
> >
> > exec:c
> >    MAX(page_size, QEMU_VMALLOC_ALIGN)
> > so it's either backend's page size or a min chunk QEMU
> > allocates memory to make KVM/valgrind/whatnot happy.  
> 
> Since that's always larger than TARGET_PAGE_SIZE
> why are we checking for an alignment here that's
> not actually sufficient to make things work?
You mean following hunk:

+        if (QEMU_ALIGN_UP(machine->maxram_size,
+                     TARGET_PAGE_SIZE) != machine->maxram_size) {

It's a bit late to fix for x86 without breaking CLI,
side effect would be inability to hotplug upto maxmem if maxmem
is misaligned wrt used backend page size

ARCH_VIRT_HOTPLUG_MEM_ALIGN should be used instead of TARGET_PAGE_SIZE

PS:
I haven't reviewed series yet, but I'd split this patch in 3
to make review easier
  1st - introduce machine level hotplug hooks
  2nd - add MemoryHotplugState to VirtMachineState and initialize it
  3rd - add virt_dimm_plug() handler

> 
> thanks
> -- PMM
> 

