Received: by 10.223.172.38 with SMTP id v35csp5668019wrc;
        Mon, 11 Sep 2017 08:11:11 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBKFQ9UfRjqKnMYdcuhsVVwMYlucco3OB9Oal47p5zDyNQnfLn7xQdwaNObQvDHv/9NDCZV
X-Received: by 10.55.4.20 with SMTP id 20mr10247707qke.281.1505142671741;
        Mon, 11 Sep 2017 08:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505142671; cv=none;
        d=google.com; s=arc-20160816;
        b=J/AtLj4Ykw0KS9ICg4xv3anlMO6GUWmcOeA+d6ohu+3rvGVkFzhdwYmneSCx3OFw42
         uGIWNv5/z7awxYk8YGGXgdg5WHTUawiM94Btq8QSZUCaUGmwDjl+k7P+3ubLQF2HNFfR
         Aazh6UA4LVP6s7W0hlM1/qYwtpULQIC3Bx/PkgXVjB2IzSlbQrxd7udR7EbAuIG07QqR
         YHsEg+6vfhw+LkRw35x88tsVy/DGncRIKch4ZEjV1ajdlGsEA9jssZ3gGROiXTniGKap
         /eD6t2JXXR1ZX+5TSTGiK65LPfuMLd4eIz2NNaYxTNm7HNsK6Uoo5nPbrcLnAjZBa7VQ
         JmZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=gJsSKOyJdwFpXkv/VttdosUnTQkRTLrGdCFsxPoA2U0=;
        b=UZeXIelCrLSKZi6zWBFjiYGXmR/pqbcgvoDgUtEb5fwbSsxqzCrcIzvacrjBFWKTH4
         XozZDI4P+eHqTygF8ZDdwSm7ZJVg0RlyJQHzwrhWQ+ZAF7+IBSdAwXY+XLZWzLzgxggO
         +IE/RGvz/CTAR9Ns7ZEjFA4eJaprj1E52kIIJMi/7UoGgjxUL46eU7+c8roSw6dy4y1r
         6mCJPgaMKBeXnYrCFcFQeWLlx+034vxgKT+APJl9iI2D+TPfo3ZW+pUz3kn57UM8wgAc
         yJzazzd9WsoqIYTcwP/d9hYDX7cgPS1MzMIR26Q4TuhxukNB5COW6jvUz2jw0Z/VmM7H
         Temw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f58si9903982qtk.538.2017.09.11.08.11.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Sep 2017 08:11:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58338 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drQMf-0007Ff-9X
	for alex.bennee@linaro.org; Mon, 11 Sep 2017 11:11:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1drQMZ-0007Ew-BH
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 11:11:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1drQMV-00030P-5G
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 11:11:03 -0400
Received: from 13.mo1.mail-out.ovh.net ([178.33.253.128]:43275)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1drQMU-0002zf-SH
	for qemu-arm@nongnu.org; Mon, 11 Sep 2017 11:10:59 -0400
Received: from player169.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id 1124393641
	for <qemu-arm@nongnu.org>; Mon, 11 Sep 2017 17:10:57 +0200 (CEST)
Received: from bahia.lan (gar31-1-82-66-74-139.fbx.proxad.net [82.66.74.139])
	(Authenticated sender: groug@kaod.org)
	by player169.ha.ovh.net (Postfix) with ESMTPSA id 3B19F5800A2;
	Mon, 11 Sep 2017 17:10:45 +0200 (CEST)
Date: Mon, 11 Sep 2017 17:08:04 +0200
From: Greg Kurz <groug@kaod.org>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170911170804.0ee06c00@bahia.lan>
In-Reply-To: <20170911142056.15643-3-lvivier@redhat.com>
References: <20170911142056.15643-1-lvivier@redhat.com>
	<20170911142056.15643-3-lvivier@redhat.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	boundary="Sig_/x60EAfplRCPZUs_wUeQDKkr";
	protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 12069647002008262950
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelledrgedtgdeklecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 178.33.253.128
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH v2 2/3] hmp: fix
 "dump-quest-memory" segfault (arm)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QnSOvMzkmgSW

--Sig_/x60EAfplRCPZUs_wUeQDKkr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Sep 2017 16:20:55 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> Commit fd5d23babf (hmp: fix "dump-quest-memory" segfault)
> fixes the problem for i386, do the same for arm.
>=20
> Running QEMU with
>     qemu-system-aarch64 -M none -nographic -m 256
> and executing
>     dump-guest-memory /dev/null 0 8192
> results in segfault
>=20
> Fix by checking if we have CPU.
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  target/arm/arch_dump.c | 52 +++++++++++++++++++++++++++++++++-----------=
------
>  1 file changed, 34 insertions(+), 18 deletions(-)
>=20
> diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
> index 1a9861f69b..1f58cff256 100644
> --- a/target/arm/arch_dump.c
> +++ b/target/arm/arch_dump.c
> @@ -273,8 +273,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f,=
 CPUState *cs,
>  int cpu_get_dump_info(ArchDumpInfo *info,
>                        const GuestPhysBlockList *guest_phys_blocks)
>  {
> -    ARMCPU *cpu =3D ARM_CPU(first_cpu);
> -    CPUARMState *env =3D &cpu->env;
>      GuestPhysBlock *block;
>      hwaddr lowest_addr =3D ULLONG_MAX;
> =20
> @@ -290,13 +288,32 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>          }
>      }
> =20
> -    if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> -        info->d_machine =3D EM_AARCH64;
> -        info->d_class =3D ELFCLASS64;
> -        info->page_size =3D (1 << 16); /* aarch64 max pagesize */
> -        if (lowest_addr !=3D ULLONG_MAX) {
> -            info->phys_base =3D lowest_addr;
> +    if (first_cpu) {
> +        ARMCPU *cpu =3D ARM_CPU(first_cpu);
> +        CPUARMState *env =3D &cpu->env;
> +        if (arm_feature(env, ARM_FEATURE_AARCH64)) {
> +            info->d_machine =3D EM_AARCH64;
> +            info->d_class =3D ELFCLASS64;
> +            info->page_size =3D (1 << 16); /* aarch64 max pagesize */
> +            if (lowest_addr !=3D ULLONG_MAX) {
> +                info->phys_base =3D lowest_addr;
> +            }
> +        } else {
> +            info->d_machine =3D EM_ARM;
> +            info->d_class =3D ELFCLASS32;
> +            info->page_size =3D (1 << 12);
> +            if (lowest_addr < UINT_MAX) {
> +                info->phys_base =3D lowest_addr;
> +            }
>          }
> +
> +        /* We assume the relevant endianness is that of EL1; this is rig=
ht
> +         * for kernels, but might give the wrong answer if you're trying=
 to
> +         * dump a hypervisor that happens to be running an opposite-endi=
an
> +         * kernel.
> +         */
> +        info->d_endian =3D (env->cp15.sctlr_el[1] & SCTLR_EE) !=3D 0
> +                         ? ELFDATA2MSB : ELFDATA2LSB;
>      } else {
>          info->d_machine =3D EM_ARM;
>          info->d_class =3D ELFCLASS32;
> @@ -304,25 +321,24 @@ int cpu_get_dump_info(ArchDumpInfo *info,
>          if (lowest_addr < UINT_MAX) {
>              info->phys_base =3D lowest_addr;
>          }
> +        info->d_endian =3D ELFDATA2LSB;
>      }
> =20
> -    /* We assume the relevant endianness is that of EL1; this is right
> -     * for kernels, but might give the wrong answer if you're trying to
> -     * dump a hypervisor that happens to be running an opposite-endian
> -     * kernel.
> -     */
> -    info->d_endian =3D (env->cp15.sctlr_el[1] & SCTLR_EE) !=3D 0
> -                     ? ELFDATA2MSB : ELFDATA2LSB;
> -
>      return 0;
>  }
> =20
>  ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
>  {
> -    ARMCPU *cpu =3D ARM_CPU(first_cpu);
> -    CPUARMState *env =3D &cpu->env;
> +    ARMCPU *cpu;
> +    CPUARMState *env;
>      size_t note_size;
> =20
> +    if (first_cpu =3D=3D NULL) {
> +        return 0;
> +    }
> +

Looking at the function's code, it seems that env is only needed if
class !=3D ELFCLASS64... I guess that all the code dealing with first_cpu
should go to the else block.

> +    cpu =3D ARM_CPU(first_cpu);
> +    env =3D &cpu->env;
>      if (class =3D=3D ELFCLASS64) {
>          note_size =3D AARCH64_PRSTATUS_NOTE_SIZE;
>          note_size +=3D AARCH64_PRFPREG_NOTE_SIZE;

--Sig_/x60EAfplRCPZUs_wUeQDKkr
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQQr1DtEU17Ap5iU26IC/DrrAQHbwgUCWbam1AAKCRAC/DrrAQHb
wq51AKCUGYdv7AWaWJ5Fp5PFPoriMJSQcQCeJ+WJpvkZez/BY1LLYHgzDZUPwa0=
=TXlL
-----END PGP SIGNATURE-----

--Sig_/x60EAfplRCPZUs_wUeQDKkr--
