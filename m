Received: by 10.25.208.211 with SMTP id h202csp2369065lfg;
        Tue, 29 Mar 2016 18:50:31 -0700 (PDT)
X-Received: by 10.140.100.244 with SMTP id s107mr6502346qge.19.1459302631523;
        Tue, 29 Mar 2016 18:50:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a82si1606643qhd.69.2016.03.29.18.50.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2016 18:50:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51437 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1al5HD-0005DH-4q
	for alex.bennee@linaro.org; Tue, 29 Mar 2016 21:50:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1al5H9-0005DB-82
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 21:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1al5H4-0007Ya-9B
	for qemu-arm@nongnu.org; Tue, 29 Mar 2016 21:50:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48696)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1al5H4-0007YW-26; Tue, 29 Mar 2016 21:50:22 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 6957C85542;
	Wed, 30 Mar 2016 01:50:21 +0000 (UTC)
Received: from [10.3.113.124] (ovpn-113-124.phx2.redhat.com [10.3.113.124])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2U1oKHl026267; Tue, 29 Mar 2016 21:50:20 -0400
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <1458788142-17509-1-git-send-email-peterx@redhat.com>
	<1458788142-17509-2-git-send-email-peterx@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
X-Enigmail-Draft-Status: N1110
Organization: Red Hat, Inc.
Message-ID: <56FB30DB.3040607@redhat.com>
Date: Tue, 29 Mar 2016 19:50:19 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.1
MIME-Version: 1.0
In-Reply-To: <1458788142-17509-2-git-send-email-peterx@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="B8e0eKXD7jNwoXUF0pwa8IGE0w8Ka4Gwu"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	libvir-list@redhat.com, armbru@redhat.com, abologna@redhat.com,
	qemu-arm@nongnu.org, christoffer.dall@linaro.org
Subject: Re: [Qemu-arm] [PATCH v7 1/4] arm: qmp: add query-gic-capabilities
	interface
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 28gfe4fldUOx

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--B8e0eKXD7jNwoXUF0pwa8IGE0w8Ka4Gwu
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/23/2016 08:55 PM, Peter Xu wrote:
> This patch add "query-gic-capabilities" but does not implemnet it. The

s/implemnet/implement/

> command is ARM-only. The command will return a list of GICCapability
> struct that describes all GIC versions that current QEMU and system
> support.
>=20
> Libvirt is possibly the first consumer of this new command.
>=20
> Before this patch, user will successfully configure all kinds of GIC
> devices for ARM guests, no matter whether current QEMU/kernel support
> it. If the specified GIC version/type is not supported, user will got a=
n
> ambiguous "QEMU boot failure" when trying to start the VM. This is not
> user-friendly.
>=20
> With this patch, libvirt should be able to query which type (and which
> version) of GIC device that we support. Use this information, libvirt
> can warn the user during configuration of guests when specified GIC
> device type is not supported. Or better, we can just list those version=
s
> that we support, and filter out those not-supported ones.
>=20
> For example, if we got the query result:
>=20
> {"return": [{"emulated": false, "version": 3, "kernel": true},
>             {"emulated": true, "version": 2, "kernel": false}]}
>=20
> Then it means that we support emulated GIC version 2 using:
>=20
>   qemu-system-aarch64 -M virt,accel=3Dtcg,gic-version=3D2 ...
>=20
> or kvm-accelerated GIC version 3 using:
>=20
>   qemu-system-aarch64 -M virt,accel=3Dkvm,gic-version=3D3 ...

This helps - it shows how libvirt will map the query into qemu command
lines.

>=20
> If we specify other explicit GIC version rather than the above, QEMU
> will not be able to boot.
>=20
> Besides, the community is working on a more generic way to query these
> kind of information. However, due to the eagerness of this command, we
> decided to first implement this ad-hoc one, then when the generic metho=
d
> is ready, we can move on to that one smoothly.
>=20
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---

Interface looks fine from QMP perspective:
Reviewed-by: Eric Blake <eblake@redhat.com>

Libvirt should be able to cope with the information here, and
introspection will let us know if we ever expand the struct.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--B8e0eKXD7jNwoXUF0pwa8IGE0w8Ka4Gwu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW+zDbAAoJEKeha0olJ0NqbwYH/Rf6neFiw3cpoKporj1HQoFQ
4+BYOoHR5gso0s+bqPgmAXG3gvS2rqp31dBBRZecWDCJhmXNkUibIN8evWmgRT/W
MatCWndxoS2vZ0iA0rjNSDt9Yq0RdyvT9+1de/TToRuk2xCJlOyh/KEyMmBHsXQj
OTDdhm/WfP++IwM4u6iBkjRqe+DGwCSIuiXpZKZJcdcW/QU+Rpx/LURV7ngg8X7U
mzL44uKNTh+e+Sy540E4P8Z5aXUrVnPImOQ1mX3/Jp8mm9K6lLcBTClwq7xQu4cA
PQ4jgRyVIDQyCVwIBbeO0y8kPKaVbGD52ZKoccX2Ox2+0kuTwJi77nCdfIgeSBw=
=P86s
-----END PGP SIGNATURE-----

--B8e0eKXD7jNwoXUF0pwa8IGE0w8Ka4Gwu--
