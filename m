Received: by 10.25.0.144 with SMTP id 138csp512540lfa;
        Wed, 19 Apr 2017 18:11:23 -0700 (PDT)
X-Received: by 10.55.81.139 with SMTP id f133mr5787688qkb.125.1492650683487;
        Wed, 19 Apr 2017 18:11:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x6si4205477qkx.291.2017.04.19.18.11.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 19 Apr 2017 18:11:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d10d0-0008OV-TU
	for alex.bennee@linaro.org; Wed, 19 Apr 2017 21:11:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d10cv-0008OQ-NE
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 21:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d10cs-0000ZI-IR
	for qemu-arm@nongnu.org; Wed, 19 Apr 2017 21:11:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59624)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d10cs-0000Xy-9K; Wed, 19 Apr 2017 21:11:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BC3151440;
	Thu, 20 Apr 2017 01:11:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1BC3151440
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1BC3151440
Received: from [10.10.121.102] (ovpn-121-102.rdu2.redhat.com [10.10.121.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D5545832A0;
	Thu, 20 Apr 2017 01:11:03 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>
References: <20170419222258.13415-1-eblake@redhat.com>
	<CAKmqyKN+xAoms31euoEa7ZSszi7y8Zz5npEBE3p50pp13TrD+g@mail.gmail.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <3a0cce45-581b-2fe5-ffe7-ca76bc5b2448@redhat.com>
Date: Wed, 19 Apr 2017 20:11:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN+xAoms31euoEa7ZSszi7y8Zz5npEBE3p50pp13TrD+g@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="4NifvjXIOOpIXKlpJDpAR7OwMWL0mSU30"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 20 Apr 2017 01:11:13 +0000 (UTC)
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
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"open list:X86" <xen-devel@lists.xenproject.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	"open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
	Jan Kiszka <jan.kiszka@web.de>, Paolo Bonzini <pbonzini@redhat.com>,
	Scott Wood <scottwood@freescale.com>, Richard Henderson <rth@twiddle.net>,
	Paul Burton <paul.burton@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Michael Walle <michael@walle.cc>,
	"open list:New World" <qemu-ppc@nongnu.org>,
	Yongbok Kim <yongbok.kim@imgtec.com>, Igor Mammedov <imammedo@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5nAUTL3PLFQN

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4NifvjXIOOpIXKlpJDpAR7OwMWL0mSU30
Content-Type: multipart/mixed; boundary="U19FJsqhs2JtSwpmXuMgJoShqVXfqeG5f";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:Overall" <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alexander Graf <agraf@suse.de>, Scott Wood <scottwood@freescale.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring
 <robh@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 "open list:Calxeda Highbank" <qemu-arm@nongnu.org>,
 Jan Kiszka <jan.kiszka@web.de>, Igor Mammedov <imammedo@redhat.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paul Burton <paul.burton@imgtec.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Yongbok Kim <yongbok.kim@imgtec.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <3a0cce45-581b-2fe5-ffe7-ca76bc5b2448@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v2] event: Add source information to SHUTDOWN
References: <20170419222258.13415-1-eblake@redhat.com>
 <CAKmqyKN+xAoms31euoEa7ZSszi7y8Zz5npEBE3p50pp13TrD+g@mail.gmail.com>
In-Reply-To: <CAKmqyKN+xAoms31euoEa7ZSszi7y8Zz5npEBE3p50pp13TrD+g@mail.gmail.com>

--U19FJsqhs2JtSwpmXuMgJoShqVXfqeG5f
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 04/19/2017 05:36 PM, Alistair Francis wrote:
> On Wed, Apr 19, 2017 at 3:22 PM, Eric Blake <eblake@redhat.com> wrote:
>> Libvirt would like to be able to distinguish between a SHUTDOWN
>> event triggered solely by guest request and one triggered by a
>> SIGTERM or other action on the host.  qemu_kill_report() is
>> already able to tell whether a shutdown was triggered by a host
>> signal (but NOT by a host UI event, such as clicking the X on
>> the window), but that information was then lost after being
>> printed to stderr.
>>
>> Enhance the shutdown request path to take a parameter of which
>> way it is being triggered, and update ALL callers.  It would have
>> been less churn to keep the common case with no arguments as
>> meaning guest-triggered, and only modified the host-triggered
>> code paths, via a wrapper function, but then we'd still have to
>> audit that I didn't miss any host-triggered spots; changing the
>> signature forces us to double-check that I correctly categorized
>> all callers.

> With all this churn is it not worth chaning the bool from_guest to an
> int that we can expand in future?
>=20
> I'm imagining an enum with multiple values for different shutdown
> events. At the moment it will just be one for guest and one for host,
> but at some point in the future we might want more.

Yes, that makes sense.  Probably easiest is creating a QMP enum now ( as
in { 'enum': 'ShutdownCause', 'data': ['guest', 'host'] } - although
such an enum defaults to starting at 0, and the shutdown_requested
variable in vl.c would need a tweak to pick a different value when no
shutdown is requested.

> Not only does this future proof us, but I think it makes it more clear
> what you are passing the function instead of just true/false.

Under your proposal, it would be
qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST), which does look a
bit nicer. I'll wait for other review comments, but you have given me a
good reason to do a v3.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--U19FJsqhs2JtSwpmXuMgJoShqVXfqeG5f--

--4NifvjXIOOpIXKlpJDpAR7OwMWL0mSU30
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJY+AqmAAoJEKeha0olJ0NqzRcH/jUkeHFlEhIk0/eYjZyTRfmO
vdNzTL04R+v0uEhRPWqPgYqLdMBciuyEcUtIWGaJ1KSSss1eupV+LQNyxD81DnzT
DIZweoW84xseJDFrQU5HwwC566FVchC3n815J1Iyy8AGpQKtXZ//hpRKsCkPeBhl
XwRB6Q045+zMGqcuUZ+I4OYt9/va7QUfJCjCdaBK4jNerBAr4PxYNgwRtc5ix3p5
ia5rBGrmHmf23Wfb+bDcrZX3T2EYv72HaTkLcE1Lk7Re3/SsBhAwTWOkjUnQ10CO
hcXLMYA6kGWeyl88IBTFolCpXHFcKKl4X6X7aPH6cykkKaXceAJ+5RK4QYhRt/E=
=7PUk
-----END PGP SIGNATURE-----

--4NifvjXIOOpIXKlpJDpAR7OwMWL0mSU30--
