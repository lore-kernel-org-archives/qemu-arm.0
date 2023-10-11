Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp514670ejr;
        Tue, 10 Oct 2023 17:55:59 -0700 (PDT)
X-Received: by 2002:a05:6102:3a6b:b0:452:6834:b8f6 with SMTP id bf11-20020a0561023a6b00b004526834b8f6mr8279314vsb.3.1696985759079;
        Tue, 10 Oct 2023 17:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696985759; cv=none;
        d=google.com; s=arc-20160816;
        b=zIF9nt94NXa+h1AUv2vBbbJvmne8CfLp4+8kaldYzYZ0U6I8YD9+/XGrZHwi7P3NlC
         jAtRaQVqc89+X8XEIwsncoKACGcmBuxs5173zheMpdjjoYjfAa5oJhOjVaikfaKgQvSs
         qGNKPr5jU0BS88AlRnJBUfE/mntt0GNRIG/eWUi6BSHynvYf71VttkM7WCRnuVJa/6S1
         inUQqy3Z4uUPZyBpQYB+zD1I5agiyC5L3QsPEbqCM6/4l2IQNjA7SMfdmeuUaNGHKcsG
         3kEqenvswq8dw7GWZHfrvtpdqzsYQiwoxmeBN7PgdEPsptR2Wm0FomErCNy323mWLvfm
         5+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MHGrLjRkhYiLrdRBRmqfm98vUBuT0XXmW8P1q1p4PRg=;
        fh=cqk238ux3/GdOijP7fp8WGbp8VqG0EAAdwsLvgVM+lA=;
        b=Pt9G24Gt8CuCf1EsCDlYkXi0tteMjBiwcskSSIV4V3UK1c5aweQp+caGXUZs8fiMSC
         oSLc/sHtHXPxaif0F1LnJj5d88400sdlTTh7qGc9KGYolQ85+DPEVGePA0IVZfEh2WaN
         mPfwa5N5Q83OU44oQk45nFPhxO3fpfThZRrBD+K2IAgWUNNfBpdl/0Q9uiss6bjRlh+x
         kVtymzp/x/sOHjaYU7+HABsNai8J94uu8MJdbXIZv74gGC+6Jj0e3T2rmOWLOvg/lJjf
         l1JZkd3ePU5f41BmznyIUTM8VahLAJHblujNLzfYhKhVaqOSUZ05y36yIdeQVg16ngfW
         diLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RuXuefG0;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 91-20020a9f2064000000b0078f24e2deaesor6079271uam.0.2023.10.10.17.55.58
        (Google Transport Security);
        Tue, 10 Oct 2023 17:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RuXuefG0;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696985758; x=1697590558; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHGrLjRkhYiLrdRBRmqfm98vUBuT0XXmW8P1q1p4PRg=;
        b=RuXuefG0CsDsnNR0JkIYXp4/eAjWM0dE4EK2XxdqfvAhQDS2gKf/lB06ro49BXywy7
         WBduQmFO26WEEmqSAAIwBR5CaL+9jMhOUKq6r9g0EShfOY/FbrImlaZbsUwfwLSkCSO0
         OcbAXT7cT4Ek7jrB3MDBr4TVYCcHgLBeAwB9KFdEbBVi9ySpc/UwBhN5XAKzQbXZ2Cj0
         A9tAFu58dlU/6+MeQdtzUiwn6vGpA5ONl052ADft3YTzvcpNlgmMnh1jW+2hqgNYx/hf
         yKeVIT+muz6isFB7Y54jGyq+X95JRNKOOG7py75EanExQiTyAw0/MCH9rNNTGAMfKOEy
         IO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696985758; x=1697590558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHGrLjRkhYiLrdRBRmqfm98vUBuT0XXmW8P1q1p4PRg=;
        b=sP7cqbSE4KtVC/zhlfVJxJY+3wPW2m9OsjfGy+JR1Z3vowQVduKo+RG5ATr9xM7Moe
         gv5pgPObw26ToMzJcifx9p6pm/ZjUmR+l6jxeiTeUWyUPaibKXe2AoDyMdpezhtNXzHb
         tTEbLChU7s7OdJaYiQvc5T4RhdJ1JXbVivNPYpsb8k7heexWdQHXg0lZllFhhjNWQs2b
         D41JDLJcCqaLwfW55hHBDvjwBNKt4SewrnYHGm10B4IaeZpEnk8X/K8L20jHEJXll9gv
         kD5595LvDbGYRqFIjT/0htlA4j1jxjyI82gOBfY6vrbc2xdzDgpfntrhmnD+mYs9zYD+
         3A1A==
X-Gm-Message-State: AOJu0YypwDhumvWLjHMUBRhSygu/OgTe59lrcykosLJl0UE6D95EVKeE
	vDMFn77qPNqgUTjogG7E4fqgk1xY9AqBLxOvnl2jDm9m5it5SA==
X-Google-Smtp-Source: AGHT+IHBzNjhlzia7qZzZCgNYbRewp3Gi3H7+b/6N6QZgbVnveVKuAdMAGjdIhOd9DKwJjp/TZlHo8ToQ6DmXCIZAbU=
X-Received: by 2002:a05:6102:41a2:b0:452:7341:a098 with SMTP id
 cd34-20020a05610241a200b004527341a098mr10527796vsb.0.1696985757794; Tue, 10
 Oct 2023 17:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20231009164104.369749-1-alex.bennee@linaro.org> <20231009164104.369749-15-alex.bennee@linaro.org>
In-Reply-To: <20231009164104.369749-15-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 11 Oct 2023 10:55:31 +1000
Message-ID: <CAKmqyKN1BSbHdhXhHQcywp0a-A3L1qdD46yBX_s0dAQDeFxbig@mail.gmail.com>
Subject: Re: [PATCH 14/25] hw/core/cpu: Return static value with gdb_arch_name()
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
	Xiaojuan Yang <yangxiaojuan@loongson.cn>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Brad Smith <brad@comstyle.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Bin Meng <bin.meng@windriver.com>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org, 
	John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-arm@nongnu.org, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>, 
	Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Beraldo Leal <bleal@redhat.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Song Gao <gaosong@loongson.cn>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: hjIE0AI4NmE4

On Tue, Oct 10, 2023 at 2:44=E2=80=AFAM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:
>
> From: Akihiko Odaki <akihiko.odaki@daynix.com>
>
> All implementations of gdb_arch_name() returns dynamic duplicates of
> static strings. It's also unlikely that there will be an implementation
> of gdb_arch_name() that returns a truly dynamic value due to the nature
> of the function returning a well-known identifiers. Qualify the value
> gdb_arch_name() with const and make all of its implementations return
> static strings.
>
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20230912224107.29669-8-akihiko.odaki@daynix.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/core/cpu.h  | 2 +-
>  target/ppc/internal.h  | 2 +-
>  gdbstub/gdbstub.c      | 3 +--
>  target/arm/cpu.c       | 6 +++---
>  target/arm/cpu64.c     | 4 ++--
>  target/i386/cpu.c      | 6 +++---
>  target/loongarch/cpu.c | 8 ++++----
>  target/ppc/gdbstub.c   | 6 +++---
>  target/riscv/cpu.c     | 6 +++---
>  target/s390x/cpu.c     | 4 ++--
>  target/tricore/cpu.c   | 4 ++--
>  11 files changed, 25 insertions(+), 26 deletions(-)
>
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index e02bc5980f..7b8347ed5a 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -165,7 +165,7 @@ struct CPUClass {
>      vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>
>      const char *gdb_core_xml_file;
> -    gchar * (*gdb_arch_name)(CPUState *cpu);
> +    const gchar * (*gdb_arch_name)(CPUState *cpu);
>      const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlna=
me);
>
>      void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
> diff --git a/target/ppc/internal.h b/target/ppc/internal.h
> index 15803bc313..c881c67a8b 100644
> --- a/target/ppc/internal.h
> +++ b/target/ppc/internal.h
> @@ -221,7 +221,7 @@ void destroy_ppc_opcodes(PowerPCCPU *cpu);
>
>  /* gdbstub.c */
>  void ppc_gdb_init(CPUState *cs, PowerPCCPUClass *ppc);
> -gchar *ppc_gdb_arch_name(CPUState *cs);
> +const gchar *ppc_gdb_arch_name(CPUState *cs);
>
>  /**
>   * prot_for_access_type:
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index bba2640293..a20169c27b 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -380,10 +380,9 @@ static const char *get_feature_xml(const char *p, co=
nst char **newp,
>                              "<target>");
>
>              if (cc->gdb_arch_name) {
> -                g_autofree gchar *arch =3D cc->gdb_arch_name(cpu);
>                  g_string_append_printf(xml,
>                                         "<architecture>%s</architecture>"=
,
> -                                       arch);
> +                                       cc->gdb_arch_name(cpu));
>              }
>              g_string_append(xml, "<xi:include href=3D\"");
>              g_string_append(xml, cc->gdb_core_xml_file);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b65e8cfea3..6c6c551573 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2319,15 +2319,15 @@ static Property arm_cpu_properties[] =3D {
>      DEFINE_PROP_END_OF_LIST()
>  };
>
> -static gchar *arm_gdb_arch_name(CPUState *cs)
> +static const gchar *arm_gdb_arch_name(CPUState *cs)
>  {
>      ARMCPU *cpu =3D ARM_CPU(cs);
>      CPUARMState *env =3D &cpu->env;
>
>      if (arm_feature(env, ARM_FEATURE_IWMMXT)) {
> -        return g_strdup("iwmmxt");
> +        return "iwmmxt";
>      }
> -    return g_strdup("arm");
> +    return "arm";
>  }
>
>  #ifndef CONFIG_USER_ONLY
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 811f3b38c2..1cb9d5b81a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -781,9 +781,9 @@ static void aarch64_cpu_finalizefn(Object *obj)
>  {
>  }
>
> -static gchar *aarch64_gdb_arch_name(CPUState *cs)
> +static const gchar *aarch64_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("aarch64");
> +    return "aarch64";
>  }
>
>  static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 9fad31b8db..c09bab4281 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -5915,12 +5915,12 @@ static void x86_cpu_load_model(X86CPU *cpu, X86CP=
UModel *model)
>      memset(&env->user_features, 0, sizeof(env->user_features));
>  }
>
> -static gchar *x86_gdb_arch_name(CPUState *cs)
> +static const gchar *x86_gdb_arch_name(CPUState *cs)
>  {
>  #ifdef TARGET_X86_64
> -    return g_strdup("i386:x86-64");
> +    return "i386:x86-64";
>  #else
> -    return g_strdup("i386");
> +    return "i386";
>  #endif
>  }
>
> diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
> index 2bea7ca5d5..ef1bf89dac 100644
> --- a/target/loongarch/cpu.c
> +++ b/target/loongarch/cpu.c
> @@ -766,9 +766,9 @@ static void loongarch_cpu_class_init(ObjectClass *c, =
void *data)
>  #endif
>  }
>
> -static gchar *loongarch32_gdb_arch_name(CPUState *cs)
> +static const gchar *loongarch32_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("loongarch32");
> +    return "loongarch32";
>  }
>
>  static void loongarch32_cpu_class_init(ObjectClass *c, void *data)
> @@ -780,9 +780,9 @@ static void loongarch32_cpu_class_init(ObjectClass *c=
, void *data)
>      cc->gdb_arch_name =3D loongarch32_gdb_arch_name;
>  }
>
> -static gchar *loongarch64_gdb_arch_name(CPUState *cs)
> +static const gchar *loongarch64_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("loongarch64");
> +    return "loongarch64";
>  }
>
>  static void loongarch64_cpu_class_init(ObjectClass *c, void *data)
> diff --git a/target/ppc/gdbstub.c b/target/ppc/gdbstub.c
> index 2ad11510bf..778ef73bd7 100644
> --- a/target/ppc/gdbstub.c
> +++ b/target/ppc/gdbstub.c
> @@ -589,12 +589,12 @@ static int gdb_set_vsx_reg(CPUPPCState *env, uint8_=
t *mem_buf, int n)
>      return 0;
>  }
>
> -gchar *ppc_gdb_arch_name(CPUState *cs)
> +const gchar *ppc_gdb_arch_name(CPUState *cs)
>  {
>  #if defined(TARGET_PPC64)
> -    return g_strdup("powerpc:common64");
> +    return "powerpc:common64";
>  #else
> -    return g_strdup("powerpc:common");
> +    return "powerpc:common";
>  #endif
>  }
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index ac2b94b6a6..f5572704de 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -2004,17 +2004,17 @@ static Property riscv_cpu_properties[] =3D {
>      DEFINE_PROP_END_OF_LIST(),
>  };
>
> -static gchar *riscv_gdb_arch_name(CPUState *cs)
> +static const gchar *riscv_gdb_arch_name(CPUState *cs)
>  {
>      RISCVCPU *cpu =3D RISCV_CPU(cs);
>      CPURISCVState *env =3D &cpu->env;
>
>      switch (riscv_cpu_mxl(env)) {
>      case MXL_RV32:
> -        return g_strdup("riscv:rv32");
> +        return "riscv:rv32";
>      case MXL_RV64:
>      case MXL_RV128:
> -        return g_strdup("riscv:rv64");
> +        return "riscv:rv64";
>      default:
>          g_assert_not_reached();
>      }
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index 4f7599d72c..6093ab0a12 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -282,9 +282,9 @@ static void s390_cpu_initfn(Object *obj)
>  #endif
>  }
>
> -static gchar *s390_gdb_arch_name(CPUState *cs)
> +static const gchar *s390_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("s390:64-bit");
> +    return "s390:64-bit";
>  }
>
>  static Property s390x_cpu_properties[] =3D {
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index d1477622e6..5ca666ee12 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -29,9 +29,9 @@ static inline void set_feature(CPUTriCoreState *env, in=
t feature)
>      env->features |=3D 1ULL << feature;
>  }
>
> -static gchar *tricore_gdb_arch_name(CPUState *cs)
> +static const gchar *tricore_gdb_arch_name(CPUState *cs)
>  {
> -    return g_strdup("tricore");
> +    return "tricore";
>  }
>
>  static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
> --
> 2.39.2
>
>
