Received: by 10.25.0.144 with SMTP id 138csp729496lfa;
        Thu, 20 Apr 2017 06:20:27 -0700 (PDT)
X-Received: by 10.99.138.73 with SMTP id y70mr8116690pgd.151.1492694427123;
        Thu, 20 Apr 2017 06:20:27 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t68si6485008pfe.154.2017.04.20.06.20.26;
        Thu, 20 Apr 2017 06:20:27 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S945524AbdDTNUZ (ORCPT <rfc822;francois.ozog@linaro.org>
        + 6 others); Thu, 20 Apr 2017 09:20:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36144 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S944527AbdDTNUY (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Apr 2017 09:20:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D1695C03BD62;
        Thu, 20 Apr 2017 13:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D1695C03BD62
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com D1695C03BD62
Received: from [10.10.121.102] (ovpn-121-102.rdu2.redhat.com [10.10.121.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 21E275B80D;
        Thu, 20 Apr 2017 13:20:11 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
To:     "Daniel P. Berrange" <berrange@redhat.com>,
        Markus Armbruster <armbru@redhat.com>
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
 <87k26fffxa.fsf@dusky.pond.sub.org> <20170420120922.GJ20955@redhat.com>
From:   Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <1f4e72ed-fab1-7099-768e-2a111df3a633@redhat.com>
Date:   Thu, 20 Apr 2017 08:20:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170420120922.GJ20955@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="MJ1tsuo055DBeRBh8xXxl1H5JDCn29vB7"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Thu, 20 Apr 2017 13:20:23 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: C8Uplc3Eo4cN

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--MJ1tsuo055DBeRBh8xXxl1H5JDCn29vB7
Content-Type: multipart/mixed; boundary="Go0efDJdQsMURSE7sqPOhTPmgdpfEcVrf";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
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
Message-ID: <1f4e72ed-fab1-7099-768e-2a111df3a633@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
References: <20170419222258.13415-1-eblake@redhat.com>
 <87k26fffxa.fsf@dusky.pond.sub.org> <20170420120922.GJ20955@redhat.com>
In-Reply-To: <20170420120922.GJ20955@redhat.com>

--Go0efDJdQsMURSE7sqPOhTPmgdpfEcVrf
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/20/2017 07:09 AM, Daniel P. Berrange wrote:

>>> +++ b/qapi/event.json
>>> @@ -10,6 +10,10 @@
>>>  # Emitted when the virtual machine has shut down, indicating that qe=
mu is
>>>  # about to exit.
>>>  #
>>> +# @guest: If true, the shutdown was triggered by a guest request (su=
ch as
>>> +# executing a halt instruction) rather than a host request (such as =
sending
>>> +# qemu a SIGINT). (since 2.10)
>>> +#
>>
>> "executing a halt instruction" suggests "halt" is a machine instructio=
n.

Which is indeed what most of the places I patched to pass 'true' are
emulating - the machine halt instruction.

>> I think you mean /usr/sbin/halt.  Suggest something like "executing a
>> halt command".
>=20
> Well technically /usr/sbin/halt just terminates all processes / kernel =
and
> halts CPUs, but the virtual machine is still active (and a 'reset' in t=
he
> monitor can start it again. /usr/sbin/poweroff is what actually does th=
e
> ACPI poweroff to trigger QEMU to exit[1]

I'm thinking of this wording:

triggered by a guest request (such as the guest running
/usr/sbin/poweroff to trigger an ACPI shutdown or machine halt instructio=
n)


--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--Go0efDJdQsMURSE7sqPOhTPmgdpfEcVrf--

--MJ1tsuo055DBeRBh8xXxl1H5JDCn29vB7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY+LWLAAoJEKeha0olJ0NqMFMIAJ+mxZJviG+ZHLY7f0P+nZHw
lSmYS3rDIUtpTlg/L41kGp2qaa/4Le0Dm8SjVIOcfXH0Q0ZF9Lz2D5TKdJpOwCpO
9xI2aJTR2T5VZS8eiV4Cwb58EnwCkm2V0xSTigug1B3/mc0HjNyrCrIBmoenXGy9
svhwYAkIi4uJoLqvEPBa3b97TUYgCNcYFLewAEwehQv5eYyaveMLJ0Gn7srfS2tb
8eRhZca425Y47DQWX6W6n3YHQSvRkKgPuuIR03dd6comUBYREJzkE4cwUPCRdPut
QaJocb0qiCjL+tSQe104bffeBeuQmnymmSbIdEC7C+Y5M5BXsg6k8//VARsBmhw=
=qiAs
-----END PGP SIGNATURE-----

--MJ1tsuo055DBeRBh8xXxl1H5JDCn29vB7--
