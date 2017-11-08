Received: by 10.223.150.237 with SMTP id u100csp1430810wrb;
        Wed, 8 Nov 2017 07:45:07 -0800 (PST)
X-Google-Smtp-Source: ABhQp+Q76gQQ3V+cPbNvwwx0ksvvWKVlr7HWI5izROCF3lFYlZbsDIeypbr5+oMmdgXRVt29la2b
X-Received: by 10.223.133.242 with SMTP id 47mr889790wru.170.1510155907123;
        Wed, 08 Nov 2017 07:45:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510155907; cv=none;
        d=google.com; s=arc-20160816;
        b=yv2XyKU2JbkaSqZR1WOiZRnK/f5kup5eLrwlSAKnn6Qed5u39mgxXPWXLUMOgxRUua
         AmzbNqxH81NUo5FGDA3jrLA2OlTxVClaJ02byjc3LjyDV5IJbg+AN+AN9p8G25r/vmrO
         CPHFdSYGg/PIbVEw1kGr/HJUDOuYAXtvUU409IEj29+BEIGdjnupyrBjotk/DTR+k039
         EK9k40BrZRBzZ1LGXTcdWALcRiejp4v5dOgCd6hMC5YScjTC5Ohgmqj12C9yV3W4Nril
         CCPbpimYJg809CRf0D14PVAiemPAeLmy1iWZznTcImLWwgA6/dJQ0xaypCWbCHDYLiY5
         sVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :arc-authentication-results;
        bh=Rq01ElmJUA8bfAuyy91vTdJ6gmlwF+9ZuBaVM9q0YRw=;
        b=Xiqv/kc5ustRDm91WgeLmSDrfm0gFLgeu6K3wmIvt5KQG3kQ8+a2p8RNZprbGm0nZ5
         SrBxb8sk4zLEcqqHeSr6hY4dDqW8pGOqHAhrFHhzLVjwkU5Uv+MvVzP/8EhhS5ZfhDYT
         PAdSF4xo07tIBx3x9O3ef4PPdj5MCrmMOCeT2gt3LXIuFXFoJ7SjQNxs1NL0flTGcx9I
         WmmkvaitBTASDo+nyoo/DKFHusEqUqgrCf2wK/kPU1LTvt6CPvlSF5lPIh6Xnf34BCfD
         bpiCgS3sK0d8b4ErJK0bTyrZpB9/ew2QzBYIbMJT/PscO80MrAmX4Tk1tdf4yAHXJEBr
         keng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 217.72.192.74 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [217.72.192.74])
        by mx.google.com with ESMTPS id a1si3782096wrf.264.2017.11.08.07.45.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Nov 2017 07:45:07 -0800 (PST)
Received-SPF: neutral (google.com: 217.72.192.74 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=217.72.192.74;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 217.72.192.74 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue102 [212.227.15.183]) with ESMTPSA (Nemesis) id
 0LuMJr-1fCUr70JZX-011hIL; Wed, 08 Nov 2017 16:45:06 +0100
Subject: Re: [Qemu-devel] [PATCH v2 1/2] accel/tcg/translate-all: expand
 cpu_restore_state addr check
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
References: <20171108153245.20740-1-alex.bennee@linaro.org>
 <20171108153245.20740-2-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <8d8e292f-378c-e943-2785-f61615d641b3@vivier.eu>
Date: Wed, 8 Nov 2017 16:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171108153245.20740-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:CKPRawpsiuEJYpwj2eL0k767++jGOZp+hSpLL+IpiTh5y34PtoJ
 xqm81pnogOSkSP6gHtDTYwJBeygbwanuKT6Sb+000DC72DH8qIrA7cqLem22JEjks8u9C/C
 YGyTSv8uUlXlJl9XBrKRVzf5fpHD4c6RncWAHPdscUqB6tsYi1NJ9KFz8OXJnF9cx+DEmXL
 yChyynQE7cGVTe+9zLBtQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:8lbl80IL7cE=:bF2y30tpF/PdEMRrIkbr/x
 ShnFeRth6TdRhhN0Z9+MZVElUmRx2I1gngJjyeUSdRcc3jT9uWF9K3HM17UbASe34M8jl+GvM
 OoWra+0zbEZeAuAtiyvkrt7M7ZWFUo1epV7iDYXxKoezMILXDZ6CHzN2trelVwD1oFw2MId6p
 WbMBTfyYn9uMWypHiWdJ765SnSAkv5eHbUuKc68ETjeMfwivx1bB9OUODcqwjUESkLnuBntD4
 iaBjdQIiLLJ/z3MyfieIB04t7e51GB+M4usy/qa9osje2MEc+559uJj2Di8PG8+s7qafTNr9c
 AszwqVR1/7hqJcMU4LTtrD8NMiBgBlDFlshvlrUVPb7o3CAVvXCSX/B/fuNLDdLFnjUiQ3WRY
 TTbIZ/Tp5e+8FRMpS5goRWPHgSdTvyEs5TPrO3IQB7F8PKBkUiEpOYcmYfz598u91kAq3ECsh
 iy4LYKuNfyBWkfgSnu7F0ZDdf7fFNiB2EV0FmplG2nvxkEPghzkL9iKZ+8Z42tX+4GkpNCJOZ
 9XokU6H2v78XU34ztBi7S3wmbrrY7qzxwaABiDlip2nWA+Txfq8lYeOKEmBEGUcPOuODPVKZ1
 /nDbM1czBPOrcOWmB+CW4QXhoxffQxd7JmYlShyAD68hqMF7SyX7NWyTV98vDUHaJmsw8mv8y
 mZg21I0c4PJMCaT5dv1WNnfCMkYZ2Jsd24jyefioe0i7Jvi0Wgr5ciCIwkdOJRFBa4TsZxIAi
 sTZ/CTOJPsZbYj4VolEN452VWpNa408XyKhKDIjsc62hjYOJWM+armIImJk=
X-TUID: XF0yI2lzgUGz

Le 08/11/2017 à 16:32, Alex Bennée a écrit :
> We are still seeing signals during translation time when we walk over
> a page protection boundary. This expands the check to ensure the host
> PC is inside the code generation buffer. The original suggestion was
> to check versus tcg_ctx.code_gen_ptr but as we now segment the
> translation buffer we have to settle for just a general check for
> being inside.
> 
> I've also fixed up the declaration to make it clear it can deal with
> invalid addresses. A later patch will fix up the call sites.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <rth@twiddle.net>
> 
> ---
> v2:
>   - add doc comment to exec-all.h
>   - retaddr->host_pc
>   - re-word comments on host_pc
>   - simplify logic as per rth suggestion
> ---
>  accel/tcg/translate-all.c | 52 ++++++++++++++++++++++++++---------------------
>  include/exec/exec-all.h   | 11 ++++++++++
>  2 files changed, 40 insertions(+), 23 deletions(-)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 34c5e28d07..e7f0329a52 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -352,36 +352,42 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
>      return 0;
>  }
>  
> -bool cpu_restore_state(CPUState *cpu, uintptr_t retaddr)
> +bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc)
>  {
>      TranslationBlock *tb;
>      bool r = false;
> +    uintptr_t check_offset;
>  
> -    /* A retaddr of zero is invalid so we really shouldn't have ended
> -     * up here. The target code has likely forgotten to check retaddr
> -     * != 0 before attempting to restore state. We return early to
> -     * avoid blowing up on a recursive tb_lock(). The target must have
> -     * previously survived a failed cpu_restore_state because
> -     * tb_find_pc(0) would have failed anyway. It still should be
> -     * fixed though.
> +    /* The host_pc has to be in the region of current code buffer. If
> +     * it is not we will not be able to resolve it here. The two cases
> +     * where host_pc will not be correct are:
> +     *
> +     *  - fault during translation (instruction fetch)
> +     *  - fault from helper (not using GETPC() macro)
> +     *
> +     * Either way we need return early to avoid blowing up on a
> +     * recursive tb_lock() as we can't resolve it here.
> +     *
> +     * We are using unsigned arithmetic so if host_pc <
> +     * tcg_init_ctx.code_gen_buffer check_offset will wrap to way
> +     * above the code_gen_buffer_size
>       */
> -
> -    if (!retaddr) {
> -        return r;
> -    }
> -
> -    tb_lock();
> -    tb = tb_find_pc(retaddr);
> -    if (tb) {
> -        cpu_restore_state_from_tb(cpu, tb, retaddr);
> -        if (tb->cflags & CF_NOCACHE) {
> -            /* one-shot translation, invalidate it immediately */
> -            tb_phys_invalidate(tb, -1);
> -            tb_remove(tb);
> +    check_offset = host_pc - (uintptr_t) tcg_init_ctx.code_gen_buffer;
> +
> +    if (check_offset < tcg_init_ctx.code_gen_buffer_size) {
> +        tb_lock();
> +        tb = tb_find_pc(host_pc);
> +        if (tb) {
> +            cpu_restore_state_from_tb(cpu, tb, host_pc);
> +            if (tb->cflags & CF_NOCACHE) {
> +                /* one-shot translation, invalidate it immediately */
> +                tb_phys_invalidate(tb, -1);
> +                tb_remove(tb);
> +            }
> +            r = true;
>          }
> -        r = true;
> +        tb_unlock();
>      }
> -    tb_unlock();
>  
>      return r;
>  }
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index 923ece3e9b..0f51c92adb 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -45,6 +45,17 @@ void restore_state_to_opc(CPUArchState *env, struct TranslationBlock *tb,
>                            target_ulong *data);
>  
>  void cpu_gen_init(void);
> +
> +/**
> + * cpu_restore_state:
> + * @cpu: the vCPU state is to be restore to
> + * @searched_pc: the host PC the fault occurred at
> + * @return: true if state was restored, false otherwise
> + *
> + * Attempt to restore the state for a fault occurring in translated
> + * code. If the searched_pc is not in translated code no state is
> + * restored and the function returns false.
> + */
>  bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc);
>  
>  void QEMU_NORETURN cpu_loop_exit_noexc(CPUState *cpu);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
