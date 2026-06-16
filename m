Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75558CD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:44:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZT8x-00079Q-Dm; Tue, 16 Jun 2026 08:43:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZT8v-000790-Gm
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:43:49 -0400
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZT8r-0001PG-W5
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:43:48 -0400
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-662b95934dcso615409d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:43:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781613824; cv=none;
 d=google.com; s=arc-20240605;
 b=W04ruEV228AcLmCRIxxKeVHB7Vd8HJew3Bj9Lzv+QNNLk4g7pbcO4GnEGVkFIJdyY6
 Qa1XObs3Ipwgo7G/PG+2NSN4jEx5rumulRjkIBjS6oBgP2U4JcIyZm+T6FpQNXO++ehx
 RplT//syWIN8KaXol8kA5+xdBP9ausYia527fUZEVWbkiiZc82cfS048jWoLREH0MWYC
 0YQInaVso5gYXqOWVdhvfruLRbAL2SBygbqubeEO5QLNjT6Uf0859wuDPuybkYuUwvbZ
 QFn01x9GuL86c+TetEWY2LxRNvFXhm/Jj+ZzPvhheUVtcsNBlBKdf/UzC+HpasCREDil
 gGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=laoIaVt7WeDw2SyRjKGoOZgX+naUFvyDr9NXQGotLjg=;
 fh=pHalUqnH6qQ0gipAep75OWbMsaLoFhYl/lFEzzGCvmc=;
 b=SOrz8S7NMdo4imvsL2ZfxE25R5Jlj5komivHF1/KzoNdjm9vj/dVdzfNOe56plAhRR
 LAzW95pJhUYHrWk+eyn4f67BEzJmvzZv08CH6FF/djSGm8CKlDK33Pqi9GPq7Ry7UnlZ
 254+QxwdZMFd4uxLDP3SDy0ud4JFQQ3UcxmDL7ZMjBAx6mF5BF8qFLNVLglqi3L+zaik
 9aBSlBA0eaD5nvTrt5jHulJf6mWYFqvQL075UP6LsBnGk4YcJfcY0VT5KYZayxN2IIA4
 9T2fgULMsQQVC+uCY+DrhPB6Q2gwpYR0HlUa/cpJM7j7LOOdVl7XP9q+Wz/yg3JJhoF1
 gAIw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781613824; x=1782218624; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=laoIaVt7WeDw2SyRjKGoOZgX+naUFvyDr9NXQGotLjg=;
 b=b6/d+hnhVIKmK0TPMcrQKvPHGczD5vUu7b90wE82PndZ9qqhZ/IUoQqEH825uIAtTE
 VFlX/XU/imfBGiBdcMSfBGyHhFNhHIKDdeO3z/5ss4rE5FMLYifFjRfwLJy3z/9FCar4
 IdE6OU75t8/qanu5zyxoxrQRDhmXAuyk8y9b08lTnYnxrWwYi1uj1YMm64UXl51fLjzL
 WOuBbKV+Rz9SHS5vibzIXLl5oVyd4v8uMYLoEjApMEC3++Ok3Sp9edVu+ePzybRgcyn4
 +T6Z5y+fl21f+ajYKqa/YzTZkfYO+PE29AumxrQdPG7mY8NL26VgF3o+egVzSTG7HWqS
 4WcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781613824; x=1782218624;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=laoIaVt7WeDw2SyRjKGoOZgX+naUFvyDr9NXQGotLjg=;
 b=hrK01ckRcOGjyJvonTsqsRfu9eo3pT1i5XBc1A/qguLeVwGfawPEwZVh0UB3RAdHh3
 jrcg2ws8jeCH5BoO1O3sk/JL4O32ZYRUZCH3zlYTKVVSdF4i52DXFcWxRpoop07otCjs
 pRZttE3BLpeFDPO9LD8wf51K7SqBMoaKzUlpXW11QgAKO+jt3psRJbH5wBPSaGOyXSwC
 YpTXL8TWP1ZZ4WLyU2INI6rhpbmbYBMwfInMHuNgYDHjZWneoSxoS7pmw1O98/DzvQg3
 ZLsGUhAoEx85OJ92zez4mr9VrdFAriFy9+PnGtcTprZzKAcFggRQEPyghRqVjSbLHOvF
 koqQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+lkfz/MXZbwAStLSlCVoJY9S3GePgk1ybyirJkigAknRDv730wcv7NWefv0Ad5v+7KS9KAe1p/Ag==@nongnu.org
X-Gm-Message-State: AOJu0YzhuOd6mb052SM52hCVtdkYJaMpulnU/oQfPG/WDhmCBEXNYS/P
 QdL17V4c1c1c+iBdaIHzocsnQrV9Uz0OGVUv/k1bVURMvOdc1DWJRHnPEWiyE6rMYeKdgfMWrFL
 L4lwYBbvqhXfZO/pcqZFb407zBthwrzdnN7hWB7iFOQ==
X-Gm-Gg: Acq92OHydLNaZXag14XKWRJtqAQDEo5RXuEuOjLWDEbmsJaW93AQIz9/NfQUzpsLuWV
 YUOC3aT/h48uJpUaX+onq9dr3MvJKj5EouIHP22tfJnwyBOQ5rknEbyA/qgaJ3l3FlwXRgLiNWt
 v3Ro1Cg6eiidu7jAYWlzCVXE5FAZmae1MIOtoGqt1KStSPEgmehBcGfENQXAxcpKy4XiB8qVU6t
 q0VIBo7o4KGFLKFIx0TZ7Ye5nG52wgSN86sYmifw6dICD9HRcKIofbK6OCSzfVL5dCxTeZlqu99
 lJmEqFVzgcQHf41LvzI+Nr6ohKjjOG4YdxQNXUwSgkukqDKUqtoNjKbjbZ3FX3TMh1Aq5EJAV6u
 iAQ==
X-Received: by 2002:a05:690e:12c1:b0:651:cf23:6612 with SMTP id
 956f58d0204a3-662782d7051mr14533944d50.34.1781613823960; Tue, 16 Jun 2026
 05:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-12-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:43:32 +0100
X-Gm-Features: AVVi8CeaOQ6yPz4_zQYXf4uAJXrN6Y_KF6DsdjE35YC67mTANLchqI-ot9qDvWM
Message-ID: <CAFEAcA8UuBtuZvyQP4bUVoeNcP34o5pTY34Zu-QPXPon_Zy3Bg@mail.gmail.com>
Subject: Re: [PATCH 11/25] target/arm: Implement Floating-point round to
 integral value (predicated, zeroing)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
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

On Fri, 5 Jun 2026 at 00:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the various FRINT rounding modes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

