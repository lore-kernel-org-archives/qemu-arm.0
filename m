Received: by 10.25.0.198 with SMTP id 189csp869237lfa;
        Thu, 4 May 2017 19:30:17 -0700 (PDT)
X-Received: by 10.55.91.133 with SMTP id p127mr11519297qkb.280.1493951416930;
        Thu, 04 May 2017 19:30:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n28si3358320qtc.223.2017.05.04.19.30.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 May 2017 19:30:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6T0Y-0006sa-3O
	for alex.bennee@linaro.org; Thu, 04 May 2017 22:30:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51190)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d6T0T-0006pZ-6l
	for qemu-arm@nongnu.org; Thu, 04 May 2017 22:30:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1d6T0S-0000sx-1d
	for qemu-arm@nongnu.org; Thu, 04 May 2017 22:30:09 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:57061)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1d6T0R-0000pw-Iu; Thu, 04 May 2017 22:30:07 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3wJwpg1nqZz9s8W; Fri,  5 May 2017 12:30:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1493951403;
	bh=RIms/FiZNk5LTCpP7N4r9Zr1GQJUGqSPbOhFf8DyNFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AmkPjJqgm3K60BRCuQJGy8Hn9NdZR3/G+f/lELSwe4dSZA4pCu4BE9oiCm7vbaQJO
	QtmN/ix3zV+2cMIQWU2Sdj0dCoq0DKLpneDHUz1SpfXJ1k5tcFNDbAX47tvSFQD9Bd
	YcEYW3LI2D1Z0V0QkugetaJ+rIb0uF3FRPHb5wTs=
Date: Fri, 5 May 2017 11:45:22 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170505014522.GK14413@umbus.fritz.box>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-13-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Content-Disposition: inline
In-Reply-To: <1493816238-33120-13-git-send-email-imammedo@redhat.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH v2 12/24] numa: add numa_[has_]node_id()
 wrappers
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
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gBGEscwdhQVe


--kswDJesP0akhmDn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2017 at 02:57:06PM +0200, Igor Mammedov wrote:
> wrappers should make access to [has]node_id fields more readable
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

Correct, though I'm not sure it actually simplifies things that much.
Maybe more in future patches, though.

> ---
>  follow up patches will use this wrappers
>  v2:
>     - add wrappers (Drew)
> ---
>  include/sysemu/numa.h | 10 ++++++++++
>  numa.c                |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/sysemu/numa.h b/include/sysemu/numa.h
> index 46ea6c7..98d01e6 100644
> --- a/include/sysemu/numa.h
> +++ b/include/sysemu/numa.h
> @@ -35,4 +35,14 @@ uint32_t numa_get_node(ram_addr_t addr, Error **errp);
>  /* on success returns node index in numa_info,
>   * on failure returns nb_numa_nodes */
>  int numa_get_node_for_cpu(int idx);
> +
> +static inline bool numa_has_node_id(const CPUArchIdList *possible_cpus, =
int idx)
> +{
> +    return possible_cpus->cpus[idx].props.has_node_id;
> +}
> +
> +static inline int numa_node_id(const CPUArchIdList *possible_cpus, int i=
dx)
> +{
> +    return possible_cpus->cpus[idx].props.node_id;
> +}
>  #endif
> diff --git a/numa.c b/numa.c
> index c7e3e0a..872ee0d 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -394,7 +394,7 @@ void parse_numa_opts(MachineState *ms)
> =20
>          possible_cpus =3D mc->possible_cpu_arch_ids(ms);
>          for (i =3D 0; i < possible_cpus->len; i++) {
> -            if (possible_cpus->cpus[i].props.has_node_id) {
> +            if (numa_has_node_id(possible_cpus, i)) {
>                  break;
>              }
>          }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZC9kuAAoJEGw4ysog2bOSmSsP/0ccdmR65sMDQswO18tGBQUu
H9UJQJImV0UkmeTrbeN7JRzqKIOmqQ1dkunRzeS2R7M6vdyZZFZPbjMhNocOTmmh
hOg/yBM3rPPtUnOHkQ68zhQlVS0nrwZSpExoyFt9UWed8i0thQZSVxAw1OP0Ya5v
lI8GuP5s051cn1a2VzjpPJJFEgKxVBsEYXPhpU0Qc0Ql6mupLoF0hTp6v6jSjbDi
Np4G/znuzO3Ze4vhRBhzlfwgcOZdCHM8laXUNWo/TpzZlIO9lB0XPe3WLGgD3UQB
FcikNtGRFK6zQ65MosCL9Y1cdnxHzOwJRedzlDZm8zvsfs6pTB5GXeLiGetln7Gz
bNe1ddFtzrbUICgrqduBhMud9shhROqfFakzNO9oQDqk4RcLwDuFIGPL1nMHIGGn
rjJdqjqjhnt0RLmx5viwqRxP82Jxr0tC6q9KScVc4w/QGNVBtkLAM9arf/cgGER+
+DnMOytU2Sjia1C2nrc/iRPzy7CPUS3540EZvEWaQ9HfAKQKJ4tVO+eHNF1oA4e0
yZ3p1FCCctkao0GiJr+aZCw/gitVwMXCw/aUHM15mwKMgUzyqTLHYxTCjKuu5u4B
tBUDkKdvXxZvG6fsj4VE0x4GRL8vEYkBxRG3+VWKJHuudwkl54JMCa+RBFarSQLj
CCuYREyAVcBX/F+j7yVL
=e8CJ
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--
