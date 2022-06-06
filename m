Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1326971lfb;
        Mon, 6 Jun 2022 05:24:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy67XaORpnIwfuJ5wklhdGpl70skwL37Pd54Bazyes/DTvLgJlPxFG3cyNQ0vRt6pWDmxIn
X-Received: by 2002:ad4:5744:0:b0:464:52f2:c2d9 with SMTP id q4-20020ad45744000000b0046452f2c2d9mr28885255qvx.95.1654518245652;
        Mon, 06 Jun 2022 05:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654518245; cv=none;
        d=google.com; s=arc-20160816;
        b=vy0QlJI7nsbSK9+EFSL1ytM02CFHy7jUyiCzUaeXDUzQOIlT8YCTOSUsCcjGqtwGKw
         S87Ku3WBmYQxGmJAZVzzhI7oLItz5dH+5cq5SIdcDr8CBoVrkZbqZq4YEAwMuyxSnzax
         7HAn7fdqPY0ife6lsqzw44f2UzoB13UZNAyizQINt6GslA7i3S3jmxJLSp1+5HKzzqgG
         fxl5+CW9zz2J8k14xImaFAyTlOVBK6Ak3iGN79XEjLHuOuTDHucUP1L8XGOcOTU8aGAH
         eI+vf7ZUPyt9msEAoq59fMMO0pR3RpaUGWjyeUDdFwiF1vEJCkO0HnYtPMmxgRcbTTN7
         63Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1DC6FRY2ZMdbfLfbhhSMUisD9rsaznFOfRvb1p4vpdc=;
        b=UrA2uRpbwRe9DQZs5h/8V9neLGY/+tV4Z2UwNmbfgb1/VQQ+ZYaRJPt5dAf9qr121N
         e9pJ2/Eg9ONOFtSVFQxXoG2l9fEvHr6winxbgey7qk3mZ0sIrF77TwoqWuw/2dtVD6N3
         Xt6IaRrTUWCgJotl85hIgy+VWT3hrLdKIbYe0h9Ki9BV9zegibj6EulRgg+mEkOQpK5/
         ihk6VFkZR4y63loHw4fC71lSj4U1Xt+wBJSOu0TuDWnDahSc+O2xsO/MaCva/Xq5DjvB
         qX4eq0z3eFVdZmrQ0QHiu4R5wjVJxyL5Ui3zx9lAp1upjZYkvoA8OqbyUNS+f0d1CuNq
         i9uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vIhNAk0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im12-20020a056214246c00b0046a91f45d00si4134466qvb.149.2022.06.06.05.24.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 05:24:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vIhNAk0F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyBm9-0002LS-5h
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 08:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBli-0002IQ-LD
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 08:23:38 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:43588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyBlh-0000mU-1N
 for qemu-arm@nongnu.org; Mon, 06 Jun 2022 08:23:38 -0400
Received: by mail-yb1-xb33.google.com with SMTP id l204so25349176ybf.10
 for <qemu-arm@nongnu.org>; Mon, 06 Jun 2022 05:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1DC6FRY2ZMdbfLfbhhSMUisD9rsaznFOfRvb1p4vpdc=;
 b=vIhNAk0FZacjr6OcFzJZuAQ2wsYjVjEN6PVlGproOexgnjH0Mzklgg5C5qcJ3hWpH4
 ElCVgV0djZY8jCvApMiWwOHrH8t76icjbMotNoTduTX0iF5lqEolLHbQiQf2psGQYbNU
 sW9XEntk8xB5zhyL0ueI3jPUg862V6oZoE8OvcxxyHeuY7mQaMBjdgWKUNZ3TZMKg5j/
 vneGMi7tiK5Hi+vN7t4fuvyWu2AAzlVrHHEgjFwVlktu08/3qt+z/Jwp5aBerhL4WRxy
 7Y6pefZcN0qYMAXfaFoLr3cgfG7zi4kz676x1rQ/vzn1Y/v4WQKT1nWEXLkaiUnEYDVy
 pt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1DC6FRY2ZMdbfLfbhhSMUisD9rsaznFOfRvb1p4vpdc=;
 b=4Uk4RMLS8SZMQdTSObKx+AGMOTxdBbsWlzqyxvfcAbmaMpzdMuANn7fZ4xHVwzgbJA
 8xnlXPHJGFqtEYFrjitgBzcD/krG+fbyQ7yjjAsr/5K77uWrvaEy6cAYC1YsPUE0Yne2
 K8FPPWZfs2Ayr7zuCQq2elT2KoTaoXJr2EM/pwzSyrgJDLpmpFvhpVVAv3tiP8BNgp+p
 9pQyTyi9vviRqejivA25dJ0qOjZ/5DwGQQGpONyg2oVGq+xnVtY0Bup5GKE6QvCAD8RH
 TgQKHY6yI66cWuhn9UOEFraDjw49psSuBv/lZuadeSsJv8KzwwCsMq8ZE4VaGSxabJgX
 u6Ww==
X-Gm-Message-State: AOAM530DheKeSyng+b/xTcaAPtLPvGvUwLMUOd+tfapkekZeB+9movus
 MiEYskSVxTrsYh+NG3zZX/MFrIiOSftIW005fFtwIhqyIY0=
X-Received: by 2002:a05:6902:728:b0:663:5591:aa2c with SMTP id
 l8-20020a056902072800b006635591aa2cmr9733673ybt.288.1654518215985; Mon, 06
 Jun 2022 05:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-5-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 13:23:25 +0100
Message-ID: <CAFEAcA_wBqtJxkgMYqGnxs2TKrLFMz-xi9oG0QcjwmL_HCi=Aw@mail.gmail.com>
Subject: Re: [PATCH 04/71] target/arm: Remove fp checks from sve_exception_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: feepJ0Tpbbqw

On Thu, 2 Jun 2022 at 22:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Instead of checking these bits in fp_exception_el and
> also in sve_exception_el, document that we must compare
> the results.  The only place where we have not already
> checked that FP EL is zero is in rebuild_hflags_a64.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
