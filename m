Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id y191-v6sm6558085wmy.4.2018.08.08.09.09.42
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Aug 2018 09:09:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 69D813E060C;
	Wed,  8 Aug 2018 17:09:42 +0100 (BST)
References: <20180808123934.17450-1-alex.bennee@linaro.org> <20180808123934.17450-5-alex.bennee@linaro.org>
User-agent: mu4e 1.1.0; emacs 26.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH  4/4] disas: allow capstone to defer to a fallback function on failure
In-reply-to: <20180808123934.17450-5-alex.bennee@linaro.org>
Date: Wed, 08 Aug 2018 17:09:42 +0100
Message-ID: <87r2j8q1q1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: nav4ByIsJ1Ll


Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:

> We can abuse the CS_OPT_SKIPDATA by providing a call back when
> capstone can't disassemble something. The passing of the string to the
> dump function is a little clunky but works.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  disas.c             | 30 +++++++++++++++++++++++++++++-
>  include/disas/bfd.h | 11 ++++++++++-
>  target/arm/cpu.c    |  4 ++++
>  3 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/disas.c b/disas.c
> index 5325b7e6be..dfd2c251c5 100644
> --- a/disas.c
> +++ b/disas.c
> @@ -178,6 +178,20 @@ static int print_insn_od_target(bfd_vma pc, disassem=
ble_info *info)
>     to share this across calls and across host vs target disassembly.  */
>  static __thread cs_insn *cap_insn;
>
> +
> +/* Handle fall-back dissasembly. We don't print here but we do set
> + * cap_fallback_str for cap_dump_insn to used*/
> +static size_t cap_disas_fallback(const uint8_t *code, size_t code_size,
> +                                 size_t offset, void *user_data)
> +{
> +    disassemble_info *info =3D (disassemble_info *) user_data;
> +    info->cap_fallback_str =3D g_malloc0(256);
> +    size_t skip =3D info->capstone_fallback_func(code + offset,
> +                                               info->cap_fallback_str, 2=
56);
> +    return skip;
> +}
> +
> +
>  /* Initialize the Capstone library.  */
>  /* ??? It would be nice to cache this.  We would need one handle for the
>     host and one for the target.  For most targets we can reset specific
> @@ -206,6 +220,14 @@ static cs_err cap_disas_start(disassemble_info *info=
, csh *handle)
>          cs_option(*handle, CS_OPT_SYNTAX, CS_OPT_SYNTAX_ATT);
>      }
>
> +    if (info->capstone_fallback_func) {
> +        cs_opt_skipdata skipdata =3D {
> +            .callback =3D cap_disas_fallback,
> +            .user_data =3D info,

This also needs:

            .mnemonic =3D "deadbeef",

just to stop the capstone skip handling crashing. For some reason this
only showed up when I started doing Aarch64-to-Aarch64 testing.

> +        };
> +        cs_option(*handle, CS_OPT_SKIPDATA_SETUP, (size_t) &skipdata);
> +    }
> +
>      /* "Disassemble" unknown insns as ".byte W,X,Y,Z".  */
>      cs_option(*handle, CS_OPT_SKIPDATA, CS_OPT_ON);
>
> @@ -281,7 +303,13 @@ static void cap_dump_insn(disassemble_info *info, cs=
_insn *insn)
>      }
>
>      /* Print the actual instruction.  */
> -    print(info->stream, "  %-8s %s\n", insn->mnemonic, insn->op_str);
> +    if (info->cap_fallback_str) {
> +        print(info->stream, "  %s\n", info->cap_fallback_str);
> +        g_free(info->cap_fallback_str);
> +        info->cap_fallback_str =3D NULL;
> +    } else {
> +        print(info->stream, "  %-8s %s\n", insn->mnemonic, insn->op_str);
> +    }
>
>      /* Dump any remaining part of the insn on subsequent lines.  */
>      for (i =3D split; i < n; i +=3D split) {
> diff --git a/include/disas/bfd.h b/include/disas/bfd.h
> index 1f69a6e9d3..9d99bfef48 100644
> --- a/include/disas/bfd.h
> +++ b/include/disas/bfd.h
> @@ -377,6 +377,12 @@ typedef struct disassemble_info {
>    int cap_insn_unit;
>    int cap_insn_split;
>
> +  /* Fallback function to disassemble things capstone can't. */
> +  size_t (*capstone_fallback_func)
> +    (const uint8_t *insn, char *ptr, size_t n);
> +
> +  char *cap_fallback_str;
> +
>  } disassemble_info;
>
>  
> @@ -491,7 +497,10 @@ int generic_symbol_at_address(bfd_vma, struct disass=
emble_info *);
>    (INFO).bytes_per_chunk =3D 0, \
>    (INFO).display_endian =3D BFD_ENDIAN_UNKNOWN, \
>    (INFO).disassembler_options =3D NULL, \
> -  (INFO).insn_info_valid =3D 0
> +  (INFO).insn_info_valid =3D 0, \
> +  (INFO).capstone_fallback_func =3D NULL, \
> +  (INFO).cap_fallback_str =3D NULL
> +
>
>  #ifndef ATTRIBUTE_UNUSED
>  #define ATTRIBUTE_UNUSED __attribute__((unused))
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 64a8005a4b..cfefbfb0b9 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -519,6 +519,10 @@ static void arm_disas_set_info(CPUState *cpu, disass=
emble_info *info)
>          info->cap_arch =3D CS_ARCH_ARM64;
>          info->cap_insn_unit =3D 4;
>          info->cap_insn_split =3D 4;
> +
> +#if defined(TARGET_AARCH64)
> +        info->capstone_fallback_func =3D do_aarch64_fallback_disassembly;
> +#endif
>      } else {
>          int cap_mode;
>          if (env->thumb) {


--
Alex Benn=C3=A9e
