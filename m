Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43FACD343F
	for <qemu-arm@archiver.kernel.org>; Fri, 15 May 2026 14:25:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNtSz-0004aO-Le; Fri, 15 May 2026 10:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtSe-0004OZ-Dp
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:24:23 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1wNtSa-0008WK-Lf
 for qemu-arm@nongnu.org; Fri, 15 May 2026 10:24:19 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-488a9033b2cso80848375e9.2
 for <qemu-arm@nongnu.org>; Fri, 15 May 2026 07:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778855054; cv=none;
 d=google.com; s=arc-20240605;
 b=Gl2ak/mHUQczpndyuo2VFeoFHEWqkH3aQiTsWGE/TjlnHYk15e9ULVG1yPj/1VZ9Vk
 ecMiN4nuZJlezOfjOh8AHlP490PhKX6DXLQZpQOk8zlJ4Kk8CjGhpOQhkG+Y5MTKV6eP
 AzPVsphsqY4OW1jdZlI2VjGZ8OzIXILJTkGFLqLZzMiNFHVEmVxQTJE2yb2UsJaZYu/p
 He1kdHoqsrVC91MDfhDoQrtkS2okIDFy6wVsMhiKA384Rwq6uSwa3mz6t1vT2tA+LA/f
 c60eKtVx/AQ3P5jKCXdkoFHOpU3lJZikQIFtLu377qVohh4F5a6gyIoinpQ536683U2n
 PEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=NBvzPX5JQzQqn/Diim4ka1qTU1UwKGkci3Lx7p+HPtw=;
 fh=cNo61cPP8TH8U37SBFZRyWOQ35efn+NF1BKJ9aJS58I=;
 b=FdCmbkOnRTTYW9bnSuTDham3hZfsrCPJZN6uHg7iveuQ0XB2P1fieHzWveFOmQcxL0
 YR2NTTPAsoX/NaEd5eDAMIWEIHnBJ7t95QccjBPkuh55+H158bfK4LWdbVhLa1tLRzw4
 8TBF/cELDFUuLjqgikiHe7rO9+gHTjs9IeX7ZBO6YZfOAjFfC9R6w02KY2TCp8dqtaFM
 y1lz7IWYBjClj61yq7tPYjMJsEb6OG9Zv/HxBTyHWyQiWDGwpZ4tXT849jWOfJ9VW9j7
 OUbAobgFuYEy1/QnXVpGa9r/5mijqJrlNrkPTFIcu+W2pEH+Lu4k9Lta/k7Rbt6zMWCk
 mwkQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778855054; x=1779459854; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBvzPX5JQzQqn/Diim4ka1qTU1UwKGkci3Lx7p+HPtw=;
 b=Tmxjh8649qz+3BpBnSB8Jb/A60pRCvlByDncCdqWQbY4hZb2TGxI0zh0WR0rJ+A4QP
 Ka0vU823VB1qW7LVbcrH3YIcMhUmLr0orIJi19MBPogJEuV282nuO0AoklfmTAB9Hylr
 ZVDNFNZM6pGo4bBO2wbnpr+tFyPmcnC8CwCvbotnBTH8HIAsUy8bQAllE01F3SPIsByK
 sCE6x3IEBxviFVaZNEtnDYlj5+TIiiQJy5OhxHjwL3cGLSPyeaggmLTb8v8rG8oJ/YXq
 OeXyN8s/SRHu/nvDTCWY+bMdDnQZBjGXBrmdVOotPwbRYGsOMoGOdos0WFky271o19MI
 8j/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778855054; x=1779459854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NBvzPX5JQzQqn/Diim4ka1qTU1UwKGkci3Lx7p+HPtw=;
 b=dQALSOKXzpLOFcmAXmjd3kzngrEMoKW83WTSrmWcPi15z0leg/wB3ip9AxiOLuONwe
 kl6l4pMJUbUE1z2Tm902BPWgb/cPRRZLyLJ5krmNBeH/xcg7W+MPUc6FCpmHglt9Nlrc
 Gt4FISvxGufqm61JoKfpC8IfC38uJuMckbNN35GI6L1GKQl9KXn9hYSNj/diVdelgaQ2
 J0fFGjwH4w+b73cOKNPXCGPkLZIPgN1cFnFfVbWo/uaEAmYQjXLcLuNewFax5mn3usIN
 K6vBgy75QLrq3znpsWqE90vu9tM77bwx6o9595kw2qOZGlDEwCnQl8EJ8kIpvRFZxhwl
 vXxQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ//VbQtLjjJaRJ0iP7EziHyRHEqF4vjQAyAa93+XTh11xt+CZotjyiE8kjgqIF9bADnYVYuxb/WmA==@nongnu.org
X-Gm-Message-State: AOJu0YyXVuinQiJzIAZSB8Vw7q7GR1aj5ueTkINYsWpCYz3CXewOLVds
 XCyBW0jjYx3po0jMwWiZ2THjibIlsemi975usjiwABBI+TuUkSk6VcmWjAc5dMfDPXtBPPdaGYs
 7wI/5x+qz+9208zYacvtNLeoxCzL5asi1352OJDacwg==
X-Gm-Gg: Acq92OGYIphV95QuutTbZRTNwHnLo9f7DjWBeaECzLwpM3uq/S2d09feBtE0vznq8wV
 jSEgHYSLwQitolkoH/PqH2dpbExnQcFqDvTD5UEYSFUQmiDPCtp4+WFvpMTYxwcfZOEu57KDGGH
 ZNYoG7U90MFNho5aB8UO0BGi64V9CG4Oo/+YItmXp+RUjXeE3pNpfSRi+6G5yE5n0tDXgkgnP10
 sKe/6rscqDx5sDL6d+lZCZOnYoSxpG9W8mzWy7EHYPr7IJee+NyV/fiYYu0pOlOCve7nV3B0rgM
 hjG6m1PPZx658WiOgs0qLnCdG66aHMJG30mO6a+8WQEjeVbmen7oer8y8uEg
X-Received: by 2002:a05:600c:1505:b0:48f:ed68:6760 with SMTP id
 5b1f17b1804b1-48fed6867famr18430725e9.29.1778855053728; Fri, 15 May 2026
 07:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260515141032.3271-1-philmd@linaro.org>
 <20260515141032.3271-12-philmd@linaro.org>
In-Reply-To: <20260515141032.3271-12-philmd@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 15 May 2026 17:23:46 +0300
X-Gm-Features: AVHnY4KXrEtl6HQ-aLWpONcnBxT2pz0ORYtoERYZlCH_Z422Q5gCY26vKEdIJ1g
Message-ID: <CAAjaMXY0Fa-POojxwcBjWjJwOL1NeTOHo+L+OjJN1UJUnFFU=Q@mail.gmail.com>
Subject: Re: [PATCH v6 11/20] target/arm: Rename Aarch64-specific methods
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Joel Stanley <joel@jms.id.au>, Kane Chen <kane_chen@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, 
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, May 15, 2026 at 5:11=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>  target/arm/internals.h   |  8 ++++----
>  target/arm/cpu.c         |  8 ++++----
>  target/arm/cpu32-stubs.c |  8 ++++----
>  target/arm/cpu64.c       | 12 ++++++------
>  4 files changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 3edc15c7b4a..00830b17248 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1750,10 +1750,10 @@ int aarch64_gdb_get_tag_ctl_reg(CPUState *cs, GBy=
teArray *buf, int reg);
>  int aarch64_gdb_set_tag_ctl_reg(CPUState *cs, uint8_t *buf, int reg);
>  int aarch64_gdb_get_tls_reg(CPUState *cs, GByteArray *buf, int reg);
>  int aarch64_gdb_set_tls_reg(CPUState *cs, uint8_t *buf, int reg);
> -void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
> -void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
> -void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
> -void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
> +void aarch64_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
> +void aarch64_cpu_sme_finalize(ARMCPU *cpu, Error **errp);
> +void aarch64_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
> +void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp);
>  void aarch64_max_tcg_initfn(Object *obj);
>  void aarch64_add_pauth_properties(Object *obj);
>  void aarch64_add_sve_properties(Object *obj);
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 76f5909e902..31e1fd6cd51 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1707,25 +1707,25 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error=
 **errp)
>      Error *local_err =3D NULL;
>
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        arm_cpu_sve_finalize(cpu, &local_err);
> +        aarch64_cpu_sve_finalize(cpu, &local_err);
>          if (local_err !=3D NULL) {
>              error_propagate(errp, local_err);
>              return;
>          }
>
> -        arm_cpu_sme_finalize(cpu, &local_err);
> +        aarch64_cpu_sme_finalize(cpu, &local_err);
>          if (local_err !=3D NULL) {
>              error_propagate(errp, local_err);
>              return;
>          }
>
> -        arm_cpu_pauth_finalize(cpu, &local_err);
> +        aarch64_cpu_pauth_finalize(cpu, &local_err);
>          if (local_err !=3D NULL) {
>              error_propagate(errp, local_err);
>              return;
>          }
>
> -        arm_cpu_lpa2_finalize(cpu, &local_err);
> +        aarch64_cpu_lpa2_finalize(cpu, &local_err);
>          if (local_err !=3D NULL) {
>              error_propagate(errp, local_err);
>              return;
> diff --git a/target/arm/cpu32-stubs.c b/target/arm/cpu32-stubs.c
> index 9e50bb1b0b5..d42b1a5d6a6 100644
> --- a/target/arm/cpu32-stubs.c
> +++ b/target/arm/cpu32-stubs.c
> @@ -4,22 +4,22 @@
>  #include "target/arm/cpu.h"
>  #include "target/arm/internals.h"
>
> -void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
>  {
>      g_assert_not_reached();
>  }
>
> -void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>  {
>      g_assert_not_reached();
>  }
>
> -void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
>  {
>      g_assert_not_reached();
>  }
>
> -void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
>  {
>      g_assert_not_reached();
>  }
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index a93ad2da5ad..b38a78aac3f 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -60,7 +60,7 @@ int get_sysreg_idx(ARMSysRegs sysreg)
>
>  #undef DEF
>
> -void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>  {
>      /*
>       * If any vector lengths are explicitly enabled with sve<N> properti=
es,
> @@ -121,7 +121,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>               * Disable all SVE extensions as well. Note that some ZFR0
>               * fields are used also by SME so must not be wiped in
>               * an SME-no-SVE config. We will clear the rest in
> -             * arm_cpu_sme_finalize() if necessary.
> +             * aarch_cpu_sme_finalize() if necessary.
>               */
>              FIELD_DP64_IDREG(&cpu->isar, ID_AA64ZFR0, F64MM, 0);
>              FIELD_DP64_IDREG(&cpu->isar, ID_AA64ZFR0, F32MM, 0);
> @@ -336,7 +336,7 @@ static void cpu_arm_set_sve(Object *obj, bool value, =
Error **errp)
>      FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, SVE, value);
>  }
>
> -void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
>  {
>      uint32_t vq_map =3D cpu->sme_vq.map;
>      uint32_t vq_init =3D cpu->sme_vq.init;
> @@ -408,7 +408,7 @@ static void cpu_arm_set_sme(Object *obj, bool value, =
Error **errp)
>      /*
>       * For now, write 0 for "off" and 1 for "on" into the PFR1 field.
>       * We will correct this value to report the right SME
> -     * level (SME vs SME2) in arm_cpu_sme_finalize() later.
> +     * level (SME vs SME2) in aarch_cpu_sme_finalize() later.
>       */
>      FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR1, SME, value);
>  }
> @@ -548,7 +548,7 @@ void aarch64_add_sme_properties(Object *obj)
>  #endif
>  }
>
> -void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
>  {
>      ARMPauthFeature features =3D cpu_isar_feature(pauth_feature, cpu);
>      ARMISARegisters *isar =3D &cpu->isar;
> @@ -666,7 +666,7 @@ void aarch64_add_pauth_properties(Object *obj)
>      }
>  }
>
> -void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
>  {
>      uint64_t t;
>
> --
> 2.53.0
>

