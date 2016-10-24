Received: by 10.80.166.35 with SMTP id d32csp2495132edc;
        Mon, 24 Oct 2016 00:25:11 -0700 (PDT)
X-Received: by 10.55.182.135 with SMTP id g129mr14856240qkf.166.1477293911651;
        Mon, 24 Oct 2016 00:25:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f186si10178914qkj.69.2016.10.24.00.25.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Oct 2016 00:25:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45058 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1byZd8-000146-Gc
	for alex.bennee@linaro.org; Mon, 24 Oct 2016 03:25:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1byZd2-00013i-Mi
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 03:25:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1byZcz-00033j-I8
	for qemu-arm@nongnu.org; Mon, 24 Oct 2016 03:25:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48874)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1byZcz-00033T-AV; Mon, 24 Oct 2016 03:25:01 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 70F52624DC;
	Mon, 24 Oct 2016 07:24:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-39.ams2.redhat.com
	[10.36.116.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9O7OrOi021107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 24 Oct 2016 03:24:55 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 658F71138645; Mon, 24 Oct 2016 09:24:53 +0200 (CEST)
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
	<87d1iteeym.fsf@dusky.pond.sub.org>
	<CAFEAcA_OqsPrQzD2pLWXkP18fu3ems=ZZwg62kL7roMm+TU+dg@mail.gmail.com>
Date: Mon, 24 Oct 2016 09:24:53 +0200
In-Reply-To: <CAFEAcA_OqsPrQzD2pLWXkP18fu3ems=ZZwg62kL7roMm+TU+dg@mail.gmail.com>
	(Peter Maydell's message of "Sat, 22 Oct 2016 10:31:11 +0100")
Message-ID: <87k2cy9pkq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 24 Oct 2016 07:25:00 +0000 (UTC)
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Jia Liu <proljc@gmail.com>, Alexander Graf <agraf@suse.de>,
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
X-TUID: 6G3PPqw4owU9

Peter Maydell <peter.maydell@linaro.org> writes:

> On 21 October 2016 at 19:26, Markus Armbruster <armbru@redhat.com> wrote:
>> "Device not pluggable" does not imply "device has no configuration knobs
>> a user may legitimately want to mess with".  Plenty of onboard devices
>> have such knobs.
>>
>> Right now, users configure these mostly via board-agnostic options like
>> -serial.  Anything that doesn't fit the mold can't be configured that
>> way.
>>
>> However, A fully mature QOM as I envisage it would provide users access
>> to QOM properties for onboard devices, too.  Not with -device,
>> obviously, but with qom-set and similar, as Eduardo said.  If any of
>> these properties are not for users, they should be marked as such.  Just
>> like for pluggable devices.
>
> Yes, you're right about this. (What's the command line
> equivalent of qom-set?

Command line isn't implemented.

>                        We have -global but that's a bit
> awkward if I'm remembering its syntax correctly.)

-global changes a device property default value.  You can abuse it to
set a specific device's property only when there's at most one instance.

>> Perhaps non-pluggable devices tend to have more "not for users" QOM
>> properties than pluggable ones, I don't know.  But that would be a
>> *quantitative* difference, not a *qualitative* one.
>
> I agree that it's not really qualitative, but a pluggable
> device's properties are all by definition for the user
> to set (since the user is the only one who can set them).
> In a pre-plugged device, although there may be a lot of
> properties, some of them won't be usefully changeable
> in the context of this device in this board (ie if you
> mess with them you'll just break things). We don't have
> any way for the board to say "this stuff isn't for the
> user", I think.

The closest we have now is the x-prefix convention.

Perhaps we could use a flag to mark certain properties as "not
user-settable", similar to how we mark devices as "not pluggable"
(really: can be created only by board code, not the user).
