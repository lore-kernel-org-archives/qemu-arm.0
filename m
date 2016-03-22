Received: by 10.25.208.211 with SMTP id h202csp2044286lfg;
        Tue, 22 Mar 2016 11:42:52 -0700 (PDT)
X-Received: by 10.140.228.68 with SMTP id y65mr51998523qhb.78.1458672172860;
        Tue, 22 Mar 2016 11:42:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 7si29565799qgy.13.2016.03.22.11.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2016 11:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38957 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aiRGW-0006yz-9q
	for alex.bennee@linaro.org; Tue, 22 Mar 2016 14:42:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aiRGT-0006yc-Cq
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 14:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1aiRGO-00064p-Mz
	for qemu-arm@nongnu.org; Tue, 22 Mar 2016 14:42:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46545)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1aiRGO-00064Y-FM; Tue, 22 Mar 2016 14:42:44 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id ED08DC00EB06;
	Tue, 22 Mar 2016 18:42:43 +0000 (UTC)
Received: from [10.3.113.112] (ovpn-113-112.phx2.redhat.com [10.3.113.112])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2MIgh5c004796; Tue, 22 Mar 2016 14:42:43 -0400
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <1458271654-23706-1-git-send-email-peterx@redhat.com>
	<1458271654-23706-3-git-send-email-peterx@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
X-Enigmail-Draft-Status: N1110
Organization: Red Hat, Inc.
Message-ID: <56F19222.2050003@redhat.com>
Date: Tue, 22 Mar 2016 12:42:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1458271654-23706-3-git-send-email-peterx@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="Jl8GqSHPaVPdqK67oQPhUe2v045S9AH5L"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, drjones@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, abologna@redhat.com, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v5 2/5] arm: qmp: add query-gic-capabilities
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
X-TUID: SD7IDN9yARLy

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Jl8GqSHPaVPdqK67oQPhUe2v045S9AH5L
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 03/17/2016 09:27 PM, Peter Xu wrote:
> This patch adds the command "query-gic-capabilities" but not implemnet

s/not implemnet/does not implement/

> it. The command is ARM-only. Return of the command is a list of
> GICCapability struct that describes all GIC versions that current QEMU
> and system support.
>=20
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---

> +++ b/qapi-schema.json
> @@ -4156,3 +4156,14 @@
>    'data': { 'version': 'int',
>              'emulated': 'bool',
>              'kernel': 'bool' } }
> +
> +##
> +# @query-gic-capabilities:
> +#
> +# Return a list of supported GIC version capabilities.
> +#
> +# Returns: a list of GICCapability.
> +#
> +# Since: 2.6
> +##
> +{ 'command': 'query-gic-capabilities', 'returns': ['GICCapability'] }

On the surface, this seems okay.  As mentioned before, I would have
squashed 1 and 2 into a single patch.  The GICCapability type is
extensible, and introspection is sufficient at seeing what the type is
currently capable of exposing.

On the other hand...

> +++ b/scripts/qapi.py
> @@ -46,6 +46,7 @@ returns_whitelist =3D [
>      'query-tpm-models',
>      'query-tpm-types',
>      'ringbuf-read',
> +    'query-gic-capability',

=2E..it required a whitelist, because you are violating the usual
convention of returning a dict.  If you DO need the whitelist, your
addition should have been kept sorted.  But you don't need it, if you
would modify your QAPI to return a dict:

{ 'struct': 'GICCapabilitiesReturn',
  'data': { 'capabilities': ['GICCapability'] } }
{ 'command': 'query-gic-capabilities',
  'returns': 'GICCapabilitiesReturn' }

Yes, the dict has only a single key, and that key points to the same
list; but now you have future extensibility: in the future, we could
return any future global data as a sibling to the array, without having
to modify every element of the array to repeat redundant information.

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--Jl8GqSHPaVPdqK67oQPhUe2v045S9AH5L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJW8ZIiAAoJEKeha0olJ0NqPWgIAJ3wmhWd1b5sTgWluBV3VBSm
fBBJXL0dGAmAL2hOkDCzZ2EjeQpGY4+RqgjgGYAGgCCz8H33WX8dDo5NyuB7P0wl
5hrKJJ2z8i3/XEu3bl2ANPcVTRQT8jmG7bbm231n043NFAxMWrB1ufRrWgmJjtzX
X9AxpEACbUWxkk+EZx33RpDYAxnCkw7FmTvSFSWmhlh/z8dl92hsQzLTmZzObEu2
f+r88F5jWeMTQnpi1d7LSoBXOSHPs2/deTtE3XFoDu9e2HzG8NufxuCwqZQOV+ys
Cv4wsvEeGgW98wFC8qLmz5lQrGJR4umBXsL7TeHBL2vQTD/lZCIVyHPT0lEkgcg=
=Hy/p
-----END PGP SIGNATURE-----

--Jl8GqSHPaVPdqK67oQPhUe2v045S9AH5L--
