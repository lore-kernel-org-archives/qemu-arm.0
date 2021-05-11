Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp3802073lfg;
        Tue, 11 May 2021 02:32:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZ9rjV+vEGFh6E3NrVupVAbE/HhAyhOfZoxqs5UQVGNvtdKeHNQNfIw+GWZSPQ5A6Rz25V
X-Received: by 2002:a05:6102:245:: with SMTP id a5mr23408469vsq.24.1620725530931;
        Tue, 11 May 2021 02:32:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620725530; cv=none;
        d=google.com; s=arc-20160816;
        b=Y/saInFR125Duurb6qDG9xvZTN4ISQ3UqH/55HjL9hYvqAoEym8HKfVLeCikroMpgQ
         uufbGCUZt311MhXIPCqgwvR425uS1pkmJvpNcVpjrbBz89bayq2E1VqaZLCUGOjyRgBR
         5iLmndShKoFVggMK7jeREnm8d++srhmP/SFDvOGdX76q50KmW04yOJxh59SS2DA1QhdU
         /qynFsi0AkmbRpFFJ4KaQfIkzsKvn691gLRHV7zbR9wJg921QG0WO95hViBYzApbSDwB
         WZJismA3WZg1fhHsEXN0GY6XmQR+xl9stx4/YzwV0i1gQoqZtqTBlPelPNkXDGhsKxnr
         9Ldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a0rqwZsKyKmhnSGByBNpbnjzv6aWnLd5QLbNeWC83uU=;
        b=UNbUISb1+ndhhbAJKUwzlUokdon8jbc1pXxtulfUDG0Zf1w23RehN+IJMYIRlfikOn
         1N5vJ89A89fUgpilM4l5HpNHtMvwyY7HjWk0y3Zekqviu2v/xHwokBrqUAzk5BiwgajP
         s6hMmp+9zugv6qI9JQ7NJSVoW/SE1s1fsXtLTQ6blkT0nkTyD70B/yP2K0iPXx6s7jHD
         ZvYW/6kM5IYH1jDJIQ9qnlrjJhoiPmON04zrXX1DkovWDSIJCLMnyKIm22wGBGRgtW/x
         JgGaYjkDyaoz9vwBZPHxk/MkviNGcGmjTHMTpDdxOdICAiKQJAcZetoGYxzuGdZKYNiK
         0B5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pT0VzgqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y34si7463950uad.38.2021.05.11.02.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 May 2021 02:32:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pT0VzgqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgOkM-0002yK-5f
	for alex.bennee@linaro.org; Tue, 11 May 2021 05:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgO2t-0000Aw-Ik
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:47:15 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgO2k-0002UP-Ti
 for qemu-arm@nongnu.org; Tue, 11 May 2021 04:47:15 -0400
Received: by mail-ed1-x52a.google.com with SMTP id y26so21909552eds.4
 for <qemu-arm@nongnu.org>; Tue, 11 May 2021 01:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a0rqwZsKyKmhnSGByBNpbnjzv6aWnLd5QLbNeWC83uU=;
 b=pT0VzgqMgWpa8zaKD3p9R9GCgt2blxEIFOZlwayjGXeDqnUfUUNx3lcSACXXkVAMNY
 4LQBPfphC4xxJl+vcSL66eJ24TN4XkYucdk50mqjRONnkpJjDl2tOXCk/GtI2WcwtIFL
 uH0bis/f1+dV8sJaLTzeVqaPNh/Gl43lSPzV0YsO6xaDiyXAYze2objwlxfqB2/s8Rll
 ObhwjULQtgreOwtKKZmU4lZwedgBOu+RokEX2kihW1ODSaxWxacrnjIIUxDHiTN1PXIp
 bH9B7fcC6vSmScCh7sojEXbXiCqazja6WsM+S71hqlGE6zhi3QukYoBZrvWuYFOXJ2pR
 Kijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a0rqwZsKyKmhnSGByBNpbnjzv6aWnLd5QLbNeWC83uU=;
 b=NGV533TkfkM7LRBNx0Mdej2Wdyju+oTtjYbdbwRqF7gEQWZcZt7Qtjg+yu4evBHDpf
 jYwv3lTicK3EUrQx6zuyathzhN7p4RlnDiM0BZETdfx7dk2ONZOPPOCbqSlG5R7hutgg
 5B8NJEJteS+z9a3utGuNaEtXgy+WyFcaBzmRI/H8Qn1wf7g8lLznjDXpYAS4pP9PYKGk
 eYdoN10Xv9Wup/2I3IQwek/6KFpCbxlm3eWUwUfD5H6JWtLuhVLvfwYe8zFn5WlXoOk2
 8x8Q2TVlxqheBATkiEGwCWg+x8qYWxNtn8J0wgvEuXdFHR2MWoK5pQKrQhu0+I7rfsG4
 98RA==
X-Gm-Message-State: AOAM533lUL/aVaZzuA+7pPAz1nHccvhti4l2c1AuEPjl87CR1zpl7zLt
 jWPUqjyMQC1SOoZmr+rNZIIMNG8p9tSgCGYTVtuzcA==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr34323343edv.44.1620722823814; 
 Tue, 11 May 2021 01:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-8-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 May 2021 09:45:51 +0100
Message-ID: <CAFEAcA_JYbFAouoYK+7_udot+NZSNQUkQvGZOEwGZrQzeR2QyQ@mail.gmail.com>
Subject: Re: [PATCH v6 07/82] target/arm: Implement SVE2 integer halving
 add/subtract (predicated)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yT90C/i++ea9

On Fri, 30 Apr 2021 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 54 ++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 11 ++++++++
>  target/arm/sve_helper.c    | 39 +++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  8 ++++++
>  4 files changed, 112 insertions(+)
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 7eff204c3b..3703b96eb4 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -639,6 +639,45 @@ DO_ZPZZ(sve2_uqrshl_zpzz_h, uint16_t, H1_2, do_uqrshl_h)
>  DO_ZPZZ(sve2_uqrshl_zpzz_s, uint32_t, H1_4, do_uqrshl_s)
>  DO_ZPZZ_D(sve2_uqrshl_zpzz_d, uint64_t, do_uqrshl_d)
>
> +#define DO_HADD_BHS(n, m)  (((int64_t)n + m) >> 1)
> +#define DO_HADD_D(n, m)    ((n >> 1) + (m >> 1) + (n & m & 1))
> +
> +DO_ZPZZ(sve2_shadd_zpzz_b, int8_t, H1_2, DO_HADD_BHS)
> +DO_ZPZZ(sve2_shadd_zpzz_h, int16_t, H1_2, DO_HADD_BHS)
> +DO_ZPZZ(sve2_shadd_zpzz_s, int32_t, H1_4, DO_HADD_BHS)
> +DO_ZPZZ_D(sve2_shadd_zpzz_d, int64_t, DO_HADD_D)

More dubious use of H1_2 in the _b forms.
otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
