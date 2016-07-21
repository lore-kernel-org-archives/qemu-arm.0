Received: by 10.25.21.156 with SMTP id 28csp154145lfv;
        Wed, 20 Jul 2016 18:51:20 -0700 (PDT)
X-Received: by 10.98.75.219 with SMTP id d88mr70059455pfj.91.1469065878639;
        Wed, 20 Jul 2016 18:51:18 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c63si6459320pfg.288.2016.07.20.18.51.18;
        Wed, 20 Jul 2016 18:51:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1754219AbcGUBvP (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 21:51:15 -0400
Received: from ozlabs.org ([103.22.144.67]:38793 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753363AbcGUBvO (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 21:51:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rvxZl6dNPz9t1f; Thu, 21 Jul 2016 11:51:11 +1000 (AEST)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1469065871;
	bh=9hTOm4a6rW0Y5LjLaH6fpdxlgw3vHtxSxV00uvCs/eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ww4uCjTHpOY+uVC5PZMZpIg/RUqflbmSodIOcrZkBbWfXmLC32CUnJ+IuKmR6r4h8
	 L1diNrmGtrtXlcvMUCfupIjtitz4aG7KHyHq8Jo5J69hZLS+z2FklAj6l4OiOk+fX8
	 I3vRBsCsICON00vEKVxcav+3nGMFgCQMrZqo+tek=
Date:	Thu, 21 Jul 2016 11:48:27 +1000
From:	David Gibson <david@gibson.dropbear.id.au>
To:	Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH v3 09/10] gdbstub: Convert target_memory_rw_debug to use
 MemoryAccessType
Message-ID: <20160721014827.GA31439@voom.fritz.box>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
 <1468990980-4598-10-git-send-email-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <1468990980-4598-10-git-send-email-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: OhWSWQvuMIzf


--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 10:02:59PM -0700, Andrey Smirnov wrote:
> Convert target_memory_rw_debug to use MemoryAccessType as to follow
> similar conversion of cpu_memory_rw_debug.
>=20
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  gdbstub.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> diff --git a/gdbstub.c b/gdbstub.c
> index 9c4cbe4..c215672 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -44,15 +44,17 @@
>  #endif
> =20
>  static inline int target_memory_rw_debug(CPUState *cpu, target_ulong add=
r,
> -                                         uint8_t *buf, int len, bool is_=
write)
> +                                         uint8_t *buf, int len,
> +                                         MemoryAccessType access_type)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
> =20
>      if (cc->memory_rw_debug) {
> +        const bool is_write =3D (access_type =3D=3D MEM_DATA_STORE);
>          return cc->memory_rw_debug(cpu, addr, buf, len, is_write);
>      }
> -    return cpu_memory_rw_debug(cpu, addr, buf, len,
> -                               is_write ? MEM_DATA_STORE : MEM_DATA_LOAD=
);
> +
> +    return cpu_memory_rw_debug(cpu, addr, buf, len, access_type);
>  }
> =20
>  enum {
> @@ -966,7 +968,8 @@ static int gdb_handle_packet(GDBState *s, const char =
*line_buf)
>              break;
>          }
> =20
> -        if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len, false) =
!=3D 0) {
> +        if (target_memory_rw_debug(s->g_cpu, addr, mem_buf,
> +                                   len, MEM_DATA_LOAD) !=3D 0) {
>              put_packet (s, "E14");
>          } else {
>              memtohex(buf, mem_buf, len);
> @@ -988,7 +991,7 @@ static int gdb_handle_packet(GDBState *s, const char =
*line_buf)
>          }
>          hextomem(mem_buf, p, len);
>          if (target_memory_rw_debug(s->g_cpu, addr, mem_buf, len,
> -                                   true) !=3D 0) {
> +                                   MEM_DATA_STORE) !=3D 0) {
>              put_packet(s, "E14");
>          } else {
>              put_packet(s, "OK");

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkCnqAAoJEGw4ysog2bOSC3kQAN9loyq6QKd1mCcZSkT5JMct
CcrCtfYqRm3KiVc2+kOZSW5oLjTv3I8ulFCnJk6g85k9WndmZSYcc8ID7htTdqXh
z3dk1zPKZwkPRvitmc73kgOv1CQ5c1ZhnP6XjFqf7ksCXace3uZNr3OBBO10+Q9H
wyZxiQ3k2J0uW/fuZntBy69oL89QQ+5MwIPFUYUhOa500vLkDD5Yvd9fMy350QwX
nVvJhKlskaIVhfJQJdDDevyMtWW2/DzYgMASaTZvhjdwUcWWnqUlkW5BPCBYHanQ
R7/YyrXVVSKJs85UYBQK6NuH6/8CbG6DkpigFNYoG9aBd5DcfA2/ni01VVQ6JSNz
J2R9jC/qDyPEtRqpaMdkkZTrZNVcJxBppWUW54I2h2SDWKgSEANyA/QAzJ/Crmo8
gBYO0oNroIF6ibCmvvGlaJqxmRJXrP94Jl664EUHjluuRbpECnXn2VIxVVZjUwlf
hdxV05EOZ9NrWtIK2byGFuzrCyZHoiZBnLao3ndzHj6ZQrNXr0l7UL3dA+8XjdEE
Ab2vKsiRwJjVSZq4gBG8dxomBXV1H2liuMHViv5qUX29taELQzQnx+MealkJlgvm
AWe0mjsgMq/qM+7ab1NNOnWWjs/Gu3Prk2My3qvp8svlwhMiYgm91d9Q7kbVIg2h
CdTU8PLWeuZRun0RBfj1
=E9Ey
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
