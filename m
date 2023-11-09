Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id q23-20020a7bce97000000b004094e565e71sm1909953wmj.23.2023.11.09.04.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 04:23:15 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 291B45F756;
	Thu,  9 Nov 2023 12:23:15 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Naresh Kamboju
 <naresh.kamboju@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  qemu-stable@nongnu.org,
 Anders Roxell <anders.roxell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v2] target/arm: Fix SVE STR increment
In-Reply-To: <20231031143215.29764-1-richard.henderson@linaro.org> (Richard
	Henderson's message of "Tue, 31 Oct 2023 07:32:15 -0700 (1 week, 1
	day, 21 hours ago)")
References: <20231031143215.29764-1-richard.henderson@linaro.org>
User-Agent: mu4e 1.11.24; emacs 29.1
Date: Thu, 09 Nov 2023 12:23:15 +0000
Message-ID: <874jhv86a4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ufB+KucAuoM0

Richard Henderson <richard.henderson@linaro.org> writes:

> The previous change missed updating one of the increments and
> one of the MemOps.  Add a test case for all vector lengths.
>
> Cc: qemu-stable@nongnu.org
> Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sv=
e_{ld, st}r")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

This was Cd'd for stable but didn't make it in. There is a trivial
re-base conflict but I can re-send the patch if that helps.

With this:

   tuxrun --runtime docker \
     --qemu-binary ~/lsrc/qemu.git/builds/bisect/qemu-system-aarch64 \
     --device qemu-arm64 --boot-args rw \
     --kernel https://storage.tuxsuite.com/public/linaro/lkft/builds/2XmWuG=
CI7saydsrZw4FcWSu6JGQ/Image.gz \
     --modules https://storage.tuxsuite.com/public/linaro/lkft/builds/2XmWu=
GCI7saydsrZw4FcWSu6JGQ/modules.tar.xz \
     --rootfs https://storage.tuxboot.com/debian/bookworm/arm64/rootfs.ext4=
.xz \
     --parameters SHARD_INDEX=3D4 --parameters SKIPFILE=3Dskipfile-lkft.yam=
l \
     --parameters SHARD_NUMBER=3D4 \
     --parameters KSELFTEST=3Dhttps://storage.tuxsuite.com/public/linaro/lk=
ft/builds/2XmWuGCI7saydsrZw4FcWSu6JGQ/kselftest.tar.xz \
     --image docker.io/linaro/tuxrun-dispatcher:v0.52.0 --tests kselftest-a=
rm64 --timeouts boot=3D30 kselftest-arm64=3D60

on my branch:

  https://gitlab.com/stsquad/qemu/-/tree/for-8.1-stable?ref_type=3Dheads

the test works.

> ---
>  target/arm/tcg/translate-sve.c    |  5 ++--
>  tests/tcg/aarch64/sve-str.c       | 49 +++++++++++++++++++++++++++++++
>  tests/tcg/aarch64/Makefile.target |  6 +++-
>  3 files changed, 57 insertions(+), 3 deletions(-)
>  create mode 100644 tests/tcg/aarch64/sve-str.c
>
> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sv=
e.c
> index 7b39962f20..296e7d1ce2 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -4294,7 +4294,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, in=
t vofs,
>          t0 =3D tcg_temp_new_i64();
>          t1 =3D tcg_temp_new_i64();
>          t16 =3D tcg_temp_new_i128();
> -        for (i =3D 0; i < len_align; i +=3D 8) {
> +        for (i =3D 0; i < len_align; i +=3D 16) {
>              tcg_gen_ld_i64(t0, base, vofs + i);
>              tcg_gen_ld_i64(t1, base, vofs + i + 8);
>              tcg_gen_concat_i64_i128(t16, t0, t1);
> @@ -4320,7 +4320,8 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, in=
t vofs,
>          t16 =3D tcg_temp_new_i128();
>          tcg_gen_concat_i64_i128(t16, t0, t1);
>=20=20
> -        tcg_gen_qemu_st_i128(t16, clean_addr, midx, MO_LEUQ);
> +        tcg_gen_qemu_st_i128(t16, clean_addr, midx,
> +                             MO_LE | MO_128 | MO_ATOM_NONE);
>          tcg_gen_addi_i64(clean_addr, clean_addr, 16);
>=20=20
>          tcg_gen_brcondi_ptr(TCG_COND_LTU, i, len_align, loop);
> diff --git a/tests/tcg/aarch64/sve-str.c b/tests/tcg/aarch64/sve-str.c
> new file mode 100644
> index 0000000000..551f0d6f18
> --- /dev/null
> +++ b/tests/tcg/aarch64/sve-str.c
> @@ -0,0 +1,49 @@
> +#include <stdio.h>
> +#include <sys/prctl.h>
> +
> +#define N  (256+16)
> +
> +static int __attribute__((noinline)) test(int vl)
> +{
> +    unsigned char buf[N];
> +    int err =3D 0;
> +
> +    for (int i =3D 0; i < N; ++i) {
> +        buf[i] =3D (unsigned char)i;
> +    }
> +
> +    asm volatile (
> +        "mov z0.b, #255\n\t"
> +        "str z0, %0"
> +        : : "m" (buf) : "z0", "memory");
> +
> +    for (int i =3D 0; i < vl; ++i) {
> +        if (buf[i] !=3D 0xff) {
> +            fprintf(stderr, "vl %d, index %d, expected 255, got %d\n",
> +                    vl, i, buf[i]);
> +            err =3D 1;
> +        }
> +    }
> +
> +    for (int i =3D vl; i < N; ++i) {
> +        if (buf[i] !=3D (unsigned char)i) {
> +            fprintf(stderr, "vl %d, index %d, expected %d, got %d\n",
> +                    vl, i, (unsigned char)i, buf[i]);
> +            err =3D 1;
> +        }
> +    }
> +
> +    return err;
> +}
> +
> +int main()
> +{
> +    int err =3D 0;
> +
> +    for (int i =3D 16; i <=3D 256; i +=3D 16) {
> +        if (prctl(PR_SVE_SET_VL, i, 0, 0, 0, 0) =3D=3D i) {
> +            err |=3D test(i);
> +        }
> +    }
> +    return err;
> +}
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index 62b38c792f..c6542b5f1b 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -103,7 +103,11 @@ sha512-sve: CFLAGS=3D-O3 -march=3Darmv8.1-a+sve
>  sha512-sve: sha512.c
>  	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
>=20=20
> -TESTS +=3D sha512-sve
> +sve-str: CFLAGS=3D-O1 -march=3Darmv8.1-a+sve
> +sve-str: sve-str.c
> +	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
> +
> +TESTS +=3D sha512-sve sve-str
>=20=20
>  ifneq ($(GDB),)
>  GDB_SCRIPT=3D$(SRC_PATH)/tests/guest-debug/run-test.py

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
