Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id d3sm29506651wrf.87.2019.06.17.04.36.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 04:36:02 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 127361FF87;
	Mon, 17 Jun 2019 12:36:02 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-2-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v2 01/23] target/arm: Makefile cleanup (Aarch64)
In-reply-to: <20190615154352.26824-2-philmd@redhat.com>
Date: Mon, 17 Jun 2019 12:36:02 +0100
Message-ID: <87d0jcbg0t.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: jAp2M0A84+5d


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Group Aarch64 objects together, TCG related ones at the bottom.
> This will help when restricting TCG-only objects.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  target/arm/Makefile.objs | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index dfa736a375..7c31fa01c1 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -7,8 +7,7 @@ obj-$(call lnot,$(CONFIG_KVM)) +=3D kvm-stub.o
>  obj-y +=3D translate.o op_helper.o helper.o cpu.o
>  obj-y +=3D neon_helper.o iwmmxt_helper.o vec_helper.o vfp_helper.o
>  obj-y +=3D gdbstub.o
> -obj-$(TARGET_AARCH64) +=3D cpu64.o translate-a64.o helper-a64.o gdbstub6=
4.o
> -obj-$(TARGET_AARCH64) +=3D pauth_helper.o
> +obj-$(TARGET_AARCH64) +=3D cpu64.o gdbstub64.o
>  obj-y +=3D crypto_helper.o
>  obj-$(CONFIG_SOFTMMU) +=3D arm-powerctl.o
>
> @@ -33,4 +32,6 @@ target/arm/translate-sve.o: target/arm/decode-sve.inc.c
>  target/arm/translate.o: target/arm/decode-vfp.inc.c
>  target/arm/translate.o: target/arm/decode-vfp-uncond.inc.c
>
> +obj-$(TARGET_AARCH64) +=3D translate-a64.o helper-a64.o
>  obj-$(TARGET_AARCH64) +=3D translate-sve.o sve_helper.o
> +obj-$(TARGET_AARCH64) +=3D pauth_helper.o


--
Alex Benn=C3=A9e
