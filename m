Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id x9sm4685633wmf.27.2019.05.15.23.54.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 23:54:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C8C7D1FF87;
	Thu, 16 May 2019 07:54:48 +0100 (BST)
References: <78cf484c4d991e899d0065b2dab3a2e204ce8723.1557879499.git.alistair.francis@wdc.com>
User-agent: mu4e 1.3.1; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: "qemu-devel\@nongnu.org" <qemu-devel@nongnu.org>, "peter.maydell\@linaro.org" <peter.maydell@linaro.org>, Alistair Francis <Alistair.Francis@wdc.com>, "richard.henderson\@linaro.org" <richard.henderson@linaro.org>, "alistair23\@gmail.com" <alistair23@gmail.com>
Subject: Re: [Qemu-arm] [PATCH v2 1/1] target/arm: Fix vector operation segfault
In-reply-to: <78cf484c4d991e899d0065b2dab3a2e204ce8723.1557879499.git.alistair.francis@wdc.com>
Date: Thu, 16 May 2019 07:54:48 +0100
Message-ID: <875zqanb2f.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 0n5JRBzAtPcu


Alistair Francis <Alistair.Francis@wdc.com> writes:

> Commit 89e68b575 "target/arm: Use vector operations for saturation"
> causes this abort() when booting QEMU ARM with a Cortex-A15:
>
> 0  0x00007ffff4c2382f in raise () at /usr/lib/libc.so.6
> 1  0x00007ffff4c0e672 in abort () at /usr/lib/libc.so.6
> 2  0x00005555559c1839 in disas_neon_data_insn (insn=3D<optimized out>, s=
=3D<optimized out>) at ./target/arm/translate.c:6673
> 3  0x00005555559c1839 in disas_neon_data_insn (s=3D<optimized out>, insn=
=3D<optimized out>) at ./target/arm/translate.c:6386
> 4  0x00005555559cd8a4 in disas_arm_insn (insn=3D4081107068, s=3D0x7fffe59=
a9510) at ./target/arm/translate.c:9289
> 5  0x00005555559cd8a4 in arm_tr_translate_insn (dcbase=3D0x7fffe59a9510, =
cpu=3D<optimized out>) at ./target/arm/translate.c:13612
> 6  0x00005555558d1d39 in translator_loop (ops=3D0x5555561cc580 <arm_trans=
lator_ops>, db=3D0x7fffe59a9510, cpu=3D0x55555686a2f0, tb=3D<optimized out>=
, max_insns=3D<optimized out>) at ./accel/tcg/translator.c:96
> 7  0x00005555559d10d4 in gen_intermediate_code (cpu=3Dcpu@entry=3D0x55555=
686a2f0, tb=3Dtb@entry=3D0x7fffd7840080 <code_gen_buffer+126091347>, max_in=
sns=3Dmax_insns@entry=3D512) at ./target/arm/translate.c:13901
> 8  0x00005555558d06b9 in tb_gen_code (cpu=3Dcpu@entry=3D0x55555686a2f0, p=
c=3D3067096216, cs_base=3D0, flags=3D192, cflags=3D-16252928, cflags@entry=
=3D524288) at ./accel/tcg/translate-all.c:1736
> 9  0x00005555558ce467 in tb_find (cf_mask=3D524288, tb_exit=3D1, last_tb=
=3D0x7fffd783e640 <code_gen_buffer+126084627>, cpu=3D0x1) at ./accel/tcg/cp=
u-exec.c:407
> 10 0x00005555558ce467 in cpu_exec (cpu=3Dcpu@entry=3D0x55555686a2f0) at .=
/accel/tcg/cpu-exec.c:728
> 11 0x000055555588b0cf in tcg_cpu_exec (cpu=3D0x55555686a2f0) at ./cpus.c:=
1431
> 12 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=3D0x55555686a2f0) at=
 ./cpus.c:1735
> 13 0x000055555588d223 in qemu_tcg_cpu_thread_fn (arg=3Darg@entry=3D0x5555=
5686a2f0) at ./cpus.c:1709
> 14 0x0000555555d2629a in qemu_thread_start (args=3D<optimized out>) at ./=
util/qemu-thread-posix.c:502
> 15 0x00007ffff4db8a92 in start_thread () at /usr/lib/libpthread.
>
> This patch ensures that we don't hit the abort() in the second switch
> case in disas_neon_data_insn() as we will return from the first case.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

This fixes the abort()'s I was seeing while running the qemu-iotests
under an emulated Debian Buster armhf system so:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index dd053c80d6..298c262825 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -6598,13 +6598,13 @@ static int disas_neon_data_insn(DisasContext *s, =
uint32_t insn)
>              tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
>                             rn_ofs, rm_ofs, vec_size, vec_size,
>                             (u ? uqadd_op : sqadd_op) + size);
> -            break;
> +            return 0;
>
>          case NEON_3R_VQSUB:
>              tcg_gen_gvec_4(rd_ofs, offsetof(CPUARMState, vfp.qc),
>                             rn_ofs, rm_ofs, vec_size, vec_size,
>                             (u ? uqsub_op : sqsub_op) + size);
> -            break;
> +            return 0;
>
>          case NEON_3R_VMUL: /* VMUL */
>              if (u) {


--
Alex Benn=C3=A9e
