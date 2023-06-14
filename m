Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp1006424ejb;
        Tue, 13 Jun 2023 23:31:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ75J4cz6LIT7pfX4eb1sJsB8D+p+3cDKyghRmuig/16rz7Kk3DAx4wnsL1SFAHnEGteBHE9
X-Received: by 2002:a05:622a:4d1:b0:3f7:ff3a:f878 with SMTP id q17-20020a05622a04d100b003f7ff3af878mr923590qtx.52.1686724317481;
        Tue, 13 Jun 2023 23:31:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686724317; cv=none;
        d=google.com; s=arc-20160816;
        b=YiyZoV3g1/m6Rb1UkXXpTptad//Fuw5eZvMUVxF3u1XIb4PMp4jkZmqju5ICFI9vY3
         LQNC1RLG4FJVYNbgiwG+kl9Dp8qyVgS1CypBFJVnCDfPE1z0cmBDbzDBA+t8hH1MpQ3D
         VP+lR8QF3rKDZNrhv/KzfufJcIsyziRUYJHklJ2NGY8WdZf2+M88WiC9MIpDtFEuWFo3
         5L44pS0NwrkoyweiPGNCdxfkyCumdZDm4X2YotQZv43OFdzmGDdHV+EPNiVOT2XNegoE
         AzfOw8xdsIz9WCNQZ5h10zW0GabX8jllY5m1SjrQhbhHwk0wExyGNPw+ccDLAXgZH9ol
         FVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:references:to:from
         :subject:cc:message-id:date:content-transfer-encoding:mime-version
         :dkim-signature;
        bh=OBt3bnhhx1Xjce0w0KL7iWrNgw5Htt4Y7dzhMZBjXnU=;
        b=TFFLBxk5ugvTrP2dCLJ8qyuZabyuzjpyXiTaGiapIwgDkIXJigQkBwP2OsrppN0Ndw
         +5YUW7V8+Q6eJwlLTbEaMLEqIsGzojlctpTVCmQ4xfBBsKfDVyXJ4c+uFGq+qF0mYLeL
         F1fuW9dS0UkcR0WTRTJuJEc3CIA8pIJaDBB5J+dl6BKyxcwI+9qECZHyXmHYHnG4aoRx
         bWUNYEQ/hIuP5r0nuQSZbvznOr9cVyDRTa+96bg2DZo6BByyjGodGhEWiwsU8OimSF7V
         vSFmAqBBhxbQLNLa9NMEIVXBM2i9TR0/WDpEJNd2wgyelLNM6Hg6CqlLs0Rs6hfN7k0e
         0jHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=fqYEsmDp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05622a038b00b003f38c9bd035si8271196qtx.782.2023.06.13.23.31.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 23:31:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=fqYEsmDp;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q9K2B-0005L8-N7; Wed, 14 Jun 2023 02:31:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1q9K2A-0005Km-Dj; Wed, 14 Jun 2023 02:31:10 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1q9K28-0005ZC-7n; Wed, 14 Jun 2023 02:31:10 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-53fbf2c42bfso4473465a12.3; 
 Tue, 13 Jun 2023 23:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686724265; x=1689316265;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OBt3bnhhx1Xjce0w0KL7iWrNgw5Htt4Y7dzhMZBjXnU=;
 b=fqYEsmDp3zjvNJHYBGgxX+gR7Jdo1EQsMEKvuqoy+fT5/dLlj/yqys5W5yQCzshrcd
 7yODPbJs80Qevv0QAoGdm6XtMstzn0/+bATO/ILqUOiucjwqjnpHZarItLUeWqZmaFna
 ujMW6wTHk0H9BqAsCMGOsIIyh4xyYdhqQGm+Q29XN0rForXRb4ypxWa7m9xw5peJOgai
 UUJSyTaNsUBQ2OTC9BB37pJbXwfeb26wnh/uH74US9WnnD2YXRAUTIn8kPwqxOs81kSf
 RqIDKHQ/ZjQp8BogRgACUty3eJFa5cjHzOkyju3n3zV6GKLpqyS5/KcOW0L2gQyMxpn7
 dbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686724265; x=1689316265;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OBt3bnhhx1Xjce0w0KL7iWrNgw5Htt4Y7dzhMZBjXnU=;
 b=LSIYQHFq3SZeKfXzgerhTqi1YbzUKqN0fEOFJ2C6aPX7XnAnLIP1Puadr0IN13dbhN
 OOHqqyqDObHSZlTgtITKkT/lHSGFBHMUgb623ya7538/2j1V2900dRXtt/I3RaE+RCtM
 3WwrWIxKejppC+Ljvi7MfJCNykioz7yYLBKu9ggA5+nktxupw7pHwxb+ZR0gHES8gqDx
 4i8f2Jowt+qa4wgktBR1oPN2QLQwwizXT2nDbjwOZJWIeIRXGgpqIso9wcMPwhJElsLW
 VsVRvQPzU/ecWU/rx6GIv36hmzSXYXU1VBwklsiX021ZhnpGoPcwJg6tHG/dcwZQw4AZ
 wEDw==
X-Gm-Message-State: AC+VfDw+xYz6TdJ2YAj+4ZgBH+d7SFGLSVoyWv6Mx9j2l6LSw8YSRrbM
 ZWheOepktjQxjm1aXxf6QfE=
X-Received: by 2002:a17:90a:ab12:b0:24d:f59a:d331 with SMTP id
 m18-20020a17090aab1200b0024df59ad331mr798905pjq.26.1686724264660; 
 Tue, 13 Jun 2023 23:31:04 -0700 (PDT)
Received: from localhost (14-203-144-223.static.tpgi.com.au. [14.203.144.223])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a17090ae00e00b00256bbfbabcfsm1892335pjy.48.2023.06.13.23.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 23:31:04 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jun 2023 16:30:58 +1000
Message-Id: <CTC5UJ3RY4ME.1UPZ2BDJUUCQ7@wheely>
Cc: <qemu-block@nongnu.org>, "Thomas Huth" <thuth@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-riscv@nongnu.org>, <qemu-arm@nongnu.org>,
 "Richard Henderson" <richard.henderson@linaro.org>, <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v3 4/9] target/ppc: Check for USER_ONLY definition
 instead of SOFTMMU one
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 <qemu-devel@nongnu.org>
X-Mailer: aerc 0.14.0
References: <20230613133347.82210-1-philmd@linaro.org>
 <20230613133347.82210-5-philmd@linaro.org>
In-Reply-To: <20230613133347.82210-5-philmd@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rE8dtRpixgRP

On Tue Jun 13, 2023 at 11:33 PM AEST, Philippe Mathieu-Daud=C3=A9 wrote:
> Since we *might* have user emulation with softmmu,
> replace the system emulation check by !user emulation one.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  target/ppc/cpu_init.c    | 20 ++++++++++----------
>  target/ppc/helper_regs.c |  6 ++----
>  2 files changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
> index 9f97222655..7bce421a7c 100644
> --- a/target/ppc/cpu_init.c
> +++ b/target/ppc/cpu_init.c
> @@ -5841,7 +5841,7 @@ POWERPC_FAMILY(970)(ObjectClass *oc, void *data)
>                      (1ull << MSR_PMM) |
>                      (1ull << MSR_RI);
>      pcc->mmu_model =3D POWERPC_MMU_64B;
> -#if defined(CONFIG_SOFTMMU)
> +#if !defined(CONFIG_USER_ONLY)
>      pcc->hash64_opts =3D &ppc_hash64_opts_basic;
>  #endif
>      pcc->excp_model =3D POWERPC_EXCP_970;
> @@ -5920,7 +5920,7 @@ POWERPC_FAMILY(POWER5P)(ObjectClass *oc, void *data=
)
>      pcc->lpcr_mask =3D LPCR_RMLS | LPCR_ILE | LPCR_LPES0 | LPCR_LPES1 |
>          LPCR_RMI | LPCR_HDICE;
>      pcc->mmu_model =3D POWERPC_MMU_2_03;
> -#if defined(CONFIG_SOFTMMU)
> +#if !defined(CONFIG_USER_ONLY)
>      pcc->hash64_opts =3D &ppc_hash64_opts_basic;
>      pcc->lrg_decr_bits =3D 32;
>  #endif
> @@ -6037,7 +6037,7 @@ POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
>          LPCR_LPES0 | LPCR_LPES1 | LPCR_HDICE;
>      pcc->lpcr_pm =3D LPCR_P7_PECE0 | LPCR_P7_PECE1 | LPCR_P7_PECE2;
>      pcc->mmu_model =3D POWERPC_MMU_2_06;
> -#if defined(CONFIG_SOFTMMU)
> +#if !defined(CONFIG_USER_ONLY)
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->lrg_decr_bits =3D 32;
>  #endif
> @@ -6181,7 +6181,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>      pcc->lpcr_pm =3D LPCR_P8_PECE0 | LPCR_P8_PECE1 | LPCR_P8_PECE2 |
>                     LPCR_P8_PECE3 | LPCR_P8_PECE4;
>      pcc->mmu_model =3D POWERPC_MMU_2_07;
> -#if defined(CONFIG_SOFTMMU)
> +#if !defined(CONFIG_USER_ONLY)
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->lrg_decr_bits =3D 32;
>      pcc->n_host_threads =3D 8;
> @@ -6197,7 +6197,7 @@ POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
>      pcc->l1_icache_size =3D 0x8000;
>  }
> =20
> -#ifdef CONFIG_SOFTMMU
> +#ifndef CONFIG_USER_ONLY
>  /*
>   * Radix pg sizes and AP encodings for dt node ibm,processor-radix-AP-en=
codings
>   * Encoded as array of int_32s in the form:
> @@ -6214,7 +6214,7 @@ static struct ppc_radix_page_info POWER9_radix_page=
_info =3D {
>          0x4000001e  /*  1G - enc: 0x2 */
>      }
>  };
> -#endif /* CONFIG_SOFTMMU */
> +#endif /* CONFIG_USER_ONLY */
> =20
>  static void init_proc_POWER9(CPUPPCState *env)
>  {
> @@ -6371,7 +6371,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>          LPCR_HEIC | LPCR_LPES0 | LPCR_HVICE | LPCR_HDICE;
>      pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
>      pcc->mmu_model =3D POWERPC_MMU_3_00;
> -#if defined(CONFIG_SOFTMMU)
> +#if !defined(CONFIG_USER_ONLY)
>      /* segment page size remain the same */
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->radix_page_info =3D &POWER9_radix_page_info;
> @@ -6389,7 +6389,7 @@ POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
>      pcc->l1_icache_size =3D 0x8000;
>  }
> =20
> -#ifdef CONFIG_SOFTMMU
> +#ifndef CONFIG_USER_ONLY
>  /*
>   * Radix pg sizes and AP encodings for dt node ibm,processor-radix-AP-en=
codings
>   * Encoded as array of int_32s in the form:
> @@ -6406,7 +6406,7 @@ static struct ppc_radix_page_info POWER10_radix_pag=
e_info =3D {
>          0x4000001e  /*  1G - enc: 0x2 */
>      }
>  };
> -#endif /* CONFIG_SOFTMMU */
> +#endif /* !CONFIG_USER_ONLY */
> =20
>  static void init_proc_POWER10(CPUPPCState *env)
>  {
> @@ -6547,7 +6547,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data=
)
> =20
>      pcc->lpcr_pm =3D LPCR_PDEE | LPCR_HDEE | LPCR_EEE | LPCR_DEE | LPCR_=
OEE;
>      pcc->mmu_model =3D POWERPC_MMU_3_00;
> -#if defined(CONFIG_SOFTMMU)
> +#if !defined(CONFIG_USER_ONLY)
>      /* segment page size remain the same */
>      pcc->hash64_opts =3D &ppc_hash64_opts_POWER7;
>      pcc->radix_page_info =3D &POWER10_radix_page_info;
> diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
> index bc7e9d7eda..e27f4a75a4 100644
> --- a/target/ppc/helper_regs.c
> +++ b/target/ppc/helper_regs.c
> @@ -310,7 +310,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong val=
ue, int alter_hv)
>      return excp;
>  }
> =20
> -#ifdef CONFIG_SOFTMMU
> +#ifndef CONFIG_USER_ONLY
>  void store_40x_sler(CPUPPCState *env, uint32_t val)
>  {
>      /* XXX: TO BE FIXED */
> @@ -320,9 +320,7 @@ void store_40x_sler(CPUPPCState *env, uint32_t val)
>      }
>      env->spr[SPR_405_SLER] =3D val;
>  }
> -#endif /* CONFIG_SOFTMMU */
> =20
> -#ifndef CONFIG_USER_ONLY
>  void check_tlb_flush(CPUPPCState *env, bool global)
>  {
>      CPUState *cs =3D env_cpu(env);
> @@ -341,7 +339,7 @@ void check_tlb_flush(CPUPPCState *env, bool global)
>          tlb_flush(cs);
>      }
>  }
> -#endif
> +#endif /* !CONFIG_USER_ONLY */
> =20
>  /**
>   * _spr_register
> --=20
> 2.38.1

