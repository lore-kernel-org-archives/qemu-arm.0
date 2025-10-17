Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0966ACCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:00:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9k3l-0007g0-Ss; Fri, 17 Oct 2025 08:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9k3j-0007fn-Ff
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:59:51 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v9k3d-0002ZL-3V
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 08:59:51 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-7815092cd06so23442317b3.2
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 05:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760705979; x=1761310779; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QZaAGWVd+9bKOBG/oLPZuctzC2f8axpn92iPpi5vdSg=;
 b=im0s9hzLgBDTCvtM0L96M3TVr7VzqA25prkazf3GyEYN4BejtPaUaKA0OGFF+vZTwf
 XoHyzq3o6F82bblL+K/NR36LgOY8U2iMKLd+mct5BGGTOj7UKsNP2gHw44JlSrbxbPIY
 dPDmO4trU6YF06VICqhwBIIJ2ioikDeMMVorlUrwKqdB2rUrTxC7k+zKm/cl830WGWIw
 Q93Dm7jW2m/AoOJYWbhghNwmQSacmadT2XxbmoS/o8zB0mXI/FAx6IhATTVnn8S4J0pU
 50KNI5GR6sODYkbYFqTUleyvrSpO4RRINVq35k+4rmqUZEpN1JNir/awB5W2rB9C9NOJ
 hbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760705979; x=1761310779;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QZaAGWVd+9bKOBG/oLPZuctzC2f8axpn92iPpi5vdSg=;
 b=KZnn5zVWhjsGZohHdPheYTXG2tb46VUihii6VrdDycFW4NNSlQMfMZcSPuKnmndQhx
 9c1UIXYawOIGihCuPFrPXs/RSzIgR7T96ybdDWsszQl70z0J1AhokijlrGGuFO3+LQF3
 F93DjHH9nX/bF4R4M6KENl9ktxmD9K0Ev9FZAK8R30AxX56xVNBPdtUOmnWgH4Ckiyfc
 iEz64uurTh6OdOcDRi0RlxxakiGsGyo8x8VZbIxm3TdnfeWCfc5/uFvqjBdbngjknn/O
 EHus0tLGvJyz9Gr6vdfKmC6gtUownDGTfARrHtXL4wzx4rWoeDt+GRJASl8vbU2a8BAr
 CMrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyftEpYWLS2ulmvzPdkRjsKxRKoPlDek4HPQ6qNXTORiIjvDUT49faBbF61aWX5tyJTZ2/grH27w==@nongnu.org
X-Gm-Message-State: AOJu0YwAhv9X79wBp24FURntbIZ8j5TT2+H+Ulbarub18YkUm01Ko6rV
 rkVfzdwL62OeMFtC6YqQzNVHrNCApL66pOtCcXEjnHzhLulgv9jpF1wpJyqVHd3zO9wa5Q//uxx
 YCdYrf5uflITbYShvH4MzZud7flY7u5n+KHg93Xc27AIYGJOVz/8v
X-Gm-Gg: ASbGncvPimI+ZzTrGjhwt5s+ppCQ1EQ4w2l5w8aulBzmka/cWXaXo6rvDP3lzQZCpZ3
 frNEtKsr3YLtO5FSqnTEaXkmn9ep9vWRlrv6hYgWxS7/x073m4oDmuf1TEIADvhHzt906iGDGY0
 GPS/Q6mwJbUIhYA779uJd57DiVcbQg9ebufHiGCGpXk/2PVQFzPukdyrM8MncbZpm7+hnvG2yp8
 Qn3p/c+mCkArsxK1/9929EJiWX0fM516UA+bd4T1u0BgydK9ArzoYgl3WSEuxl2raWUIt30
X-Google-Smtp-Source: AGHT+IFsp+KjJeef6nrK6RkNL7gx8edXZj5RZVdTLVRwu0i2zC6D6607prPMcRy6q3actXqDWA3spW9/yJXsxcUyw70=
X-Received: by 2002:a05:690e:4294:10b0:63c:daf9:bf21 with SMTP id
 956f58d0204a3-63e1619a19cmr2699893d50.24.1760705979239; Fri, 17 Oct 2025
 05:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20251014200718.422022-1-richard.henderson@linaro.org>
 <20251014200718.422022-5-richard.henderson@linaro.org>
In-Reply-To: <20251014200718.422022-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Oct 2025 13:59:26 +0100
X-Gm-Features: AS18NWD2On5eeSo4suMhyMg6ES0BJX9FTt4eqzEIRBuAnFaqjNSQ_nF1rT5ESso
Message-ID: <CAFEAcA_YRU8F02wM2z_DvR-0hryUYEZYA99fy1c+H3M6xzqN0Q@mail.gmail.com>
Subject: Re: [PATCH v2 04/37] target/arm: Asserts for ARM_CP_128BIT in
 define_one_arm_cp_reg
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Tue, 14 Oct 2025 at 21:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> 128-bit registers are aarch64 only; disallow non-zero reset values.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8c0b8889db..3b06704963 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7805,6 +7805,22 @@ void define_one_arm_cp_reg(ARMCPU *cpu, const ARMCPRegInfo *r)
>      assert(r->state == ARM_CP_STATE_AA32 || !(r->type & ARM_CP_64BIT));
>      /* AArch32 64-bit registers have only CRm and Opc1 fields. */
>      assert(!(r->type & ARM_CP_64BIT) || !(r->opc2 || r->crn));
> +    if (r->type & ARM_CP_128BIT) {
> +        /*
> +         * Only AArch64 regs are 128-bit.  There is usually an AArch32 64-bit
> +         * register aliasing the low half, which must be defined separately due
> +         * to encoding conflicts above.
> +         */
> +        assert(r->state == ARM_CP_STATE_AA64);
> +        /*
> +         * All 128-bit regs are UNKNOWN at reset, so there's no need
> +         * for either resetvalue or resetfn.  For those EL2 registers
> +         * that become CONST RES0 for EL3 with EL2 disabled, we allow
> +         * ARM_CP_CONST, but only with value 0.

We might mention that QEMU chooses to always zero the regs
at reset.

> +         */
> +        assert(r->resetvalue == 0);
> +        assert(r->resetfn == NULL);


I assume that not permitting a non-zero reset value is just
"we don't need this yet, so don't bother writing code for it" ?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

