Received: by 10.80.163.71 with SMTP id 65csp3022503edn;
        Wed, 5 Oct 2016 22:06:52 -0700 (PDT)
X-Received: by 10.55.120.195 with SMTP id t186mr12594800qkc.118.1475730412334;
        Wed, 05 Oct 2016 22:06:52 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r70si7030396qkl.173.2016.10.05.22.06.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Oct 2016 22:06:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:53141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bs0tP-0006sU-Oo
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 01:06:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bs0tJ-0006qt-G1
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 01:06:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bs0tG-0004KY-4U
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 01:06:45 -0400
Received: from ozlabs.org ([103.22.144.67]:50435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bs0tF-0004Jn-5q; Thu, 06 Oct 2016 01:06:42 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3sqLGd1TkGz9sQw; Thu,  6 Oct 2016 16:06:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1475730393;
	bh=zRwomXpV3Bulr88QMhVlz5pUeMCGbNivL8rBylL9Id4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IiqPnmpHWxr94UNXiEdy2J7FTU/wXImOxgV4PjWNPw/LU7xDDPqa3tfIBIea92U1B
	wO4bfimSsp/YfXJSv/KaEUVekpgjw6LUY4P/KVTOO6GEHM+085Fv1jt+LoxSOiGB7e
	ape+hU7O4ZQB/9+d6jSpyqh9fTMFsQrV+xmTDImM=
Date: Thu, 6 Oct 2016 16:06:03 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20161006050603.GJ18733@umbus.fritz.box>
References: <1475696333-8706-1-git-send-email-lvivier@redhat.com>
	<1475696333-8706-6-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mFHiwr52TKrxpkjc"
Content-Disposition: inline
In-Reply-To: <1475696333-8706-6-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.7.0 (2016-08-17)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: Re: [Qemu-arm] [PATCH 05/19] target-arm: move cpu_exec_realize() to
 realize function
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
Cc: Matthew Rosato <mjrosato@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Bharata B Rao <bharata@linux.vnet.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tJCX6nFXjAyC


--mFHiwr52TKrxpkjc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 05, 2016 at 09:38:39PM +0200, Laurent Vivier wrote:
> I've removed the cannot_destroy_with_object_finalize_yet field as
> cpu_exec_init() is not called by arm_cpu_initfn() anymore

I think this (and most of the similar commit messages following) needs
a slight reword.  A function called 'cpu_exec_init()' is still called
=66rom the initfn, it's just the unsafe things it used to do have been
moved to cpu_exec_realize().

> (tested with QOM command provided by commit 4c315c27 with
>  "arm1026-arm-cpu")
>=20
> CC: Peter Maydell <peter.maydell@linaro.org>
> CC: qemu-arm@nongnu.org
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  target-arm/cpu.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
>=20
> diff --git a/target-arm/cpu.c b/target-arm/cpu.c
> index 5fda716..7920fb0 100644
> --- a/target-arm/cpu.c
> +++ b/target-arm/cpu.c
> @@ -445,7 +445,6 @@ static void arm_cpu_initfn(Object *obj)
> =20
>      cs->env_ptr =3D &cpu->env;
>      cpu_exec_init(cs, &error_abort);
> -    cpu_exec_realize(cs, &error_abort);
>      cpu->cp_regs =3D g_hash_table_new_full(g_int_hash, g_int_equal,
>                                           g_free, g_free);
> =20
> @@ -577,6 +576,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>      ARMCPU *cpu =3D ARM_CPU(dev);
>      ARMCPUClass *acc =3D ARM_CPU_GET_CLASS(dev);
>      CPUARMState *env =3D &cpu->env;
> +    Error *local_err =3D NULL;
> +
> +    cpu_exec_realize(cs, &local_err);
> +    if (local_err !=3D NULL) {
> +        error_propagate(errp, local_err);
> +        return;
> +    }
> =20
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
> @@ -1534,17 +1540,6 @@ static void arm_cpu_class_init(ObjectClass *oc, vo=
id *data)
>      cc->debug_check_watchpoint =3D arm_debug_check_watchpoint;
> =20
>      cc->disas_set_info =3D arm_disas_set_info;
> -
> -    /*
> -     * Reason: arm_cpu_initfn() calls cpu_exec_init(), which saves
> -     * the object in cpus -> dangling pointer after final
> -     * object_unref().
> -     *
> -     * Once this is fixed, the devices that create ARM CPUs should be
> -     * updated not to set cannot_destroy_with_object_finalize_yet,
> -     * unless they still screw up something else.
> -     */
> -    dc->cannot_destroy_with_object_finalize_yet =3D true;
>  }
> =20
>  static void cpu_register(const ARMCPUInfo *info)

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--mFHiwr52TKrxpkjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJX9du7AAoJEGw4ysog2bOSKsMQAKhYJj4L8t01G6h7CnxLz4nM
PQso9XIB5kdjUSTm6JbueKS2mGeLYyThTJqQucLyAXXLfnYgXGJFRN95Ak6mqz72
SteNgc6yJPbDHfjf6I8uIlkffMEhPz/NITYgAkmwl/mbcPBbCnaX6x+eGWxQzdN0
lBZqIWL2vRRrUkfGYKkHg0unHx/+LLVXRsneiDGLf9W43RZroU3YHvnlo7/c4jdT
Odw6w6IAOlPNk5um/iMjjeLI68Iur3c0D2sOSehWnRJ9zv8WfICvocSX/sKUbNKO
c8mqDvblNnLmtdjof7aDNE/n0NKKHFUj3pV/zBCMnIIpd4IwBrmQwd8KeVJ2JJtH
hRD1blQRjMTrgk7F5r2NU41XAdnHcTF+J92tdXr9O74JYA8HPVCazPmJhyby1hVq
hzX1egxUkhVmuinuLumPbokriTqY3f/WTaXdkviCj7Wexub2lztgYGZPjvtGkNgq
c8nhGI3uzE1amn4gsJ0Q6L6Kmyj0D1+PhKrnJQXKt0LPrJG1H9nGdmyt+5DVJACv
G/9oHAWc4rpxLult1FCjtR89BkaCGSGZb8cD5SgRbaR9b5ihaydEopF54MaLmENc
1FiNa9ST/Al4bIvYkQAr6DL+Hd+z7tPPlnMJ59O2bGJqzz3TBsCrxPrbpm1Moe/w
ib3e51UsgZ/2EtcVgI/c
=fWEg
-----END PGP SIGNATURE-----

--mFHiwr52TKrxpkjc--
