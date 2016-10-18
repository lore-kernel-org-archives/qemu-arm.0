Received: by 10.80.166.35 with SMTP id d32csp1143160edc;
        Tue, 18 Oct 2016 11:45:56 -0700 (PDT)
X-Received: by 10.55.168.209 with SMTP id r200mr2245237qke.160.1476816356487;
        Tue, 18 Oct 2016 11:45:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s129si7468410qkb.141.2016.10.18.11.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 11:45:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43307 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwZOW-0006v9-Oc
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 14:45:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwZOO-0006tR-9g
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 14:45:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwZOK-0004UW-EY
	for qemu-arm@nongnu.org; Tue, 18 Oct 2016 14:45:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bwZOK-0004U9-4F; Tue, 18 Oct 2016 14:45:36 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF4A4C04B319;
	Tue, 18 Oct 2016 18:45:34 +0000 (UTC)
Received: from localhost (ovpn-116-159.phx2.redhat.com [10.3.116.159])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IIjX5U005394; Tue, 18 Oct 2016 14:45:33 -0400
Date: Tue, 18 Oct 2016 16:45:32 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161018184532.GC3275@thinpad.lan.raisama.net>
References: <1476485569-6744-3-git-send-email-lvivier@redhat.com>
	<20161017192022.GA3275@thinpad.lan.raisama.net>
	<20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
	<20161018131829.GQ3275@thinpad.lan.raisama.net>
	<20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
	<CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
	<20161018175737.3biqteztu3esvaaq@kamzik.brq.redhat.com>
	<CAFEAcA-TxifV3Wfnv=6byJSABnLyPnbtfMsK+aPvwGd-p5sqLA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-TxifV3Wfnv=6byJSABnLyPnbtfMsK+aPvwGd-p5sqLA@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 18 Oct 2016 18:45:35 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] QOM properties vs C functions/fields (was Re:
 [Qemu-devel] [PATCH v3 2/3] exec: rename cpu_exec_init() as
 cpu_exec_realizefn())
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
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Jia Liu <proljc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
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
X-TUID: IndWHbnFxrV8

On Tue, Oct 18, 2016 at 07:12:51PM +0100, Peter Maydell wrote:
> On 18 October 2016 at 18:57, Andrew Jones <drjones@redhat.com> wrote:
> > On Tue, Oct 18, 2016 at 06:07:49PM +0100, Peter Maydell wrote:
> >> Why do you want to un-property mp_affinity? Eventually it would
> >> be nice for the machine model to be able to use it to set up
> >> a specific NUMA configuration.
> >
> > I thought about that, but I think we'll want to specify machine
> > properties; nr_sockets, nr_cores, nr_threads and use the -device
> > command line for the cpu to specify which socket, which core,
> > which thread it is. This would be consistent with other architectures
> > and easily map to the MPIDR & cpu topology hardware descriptions.
> 
> I was thinking more about "modelling board X, which we know
> always has 2xA53 and 4xA57 with these MPIDRs".
> 
> We actually have a concrete instance in the tree at the moment:
> the raspberry pi 2. Specifically hw/arm/bcm2836.c sets the
> mp_affinity for each cpu to 0xF00 | n (where n is the CPUID).
> Currently it's doing that by reaching in and messing with
> the mp_affinity field directly, but really it ought to be
> doing it by setting a property on the CPU, and what it
> wants isn't somethnig that can be expressed with a simple
> nr_sockets/nr_cores/etc scheme.

I am confused now. I thought QOM properties were meant for
user-visible and/or user-configurable data. I assumed that if
it's only meant to be used by C code inside QEMU, C functions
and/or C struct fields were the way to go.

See a previous thread where this was discussed:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg387169.html

(Subject: "QOM: best way for parents to pass information to
children?")

> 
> > Anyway, atm, I don't know of any reason to have the property user-
> > settable, so it seems safest to keep it hidden until we decide.
> 
> I agree that it doesn't make sense to let the user mess with it,
> but it should be available for the board code to read and write.

If it doesn't make sense to let the user mess with it, why would
we make it a QOM property?

-- 
Eduardo
