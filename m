Received: by 10.80.166.35 with SMTP id d32csp260836edc;
        Sun, 16 Oct 2016 20:44:31 -0700 (PDT)
X-Received: by 10.55.71.9 with SMTP id u9mr25296795qka.251.1476675871198;
        Sun, 16 Oct 2016 20:44:31 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d39si16807310qkh.195.2016.10.16.20.44.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Oct 2016 20:44:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58829 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bvyqk-0003Sz-Iu
	for alex.bennee@linaro.org; Sun, 16 Oct 2016 23:44:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bvyqd-0003SW-Gc
	for qemu-arm@nongnu.org; Sun, 16 Oct 2016 23:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bvyqZ-00013x-6j
	for qemu-arm@nongnu.org; Sun, 16 Oct 2016 23:44:23 -0400
Received: from ozlabs.org ([103.22.144.67]:38495)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1bvyqY-00012x-Kd; Sun, 16 Oct 2016 23:44:19 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3sy3wc3HHWz9s9x; Mon, 17 Oct 2016 14:44:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1476675856;
	bh=3T4b4QCHKUBrl3kAzinGATYYaSkriITLzG5dLZr7fgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ovjDTmN4fo3nb3YPhe4Bv++6hCw6sZY8zksOAbO1MLBvkLOSxJmzSWXSqgk8KNqsE
	ArIGFzxmsXWNcYRbeipzFP2oQdqX+EyOc+RFIi3xEYhsTuWTAKpz/tzMunfdw+2BrU
	W5EIbBBKgrHvCV7+r7cmddSLMBtv/gPyNccx4R84=
Date: Mon, 17 Oct 2016 14:43:07 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161017034307.GQ25390@umbus.fritz.box>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-2-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oCBD0SPT9UHZkBMO"
Content-Disposition: inline
In-Reply-To: <1476485569-6744-2-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH v3 1/3] exec: split cpu_exec_init()
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
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Chen Gang <gang.chen.5i5j@gmail.com>, Jia Liu <proljc@gmail.com>,
	Alexander Graf <agraf@suse.de>, Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oKmZ9Knk3ehH


--oCBD0SPT9UHZkBMO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 15, 2016 at 12:52:47AM +0200, Laurent Vivier wrote:
> Put in cpu_exec_initfn() what initializes the CPU,
> and let in cpu_exec_init() what adds it to the environment.
>=20
> As cpu_exec_initfn() is called by all XX_cpu_initfn() call it
> directly in cpu_common_initfn().
> cpu_exec_init() is now a realize function, it will be renamed
> to cpu_exec_realizefn() and moved to the XX_cpu_realizefn()
> function in a following patch.
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  exec.c            | 10 ++++++----
>  include/qom/cpu.h |  1 +
>  qom/cpu.c         |  2 ++
>  3 files changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index 374c364..d1e57c4 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -610,11 +610,8 @@ void cpu_exec_exit(CPUState *cpu)
>      }
>  }
> =20
> -void cpu_exec_init(CPUState *cpu, Error **errp)
> +void cpu_exec_initfn(CPUState *cpu)
>  {
> -    CPUClass *cc ATTRIBUTE_UNUSED =3D CPU_GET_CLASS(cpu);
> -    Error *local_err ATTRIBUTE_UNUSED =3D NULL;
> -
>      cpu->as =3D NULL;
>      cpu->num_ases =3D 0;
> =20
> @@ -635,6 +632,11 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
>      cpu->memory =3D system_memory;
>      object_ref(OBJECT(cpu->memory));
>  #endif
> +}
> +
> +void cpu_exec_init(CPUState *cpu, Error **errp)
> +{
> +    CPUClass *cc ATTRIBUTE_UNUSED =3D CPU_GET_CLASS(cpu);
> =20
>      cpu_list_add(cpu);
> =20
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 6d481a1..d7648a9 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -946,6 +946,7 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, in=
t asidx);
> =20
>  void QEMU_NORETURN cpu_abort(CPUState *cpu, const char *fmt, ...)
>      GCC_FMT_ATTR(2, 3);
> +void cpu_exec_initfn(CPUState *cpu);
>  void cpu_exec_exit(CPUState *cpu);
> =20
>  #ifdef CONFIG_SOFTMMU
> diff --git a/qom/cpu.c b/qom/cpu.c
> index c40f774..85f1132 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -362,6 +362,8 @@ static void cpu_common_initfn(Object *obj)
>      QTAILQ_INIT(&cpu->watchpoints);
> =20
>      cpu->trace_dstate =3D bitmap_new(trace_get_vcpu_event_count());
> +
> +    cpu_exec_initfn(cpu);
>  }
> =20
>  static void cpu_common_finalize(Object *obj)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--oCBD0SPT9UHZkBMO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYBEjLAAoJEGw4ysog2bOSkSAP/i8lFAjI0vMfUmhhgxyZivTm
CeaKqRau0+2b5vw0TN9sejbmClbPgLW6tKrZr5BZUirWubxlaYH5LgJL7ldVvDRe
QoomJe5X1J/8DjD4swM52g2z+ZH2ArWzOOfiPWlqokKeKTdMmY6Aa/L0LauDaJH/
mJ7lcKND31I4MnuxaExXpaiDVo9ZCY0R+QlbO+4hm9Aw3k8fTVvC1LvaNkU1ml2A
ErR8GQCVyRJSREZf0hWZp289ZghV4jmgFWAXQ6RkeitwQIM+M7ZMY2ihJAeIjTIe
8D8lE9IKxuMnqkdkNFrKDGiCSRqCY+dkvuE62Y8wuIjU+LoF/CLl1baArmqJYVHF
SvnyC4CfFfzppvcVFJ9j1A2ae2ryjIacRK1QtAiVPfHvuq5HKPbuiqdA4HAYbmuS
SL8lfoMkW+TtOYZvi7NVxuLa6fc0YYGmA1qdB0OlhfXmtDKIGDfzfn61kHXfCrYQ
1qawyY+Ov42dgbdmQ4p6eqvHzuTF88oboxdDoL4zzjrmt51JrS6PtwnvQuLftfAG
KR7a0iOSeJwDifaPtQUbVOx0f8VwHwBkbqPIwOi6SKFrqe/vmxtDnonbCnlJzqZK
n77D/HpgkH0UTrEMY2mEUoW/FF3JEzcOyHUWKEHCIhQBdJhyDRQnBEE1VCZQpImy
hKSHuEC3eYDcSEgZB519
=7JiR
-----END PGP SIGNATURE-----

--oCBD0SPT9UHZkBMO--
