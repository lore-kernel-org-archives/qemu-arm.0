Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1509500lfb;
        Mon, 6 Jun 2022 09:53:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0sYXdSsvejGAXE3E/o08+BgxjnK4Ws9uEbkn7KgqIWx1ap3TcdWr0EBHIsUb2hAyRCdKf
X-Received: by 2002:ad4:584c:0:b0:464:5904:998d with SMTP id de12-20020ad4584c000000b004645904998dmr28445367qvb.33.1654534385789;
        Mon, 06 Jun 2022 09:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654534385; cv=none;
        d=google.com; s=arc-20160816;
        b=hi8XINqXA8oyMpYEWEQDglmLWhNaaDoJQzC9Ru0mU32QaDqE0XrWY24qNV9oO23mIX
         vfBhsazLv+6c2NQaN+kzFwLooRJCFcKF6z1qZWn+oqPQen7bF/o+BQFWnAgQQ/MyF6lE
         U3gmJGUOS2S6S26Czs8mmoQ1T6RBJsRLhpsOHGtR5/Pqqxczsx5sR6GLFV8o3CqlMTBs
         Arje7dlVtty2YAHIyTnAQuoSu0GlitseFHmjLFDGEbJ6ogSPENhefdtyR1OAKq42gvRA
         jZYneY08hpG7xjoHjt/t/qMLfXxGdir8c48R43g8Jd0BHEHRd5J1t1E2SXBOckuo2MU7
         Vu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=PeOtu0quVFdyVjAjn2DCVRBOSifo6lPIoxr4xxyK+fA=;
        b=r2Naexk3wS2YZxfGmZPRB4hhLaMkwePmFbkllRkGT3Wf+ncSS5CMG7mzqJvAx8y1vC
         hQSPB8/c2dGeTpV0hmsBzwtreHe+QEfYz3L4E2SZXFbe6tMZfG3gdXSr0KdiIuK63XIO
         7ykLd8X1/p+GLAcEIuYi/tvhkBnZTZR0yA4A6TUWXVwEXWNpeT05BBEHeA6hlX6RThYH
         vXsO/wUT4o+ym/CdPyFR6FuHCfZpedMNYTioFXo4Rx2aMEfK7LHoSTHKw8ndsyof20di
         lQK1jBciVE+Q0gRek8puukuYie/uBHlIK9A6wWFAcvUF4cG/fK+4UoNoDFfcZw9+rUta
         8tfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XJymrdzn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q140-20020a37a792000000b006a69431a191si5392573qke.200.2022.06.06.09.53.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 09:53:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XJymrdzn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyFyS-0006Wq-KG
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 12:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyFwC-0003ND-UO
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:50:45 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:38839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyFw9-0006X2-C1
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:50:44 -0400
Received: by mail-yb1-xb32.google.com with SMTP id v22so26717592ybd.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 09:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PeOtu0quVFdyVjAjn2DCVRBOSifo6lPIoxr4xxyK+fA=;
 b=XJymrdznrmmg4WsEBcCmtHLXxoh2x1kajY0e9BVn6BZ+4tPPeGXXDOUl6gk6gglQOx
 Lr6MK/15Ns/tWCovx94vWa7GdDkRzN5wdMBuPBl05j6Raa66wK7a0bxCGrr/WGb2FAGt
 zreNeS4z0NYy6kyuJjn22BbfDC5oSU8GMF3BYXXvM2mh2AeR6v3ulyI21ANl+jjqxihh
 LY1Hntltc+a3x9FME/vQJwuRCjKlUflENjOMVpVe+gkAIfn+ecomfJSrP6njAvcZIHgE
 /lugJaUjmQKbItdFxKjee8GHzbBPM1hG/fpEv0KiioJFXr0cgsdhZA8ANLYX+qccYBS0
 Nbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PeOtu0quVFdyVjAjn2DCVRBOSifo6lPIoxr4xxyK+fA=;
 b=gpJEcxiA5EO5RwK8X2isrcj+zd3ACaBv/NKna2W1O6wQIqXt3KwN/0vymEINW4keG5
 D1zlogfT6cibFUtsdKid6Gym6vlnd/hhAk6k12BETDagcuvihikrAI6XwAcUSFRYvcwi
 FNCjvSvtZBx/nTrzmaOUGxdRAL5ct2CK4EHc+IaT+aM8SNf+Y6Y24tDP2yb0lR8E9Tvx
 7ZbFHnWUAmmxcnWXSL4yBbxgbTjEF8TgHyclSKYnB0rv3TskiPaOY+ONScnsmvvjyfwL
 P/dLiP20AkEINNuHmhzXHRHP/XnE+WWNwDsnQPyD0jGczN4nVdDqO0TSzTAxUDvUBdDQ
 VJyQ==
X-Gm-Message-State: AOAM531za4/YzeEW7k6ObETQhTyE/YlPCCguOfDukO8glVvpDKirASos
 FZYrYcFrKuPHhk8PZe/xYmFcecDT84JnhBBSTujbcQ==
X-Received: by 2002:a25:1bc3:0:b0:65d:46e8:6322 with SMTP id
 b186-20020a251bc3000000b0065d46e86322mr24761804ybb.140.1654534225239; Mon, 06
 Jun 2022 09:50:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-31-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 17:50:13 +0100
Message-ID: <CAFEAcA8JGWP5ZuRWnN-pitx5iyoyQwCjxchNX=G_AyD1OQwhrQ@mail.gmail.com>
Subject: Re: [PATCH 30/71] target/arm: Implement SMSTART, SMSTOP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xr3EgDFc6Kt8

On Thu, 2 Jun 2022 at 23:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These two instructions are aliases of MSR (immediate).
> Use the two helpers to properly implement svcr_write.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> +/* ResetSVEState */
> +void arm_reset_sve_state(CPUARMState *env)
> +{
> +    memset(env->vfp.zregs, 0, sizeof(env->vfp.zregs));
> +    memset(env->vfp.pregs, 0, sizeof(env->vfp.pregs));
> +    vfp_set_fpcr(env, 0x0800009f);
> +}

Would be helpful to have a brief comment reminding the reader
that this includes clearing FFR because QEMU keeps that in
pregs[16].

> +
> +void helper_set_pstate_sm(CPUARMState *env, uint32_t i)
> +{
> +    if (i == FIELD_EX64(env->svcr, SVCR, SM)) {
> +        return;
> +    }
> +    env->svcr ^= R_SVCR_SM_MASK;
> +    arm_reset_sve_state(env);
> +}
> +
> +void helper_set_pstate_za(CPUARMState *env, uint32_t i)
> +{
> +    if (i == FIELD_EX64(env->svcr, SVCR, ZA)) {
> +        return;
> +    }
> +    env->svcr ^= R_SVCR_ZA_MASK;
> +
> +    /*
> +     * ResetSMEState.
> +     *
> +     * SetPSTATE_ZA zeros on enable and disable.  It would appear that we
> +     * can zero this only on enable: while disabled, the storage is
> +     * inaccessible and the value does not matter.  We're not saving the
> +     * storage in vmstate when disabled either.
> +     */

Correct. You can drop the "It would appear" :-)

> +    if (i) {
> +        memset(env->zarray, 0, sizeof(env->zarray));
> +    }
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
