Received: by 10.223.172.38 with SMTP id v35csp2775819wrc;
        Sun, 17 Sep 2017 06:07:06 -0700 (PDT)
X-Received: by 10.25.32.85 with SMTP id g82mr2502386lfg.115.1505653626739;
        Sun, 17 Sep 2017 06:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505653626; cv=none;
        d=google.com; s=arc-20160816;
        b=PY+C6DS+nuJJRWVKFDw3AJCeXYCKOBC6AfU7gng9rMZh7RbAxXC6kugJszbk5XANjo
         tLa16UrJs6+QUfZpTlzR1OlvlGi4Gu9x/CyX6dIxOxAX5HwLaJwHHh8Tv/Y+/JAM3MHO
         twUC7PSh1WZUx8bCmfC+VSTz5jGJHHcRXWAyCaT95N+TMn/XwgE/TfOqIoSi3etVNTB8
         s+V7F1WQLgTB4u5cVFKIIKC6y09yQR8mvVSc78wruy7wNtq4qCsgshr205GHVCm0NkAY
         SPdXVvMYOElQJ3mBQncJE5aqqS4ePBpkbx0v1Bpb5zjH7+yUO0Kt0gKIxgNZuySHF1y1
         tIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=E4lw3uO4qOAzG+mvosxnOKVNSjd7LTondW5KuzWTLUQ=;
        b=AmwsJW4VpuYTbvM6dYiYV5YDTuN9g0hMkb3BW/k53cq9liOIDq3Lv70d+WCAn8EPcR
         k733Qg5CEpw4UmpA724wpKfm6EUzrC1UOg8Q4gkgcB31IGjNSBUfMqZJeF2qqD4s5KyN
         NaLc18eC0RJflfjFC2e17ZA4thdaCNmTZ7wHjkwpp7yJO13JAURU0dnRAt5LzYPKwXhp
         YTmm/yDuEpUkTsHv88tM6idW5D9fHZdmOneRXYFYkykpGKGNzGJmiDet3jxQ1aCz51lR
         LIj9daBeoIfjr1+zuklRhdSbnNBVEuYrFS4zuz4+t5W8thIIQAe2Nbm2cQyIuPeF1JPW
         d7qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FZpnv+S5;
       spf=pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=digetx@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <digetx@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n88sor939548ljb.3.2017.09.17.06.07.06
        (Google Transport Security);
        Sun, 17 Sep 2017 06:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=FZpnv+S5;
       spf=pass (google.com: domain of digetx@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=digetx@gmail.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E4lw3uO4qOAzG+mvosxnOKVNSjd7LTondW5KuzWTLUQ=;
        b=FZpnv+S51YEqCq0mxbKO7ght0CHdnxWR0S+zyZQqY42t8cJun4Eo0P9MjkizkjmUry
         ierxofn8VuO/6GGWxTcAzMP3+zxV1OnVzRvcmRAmTeKPNZOz5SNzPxy8VL8ihyeDtp/1
         15f7eOFjNHj1AfJh0ydzWGJdj4l9DfJFE6wLFTNhtAbI+l1zYD9Lwj2XZkV294GK48/w
         dxP7TYe8rs6C9nkd1UbMnnqpdeGy1JmxLGjJuOCUsVwhpC5iVNhImNRebBFZrRbgZHns
         dH1j/NLiFbtSub2BiMYL3qLrogMELKY3Az6Q2ojbOzPJk7Nx5YWp9ZFTKv729woOrEQW
         h6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E4lw3uO4qOAzG+mvosxnOKVNSjd7LTondW5KuzWTLUQ=;
        b=e7hEfWZ0wnqYq3BTRFDh9d34tMDNM39LW8StzHwv0IQbZ/a+jYBbtuICt5lzkSyP22
         RPWi9HRJuCMwNfgjSbZmQhe9ZHS51bmNirAZnGOfILyIO87GAezSXTDne67pudEyZgOH
         71HtfcnvdLa+tnzRPIfj5s9083/0E/IlWiPS8gdGis3tEmQCnweBVdJSPW7VdpZeRxTd
         wZwyqZF786/UDgE2Vwy3MouYxVAqG7loMOlUqqGDpGI3TJbZOqcrEXP54NJEDFOYZUES
         ASXZ0DiT8udjyC+cK+WOffZDd/3M36B1aHi7ZXGhWkr7JNVytz47DxbU0zIVdm35MIh4
         aMNw==
X-Gm-Message-State: AHPjjUiX0D5+s5zj6MgHr5IRz4y5lTv/WkHhYzWN9sLTeJggRt+0naUR
	qbdk7Hscg9nKfHz1BNs=
X-Google-Smtp-Source: AOwi7QBagOhTSJnWx2HfNFI9t/0/hXZgj+SnSMysMWsqOlLwvrV67nl8ahdlPqF0HzHNSH6YmoCGww==
X-Received: by 10.46.93.86 with SMTP id r83mr6568920ljb.136.1505653625874;
        Sun, 17 Sep 2017 06:07:05 -0700 (PDT)
Return-Path: <digetx@gmail.com>
Received: from [192.168.1.145] (ppp109-252-91-7.pppoe.spdop.ru. [109.252.91.7])
        by smtp.googlemail.com with ESMTPSA id u28sm1291532lje.79.2017.09.17.06.07.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Sep 2017 06:07:04 -0700 (PDT)
Subject: Re: [PULL 22/24] target-arm: ensure all cross vCPUs TLB flushes
 complete
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: "open list:ARM" <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
References: <20170224112109.3147-1-alex.bennee@linaro.org>
 <20170224112109.3147-23-alex.bennee@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7468f944-914c-de89-66fb-f8ad49eb59c1@gmail.com>
Date: Sun, 17 Sep 2017 16:07:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170224112109.3147-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: g+uH8b/Jq/22

On 24.02.2017 14:21, Alex Bennée wrote:
> Previously flushes on other vCPUs would only get serviced when they
> exited their TranslationBlocks. While this isn't overly problematic it
> violates the semantics of TLB flush from the point of view of source
> vCPU.
> 
> To solve this we call the cputlb *_all_cpus_synced() functions to do
> the flushes which ensures all flushes are completed by the time the
> vCPU next schedules its own work. As the TLB instructions are modelled
> as CP writes the TB ends at this point meaning cpu->exit_request will
> be checked before the next instruction is executed.
> 
> Deferring the work until the architectural sync point is a possible
> future optimisation.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <rth@twiddle.net>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 165 ++++++++++++++++++++++------------------------------
>  1 file changed, 69 insertions(+), 96 deletions(-)
> 

Hello,

I have an issue with Linux kernel stopping to boot on a SMP 32bit ARM (haven't
checked 64bit) in a single-threaded TCG mode. Kernel reaches point where it
should mount rootfs over NFS and vCPUs stop. This issue is reproducible with any
32bit ARM machine type. Kernel boots fine with a MTTCG accel, only
single-threaded TCG is affected. Git bisection lead to this patch, any ideas?

Example:

qemu-system-arm -M vexpress-a9 -smp cpus=2 -accel accel=tcg,thread=single
-kernel arch/arm/boot/zImage -dtb arch/arm/boot/dts/vexpress-v2p-ca9.dtb -serial
stdio -net nic,model=lan9118 -net user -d in_asm,out_asm -D /tmp/qemulog

Last TB from the log:
----------------
IN:
0xc011a450:  ee080f73      mcr	15, 0, r0, cr8, cr3, {3}

OUT: [size=68]
0x7f32d8b93f80:  mov    -0x18(%r14),%ebp
0x7f32d8b93f84:  test   %ebp,%ebp
0x7f32d8b93f86:  jne    0x7f32d8b93fb8
0x7f32d8b93f8c:  mov    %r14,%rdi
0x7f32d8b93f8f:  mov    $0x5620f2aea5d0,%rsi
0x7f32d8b93f99:  mov    (%r14),%edx
0x7f32d8b93f9c:  mov    $0x5620f18107ca,%r10
0x7f32d8b93fa6:  callq  *%r10
0x7f32d8b93fa9:  movl   $0xc011a454,0x3c(%r14)
0x7f32d8b93fb1:  xor    %eax,%eax
0x7f32d8b93fb3:  jmpq   0x7f32d7a4e016
0x7f32d8b93fb8:  lea    -0x14aa07c(%rip),%rax        # 0x7f32d76e9f43
0x7f32d8b93fbf:  jmpq   0x7f32d7a4e016


> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b41d0494d1..bcedb4a808 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -536,41 +536,33 @@ static void tlbimvaa_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void tlbiall_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush(other_cs);
> -    }
> +    tlb_flush_all_cpus_synced(cs);
>  }
>  
>  static void tlbiasid_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush(other_cs);
> -    }
> +    tlb_flush_all_cpus_synced(cs);
>  }
>  
>  static void tlbimva_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
> -    }
> +    tlb_flush_page_all_cpus_synced(cs, value & TARGET_PAGE_MASK);
>  }
>  
>  static void tlbimvaa_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                               uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_page(other_cs, value & TARGET_PAGE_MASK);
> -    }
> +    tlb_flush_page_all_cpus_synced(cs, value & TARGET_PAGE_MASK);
>  }
>  
>  static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -587,14 +579,12 @@ static void tlbiall_nsnh_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void tlbiall_nsnh_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                    uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_by_mmuidx(other_cs,
> -                            (1 << ARMMMUIdx_S12NSE1) |
> -                            (1 << ARMMMUIdx_S12NSE0) |
> -                            (1 << ARMMMUIdx_S2NS));
> -    }
> +    tlb_flush_by_mmuidx_all_cpus_synced(cs,
> +                                        (1 << ARMMMUIdx_S12NSE1) |
> +                                        (1 << ARMMMUIdx_S12NSE0) |
> +                                        (1 << ARMMMUIdx_S2NS));
>  }
>  
>  static void tlbiipas2_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -621,7 +611,7 @@ static void tlbiipas2_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void tlbiipas2_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                 uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>      uint64_t pageaddr;
>  
>      if (!arm_feature(env, ARM_FEATURE_EL2) || !(env->cp15.scr_el3 & SCR_NS)) {
> @@ -630,9 +620,8 @@ static void tlbiipas2_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  
>      pageaddr = sextract64(value << 12, 0, 40);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S2NS));
> -    }
> +    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
> +                                             (1 << ARMMMUIdx_S2NS));
>  }
>  
>  static void tlbiall_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -646,11 +635,9 @@ static void tlbiall_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void tlbiall_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                   uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_by_mmuidx(other_cs, (1 << ARMMMUIdx_S1E2));
> -    }
> +    tlb_flush_by_mmuidx_all_cpus_synced(cs, (1 << ARMMMUIdx_S1E2));
>  }
>  
>  static void tlbimva_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -665,12 +652,11 @@ static void tlbimva_hyp_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void tlbimva_hyp_is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                   uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>      uint64_t pageaddr = value & ~MAKE_64BIT_MASK(0, 12);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S1E2));
> -    }
> +    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
> +                                             (1 << ARMMMUIdx_S1E2));
>  }
>  
>  static const ARMCPRegInfo cp_reginfo[] = {
> @@ -2904,8 +2890,7 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
>  static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                      uint64_t value)
>  {
> -    ARMCPU *cpu = arm_env_get_cpu(env);
> -    CPUState *cs = CPU(cpu);
> +    CPUState *cs = ENV_GET_CPU(env);
>  
>      if (arm_is_secure_below_el3(env)) {
>          tlb_flush_by_mmuidx(cs,
> @@ -2921,19 +2906,17 @@ static void tlbi_aa64_vmalle1_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void tlbi_aa64_vmalle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                        uint64_t value)
>  {
> +    CPUState *cs = ENV_GET_CPU(env);
>      bool sec = arm_is_secure_below_el3(env);
> -    CPUState *other_cs;
>  
> -    CPU_FOREACH(other_cs) {
> -        if (sec) {
> -            tlb_flush_by_mmuidx(other_cs,
> -                                (1 << ARMMMUIdx_S1SE1) |
> -                                (1 << ARMMMUIdx_S1SE0));
> -        } else {
> -            tlb_flush_by_mmuidx(other_cs,
> -                                (1 << ARMMMUIdx_S12NSE1) |
> -                                (1 << ARMMMUIdx_S12NSE0));
> -        }
> +    if (sec) {
> +        tlb_flush_by_mmuidx_all_cpus_synced(cs,
> +                                            (1 << ARMMMUIdx_S1SE1) |
> +                                            (1 << ARMMMUIdx_S1SE0));
> +    } else {
> +        tlb_flush_by_mmuidx_all_cpus_synced(cs,
> +                                            (1 << ARMMMUIdx_S12NSE1) |
> +                                            (1 << ARMMMUIdx_S12NSE0));
>      }
>  }
>  
> @@ -2990,46 +2973,40 @@ static void tlbi_aa64_alle1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>       * stage 2 translations, whereas most other scopes only invalidate
>       * stage 1 translations.
>       */
> +    CPUState *cs = ENV_GET_CPU(env);
>      bool sec = arm_is_secure_below_el3(env);
>      bool has_el2 = arm_feature(env, ARM_FEATURE_EL2);
> -    CPUState *other_cs;
> -
> -    CPU_FOREACH(other_cs) {
> -        if (sec) {
> -            tlb_flush_by_mmuidx(other_cs,
> -                                (1 << ARMMMUIdx_S1SE1) |
> -                                (1 << ARMMMUIdx_S1SE0));
> -        } else if (has_el2) {
> -            tlb_flush_by_mmuidx(other_cs,
> -                                (1 << ARMMMUIdx_S12NSE1) |
> -                                (1 << ARMMMUIdx_S12NSE0) |
> -                                (1 << ARMMMUIdx_S2NS));
> -        } else {
> -            tlb_flush_by_mmuidx(other_cs,
> -                                (1 << ARMMMUIdx_S12NSE1) |
> -                                (1 << ARMMMUIdx_S12NSE0));
> -        }
> +
> +    if (sec) {
> +        tlb_flush_by_mmuidx_all_cpus_synced(cs,
> +                                            (1 << ARMMMUIdx_S1SE1) |
> +                                            (1 << ARMMMUIdx_S1SE0));
> +    } else if (has_el2) {
> +        tlb_flush_by_mmuidx_all_cpus_synced(cs,
> +                                            (1 << ARMMMUIdx_S12NSE1) |
> +                                            (1 << ARMMMUIdx_S12NSE0) |
> +                                            (1 << ARMMMUIdx_S2NS));
> +    } else {
> +          tlb_flush_by_mmuidx_all_cpus_synced(cs,
> +                                              (1 << ARMMMUIdx_S12NSE1) |
> +                                              (1 << ARMMMUIdx_S12NSE0));
>      }
>  }
>  
>  static void tlbi_aa64_alle2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                      uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_by_mmuidx(other_cs, (1 << ARMMMUIdx_S1E2));
> -    }
> +    tlb_flush_by_mmuidx_all_cpus_synced(cs, (1 << ARMMMUIdx_S1E2));
>  }
>  
>  static void tlbi_aa64_alle3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                      uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_by_mmuidx(other_cs, (1 << ARMMMUIdx_S1E3));
> -    }
> +    tlb_flush_by_mmuidx_all_cpus_synced(cs, (1 << ARMMMUIdx_S1E3));
>  }
>  
>  static void tlbi_aa64_vae1_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -3086,43 +3063,40 @@ static void tlbi_aa64_vae3_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void tlbi_aa64_vae1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                     uint64_t value)
>  {
> +    ARMCPU *cpu = arm_env_get_cpu(env);
> +    CPUState *cs = CPU(cpu);
>      bool sec = arm_is_secure_below_el3(env);
> -    CPUState *other_cs;
>      uint64_t pageaddr = sextract64(value << 12, 0, 56);
>  
> -    CPU_FOREACH(other_cs) {
> -        if (sec) {
> -            tlb_flush_page_by_mmuidx(other_cs, pageaddr,
> -                                     (1 << ARMMMUIdx_S1SE1) |
> -                                     (1 << ARMMMUIdx_S1SE0));
> -        } else {
> -            tlb_flush_page_by_mmuidx(other_cs, pageaddr,
> -                                     (1 << ARMMMUIdx_S12NSE1) |
> -                                     (1 << ARMMMUIdx_S12NSE0));
> -        }
> +    if (sec) {
> +        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
> +                                                 (1 << ARMMMUIdx_S1SE1) |
> +                                                 (1 << ARMMMUIdx_S1SE0));
> +    } else {
> +        tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
> +                                                 (1 << ARMMMUIdx_S12NSE1) |
> +                                                 (1 << ARMMMUIdx_S12NSE0));
>      }
>  }
>  
>  static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                     uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>      uint64_t pageaddr = sextract64(value << 12, 0, 56);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S1E2));
> -    }
> +    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
> +                                             (1 << ARMMMUIdx_S1E2));
>  }
>  
>  static void tlbi_aa64_vae3is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                     uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>      uint64_t pageaddr = sextract64(value << 12, 0, 56);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S1E3));
> -    }
> +    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
> +                                             (1 << ARMMMUIdx_S1E3));
>  }
>  
>  static void tlbi_aa64_ipas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
> @@ -3150,7 +3124,7 @@ static void tlbi_aa64_ipas2e1_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                        uint64_t value)
>  {
> -    CPUState *other_cs;
> +    CPUState *cs = ENV_GET_CPU(env);
>      uint64_t pageaddr;
>  
>      if (!arm_feature(env, ARM_FEATURE_EL2) || !(env->cp15.scr_el3 & SCR_NS)) {
> @@ -3159,9 +3133,8 @@ static void tlbi_aa64_ipas2e1is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>  
>      pageaddr = sextract64(value << 12, 0, 48);
>  
> -    CPU_FOREACH(other_cs) {
> -        tlb_flush_page_by_mmuidx(other_cs, pageaddr, (1 << ARMMMUIdx_S2NS));
> -    }
> +    tlb_flush_page_by_mmuidx_all_cpus_synced(cs, pageaddr,
> +                                             (1 << ARMMMUIdx_S2NS));
>  }
>  
>  static CPAccessResult aa64_zva_access(CPUARMState *env, const ARMCPRegInfo *ri,
> 


-- 
Dmitry
