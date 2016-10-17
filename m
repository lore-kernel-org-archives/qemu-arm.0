Received: by 10.80.166.35 with SMTP id d32csp261236edc;
        Sun, 16 Oct 2016 20:46:33 -0700 (PDT)
X-Received: by 10.55.15.215 with SMTP id 84mr22290912qkp.232.1476675993053;
        Sun, 16 Oct 2016 20:46:33 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 6si16792921qkl.267.2016.10.16.20.46.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Oct 2016 20:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bvysi-0004hz-Ev
	for alex.bennee@linaro.org; Sun, 16 Oct 2016 23:46:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bvyqc-0003SJ-NE
	for qemu-devel@nongnu.org; Sun, 16 Oct 2016 23:44:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bvyqb-00015u-LI
	for qemu-devel@nongnu.org; Sun, 16 Oct 2016 23:44:22 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:55465)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1bvyqa-000136-Lj; Sun, 16 Oct 2016 23:44:21 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3sy3wc3yMkz9s9c; Mon, 17 Oct 2016 14:44:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1476675856;
	bh=YsprNICl/Q9dZcjZYCfSbkzlxpsRlJByyhEu3xHEfNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eM1P4llFnKh/f/+XGg4D70chxRBI5hfe9taPXhaRqDpW0t8JBrdcoUnNfU7ViEzUb
	j+9chjVgAeihFAMgD4ho8njkESGczQtmTv79COdTmn0MH6dsiVC+OgWkPeNKiDVO60
	1zelrpdMuh6OznC3uRMaxN8hLfJ3hOFXbTMrGkps=
Date: Mon, 17 Oct 2016 14:43:32 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161017034332.GS25390@umbus.fritz.box>
References: <1476485569-6744-1-git-send-email-lvivier@redhat.com>
	<1476485569-6744-4-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BZziOT8Kz25R/m/E"
Content-Disposition: inline
In-Reply-To: <1476485569-6744-4-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-devel] [PATCH v3 3/3] exec: call cpu_exec_exit() from a
 CPU unrealize common function
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Anthony Green <green@moxielogic.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Greg Ungerer <gerg@uclinux.org>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RjlgZ4/7wkk6


--BZziOT8Kz25R/m/E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 15, 2016 at 12:52:49AM +0200, Laurent Vivier wrote:
> As cpu_exec_exit() mirrors the cpu_exec_realizefn(),
> rename it as cpu_exec_unrealizefn().
>=20
> Create and register a cpu_common_unrealizefn() function for
> the CPU device class and call cpu_exec_unrealizefn() from
> this function.
>=20
> Remove cpu_exec_exit() from cpu_common_finalize()
> (which mirrors init, not realize), and as x86_cpu_unrealizefn()
> overwrites the device class unrealize function, add a call to
> cpu_exec_unrealizefn() (as in ppc_cpu_unrealizefn()).
>=20
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>

> ---
>  exec.c                      | 2 +-
>  include/qom/cpu.h           | 2 +-
>  qom/cpu.c                   | 8 +++++++-
>  target-i386/cpu.c           | 2 ++
>  target-ppc/translate_init.c | 2 +-
>  5 files changed, 12 insertions(+), 4 deletions(-)
>=20
> diff --git a/exec.c b/exec.c
> index 203eb52..3cd25db 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -596,7 +596,7 @@ AddressSpace *cpu_get_address_space(CPUState *cpu, in=
t asidx)
>  }
>  #endif
> =20
> -void cpu_exec_exit(CPUState *cpu)
> +void cpu_exec_unrealizefn(CPUState *cpu)
>  {
>      CPUClass *cc =3D CPU_GET_CLASS(cpu);
> =20
> diff --git a/include/qom/cpu.h b/include/qom/cpu.h
> index 5520c6c..633c3fc 100644
> --- a/include/qom/cpu.h
> +++ b/include/qom/cpu.h
> @@ -948,7 +948,7 @@ void QEMU_NORETURN cpu_abort(CPUState *cpu, const cha=
r *fmt, ...)
>      GCC_FMT_ATTR(2, 3);
>  void cpu_exec_initfn(CPUState *cpu);
>  void cpu_exec_realizefn(CPUState *cpu, Error **errp);
> -void cpu_exec_exit(CPUState *cpu);
> +void cpu_exec_unrealizefn(CPUState *cpu);
> =20
>  #ifdef CONFIG_SOFTMMU
>  extern const struct VMStateDescription vmstate_cpu_common;
> diff --git a/qom/cpu.c b/qom/cpu.c
> index 85f1132..03d9190 100644
> --- a/qom/cpu.c
> +++ b/qom/cpu.c
> @@ -345,6 +345,12 @@ static void cpu_common_realizefn(DeviceState *dev, E=
rror **errp)
>      trace_init_vcpu(cpu);
>  }
> =20
> +static void cpu_common_unrealizefn(DeviceState *dev, Error **errp)
> +{
> +    CPUState *cpu =3D CPU(dev);
> +    cpu_exec_unrealizefn(cpu);
> +}
> +
>  static void cpu_common_initfn(Object *obj)
>  {
>      CPUState *cpu =3D CPU(obj);
> @@ -369,7 +375,6 @@ static void cpu_common_initfn(Object *obj)
>  static void cpu_common_finalize(Object *obj)
>  {
>      CPUState *cpu =3D CPU(obj);
> -    cpu_exec_exit(cpu);
>      g_free(cpu->trace_dstate);
>  }
> =20
> @@ -403,6 +408,7 @@ static void cpu_class_init(ObjectClass *klass, void *=
data)
>      k->cpu_exec_exit =3D cpu_common_noop;
>      k->cpu_exec_interrupt =3D cpu_common_exec_interrupt;
>      dc->realize =3D cpu_common_realizefn;
> +    dc->unrealize =3D cpu_common_unrealizefn;
>      /*
>       * Reason: CPUs still need special care by board code: wiring up
>       * IRQs, adding reset handlers, halting non-first CPUs, ...
> diff --git a/target-i386/cpu.c b/target-i386/cpu.c
> index 3476d46..399a3e4 100644
> --- a/target-i386/cpu.c
> +++ b/target-i386/cpu.c
> @@ -3253,6 +3253,8 @@ static void x86_cpu_unrealizefn(DeviceState *dev, E=
rror **errp)
>          object_unparent(OBJECT(cpu->apic_state));
>          cpu->apic_state =3D NULL;
>      }
> +
> +    cpu_exec_unrealizefn(CPU(dev));
>  }
> =20
>  typedef struct BitProperty {
> diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
> index 40dae70..2de6a06 100644
> --- a/target-ppc/translate_init.c
> +++ b/target-ppc/translate_init.c
> @@ -9910,7 +9910,7 @@ static void ppc_cpu_unrealizefn(DeviceState *dev, E=
rror **errp)
>      opc_handler_t **table, **table_2;
>      int i, j, k;
> =20
> -    cpu_exec_exit(CPU(dev));
> +    cpu_exec_unrealizefn(CPU(dev));
> =20
>      for (i =3D 0; i < PPC_CPU_OPCODES_LEN; i++) {
>          if (env->opcodes[i] =3D=3D &invalid_handler) {

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--BZziOT8Kz25R/m/E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBCAAGBQJYBEjkAAoJEGw4ysog2bOSpswP9RiNBdMQ1RHrJYz3wzy7/GZU
zpuM6qop1QBsnw5E5prLVaOehBtBdh3nri5DiJMJ+FhE+nU0zDXH3yCPvS67M2Fi
qxcx3E2oWs4W4xQMI/G03OjZq9jfdClag0zKHDBfgFCtu3X0nhNjAdI6FL9ruTul
FLS7tmf0TlWmoaf6fabxbvFy4nG2JPyAoOqeGbgUl7TaH9RsCt32YqjYi+zMr6U5
bbL9Oq2qYZim9tnKU/ibA4FRAxnr7s8vFLhhHO7AvfoZlaa5C/nWvb0kqXRelLcv
Qsbh8IRJIS57ZqIOr5975dXHbizw19CHVxeoCZCmXCMjckyR+EIkimAQ5AB0HFTf
S7INW96tIkW2744Aw2M7Xp6CGRoyMMhUcWwpFUroKnVTgBcwyBQFUDN4Nj4V20u4
W7GWDR2WCB4kAeRGN+/+07LL058ZcOKfq/SF1w7UmDLKhiBhhRocxROmsG8C5BUd
mmjy7c2Qw8lPWQrsiuUNu3ndM6KEVSv+50B+LIS+J3SuTnqjckfPLARHFLn02Fri
Ns6Xq8W3jNXEKxmX1UQoLpHcp4shW2KRWLsmrSbBOBNPLce1KYa9C1ktNUYFKHIb
6qKnCeD8Nb9ePQlMJkbPBHZ0qynWfND9zD91AoNEL56sS8YQMZhSbqyfIk/zOK7p
56lQJryAvS7ivCGy2LY=
=aP38
-----END PGP SIGNATURE-----

--BZziOT8Kz25R/m/E--
