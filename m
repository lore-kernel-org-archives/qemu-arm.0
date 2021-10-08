Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 189sm12527747wmz.27.2021.10.08.02.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 02:39:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 92B1B1FF96;
	Fri,  8 Oct 2021 10:39:50 +0100 (BST)
References: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Cc: rad@semihalf.com, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Subject: Re: [PATCH] hw/arm/sbsa-ref: Fixed cpu type error message typo.
Date: Fri, 08 Oct 2021 10:39:34 +0100
In-reply-to: <20211008063604.670699-1-ishii.shuuichir@fujitsu.com>
Message-ID: <87tuhrdfdl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 9ZJYT6jMSqGB


Shuuichirou Ishii <ishii.shuuichir@fujitsu.com> writes:

> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  hw/arm/sbsa-ref.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> index 509c5f09b4..358714bd3e 100644
> --- a/hw/arm/sbsa-ref.c
> +++ b/hw/arm/sbsa-ref.c
> @@ -670,7 +670,7 @@ static void sbsa_ref_init(MachineState *machine)
>      int n, sbsa_max_cpus;
>=20=20
>      if (!cpu_type_valid(machine->cpu_type)) {
> -        error_report("mach-virt: CPU type %s not supported", machine->cp=
u_type);
> +        error_report("sbsa-ref: CPU type %s not supported", machine->cpu=
_type);
>          exit(1);
>      }

copy and paste detected ;-)

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
