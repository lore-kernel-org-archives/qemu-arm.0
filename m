Received: by 10.25.0.144 with SMTP id 138csp871442lfa;
        Thu, 20 Apr 2017 12:05:35 -0700 (PDT)
X-Received: by 10.98.16.208 with SMTP id 77mr9086686pfq.105.1492715135664;
        Thu, 20 Apr 2017 12:05:35 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 5si7323758plx.87.2017.04.20.12.05.35;
        Thu, 20 Apr 2017 12:05:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S943277AbdDTTFd (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Thu, 20 Apr 2017 15:05:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34288 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S942719AbdDTTFc (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Apr 2017 15:05:32 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 67765C60F1;
        Thu, 20 Apr 2017 19:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 67765C60F1
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 67765C60F1
Received: from [10.10.121.102] (ovpn-121-102.rdu2.redhat.com [10.10.121.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 45CD917AF0;
        Thu, 20 Apr 2017 19:05:19 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
To:     Markus Armbruster <armbru@redhat.com>
Cc:     Peter Maydell <peter.maydell@linaro.org>,
        "open list:Overall" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        qemu-devel@nongnu.org, Cornelia Huck <cornelia.huck@de.ibm.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexander Graf <agraf@suse.de>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anthony Perard <anthony.perard@citrix.com>,
        "open list:X86" <xen-devel@lists.xenproject.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Stefan Weil <sw@weilnetz.de>,
        Alistair Francis <alistair.francis@xilinx.com>,
        "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
        Jan Kiszka <jan.kiszka@web.de>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Scott Wood <scottwood@freescale.com>,
        Richard Henderson <rth@twiddle.net>,
        Paul Burton <paul.burton@imgtec.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Michael Walle <michael@walle.cc>,
        "open list:New World" <qemu-ppc@nongnu.org>,
        Yongbok Kim <yongbok.kim@imgtec.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Aurelien Jarno <aurelien@aurel32.net>
References: <20170419222258.13415-1-eblake@redhat.com>
 <87k26fffxa.fsf@dusky.pond.sub.org>
 <1adf2797-b86a-00be-bb98-658ee8d0a55d@redhat.com>
 <87lgqv833h.fsf@dusky.pond.sub.org>
From:   Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <53bc367e-df07-be34-25c5-dbf0b3ee174e@redhat.com>
Date:   Thu, 20 Apr 2017 14:05:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <87lgqv833h.fsf@dusky.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="vH7BL4FPskm3aeOscikoBnikhExPXU7iL"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Thu, 20 Apr 2017 19:05:32 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 9KbZI7fOnfwH

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--vH7BL4FPskm3aeOscikoBnikhExPXU7iL
Content-Type: multipart/mixed; boundary="jLVWUKgmn24FRRGibikJvQS9RF2vk9Sro";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Overall" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring
 <robh@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair.francis@xilinx.com>,
 "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Scott Wood <scottwood@freescale.com>, Richard Henderson <rth@twiddle.net>,
 Paul Burton <paul.burton@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Yongbok Kim <yongbok.kim@imgtec.com>, Igor Mammedov <imammedo@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <53bc367e-df07-be34-25c5-dbf0b3ee174e@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
References: <20170419222258.13415-1-eblake@redhat.com>
 <87k26fffxa.fsf@dusky.pond.sub.org>
 <1adf2797-b86a-00be-bb98-658ee8d0a55d@redhat.com>
 <87lgqv833h.fsf@dusky.pond.sub.org>
In-Reply-To: <87lgqv833h.fsf@dusky.pond.sub.org>

--jLVWUKgmn24FRRGibikJvQS9RF2vk9Sro
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/20/2017 11:18 AM, Markus Armbruster wrote:
> Eric Blake <eblake@redhat.com> writes:
>=20
>> On 04/20/2017 06:59 AM, Markus Armbruster wrote:
>>
>>>
>>> No objection to Alistair's idea to turn this into an enumeration.
>>
>> Question - should the enum be more than just 'guest' and 'host'?  For
>> example, my patch proves that we have a lot of places that handle
>> complimentary machine commands to reset and shutdown, and that whether=

>> 'reset' triggers a reset (and the guest keeps running as if rebooted) =
or
>> a shutdown is then based on the command-line arguments given to qemu.
>> So having the enum differentiate between 'guest-reset' and
>> 'guest-shutdown' would be a possibility, if we want the enum to have
>> additional states.
>=20
> I don't know.  What I do know is that we better get the enum right:
> while adding members is backwards-compatible, changing the member sent
> for a specific trigger is not.  If we want to reserve the option to do
> that anyway, we need suitable documentation.

Or even this idea:

{ 'enum': 'ShutdownCause', 'data': [ 'shutdown', 'reset', 'panic' ] }
{ 'event': 'SHUTDOWN',
  'data': { 'guest': 'bool', '*cause': 'ShutdownCause' } }

where the enum can grow as we come up with ever more reasons worth
exposing (maybe even 'qmp', 'gui' and 'interrupt' are reasonable causes
for a host shutdown).  Our promise would be that 'guest' never changes
for an existing shutdown reason, but that 'cause' may become more
refined over time if someone expresses a need for having the distinction.=


Thoughts?

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--jLVWUKgmn24FRRGibikJvQS9RF2vk9Sro--

--vH7BL4FPskm3aeOscikoBnikhExPXU7iL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY+QZuAAoJEKeha0olJ0Nq8eoH/15t11zZAIQvrpYBnHxxlwUb
ThZ7v0LVQ0cnKvf685HivxtchYmBaikvo380r/yphov4/kuatI6QWkV/Hke+YHaV
+BnxkvI3G6HoyVZvRTWNWi5t7L5dY4PNDrAYySWmBwS1N0h4l8YogTXCq26BMhJo
5BbFL04YCn9jF2K/ZS+gTFd/Y8fHw9AG+OdiCS3IKAgriuz4+6EDH+Dd6ul6icux
0oHgMBCXIu6E8+7YIPEgdNUpVP8hlcMXeCsBC6aHsHk7cXKdEzKseu7k4lq+7aga
P60tbxjkCWLhfmRoqfoEkjEVfBFEvXuJ0qOxvWs6sF9iIsQHm3DFnavk8C4TCOA=
=JX4c
-----END PGP SIGNATURE-----

--vH7BL4FPskm3aeOscikoBnikhExPXU7iL--
