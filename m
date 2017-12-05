Received: by 10.223.159.74 with SMTP id f10csp3311862wrg;
        Tue, 5 Dec 2017 13:27:52 -0800 (PST)
X-Received: by 10.55.119.70 with SMTP id s67mr24668664qkc.45.1512509272849;
        Tue, 05 Dec 2017 13:27:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512509272; cv=none;
        d=google.com; s=arc-20160816;
        b=b/0HttHWm17Gb7/GvTXGswTl4YPQG1IbPNym/2bz24vPiBerusYRue4+nAsbvkEOvx
         uSRL0QNubPlF5KuUvZXFUuGbqoKqCZeok0NrN6Xb5e4NlAx+t0uIMgdjJJNXGxSW6/dW
         wqKLj6MPO8U7mBAi7TYp/BiNaDr7UJ4WvGhtt3pK7qJ4a9yaLkH/UC3Cq4ezC9M4SH8K
         uofLKh5pkxk6V8nLel+/VgAJQYolWcBvXu3MowNN1/ckN8uhgRP70VgAR3Esuz0ZnRVQ
         /qxct5/ksD2OLCxAGhflTewL4bfTSbqZp11PVzlIx5pTbZUElwjbbdZ7LYhFno04LV8Z
         FdeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :sender:dkim-signature:arc-authentication-results;
        bh=1kFLjdYFMSkFYMuzArVeTkpyJwJyGCMysoyj0+84z8Y=;
        b=eNLELQQo7JDbQF9vcM7hkPR5y0BJtpQ1tQemSq+JndAqF45JO7vrjege0RRWlN4ldJ
         Ivz9G0XzL5jh8/Y5mjjCsSX8uwI7nQ3wz9u3uACnBoDJFDMezX/SFUY0hAd9+n3INOGM
         9GdpSJMdW+1w2zhQZEGL2kj+Lcwff909xxPBcqDZqonJz+RCTrX3nyJgZoGfdDJ7NOJh
         AXjri3uuGepT91yNaJK5vaUmqdReIDGUH6/ocSNJOkjVt1ZK8/WG4FNnjF5gGZsJdp/W
         Ott+3PpmkbcPZgLZSzT1/iJZlCONHxSdGLxuEJQVS/9VE/0u0jzKfpX4aJ4gDlz70GfM
         DwZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eiUp0GlI;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o66sor860119qkc.144.2017.12.05.13.27.52
        (Google Transport Security);
        Tue, 05 Dec 2017 13:27:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=eiUp0GlI;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1kFLjdYFMSkFYMuzArVeTkpyJwJyGCMysoyj0+84z8Y=;
        b=eiUp0GlIWe/tRZJyiYFgFSjNosL8bzywNHLQAKmSiQQwZqmit8KUSBR+UviRNgDG4F
         b0dI50YI+n6xkINTJ/RZGINYxnKwo7c8LIDH4K829uWWYUosivu5J8wmlxEjHg3alGIx
         46HXPWDV9aKTOOORfGH6HxP/qr4S46o//+UOg+xH+MVb4nIAg7EZQjZxHGm6VdfuX7kk
         vzmdoi3OnsD0wH61n7v6aYSu9rz3cgmLJg2B03fcKe7N4Xi5zOyZriHotg8HRk8CnkzH
         r3L+K0zvDexXO5swdVfUIoyvvg+bFV241Ya1A8XDHzh62087P0/f6ScMTqNTxWt79//5
         YXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=1kFLjdYFMSkFYMuzArVeTkpyJwJyGCMysoyj0+84z8Y=;
        b=UKEJCoBJFG0CjIInPWgCUt+WvGN791LwaPfAaBYt/d/4w3TRgDB8PXTFgYqP4SdRux
         q1kV2U9N4V+CM0jzd6OWNV+W/UrSQuiSL5dmXmJkOeUQlJ7R9BDLiyvnUuqbSBc4M4gC
         di8t4lgHu90U+H3x1AURqVyCty3eU/FZiSbQQv2D89gf5c3rOXtsSUXaO1BnBcz/5pmR
         rd/O99+wV+Cpw7Nf/RmRWLJ/923JfxqBSdUB/joAG2C/7bP+73FjxHjZTpOfGj8t9Zot
         UVmwqtWUW7CyIkCv6kWe6yGDIdSfpubHJDdftsHsUmAnBwRwfTNTv5hEUl79C8jvnbak
         iyOg==
X-Gm-Message-State: AKGB3mJr1x3Ycm4CS2ugO0xK5G1K1+ALcbzg3U07CXrv9424epKn/G8z
	go5DESbwqOCOR/Mf42zDCpQ=
X-Google-Smtp-Source: AGs4zMbqf5HqacQswq4U8BFHtPYGV9PBX+j/mcbSI0QETTT8TEngKLcbSseNhYLycFsCJHa1n07Afg==
X-Received: by 10.55.160.18 with SMTP id j18mr23488653qke.351.1512509272399;
        Tue, 05 Dec 2017 13:27:52 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.11] ([138.117.48.211])
        by smtp.gmail.com with ESMTPSA id v8sm648648qtc.67.2017.12.05.13.27.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Dec 2017 13:27:51 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 6/7] target/arm: Factor MPU lookup code out
 of get_phys_addr_pmsav8()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
 <1512153879-5291-7-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f51fdabd-f0bb-80f0-ece2-75fd2a514778@amsat.org>
Date: Tue, 5 Dec 2017 18:27:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-7-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: YM37NtvNpodF

On 12/01/2017 03:44 PM, Peter Maydell wrote:
> For the TT instruction we're going to need to do an MPU lookup that
> also tells us which MPU region the access hit. This requires us
> to do the MPU lookup without first doing the SAU security access
> check, so pull the MPU lookup parts of get_phys_addr_pmsav8()
> out into their own function.
> 
> The TT instruction also needs to know the MPU region number which
> the lookup hit, so provide this information to the caller of the
> MPU lookup code, even though get_phys_addr_pmsav8() doesn't
> need to know it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Elegant refactor!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 130 +++++++++++++++++++++++++++++++---------------------
>  1 file changed, 79 insertions(+), 51 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 14ab1f4..be8d797 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9351,67 +9351,28 @@ static void v8m_security_lookup(CPUARMState *env, uint32_t address,
>      }
>  }
>  
> -static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
> -                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
> -                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
> -                                 int *prot, uint32_t *fsr)
> +static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
> +                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
> +                              hwaddr *phys_ptr, MemTxAttrs *txattrs,
> +                              int *prot, uint32_t *fsr, uint32_t *mregion)
>  {
> +    /* Perform a PMSAv8 MPU lookup (without also doing the SAU check
> +     * that a full phys-to-virt translation does).
> +     * mregion is (if not NULL) set to the region number which matched,
> +     * or -1 if no region number is returned (MPU off, address did not
> +     * hit a region, address hit in multiple regions).
> +     */
>      ARMCPU *cpu = arm_env_get_cpu(env);
>      bool is_user = regime_is_user(env, mmu_idx);
>      uint32_t secure = regime_is_secure(env, mmu_idx);
>      int n;
>      int matchregion = -1;
>      bool hit = false;
> -    V8M_SAttributes sattrs = {};
>  
>      *phys_ptr = address;
>      *prot = 0;
> -
> -    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> -        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
> -        if (access_type == MMU_INST_FETCH) {
> -            /* Instruction fetches always use the MMU bank and the
> -             * transaction attribute determined by the fetch address,
> -             * regardless of CPU state. This is painful for QEMU
> -             * to handle, because it would mean we need to encode
> -             * into the mmu_idx not just the (user, negpri) information
> -             * for the current security state but also that for the
> -             * other security state, which would balloon the number
> -             * of mmu_idx values needed alarmingly.
> -             * Fortunately we can avoid this because it's not actually
> -             * possible to arbitrarily execute code from memory with
> -             * the wrong security attribute: it will always generate
> -             * an exception of some kind or another, apart from the
> -             * special case of an NS CPU executing an SG instruction
> -             * in S&NSC memory. So we always just fail the translation
> -             * here and sort things out in the exception handler
> -             * (including possibly emulating an SG instruction).
> -             */
> -            if (sattrs.ns != !secure) {
> -                *fsr = sattrs.nsc ? M_FAKE_FSR_NSC_EXEC : M_FAKE_FSR_SFAULT;
> -                return true;
> -            }
> -        } else {
> -            /* For data accesses we always use the MMU bank indicated
> -             * by the current CPU state, but the security attributes
> -             * might downgrade a secure access to nonsecure.
> -             */
> -            if (sattrs.ns) {
> -                txattrs->secure = false;
> -            } else if (!secure) {
> -                /* NS access to S memory must fault.
> -                 * Architecturally we should first check whether the
> -                 * MPU information for this address indicates that we
> -                 * are doing an unaligned access to Device memory, which
> -                 * should generate a UsageFault instead. QEMU does not
> -                 * currently check for that kind of unaligned access though.
> -                 * If we added it we would need to do so as a special case
> -                 * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
> -                 */
> -                *fsr = M_FAKE_FSR_SFAULT;
> -                return true;
> -            }
> -        }
> +    if (mregion) {
> +        *mregion = -1;
>      }
>  
>      /* Unlike the ARM ARM pseudocode, we don't need to check whether this
> @@ -9500,12 +9461,79 @@ static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
>          /* We don't need to look the attribute up in the MAIR0/MAIR1
>           * registers because that only tells us about cacheability.
>           */
> +        if (mregion) {
> +            *mregion = matchregion;
> +        }
>      }
>  
>      *fsr = 0x00d; /* Permission fault */
>      return !(*prot & (1 << access_type));
>  }
>  
> +
> +static bool get_phys_addr_pmsav8(CPUARMState *env, uint32_t address,
> +                                 MMUAccessType access_type, ARMMMUIdx mmu_idx,
> +                                 hwaddr *phys_ptr, MemTxAttrs *txattrs,
> +                                 int *prot, uint32_t *fsr)
> +{
> +    uint32_t secure = regime_is_secure(env, mmu_idx);
> +    V8M_SAttributes sattrs = {};
> +
> +    if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
> +        v8m_security_lookup(env, address, access_type, mmu_idx, &sattrs);
> +        if (access_type == MMU_INST_FETCH) {
> +            /* Instruction fetches always use the MMU bank and the
> +             * transaction attribute determined by the fetch address,
> +             * regardless of CPU state. This is painful for QEMU
> +             * to handle, because it would mean we need to encode
> +             * into the mmu_idx not just the (user, negpri) information
> +             * for the current security state but also that for the
> +             * other security state, which would balloon the number
> +             * of mmu_idx values needed alarmingly.
> +             * Fortunately we can avoid this because it's not actually
> +             * possible to arbitrarily execute code from memory with
> +             * the wrong security attribute: it will always generate
> +             * an exception of some kind or another, apart from the
> +             * special case of an NS CPU executing an SG instruction
> +             * in S&NSC memory. So we always just fail the translation
> +             * here and sort things out in the exception handler
> +             * (including possibly emulating an SG instruction).
> +             */
> +            if (sattrs.ns != !secure) {
> +                *fsr = sattrs.nsc ? M_FAKE_FSR_NSC_EXEC : M_FAKE_FSR_SFAULT;
> +                *phys_ptr = address;
> +                *prot = 0;
> +                return true;
> +            }
> +        } else {
> +            /* For data accesses we always use the MMU bank indicated
> +             * by the current CPU state, but the security attributes
> +             * might downgrade a secure access to nonsecure.
> +             */
> +            if (sattrs.ns) {
> +                txattrs->secure = false;
> +            } else if (!secure) {
> +                /* NS access to S memory must fault.
> +                 * Architecturally we should first check whether the
> +                 * MPU information for this address indicates that we
> +                 * are doing an unaligned access to Device memory, which
> +                 * should generate a UsageFault instead. QEMU does not
> +                 * currently check for that kind of unaligned access though.
> +                 * If we added it we would need to do so as a special case
> +                 * for M_FAKE_FSR_SFAULT in arm_v7m_cpu_do_interrupt().
> +                 */
> +                *fsr = M_FAKE_FSR_SFAULT;
> +                *phys_ptr = address;
> +                *prot = 0;
> +                return true;
> +            }
> +        }
> +    }
> +
> +    return pmsav8_mpu_lookup(env, address, access_type, mmu_idx, phys_ptr,
> +                             txattrs, prot, fsr, NULL);
> +}
> +
>  static bool get_phys_addr_pmsav5(CPUARMState *env, uint32_t address,
>                                   MMUAccessType access_type, ARMMMUIdx mmu_idx,
>                                   hwaddr *phys_ptr, int *prot, uint32_t *fsr)
> 
