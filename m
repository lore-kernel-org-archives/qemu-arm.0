Received: by 10.25.208.211 with SMTP id h202csp693257lfg;
        Thu, 7 Apr 2016 13:01:02 -0700 (PDT)
X-Received: by 10.194.143.51 with SMTP id sb19mr5755226wjb.98.1460059262021;
        Thu, 07 Apr 2016 13:01:02 -0700 (PDT)
Return-Path: <mttcg-owner@listserver.greensocs.com>
Received: from greensocs.com (greensocs.com. [193.104.36.180])
        by mx.google.com with ESMTP id m15si10046449wjq.178.2016.04.07.13.01.01;
        Thu, 07 Apr 2016 13:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) client-ip=193.104.36.180;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of mttcg-owner@listserver.greensocs.com designates 193.104.36.180 as permitted sender) smtp.mailfrom=mttcg-owner@listserver.greensocs.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 55EE924A99E;
	Thu,  7 Apr 2016 22:00:58 +0200 (CEST)
Authentication-Results: greensocs.com;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gi6ixoUk
X-Virus-Scanned: amavisd-new at greensocs.com
X-Spam-Flag: NO
X-Spam-Score: -1.798
X-Spam-Level:
X-Spam-Status: No, score=-1.798 tagged_above=-999 required=6.2
	tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
	DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.199,
	FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
	HK_RANDOM_ENVFROM=0.001] autolearn=no autolearn_force=no
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (2048-bit key) header.d=gmail.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7fqGKtGNWG2v; Thu,  7 Apr 2016 22:00:57 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 123)
	id 9BEE424BCA7; Thu,  7 Apr 2016 22:00:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id BA99024BCA7
	for <mttcg@listserver.greensocs.com>; Thu,  7 Apr 2016 21:55:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at greensocs.com
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UpabUXVRrQw2 for <mttcg@listserver.greensocs.com>;
	Thu,  7 Apr 2016 21:55:30 +0200 (CEST)
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by greensocs.com (Postfix) with ESMTPS id 97CAE24A99C
	for <mttcg@greensocs.com>; Thu,  7 Apr 2016 21:55:29 +0200 (CEST)
Received: by mail-wm0-f68.google.com with SMTP id l6so6926824wml.3
        for <mttcg@greensocs.com>; Thu, 07 Apr 2016 12:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NNPnSTWfHTcBY3e6zj16l1R6FR4p8waDgRYiqnxWZFw=;
        b=Gi6ixoUkxTJpl9yjGI/6XeQwV9aJpIPyrmEHJe8rCPyDSleqV7yZmFJv1wmHejan0c
         WQhvWcEe9chsEZOuC2uZXLnv/v8neCXjrCE9gOwmrOwccaICZREUA1QpgBjKBKr6FS2O
         UvXFT4lI/NTfpDk6nYJmoppZaYf4mNee6l39NQ2FJGGOus5om39iQavFADoxlLn4dz2d
         CIvA5GLfRYjF2Ty5zrlXQRiId8N/t7DEA69FFfI1aRAM1tzrslQTXrjZjPlsfT1X6Onh
         EVtqyjggGIT7sdzAbOdGywiTzvj7SsC4Lr34skLbv2mFqQL5lzuNKg3xAnDHywmNwfV0
         WSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NNPnSTWfHTcBY3e6zj16l1R6FR4p8waDgRYiqnxWZFw=;
        b=bHTRMy9ibtewTRVVUa25se12xIvTIi+1MD0F0Db60Li2EC1NkAvWL+BB7B+SEx8PXm
         nOwqn34lrbJM9kXDQKNpgvM7TgoephejWiVtrfil1psXYb9+64SZ2EdXr7PZ02qOP/+n
         BUtomV1SmxC55W762TLrCqj7tqr7F+6TzESsaoYoRlFz8dc8cWZ4slOKEs/QCfLoXtO2
         tDtM5dksu69XA7QTkr4nh8WoJWT/vq2mv0tbxU0ALFw0TlRpKo45sO09PIxw3LbpmgPA
         LN17HSpKMyP78K8vT/+fRaSaNj1jcK/WultZnvc5+1q8PEYjrI+s+UPIPsEG0d73fPsO
         nZwQ==
X-Gm-Message-State: AD7BkJJ1XaONxF/sglZsz0CwIrgut4hC8/V2gSDPpeuCBd/p/20QjRExKrUSmrKqtiHezg==
X-Received: by 10.28.65.7 with SMTP id o7mr6277696wma.0.1460058928578;
        Thu, 07 Apr 2016 12:55:28 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id t4sm10436199wmf.8.2016.04.07.12.55.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Apr 2016 12:55:27 -0700 (PDT)
Date: Thu, 7 Apr 2016 21:55:26 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: "Emilio G. Cota" <cota@braap.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Michael Walle <michael@walle.cc>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Leon Alrae <leon.alrae@imgtec.com>,
	Anthony Green <green@moxielogic.com>, Jia Liu <proljc@gmail.com>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Max Filippov <jcmvbkbc@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Laurent Desnogues <laurent.desnogues@gmail.com>,
	MTTCG Devel <mttcg@greensocs.com>
Subject: Re: [PATCH] tb: consistently use uint32_t for tb->flags
Message-ID: <20160407195526.GR16305@toto>
References: <1460049562-23517-1-git-send-email-cota@braap.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1460049562-23517-1-git-send-email-cota@braap.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Validation-by: mark.burton@greensocs.com
Reply-To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
X-Loop: mttcg@listserver.greensocs.com
X-Sequence: 134
Errors-to: mttcg-owner@listserver.greensocs.com
Precedence: list
Precedence: bulk
Sender: mttcg-request@listserver.greensocs.com
X-no-archive: yes
List-Id: <mttcg.listserver.greensocs.com>
List-Help: <mailto:sympa@listserver.greensocs.com?subject=help>
List-Subscribe: <mailto:sympa@listserver.greensocs.com?subject=subscribe%20mttcg>
List-Unsubscribe: <mailto:sympa@listserver.greensocs.com?subject=unsubscribe%20mttcg>
List-Post: <mailto:mttcg@listserver.greensocs.com>
List-Owner: <mailto:mttcg-request@listserver.greensocs.com>
List-Archive: <http://listserver.greensocs.com/wws/arc/mttcg>
X-TUID: gxOTslZiYup2

On Thu, Apr 07, 2016 at 01:19:22PM -0400, Emilio G. Cota wrote:
> We are inconsistent with the type of tb->flags: usage varies loosely
> between int and uint64_t. Settle to uint32_t everywhere, which is
> superior to both: at least one target (aarch64) uses the most significant
> bit in the u32, and uint64_t is wasteful.
> 
> Compile-tested for all targets.

Looks good. I ran tests on CRIS, MicroBlaze and a few mixed ARM and PPC images I've got.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Suggested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Suggested-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  cpu-exec.c              |  6 +++---
>  exec.c                  |  2 +-
>  hw/i386/kvmvapic.c      |  2 +-
>  include/exec/exec-all.h |  5 +++--
>  target-alpha/cpu.h      |  2 +-
>  target-arm/cpu.h        |  2 +-
>  target-cris/cpu.h       |  2 +-
>  target-i386/cpu.h       |  2 +-
>  target-i386/translate.c |  2 +-
>  target-lm32/cpu.h       |  2 +-
>  target-m68k/cpu.h       |  2 +-
>  target-microblaze/cpu.h |  2 +-
>  target-mips/cpu.h       |  2 +-
>  target-moxie/cpu.h      |  2 +-
>  target-openrisc/cpu.h   |  2 +-
>  target-ppc/cpu.h        |  2 +-
>  target-s390x/cpu.h      |  2 +-
>  target-sh4/cpu.h        |  2 +-
>  target-sparc/cpu.h      |  2 +-
>  target-tilegx/cpu.h     |  2 +-
>  target-tricore/cpu.h    |  2 +-
>  target-unicore32/cpu.h  |  2 +-
>  target-xtensa/cpu.h     |  2 +-
>  translate-all.c         | 10 +++++-----
>  24 files changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/cpu-exec.c b/cpu-exec.c
> index bbfcbfb..debc65c 100644
> --- a/cpu-exec.c
> +++ b/cpu-exec.c
> @@ -220,7 +220,7 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
>  static TranslationBlock *tb_find_physical(CPUState *cpu,
>                                            target_ulong pc,
>                                            target_ulong cs_base,
> -                                          uint64_t flags)
> +                                          uint32_t flags)
>  {
>      CPUArchState *env = (CPUArchState *)cpu->env_ptr;
>      TranslationBlock *tb, **ptb1;
> @@ -271,7 +271,7 @@ static TranslationBlock *tb_find_physical(CPUState *cpu,
>  static TranslationBlock *tb_find_slow(CPUState *cpu,
>                                        target_ulong pc,
>                                        target_ulong cs_base,
> -                                      uint64_t flags)
> +                                      uint32_t flags)
>  {
>      TranslationBlock *tb;
>  
> @@ -314,7 +314,7 @@ static inline TranslationBlock *tb_find_fast(CPUState *cpu)
>      CPUArchState *env = (CPUArchState *)cpu->env_ptr;
>      TranslationBlock *tb;
>      target_ulong cs_base, pc;
> -    int flags;
> +    uint32_t flags;
>  
>      /* we record a subset of the CPU state. It will
>         always be the same before a given translated block
> diff --git a/exec.c b/exec.c
> index f46e596..bf3ab36 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -2083,7 +2083,7 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
>      target_ulong pc, cs_base;
>      target_ulong vaddr;
>      CPUWatchpoint *wp;
> -    int cpu_flags;
> +    uint32_t cpu_flags;
>  
>      if (cpu->watchpoint_hit) {
>          /* We re-entered the check after replacing the TB. Now raise
> diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
> index c69f374..4bb695d 100644
> --- a/hw/i386/kvmvapic.c
> +++ b/hw/i386/kvmvapic.c
> @@ -397,7 +397,7 @@ static void patch_instruction(VAPICROMState *s, X86CPU *cpu, target_ulong ip)
>      uint32_t imm32;
>      target_ulong current_pc = 0;
>      target_ulong current_cs_base = 0;
> -    int current_flags = 0;
> +    uint32_t current_flags = 0;
>  
>      if (smp_cpus == 1) {
>          handlers = &s->rom_state.up;
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 7362095..c75fb3a 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -76,7 +76,8 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc);
>  void QEMU_NORETURN cpu_resume_from_signal(CPUState *cpu, void *puc);
>  void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
>  TranslationBlock *tb_gen_code(CPUState *cpu,
> -                              target_ulong pc, target_ulong cs_base, int flags,
> +                              target_ulong pc, target_ulong cs_base,
> +                              uint32_t flags,
>                                int cflags);
>  void cpu_exec_init(CPUState *cpu, Error **errp);
>  void QEMU_NORETURN cpu_loop_exit(CPUState *cpu);
> @@ -235,7 +236,7 @@ static inline void tlb_flush_by_mmuidx(CPUState *cpu, ...)
>  struct TranslationBlock {
>      target_ulong pc;   /* simulated PC corresponding to this block (EIP + CS base) */
>      target_ulong cs_base; /* CS base for this block */
> -    uint64_t flags; /* flags defining in which context the code was generated */
> +    uint32_t flags; /* flags defining in which context the code was generated */
>      uint16_t size;      /* size of target code for this block (1 <=
>                             size <= TARGET_PAGE_SIZE) */
>      uint16_t icount;
> diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
> index 420f2a5..b25d7d0 100644
> --- a/target-alpha/cpu.h
> +++ b/target-alpha/cpu.h
> @@ -465,7 +465,7 @@ enum {
>  };
>  
>  static inline void cpu_get_tb_cpu_state(CPUAlphaState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *pflags)
> +                                        target_ulong *cs_base, uint32_t *pflags)
>  {
>      int flags = 0;
>  
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index 066ff67..9deef86 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -2117,7 +2117,7 @@ static inline bool arm_cpu_bswap_data(CPUARMState *env)
>  #endif
>  
>  static inline void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      if (is_a64(env)) {
>          *pc = env->pc;
> diff --git a/target-cris/cpu.h b/target-cris/cpu.h
> index 415cf91..a492fc6 100644
> --- a/target-cris/cpu.h
> +++ b/target-cris/cpu.h
> @@ -249,7 +249,7 @@ int cris_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
>  #include "exec/cpu-all.h"
>  
>  static inline void cpu_get_tb_cpu_state(CPUCRISState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->pc;
>      *cs_base = 0;
> diff --git a/target-i386/cpu.h b/target-i386/cpu.h
> index 732eb6d..444fda9 100644
> --- a/target-i386/cpu.h
> +++ b/target-i386/cpu.h
> @@ -1269,7 +1269,7 @@ void tcg_x86_init(void);
>  #include "exec/exec-all.h"
>  
>  static inline void cpu_get_tb_cpu_state(CPUX86State *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *cs_base = env->segs[R_CS].base;
>      *pc = *cs_base + env->eip;
> diff --git a/target-i386/translate.c b/target-i386/translate.c
> index 1a1214d..3a32f65 100644
> --- a/target-i386/translate.c
> +++ b/target-i386/translate.c
> @@ -8178,7 +8178,7 @@ void gen_intermediate_code(CPUX86State *env, TranslationBlock *tb)
>      CPUState *cs = CPU(cpu);
>      DisasContext dc1, *dc = &dc1;
>      target_ulong pc_ptr;
> -    uint64_t flags;
> +    uint32_t flags;
>      target_ulong pc_start;
>      target_ulong cs_base;
>      int num_insns;
> diff --git a/target-lm32/cpu.h b/target-lm32/cpu.h
> index f220fc0..6a0d297 100644
> --- a/target-lm32/cpu.h
> +++ b/target-lm32/cpu.h
> @@ -226,7 +226,7 @@ int lm32_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
>  #include "exec/cpu-all.h"
>  
>  static inline void cpu_get_tb_cpu_state(CPULM32State *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->pc;
>      *cs_base = 0;
> diff --git a/target-m68k/cpu.h b/target-m68k/cpu.h
> index 48b4c87..d2f467c 100644
> --- a/target-m68k/cpu.h
> +++ b/target-m68k/cpu.h
> @@ -230,7 +230,7 @@ int m68k_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
>  #include "exec/cpu-all.h"
>  
>  static inline void cpu_get_tb_cpu_state(CPUM68KState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->pc;
>      *cs_base = 0;
> diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
> index 2f7335e..bf74e2c 100644
> --- a/target-microblaze/cpu.h
> +++ b/target-microblaze/cpu.h
> @@ -322,7 +322,7 @@ int mb_cpu_handle_mmu_fault(CPUState *cpu, vaddr address, int rw,
>  #include "exec/cpu-all.h"
>  
>  static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->sregs[SR_PC];
>      *cs_base = 0;
> diff --git a/target-mips/cpu.h b/target-mips/cpu.h
> index 866924d..53e8262 100644
> --- a/target-mips/cpu.h
> +++ b/target-mips/cpu.h
> @@ -839,7 +839,7 @@ static inline void restore_pamask(CPUMIPSState *env)
>  }
>  
>  static inline void cpu_get_tb_cpu_state(CPUMIPSState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->active_tc.PC;
>      *cs_base = 0;
> diff --git a/target-moxie/cpu.h b/target-moxie/cpu.h
> index 4ee2077..1b46e52 100644
> --- a/target-moxie/cpu.h
> +++ b/target-moxie/cpu.h
> @@ -132,7 +132,7 @@ static inline int cpu_mmu_index(CPUMoxieState *env, bool ifetch)
>  #include "exec/exec-all.h"
>  
>  static inline void cpu_get_tb_cpu_state(CPUMoxieState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->pc;
>      *cs_base = 0;
> diff --git a/target-openrisc/cpu.h b/target-openrisc/cpu.h
> index 4b63f25..ed818af 100644
> --- a/target-openrisc/cpu.h
> +++ b/target-openrisc/cpu.h
> @@ -392,7 +392,7 @@ int cpu_openrisc_get_phys_data(OpenRISCCPU *cpu,
>  
>  static inline void cpu_get_tb_cpu_state(CPUOpenRISCState *env,
>                                          target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->pc;
>      *cs_base = 0;
> diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
> index 676081e..8269085 100644
> --- a/target-ppc/cpu.h
> +++ b/target-ppc/cpu.h
> @@ -2293,7 +2293,7 @@ static inline void cpu_write_xer(CPUPPCState *env, target_ulong xer)
>  }
>  
>  static inline void cpu_get_tb_cpu_state(CPUPPCState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->nip;
>      *cs_base = 0;
> diff --git a/target-s390x/cpu.h b/target-s390x/cpu.h
> index 6d97c08..07f76ad 100644
> --- a/target-s390x/cpu.h
> +++ b/target-s390x/cpu.h
> @@ -338,7 +338,7 @@ static inline uint64_t cpu_mmu_idx_to_asc(int mmu_idx)
>  }
>  
>  static inline void cpu_get_tb_cpu_state(CPUS390XState* env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->psw.addr;
>      *cs_base = 0;
> diff --git a/target-sh4/cpu.h b/target-sh4/cpu.h
> index 3b23e96..10c0191 100644
> --- a/target-sh4/cpu.h
> +++ b/target-sh4/cpu.h
> @@ -347,7 +347,7 @@ static inline void cpu_write_sr(CPUSH4State *env, target_ulong sr)
>  }
>  
>  static inline void cpu_get_tb_cpu_state(CPUSH4State *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->pc;
>      *cs_base = 0;
> diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
> index dc46122..59ec7ca 100644
> --- a/target-sparc/cpu.h
> +++ b/target-sparc/cpu.h
> @@ -688,7 +688,7 @@ trap_state* cpu_tsptr(CPUSPARCState* env);
>  #define TB_FLAG_AM_ENABLED (1 << 5)
>  
>  static inline void cpu_get_tb_cpu_state(CPUSPARCState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->pc;
>      *cs_base = env->npc;
> diff --git a/target-tilegx/cpu.h b/target-tilegx/cpu.h
> index 022cad1..c9dda12 100644
> --- a/target-tilegx/cpu.h
> +++ b/target-tilegx/cpu.h
> @@ -169,7 +169,7 @@ TileGXCPU *cpu_tilegx_init(const char *cpu_model);
>  #define cpu_signal_handler cpu_tilegx_signal_handler
>  
>  static inline void cpu_get_tb_cpu_state(CPUTLGState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->pc;
>      *cs_base = 0;
> diff --git a/target-tricore/cpu.h b/target-tricore/cpu.h
> index 90045a9..eaebdd2 100644
> --- a/target-tricore/cpu.h
> +++ b/target-tricore/cpu.h
> @@ -377,7 +377,7 @@ void tricore_tcg_init(void);
>  int cpu_tricore_signal_handler(int host_signum, void *pinfo, void *puc);
>  
>  static inline void cpu_get_tb_cpu_state(CPUTriCoreState *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->PC;
>      *cs_base = 0;
> diff --git a/target-unicore32/cpu.h b/target-unicore32/cpu.h
> index 9c1fbf9..e64cb7e 100644
> --- a/target-unicore32/cpu.h
> +++ b/target-unicore32/cpu.h
> @@ -144,7 +144,7 @@ UniCore32CPU *uc32_cpu_init(const char *cpu_model);
>  #define cpu_init(cpu_model) CPU(uc32_cpu_init(cpu_model))
>  
>  static inline void cpu_get_tb_cpu_state(CPUUniCore32State *env, target_ulong *pc,
> -                                        target_ulong *cs_base, int *flags)
> +                                        target_ulong *cs_base, uint32_t *flags)
>  {
>      *pc = env->regs[31];
>      *cs_base = 0;
> diff --git a/target-xtensa/cpu.h b/target-xtensa/cpu.h
> index d0bd9da..7bfc9c8 100644
> --- a/target-xtensa/cpu.h
> +++ b/target-xtensa/cpu.h
> @@ -507,7 +507,7 @@ static inline int cpu_mmu_index(CPUXtensaState *env, bool ifetch)
>  #define XTENSA_TBFLAG_WINDOW_SHIFT 15
>  
>  static inline void cpu_get_tb_cpu_state(CPUXtensaState *env, target_ulong *pc,
> -        target_ulong *cs_base, int *flags)
> +        target_ulong *cs_base, uint32_t *flags)
>  {
>      CPUState *cs = CPU(xtensa_env_get_cpu(env));
>  
> diff --git a/translate-all.c b/translate-all.c
> index b4df1ec..3236035 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -1050,7 +1050,7 @@ static void build_page_bitmap(PageDesc *p)
>  /* Called with mmap_lock held for user mode emulation.  */
>  TranslationBlock *tb_gen_code(CPUState *cpu,
>                                target_ulong pc, target_ulong cs_base,
> -                              int flags, int cflags)
> +                              uint32_t flags, int cflags)
>  {
>      CPUArchState *env = cpu->env_ptr;
>      TranslationBlock *tb;
> @@ -1204,7 +1204,7 @@ void tb_invalidate_phys_page_range(tb_page_addr_t start, tb_page_addr_t end,
>      int current_tb_modified = 0;
>      target_ulong current_pc = 0;
>      target_ulong current_cs_base = 0;
> -    int current_flags = 0;
> +    uint32_t current_flags = 0;
>  #endif /* TARGET_HAS_PRECISE_SMC */
>  
>      p = page_find(start >> TARGET_PAGE_BITS);
> @@ -1349,7 +1349,7 @@ static void tb_invalidate_phys_page(tb_page_addr_t addr,
>      int current_tb_modified = 0;
>      target_ulong current_pc = 0;
>      target_ulong current_cs_base = 0;
> -    int current_flags = 0;
> +    uint32_t current_flags = 0;
>  #endif
>  
>      addr &= TARGET_PAGE_MASK;
> @@ -1573,7 +1573,7 @@ void tb_check_watchpoint(CPUState *cpu)
>          CPUArchState *env = cpu->env_ptr;
>          target_ulong pc, cs_base;
>          tb_page_addr_t addr;
> -        int flags;
> +        uint32_t flags;
>  
>          cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>          addr = get_page_addr_code(env, pc);
> @@ -1592,7 +1592,7 @@ void cpu_io_recompile(CPUState *cpu, uintptr_t retaddr)
>      TranslationBlock *tb;
>      uint32_t n, cflags;
>      target_ulong pc, cs_base;
> -    uint64_t flags;
> +    uint32_t flags;
>  
>      tb = tb_find_pc(retaddr);
>      if (!tb) {
> -- 
> 2.5.0
> 
