Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp1599071lfq;
        Mon, 11 Apr 2022 05:53:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkuH4PPwUC6FUNgc9P1NhunapIkxcVad2W59ywZBVo4nEXXCAtNzYhL5LjbeqYh0Q/T8PB
X-Received: by 2002:ac8:5a4a:0:b0:2e2:27e5:141b with SMTP id o10-20020ac85a4a000000b002e227e5141bmr25615738qta.661.1649681592704;
        Mon, 11 Apr 2022 05:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649681592; cv=none;
        d=google.com; s=arc-20160816;
        b=G4aLq0FZMRkiGVqdGRSnQ2ulhGVcgPYoKRl2UD0lzlmlRcvrKKdqMK/jMi8sCDW4f7
         14bHSvTqiR4RgKMLm49mJjhjIANTpigZYj3i1NxOr1CgtAn0BgmNiXO1pclIogBS+Pzv
         IszUiAtvxrvn7j1NUIBm/IBvZMpd+dIN6KV8ns2wipramHN+JzHu94j/ROe26Uouett7
         cCOchY7TP61Vlx/is+LDER667TMsFGUf3px03L7FgXii7ItI9+jIH4z7FTsVd/kLrG3k
         3OpoUhpqCLDNsrBmEUkZLx79C5VBWzg1ipBlWZtPpvzlG1ZsowsSxCXz8d+rxpiiBrDE
         A4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f9YlP9gMVhZXlztVtQ8f+n61sU3wzyo8SmdZuEe4WnM=;
        b=B62x8inmDUY8sB803A8cu0QC3HSd1XERARZmye9ulTjSgRxAn6TLRxzQ0N210T+FuY
         wCeHbwNau16qWs7YGw/JngzTJe2MsFxrNTeOLCFAzi8YKIa2qBRPSpPcmjJKibjKwx/G
         +8QFKBVALjH6LsgOWIQNgXOmRXhc5Yaj/k9z5e0zGkTjvIKiB8gJf1Q+Z5lQMi5TFmWB
         2RAhRiOkyQAuUDA/tfnkuXnIWY7IkxiFZUErRBFkN7DNWBQmevBppgPRE4HRhZoMuV3j
         3stS90RjinLJFtTWbyUYf2kcZfgA7bffRl0gAcNPleMAvzJ3FLq/ZQgmZadW5ze57nBQ
         evlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="o/pNq/bJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m8-20020ac807c8000000b002e1fbf3bf70si3629482qth.353.2022.04.11.05.53.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Apr 2022 05:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="o/pNq/bJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndtXc-0003jo-5W
	for alex.bennee@linaro.org; Mon, 11 Apr 2022 08:53:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtXR-0003j2-Vm
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:53:01 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:36605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndtXP-0001fo-Cy
 for qemu-arm@nongnu.org; Mon, 11 Apr 2022 08:53:01 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ebd70a4cf5so105032597b3.3
 for <qemu-arm@nongnu.org>; Mon, 11 Apr 2022 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f9YlP9gMVhZXlztVtQ8f+n61sU3wzyo8SmdZuEe4WnM=;
 b=o/pNq/bJOuzMwbKzxpLsXvb7EOKOCsc8PlujBRxazC1XZMPUthIoHuJXDEi5U0DHte
 ensrHpCHFvhpfjNBCiC8E4Qtmkw+s6RvK/btjecoVJnHn07Cmgf24Nr2gCwOjOFpwXXI
 met+0n/R6Y3MdmM7xs6Lw1tVed+RMsFAYzIorxiJj+bBa0mu1/+ZPTtVvskKU7DR1EFi
 Lm50q4tqmhwlNgGSqHWruRM1g5OXYNNf0NTHneuVF08xAPugYJwj2HATmJyhZElpFMKO
 qjcRnp7/x9C25RGyesxNyphbLWPhlN8qa/HwGFbv1VhQtP6FRV87vvAVE38u9M3tIpAi
 D3EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f9YlP9gMVhZXlztVtQ8f+n61sU3wzyo8SmdZuEe4WnM=;
 b=VjsDaNGF2t1vyzhySFkHuPLbdBplc6/TovcawSfHkWVO4L/kZVYwsM6wVsWSZ7oq4J
 yA0sXjF0KQ2wJdaFWOm081S5Q+9R2sl42yqcJ8tCEoYj391Jk9X8aMSOlDZhgBMvayL+
 LSaKq1IUxdxfk4laR3c3SCsm1v0qpBCnqrdTEtksgR6R3s8IHCxSOg7LHy6Lig2n+H14
 E0PUOlsW6PC780L4fxSgU5Hce3ymFSiIvckcZCjJBPMP0HK8nKOOXaaWf3ctBJ8JZG2y
 IwJfG/9u11uVE/SIjazAzaVPptCTg855LXDwVPs+rB0razOKy1hhn1rFI3VPgGjYbzHa
 2ukw==
X-Gm-Message-State: AOAM533iovWztDy/VUA9E3ryyJqZvemB/yJQHwmiN04v4SePUpkHXosv
 sSgawQjwHSf8+35yDKORanCxdLk65qxombfCSuoHPQ==
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr26302146ywb.257.1649681578109; Mon, 11
 Apr 2022 05:52:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220409000742.293691-1-richard.henderson@linaro.org>
 <20220409000742.293691-6-richard.henderson@linaro.org>
In-Reply-To: <20220409000742.293691-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 13:52:47 +0100
Message-ID: <CAFEAcA8voyvBj2ERYKweChAkHMj+OjJSzGkLrQECuxf68RXdow@mail.gmail.com>
Subject: Re: [PATCH 05/16] target/arm: Split out arm32_max_features
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ixFuFL20DJ8X

On Sat, 9 Apr 2022 at 01:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Share the code to set AArch32 max features so that we no
> longer have code drift between qemu{-system,}-{arm,aarch64}.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h |   2 +
>  target/arm/cpu64.c     |  51 +----------------
>  target/arm/cpu_tcg.c   | 121 ++++++++++++++++++++++-------------------
>  3 files changed, 70 insertions(+), 104 deletions(-)


> +/* Share AArch32 -cpu max features with AArch64. */
> +void arm32_max_features(ARMCPU *cpu)
> +{
> +    uint32_t t;
> +
> +    /* Break with true ARMv8 and add back old-style VFP short-vector support */
> +    t = cpu->isar.mvfr0;
> +    t = FIELD_DP32(t, MVFR0, FPSHVEC, 1);
> +    cpu->isar.mvfr0 = t;

So, we definitely want to enable short-vector support for
qemu-arm -cpu max, but I'm less convinced that we want to
enable it for qemu-system-arm -cpu max, and definitely don't
think we want to enable it for system-mode qemu-system-aarch64.
'max' for usermode has more of a flavour of "run as many binaries
as we can", especially since it's the default; 'max' for system
emulation mode is more "latest and greatest", which might imply
"some very old stuff is no longer available".

thanks
-- PMM
