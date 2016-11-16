Received: by 10.25.150.194 with SMTP id y185csp279684lfd;
        Wed, 16 Nov 2016 10:47:29 -0800 (PST)
X-Received: by 10.55.15.152 with SMTP id 24mr5222648qkp.45.1479322049142;
        Wed, 16 Nov 2016 10:47:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 95si22533373qkp.204.2016.11.16.10.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Nov 2016 10:47:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54078 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c75F1-0005Px-Sb
	for alex.bennee@linaro.org; Wed, 16 Nov 2016 13:47:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c75Ew-0005P4-Oz
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 13:47:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1c75Et-0001OO-Lj
	for qemu-arm@nongnu.org; Wed, 16 Nov 2016 13:47:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59084)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1c75Et-0001O0-CP; Wed, 16 Nov 2016 13:47:19 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2EC3691BD;
	Wed, 16 Nov 2016 18:47:17 +0000 (UTC)
Received: from [10.3.116.206] (ovpn-116-206.phx2.redhat.com [10.3.116.206])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAGIlFLu020566; Wed, 16 Nov 2016 13:47:15 -0500
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
References: <1479320499-29818-1-git-send-email-ehabkost@redhat.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <b5f6826a-0662-9d7d-7321-20d425fb651c@redhat.com>
Date: Wed, 16 Nov 2016 12:47:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479320499-29818-1-git-send-email-ehabkost@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="dC2kSxk81d5puIFMmMLhfpNuF2xtgNs4M"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 16 Nov 2016 18:47:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH for-2.9] qmp: Report QOM type name on
 query-cpu-definitions
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
	"Daniel P. Berrange" <berrange@redhat.com>,
	libvir-list@redhat.com, Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, David Gibson <dgibson@redhat.com>,
	Jiri Denemark <jdenemar@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X54bAgAI7paO

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dC2kSxk81d5puIFMmMLhfpNuF2xtgNs4M
Content-Type: multipart/mixed; boundary="r7vo3devV6AdIRir6JTcKwrM8Dg3j58pW";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: David Gibson <dgibson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Jiri Denemark <jdenemar@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson <rth@twiddle.net>,
 Alexander Graf <agraf@suse.de>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 libvir-list@redhat.com
Message-ID: <b5f6826a-0662-9d7d-7321-20d425fb651c@redhat.com>
Subject: Re: [PATCH for-2.9] qmp: Report QOM type name on
 query-cpu-definitions
References: <1479320499-29818-1-git-send-email-ehabkost@redhat.com>
In-Reply-To: <1479320499-29818-1-git-send-email-ehabkost@redhat.com>

--r7vo3devV6AdIRir6JTcKwrM8Dg3j58pW
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/16/2016 12:21 PM, Eduardo Habkost wrote:
> The new typename attribute on query-cpu-definitions will be used
> to help management software use device-list-properties to check
> which properties can be set using -cpu or -global for the CPU
> model.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  qapi-schema.json            | 4 +++-
>  target-arm/helper.c         | 1 +
>  target-i386/cpu.c           | 1 +
>  target-ppc/translate_init.c | 1 +
>  target-s390x/cpu_models.c   | 1 +
>  5 files changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/qapi-schema.json b/qapi-schema.json
> index b0b4bf6..9a3bdd4 100644
> --- a/qapi-schema.json
> +++ b/qapi-schema.json
> @@ -3216,6 +3216,8 @@
>  # @unavailable-features: #optional List of properties that prevent
>  #                        the CPU model from running in the current
>  #                        host. (since 2.8)
> +# @typename: Type name that can be used as argument to @device-list-pr=
operties,
> +#            to introspect properties configurable using -cpu or -glob=
al.

Missing a '(since 2.9)' designation.

>  #
>  # @unavailable-features is a list of QOM property names that
>  # represent CPU model attributes that prevent the CPU from running.
> @@ -3237,7 +3239,7 @@
>  ##
>  { 'struct': 'CpuDefinitionInfo',
>    'data': { 'name': 'str', '*migration-safe': 'bool', 'static': 'bool'=
,
> -            '*unavailable-features': [ 'str' ] } }
> +            '*unavailable-features': [ 'str' ], 'typename': 'str' } }
> =20

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--r7vo3devV6AdIRir6JTcKwrM8Dg3j58pW--

--dC2kSxk81d5puIFMmMLhfpNuF2xtgNs4M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJYLKmyAAoJEKeha0olJ0Nq6yoH/20Cj0MlsusBjO7jEGQPoJ1K
ovDJOMjBycWJ7cJcGK/BGWDCMksFTgdHo/qQIXIFSwcUNuOy+jgyGBuB2j4r9wTm
PY3P94h7AUwVjNpKUmQqBTiIQf/nRPHx8ID55ozyQuEQSX9m7DjdqWJrcmkieE7v
YmT2EKeyqHvI3tGu2tGBD5rdYs6lXm70+4B2CXCzURxO0Hx80zdBzZBlXr2FfHIp
XWwz++CDvRFWvJpb9iAmTYxFMLmMG8TOqLQVJ926NTjU77c7D4x8b7LjEJ7DsPX3
Djwh71+5dL9smLiUnsqal+7seetFmna/xGNVmqOK/HcYQaoHSz6Ts5oA9t0a19c=
=TYtG
-----END PGP SIGNATURE-----

--dC2kSxk81d5puIFMmMLhfpNuF2xtgNs4M--
