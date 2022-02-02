Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id a9sm5354185wmm.32.2022.02.02.04.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 04:20:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 663421FFB7;
	Wed,  2 Feb 2022 12:20:06 +0000 (GMT)
References: <20220202102832.lwiyc5huddau4i6a@gator>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 ricarkol@google.com
Subject: Re: arm: singlestep bug
Date: Wed, 02 Feb 2022 11:16:46 +0000
In-reply-to: <20220202102832.lwiyc5huddau4i6a@gator>
Message-ID: <87a6f9wjd5.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: L9IGs5HWB8Hh


Andrew Jones <drjones@redhat.com> writes:

> Hello TCG developers,
>
> We have new debug test cases in kvm-unit-tests thanks to Ricardo
> Koller.

Yay tests ;-)

> The singlestep test cases are failing with TCG. Enabling TCG debug outputs
> the error
>
>   TCG hflags mismatch (current:(0x000004a1,0x0000000000004000) rebuilt:(0=
x000004a3,0x0000000000004000)

This shows that:

  FIELD(TBFLAG_ANY, SS_ACTIVE, 1, 1)

should be set but wasn't cached.

> I noticed that the test passed on an older QEMU, so I bisected it and
> found commit e979972a6a17 ("target/arm: Rely on hflags correct in
> cpu_get_tb_cpu_state"), which unfortunately doesn't tell us anything
> that the above error message didn't say already (apparently we can't
> currently depend on hflags being correct wrt singlestep at this
> point).

Fortunately this is intended - the enable-debug always recalculates the
hflags (and expensive operation) and makes it pretty easy to spot where
we failed to call arm_rebuild_hflags(). You can do this with the normal
debug tools or my new favourite tool (for short programs) using the
execlog plugin.

  0, 0x40080a24, 0x52840020, "movz w0, #0x2001"
  0, 0x40080a28, 0x2a010000, "orr w0, w0, w1"
  0, 0x40080a2c, 0xd5100240, "msr mdscr_el1, x0"
  0, 0x40080a30, 0xd5033fdf, "isb "
  0, 0x40080a34, 0x350001f4, "cbnz w20, #0x40080a70"
  TCG hflags mismatch (current:(0x000004a1,0x0000000000004000) rebuilt:(0x0=
00004a3,0x0000000000004000)

This is a touch weird though because any msr write does trigger a
rebuild of the flags. See handle_sys():

    if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
        /*
         * A write to any coprocessor regiser that ends a TB
         * must rebuild the hflags for the next TB.
         */
        TCGv_i32 tcg_el =3D tcg_const_i32(s->current_el);
        gen_helper_rebuild_hflags_a64(cpu_env, tcg_el);
        tcg_temp_free_i32(tcg_el);
        /*
         * We default to ending the TB on a coprocessor register write,
         * but allow this to be suppressed by the register definition
         * (usually only necessary to work around guest bugs).
         */
        s->base.is_jmp =3D DISAS_UPDATE_EXIT;
    }

And indeed in rr I can see it working though the tail end of
helper_rebuild_flags_a64() but it seems arm_singlestep_active() returns
false at this point. This ultimately fails at
aa64_generate_debug_exceptions():

    /*
     * Same EL to same EL debug exceptions need MDSCR_KDE enabled
     * while not masking the (D)ebug bit in DAIF.
     */
    debug_el =3D arm_debug_target_el(env);

    if (cur_el =3D=3D debug_el) {
        return extract32(env->cp15.mdscr_el1, 13, 1)
            && !(env->daif & PSTATE_D);
    }

And if I look at the objdump it is indeed the instruction we never
completed:

     a34:       350001f4        cbnz    w20, a70 <ss_start+0x34>
     a38:       d50348ff        msr     daifclr, #0x8

So if I force the flag generation on manipulating daif:

--8<---------------cut here---------------start------------->8---
modified   target/arm/helper-a64.c
@@ -83,12 +83,14 @@ void HELPER(msr_i_daifset)(CPUARMState *env, uint32_t i=
mm)
 {
     daif_check(env, 0x1e, imm, GETPC());
     env->daif |=3D (imm << 6) & PSTATE_DAIF;
+    arm_rebuild_hflags(env);
 }
=20
 void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
 {
     daif_check(env, 0x1f, imm, GETPC());
     env->daif &=3D ~((imm << 6) & PSTATE_DAIF);
+    arm_rebuild_hflags(env);
 }
=20
--8<---------------cut here---------------end--------------->8---

  I now get a working test:

  env QEMU=3D$HOME/lsrc/qemu.git/builds/all.debug/qemu-system-aarch64 ./run=
_tests.sh -g debug
  PASS debug-bp (6 tests)
  PASS debug-bp-migration (7 tests)
  PASS debug-wp (8 tests)
  PASS debug-wp-migration (9 tests)
  PASS debug-sstep (1 tests)
  PASS debug-sstep-migration (1 tests)

(I was momentarily confused when debug-sstep failed, but that was I'd
forgotten to point to my build, the system 5.2 qemu is broken in this
regard).

I'll spin up a proper patch.

Side note:

  ad5fb8830150071487025b3594a7b1bf218d12d8 is the first bad commit
  commit ad5fb8830150071487025b3594a7b1bf218d12d8
  Author: Zixuan Wang <zixuanwang@google.com>
  Date:   Mon Oct 4 13:49:19 2021 -0700

breaks the running on kvm-unit-test for me, I needed to patch:

--8<---------------cut here---------------start------------->8---
modified   run_tests.sh
@@ -31,7 +31,8 @@ specify the appropriate qemu binary for ARCH-run.
 EOF
 }
=20
-RUNTIME_arch_run=3D"./$TEST_SUBDIR/run"
+RUNTIME_arch_run=3D"./$TEST_DIR/run"
+#RUNTIME_arch_run=3D"./$TEST_SUBDIR/run"
 source scripts/runtime.bash
=20
 # require enhanced getopt
--8<---------------cut here---------------end--------------->8---


--=20
Alex Benn=C3=A9e
