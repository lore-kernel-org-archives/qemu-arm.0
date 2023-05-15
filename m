Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6654461ejq;
        Mon, 15 May 2023 10:07:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4VVmW+lrmb4Hf/Qchi26C1f/qkPPq3sa/wiDtQv7HD+LJIKuiD95vmG0OkPt4uRyJG+s6R
X-Received: by 2002:a05:6214:29c6:b0:622:199c:c4d3 with SMTP id gh6-20020a05621429c600b00622199cc4d3mr19191557qvb.43.1684170453889;
        Mon, 15 May 2023 10:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684170453; cv=none;
        d=google.com; s=arc-20160816;
        b=HB+PkgdQ7Z9AfIp+gEkLSWvw5MqHkh2KPDPQH0IGyZg77uN3+a+C/nbIIedXauf0B6
         B1rnnFa3fzFkjF+7Rk2LDkQgCYUrDZc3bazJXTRLoCgNIbZRN3RmSnyBjIQORQ3ZazyD
         7SXq8RwoFkSf6kS0lWaIqiAQ8G2xlefjLCAXYQfe9GKiuHm0R611VoSxXmXnfpJKs4xE
         p8dQSwS7vOPJ3zz0WyHdbBGkomjtV5sZvAgapEvQsvuM8PULrvkC5nZu9FUsjNiZx/zL
         ZwVtZ+GGuBnmYnM4WPaCIdzmn5HVW61oTYT4piB9WhuPrsVBWawYMdZMf+r6PI+xaWn+
         d8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZcEJdkZfKI6/8JKgsBtqTZRTx19UDPfr04WSktSYAXc=;
        b=SskQK1R2sZOvbTPMNrasI3iWF460t/gq+7URAJdQUOClObbJFBbdfu4mBAps1Zp9di
         xTqH3sh5nW7NFi7V9GJxBmVDM4BrIKMmuck+Uh5Dp/clWrCL1ZwiQxQlYQ1rzL1vQrTh
         NuLivlU1YFKGU4S4CcE8TEvJHdV8Jv9YdrI8KY/ybBPhmBqFfBot7lBxw7e9EXoDZDDz
         Rh+cIF2WqS1swlTK9n2gAd4I+PTuMW8LbZ8VcKwP/ho5fCch5GAPY/Qsx0/X3LaqAGD+
         /0Nq5TPfQg/SjnBpnQUpPSdW4MhwNgnQZzmObidAQUCZcThTxEwO54NHAHLXzg96dkvx
         9c7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJxo6uhy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x7-20020ac85f07000000b003f53624729bsi977461qta.57.2023.05.15.10.07.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 10:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sJxo6uhy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pybfJ-00033l-CR; Mon, 15 May 2023 13:07:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybfH-00033K-MY
 for qemu-devel@nongnu.org; Mon, 15 May 2023 13:07:15 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pybfG-0007be-AN
 for qemu-devel@nongnu.org; Mon, 15 May 2023 13:07:15 -0400
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso23117412a12.3
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 10:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684170431; x=1686762431;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZcEJdkZfKI6/8JKgsBtqTZRTx19UDPfr04WSktSYAXc=;
 b=sJxo6uhyhExSo+njdMguN1l0oGpPcy83gFeNGpT26KRjENmiqfOkHy+NtkMBnZB4fW
 YA2hqe+c6qM0op2pQPV8a6ZHPU281SYT+UMMtUeJyGLswuvrCjeItklj/i98Q38Kwy46
 EJgJaGSKgZfWAwWIN+QnmP8Y7mpxUZ+1Zx+TDaiupP7PEgc/Y0+6g8Uv7eZkTKX1NQHa
 MsBJz560OuHP7exgGSXLNGFmCLUzEpR+qyx2JcCkT5+CshLq/hd+vbcmR0UXAQOczkCt
 3iF/mDdz8qr60asunM4NlrYwQWt8PDiRAwL7dyvS+jUp2fFV3ACIHQrekRfLWDeVGS4Q
 T5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684170431; x=1686762431;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZcEJdkZfKI6/8JKgsBtqTZRTx19UDPfr04WSktSYAXc=;
 b=XZsAApzWBk58RUe984E4NJD9NjN8sSLvCi3cDeKaN4N+syuC2RIjMIosPWzYGU5fUj
 OSQNIIcPkYvt2n5ztfuSm9PCpX09v5przE6n8lwL7ICfvrLDhpxdoQOsMmZ+YthGKJ8y
 pPfEr+YuOIAQs4rISbG0EsigdBoJFXGwkS9PLSLz33wM2wzbWoay7Ibqd2aVmCUKrnhH
 xZx3f80yE1JFB4P/5LJbYH+QTCfa0fQeYWFaaB3HwRRW01xJmPmjXJF5/Idoegtj1h8j
 KkNESez98R0Ctc25NYGvRLviqyJLed5tzWUNjZyFmAw9JJxqeum8JsFy+wef8qef3q7m
 gqXA==
X-Gm-Message-State: AC+VfDyYgUrP9p7ou+Qij/i+hEmUM+WXyCvH7Ej6lEvQJLFbUdK0F9Sd
 jw74/Hj/QwUnme7t0qD40VAZ5aDkaxR7OG6EKRry6w==
X-Received: by 2002:a17:906:dac8:b0:969:f54c:dee8 with SMTP id
 xi8-20020a170906dac800b00969f54cdee8mr20431833ejb.35.1684170431251; Mon, 15
 May 2023 10:07:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-26-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 18:07:00 +0100
Message-ID: <CAFEAcA9dwVJ8bTXezcCZZB0zLQaxUJxOLZ8kyfBjkRshHkSwAA@mail.gmail.com>
Subject: Re: [PATCH v5 25/54] tcg/sparc64: Rename tcg_out_movi_imm13 to
 tcg_out_movi_s13
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z9KuFDklEeEp

On Mon, 15 May 2023 at 15:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Emphasize that the constant is signed.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
