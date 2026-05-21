Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331D5CD4F3D
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 14:39:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ4Yd-0000Tx-EM; Thu, 21 May 2026 10:39:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4YF-0000La-AK
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:39:08 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ4YC-0000it-Me
 for qemu-arm@nongnu.org; Thu, 21 May 2026 10:39:06 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-651c366f7efso6528881d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 07:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779374343; cv=none;
 d=google.com; s=arc-20240605;
 b=OKmZna4H/b5AevGh18wZXEhvOfzdUUmz7YVNB0SiUmRKQAw0TGZhrCEEpg1WEi5MI2
 GYLyQjgTKbxfKOeg+oMZ3Md3wSFaALCX9XxdB2Z2TQ9YdOR/YFiO133v26eSZcBkSfQ7
 62HvKjdM/XburAHCG9qUAiYMsGe6yg3kezXfL5D15+USUvLRNAfzWd6YY03DshrSTVFE
 DuN6wxf3pKhRbAv+2Mngz6qqCOmlqmU/LJw1yU30RltZC29nOKzNEz8kgigiGUbqcAzV
 4zqhaKjYRunJLKnd9dFR4wZA5D0xyszWQhaFTPU6ymfvintkrWNGFPKD/+modbpqA1ag
 lJ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=OViE6hLzerBYdVb6X057GkDOGNqwUo94aWD03uPhf9Q=;
 fh=Gl4hmxUkMM3wfviE8ACyQbW5aibaD1qaPNFCKJrR2aQ=;
 b=acUf32k1/QP/5+7KcFfKCkAFMesglFx4EiWhgJz4aXPvVBHl7+8UEi4wgnX3OPA7qf
 +JBomoWONl4kt1QVVMZNPzF0joFdf1QAVj9C5SCpvMhCwjlHAeQnJA0DxhAFvBDy5GwO
 +XWrhqKK7V3ZvTXrtm34ustaOVyYNqzJN9Y0tFwhdiqYia+cqkUoiy3UPXaoaLph7HuL
 L5t6F3N0vMxmmUsQzIRg88tlObGO/4YvHTfR70uFpA+/S5yQGXEP/tDcRzshZvDV+u7N
 VUlnjkfKhUPoCN6T93hjrkjwovwzam85xKXhM+TjFdUqL2NchRmTuGWm5SpqPO7Wck6M
 4g4w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779374343; x=1779979143; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OViE6hLzerBYdVb6X057GkDOGNqwUo94aWD03uPhf9Q=;
 b=i5Y/UeAYaH8KDRev7OqypgqWcSG/VFSbt7BZMl1DX82VGIBCA7H2y8eIiZrgKhXu/X
 9Xt0s1zjohKo7dRzrNAD/zqWcLn5DgCCkFwSbHRJKBx0ESaiF9IiKiSr32A/0G5bhgcI
 ZYZu2vzND+emt38B/zVeRSQ9PPwT37Acpc3Mn3az1bRUj1HbsCUKDdId1WzhP/8ceQxz
 ixJ0nUSUKe8/0FV4WeXgZ9Nmvg3/EnmmwLA82jttkyX+5mjqE0XboVw2dQ339HhAS87i
 hGZ2gTqnyx3i3hE3ZMICY4ni+OUYjLoq6FNwWlSzusxJZPCEpFtmuGl2hbBmO8w4nnuE
 E0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779374343; x=1779979143;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OViE6hLzerBYdVb6X057GkDOGNqwUo94aWD03uPhf9Q=;
 b=bdp48yvTXAUj4o9JxpK46KQUiAat2Tywtzlyh12BH6P5DkSN2uPCGMUY3teIYIsg8c
 xcz7CzLyeklB/goJn0i7Z2uoxGKQsg20enmN0iP7SVJhNm0aEnRYKYUk3+3bxodt6s8F
 /Zc62To0pp6N89wibSZ4MTvvKfXGSZNjrp4sLe62TWGY0Bcbk0wMjJQWEOrh4HQpr8rV
 Kz0ZCJACmQ0sjBulFiaHJxgWtyYQ8H09ZGxT/X1lioIkPUgsBEiN1M9CoYz5pWgn5a7D
 XLG1Pn2AYt8z06+Y/ag0rzszubKm8yymR7kDRtnU6y2b67qSIVjrQinf2rU3BcTrPpUe
 iKdg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+lpZ9IzJSFW8jRpy+pr4ryX+7Wdqq32a5quhsAEXnF7Z2fk1CKJFEEtBYDGammvPma+8RebZDaBw==@nongnu.org
X-Gm-Message-State: AOJu0YyEYIWY0lO4ToqToDaKdnMzW5rd0yfRkzSz9WzmlE3SzffzOrvY
 UTK/ruZ0Qmd0Chop0oYVJKfYBADczjwRst+gr/FXE8tZPQiAVImqvzA5njZs6OdjpDOvoNPmb4r
 nx+9w0cMcKb1xn1d/EIXsRTAtajauiQKIiqlnGubr9g==
X-Gm-Gg: Acq92OF3tOR1fxUagZh1r4WkHYrV6M3sIi1r+0FSXzmtkec+nPlCaEHxfWnqiIaALn8
 /DjFWeJLai9+gItMqAeaflwdytY3Xhmk46VVLutuzgt06Ll8j8pDsPbymx1g036NaREpBY4Kwoi
 igZ9fQn1lEHo5myu7V4xlh+YvKK4lZyxsoX5DD9D6uFLqEd0kodQQLq36tUxfPSjHzsEk8wXNb+
 tUXRDz9W1l0YdsuBMdqTV8dL4QEaArCWGjF9ZwgaG2LOoVywKSfeqLEn046rnDFBHlpUKAHm2ir
 wkHQdH44LRMf6tQPMEWiTimE4vVAyvYupPgVcSAHZYUQTQyfLbN7yBKUqExsioCY6cQ=
X-Received: by 2002:a05:690e:140d:b0:653:1c2a:94a5 with SMTP id
 956f58d0204a3-65eadf950b1mr2596845d50.8.1779374343038; Thu, 21 May 2026
 07:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-13-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 15:38:51 +0100
X-Gm-Features: AVHnY4IiczqvFD5L1yp-gv1dRlBSSTV1zwNOkTkKL0Djh5iLtNmqgE-XtFVKf7U
Message-ID: <CAFEAcA-t2Yh9YQGPmByWeVd11+L57mE-X=ZHLw6PhNBRDNYxAw@mail.gmail.com>
Subject: Re: [PATCH v6 12/64] target/arm: Add FPMR_EL to TBFLAGS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 20 May 2026 at 19:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Prepare to perform access checks for direct and
> indirect uses of FPMR.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h               |  1 +
>  target/arm/tcg/translate.h     |  2 ++
>  target/arm/tcg/hflags.c        | 41 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c |  1 +
>  4 files changed, 45 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c114510446..9e637c1d80 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -2567,6 +2567,7 @@ FIELD(TBFLAG_A64, ZT0EXC_EL, 39, 2)
>  FIELD(TBFLAG_A64, GCS_EN, 41, 1)
>  FIELD(TBFLAG_A64, GCS_RVCEN, 42, 1)
>  FIELD(TBFLAG_A64, GCSSTR_EL, 43, 2)
> +FIELD(TBFLAG_A64, FPMR_EL, 45, 2)
>
>  /*
>   * Helpers for using the above. Note that only the A64 accessors use
> diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
> index 77fdc5f3a1..1648c2c96f 100644
> --- a/target/arm/tcg/translate.h
> +++ b/target/arm/tcg/translate.h
> @@ -199,6 +199,8 @@ typedef struct DisasContext {
>      uint8_t gm_blocksize;
>      /* True if the current insn_start has been updated. */
>      bool insn_start_updated;
> +    /* FMPR exception EL or 0 if enabled. */

"FPMR"


> +/*
> + * Return the exception level to which exceptions should be taken for FPMR.
> + * C.f. the ARM pseudocode function CheckFPMREnabled.

This pseudocode reference is a bit misleading, because that function
is for the indirect-access checks, which UNDEF to the preferred
exception level, but here we're returning the EL to use for a
trap on direct FPMR access.

We do end up mentioning that later in fpmr_access_check(),
but I think it would be useful also to say this in this
comment and to also refer the reader to the access
pseudocode for the FPMR register. We could also mention
that this only deals with the FPMR trap bits and that
generic "FP must be enabled" traps will be checked separately.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

