Received: by 10.25.0.144 with SMTP id 138csp852794lfa;
        Thu, 20 Apr 2017 11:12:39 -0700 (PDT)
X-Received: by 10.98.194.69 with SMTP id l66mr8938301pfg.55.1492711958923;
        Thu, 20 Apr 2017 11:12:38 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 189si7145552pgb.323.2017.04.20.11.12.38;
        Thu, 20 Apr 2017 11:12:38 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S971644AbdDTSMh (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Thu, 20 Apr 2017 14:12:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43816 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S971655AbdDTSMe (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Apr 2017 14:12:34 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D7AAAC04B941;
        Thu, 20 Apr 2017 18:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D7AAAC04B941
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D7AAAC04B941
Received: from [10.10.121.102] (ovpn-121-102.rdu2.redhat.com [10.10.121.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CCA6917134;
        Thu, 20 Apr 2017 18:12:20 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
To:     Markus Armbruster <armbru@redhat.com>
Cc:     "Daniel P. Berrange" <berrange@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        "open list:Overall" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        qemu-devel@nongnu.org, Scott Wood <scottwood@freescale.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexander Graf <agraf@suse.de>,
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
        Cor nelia Huck <cornelia.huck@de.ibm.com>,
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
 <87k26fffxa.fsf@dusky.pond.sub.org> <20170420120922.GJ20955@redhat.com>
 <1f4e72ed-fab1-7099-768e-2a111df3a633@redhat.com>
 <87r30n83d1.fsf@dusky.pond.sub.org>
From:   Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <65718a2d-c866-09a9-b60c-69a6b9a263fd@redhat.com>
Date:   Thu, 20 Apr 2017 13:12:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <87r30n83d1.fsf@dusky.pond.sub.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="30j48tWkATCMtRibvP1ewUFpnIoeIFhgu"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 20 Apr 2017 18:12:33 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: lB+KmkfKEpIU

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--30j48tWkATCMtRibvP1ewUFpnIoeIFhgu
Content-Type: multipart/mixed; boundary="snqE1hFhpF4u0UbwfHPgj6NtPSrNAG0Pj";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Overall" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Scott Wood <scottwood@freescale.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring
 <robh@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Alistair Francis <alistair.francis@xilinx.com>,
 "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>, Igor Mammedov <imammedo@redhat.com>,
 Cor nelia Huck <cornelia.huck@de.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paul Burton <paul.burton@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Yongbok Kim <yongbok.kim@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <65718a2d-c866-09a9-b60c-69a6b9a263fd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
References: <20170419222258.13415-1-eblake@redhat.com>
 <87k26fffxa.fsf@dusky.pond.sub.org> <20170420120922.GJ20955@redhat.com>
 <1f4e72ed-fab1-7099-768e-2a111df3a633@redhat.com>
 <87r30n83d1.fsf@dusky.pond.sub.org>
In-Reply-To: <87r30n83d1.fsf@dusky.pond.sub.org>

--snqE1hFhpF4u0UbwfHPgj6NtPSrNAG0Pj
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/20/2017 11:12 AM, Markus Armbruster wrote:

>>> Well technically /usr/sbin/halt just terminates all processes / kerne=
l and
>>> halts CPUs, but the virtual machine is still active (and a 'reset' in=
 the
>>> monitor can start it again. /usr/sbin/poweroff is what actually does =
the
>>> ACPI poweroff to trigger QEMU to exit[1]
>>
>> I'm thinking of this wording:
>>
>> triggered by a guest request (such as the guest running
>> /usr/sbin/poweroff to trigger an ACPI shutdown or machine halt instruc=
tion)
>=20
> A quick glance at the patch suggests the instructions in question are
> typically writes to some device register.  I wouldn't call them "halt
> instructions", in particular since there's the x86 "hlt" instruction
> that does something else.

Then maybe: a guest request (such as the guest running
/usr/sbin/poweroff to trigger an ACPI or other hardware-specific
shutdown sequence)

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--snqE1hFhpF4u0UbwfHPgj6NtPSrNAG0Pj--

--30j48tWkATCMtRibvP1ewUFpnIoeIFhgu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY+PoDAAoJEKeha0olJ0NqInsH/1pcxnHBUPsEeRlLCD2Z78MC
1oHlpynEqi/qskZ2R/V1xPziwCKKyq/n6XplCn743NZ9mq8fp7cV9pvkdh0HbmyW
zCaSum4FcBRsoyClfBd9SZd6KowRpbYNdvT023naU84ppRvwSkdkxraMT4Vv+9/f
/N4wXenMxPl/dxaFL3E/n9cXDggXQM+C0j4Sl1vf25pAMnCZhDt2nyM/KCiBzt+q
FFH1DfJVO0E6WL+c25q5FmZz4BL6CYRYh50neQxAcTT89GhPQbpGyd8aFvlDbTqi
VAGdfTJNgD2nRKXShoDeAEGgh9b8QyA2eb+76W+aaGsQkYnO5x1Qh+qYuLWy15Y=
=18eE
-----END PGP SIGNATURE-----

--30j48tWkATCMtRibvP1ewUFpnIoeIFhgu--
