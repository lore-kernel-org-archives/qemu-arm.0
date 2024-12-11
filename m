Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4153083njb;
        Wed, 11 Dec 2024 07:44:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUBo+3lwW0QBBgZOwu/lloTqyBt0rwjdB27PkHiOd+gPKqXSy2Jg37j1A/m2BmikYubDCnAVHv/h6kexg==@linaro.org
X-Google-Smtp-Source: AGHT+IG/gfWO3KN0OhydirQB+af4YPzsPnnqWYCJHC5RQtSqy8W6NjqT1y9gy+Jnug6d4zibTCsY
X-Received: by 2002:a05:622a:424e:b0:467:56a2:b05c with SMTP id d75a77b69052e-467892a1cbamr70220271cf.10.1733931885917;
        Wed, 11 Dec 2024 07:44:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733931885; cv=none;
        d=google.com; s=arc-20240605;
        b=S4hCpQmPMsox6X7oZunob4zuwFkTHadN4AkVQrrp6CQXGEKIjx8cNNPQitgKj5HwWC
         ej3i3nVSZgkHSZSO3EvambCLwbQBSabirI2T8HGxv3fI9rsZDZA1jNf51wi8aaWkWhlR
         zZ6pMYayM1JeA7tkeQcWQQ/TQ3mi3PdcqrcZgP+CQPVj1aByTKtb8eUvA+P+HJiyH/gS
         Qve6IE1fMbesFR5bsMZLV47YB4jr/T5tCvQFwz54KHmMgQwHuqVPiLzEWsUbHnSn8kPW
         Rg8paGe2NoqHSFPAhIuzFXK9H0W4AdLhC8x0+f7jKlsM36xTRZ2rSvlAkzcwGzHaptVz
         s2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kSSU5UmHSpMqGjoE4FcpjfWJI1yTnjZRfVfcQJTzv8E=;
        fh=dtO8VxQsKxt42575/5wHjxCfvl1tHQxXUAnVF+aMrJA=;
        b=AYMFi9nlly/Voq/wdTK8ua8pDuXSMnGhws37m4E6cj6bVR6gl/scIaTLjMXEmgUl1H
         cPzLlsCHLhc2OMNvUQXjMyJQweuWdU7bv0xeOemTloflzL0fsd2hBiLBOg9JZTMSv6CV
         Fh8rWYW6BRtlrF0MrTIYQweCkGKjdadAht7QrsI2gd+iinYdLGVdWinWpvNumB7x5INX
         8vsKCeGKfb9GVm6lP9Vf20OBcI3KmKPjrI2j/Ur+MFaIlMHZTF73Ez07shPACpBFwRhm
         OnbFaDLzBkUAAQrMDa813AesL/HTTPQGnt3Lqs93x8cqsOG2gr7q46NZUtVXjSFjVwrO
         mcXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6tB0OUC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467540897c0si105997581cf.343.2024.12.11.07.44.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Dec 2024 07:44:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X6tB0OUC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tLOsy-0002Jf-DM; Wed, 11 Dec 2024 10:44:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLOsw-0002Iw-5F
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 10:44:22 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tLOss-0002QX-Uk
 for qemu-arm@nongnu.org; Wed, 11 Dec 2024 10:44:21 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6ef0ef11aafso62383457b3.2
 for <qemu-arm@nongnu.org>; Wed, 11 Dec 2024 07:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733931857; x=1734536657; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kSSU5UmHSpMqGjoE4FcpjfWJI1yTnjZRfVfcQJTzv8E=;
 b=X6tB0OUCEZ+FEHVO7To3cUDTWH9D962j+K8Q+oxxdt7D9FTn6SB5DSXEIzCQMnUZvT
 RlVfIM+L6zXRstBcOwoX+xyn6XXJNXe1ck+MemDsw+phTSHEXI60qS9sbJDVUGGxYsZR
 ednHck0VrP3vvzUePYpXtzgUvPM57DYJhdmTe6fhNNdRitD0MsgQaE64jbojNi4HyUqn
 xeblgzRLZQUK4Rs7S0tfP4II+Ra0FnXGwJRr4w4NlgLdLvLpvC9lydBKiPSpjT1gNyyS
 L60r1cUNNq9OqQUOBeGGq3grihFPNXenr7NCuZLcIS3r8OZuAYSMOiKedofOReg66QpD
 Aa9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733931857; x=1734536657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kSSU5UmHSpMqGjoE4FcpjfWJI1yTnjZRfVfcQJTzv8E=;
 b=a8GoujebktxkvJrfzJdHWSDvNyFmdNRCvmKffLlgnf0GNhXOsD5Fec97GehRfJXkEt
 525OhOI1mAG5bpb7NlIzGQr5jBNlFnL+wNsj4vyQuaFcMiJOAhIDsOdwKoRp/i3tPyG+
 Q4bHnFTfqofjMqDDLcYqe6ZmRphfOLBMQMEXxEzTcMjFvPGUNeLi97sDh33WAqgonzaC
 1ChPhcu7BZIpxqAC1EVmMDXIkhBQS/EhfK/GXzexPilYRExzjBOVhz2761fEDfoyqDt8
 ycb4iq+cUZ/Y76K+Sgzypb3i5J9mQiY+SE8aEa/Yq/2UNlCkWFrGvo7av320u+n78vyH
 3Ztw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9+2ZQcushmpnCP0vU2vFNo3MjXvlxB3mpDnOscMHOTpy8ru/7TuNdEr30WmscyWc/pzurHyl2wQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz/j9VtVlALn2ZDwyLisMxTyegTuLlKmPAVCMyEzbleMhLNHLkS
 sw5BW0TDMF0l66h3+hhKDHFwU85O+SyIUB9/lxDLe2VvLuWYmKjpW/5uT/Qn5uJy7i7T4e3lEOJ
 qAJaR29ieK24FOIGPQQAMw/UQdx0lYJmyahAbHg==
X-Gm-Gg: ASbGncsSlu1vDcmnydkIiuNZHd+n5Jn24fHipMxmsytoy589Zy/WhjIaJmDY+Q1kQBc
 /OLXB+STF9D6s2rOtZx+EMM1Er8eB7KMoazkh
X-Received: by 2002:a05:690c:3342:b0:6ef:5ca3:d0f1 with SMTP id
 00721157ae682-6f148084c57mr37346877b3.40.1733931857090; Wed, 11 Dec 2024
 07:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20241210161733.1830573-1-richard.henderson@linaro.org>
 <20241210161733.1830573-24-richard.henderson@linaro.org>
In-Reply-To: <20241210161733.1830573-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Dec 2024 15:44:05 +0000
Message-ID: <CAFEAcA-9nUy0g0f0t7ais-Ygy1=2cDz2==-St8fU_tZ1GF8xtg@mail.gmail.com>
Subject: Re: [PATCH v2 23/69] target/arm: Fix decode of fp16 vector fabs, fneg
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qljDxzILh+xh

On Tue, 10 Dec 2024 at 16:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These opcodes are only supported as vector operations,
> not as advsimd scalar.  Set only_in_vector, and remove
> the unreachable implementation of scalar fneg.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index a99f3d0d13..f67360c4c5 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -10816,6 +10816,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
>          break;
>      case 0x2f: /* FABS */
>      case 0x6f: /* FNEG */
> +        only_in_vector = true;
>          need_fpst = false;
>          break;
>      case 0x7d: /* FRSQRTE */

Also case 0x7f FRSQRT I think, which will currently fall into
a g_assert_not_reached() for the scalar case.

thanks
-- PMM
