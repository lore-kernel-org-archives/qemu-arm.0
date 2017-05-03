Received: by 10.25.0.198 with SMTP id 189csp185580lfa;
        Wed, 3 May 2017 09:39:30 -0700 (PDT)
X-Received: by 10.55.215.145 with SMTP id t17mr4183740qkt.78.1493829570438;
        Wed, 03 May 2017 09:39:30 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c81si1067754qke.174.2017.05.03.09.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 09:39:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37821 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5xJH-0002PK-MX
	for alex.bennee@linaro.org; Wed, 03 May 2017 12:39:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d5xJ9-0002Jy-8f
	for qemu-arm@nongnu.org; Wed, 03 May 2017 12:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1d5xJ6-0001vO-5z
	for qemu-arm@nongnu.org; Wed, 03 May 2017 12:39:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1d5xJ5-0001vD-Sm; Wed, 03 May 2017 12:39:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BE291804E4;
	Wed,  3 May 2017 16:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BE291804E4
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BE291804E4
Received: from [10.10.122.206] (ovpn-122-206.rdu2.redhat.com [10.10.122.206])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 677567EA23;
	Wed,  3 May 2017 16:39:11 +0000 (UTC)
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-24-git-send-email-imammedo@redhat.com>
	<20170503163543.GR3482@thinpad.lan.raisama.net>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <5f71cfda-2a73-77e3-0bf7-85e2aed53811@redhat.com>
Date: Wed, 3 May 2017 11:39:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <20170503163543.GR3482@thinpad.lan.raisama.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="lhfCCggt5jSkqBv6uUkQLmEV9JVLJumRN"
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 03 May 2017 16:39:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 23/24] numa: add '-numa cpu,
 ...' option for property based node mapping
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4k9lez/OfKZF

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lhfCCggt5jSkqBv6uUkQLmEV9JVLJumRN
Content-Type: multipart/mixed; boundary="imIfilwcucljLASlM5vdJeX2rQX4UPhDn";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <drjones@redhat.com>, David Gibson
 <david@gibson.dropbear.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Shannon Zhao <zhaoshenglong@huawei.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <5f71cfda-2a73-77e3-0bf7-85e2aed53811@redhat.com>
Subject: Re: [PATCH v2 23/24] numa: add '-numa cpu,...' option for property
 based node mapping
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
 <1493816238-33120-24-git-send-email-imammedo@redhat.com>
 <20170503163543.GR3482@thinpad.lan.raisama.net>
In-Reply-To: <20170503163543.GR3482@thinpad.lan.raisama.net>

--imIfilwcucljLASlM5vdJeX2rQX4UPhDn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 05/03/2017 11:35 AM, Eduardo Habkost wrote:

>> +
>> +        memset(&cpu, 0, sizeof(cpu));
>> +        cpu.has_node_id =3D object->u.cpu.has_node_id;
>> +        cpu.node_id =3D object->u.cpu.node_id;
>> +        cpu.has_socket_id =3D object->u.cpu.has_socket_id;
>> +        cpu.socket_id =3D object->u.cpu.socket_id;
>> +        cpu.has_core_id =3D object->u.cpu.has_core_id;
>> +        cpu.core_id =3D object->u.cpu.core_id;
>> +        cpu.has_thread_id =3D object->u.cpu.has_thread_id;
>> +        cpu.thread_id =3D object->u.cpu.thread_id;
>=20
> We don't have a way to avoid copying each field individually?
> Some visitor trick, maybe?
>=20
> Eric, Markus, Michael, do you have any suggestions?

Markus just added QAPI_CLONE_MEMBERS(), which sounds like what you want:

https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg04867.html

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


--imIfilwcucljLASlM5vdJeX2rQX4UPhDn--

--lhfCCggt5jSkqBv6uUkQLmEV9JVLJumRN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJZCgeuAAoJEKeha0olJ0NqJfIIAKao90LOyCfH9uPw+ovOQ47U
liLX8Hjs42ox2oZg348a8TN3xPpO1cXnjE7e7n6toCZAcm4nUFUf4ThUL4xdrFd3
qD6rujsM678A7mnnKvFBWh3gGLmxnNVz1Fm2But0S9BxQzvBycoZrg5S39YbMOZ8
c4IrtOtwf+jGr/gW2cNqt7MIIJbU4ELdSy1mmoVBHOM8C/jHooXGHZ+TppMFOebA
A2nu8uoyDM3+6ELS00tvx10rReaCLt0RwH1PKMJzJK5DyWwP0I4Wbg/F1ZJi3uJ2
I6E7yb53a9bO+GATGWTGrw6baVRtpl9cHwqyWTkKHrlzHfBxa6XscN5cmd8dUxk=
=d6MN
-----END PGP SIGNATURE-----

--lhfCCggt5jSkqBv6uUkQLmEV9JVLJumRN--
