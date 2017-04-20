Received: by 10.25.0.144 with SMTP id 138csp808856lfa;
        Thu, 20 Apr 2017 09:18:45 -0700 (PDT)
X-Received: by 10.200.45.68 with SMTP id o4mr9404212qta.194.1492705125217;
        Thu, 20 Apr 2017 09:18:45 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 37si2823619qks.309.2017.04.20.09.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 20 Apr 2017 09:18:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54976 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d1En6-0003A1-DK
	for alex.bennee@linaro.org; Thu, 20 Apr 2017 12:18:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d1En1-00039p-4m
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 12:18:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1d1Emw-0005IG-TE
	for qemu-arm@nongnu.org; Thu, 20 Apr 2017 12:18:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:24647)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1d1Emw-0005Hm-Jw; Thu, 20 Apr 2017 12:18:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ABC243B554;
	Thu, 20 Apr 2017 16:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ABC243B554
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=armbru@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com ABC243B554
Received: from blackfin.pond.sub.org (ovpn-116-149.ams2.redhat.com
	[10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 370EE18B80;
	Thu, 20 Apr 2017 16:18:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 836511138646; Thu, 20 Apr 2017 18:18:26 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eric Blake <eblake@redhat.com>
References: <20170419222258.13415-1-eblake@redhat.com>
	<87k26fffxa.fsf@dusky.pond.sub.org>
	<1adf2797-b86a-00be-bb98-658ee8d0a55d@redhat.com>
Date: Thu, 20 Apr 2017 18:18:26 +0200
In-Reply-To: <1adf2797-b86a-00be-bb98-658ee8d0a55d@redhat.com> (Eric Blake's
	message of "Thu, 20 Apr 2017 08:31:13 -0500")
Message-ID: <87lgqv833h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 20 Apr 2017 16:18:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2] event: Add source
 information to SHUTDOWN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"open list:Overall" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Scott Wood <scottwood@freescale.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	Richard Henderson <rth@twiddle.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Igor Mammedov <imammedo@redhat.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Paul Burton <paul.burton@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Michael Walle <michael@walle.cc>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZhOk/IHm8NhB

Eric Blake <eblake@redhat.com> writes:

> On 04/20/2017 06:59 AM, Markus Armbruster wrote:
>
>> 
>> No objection to Alistair's idea to turn this into an enumeration.
>
> Question - should the enum be more than just 'guest' and 'host'?  For
> example, my patch proves that we have a lot of places that handle
> complimentary machine commands to reset and shutdown, and that whether
> 'reset' triggers a reset (and the guest keeps running as if rebooted) or
> a shutdown is then based on the command-line arguments given to qemu.
> So having the enum differentiate between 'guest-reset' and
> 'guest-shutdown' would be a possibility, if we want the enum to have
> additional states.

I don't know.  What I do know is that we better get the enum right:
while adding members is backwards-compatible, changing the member sent
for a specific trigger is not.  If we want to reserve the option to do
that anyway, we need suitable documentation.

>>> +++ b/vl.c
>>> @@ -1717,7 +1717,7 @@ void qemu_system_guest_panicked(GuestPanicInformation *info)
>>>      if (!no_shutdown) {
>>>          qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
>>>                                         !!info, info, &error_abort);
>>> -        qemu_system_shutdown_request();
>>> +        qemu_system_shutdown_request(false);
>> 
>> Panicking is a guest action.  Whether the shutdown on panic should be
>> attributed to guest or host is perhaps debatable.
>
> And it relates to the idea that a guest request for a 'reset' turns into
> a qemu response of 'shutdown'.  After all, whether a guest panic results
> in a shutdown action is determined by command-line arguments to qemu.
> So if we DO want to differentiate between a guest panic and a normal
> guest shutdown, when both events are wired at the command line to cause
> the SHUTDOWN action, then that's another enum to add to my list.
>
>
>>> +++ b/replay/replay.c
>>> @@ -51,7 +51,10 @@ bool replay_next_event_is(int event)
>>>          switch (replay_state.data_kind) {
>>>          case EVENT_SHUTDOWN:
>>>              replay_finish_event();
>>> -            qemu_system_shutdown_request();
>>> +            /* TODO: track source of shutdown request, to replay a
>>> +             * guest-initiated request rather than always claiming to
>>> +             * be from the host? */
>>> +            qemu_system_shutdown_request(false);
>> 
>> This is what your "need a followup patch" refers to.  I'd like to have
>> an opinion from someone familiar with replay on what exactly we need
>> here.
>
> replay-internal.h has an enum ReplayEvents, which is a list of one-byte
> codes used in the replay data stream to record which event to replay. I
> don't know if it is easier to change the replay stream to add a 2-byte
> code (shutdown-with-cause, followed by an encoding of the cause enum),
> or a range of one-byte codes (one new code per number of enum members).
> I also don't know how easy or hard it is to extend the enum (are we free
> to add events in the middle, or are we worried about back-compat to an
> older replay stream that must still play correctly with a newer qemu,
> such that new events must be higher than all existing events).
>
> So yes, I'm hoping for feedback from someone familiar with replay.
>
>> 
>> Amazing number of ways to shut down or reset a machine.
>
> And as I said, it would be easier to submit a patch with less churn by
> having the uncommon case (host-triggered) call a new
> qemu_system_shutdown_request_reason(enum), while the common case
> (guest-triggered) be handled by having qemu_system_shutdown_request()
> with no arguments call
> qemu_system_shutdown_request_reason(SHUTDOWN_GUEST).  I'm just worried
> that doing it that way makes it easy for yet another new host shutdown
> method to use the wrong wrapper.

I don't mind the churn.  It does simplify review.

>> Looks sane on first glance.
>> 
