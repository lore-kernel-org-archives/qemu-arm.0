Received: by 10.80.166.35 with SMTP id d32csp228766edc;
        Wed, 19 Oct 2016 04:11:39 -0700 (PDT)
X-Received: by 10.55.101.201 with SMTP id z192mr4915734qkb.35.1476875499610;
        Wed, 19 Oct 2016 04:11:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d56si23949672qtb.37.2016.10.19.04.11.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Oct 2016 04:11:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47001 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bwomY-0004sN-Uk
	for alex.bennee@linaro.org; Wed, 19 Oct 2016 07:11:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwomF-0004fZ-HA
	for qemu-arm@nongnu.org; Wed, 19 Oct 2016 07:11:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bwomA-0000bk-As
	for qemu-arm@nongnu.org; Wed, 19 Oct 2016 07:11:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49360)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1bwomA-0000bP-2z; Wed, 19 Oct 2016 07:11:14 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 118997D0E6;
	Wed, 19 Oct 2016 11:11:11 +0000 (UTC)
Received: from localhost (ovpn-116-104.phx2.redhat.com [10.3.116.104])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9JBB7rM016179; Wed, 19 Oct 2016 07:11:07 -0400
Date: Wed, 19 Oct 2016 09:11:06 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161019111106.GD5057@thinpad.lan.raisama.net>
References: <20161018142247.55d4aymduofvhy3r@kamzik.brq.redhat.com>
	<20161018152207.GZ3275@thinpad.lan.raisama.net>
	<20161018162202.pmui5rv3va7ubcrv@kamzik.brq.redhat.com>
	<CAFEAcA8UtCr6wpz_3aYb694ixPhuRnyiTrHNwRjGWNYe+9t4aA@mail.gmail.com>
	<20161018175737.3biqteztu3esvaaq@kamzik.brq.redhat.com>
	<CAFEAcA-TxifV3Wfnv=6byJSABnLyPnbtfMsK+aPvwGd-p5sqLA@mail.gmail.com>
	<20161018184532.GC3275@thinpad.lan.raisama.net>
	<CAFEAcA8nCjr2Zz2no3DikyGtRtYRm+ieouatfOJnynkzpJ+thg@mail.gmail.com>
	<20161018204937.GB5057@thinpad.lan.raisama.net>
	<CAFEAcA9Cd0TsLHgBr-GuOwYmrwcPW656YOP2msAGrhghDS3xBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9Cd0TsLHgBr-GuOwYmrwcPW656YOP2msAGrhghDS3xBw@mail.gmail.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 19 Oct 2016 11:11:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] QOM properties vs C functions/fields (was Re:
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
X-TUID: PRD5cVTd+yb8

On Tue, Oct 18, 2016 at 10:08:21PM +0100, Peter Maydell wrote:
> On 18 October 2016 at 21:49, Eduardo Habkost <ehabkost@redhat.com> wrote:
> > On Tue, Oct 18, 2016 at 09:30:01PM +0100, Peter Maydell wrote:
> >> Lots of stuff in a device's C struct is strictly internal
> >> and not to be messed with. I thought that QOM properties
> >> were essentially how a device defined its public (and
> >> typically settable-only-once) config knobs. QOM properties
> >> shouldn't be user-facing (read: stable, required to be
> >> backwards-compatible) interface in general because
> >> we don't really want to tie ourselves down that much.
> >> In fact almost all our QOM objects are not usefully
> >> user-facing at all.
> >
> > This interpretation surprises me, because it is the opposite of
> > what I have seen us doing. Most of our QOM objects and properties
> > are user-visible and user-configurable using -global, -device,
> > -object, or qom-set (and probably other QMP commands).
> 
> Most of the devices I deal with are not and never will
> be sensibly usable with -device. Exposing wiring up
> of IRQ and GPIO lines or MMIO regions to the user is
> never going to make sense. For x86 most devices are
> probably pluggable (and usable with -device), but over
> the whole source tree I think the embedded-style device
> is in the majority. They're all still worth QOMifying
> and having properties for the things board code wants
> to modify, though.

Even if they are not usable with -device, all properties are
configurable using -global. There's no mechanism to avoid letting
the user configure properties for devices. Is this really OK?

If internal-only usage is also an intended use case for QOM
properties, fine. But I believe we need to communicate this more
clearly, based on the previous thread (subject: "QOM: best way
for parents to pass information to children?").

BTW, if most devices aren't supposed to be used with -device,
possibly many of them don't have
cannot_instantiate_with_device_add_yet set properly. On the 2.6.2
binaries in Fedora 24, I see:

* 1671 device types (including CPU types)
* 1011 CPU device types
* 1076 no-user device types (including CPU types)
* 660 non-CPU device types
* 65 no-user non-CPU device types (10% of them)
* 860 type_register_*() lines in the code
  (this includes non-TYPE_DEVICE types, though)
* 56 cannot_instantiate_with_device_add_yet=true lines in the code

Commands I used to get the numbers above:

  $ for f in /usr/bin/qemu-system-*;do \
     (echo 'info qdm';echo quit;) | $f -machine none -nodefaults -monitor stdio -nographic 2>&1 \
    done | grep ^name | sort -u > /tmp/devs
  $ wc -l /tmp/devs
  1671 /tmp/devs
  $ grep no-user /tmp/devs | wc -l
  1076
  $ grep -- '-cpu"' /tmp/devs | wc -l
  1011
  $ grep -v -- '-cpu"' /tmp/devs | wc -l
  660
  $ grep -v -- '-cpu"' /tmp/devs | grep no-user | wc -l
  65
  $ 

-- 
Eduardo
