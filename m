Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp1469901lft;
        Tue, 21 Jun 2022 13:08:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tq3q7BZLcL8pNT4AJ+ILIE/ATlKREALiBXgdRF17Zu0hY2Dz+rD4lK3oE9yq/sl2gYXVAz
X-Received: by 2002:a05:620a:294e:b0:6a7:750b:abf8 with SMTP id n14-20020a05620a294e00b006a7750babf8mr20395188qkp.513.1655842132558;
        Tue, 21 Jun 2022 13:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655842132; cv=none;
        d=google.com; s=arc-20160816;
        b=D5LTnB+7O7rBG17jcVF84BZZ8Km1dtTvns3g60QAeh8U7hSftCufvvuwzEXaMeoHAz
         L0aZlkodeyzcLJkyTGRM/h28SW+lFUUNw9LyJo3D9Whpvi3LeMV1pgmT5j9ZSskHwtLX
         kVzJ1htxWZ5ASpQpWYUCMjlqZ5jF5SsiMYSs2PuSjUyHLS7gzvvBz+B1o4Jsxcl3WdmV
         79xZB1tnEsMukxqubldQowuEqjb7pqMtB91+IEuzpnn7tnscNHj1QlVtWL+5cqKxX5wM
         4YajoHQwVR2Rdk4W1FO7+HxC4kKi7+PoYbX17ohhCRWNEW2Wn5l3pJBoD9UkYtBZdMW3
         gKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=U9snTh4mitA+bB7L3MiFboKsnqCFfA5OZFX+Ply9wjw=;
        b=tTT2lcs/Pwo25aGT9hW71M8zjlY30IJ8c6spoM4EyFAnJS+tuczx3cbg3pW9W9JHh9
         Juh2ybzRyPVu/rda9rQAeyADmsoL/zITYjW4PifiV2HlggeOtbW4kWUxN4F7rn5Q/abd
         h+H9X2vyQhFePkt2NJsn3U7kloeolQeaMfv9vM5HuQvoojZtBdx0H8OVLgcI83mQf6mJ
         uVHv5lYyHf5/YbaDhLF4Lc2hE+9AVD8aErbA2J6BuViiUWUotW6XYStzL/p54K3Hz+E2
         FPWlySl0hdcJA9aOD9unHKNzhNMGJ6WtaUPkU3pIwzsOE+791gZ5cgm54E0rSVYtaO1+
         DGXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JSnZUDnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8-20020ac859c8000000b003061659c057si10917484qtf.572.2022.06.21.13.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jun 2022 13:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JSnZUDnt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3kB9-0002HZ-Uo
	for alex.bennee@linaro.org; Tue, 21 Jun 2022 16:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3kAS-0002GN-O7
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 16:08:09 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:43538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3kAP-0003uN-58
 for qemu-arm@nongnu.org; Tue, 21 Jun 2022 16:08:08 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-3137316bb69so142081407b3.10
 for <qemu-arm@nongnu.org>; Tue, 21 Jun 2022 13:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U9snTh4mitA+bB7L3MiFboKsnqCFfA5OZFX+Ply9wjw=;
 b=JSnZUDntDWVZkIDetCqYKq914Yheu8vt4UbY7ln97RzXWFWtznBO1DpKZyRaYh1ng4
 Xy7UveELqFGjQXWFCNLIttKmZZyw24U1uU+bGraFdigSzNP9a0KZfRoXhqXw9z3LOrOe
 y9fewC9ZzkwxIXtHhPrHZ0A7RMWlsNvTz+AeY6X4cNtNz+Ykbi+KngbOhfZDiRDDc9Is
 Xp1iMXm5PNwFBDpnoKIU0FTgEWF0YQa27lmArlRAgduiZDg4LqVWdP94564MzlZII7tR
 LYVm6Xu4scp9Tdn0iFazubkwzxFNV5ipTSzerRAHVFoWu5NnQdZtnuA5lW57LV1vdqpL
 TxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U9snTh4mitA+bB7L3MiFboKsnqCFfA5OZFX+Ply9wjw=;
 b=L9DK1ZrDoExxFS/PxJ0elVMDm7akqhrppCacPjyYY+Wh2I4ZnSZhpIKJvoVfjb8pfd
 v3CV7uXQfztYFsLGFYXgSUV7dUmQE0wMEX4URWWFau4cxuDePBTD00FQd8SgMMykmI8u
 3trepuljCe+1vAi+H4t0M3L/Fc0iBrysazwmXH+Zap2lx+vPaRR3Va+8lFstxzILTK8t
 aQCVu0mlfFKIuj0PPNaaxAQne2aZKfXx8ie/3vmo5BcV4slJ6zUvXLxQDBMugSFZe6s6
 bS3eoktDn65mC4ZhFYQuyj1uBR2+wHKGggdugXkgoxB77sfaZjgkDhbWkMfKEbiOQ7uH
 SGPQ==
X-Gm-Message-State: AJIora8shMddKsKobN+eW6SqMXR8fCxL0x3c4eRP9+pu/fPJgLoltuWw
 OGVg9TLWkxbUpmL6XWIwX2B9aZ09P79TXl3HYBtdrw==
X-Received: by 2002:a81:1cc:0:b0:317:a0fa:7a61 with SMTP id
 195-20020a8101cc000000b00317a0fa7a61mr20300377ywb.10.1655842082255; Tue, 21
 Jun 2022 13:08:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220620175235.60881-1-richard.henderson@linaro.org>
 <20220620175235.60881-25-richard.henderson@linaro.org>
In-Reply-To: <20220620175235.60881-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 21:07:24 +0100
Message-ID: <CAFEAcA8Mz6rB5V5jOP4n1hJPw_azuuqP42S8v78=Go+TPmkZ=g@mail.gmail.com>
Subject: Re: [PATCH v3 24/51] target/arm: Implement SME ZERO
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nU60KOG+pO+Y

On Mon, 20 Jun 2022 at 19:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sme.h    |  2 ++
>  target/arm/translate-a64.h |  1 +
>  target/arm/sme.decode      |  4 ++++
>  target/arm/sme_helper.c    | 25 +++++++++++++++++++++++++
>  target/arm/translate-a64.c | 14 ++++++++++++++
>  target/arm/translate-sme.c | 13 +++++++++++++
>  6 files changed, 59 insertions(+)
>

> +void helper_sme_zero(CPUARMState *env, uint32_t imm, uint32_t svl)
> +{
> +    uint32_t i;
> +
> +    /*
> +     * Special case clearing the entire ZA space.
> +     * This falls into the CONSTRAINED UNPREDICTABLE zeroing of any
> +     * parts of the ZA storage outside of SVL.
> +     */
> +    if (imm == 0xff) {
> +        memset(env->zarray, 0, sizeof(env->zarray));
> +        return;
> +    }
> +
> +    /*
> +     * Recall that ZAnH.D[m] is spread across ZA[n+8*m].
> +     * Unless SVL == ARM_MAX_VQ, each row is discontiguous.

This comment led me down a garden path for a while. Each
row in a tile *is* contiguous, whatever the value of SVL.
What isn't contiguous is the entire tile, because the rows
of the tile are striped across the ZA[] array so rows that
are adjacent in the tile aren't adjacent in the ZA[] array.
(And this is true even if SVL is ARM_MAX_VQ.)

> +     */
> +    for (i = 0; i < svl; i++) {
> +        if (imm & (1 << (i % 8))) {
> +            memset(&env->zarray[i], 0, svl);
> +        }
> +    }
> +}

With the comment fixed,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

I'll also go back to the patch that adds env->zarray to
suggest a beefed-up comment there, because I just had to
spend half an hour with the spec to make sure I understood
what the zarray is compared to the architecture (some of
which is the spec being complicated, of course ;-))

thanks
-- PMM
