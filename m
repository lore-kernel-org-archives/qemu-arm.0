Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp255440lfb;
        Wed, 1 Sep 2021 01:10:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyu6B9hrZiGIT+dis1Yga1ESKiTJwfvTxLTuOM+ZJZkVS/6ro6/JPf1Yzm6e91QynB9C5nJ
X-Received: by 2002:a17:906:7714:: with SMTP id q20mr35809033ejm.551.1630483844759;
        Wed, 01 Sep 2021 01:10:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630483844; cv=none;
        d=google.com; s=arc-20160816;
        b=OCZK3B2v0VpKl9SPXsraQX8G9Q5GG3BMOM4tLj4b3BUzc4jM84bs5NcvAg5J46gC0V
         ctM73+HBqi9B1KPeIayVHQF7rOJOWO/qDbDKPQcywHh2vmDY/u9fw9e6vac60HY17PdR
         36Qsc4fLsQzGZGiA6xFMg2LZ/rcq5B87kVXHV+zR6wdsVo0XM7B/nnoIUB33/LLVe/Pd
         eWL+6/ouYCqyNobkRv7bCdEcvwWyRLnqLIwZXSzC1RslndCbbZt8pu7y8QOFk5pj/XJE
         yyLiewIZ92NS2JpeDf46UoCzyS7uEtY/ON1QNVBPjvpa+oNqPUCV4h5KRRl3Dwwrllhw
         kjIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=HEVYSTzwY+0i7TXQV9GcmoL8K8+YVrOhQKy8VdbNeDk=;
        b=EwyPGD3USXQ+FFSOd32X5U/pu5w8zXVqhE5428wj+NRfXSx9Ydk1bFTR0/D0UbCKvp
         mOrz+ibmxpWUV8SRILbjqyzLs93f/s1JDFO1W101rKUb2bvFTXg3T4VLOfrPqdWR18+W
         aYn41Cz8XEuUWwjzthRdd6xZ4S9KLvkIZZxC8PuVQvSRS3/8pgfnIxI7m8gwBSdVw8Pb
         SqsmMtxzgeO5s57cUrehTa56Zn0A5z44wNiM3dqlyU5S2uRRvnsmqhTjYOmYAKmCSt1h
         pW+nzx/ZbJzPn6V1+cTA/v11BcAkvE9hEJrA5naJvDxpTuwFtnX1l2yhRmcEAMIMKz3A
         5tAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=softfail (google.com: domain of transitioning groug@kaod.org does not designate 207.211.30.44 as permitted sender) smtp.mailfrom=groug@kaod.org
Return-Path: <groug@kaod.org>
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com. [207.211.30.44])
        by mx.google.com with ESMTPS id x26si10780261eds.428.2021.09.01.01.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Sep 2021 01:10:44 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning groug@kaod.org does not designate 207.211.30.44 as permitted sender) client-ip=207.211.30.44;
Authentication-Results: mx.google.com;
       spf=softfail (google.com: domain of transitioning groug@kaod.org does not designate 207.211.30.44 as permitted sender) smtp.mailfrom=groug@kaod.org
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-2CxmGhtjN3GZb0HIyP5_Kw-1; Wed, 01 Sep 2021 04:10:40 -0400
X-MC-Unique: 2CxmGhtjN3GZb0HIyP5_Kw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1626180198A;
	Wed,  1 Sep 2021 08:10:37 +0000 (UTC)
Received: from bahia.lan (unknown [10.39.193.7])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FAAD77718;
	Wed,  1 Sep 2021 08:10:02 +0000 (UTC)
Date: Wed, 1 Sep 2021 10:10:01 +0200
From: Greg Kurz <groug@kaod.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Laurent
 Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Thomas Huth <thuth@redhat.com>, Eduardo
 Habkost <ehabkost@redhat.com>, qemu-riscv@nongnu.org, David Gibson
 <david@gibson.dropbear.id.au>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Stafford Horne <shorne@gmail.com>, Huacai
 Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Bin Meng <bin.meng@windriver.com>, Mahmoud
 Mandour <ma.mandourr@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-arm@nongnu.org, Alex =?UTF-8?B?QmVu?=
 =?UTF-8?B?bsOpZQ==?= <alex.bennee@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-s390x@nongnu.org, Christian Borntraeger
 <borntraeger@de.ibm.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, David
 Hildenbrand <david@redhat.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@redhat.com>
Subject: Re: [PATCH 15/29] tcg_funcs: Add tb_flush to TCGModuleOps
Message-ID: <20210901101001.6df09519@bahia.lan>
In-Reply-To: <20210831121545.2874233-16-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
	<20210831121545.2874233-16-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-TUID: WfbhpmHtMPZV

On Tue, 31 Aug 2021 14:15:31 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/exec/exec-all.h   | 1 -
>  include/tcg/tcg-module.h  | 1 +
>  accel/stubs/tcg-stub.c    | 4 ----
>  accel/tcg/tcg-module.c    | 1 +
>  accel/tcg/translate-all.c | 9 ++++++++-
>  cpu.c                     | 2 +-
>  gdbstub.c                 | 4 ++--
>  hw/ppc/spapr_hcall.c      | 2 +-

For ppc :

Acked-by: Greg Kurz <groug@kaod.org>

>  linux-user/mmap.c         | 2 +-
>  linux-user/syscall.c      | 4 ++--
>  plugins/core.c            | 2 +-
>  plugins/loader.c          | 2 +-
>  target/alpha/sys_helper.c | 2 +-
>  target/riscv/csr.c        | 2 +-
>  14 files changed, 21 insertions(+), 17 deletions(-)
>=20
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 27fc489c57b5..7dc6f498a7e4 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -572,7 +572,6 @@ void tb_invalidate_phys_range(target_ulong start, tar=
get_ulong end);
>  #else
>  void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs a=
ttrs);
>  #endif
> -void tb_flush(CPUState *cpu);
>  void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
>  TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
>                                     target_ulong cs_base, uint32_t flags,
> diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
> index 5dd4deb9ed57..003581b0718c 100644
> --- a/include/tcg/tcg-module.h
> +++ b/include/tcg/tcg-module.h
> @@ -13,6 +13,7 @@ struct TCGModuleOps {
>  #endif
>      void (*tcg_exec_unrealizefn)(CPUState *cpu);
>      void (*tcg_exec_realizefn)(CPUState *cpu, Error **errp);
> +    void (*tb_flush)(CPUState *cpu);
>  };
>  extern struct TCGModuleOps tcg;
> =20
> diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
> index d8162673ae8d..e7651d035f28 100644
> --- a/accel/stubs/tcg-stub.c
> +++ b/accel/stubs/tcg-stub.c
> @@ -13,10 +13,6 @@
>  #include "qemu/osdep.h"
>  #include "exec/exec-all.h"
> =20
> -void tb_flush(CPUState *cpu)
> -{
> -}
> -
>  void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
>  {
>  }
> diff --git a/accel/tcg/tcg-module.c b/accel/tcg/tcg-module.c
> index 36c1df564f31..7600951fd20b 100644
> --- a/accel/tcg/tcg-module.c
> +++ b/accel/tcg/tcg-module.c
> @@ -34,4 +34,5 @@ struct TCGModuleOps tcg =3D {
>  #endif
>      .tcg_exec_realizefn =3D tcg_exec_realizefn_stub,
>      .tcg_exec_unrealizefn =3D update_cpu_stub,
> +    .tb_flush =3D update_cpu_stub,
>  };
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index c7547cd923b4..1d258e89fc81 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -1003,7 +1003,7 @@ done:
>      }
>  }
> =20
> -void tb_flush(CPUState *cpu)
> +static void tb_flush(CPUState *cpu)
>  {
>      if (tcg_enabled()) {
>          unsigned tb_flush_count =3D qatomic_mb_read(&tb_ctx.tb_flush_cou=
nt);
> @@ -2463,3 +2463,10 @@ int page_unprotect(target_ulong address, uintptr_t=
 pc)
>      return 0;
>  }
>  #endif /* CONFIG_USER_ONLY */
> +
> +static void tcg_module_ops_tb(void)
> +{
> +    tcg.tb_flush =3D tb_flush;
> +}
> +
> +type_init(tcg_module_ops_tb);
> diff --git a/cpu.c b/cpu.c
> index d1c9f68a26e7..ce96b3591a9c 100644
> --- a/cpu.c
> +++ b/cpu.c
> @@ -58,7 +58,7 @@ static int cpu_common_post_load(void *opaque, int versi=
on_id)
>       * memory we've translated code from. So we must flush all TBs,
>       * which will now be stale.
>       */
> -    tb_flush(cpu);
> +    tcg.tb_flush(cpu);
> =20
>      return 0;
>  }
> diff --git a/gdbstub.c b/gdbstub.c
> index 5d8e6ae3cd9b..c2c6901b77b6 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2796,7 +2796,7 @@ static void gdb_vm_state_change(void *opaque, bool =
running, RunState state)
>          } else {
>              trace_gdbstub_hit_break();
>          }
> -        tb_flush(cpu);
> +        tcg.tb_flush(cpu);
>          ret =3D GDB_SIGNAL_TRAP;
>          break;
>      case RUN_STATE_PAUSED:
> @@ -3135,7 +3135,7 @@ gdb_handlesig(CPUState *cpu, int sig)
> =20
>      /* disable single step if it was enabled */
>      cpu_single_step(cpu, 0);
> -    tb_flush(cpu);
> +    tcg.tb_flush(cpu);
> =20
>      if (sig !=3D 0) {
>          snprintf(buf, sizeof(buf), "S%02x", target_signal_to_gdb(sig));
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 0e9a5b2e4053..732e79cca0ad 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -292,7 +292,7 @@ static target_ulong h_page_init(PowerPCCPU *cpu, Spap=
rMachineState *spapr,
>          if (kvm_enabled()) {
>              kvmppc_icbi_range(cpu, pdst, len);
>          } else {
> -            tb_flush(CPU(cpu));
> +            tcg.tb_flush(CPU(cpu));
>          }
>      }
> =20
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 0e103859fed8..85cb03e176c1 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -461,7 +461,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, =
int target_prot,
>          CPUState *cpu =3D thread_cpu;
>          if (!(cpu->tcg_cflags & CF_PARALLEL)) {
>              cpu->tcg_cflags |=3D CF_PARALLEL;
> -            tb_flush(cpu);
> +            tcg.tb_flush(cpu);
>          }
>      }
> =20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index ccd3892b2df7..6ab3009bc98b 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -4513,7 +4513,7 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_=
env,
>       */
>      if (!(cpu->tcg_cflags & CF_PARALLEL)) {
>          cpu->tcg_cflags |=3D CF_PARALLEL;
> -        tb_flush(cpu);
> +        tcg.tb_flush(cpu);
>      }
> =20
>      if (shmaddr)
> @@ -6376,7 +6376,7 @@ static int do_fork(CPUArchState *env, unsigned int =
flags, abi_ulong newsp,
>           */
>          if (!(cpu->tcg_cflags & CF_PARALLEL)) {
>              cpu->tcg_cflags |=3D CF_PARALLEL;
> -            tb_flush(cpu);
> +            tcg.tb_flush(cpu);
>          }
> =20
>          /* we create a new CPU instance. */
> diff --git a/plugins/core.c b/plugins/core.c
> index 6b2490f97328..ee3ad26b354c 100644
> --- a/plugins/core.c
> +++ b/plugins/core.c
> @@ -514,7 +514,7 @@ void qemu_plugin_user_exit(void)
>          }
>      }
> =20
> -    tb_flush(current_cpu);
> +    tcg.tb_flush(current_cpu);
> =20
>      CPU_FOREACH(cpu) {
>          qemu_plugin_disable_mem_helpers(cpu);
> diff --git a/plugins/loader.c b/plugins/loader.c
> index 71b03721dffc..21e94a7509dc 100644
> --- a/plugins/loader.c
> +++ b/plugins/loader.c
> @@ -364,7 +364,7 @@ static void plugin_flush_destroy(CPUState *cpu, run_o=
n_cpu_data arg)
>      struct qemu_plugin_reset_data *data =3D arg.host_ptr;
> =20
>      g_assert(cpu_in_exclusive_context(cpu));
> -    tb_flush(cpu);
> +    tcg.tb_flush(cpu);
>      plugin_reset_destroy(data);
>  }
> =20
> diff --git a/target/alpha/sys_helper.c b/target/alpha/sys_helper.c
> index 25f6cb88940d..bad37d35e342 100644
> --- a/target/alpha/sys_helper.c
> +++ b/target/alpha/sys_helper.c
> @@ -55,7 +55,7 @@ void helper_tbis(CPUAlphaState *env, uint64_t p)
> =20
>  void helper_tb_flush(CPUAlphaState *env)
>  {
> -    tb_flush(env_cpu(env));
> +    tcg.tb_flush(env_cpu(env));
>  }
> =20
>  void helper_halt(uint64_t restart)
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 9a4ed18ac597..46603475e57b 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -610,7 +610,7 @@ static RISCVException write_misa(CPURISCVState *env, =
int csrno,
> =20
>      /* flush translation cache */
>      if (val !=3D env->misa) {
> -        tb_flush(env_cpu(env));
> +        tcg.tb_flush(env_cpu(env));
>      }
> =20
>      env->misa =3D val;
