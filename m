Received: by 10.80.166.35 with SMTP id d32csp1498567edc;
        Fri, 21 Oct 2016 11:26:26 -0700 (PDT)
X-Received: by 10.55.120.193 with SMTP id t184mr2488201qkc.155.1477074386419;
        Fri, 21 Oct 2016 11:26:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si2692057qky.239.2016.10.21.11.26.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 21 Oct 2016 11:26:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bxeWP-0002Z1-Sp
	for alex.bennee@linaro.org; Fri, 21 Oct 2016 14:26:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bxeWK-0002Yv-8U
	for qemu-arm@nongnu.org; Fri, 21 Oct 2016 14:26:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1bxeWH-0002YM-3x
	for qemu-arm@nongnu.org; Fri, 21 Oct 2016 14:26:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1bxeWG-0002XI-Sg; Fri, 21 Oct 2016 14:26:17 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DAA284E4C6;
	Fri, 21 Oct 2016 18:26:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-73.ams2.redhat.com
	[10.36.116.73])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9LIQAdO021959
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 21 Oct 2016 14:26:11 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A1EDB1138645; Fri, 21 Oct 2016 20:26:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
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
	<20161018204937.GB5057@thinpad.lan.raisama.net>
	<CAFEAcA9Cd0TsLHgBr-GuOwYmrwcPW656YOP2msAGrhghDS3xBw@mail.gmail.com>
Date: Fri, 21 Oct 2016 20:26:09 +0200
In-Reply-To: <CAFEAcA9Cd0TsLHgBr-GuOwYmrwcPW656YOP2msAGrhghDS3xBw@mail.gmail.com>
	(Peter Maydell's message of "Tue, 18 Oct 2016 22:08:21 +0100")
Message-ID: <87d1iteeym.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 21 Oct 2016 18:26:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] QOM properties vs C functions/fields
 (was Re: [PATCH v3 2/3] exec: rename cpu_exec_init() as
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
	QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Jia Liu <proljc@gmail.com>,
	Alexander Graf <agraf@suse.de>, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm <qemu-arm@nongnu.org>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G/9r2g0A+UgR

Peter Maydell <peter.maydell@linaro.org> writes:

> On 18 October 2016 at 21:49, Eduardo Habkost <ehabkost@redhat.com> wrote:
>> On Tue, Oct 18, 2016 at 09:30:01PM +0100, Peter Maydell wrote:
>>> Lots of stuff in a device's C struct is strictly internal
>>> and not to be messed with. I thought that QOM properties
>>> were essentially how a device defined its public (and
>>> typically settable-only-once) config knobs. QOM properties
>>> shouldn't be user-facing (read: stable, required to be
>>> backwards-compatible) interface in general because
>>> we don't really want to tie ourselves down that much.
>>> In fact almost all our QOM objects are not usefully
>>> user-facing at all.
>>
>> This interpretation surprises me, because it is the opposite of
>> what I have seen us doing. Most of our QOM objects and properties
>> are user-visible and user-configurable using -global, -device,
>> -object, or qom-set (and probably other QMP commands).
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

"Device not pluggable" does not imply "device has no configuration knobs
a user may legitimately want to mess with".  Plenty of onboard devices
have such knobs.

Right now, users configure these mostly via board-agnostic options like
-serial.  Anything that doesn't fit the mold can't be configured that
way.

However, A fully mature QOM as I envisage it would provide users access
to QOM properties for onboard devices, too.  Not with -device,
obviously, but with qom-set and similar, as Eduardo said.  If any of
these properties are not for users, they should be marked as such.  Just
like for pluggable devices.

Perhaps non-pluggable devices tend to have more "not for users" QOM
properties than pluggable ones, I don't know.  But that would be a
*quantitative* difference, not a *qualitative* one.
