Received: by 10.80.166.35 with SMTP id d32csp1199559edc;
        Tue, 18 Oct 2016 14:08:25 -0700 (PDT)
X-Received: by 10.200.34.145 with SMTP id f17mr2727878qta.149.1476824904880;
        Tue, 18 Oct 2016 14:08:24 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k86si22109487qkl.213.2016.10.18.14.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 18 Oct 2016 14:08:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43979 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwbcW-0005uW-6O
	for alex.bennee@linaro.org; Tue, 18 Oct 2016 17:08:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35790)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwbZh-0004Ke-7k
	for qemu-devel@nongnu.org; Tue, 18 Oct 2016 17:05:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwbZg-0000bs-9E
	for qemu-devel@nongnu.org; Tue, 18 Oct 2016 17:05:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bwbZe-0000YI-4n; Tue, 18 Oct 2016 17:05:26 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 99F827F749;
	Tue, 18 Oct 2016 21:05:24 +0000 (UTC)
Received: from localhost (ovpn-116-121.phx2.redhat.com [10.3.116.121])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9IL5LWU032076; Tue, 18 Oct 2016 17:05:22 -0400
Date: Tue, 18 Oct 2016 18:49:37 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161018204937.GB5057@thinpad.lan.raisama.net>
References: <20161018130007.k7hhxovkxiqiumfj@kamzik.brq.redhat.com>
	<20161018131829.GQ3275@thinpad.lan.raisama.net>
	<20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
	<CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
	<20161018175737.3biqteztu3esvaaq@kamzik.brq.redhat.com>
	<CAFEAcA-TxifV3Wfnv=6byJSABnLyPnbtfMsK+aPvwGd-p5sqLA@mail.gmail.com>
	<20161018184532.GC3275@thinpad.lan.raisama.net>
	<CAFEAcA8nCjr2Zz2no3DikyGtRtYRm+ieouatfOJnynkzpJ+thg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8nCjr2Zz2no3DikyGtRtYRm+ieouatfOJnynkzpJ+thg@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 18 Oct 2016 21:05:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] QOM properties vs C functions/fields (was Re:
 [PATCH v3 2/3] exec: rename cpu_exec_init() as cpu_exec_realizefn())
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@uclinux.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 752XqsHvkkEJ
Message-ID: <20161018204937.fNafc5YYim-iNRxjxC23A3KmOfdrV9kR-AN4j2ziKzg@z>

On Tue, Oct 18, 2016 at 09:30:01PM +0100, Peter Maydell wrote:
> On 18 October 2016 at 19:45, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Tue, Oct 18, 2016 at 07:12:51PM +0100, Peter Maydell wrote:
> >> We actually have a concrete instance in the tree at the moment:
> >> the raspberry pi 2. Specifically hw/arm/bcm2836.c sets the
> >> mp_affinity for each cpu to 0xF00 | n (where n is the CPUID).
> >> Currently it's doing that by reaching in and messing with
> >> the mp_affinity field directly, but really it ought to be
> >> doing it by setting a property on the CPU, and what it
> >> wants isn't somethnig that can be expressed with a simple
> >> nr_sockets/nr_cores/etc scheme.
> >
> > I am confused now. I thought QOM properties were meant for
> > user-visible and/or user-configurable data. I assumed that if
> > it's only meant to be used by C code inside QEMU, C functions
> > and/or C struct fields were the way to go.
> 
> Lots of stuff in a device's C struct is strictly internal
> and not to be messed with. I thought that QOM properties
> were essentially how a device defined its public (and
> typically settable-only-once) config knobs. QOM properties
> shouldn't be user-facing (read: stable, required to be
> backwards-compatible) interface in general because
> we don't really want to tie ourselves down that much.
> In fact almost all our QOM objects are not usefully
> user-facing at all.

This interpretation surprises me, because it is the opposite of
what I have seen us doing. Most of our QOM objects and properties
are user-visible and user-configurable using -global, -device,
-object, or qom-set (and probably other QMP commands).

Some QOM properties are internal and we have been using the "x-"
prefix to indicate that, but most of them do _not_ have the "x-"
prefix.

-- 
Eduardo
