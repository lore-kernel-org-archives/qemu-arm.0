Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1598621lfu;
        Thu, 28 Apr 2022 02:39:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqJz0unZT2JxE6teC5FgKXDELQKP7J48YaxO9oLsb1EFkJIeNxgZgPwAfB/6gvS96YrX0Y
X-Received: by 2002:ac8:5fd2:0:b0:2f1:f89b:57ff with SMTP id k18-20020ac85fd2000000b002f1f89b57ffmr22367636qta.192.1651138780579;
        Thu, 28 Apr 2022 02:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651138780; cv=none;
        d=google.com; s=arc-20160816;
        b=l5ha61wQtcom5Z4tBaI7pSR5qkX2H3fUVbEgvOqKHUFT/mXhDvMpREuG2Ii7NtHJuK
         ZPnkjhW7nlpKrvb92BaCSCsI0m6VvPHDkwDnUpbVnRSypn0IArg33hYDCaPX+WH1JxwU
         XE+qN0PiopdqjSm5Y+gcmZnuUrDvr6qWPvda4Cpd9beD7sWRFYML4OeE5O32YmUYhQPV
         Mbzh+BBmef7+G9IHf5vuI/lAwaVA+nr/JqvTEs5G1273SShzvlFynpjJsGr2GsOHtwJO
         J+Hmpt/yXJhO/MuQ/4bwh+LPHijUWcwmDKOGL57mWpBS2Pttik3U94+pEpfnH2ijsum3
         2O1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=a/J1MLys9tDiAt4oRRVNvqQhqt31312LiWNP2kHFZDA=;
        b=l7XEib1UCv90nHBO5/2Z+I9cG3fGWt55E5D8h3r8Gb0utYpnlepCWwMIjXZKo/FxZk
         +lnnZla8DnKe2iS7FF6NhWXBpTnGD9493+QnrRTW34J0AQBRsYIe5V2mOh2+EDaURFUH
         mv69QN3d2wEuuXmMuoMZckd+n6g2Fj3mK+0W5QfcvH0qVgqevql1nEfsdqHddGfrcro/
         ay3vto+Ocln8g/vw9XKuK3JiiB0g3/2CYV/KRS/Qb0PDCZ4293ES1RKDprWrbWiZRb2A
         1eW6H29UYnNO3CKEXMoZaI9r0Fl17L6wFLrJBZh4XN1XSAh8XDPBjPT0X2AE0v94ZeLj
         6hsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H4g8piqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e16-20020ac85dd0000000b002f387e3983esi837897qtx.58.2022.04.28.02.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 02:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=H4g8piqr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk0ce-00047B-35
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 05:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0cI-0003dI-1m
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:39:18 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:40771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0cG-0006og-Gf
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 05:39:17 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2f7ca2ce255so46252547b3.7
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 02:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/J1MLys9tDiAt4oRRVNvqQhqt31312LiWNP2kHFZDA=;
 b=H4g8piqr1vktDVcnFPsEMlLfekigKNCQwjrdhh2UjUNp67jSYiTsKkWOZdcIkZsYc9
 +xzUWm9Li4MfeDBV2i/+GCP5e7/8BihkcyATmwmHWvAgB4qHvlc413UGsK7Hqpt7FCMv
 Os7iYq+pFzhFLOriYP/oUwl1QcFAS2NtuJM+568g+1CyOcajzZ73Yg+gYFkZ5ZcrMKSh
 +4VY+2aZ87myKTKlye4GHRTUhowcdi6J0xV9M0h2CfYEW04CJ/JENTaRDYgQNq6Il0f5
 MLyUzjRRjl+WVANedFp1tKuuXFM4kHggc4SPkL40tefvzCXkYM4TllQA9kn8k3KoGAKK
 1CHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/J1MLys9tDiAt4oRRVNvqQhqt31312LiWNP2kHFZDA=;
 b=V7y6EiuZLeSoV/loc2twlChfqLk9KbOB/UB7vPKu+WNCkv+yMfXWUnPGVuhQMsMOCQ
 29kEInCoW2Oa82pgcwlyagw+8La63iwRMQHcA9jtz7qO948Fta9ZlVuIz3VrxZb/KkkD
 pCfg4MijmHeBdwv5E7znlPaBj6RLkNTlW1Z22+Uyi1slousc/LfRQOI9EiAsrFNfIouR
 Ui8Wy44IiS4xt+hXscras7oHVxnRqg7hqkUeN2zAFfzsktk16H4HnqQ0h68Iv6ZEPxMd
 MsfkZ8ys4CAa9f8AZ2zPka2MALUefFnEqK0aU7nrhhQlKIgGRjQltyF0y8jlP2rMZV31
 8jMQ==
X-Gm-Message-State: AOAM530SK8slqUbW6H7A+7sMlK6Pzb34HX1mgYvzkJvXEstyHzr8rs5s
 vJfy2ofG6dHDpAXoZNgwsLHMhzWGQR5njajhpUc+mrna3Vs=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr31605019ywj.329.1651138755749; Thu, 28
 Apr 2022 02:39:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-5-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 10:39:04 +0100
Message-ID: <CAFEAcA9RTEbFODhgmLvgfrt9oWu4DGYBPfXAQeFpLbk+P_z=5Q@mail.gmail.com>
Subject: Re: [PATCH 04/47] target/arm: Use tcg_constant in gen_adc_CC
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V3Wq21+anHQn

On Tue, 26 Apr 2022 at 17:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Note that tmp was doing double-duty as zero
> and then later as a temporary in its own right.
> Split the use of 0 to a new variable 'zero'.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
