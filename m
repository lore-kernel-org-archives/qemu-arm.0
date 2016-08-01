Received: by 10.25.21.156 with SMTP id 28csp2524055lfv;
        Mon, 1 Aug 2016 02:14:50 -0700 (PDT)
X-Received: by 10.237.46.166 with SMTP id k35mr91012258qtd.93.1470042890220;
        Mon, 01 Aug 2016 02:14:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e96si19445779qtb.112.2016.08.01.02.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Aug 2016 02:14:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bU9JB-0005gF-Jm
	for alex.bennee@linaro.org; Mon, 01 Aug 2016 05:14:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38772)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bU9J5-0005eV-PC
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 05:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bU9J0-0002fD-JY
	for qemu-arm@nongnu.org; Mon, 01 Aug 2016 05:14:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59482)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bU9J0-0002f9-DZ; Mon, 01 Aug 2016 05:14:38 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A828BC04D2E6;
	Mon,  1 Aug 2016 09:14:37 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u719EYAL024314; Mon, 1 Aug 2016 05:14:34 -0400
Date: Mon, 1 Aug 2016 11:14:33 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160801111433.2af5c013@nial.brq.redhat.com>
In-Reply-To: <CAFEAcA_6TQym4k3wiFEiAwwErJF0NDyqE8gDacfWK+n-rTsQyg@mail.gmail.com>
References: <1468975744-12587-1-git-send-email-kwangwoo.lee@sk.com>
	<1468975744-12587-2-git-send-email-kwangwoo.lee@sk.com>
	<CAFEAcA_5jngVxajJxdJ0krz0inrkdjTNYYZ+5SNGOipoQo35ZA@mail.gmail.com>
	<79b91f02b26441be993e372cef44002d@nmail01.hynixad.com>
	<20160801094607.057cef2f@nial.brq.redhat.com>
	<CAFEAcA_6TQym4k3wiFEiAwwErJF0NDyqE8gDacfWK+n-rTsQyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 01 Aug 2016 09:14:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 1/3] hw/arm/virt: add hotplug memory
 support
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
Cc: Xiao Guangrong <guangrong.xiao@linux.intel.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"woosuk.chung@sk.com" <woosuk.chung@sk.com>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"hyunchul3.kim@sk.com" <hyunchul3.kim@sk.com>,
	"kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DSqZ/IvSk6Y0

On Mon, 1 Aug 2016 09:13:34 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 1 August 2016 at 08:46, Igor Mammedov <imammedo@redhat.com> wrote:
> > On Mon, 1 Aug 2016 00:35:35 +0000
> > "kwangwoo.lee@sk.com" <kwangwoo.lee@sk.com> wrote:  
> 
> >> > > +/* 1GB alignment for hotplug memory region */
> >> > > +#define ARCH_VIRT_HOTPLUG_MEM_ALIGN (1ULL << 30)  
> >> >
> >> > Where does the 1GB alignment come from? Why do we need 1GB
> >> > alignment for the base but only 1KB alignment for the size?  
> >>
> >> The alignment value of hotplug_memory.base referred from i386 pc.c and ppc spapr.c.
> >> Could you suggest a proper range for this?  
> 
> > Base alignment comes from max supported hugepage size,  
> 
> Max hugepage size for any host? (if so, should be defined
> in a common header somewhere)
> Max hugepage size for ARM hosts? (if so, why is TCG
> different from KVM?, and should still be in a common
> header somewhere)
It's the same for TCG but it probably doesn't matter much there,
main usage is to provide better performance with KVM.

So I'd say it's host depended (for x86 it's 1Gb),
probably other values for ARM and PPC

> 
> > while
> > size alignment should depend on backend's page size  
> 
> Which page size do you have in mind here? TARGET_PAGE_SIZE
> is often not the right answer, since it doesn't
> correspond either to the actual page size being used
> by the host kernel or to the actual page size used
> by the guest kernel...
alignment comes from here: memory_region_get_alignment()

exec:c
   MAX(page_size, QEMU_VMALLOC_ALIGN)
so it's either backend's page size or a min chunk QEMU
allocates memory to make KVM/valgrind/whatnot happy.

> 
> thanks
> -- PMM

