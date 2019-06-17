Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id z5sm10928694wrh.16.2019.06.17.07.20.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:20:09 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id F0ADD1FF87;
	Mon, 17 Jun 2019 15:20:08 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-18-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 17/23] target/arm: Fix coding style issues
In-reply-to: <20190615154352.26824-18-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:20:08 +0100
Message-ID: <87imt49tuv.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0cLj/KXtbLCb


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Since we'll move this code around, fix its style first.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/translate.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index c274c8b460..d0ab3e27e6 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9179,7 +9179,7 @@ static void disas_arm_insn(DisasContext *s, unsigne=
d int insn)
>                  loaded_base =3D 0;
>                  loaded_var =3D NULL;
>                  n =3D 0;
> -                for(i=3D0;i<16;i++) {
> +                for (i =3D 0; i < 16; i++) {
>                      if (insn & (1 << i))
>                          n++;
>                  }
> @@ -9202,7 +9202,7 @@ static void disas_arm_insn(DisasContext *s, unsigne=
d int insn)
>                      }
>                  }
>                  j =3D 0;
> -                for(i=3D0;i<16;i++) {
> +                for (i =3D 0; i < 16; i++) {
>                      if (insn & (1 << i)) {
>                          if (is_load) {
>                              /* load */
> @@ -12427,12 +12427,13 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, =
int flags)
>          return;
>      }
>
> -    for(i=3D0;i<16;i++) {
> +    for (i =3D 0; i < 16; i++) {
>          qemu_fprintf(f, "R%02d=3D%08x", i, env->regs[i]);
> -        if ((i % 4) =3D=3D 3)
> +        if ((i % 4) =3D=3D 3) {
>              qemu_fprintf(f, "\n");
> -        else
> +        } else {
>              qemu_fprintf(f, " ");
> +        }
>      }
>
>      if (arm_feature(env, ARM_FEATURE_M)) {


--
Alex Benn=C3=A9e
