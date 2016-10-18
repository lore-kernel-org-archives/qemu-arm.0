Received: by 10.80.166.35 with SMTP id d32csp1122542edc;
        Tue, 18 Oct 2016 10:57:58 -0700 (PDT)
X-Received: by 10.55.21.164 with SMTP id 36mr1941498qkv.215.1476813478800;
        Tue, 18 Oct 2016 10:57:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65si2934279qke.245.2016.10.18.10.57.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 10:57:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43135 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwYeD-0006uo-No
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 13:57:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bwYe9-0006uW-BH
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bwYe6-0002sw-0t
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 13:57:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52044)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1bwYe5-0002sg-Q8; Tue, 18 Oct 2016 13:57:49 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF03381239;
	Tue, 18 Oct 2016 17:57:47 +0000 (UTC)
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IHvciA019130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 18 Oct 2016 13:57:40 -0400
Date: Tue, 18 Oct 2016 19:57:37 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161018175737.3biqteztu3esvaaq@kamzik.brq.redhat.com>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017192022.GA3275@thinpad.lan.raisama.net>
	<20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
	<20161018131829.GQ3275@thinpad.lan.raisama.net>
	<20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
	<CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 18 Oct 2016 17:57:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 2/3] exec: rename
 cpu_exec_init() as cpu_exec_realizefn()
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HhG0BLRX11Zd

On Tue, Oct 18, 2016 at 06:07:49PM +0100, Peter Maydell wrote:
> On 18 October 2016 at 17:22, Andrew Jones <drjones@redhat.com> wrote:
> > I'll note that it's
> > accepted to reach into machine state through current_machine from
> > the machine's devices.
> 
> That doesn't sound like a great idea to me -- where do we
> do it? A quick grep for uses of current_machine in hw/ shows only
> hw/ppc/spapr_rtas.c, which is a bit of a weirdo thing because
> it's the implementation of a bunch of hypercalls, not an actual
> device.
> 
> We have lots of code currently in devices that looks at bits
> of overall state that it should ideally not (but which it can
> because we have a lot of global variables). In an ideal world
> we'd clean these up so that the devices were initialized with
> suitable properties instead to tell them about this global state.
> 
> >> > I considered that, but if we un-property ARMCPU->mp_affinity, then where
> >> > can it be initialized to "MP_AFFINITY_INVALID", which would be ff000000?
> >>
> >> Property defaults are normally initialized on instance_init.
> >
> > OK, so after this series goes through we can un-property mp_affinity and
> > add an mp_affinity initialization back to arm_cpu_initfn, but one that
> > only sets the initial invalid value.
> 
> Note that mp_affinity is a bit awkward because for KVM we can't
> get the right values out of the kernel until quite late (when
> kvm_init_vcpu() is called).
> 
> Why do you want to un-property mp_affinity? Eventually it would
> be nice for the machine model to be able to use it to set up
> a specific NUMA configuration.

I thought about that, but I think we'll want to specify machine
properties; nr_sockets, nr_cores, nr_threads and use the -device
command line for the cpu to specify which socket, which core,
which thread it is. This would be consistent with other architectures
and easily map to the MPIDR & cpu topology hardware descriptions.
Anyway, atm, I don't know of any reason to have the property user-
settable, so it seems safest to keep it hidden until we decide.

Thanks,
drew
