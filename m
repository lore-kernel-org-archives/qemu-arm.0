Received: by 10.25.0.144 with SMTP id 138csp734576lfa;
        Thu, 20 Apr 2017 06:31:42 -0700 (PDT)
X-Received: by 10.84.222.134 with SMTP id x6mr10497369pls.52.1492695102021;
        Thu, 20 Apr 2017 06:31:42 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 91si6509381plh.326.2017.04.20.06.31.41;
        Thu, 20 Apr 2017 06:31:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S945738AbdDTNb3 (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Thu, 20 Apr 2017 09:31:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51166 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S945734AbdDTNb1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Apr 2017 09:31:27 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 00B95C04B31F;
        Thu, 20 Apr 2017 13:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 00B95C04B31F
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 00B95C04B31F
Received: from [10.10.121.102] (ovpn-121-102.rdu2.redhat.com [10.10.121.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFA665B80D;
        Thu, 20 Apr 2017 13:31:14 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
To:     Markus Armbruster <armbru@redhat.com>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        "open list:Overall" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Alexander Graf <agraf@suse.de>,
        Scott Wood <scottwood@freescale.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        Richard Henderson <rth@twiddle.net>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>,
        Alistair Francis <alistair.francis@xilinx.com>,
        "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Igor Mammedov <imammedo@redhat.com>,
        Cornelia Huck <cornelia.huck@de.ibm.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Paul Burton <paul.burton@imgtec.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list:New World" <qemu-ppc@nongnu.org>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>
References: <20170419222258.13415-1-eblake@redhat.com>
 <87k26fffxa.fsf@dusky.pond.sub.org>
From:   Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <1adf2797-b86a-00be-bb98-658ee8d0a55d@redhat.com>
Date:   Thu, 20 Apr 2017 08:31:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <87k26fffxa.fsf@dusky.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rvogOOC9M8Qchv8Tmi1DsIOcOodRm5gnm"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 20 Apr 2017 13:31:27 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Jk/kXef+OaLj

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rvogOOC9M8Qchv8Tmi1DsIOcOodRm5gnm
Content-Type: multipart/mixed; boundary="bdiEwU9oHGQkEuSqQaCVwe4exF35AiELM";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:Overall" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alexander Graf <agraf@suse.de>, Scott Wood <scottwood@freescale.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring
 <robh@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
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
Message-ID: <1adf2797-b86a-00be-bb98-658ee8d0a55d@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
References: <20170419222258.13415-1-eblake@redhat.com>
 <87k26fffxa.fsf@dusky.pond.sub.org>
In-Reply-To: <87k26fffxa.fsf@dusky.pond.sub.org>

--bdiEwU9oHGQkEuSqQaCVwe4exF35AiELM
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/20/2017 06:59 AM, Markus Armbruster wrote:

>=20
> No objection to Alistair's idea to turn this into an enumeration.

Question - should the enum be more than just 'guest' and 'host'?  For
example, my patch proves that we have a lot of places that handle
complimentary machine commands to reset and shutdown, and that whether
'reset' triggers a reset (and the guest keeps running as if rebooted) or
a shutdown is then based on the command-line arguments given to qemu.
So having the enum differentiate between 'guest-reset' and
'guest-shutdown' would be a possibility, if we want the enum to have
additional states.


>> +++ b/vl.c
>> @@ -1717,7 +1717,7 @@ void qemu_system_guest_panicked(GuestPanicInform=
ation *info)
>>      if (!no_shutdown) {
>>          qapi_event_send_guest_panicked(GUEST_PANIC_ACTION_POWEROFF,
>>                                         !!info, info, &error_abort);
>> -        qemu_system_shutdown_request();
>> +        qemu_system_shutdown_request(false);
>=20
> Panicking is a guest action.  Whether the shutdown on panic should be
> attributed to guest or host is perhaps debatable.

And it relates to the idea that a guest request for a 'reset' turns into
a qemu response of 'shutdown'.  After all, whether a guest panic results
in a shutdown action is determined by command-line arguments to qemu.
So if we DO want to differentiate between a guest panic and a normal
guest shutdown, when both events are wired at the command line to cause
the SHUTDOWN action, then that's another enum to add to my list.


>> +++ b/replay/replay.c
>> @@ -51,7 +51,10 @@ bool replay_next_event_is(int event)
>>          switch (replay_state.data_kind) {
>>          case EVENT_SHUTDOWN:
>>              replay_finish_event();
>> -            qemu_system_shutdown_request();
>> +            /* TODO: track source of shutdown request, to replay a
>> +             * guest-initiated request rather than always claiming to=

>> +             * be from the host? */
>> +            qemu_system_shutdown_request(false);
>=20
> This is what your "need a followup patch" refers to.  I'd like to have
> an opinion from someone familiar with replay on what exactly we need
> here.

replay-internal.h has an enum ReplayEvents, which is a list of one-byte
codes used in the replay data stream to record which event to replay. I
don't know if it is easier to change the replay stream to add a 2-byte
code (shutdown-with-cause, followed by an encoding of the cause enum),
or a range of one-byte codes (one new code per number of enum members).
I also don't know how easy or hard it is to extend the enum (are we free
to add events in the middle, or are we worried about back-compat to an
older replay stream that must still play correctly with a newer qemu,
such that new events must be higher than all existing events).

So yes, I'm hoping for feedback from someone familiar with replay.

>=20
> Amazing number of ways to shut down or reset a machine.

And as I said, it would be easier to submit a patch with less churn by
having the uncommon case (host-triggered) call a new
qemu_system_shutdown_request_reason(enum), while the common case
(guest-triggered) be handled by having qemu_system_shutdown_request()
with no arguments call
qemu_system_shutdown_request_reason(SHUTDOWN_GUEST).  I'm just worried
that doing it that way makes it easy for yet another new host shutdown
method to use the wrong wrapper.

>=20
> Looks sane on first glance.
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--bdiEwU9oHGQkEuSqQaCVwe4exF35AiELM--

--rvogOOC9M8Qchv8Tmi1DsIOcOodRm5gnm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY+LghAAoJEKeha0olJ0NqDt8IAIrnTV7Mwg28cND2x9q3CyEM
xBNQKsByD/aE87wf8Au0NWGtzlfa5DhEHbqqMhPBO+QHUQfa0l9Go44h5HXUKmy/
dmm+X/9ow24Ujuf8ARxFIGJacPB7L7hSGxJdeIw853qIxlh6RNIW91plyZKn/FVa
O8hSosbP4+YiDT0p/yKVtt1e4h3fZ1WD0YFWFUTkIruJcABCPmYHyRPkSHNClkAq
rPnd3/Kk+D1HpvGXF6aAfXp7/flBcDvpp4b1qgxe086zMjL/beMkfwAIJNMlFZQ+
nKLWFfi9uRwkGUYUIwOOtxvCcK+EBU8dww7ZUTt/xEmONlIzHUtQVAS1XVTJ7/g=
=qNfk
-----END PGP SIGNATURE-----

--rvogOOC9M8Qchv8Tmi1DsIOcOodRm5gnm--
