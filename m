Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f197sm16780449wme.39.2019.06.17.07.41.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 17 Jun 2019 07:41:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2C83D1FF87;
	Mon, 17 Jun 2019 15:41:13 +0100 (BST)
References: <20190615154352.26824-1-philmd@redhat.com> <20190615154352.26824-19-philmd@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, Samuel Ortiz
 <sameo@linux.intel.com>, Robert Bradford <robert.bradford@intel.com>
Subject: Re: [Qemu-arm] [PATCH v2 18/23] target/arm: Move CPU state dumping routines to helper.c
In-reply-to: <20190615154352.26824-19-philmd@redhat.com>
Date: Mon, 17 Jun 2019 15:41:13 +0100
Message-ID: <87h88o9svq.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8J6ofWF6DbST


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> From: Samuel Ortiz <sameo@linux.intel.com>
>
> They're not TCG specific and should be living the generic helper file
> instead.
>
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Reviewed-by: Robert Bradford <robert.bradford@intel.com>
> [PMD: Rebased]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  target/arm/helper.c        | 214
> +++++++++++++++++++++++++++++++++++++

Hmm so helper is a mix of non-TCG and TCG bits whereas helper-a64.c is
basically just TCG helpers. It makes me wonder if we are breaking a
convention here as helper.c is traditionally only TCG helpers.

It feels like there should be different file that is unambiguously used
for both TCG and KVM based workloads where things like the cpu dump code
can live.

>  target/arm/internals.h     |   8 ++
>  target/arm/translate-a64.c | 127 ----------------------
>  target/arm/translate.c     |  87 ---------------
>  target/arm/translate.h     |   5 -
>  5 files changed, 222 insertions(+), 219 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index a4af02c984..8c32b2bc0d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -11293,4 +11293,218 @@ void aarch64_sve_change_el(CPUARMState *env, in=
t old_el,
>          aarch64_sve_narrow_vq(env, new_len + 1);
>      }
>  }
> +
> +void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +    uint32_t psr =3D pstate_read(env);
> +    int i;
> +    int el =3D arm_current_el(env);
> +    const char *ns_status;
> +
> +    qemu_fprintf(f, " PC=3D%016" PRIx64 " ", env->pc);
> +    for (i =3D 0; i < 32; i++) {
> +        if (i =3D=3D 31) {
> +            qemu_fprintf(f, " SP=3D%016" PRIx64 "\n", env->xregs[i]);
> +        } else {
> +            qemu_fprintf(f, "X%02d=3D%016" PRIx64 "%s", i, env->xregs[i],
> +                         (i + 2) % 3 ? " " : "\n");
> +        }
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_EL3) && el !=3D 3) {
> +        ns_status =3D env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
> +    } else {
> +        ns_status =3D "";
> +    }
> +    qemu_fprintf(f, "PSTATE=3D%08x %c%c%c%c %sEL%d%c",
> +                 psr,
> +                 psr & PSTATE_N ? 'N' : '-',
> +                 psr & PSTATE_Z ? 'Z' : '-',
> +                 psr & PSTATE_C ? 'C' : '-',
> +                 psr & PSTATE_V ? 'V' : '-',
> +                 ns_status,
> +                 el,
> +                 psr & PSTATE_SP ? 'h' : 't');
> +
> +    if (cpu_isar_feature(aa64_bti, cpu)) {
> +        qemu_fprintf(f, "  BTYPE=3D%d", (psr & PSTATE_BTYPE) >> 10);
> +    }
> +    if (!(flags & CPU_DUMP_FPU)) {
> +        qemu_fprintf(f, "\n");
> +        return;
> +    }
> +    if (fp_exception_el(env, el) !=3D 0) {
> +        qemu_fprintf(f, "    FPU disabled\n");
> +        return;
> +    }
> +    qemu_fprintf(f, "     FPCR=3D%08x FPSR=3D%08x\n",
> +                 vfp_get_fpcr(env), vfp_get_fpsr(env));
> +
> +    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) =3D=
=3D 0) {
> +        int j, zcr_len =3D sve_zcr_len_for_el(env, el);
> +
> +        for (i =3D 0; i <=3D FFR_PRED_NUM; i++) {
> +            bool eol;
> +            if (i =3D=3D FFR_PRED_NUM) {
> +                qemu_fprintf(f, "FFR=3D");
> +                /* It's last, so end the line.  */
> +                eol =3D true;
> +            } else {
> +                qemu_fprintf(f, "P%02d=3D", i);
> +                switch (zcr_len) {
> +                case 0:
> +                    eol =3D i % 8 =3D=3D 7;
> +                    break;
> +                case 1:
> +                    eol =3D i % 6 =3D=3D 5;
> +                    break;
> +                case 2:
> +                case 3:
> +                    eol =3D i % 3 =3D=3D 2;
> +                    break;
> +                default:
> +                    /* More than one quadword per predicate.  */
> +                    eol =3D true;
> +                    break;
> +                }
> +            }
> +            for (j =3D zcr_len / 4; j >=3D 0; j--) {
> +                int digits;
> +                if (j * 4 + 4 <=3D zcr_len + 1) {
> +                    digits =3D 16;
> +                } else {
> +                    digits =3D (zcr_len % 4 + 1) * 4;
> +                }
> +                qemu_fprintf(f, "%0*" PRIx64 "%s", digits,
> +                             env->vfp.pregs[i].p[j],
> +                             j ? ":" : eol ? "\n" : " ");
> +            }
> +        }
> +
> +        for (i =3D 0; i < 32; i++) {
> +            if (zcr_len =3D=3D 0) {
> +                qemu_fprintf(f, "Z%02d=3D%016" PRIx64 ":%016" PRIx64 "%s=
",
> +                             i, env->vfp.zregs[i].d[1],
> +                             env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
> +            } else if (zcr_len =3D=3D 1) {
> +                qemu_fprintf(f, "Z%02d=3D%016" PRIx64 ":%016" PRIx64
> +                             ":%016" PRIx64 ":%016" PRIx64 "\n",
> +                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i=
].d[2],
> +                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d=
[0]);
> +            } else {
> +                for (j =3D zcr_len; j >=3D 0; j--) {
> +                    bool odd =3D (zcr_len - j) % 2 !=3D 0;
> +                    if (j =3D=3D zcr_len) {
> +                        qemu_fprintf(f, "Z%02d[%x-%x]=3D", i, j, j - 1);
> +                    } else if (!odd) {
> +                        if (j > 0) {
> +                            qemu_fprintf(f, "   [%x-%x]=3D", j, j - 1);
> +                        } else {
> +                            qemu_fprintf(f, "     [%x]=3D", j);
> +                        }
> +                    }
> +                    qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
> +                                 env->vfp.zregs[i].d[j * 2 + 1],
> +                                 env->vfp.zregs[i].d[j * 2],
> +                                 odd || j =3D=3D 0 ? "\n" : ":");
> +                }
> +            }
> +        }
> +    } else {
> +        for (i =3D 0; i < 32; i++) {
> +            uint64_t *q =3D aa64_vfp_qreg(env, i);
> +            qemu_fprintf(f, "Q%02d=3D%016" PRIx64 ":%016" PRIx64 "%s",
> +                         i, q[1], q[0], (i & 1 ? "\n" : " "));
> +        }
> +    }
> +}
>  #endif
> +
> +void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +{
> +    ARMCPU *cpu =3D ARM_CPU(cs);
> +    CPUARMState *env =3D &cpu->env;
> +    int i;
> +
> +    if (is_a64(env)) {
> +        aarch64_cpu_dump_state(cs, f, flags);
> +        return;
> +    }
> +
> +    for (i =3D 0; i < 16; i++) {
> +        qemu_fprintf(f, "R%02d=3D%08x", i, env->regs[i]);
> +        if ((i % 4) =3D=3D 3) {
> +            qemu_fprintf(f, "\n");
> +        } else {
> +            qemu_fprintf(f, " ");
> +        }
> +    }
> +
> +    if (arm_feature(env, ARM_FEATURE_M)) {
> +        uint32_t xpsr =3D xpsr_read(env);
> +        const char *mode;
> +        const char *ns_status =3D "";
> +
> +        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> +            ns_status =3D env->v7m.secure ? "S " : "NS ";
> +        }
> +
> +        if (xpsr & XPSR_EXCP) {
> +            mode =3D "handler";
> +        } else {
> +            if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_NPRIV_=
MASK) {
> +                mode =3D "unpriv-thread";
> +            } else {
> +                mode =3D "priv-thread";
> +            }
> +        }
> +
> +        qemu_fprintf(f, "XPSR=3D%08x %c%c%c%c %c %s%s\n",
> +                     xpsr,
> +                     xpsr & XPSR_N ? 'N' : '-',
> +                     xpsr & XPSR_Z ? 'Z' : '-',
> +                     xpsr & XPSR_C ? 'C' : '-',
> +                     xpsr & XPSR_V ? 'V' : '-',
> +                     xpsr & XPSR_T ? 'T' : 'A',
> +                     ns_status,
> +                     mode);
> +    } else {
> +        uint32_t psr =3D cpsr_read(env);
> +        const char *ns_status =3D "";
> +
> +        if (arm_feature(env, ARM_FEATURE_EL3) &&
> +            (psr & CPSR_M) !=3D ARM_CPU_MODE_MON) {
> +            ns_status =3D env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
> +        }
> +
> +        qemu_fprintf(f, "PSR=3D%08x %c%c%c%c %c %s%s%d\n",
> +                     psr,
> +                     psr & CPSR_N ? 'N' : '-',
> +                     psr & CPSR_Z ? 'Z' : '-',
> +                     psr & CPSR_C ? 'C' : '-',
> +                     psr & CPSR_V ? 'V' : '-',
> +                     psr & CPSR_T ? 'T' : 'A',
> +                     ns_status,
> +                     aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
> +    }
> +
> +    if (flags & CPU_DUMP_FPU) {
> +        int numvfpregs =3D 0;
> +        if (arm_feature(env, ARM_FEATURE_VFP)) {
> +            numvfpregs +=3D 16;
> +        }
> +        if (arm_feature(env, ARM_FEATURE_VFP3)) {
> +            numvfpregs +=3D 16;
> +        }
> +        for (i =3D 0; i < numvfpregs; i++) {
> +            uint64_t v =3D *aa32_vfp_dreg(env, i);
> +            qemu_fprintf(f, "s%02d=3D%08x s%02d=3D%08x d%02d=3D%016" PRI=
x64 "\n",
> +                         i * 2, (uint32_t)v,
> +                         i * 2 + 1, (uint32_t)(v >> 32),
> +                         i, v);
> +        }
> +        qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
> +    }
> +}
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 06e676bf62..56281d8ece 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1042,4 +1042,12 @@ bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t =
address,
>                         int *prot, bool *is_subpage,
>                         ARMMMUFaultInfo *fi, uint32_t *mregion);
>
> +#ifdef TARGET_AARCH64
> +void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags);
> +#else
> +static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int fla=
gs)
> +{
> +}
> +#endif
> +
>  #endif
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index ae739f6575..8abe1f0e4f 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -152,133 +152,6 @@ static void set_btype(DisasContext *s, int val)
>      s->btype =3D -1;
>  }
>
> -void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> -    CPUARMState *env =3D &cpu->env;
> -    uint32_t psr =3D pstate_read(env);
> -    int i;
> -    int el =3D arm_current_el(env);
> -    const char *ns_status;
> -
> -    qemu_fprintf(f, " PC=3D%016" PRIx64 " ", env->pc);
> -    for (i =3D 0; i < 32; i++) {
> -        if (i =3D=3D 31) {
> -            qemu_fprintf(f, " SP=3D%016" PRIx64 "\n", env->xregs[i]);
> -        } else {
> -            qemu_fprintf(f, "X%02d=3D%016" PRIx64 "%s", i, env->xregs[i],
> -                         (i + 2) % 3 ? " " : "\n");
> -        }
> -    }
> -
> -    if (arm_feature(env, ARM_FEATURE_EL3) && el !=3D 3) {
> -        ns_status =3D env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
> -    } else {
> -        ns_status =3D "";
> -    }
> -    qemu_fprintf(f, "PSTATE=3D%08x %c%c%c%c %sEL%d%c",
> -                 psr,
> -                 psr & PSTATE_N ? 'N' : '-',
> -                 psr & PSTATE_Z ? 'Z' : '-',
> -                 psr & PSTATE_C ? 'C' : '-',
> -                 psr & PSTATE_V ? 'V' : '-',
> -                 ns_status,
> -                 el,
> -                 psr & PSTATE_SP ? 'h' : 't');
> -
> -    if (cpu_isar_feature(aa64_bti, cpu)) {
> -        qemu_fprintf(f, "  BTYPE=3D%d", (psr & PSTATE_BTYPE) >> 10);
> -    }
> -    if (!(flags & CPU_DUMP_FPU)) {
> -        qemu_fprintf(f, "\n");
> -        return;
> -    }
> -    if (fp_exception_el(env, el) !=3D 0) {
> -        qemu_fprintf(f, "    FPU disabled\n");
> -        return;
> -    }
> -    qemu_fprintf(f, "     FPCR=3D%08x FPSR=3D%08x\n",
> -                 vfp_get_fpcr(env), vfp_get_fpsr(env));
> -
> -    if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) =3D=
=3D 0) {
> -        int j, zcr_len =3D sve_zcr_len_for_el(env, el);
> -
> -        for (i =3D 0; i <=3D FFR_PRED_NUM; i++) {
> -            bool eol;
> -            if (i =3D=3D FFR_PRED_NUM) {
> -                qemu_fprintf(f, "FFR=3D");
> -                /* It's last, so end the line.  */
> -                eol =3D true;
> -            } else {
> -                qemu_fprintf(f, "P%02d=3D", i);
> -                switch (zcr_len) {
> -                case 0:
> -                    eol =3D i % 8 =3D=3D 7;
> -                    break;
> -                case 1:
> -                    eol =3D i % 6 =3D=3D 5;
> -                    break;
> -                case 2:
> -                case 3:
> -                    eol =3D i % 3 =3D=3D 2;
> -                    break;
> -                default:
> -                    /* More than one quadword per predicate.  */
> -                    eol =3D true;
> -                    break;
> -                }
> -            }
> -            for (j =3D zcr_len / 4; j >=3D 0; j--) {
> -                int digits;
> -                if (j * 4 + 4 <=3D zcr_len + 1) {
> -                    digits =3D 16;
> -                } else {
> -                    digits =3D (zcr_len % 4 + 1) * 4;
> -                }
> -                qemu_fprintf(f, "%0*" PRIx64 "%s", digits,
> -                             env->vfp.pregs[i].p[j],
> -                             j ? ":" : eol ? "\n" : " ");
> -            }
> -        }
> -
> -        for (i =3D 0; i < 32; i++) {
> -            if (zcr_len =3D=3D 0) {
> -                qemu_fprintf(f, "Z%02d=3D%016" PRIx64 ":%016" PRIx64 "%s=
",
> -                             i, env->vfp.zregs[i].d[1],
> -                             env->vfp.zregs[i].d[0], i & 1 ? "\n" : " ");
> -            } else if (zcr_len =3D=3D 1) {
> -                qemu_fprintf(f, "Z%02d=3D%016" PRIx64 ":%016" PRIx64
> -                             ":%016" PRIx64 ":%016" PRIx64 "\n",
> -                             i, env->vfp.zregs[i].d[3], env->vfp.zregs[i=
].d[2],
> -                             env->vfp.zregs[i].d[1], env->vfp.zregs[i].d=
[0]);
> -            } else {
> -                for (j =3D zcr_len; j >=3D 0; j--) {
> -                    bool odd =3D (zcr_len - j) % 2 !=3D 0;
> -                    if (j =3D=3D zcr_len) {
> -                        qemu_fprintf(f, "Z%02d[%x-%x]=3D", i, j, j - 1);
> -                    } else if (!odd) {
> -                        if (j > 0) {
> -                            qemu_fprintf(f, "   [%x-%x]=3D", j, j - 1);
> -                        } else {
> -                            qemu_fprintf(f, "     [%x]=3D", j);
> -                        }
> -                    }
> -                    qemu_fprintf(f, "%016" PRIx64 ":%016" PRIx64 "%s",
> -                                 env->vfp.zregs[i].d[j * 2 + 1],
> -                                 env->vfp.zregs[i].d[j * 2],
> -                                 odd || j =3D=3D 0 ? "\n" : ":");
> -                }
> -            }
> -        }
> -    } else {
> -        for (i =3D 0; i < 32; i++) {
> -            uint64_t *q =3D aa64_vfp_qreg(env, i);
> -            qemu_fprintf(f, "Q%02d=3D%016" PRIx64 ":%016" PRIx64 "%s",
> -                         i, q[1], q[0], (i & 1 ? "\n" : " "));
> -        }
> -    }
> -}
> -
>  void gen_a64_set_pc_im(uint64_t val)
>  {
>      tcg_gen_movi_i64(cpu_pc, val);
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index d0ab3e27e6..1e50627690 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -12416,93 +12416,6 @@ void gen_intermediate_code(CPUState *cpu, Transl=
ationBlock *tb, int max_insns)
>      translator_loop(ops, &dc.base, cpu, tb, max_insns);
>  }
>
> -void arm_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> -{
> -    ARMCPU *cpu =3D ARM_CPU(cs);
> -    CPUARMState *env =3D &cpu->env;
> -    int i;
> -
> -    if (is_a64(env)) {
> -        aarch64_cpu_dump_state(cs, f, flags);
> -        return;
> -    }
> -
> -    for (i =3D 0; i < 16; i++) {
> -        qemu_fprintf(f, "R%02d=3D%08x", i, env->regs[i]);
> -        if ((i % 4) =3D=3D 3) {
> -            qemu_fprintf(f, "\n");
> -        } else {
> -            qemu_fprintf(f, " ");
> -        }
> -    }
> -
> -    if (arm_feature(env, ARM_FEATURE_M)) {
> -        uint32_t xpsr =3D xpsr_read(env);
> -        const char *mode;
> -        const char *ns_status =3D "";
> -
> -        if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> -            ns_status =3D env->v7m.secure ? "S " : "NS ";
> -        }
> -
> -        if (xpsr & XPSR_EXCP) {
> -            mode =3D "handler";
> -        } else {
> -            if (env->v7m.control[env->v7m.secure] & R_V7M_CONTROL_NPRIV_=
MASK) {
> -                mode =3D "unpriv-thread";
> -            } else {
> -                mode =3D "priv-thread";
> -            }
> -        }
> -
> -        qemu_fprintf(f, "XPSR=3D%08x %c%c%c%c %c %s%s\n",
> -                     xpsr,
> -                     xpsr & XPSR_N ? 'N' : '-',
> -                     xpsr & XPSR_Z ? 'Z' : '-',
> -                     xpsr & XPSR_C ? 'C' : '-',
> -                     xpsr & XPSR_V ? 'V' : '-',
> -                     xpsr & XPSR_T ? 'T' : 'A',
> -                     ns_status,
> -                     mode);
> -    } else {
> -        uint32_t psr =3D cpsr_read(env);
> -        const char *ns_status =3D "";
> -
> -        if (arm_feature(env, ARM_FEATURE_EL3) &&
> -            (psr & CPSR_M) !=3D ARM_CPU_MODE_MON) {
> -            ns_status =3D env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
> -        }
> -
> -        qemu_fprintf(f, "PSR=3D%08x %c%c%c%c %c %s%s%d\n",
> -                     psr,
> -                     psr & CPSR_N ? 'N' : '-',
> -                     psr & CPSR_Z ? 'Z' : '-',
> -                     psr & CPSR_C ? 'C' : '-',
> -                     psr & CPSR_V ? 'V' : '-',
> -                     psr & CPSR_T ? 'T' : 'A',
> -                     ns_status,
> -                     aarch32_mode_name(psr), (psr & 0x10) ? 32 : 26);
> -    }
> -
> -    if (flags & CPU_DUMP_FPU) {
> -        int numvfpregs =3D 0;
> -        if (arm_feature(env, ARM_FEATURE_VFP)) {
> -            numvfpregs +=3D 16;
> -        }
> -        if (arm_feature(env, ARM_FEATURE_VFP3)) {
> -            numvfpregs +=3D 16;
> -        }
> -        for (i =3D 0; i < numvfpregs; i++) {
> -            uint64_t v =3D *aa32_vfp_dreg(env, i);
> -            qemu_fprintf(f, "s%02d=3D%08x s%02d=3D%08x d%02d=3D%016" PRI=
x64 "\n",
> -                         i * 2, (uint32_t)v,
> -                         i * 2 + 1, (uint32_t)(v >> 32),
> -                         i, v);
> -        }
> -        qemu_fprintf(f, "FPSCR: %08x\n", vfp_get_fpscr(env));
> -    }
> -}
> -
>  void restore_state_to_opc(CPUARMState *env, TranslationBlock *tb,
>                            target_ulong *data)
>  {
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index dc06dce767..1dd3ac0a41 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -169,7 +169,6 @@ static inline void disas_set_insn_syndrome(DisasConte=
xt *s, uint32_t syn)
>  #ifdef TARGET_AARCH64
>  void a64_translate_init(void);
>  void gen_a64_set_pc_im(uint64_t val);
> -void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags);
>  extern const TranslatorOps aarch64_translator_ops;
>  #else
>  static inline void a64_translate_init(void)
> @@ -179,10 +178,6 @@ static inline void a64_translate_init(void)
>  static inline void gen_a64_set_pc_im(uint64_t val)
>  {
>  }
> -
> -static inline void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int fla=
gs)
> -{
> -}
>  #endif
>
>  void arm_test_cc(DisasCompare *cmp, int cc);


--
Alex Benn=C3=A9e
