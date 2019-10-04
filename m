Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp316442wrm;
        Fri, 4 Oct 2019 04:31:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwnJELqN324MytcC2lQYB6b8DipZ5sLhsQ85nrxpTSnMMPNLoy37iZDVaZ5cfKss3y8/Apf
X-Received: by 2002:a6b:ec0c:: with SMTP id c12mr4163382ioh.138.1570188676470;
        Fri, 04 Oct 2019 04:31:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570188676; cv=none;
        d=google.com; s=arc-20160816;
        b=wryiNiavm5OEdHi3IPZFKjsfAqNJt+eox0H186b4T53Jqerr5nwO8SipkqaKE8MVP6
         A3vkAAiZHgeJP8heNdyWb5pjYcFORS0ZPmZKYSkXUkMqbJvKGYiumZVOcjemEWWjyUPT
         DEqRjU1HDLw0nXwvPy8IROL7ah1UnXXQk8q0rlYqWuWU4qT3ndYJRaGsdZK0IE5hFwtn
         nBEWujT6yCrKNNbSL80QNaPvX+/Du51PIOI43mbkNMhBu9BCBdb1RDB5nAZbmZLzTdan
         J7eVrQkWIb9v1ViEasBI1LFl9QrRUwot95qN3PJzGKVWQxKldvQalHjhVuYWIG64y5Mm
         So6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=vdYuKW/vGZfhfloPgwzlxR99CRTlvVki4VSMO8v8DvQ=;
        b=s+T8+eaAFzg14IzGKqMhcGD2MtJe1O7dkid4EqUIITFK7rbvCMqumttP2+P4XjxQD3
         v+bmn6Tckio0J/BsAev8Zb+JX++rPglfiJ9dtF2BdnICruQY/3M/q324V9fJSwvbgs1N
         J5isWlLTyYVR2tRn275zFRwfCEjTC4dG2Oz70F/PnuKNE32qOsGldgbSO9nAUyg1qXWI
         A5DItz/+ot6KitBZW3fvzKszvr5/pzunUxKQ3htkysHwLkecE5M6YcMlGYsXrM2dFrqb
         5lfVqZcEOMdY59gT0hSnGvzRiA8ZE63egY4dkLWrgN/h+kkoXPSas7QkFzsFS/KBlIal
         gGlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a7si6943584ila.140.2019.10.04.04.31.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 04 Oct 2019 04:31:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A3B1190C021;
	Fri,  4 Oct 2019 11:31:15 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C57919C5B;
	Fri,  4 Oct 2019 11:31:10 +0000 (UTC)
Date: Fri, 4 Oct 2019 13:31:07 +0200
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, Dave.Martin@arm.com, eric.auger@redhat.com
Subject: Re: [PATCH] target/arm/arch_dump: Add SVE notes
Message-ID: <20191004113107.p7fa5dw5v2vchotb@kamzik.brq.redhat.com>
References: <20191004094609.32714-1-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191004094609.32714-1-drjones@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Fri, 04 Oct 2019 11:31:15 +0000 (UTC)
X-TUID: FxYWDvh0EaCb

On Fri, Oct 04, 2019 at 11:46:09AM +0200, Andrew Jones wrote:
> When dumping a guest with dump-guest-memory also dump the SVE
> registers if they are in use.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  include/elf.h          |   2 +
>  target/arm/arch_dump.c | 133 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 133 insertions(+), 2 deletions(-)
> 
> diff --git a/include/elf.h b/include/elf.h
> index 3501e0c8d03a..a7c357af74ca 100644
> --- a/include/elf.h
> +++ b/include/elf.h
> @@ -1650,6 +1650,8 @@ typedef struct elf64_shdr {
>  #define NT_ARM_HW_BREAK 0x402           /* ARM hardware breakpoint registers */
>  #define NT_ARM_HW_WATCH 0x403           /* ARM hardware watchpoint registers */
>  #define NT_ARM_SYSTEM_CALL      0x404   /* ARM system call number */
> +#define NT_ARM_SVE	0x405		/* ARM Scalable Vector Extension
> +					   registers */
>  
>  /*
>   * Physical entry point into the kernel.
> diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
> index 26a2c098687c..98976167d155 100644
> --- a/target/arm/arch_dump.c
> +++ b/target/arm/arch_dump.c
> @@ -62,12 +62,23 @@ struct aarch64_user_vfp_state {
>  
>  QEMU_BUILD_BUG_ON(sizeof(struct aarch64_user_vfp_state) != 528);
>  
> +/* struct user_sve_header from arch/arm64/include/uapi/asm/ptrace.h */
> +struct aarch64_user_sve_header {
> +    uint32_t size;
> +    uint32_t max_size;
> +    uint16_t vl;
> +    uint16_t max_vl;
> +    uint16_t flags;
> +    uint16_t reserved;
> +} QEMU_PACKED;
> +
>  struct aarch64_note {
>      Elf64_Nhdr hdr;
>      char name[8]; /* align_up(sizeof("CORE"), 4) */
>      union {
>          struct aarch64_elf_prstatus prstatus;
>          struct aarch64_user_vfp_state vfp;
> +        struct aarch64_user_sve_header sve;
>      };
>  } QEMU_PACKED;
>  
> @@ -76,6 +87,8 @@ struct aarch64_note {
>              (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_elf_prstatus))
>  #define AARCH64_PRFPREG_NOTE_SIZE \
>              (AARCH64_NOTE_HEADER_SIZE + sizeof(struct aarch64_user_vfp_state))
> +#define AARCH64_SVE_NOTE_SIZE(env) \
> +            (AARCH64_NOTE_HEADER_SIZE + sve_size(env))
>  
>  static void aarch64_note_init(struct aarch64_note *note, DumpState *s,
>                                const char *name, Elf64_Word namesz,
> @@ -128,11 +141,111 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
>      return 0;
>  }
>  
> +#ifdef TARGET_AARCH64
> +static off_t sve_zreg_offset(uint32_t vq, int n)
> +{
> +    off_t off = sizeof(struct aarch64_user_sve_header);
> +    return ROUND_UP(off, 16) + vq * 16 * n;
> +}
> +static off_t sve_preg_offset(uint32_t vq, int n)
> +{
> +    return sve_zreg_offset(vq, 32) + vq * 16 / 8 * n;
> +}
> +static off_t sve_fpsr_offset(uint32_t vq)
> +{
> +    off_t off = sve_preg_offset(vq, 17) + offsetof(struct aarch64_note, sve);
> +    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
> +}
> +static off_t sve_fpcr_offset(uint32_t vq)
> +{
> +    return sve_fpsr_offset(vq) + sizeof(uint32_t);
> +}
> +static uint32_t sve_current_vq(CPUARMState *env)
> +{
> +    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
> +}
> +static size_t sve_size(CPUARMState *env)
> +{
> +    off_t off = sve_fpcr_offset(sve_current_vq(env)) +
> +                sizeof(uint32_t) +
> +                offsetof(struct aarch64_note, sve);
> +    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
> +}
> +
> +static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
> +                                   CPUARMState *env, int cpuid,
> +                                   DumpState *s)
> +{
> +    struct aarch64_note *note;
> +    uint32_t vq = sve_current_vq(env);
> +    uint32_t fpr;
> +    uint8_t *buf;
> +    size_t size;
> +    int ret, i;
> +
> +    note = g_malloc0(AARCH64_SVE_NOTE_SIZE(env));
> +    size = sve_size(env);
> +    buf = (uint8_t *)&note->sve;
> +
> +    aarch64_note_init(note, s, "LINUX", 6, NT_ARM_SVE, size);
> +
> +    note->sve.size = cpu_to_dump32(s, size);
> +    note->sve.max_size = cpu_to_dump32(s, size);

Oops. I seemed to have mixed two approaches to this note.

Approach 1) do what gcore does
Approach 2) do what section 8 "ELF coredump extensions" of Linux kernel
            doc Documentation/arm64/sve.rst says to do

Approach 2 says the contents of this note should be equivalent to what
would have been read with ptrace. However Approach 1 has it's own idea
of what to provide in the note. Namely it uses the current vl size for
both 'size' and 'max_size', as I've done above, and it doesn't provide
FPSR and FPCR in the SVE note, which I did provide below. But if you do a
ptrace then you'll see FPSR and FPCR should be provided and the max_size
is necessarily reflective of the max, as ptrace may be called multiple
times - whereas with a core it doesn't really matter.

I'll post a v2 that implements Approach 2, because that's the documented
way to do it. I'm open to arguments for Approach 1 though.

Thanks,
drew

> +    note->sve.vl = cpu_to_dump16(s, vq * 16);
> +    note->sve.max_vl = cpu_to_dump16(s, vq * 16);
> +    note->sve.flags = cpu_to_dump16(s, 1);
> +
> +    for (i = 0; i < 32; ++i) {
> +#ifdef HOST_WORDS_BIGENDIAN
> +        uint64_t d[vq * 2];
> +        int j;
> +
> +        for (j = 0; j < vq * 2; ++j) {
> +            d[j] = bswap64(env->vfp.zregs[i].d[j]);
> +        }
> +#else
> +        uint64_t *d = &env->vfp.zregs[i].d[0];
> +#endif
> +        memcpy(&buf[sve_zreg_offset(vq, i)], &d[0], vq * 16);
> +    }
> +
> +    for (i = 0; i < 17; ++i) {
> +#ifdef HOST_WORDS_BIGENDIAN
> +        uint64_t d[DIV_ROUND_UP(vq * 2, 8)];
> +        int j;
> +
> +        for (j = 0; j < DIV_ROUND_UP(vq * 2, 8); ++j) {
> +            d[j] = bswap64(env->vfp.pregs[i].p[j]);
> +        }
> +#else
> +        uint64_t *d = &env->vfp.pregs[i].p[0];
> +#endif
> +        memcpy(&buf[sve_preg_offset(vq, i)], &d[0], vq * 16 / 8);
> +    }
> +
> +    fpr = cpu_to_dump32(s, vfp_get_fpsr(env));
> +    memcpy(&buf[sve_fpsr_offset(vq)], &fpr, sizeof(uint32_t));
> +
> +    fpr = cpu_to_dump32(s, vfp_get_fpcr(env));
> +    memcpy(&buf[sve_fpcr_offset(vq)], &fpr, sizeof(uint32_t));
> +
> +    ret = f(note, AARCH64_SVE_NOTE_SIZE(env), s);
> +    g_free(note);
> +
> +    if (ret < 0) {
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +#endif
> +
>  int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>                               int cpuid, void *opaque)
>  {
>      struct aarch64_note note;
> -    CPUARMState *env = &ARM_CPU(cs)->env;
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
>      DumpState *s = opaque;
>      uint64_t pstate, sp;
>      int ret, i;
> @@ -163,7 +276,18 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
>          return -1;
>      }
>  
> -    return aarch64_write_elf64_prfpreg(f, env, cpuid, s);
> +    ret = aarch64_write_elf64_prfpreg(f, env, cpuid, s);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +#ifdef TARGET_AARCH64
> +    if (cpu_isar_feature(aa64_sve, cpu)) {
> +        ret = aarch64_write_elf64_sve(f, env, cpuid, s);
> +    }
> +#endif
> +
> +    return ret;
>  }
>  
>  /* struct pt_regs from arch/arm/include/asm/ptrace.h */
> @@ -335,6 +459,11 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
>      if (class == ELFCLASS64) {
>          note_size = AARCH64_PRSTATUS_NOTE_SIZE;
>          note_size += AARCH64_PRFPREG_NOTE_SIZE;
> +#ifdef TARGET_AARCH64
> +        if (cpu_isar_feature(aa64_sve, cpu)) {
> +            note_size += AARCH64_SVE_NOTE_SIZE(env);
> +        }
> +#endif
>      } else {
>          note_size = ARM_PRSTATUS_NOTE_SIZE;
>          if (arm_feature(env, ARM_FEATURE_VFP)) {
> -- 
> 2.20.1
> 
