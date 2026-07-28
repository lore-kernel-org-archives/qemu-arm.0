Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B98C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 15:26:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wojh7-0004Hq-BH; Tue, 28 Jul 2026 11:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojh4-0004Gl-3G
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:26:10 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wojh0-0000pO-9n
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 11:26:08 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-69ffbd2a277so3610540a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 08:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785252364; cv=none;
 d=google.com; s=arc-20260327;
 b=bV7YJIubgvgvEOcUBdu/zZdU5Qr3Y9WEmDlxPT/c3dCNoLF5/EMEErbWVMzO2AkhYo
 X30n6I+Ix2COFR5hdIwY1d2wNvwP2+LZetrjuvpzYfsvb10IXwzyy9rEWqxx41vHYPJm
 xc5KsjMd2v0F4d7tvM5QU6xmBp6VHyO9B0nYX3OVuG+65KswCCXytqVgcx1VEW5RLSiC
 CrqiGI30YpfCIgsbUHDZKBKqBB7J/khxZH5wh/+ewYoeAhA7P9Q3nRlF3FjBqvgZyUa6
 f/mDIxvHTxQz6HPPSdnDsmWXQNvYIzh5lC066ZxitB4doIbcOUUPp/TWCZnmgG8Iq87X
 oiKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wH7tvyXI+V+oUVXrv0GN/+yTE+Vz4X90XE51nz7hzYM=;
 fh=wYhvLxTxCo8KRabU0fqCMGHIYhEAe0xpLRTht+2qUhU=;
 b=QW+buzpwVuiMxHx3LRGu0ez8CJIycvOKK+D51wyYbtENJYXKkSDjRM/BnskGO7kKoN
 h2Czmz4wZolYIQByFtOwfCOedtCmHWScagSQFQdEyYohyryKsE4Ms9VawTGGZufXaWda
 rcYqhX3AoSlWq7db1dR+ESbZJclV8ezhL+iu2yxyVcFcx1f4pt5alqcKUj/8KeWQCzc+
 QKzWThT51xeP304PTd6awJ0nYOywTRKWfYTyDuyJGSEx0qHfc7MHP2O4n/LBrqcz1Vh+
 PVrcCoXIjuACxzG/SWRl42R+98SBmUTIaGtHrJcPQDtz5VtRXFrsYEbrhiRG4BaLwnAJ
 zDPg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785252364; x=1785857164; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wH7tvyXI+V+oUVXrv0GN/+yTE+Vz4X90XE51nz7hzYM=;
 b=Pxn/5kEftHvOWC43SmQiO2xcuTyf60IEdp71UUo1uA4PXCElGumMDi4kJBcClE7Lnk
 yQsSAfsXf4TSwKAjDcHfBpOr+1pWuPrezvjsekr1+jNqk125MUFCCFZub/iK7JBd3CHj
 ZgsPX27rPctGHHowrcDKtwnat4e5/5t+Jgf+yeoTR8USGejWsyzeEOebMVmJaN3nt0tn
 XTWWPP/IgrlnhV1MjD5kKvuPhXpR9cZTs1Bg+fyTSyzxW0HtmsDb5lQjmC8TdkwBS2ZE
 yUqnMYSh29Y1ijsLBRpwsOIc1dE0QHRv3q+KTxgdyhkzfXMavwLW+lPTVWMGBFFPNNlg
 4ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785252364; x=1785857164;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wH7tvyXI+V+oUVXrv0GN/+yTE+Vz4X90XE51nz7hzYM=;
 b=JsYox5BCiMvqZph9mpjjcXQcmklVZ2C0W1Krn7s94IKEz8OQRpijmzk6sx4Av+/XDo
 pXViWuh0j+cglJUmcgo3OrvWh8Uj47RWKNRbe54DcJqi8fFsZ1mBWUQ/+YOlX2YsZz7o
 ZNNNndPeSPKwwTsy0C6gOH8kGjAudJNAJ16+meB3dO+l+chk9wNXLGpYiX+JjdNnAD6L
 inZABZGEdTroCKLHEB0qF6RwkKQwLxQyINhhknwEz6MWX+ZElzsfHRAAoN0Qg/AP8QO+
 QTcbxtJ0HfOgjUlWRK4SbFJcMQclBBLWnc4eprhnoBsX7IwBplQ5ugaikn8J03VPIaZF
 ta1w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp4TRNxeu/C4GbQrScBhHFZJJ0X2Sb+99hEEPpoQEztnZ474RVnp3LtgKAputif+sdp1mRbqeI6Ng==@nongnu.org
X-Gm-Message-State: AOJu0YzepxrYepm/EJJ5xbHrux6GMXguPGYYOv1GPCRw8DX0/ovy4LZt
 RSoSnssg2aRp5vUPHp7MIvmM0XjdFcOXmiZA0HZh7QxeYjvD7oaVwpaxatP1E0IIMGE+SJxzgBO
 tQIQeiDfZEj+/t2sTFJG5Ce6+bj0SN6Rz4Lh+lHXf6w==
X-Gm-Gg: AR+sD12y/s5Smwz3i4bXRds8GxIIjeFjuPhqcUcIvvVeSdl/GVj/crDhgXnxVeK2Mxd
 k+tco7qfhJhs7t/V5qnNJfB6YRjL4p/I+FVi5FmkHNdu401KETMpm3K2SX/QVfOzuYwJNv6YxbU
 nFxKknomHWpSHXx6yZwwEnjUQEc9aT2X3WHcu2jsGUJ59Tsw5I7Qq5TR0PeNaxljaOF6B4ZlIGa
 vkB4TScPuH6mfcteLwTf122VrY8Z5kKzp9w4wSgcT0ddbbKPHBA6iEgPeMUUzlR3noDNmpAYA8l
 Yv/RpBzZh0bIzLPoWX+Enr3e2FHDQEZPk0cb/hdaPO8qfF3F+7Zsu6P3
X-Received: by 2002:a17:907:3f96:b0:c12:96af:acf7 with SMTP id
 a640c23a62f3a-c1f7215156cmr160463066b.43.1785252364458; Tue, 28 Jul 2026
 08:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260721184656.530230-1-richard.henderson@linaro.org>
 <20260721184656.530230-7-richard.henderson@linaro.org>
In-Reply-To: <20260721184656.530230-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 16:25:49 +0100
X-Gm-Features: AUfX_mz4OF4H2c1CkcBA3ZOM3GuadHtto9Kpim15gj1c97i1p1joOMu-oWnwB7o
Message-ID: <CAFEAcA8Y+0i+XdMX=MNDK_UdTQ49+DiR9fLEqTQHPbxoWq9ZyA@mail.gmail.com>
Subject: Re: [PATCH 06/20] target/arm: Implement SVE BFSCALE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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

On Tue, 21 Jul 2026 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        | 5 +++++
>  target/arm/tcg/helper-sve-defs.h | 2 ++
>  target/arm/tcg/sve_helper.c      | 1 +
>  target/arm/tcg/translate-sve.c   | 2 ++
>  target/arm/tcg/sve.decode        | 5 ++++-
>  5 files changed, 14 insertions(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

