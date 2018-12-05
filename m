Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9917881wrt;
        Wed, 5 Dec 2018 14:40:56 -0800 (PST)
X-Google-Smtp-Source: AFSGD/W7pnV2BgYVFZe5OFC0HEGLYymH0Xh0xOiUm80lNtTXSpK3oBZHZ/qnziXcBpYXvokZCwD7
X-Received: by 2002:aed:2844:: with SMTP id r62mr25686653qtd.112.1544049656002;
        Wed, 05 Dec 2018 14:40:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544049655; cv=none;
        d=google.com; s=arc-20160816;
        b=qaVzPStWlJDgF8ilmUdLaXtGz/TJSQHvA0baxT7AT1P6FURGVYrOzLJHhziEXBkNYh
         cUFCbBQSU1hGB457JsmPRBccWFstVzfR8EnLvXnH0EWfcr41NI+fcfllqz26IIP244m5
         58JWpG+kwsne4ggmePg2X8Z/hqbFgnsBx5wQ5X7z4JhdSDf7rFukLtclRwHPF2Vv6vYW
         sY2xualKQQ6ppcR/YqaXeKeRMMyQZLfJPUqQmqsRM8CKQzknK7vBpKuufsw9zz/gDHgy
         hzQmvRK7YYlqpJJjGSYkmLHJMdIfsEh0+ZyvSGyL67vLhjZeyTw6KPvcS8ISH/g8i9s8
         fXKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=KCjde3zmO5zUxR1wMGS6pvB4umNhw6zGFgj7L6gjNmY=;
        b=pFPyMXMYZ4wix2IF7CWo9j5YZxzzdmV58ls3a+P7MZaJQLlMtByosC8bRXY4pTPT+H
         B80RuYhQ09d4ROS4S7Kmg63stQfTy2/QI5dt6FB6jqiY8GKMZ8/70p7KCOltFM7kCfUv
         mh3OA8PsJDnRXzPbRQ+yp5f+MDNYvrBVkO8c1RhzxDkGJh0jG3zwNeXqCXzWG6jlcFOE
         8BRum4cdZPh3H2OJlWKuk86NjgXYB22+sKcbGKf9UKsDqlATSTAtCsdWr0sJ1d1a5ViW
         P7eyZTmUIVNckPivdSx91Lb9ss9ZLzERy1418bfftpAxs7ZzxK9sDhiVaGf8KDMfS04V
         H9ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=pwUfqJvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 99si4389499qta.389.2018.12.05.14.40.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 14:40:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gibson.dropbear.id.au header.s=201602 header.b=pwUfqJvF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUfqh-00017A-Dg
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 17:40:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gUfoi-0007u8-Gv
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 17:38:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1gUfof-00052J-FI
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 17:38:52 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:33175)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgibson@ozlabs.org>)
	id 1gUfoe-0004Ar-9w; Wed, 05 Dec 2018 17:38:49 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 439DCz754Mz9sB7; Thu,  6 Dec 2018 09:38:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1544049520;
	bh=ooDHyuF7h7wNWfGA9OEH5A52g3LuakynHJGnngs+zzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwUfqJvFGpsmY8kl4izVS8SnpE61Wo3IV8REngH7kvZQhh5zRZ9oo/CDxJ0DRmN4p
	TNqJgMMnqH+/e3quT9vtBh7qx1iUyN0M1C/FMKKQMLhL/FEslowP2xBfF0hx1ivLmf
	5TmCeOqiMpXPP8IO2cshEeOR5CeBA26jF8Rl12EI=
Date: Thu, 6 Dec 2018 09:30:35 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20181205223035.GH768@umbus.fritz.box>
References: <20181205205827.19387-1-ehabkost@redhat.com>
	<20181205205827.19387-5-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="17/8oYur5Y32USnW"
Content-Disposition: inline
In-Reply-To: <20181205205827.19387-5-ehabkost@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2401:3900:2:1::2
Subject: Re: [Qemu-arm] [PATCH for-4.0 4/5] spapr: Delete instance_options
 functions
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
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2d4oz5op/BH4


--17/8oYur5Y32USnW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 05, 2018 at 06:58:26PM -0200, Eduardo Habkost wrote:
> Now that all instance_options functions for spapr are empty,
> delete them.
>=20
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Acked-by: David Gibson <david@gibson.dropbear.id.au>

Do you want me to stage the ppc patches in my ppc-for-4.0 tree, or
would you prefer to keep your series together to go in via your tree?

> ---
>  hw/ppc/spapr.c | 85 --------------------------------------------------
>  1 file changed, 85 deletions(-)
>=20
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 0c3b27a8cc..523e5d83f8 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3939,16 +3939,10 @@ static const TypeInfo spapr_machine_info =3D {
>              mc->is_default =3D 1;                                      \
>          }                                                            \
>      }                                                                \
> -    static void spapr_machine_##suffix##_instance_init(Object *obj)  \
> -    {                                                                \
> -        MachineState *machine =3D MACHINE(obj);                        \
> -        spapr_machine_##suffix##_instance_options(machine);          \
> -    }                                                                \
>      static const TypeInfo spapr_machine_##suffix##_info =3D {          \
>          .name =3D MACHINE_TYPE_NAME("pseries-" verstr),                \
>          .parent =3D TYPE_SPAPR_MACHINE,                                \
>          .class_init =3D spapr_machine_##suffix##_class_init,           \
> -        .instance_init =3D spapr_machine_##suffix##_instance_init,     \
>      };                                                               \
>      static void spapr_machine_register_##suffix(void)                \
>      {                                                                \
> @@ -3959,10 +3953,6 @@ static const TypeInfo spapr_machine_info =3D {
>  /*
>   * pseries-4.0
>   */
> -static void spapr_machine_4_0_instance_options(MachineState *machine)
> -{
> -}
> -
>  static void spapr_machine_4_0_class_options(MachineClass *mc)
>  {
>      /* Defaults for the latest behaviour inherited from the base class */
> @@ -3976,11 +3966,6 @@ DEFINE_SPAPR_MACHINE(4_0, "4.0", true);
>  #define SPAPR_COMPAT_3_1                                              \
>      HW_COMPAT_3_1
> =20
> -static void spapr_machine_3_1_instance_options(MachineState *machine)
> -{
> -    spapr_machine_4_0_instance_options(machine);
> -}
> -
>  static void spapr_machine_3_1_class_options(MachineClass *mc)
>  {
>      spapr_machine_3_1_class_options(mc);
> @@ -3995,11 +3980,6 @@ DEFINE_SPAPR_MACHINE(3_1, "3.1", false);
>  #define SPAPR_COMPAT_3_0                                              \
>      HW_COMPAT_3_0
> =20
> -static void spapr_machine_3_0_instance_options(MachineState *machine)
> -{
> -    spapr_machine_3_1_instance_options(machine);
> -}
> -
>  static void spapr_machine_3_0_class_options(MachineClass *mc)
>  {
>      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> @@ -4029,11 +4009,6 @@ DEFINE_SPAPR_MACHINE(3_0, "3.0", false);
>          .value    =3D "on",                                             =
 \
>      },
> =20
> -static void spapr_machine_2_12_instance_options(MachineState *machine)
> -{
> -    spapr_machine_3_0_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_12_class_options(MachineClass *mc)
>  {
>      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> @@ -4051,11 +4026,6 @@ static void spapr_machine_2_12_class_options(Machi=
neClass *mc)
> =20
>  DEFINE_SPAPR_MACHINE(2_12, "2.12", false);
> =20
> -static void spapr_machine_2_12_sxxm_instance_options(MachineState *machi=
ne)
> -{
> -    spapr_machine_2_12_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_12_sxxm_class_options(MachineClass *mc)
>  {
>      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> @@ -4074,11 +4044,6 @@ DEFINE_SPAPR_MACHINE(2_12_sxxm, "2.12-sxxm", false=
);
>  #define SPAPR_COMPAT_2_11                                              \
>      HW_COMPAT_2_11
> =20
> -static void spapr_machine_2_11_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_12_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_11_class_options(MachineClass *mc)
>  {
>      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> @@ -4096,11 +4061,6 @@ DEFINE_SPAPR_MACHINE(2_11, "2.11", false);
>  #define SPAPR_COMPAT_2_10                                              \
>      HW_COMPAT_2_10
> =20
> -static void spapr_machine_2_10_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_11_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_10_class_options(MachineClass *mc)
>  {
>      spapr_machine_2_11_class_options(mc);
> @@ -4120,11 +4080,6 @@ DEFINE_SPAPR_MACHINE(2_10, "2.10", false);
>          .value    =3D "on",                                             =
 \
>      },                                                                 \
> =20
> -static void spapr_machine_2_9_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_10_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_9_class_options(MachineClass *mc)
>  {
>      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> @@ -4149,11 +4104,6 @@ DEFINE_SPAPR_MACHINE(2_9, "2.9", false);
>          .value    =3D "off",                                      \
>      },
> =20
> -static void spapr_machine_2_8_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_9_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_8_class_options(MachineClass *mc)
>  {
>      spapr_machine_2_9_class_options(mc);
> @@ -4238,11 +4188,6 @@ static void phb_placement_2_7(sPAPRMachineState *s=
papr, uint32_t index,
>       */
>  }
> =20
> -static void spapr_machine_2_7_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_8_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_7_class_options(MachineClass *mc)
>  {
>      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> @@ -4267,11 +4212,6 @@ DEFINE_SPAPR_MACHINE(2_7, "2.7", false);
>          .value    =3D stringify(off),\
>      },
> =20
> -static void spapr_machine_2_6_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_7_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_6_class_options(MachineClass *mc)
>  {
>      spapr_machine_2_7_class_options(mc);
> @@ -4292,11 +4232,6 @@ DEFINE_SPAPR_MACHINE(2_6, "2.6", false);
>          .value    =3D "off", \
>      },
> =20
> -static void spapr_machine_2_5_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_6_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_5_class_options(MachineClass *mc)
>  {
>      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> @@ -4314,11 +4249,6 @@ DEFINE_SPAPR_MACHINE(2_5, "2.5", false);
>  #define SPAPR_COMPAT_2_4 \
>          HW_COMPAT_2_4
> =20
> -static void spapr_machine_2_4_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_5_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_4_class_options(MachineClass *mc)
>  {
>      sPAPRMachineClass *smc =3D SPAPR_MACHINE_CLASS(mc);
> @@ -4341,11 +4271,6 @@ DEFINE_SPAPR_MACHINE(2_4, "2.4", false);
>              .value    =3D "off",\
>          },
> =20
> -static void spapr_machine_2_3_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_4_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_3_class_options(MachineClass *mc)
>  {
>      spapr_machine_2_4_class_options(mc);
> @@ -4365,11 +4290,6 @@ DEFINE_SPAPR_MACHINE(2_3, "2.3", false);
>              .value    =3D "0x20000000",\
>          },
> =20
> -static void spapr_machine_2_2_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_3_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_2_class_options(MachineClass *mc)
>  {
>      spapr_machine_2_3_class_options(mc);
> @@ -4384,11 +4304,6 @@ DEFINE_SPAPR_MACHINE(2_2, "2.2", false);
>  #define SPAPR_COMPAT_2_1 \
>          HW_COMPAT_2_1
> =20
> -static void spapr_machine_2_1_instance_options(MachineState *machine)
> -{
> -    spapr_machine_2_2_instance_options(machine);
> -}
> -
>  static void spapr_machine_2_1_class_options(MachineClass *mc)
>  {
>      spapr_machine_2_2_class_options(mc);

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--17/8oYur5Y32USnW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAlwIUYsACgkQbDjKyiDZ
s5Lwxw/9F8phlhWC8sDy/QqFDlu3G2LYn9yLXKAA6k8nuBq9THTKLeXWg8q5bje/
Ej1VAmn8pbbyaWF7dSd/WXdEkCu6tGv6xh7YvCZYQA38LjbVzUhhczAW19t7AKxS
mZS3niYLFh98ZUr7tjIj41zAGMHGWmmEOw1N61jahS52HqaJ7iuwpK6wk6G2lifE
lPgrJFUYjF74459eXQ8lcUI5k9wdZSBJ6mxXNbffL/HTBjH8mDvMz+cctNJw/EYp
Q2h87hDSue0xPoUkLnQlwfeBpbO7ro4t3GYF2thXazuWaVnxYcnS+yxxBwS6ojwT
YBY+mr+rKRgkfbl67dtK5CV9vFuZCPLg+Yi5BJNM/yMp1/oPoSfPebO7KGvoNJVn
I1GGgZIEshxe6kU8N7VstscbqrfoubDf5RMbBa+MP19CZuD77jCvz62hXTZeAsSM
gG4OMB+U7lanCMHP+7iAhNWjn31ZITjZYboHYu2LBRxmkbsFn+Bg0ljs6I6mAGgK
Qnqklb8/8Sjxgmf7ggmObBpaZQA1cuDekP0i7RfAsLImsgPQeumZOAQr4a3g4lvI
p2WTXi34MEw1Syr0y8nUBb++mXrUHFp4OKugnv6AwzWqtaNtR7clMQWRfK1NwwG5
72C1BB25KU+G+aFJq+9F5EzHMOJemAF42SO1ONKjFkJKQLTKSEY=
=sAV/
-----END PGP SIGNATURE-----

--17/8oYur5Y32USnW--
