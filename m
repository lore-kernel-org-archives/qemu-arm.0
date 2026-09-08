Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA3FC79FA1
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Sep 2026 11:14:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3tm6-0003aZ-NG; Tue, 08 Sep 2026 07:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tm6-0003a1-09
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:14:02 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x3tm4-000455-HK
 for qemu-arm@nongnu.org; Tue, 08 Sep 2026 07:14:01 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-836c8bde2dcso22343707b3.0
 for <qemu-arm@nongnu.org>; Tue, 08 Sep 2026 04:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788866039; cv=none;
 d=google.com; s=arc-20260327;
 b=cIpdorkDNxWZ7gudk3V6LiwSlJN1eZLGP3BiVPrUkPKi2+WRPNbH3BUdSd3uyYVRT/
 jGhCbgaYZ0pbVgTAqml1bYh2WBspObiYOACVSI2V3+0mSv6oQyvEzgZ/6vVaRwqQRbNa
 uNZBtAfPagiyRtkDgEYLvKWxmhJ/tsBu7fr/D+cJrirBoToxKZtHeBceQvebh7qmfUXQ
 Y+gP7p8QWRRUeTqrV4Bk0m9IdaDj+AZ8KPPV+RslBrxb7JXO3Tm4Jf4csTdjVNOzAD9I
 a9i7vr8yx57j3g1hWP9FpWrPOjeHURJomJqjsSN+1+/SJcoENE3IoerpplJfLGVP/bt0
 KPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Pr8FLXUb3doRbY2SwJEqxWs9Nho+a2/jsocXp7I5e70=;
 fh=JRkJH0S3sqtK+lyW3QRBWgeLY6/zeTX4p77ZV3uIR+Q=;
 b=bhBsBQDumS0v0WuwJ4JfDg378ZN5A8qsdGf27vwPSPJkrYbAo7qSoPZx9EIz+YBlcT
 yjv7TSF5ABzKuN7UJlJkVfctIgob68Pd48zU7fJ4DXfVYtw3GgGi1pNBYWDrrXhF67VK
 Wjep7u8mNlnNro6CGdqlHuq/X4/R/fmBdqOId19TwabfIzkXcNCg1MaB85u1GiYx6Xyt
 etst/P495ef62TWDWRv7YoVM3/4bGuZzM28USFl7qldw38vH2uj7ZdFaDgNpJ8jC+lUI
 z1x+Xs7LTBqFT3+z1zO615WuJWlUK4GKp9ZpyT8j5IW2UhPP5A2B8rUQVtTDYzP8W15T
 VV8g==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1788866039; x=1789470839; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Pr8FLXUb3doRbY2SwJEqxWs9Nho+a2/jsocXp7I5e70=;
 b=VbQ2Juph3zuG7m9xJT+DgeCqUCQSMTlUGWHP5E0OLshHSO/js5U4Q4cuRGL3HhHJU0
 x2rG49zO0YO88N5Xg2oO/SZWnuUb2WNFFkOO/yGo1dK2LltC7pc/o75r9QvGFDeDVlqf
 o15qa4fYyESuFMLe4Diz6y4zhdBuXQ+4Y2hx+MEY4TZiLoMvkZZT54ImhP+kMcus+NbZ
 kpQgHo+3f8bFgx0IBoJz+OPTzzZtDqTBUkv1LyPhAeSciGaDXFWPXi8U76+YszMU9RD3
 u04Z3TykZaVQ/Es+QjbpiXw17osT+S6JIa2+r6nKCc6vHB318o2kQiHQv3U0ohYu6PWe
 HNZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788866039; x=1789470839;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Pr8FLXUb3doRbY2SwJEqxWs9Nho+a2/jsocXp7I5e70=;
 b=LM3po7/uSaLKYn1TQ01qy/9NzovR7y8qZbCx/IxNeZ57GlQAqEQ6/yX1lvRJzd8Lgn
 WD+vatvPG0bsrzRyp00CeoKrBVYX8vnrYUxGs9LGNn5nCiZrsi9P3b3r5QDkkxT5enyf
 oYkKWb2ut3vw0dnTq6ai7aIVNJ6ObuyUbqeAoCUyUY+jGc8ojpbEGskNUboorzA0U8OV
 BsCQECXwDqWqbcvi+JoA1utAv6zpybdAAzEftzKa/PWfwqkqvbTL2dP9/bY4I0ogsYKJ
 oEfo+nac2JXdpFQSy0QSvhedOKaa04I1lpF10Ar/n2qwpC0FNR47Yf9hqXuubHtbBjW8
 MFGQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw16Booggj9BXBKf01yK8r/jJZ57BCrhwk0GAnj5LP6Ux63T8D+j/WaMKd3BrPDCJNwn3Z7VWdleQ==@nongnu.org
X-Gm-Message-State: AFuF++k5s0VJron5NRK+JxNk/j4IpSW0/15BGHRLrd2IP7mYBEhZSHJn
 hfMTQXa5ynpxj3RaRMHHF5d3n8GZkPH1hsR+C/j1UltRRiiYPzhH94Oonbm3glTLXjEOlPoZy9O
 62TJHLqts6EMLLV0BOogGuQEk2SH54GeOvtAOSxIllA==
X-Gm-Gg: AYBFou3rd4j/rUNy2I6yJXlr4yAVfNvxwBsQt5dfBqn9IoogTvwI6UzPCSRRQdw+ctk
 r07VFfjFVHilkDBxwAe96hmuqekhyDynR4P27dQYw5fkJmxX9IMEEU6xrp+v+ye6RCkaF1rJbyX
 6SYo3yx7A8p21QMn3+lNwBXW4vs+TrQqHhpBroY5pyJN/qsNPvtbhLPojFg0csQeEZvvh3218P/
 BJsrGQHkKJ72kuoRdhONAg4m6c4zG2/mA0EnEKL7VnRNmKBDLosSKy6ZrXX1ODVc0/OVSDlw6PQ
 NeUoFw+6e+makN1lHM94rNi6gWquuXjr/FjAL1p2lCX8agm7c+cwVoR9rJMIyGEEAokucHZRMjc
 pEtqCvN4YFhjN4WHvVwba/zaZuRqNNZyD1SskfIk=
X-Received: by 2002:a05:690c:319:b0:841:8f97:e898 with SMTP id
 00721157ae682-871288e0f77mr131766777b3.32.1788866039158; Tue, 08 Sep 2026
 04:13:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
 <20260828222639.1432046-14-richard.henderson@linaro.org>
In-Reply-To: <20260828222639.1432046-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2026 12:13:47 +0100
X-Gm-Features: AcwNN1UEAJCjMQ8MANGvbxSbhqC5VE_XYXCO42JkUEHmNCAtYlYoJb6zzYN0fSE
Message-ID: <CAFEAcA_ppZoijEhEoOmtJBGwE8GEuk+p5yXmzCaWbv6rtOqKFw@mail.gmail.com>
Subject: Re: [PATCH 13/13] target/arm: Enable FEAT_UINJ for -cpu max-v9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Fri, 28 Aug 2026 at 23:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/cpu64.c        | 1 +
>  docs/system/arm/emulation.rst | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

