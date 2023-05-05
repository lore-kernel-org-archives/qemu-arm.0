Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp374760ejq;
        Fri, 5 May 2023 05:21:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5X6QTfdFEKQyQNSscmxoLiaCnyaoWDd3RGwaPQXP69Zok9M+4CpxIQHCpXaZQKBGcHyit7
X-Received: by 2002:a05:6214:21aa:b0:5b9:ff75:a011 with SMTP id t10-20020a05621421aa00b005b9ff75a011mr1585987qvc.48.1683289288922;
        Fri, 05 May 2023 05:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683289288; cv=none;
        d=google.com; s=arc-20160816;
        b=WkygMHWUA/qLGxCZa1B1O7p2IVoNjig9GWtJ14Gf1CpJVOpVACeJMe652cN+2SZMnN
         Hui3FvMOY5yXBYKnpN5t04oLMGfSTYCyCB+iqpGyDEezqNSSU0z4UrJOEclF/dFK4K9d
         ZQ8zdJBWghsDk4ViBcgar0MHKK+JFuOmPVkNT+6HzHybX96KpRJUkTIk1qHP4CvaSqtM
         ilNEXwrD6E3z/SHttxDMKGhOEM9p8Pa9k2n7pVNzGrhFiD56ccZWADbPgk4Cz6E2P9s/
         Kn/Ft9RACN56FarL4t02FZ5Yb84c8+3Y5TgJaXu8u10c6OF5u203+l0luU3e+KfsCymz
         MdwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KvoXJYNvX9n9momKDN8qbvYhgMMWdb947PQJo5DOJ+o=;
        b=qGXCipF+vB1jUI7Sw2TydZ+wBztl/mHeNFW14ZmEEZ/I9IkmjNBYAmN6nN8uQCBe4s
         ZSkpKLdUGWYr+ZcWfL5rlUWu6WNJHtUc9TOamI6gtORVtg6XfN4B8Z5661BDFsi3LfWi
         u5eDZ+IXMvC5ruXcvLax0Dv56TJ34iI2g/gQltqQy4zCCHNIWqhFfGs/lCV6Jhl9F84l
         marBZ810peZdppxzU+KkbTUsQyZavyK+Xvm5YT6WK2FHGZYF+vb1QClS91kSY1DB41l1
         hNh0e1Owx3sAxmM/HSj4hAVcPpdOA/oskLrB3mC+MQFzTv6ZZoI7UI7i+UhrE0mhzyji
         Skjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q6B0xKlY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d1-20020a37c401000000b0074a29c9d8basi615875qki.443.2023.05.05.05.21.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:21:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q6B0xKlY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuQm-0004RK-Kd; Fri, 05 May 2023 08:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuQk-0004Qv-77
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:20:58 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuQi-0000V4-Pi
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:20:57 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bcae898b2so2963759a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289255; x=1685881255;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KvoXJYNvX9n9momKDN8qbvYhgMMWdb947PQJo5DOJ+o=;
 b=Q6B0xKlY4mUHfgbC6MZuNVgV4FbsXVKxSG95DmrkJqiahUIoPCWDeB/SoqkG56jiYT
 Qpcu2xmmo+NorRlVB65ly5BVVFD3bQ3hf/Y8e/fTy3fUoxp16srmbiQ2+lkLQHFb6YdT
 0Z7lSQ96bd5u2ZyjbFo+YWmgjrzDtrRhY+I1eaX49YGtH6KT51jL/kLD4P23PSg7D4xd
 S2ou5OxtT1H/1reLZxutnLluE5T18bBAIuAPWtV4VLCuDJiEscuAzwY2SKCcOoyteN33
 85MceeZXVbQ2i14qn9Uj/+lb5eBNEDWOQpR33O7jZVaG7e2F2j47QAHMw7XJCbtVrHRR
 YtqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289255; x=1685881255;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KvoXJYNvX9n9momKDN8qbvYhgMMWdb947PQJo5DOJ+o=;
 b=WR/USONQsh+0Kz30cehWQTY3I5Tco8MncD8xmwqButNrvrdiHOziIuYpJ53CyAqOnG
 vxPIzvYF1Mp2j0jcnNrCTHxAt46D0Xm/oJaq0HLXD3rC7OTfSF+xDUuMHlXkZUKT694y
 aqLONuavfY+t0T6lkOmkeCqcZZVUVv4u2cpECg0M/W8N6i3ugk2cH6q2O/MftiWPWmdS
 FBwt7xVsmzRvmmRffNrudP8URX4EZfcMkxt0/PoNTikXIdfPxXaNiUdtzbB0G9ksI4go
 srCP0x2gJCO1UkKbcRZq4/fhSwPf8BShjdiZ9seifQb+zKz4bwaOsKX1LfG5tXBXfiAt
 ISqg==
X-Gm-Message-State: AC+VfDzEFLow1LwDTTgHamabExfNWGuFKqFVCJtP/id3LFEoNaTI+20a
 tQb1PyxQIrmsbfdxewF5Q3j5uIrYWzw0Vs6+UFArSQ==
X-Received: by 2002:aa7:dc01:0:b0:506:b2a3:a8cd with SMTP id
 b1-20020aa7dc01000000b00506b2a3a8cdmr1053831edu.40.1683289255339; Fri, 05 May
 2023 05:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-32-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:20:44 +0100
Message-ID: <CAFEAcA-kjRRTWNGaHV7joa-Snb33RoBwwpV+LPLW43_MXsXFrg@mail.gmail.com>
Subject: Re: [PATCH v4 31/57] tcg/sparc64: Rename tcg_out_movi_imm13 to
 tcg_out_movi_s13
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: BpqVyy9UGGgd

On Wed, 3 May 2023 at 08:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize that the constant is signed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Commit message says we're just doing a rename, but...

> @@ -425,15 +425,15 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>      tcg_target_long hi, lo = (int32_t)arg;
>      tcg_target_long test, lsb;
>
> -    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
> -    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
> -        tcg_out_movi_imm32(s, ret, arg);
> +    /* A 13-bit constant sign-extended to 64-bits.  */
> +    if (check_fit_tl(arg, 13)) {
> +        tcg_out_movi_s13(s, ret, arg);
>          return;
>      }
>
> -    /* A 13-bit constant sign-extended to 64-bits.  */
> -    if (check_fit_tl(arg, 13)) {
> -        tcg_out_movi_imm13(s, ret, arg);
> +    /* A 32-bit constant, or 32-bit zero-extended to 64-bits.  */
> +    if (type == TCG_TYPE_I32 || arg == (uint32_t)arg) {
> +        tcg_out_movi_imm32(s, ret, arg);
>          return;
>      }

...the commit has other code changes. Should these be in some
other patch ?

thanks
-- PMM
