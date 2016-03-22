Received: by 10.25.208.211 with SMTP id h202csp2039848lfg;
        Tue, 22 Mar 2016 11:32:51 -0700 (PDT)
X-Received: by 10.140.157.7 with SMTP id d7mr51906797qhd.17.1458671571822;
        Tue, 22 Mar 2016 11:32:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n127si15477846qhb.71.2016.03.22.11.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 11:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38900 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiR6p-0000rH-9e
	for alex.bennee@linaro.org; Tue, 22 Mar 2016 14:32:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aiR6Y-0000TN-Rm
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 14:32:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aiR6T-0002lz-MU
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 14:32:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40777)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aiR6T-0002ln-II; Tue, 22 Mar 2016 14:32:29 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 210AA7F08D;
	Tue, 22 Mar 2016 18:32:29 +0000 (UTC)
Received: from [10.3.113.112] (ovpn-113-112.phx2.redhat.com [10.3.113.112])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2MIWSfx030163; Tue, 22 Mar 2016 14:32:28 -0400
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-2-git-send-email-peterx@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <56F18FBC.3030909@redhat.com>
Date: Tue, 22 Mar 2016 12:32:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458271654-23706-2-git-send-email-peterx@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="eh0QsTCkWo9UHfKBgwHFvKKJ7GV36fLoD"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, abologna@redhat.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v5 1/5] arm: qmp: add GICCapability struct
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
X-TUID: Y86FhRTxy5fS

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--eh0QsTCkWo9UHfKBgwHFvKKJ7GV36fLoD
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/17/2016 09:27 PM, Peter Xu wrote:
> Define new struct to describe whether we support specific GIC version.
>=20
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  qapi-schema.json | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/qapi-schema.json b/qapi-schema.json
> index f253a37..da9671a 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -4134,3 +4134,25 @@
>  ##
>  { 'enum': 'ReplayMode',
>    'data': [ 'none', 'record', 'play' ] }
> +
> +##
> +# @GICCapability:
> +#
> +# This struct describes capability for a specific GIC version. These

Might be nice to spell out what the acronym GIC means, but that's cosmeti=
c.

> +# bits are not only decided by QEMU/KVM software version, but also
> +# decided by the hardware that the program is running upon.
> +#
> +# @version:  version of GIC to be described.
> +#
> +# @emulated: whether current QEMU/hardware supports emulated GIC
> +#            device in user space.
> +#
> +# @kernel:   whether current QEMU/hardware supports hardware
> +#            accelerated GIC device in kernel.
> +#
> +# Since: 2.6
> +##
> +{ 'struct': 'GICCapability',
> +  'data': { 'version': 'int',
> +            'emulated': 'bool',
> +            'kernel': 'bool' } }
>=20

I might have squashed this with the patch that first uses GICCapability,
as defining a type in isolation doesn't do much.

Reviewed-by: Eric Blake <eblake@redhat.com>

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--eh0QsTCkWo9UHfKBgwHFvKKJ7GV36fLoD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW8Y+8AAoJEKeha0olJ0NqHtoH/AmFP67ZadpwoMGvNiaC4rLa
l7SWA4/lZUFbbgDEygwa3A447LqUsXxGnQJDLRDvo/o7KrVyy5dSizzrbFscuGOk
jwuSkhTnTMOPcEwm/sMYM+LRB7R5rQmIKhrXR7mp39Ugskz8HAREjnxf9G4aPrvD
k4L0ATmAfoioepZ/2MrzrmgPq5+bDHxqpPstJvHEHhYbmXRZXPhwCXNx+WcKQxoi
2igvRJVf9Agg3CMQuxwCu6Yl02ov2ntwsDo6ynRUjTABe78pK8AH/FjIVFOKUvwO
mUj8FzwamDwv/wtXITaJ5mqUYHpy3SDUru+k8wsumLzYnpJULi3PcbXsfzcE77w=
=hRLg
-----END PGP SIGNATURE-----

--eh0QsTCkWo9UHfKBgwHFvKKJ7GV36fLoD--
