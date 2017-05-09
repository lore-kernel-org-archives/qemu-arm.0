Received: by 10.25.0.6 with SMTP id 6csp151432lfa;
        Tue, 9 May 2017 07:07:42 -0700 (PDT)
X-Received: by 10.99.177.8 with SMTP id r8mr288224pgf.109.1494338862707;
        Tue, 09 May 2017 07:07:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494338862; cv=none;
        d=google.com; s=arc-20160816;
        b=eQVDLwOzCyyKFoL7ve6BJRb29d62V72yNCQwKpcgGJW+d6AMmYUJtgvFGYssdjoKXT
         eFURuTljVKV1uOIFU35ZA1ZPy5Ozw1YMcSvOqLwOtiK6rUuCJdA9dvu+TnsRIkzs3y9f
         2N15TQ6YDIe5h0V0iALVH1OUXdIZOFQlvGFeTl2F0/XvHMoYvE0NgMGalQDbI7LXUc99
         BjP3sjbFu4SqCPv+CRGz0MG7MNgRuMZTI/q8C3vcKKtMmcmqC/TaC9H92UKeb9FGf4bo
         0yXzUBAOT3LSc9jnGZaLzdqDdR9jdnbXApB/k7m7dP9SVuHTsKAO6U93mdnWMcDrKu+O
         gjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:mime-version:user-agent:date
         :message-id:organization:openpgp:from:references:cc:to:subject
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=TNoX1DbZ1As5QJ4/x0zVrOHJI3tKJ1IDYEADwBjNSXk=;
        b=eJTSEFL6Vp1iXrh7bjHoHkx0o2CrEWEUMQk5OLWqwnrMBMVldXaKw1fjdwtnzfipMP
         yEQvFsBDgB2Wbzsna1gDoC6eXWu8M87jWkbpFb3e13eIGuuS75WEOZ/EefqPlxy3xKfS
         JHP0VXc1RR4Y7wBIo3d3utAMoxeF+QThONYg6rGTbuMPnMQtm2b6yCmyjg7Rihujs+aG
         3SefDAFtX5F28cIi3djNa+qzYuWFOHR6FMju7nKuKA7FCPnWyfGrhd3eRcrtIxspGCD7
         /OdfEoUhjmyRsBWEFA/1r972/Cj2eeYlHzV0i3/XexYuz3qTyt77hlxxHzm2y+mJKnOT
         wDtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id d72si31799pfb.202.2017.05.09.07.07.42;
        Tue, 09 May 2017 07:07:42 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753635AbdEIOHk (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Tue, 9 May 2017 10:07:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35056 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752689AbdEIOHj (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 9 May 2017 10:07:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id ACC2F83F3E;
        Tue,  9 May 2017 14:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ACC2F83F3E
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com ACC2F83F3E
Received: from [10.10.123.147] (ovpn-123-147.rdu2.redhat.com [10.10.123.147])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1286A783C4;
        Tue,  9 May 2017 14:07:27 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v7 3/5] shutdown: Add source information to
 SHUTDOWN and RESET
To:     Markus Armbruster <armbru@redhat.com>
Cc:     qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
        "open list:Overall" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Alexander Graf <agraf@suse.de>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
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
        Stefan Weil <sw@weilnetz.de>, alistair.francis@xilinx.com,
        "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
        Igor Mammedov <imammedo@redhat.com>,
        Cornelia Huck <"corneli a.huck"@de.ibm.com>,
        David Gibson <david@gibson.dropbear.id.au>,
        Paul Burton <paul.burton@imgtec.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list:Old World" <qemu-ppc@nongnu.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>
References: <20170508211953.28017-1-eblake@redhat.com>
 <20170508211953.28017-4-eblake@redhat.com>
 <87inlap7k1.fsf@dusky.pond.sub.org>
From:   Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <81782139-d66d-72d4-c228-9dd9073a33b9@redhat.com>
Date:   Tue, 9 May 2017 09:07:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <87inlap7k1.fsf@dusky.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SDeGOvGBIsueVrhobMIU2OhkcpkGsK3W9"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Tue, 09 May 2017 14:07:38 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: EEhaFFh7RMg5

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SDeGOvGBIsueVrhobMIU2OhkcpkGsK3W9
Content-Type: multipart/mixed; boundary="n9FR9W8MqPB7xigxR1tdNAv5tHnh2nWLa";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "open list:Overall" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alexander Graf <agraf@suse.de>, Yongbok Kim <yongbok.kim@imgtec.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring
 <robh@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 alistair.francis@xilinx.com, "open list:Calxeda Highbank"
 <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Igor Mammedov <imammedo@redhat.com>,
 Cornelia Huck <"corneli a.huck"@de.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paul Burton <paul.burton@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:Old World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <81782139-d66d-72d4-c228-9dd9073a33b9@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v7 3/5] shutdown: Add source information to
 SHUTDOWN and RESET
References: <20170508211953.28017-1-eblake@redhat.com>
 <20170508211953.28017-4-eblake@redhat.com>
 <87inlap7k1.fsf@dusky.pond.sub.org>
In-Reply-To: <87inlap7k1.fsf@dusky.pond.sub.org>

--n9FR9W8MqPB7xigxR1tdNAv5tHnh2nWLa
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/09/2017 06:56 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
>=20
>> Time to wire up all the call sites that request a shutdown or
>> reset to use the enum added in the previous patch.
>>
>> It would have been less churn to keep the common case with no
>> arguments as meaning guest-triggered, and only modified the
>> host-triggered code paths, via a wrapper function, but then we'd
>> still have to audit that I didn't miss any host-triggered spots;
>> changing the signature forces us to double-check that I correctly
>> categorized all callers.
>>
>> Since command line options can change whether a guest reset request
>> causes an actual reset vs. a shutdown, it's easy to also add the
>> information to reset requests.
>>
>> Replay adds a FIXME to preserve the cause across the replay stream,
>> that will be tackled in the next patch.
>>

>> @@ -569,7 +569,7 @@ static void acpi_pm1_cnt_write(ACPIREGS *ar, uint1=
6_t val)
>>          default:
>>              if (sus_typ =3D=3D ar->pm1.cnt.s4_val) { /* S4 request */=

>>                  qapi_event_send_suspend_disk(&error_abort);
>> -                qemu_system_shutdown_request();
>> +                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHU=
TDOWN);
>=20
> I'm fine with using SHUTDOWN_CAUSE_GUEST_SHUTDOWN for suspend, but have=

> you considered SHUTDOWN_CAUSE_GUEST_SUSPEND?

It was easy to do
s/qemu_system_shutdown_request()/qemu_system_shutdown_request(SHUTDOWN_CA=
USE_GUEST_SHUTDOWN)/
for all hw/ files.  Harder would be picking a difference between
_SHUTDOWN and a new _SUSPEND. I can do it if hardware owners want the
distinction; but remember that this series will intentionally NOT expose
that distinction to QMP, so I don't know how much it will buy us.


>>  void qmp_stop(Error **errp)
>> @@ -105,7 +105,7 @@ void qmp_stop(Error **errp)
>>
>>  void qmp_system_reset(Error **errp)
>>  {
>> -    qemu_system_reset_request();
>> +    qemu_system_reset_request(SHUTDOWN_CAUSE_HOST_QMP);
>=20
> This is the only place where we pass something other than
> SHUTDOWN_CAUSE_GUEST_RESET.  We could avoid churn the obvious way, but =
I
> guess having the churn eases patch review.  Okay.

Yes, and that was the comment I made in the commit message about
changing the signature everywhere instead of adding wrappers that make
the common case become the default.


>> +++ b/replay/replay.c
>> @@ -51,7 +51,8 @@ bool replay_next_event_is(int event)
>>          switch (replay_state.data_kind) {
>>          case EVENT_SHUTDOWN:
>>              replay_finish_event();
>> -            qemu_system_shutdown_request();
>> +            /* FIXME - store actual reason */
>> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
>=20
> The temporary replay breakage is no big deal.  Still, can we avoid it b=
y
> extending replay first, using a dummy value like
> SHUTDOWN_CAUSE_HOST_ERROR until the real cause becomes available?  Not
> sure it's worth a respin, though.
>=20
>>              break;
>>          default:
>>              /* clock, time_t, checkpoint and other events */
> [...]
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>=20

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--n9FR9W8MqPB7xigxR1tdNAv5tHnh2nWLa--

--SDeGOvGBIsueVrhobMIU2OhkcpkGsK3W9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZEc0fAAoJEKeha0olJ0NqgSYH/i+v6CJcwzlmUHcGVg6DcqRO
tRa/xL25R5FrC+HOREOYVvVkukTZcEsA/ai2nACEi1upKF8IWHFzRjc/6XolbHWl
vHKmcF7n9BcNZi8dqRu3abstD3bcNIiGexPEYTptFaMFiXQq96lHz7R68Ht59bI/
12LEVwf0VAvN+DGm/+9xNGgszRc/Yd6JenZJ4+VbPwJzubU4XVCX5tTSvRt7dfrZ
ZVOAT52aX46iN5C+awgEYAy1hE1GojIEm4yy6PEBDcPw6twodOLYDg4vwAxqbvcK
HVtxkc5Xa1E3WsxjwT1QFos6LGWrlZx8ZMS1y0BlsygxQ/nGEIkb0TwbJqHdKTY=
=fwyb
-----END PGP SIGNATURE-----

--SDeGOvGBIsueVrhobMIU2OhkcpkGsK3W9--
