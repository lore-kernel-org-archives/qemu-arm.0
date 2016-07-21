Received: by 10.25.21.156 with SMTP id 28csp154130lfv;
        Wed, 20 Jul 2016 18:51:18 -0700 (PDT)
X-Received: by 10.98.34.66 with SMTP id i63mr67687613pfi.130.1469065878341;
        Wed, 20 Jul 2016 18:51:18 -0700 (PDT)
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c63si6459320pfg.288.2016.07.20.18.51.17;
        Wed, 20 Jul 2016 18:51:18 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S1755495AbcGUBvQ (ORCPT <rfc822;xinliang.liu@linaro.org>
	+ 8 others); Wed, 20 Jul 2016 21:51:16 -0400
Received: from ozlabs.org ([103.22.144.67]:41008 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752832AbcGUBvO (ORCPT <rfc822;kvm@vger.kernel.org>);
	Wed, 20 Jul 2016 21:51:14 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3rvxZl5zf1z9t1n; Thu, 21 Jul 2016 11:51:11 +1000 (AEST)
DKIM-Signature:	v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1469065871;
	bh=R3WVffQBzixwKN7YV+4mZHq0skmv2IYeAluMigyI/cI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UI9ivyjulRo94E3MNyooBjSHQGjpQRKjzd1pUjzQddmgt8+PE29P2fbgGMF3KG3US
	 5wWY8BjZ5suxqIg/f87I/VJFMo2eJDP/XX2I0IqtKkxTd83xGGECsHRlg9dZ/DOOAg
	 mnwGgeUTp1h4pAKHE8c1y7rAcuuTAXwrZ5OH064c=
Date:	Thu, 21 Jul 2016 11:47:18 +1000
From:	David Gibson <david@gibson.dropbear.id.au>
To:	Andrey Smirnov <andrew.smirnov@gmail.com>
Cc:	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH v3 08/10] Convert address_space_rw to use MemoryAccessType
Message-ID: <20160721014718.GB12087@voom.fritz.box>
References: <1468990980-4598-1-git-send-email-andrew.smirnov@gmail.com>
 <1468990980-4598-9-git-send-email-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aM3YZ0Iwxop3KEKx"
Content-Disposition: inline
In-Reply-To: <1468990980-4598-9-git-send-email-andrew.smirnov@gmail.com>
User-Agent: Mutt/1.6.2 (2016-07-01)
Sender:	kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List:	kvm@vger.kernel.org
X-TUID: d0nKhdvI52Iq


--aM3YZ0Iwxop3KEKx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2016 at 10:02:58PM -0700, Andrey Smirnov wrote:
> Convert address_space_rw() to use MemoryAccessType following the
> conversion of cpu_memory_rw_debug().
>=20
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  exec.c                   | 14 +++++++++-----
>  include/exec/memory.h    |  7 +++++--
>  kvm-all.c                |  8 +++++---
>  scripts/coverity-model.c |  9 +++++++--
>  4 files changed, 26 insertions(+), 12 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index 995ff60..5557cc9 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2726,12 +2726,16 @@ MemTxResult address_space_read_full(AddressSpace =
*as, hwaddr addr,
>  }
> =20
>  MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs a=
ttrs,
> -                             uint8_t *buf, int len, bool is_write)
> +                             uint8_t *buf, int len,
> +                             MemoryAccessType access_type)
>  {
> -    if (is_write) {
> +    switch (access_type) {
> +    case MEM_DATA_STORE:
>          return address_space_write(as, addr, attrs, buf, len);
> -    } else {
> +    case MEM_DATA_LOAD:
>          return address_space_read(as, addr, attrs, buf, len);
> +    default:
> +        abort();
>      }
>  }
> =20
> @@ -2739,7 +2743,7 @@ void cpu_physical_memory_rw(hwaddr addr, uint8_t *b=
uf,
>                              int len, int is_write)
>  {
>      address_space_rw(&address_space_memory, addr, MEMTXATTRS_UNSPECIFIED,
> -                     buf, len, is_write);
> +                     buf, len, is_write ? MEM_DATA_STORE : MEM_DATA_LOAD=
);
>  }
> =20
>  enum write_rom_type {
> @@ -3651,7 +3655,7 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong=
 addr,
>          } else {
>              address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
>                               MEMTXATTRS_UNSPECIFIED,
> -                             buf, l, 0);
> +                             buf, l, access_type);
>          }
>          len -=3D l;
>          buf +=3D l;
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 7851ca9..da56c0e 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -22,6 +22,7 @@
>  #define DIRTY_MEMORY_NUM       3        /* num of dirty bits */
> =20
>  #include "exec/cpu-common.h"
> +#include "qom/cpu.h"
>  #ifndef CONFIG_USER_ONLY
>  #include "exec/hwaddr.h"
>  #endif
> @@ -1284,11 +1285,13 @@ void address_space_destroy(AddressSpace *as);
>   * @addr: address within that address space
>   * @attrs: memory transaction attributes
>   * @buf: buffer with the data transferred
> - * @is_write: indicates the transfer direction
> + * @access_type: indicates the transfer direction (only valid values
> + * are MEM_DATA_LOAD for data reads and MEM_DATA_STORE for data
> + * writes)
>   */
>  MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
>                               MemTxAttrs attrs, uint8_t *buf,
> -                             int len, bool is_write);
> +                             int len, MemoryAccessType access_type);
> =20
>  /**
>   * address_space_write: write to address space.
> diff --git a/kvm-all.c b/kvm-all.c
> index a88f917..ed45a95 100644
> --- a/kvm-all.c
> +++ b/kvm-all.c
> @@ -1767,11 +1767,12 @@ static void kvm_handle_io(uint16_t port, MemTxAtt=
rs attrs, void *data, int direc
>  {
>      int i;
>      uint8_t *ptr =3D data;
> +    MemoryAccessType access_type =3D
> +        (direction =3D=3D KVM_EXIT_IO_OUT) ? MEM_DATA_STORE : MEM_DATA_L=
OAD;
> =20
>      for (i =3D 0; i < count; i++) {
>          address_space_rw(&address_space_io, port, attrs,
> -                         ptr, size,
> -                         direction =3D=3D KVM_EXIT_IO_OUT);
> +                         ptr, size, access_type);
>          ptr +=3D size;
>      }
>  }
> @@ -1947,7 +1948,8 @@ int kvm_cpu_exec(CPUState *cpu)
>                               run->mmio.phys_addr, attrs,
>                               run->mmio.data,
>                               run->mmio.len,
> -                             run->mmio.is_write);
> +                             run->mmio.is_write ?
> +                             MEM_DATA_STORE : MEM_DATA_LOAD);
>              ret =3D 0;
>              break;
>          case KVM_EXIT_IRQ_WINDOW_OPEN:
> diff --git a/scripts/coverity-model.c b/scripts/coverity-model.c
> index ee5bf9d..c5603b5 100644
> --- a/scripts/coverity-model.c
> +++ b/scripts/coverity-model.c
> @@ -68,13 +68,18 @@ static void __bufread(uint8_t *buf, ssize_t len)
>  }
> =20
>  MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs a=
ttrs,
> -                             uint8_t *buf, int len, bool is_write)
> +                             uint8_t *buf, int len,
> +                             MemoryAccessType access_type)
>  {
>      MemTxResult result;
> =20
>      // TODO: investigate impact of treating reads as producing
>      // tainted data, with __coverity_tainted_data_argument__(buf).
> -    if (is_write) __bufread(buf, len); else __bufwrite(buf, len);
> +    if (access_type =3D=3D MEM_DATA_STORE) {
> +        __bufread(buf, len);
> +    } else {
> +        __bufwrite(buf, len);
> +    }
> =20
>      return result;
>  }

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--aM3YZ0Iwxop3KEKx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXkCmmAAoJEGw4ysog2bOSNPMQAM4Pu6m2YWtF7zSi832cOV2n
Tt6j4J6aAn6MP6XZ7y7sJ+UDGixjRbChVpCI/btcA1ZeoYphFGCWKPrdqUU7wQpJ
LZVcc+DaGtzbTcBglaAZvNSLO3+NDGRbDJ2yzUVMKehLzUwD9vDzMoVCPv3brCT6
wHyLlWgBt09UY9YljpP3V5HNINoZLi0oaqpqb9QhO1LE3kaI+KqaSLf14wNqwf+R
W8hLDqWqUq6rSRKQmYpXm5NFX6lKM/JQD3Mo3lG5RDeIBfYa5suUeeOxUtC/oa7B
vgMeG7gj12riiYH+1P664bNswnZJLcjfBVOT4xzxwbU+g78yumPbcSvrYWD4fXpk
0oYnTUZGvfi/dXlFvFXvF5E1iiRsAP1LemWi5qVWQ9xhVtQ+8GgQif8qvktJ6CzI
DmSUBPXRbpf6QQl7tnFjIRW0JwcSAJvIuPq1WTx+k+EsghON7b8gYXJhiHXiXPgb
lWdacSLfYJDQl2CoJY7wxtBOEYMg9c4uom+AZAazE2wFG6OZe06TKAgxt7n3yR7u
o+0tqru+2uJ9/oOZ3Bs8/K4av9zux/Qmb1O5EF6OEfvwiM6oRmo+OvDm0jYVnWA/
VVi8blwmnNnOUzdjrwO/ff21a7XeHbXSK2fe03iTM+ddmFTUf2lSNsYfEabFhHec
QLkhv2t5TH2y0m8/KdMR
=VtzM
-----END PGP SIGNATURE-----

--aM3YZ0Iwxop3KEKx--
