Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id 16sm4094070wrt.81.2017.11.13.03.33.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Nov 2017 03:33:10 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 3C64F3E00A0;
	Mon, 13 Nov 2017 11:33:10 +0000 (GMT)
References: <20171004184325.24157-1-richard.henderson@linaro.org> <20171004184325.24157-2-richard.henderson@linaro.org>
User-agent: mu4e 1.0-alpha2; emacs 26.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: Re: [Qemu-arm] [PATCH v1 01/12] HACK: use objdump disas
In-reply-to: <20171004184325.24157-2-richard.henderson@linaro.org>
Date: Mon, 13 Nov 2017 11:33:10 +0000
Message-ID: <87ineetnux.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: xIQpQSsJzfxB


Richard Henderson <richard.henderson@linaro.org> writes:

> ---
>  disas.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/disas.c b/disas.c
> index d6a1eb9c8e..69069a85ca 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -231,7 +231,7 @@ void target_disas(FILE *out, CPUState *cpu, target_ul=
ong code,
>      s.info.disassembler_options =3D (char *)"any";
>      s.info.print_insn =3D print_insn_ppc;
>  #endif
> -    if (s.info.print_insn =3D=3D NULL) {
> +    if (1 || s.info.print_insn =3D=3D NULL) {
>          s.info.print_insn =3D print_insn_od_target;
>      }

Because? Is this being droppped now for capstone?

--
Alex Benn=C3=A9e
