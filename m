Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B48CD98F2
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Jun 2026 13:04:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1waYte-0002r0-Bm; Fri, 19 Jun 2026 09:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYtc-0002qA-GL
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:04:32 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1waYtb-0002zY-6W
 for qemu-arm@nongnu.org; Fri, 19 Jun 2026 09:04:32 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-662d484ff3bso2389583d50.1
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2026 06:04:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781874270; cv=none;
 d=google.com; s=arc-20240605;
 b=ClwhuwhOTEc76J9rWK5QbV+FwD5Y6Dspw1N6v+aPAveirhhaycaLTDTqBdvAz6P4Go
 R8biPWZN46EB0mkx6KgOP560kF9jSu5DvcqhgeibZ8/XvW4cX9GHxWnd8Z0dqkrzgNXs
 luGroRkiXK5EFx9MqsA1kxP1zbH0YbQ5Avpg/OeI8iEhHqLyh3tkvHuwa+NL4UogfFVW
 ibrEm/1tCiGj5cuXUVc/SDlASidQg5Ser8vNiusnXm7P+JVsEJkcNLSHElC2HebALlp2
 5+X+jeLTvatnC5XRc0bGxCiWKWKRATJD8O10B/s+21668IWA1TibNO4pF42sl/7yhvr6
 G27Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=nFkVED47i5T7H99JAAPTUwfpJcuACdvrIDt9iBTjRnU=;
 fh=+Z7VuJe8Mwqm0FDTwlOfSaO9diuZ+D7J/CVZzq5lmQs=;
 b=CkBCdboKvpnN5QQ+WksMpy4pUJYsNvtMDlucYxmp2O+w3GGo7DrGiJEklHGkZdms1Z
 kAXYwnpiGp65nxM/dWDnwNQypu2Tb7OJkkkSa68KF/2Ki3LyUNO3NpzimA9AuTIxO6m1
 Jk0zW5jAOUhKc7IoWykVaCC9uaSo7QpHssy/4ChKzttRhOvZvTtwBAJVV78ggqpNKHNU
 Rq0yLUfrS0eEGBqZ/a4jPzxiSx2SCR5aeUBC9aAXe11se9Yfo8Zy4+o0+332/uVokPls
 RpHSqCaDDi0af8R1p3WtmimyoH66O/Rhlad8+Jso3OC0ekDJuNxHqcJxWl0bHDIe0c7x
 ggMg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781874270; x=1782479070; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFkVED47i5T7H99JAAPTUwfpJcuACdvrIDt9iBTjRnU=;
 b=SfCrSjQ08Wl+4EhQx14Z6mDl9KYwMHg86ZGJojz0tnIAylxnxnADJ19fgavPMrghuA
 ywoGAUDOUqRVujXuCorevAfFLTnyvdpY6Zvu1vlIXz0S3g+hUlaUY28go/lKvL4MaR/P
 45o8unEo6A5zCmKtujGhUmhxUnUNYzFj0pOVI+YMqnrROLAtIdRgMjB54Ld8IeGFIP7C
 l1PnV9K6denIEWIfeoVigirMTUpHct5zTJU9B5MOt34/LUw2cDu5X43tY7w/sPAP5mH3
 NDJlV+MoqBFp6mRZJufQhthCd91DMSvr7ai3cHTGjY1xIpvakvh+MqR1BmuLPeWGqIWe
 +Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781874270; x=1782479070;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFkVED47i5T7H99JAAPTUwfpJcuACdvrIDt9iBTjRnU=;
 b=mZYFZwlBnIiKXuimWXO4FATPv88OqxImVVfNma+ZnDw1RvZUpwbuUaL0Z0XTDjW25S
 owsmgwQGcssW0s97Tj1N692487mpG5MHthlFWzdkYNu7rRaUtlZ2nzoJ1+c46hA1b7oW
 EDW0xtP9d4gnGoK3hLKSUVb3iSbNjleoBQGMB8FiWz4srZssRjBgYlQquwMfYkZQMuvb
 YyIt8TkcQ4RppO8vL/b5wU/NDLekxDpLKOQ2DUESiH0MjyxRsE4ePBNfehjGE0yVkCeI
 morDYs3Cm+VFBoGrsIN+plwW4WZfikx1KaLKjkbneg09Z+HYIixZoN0u0bCakQFTeDnY
 sWpQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+sGGfHK2G7m3HJpf3ZcOQIJU/gWWvmLn+ppmCL6RV4DRQHDA1V7GoP2mpI5nAKYW5QdO+13v0BFg==@nongnu.org
X-Gm-Message-State: AOJu0YwNyryPSXWfj/+t9gEgqkHBlspULkFdRjZNx7JGcyFvB05A5JSm
 PUefvS2YKle+2Qb/UrWUNTMIk0UhTQEBLJyZZuBnn1GteqAAPqvP8AZKGufgEbePiwlUdboOcgt
 MpbjBxQdbc4XpsvOz6UEKBwS7t45PDir3NRyWm1bSpRny1itxYs1O
X-Gm-Gg: AfdE7ckNm7tYqtWb219tbA0GqfVS2LouoVRQRlY4JcHDnWdwHCvAyTlrdywExRQrCA6
 AhQmP828dMbMm2AhUze9JXc/spn9OVwHKCNZqoHoZI9cUqj8uNcBfU58i/Hu3CY8GDtxrKI3Xun
 4rlI4HGucF3+cf0fbNIZUuRL7GsaHrVHNPx4t9MplLgLmSPPqIRWF7aicGgedernzcJpVlt3D0n
 YHMoPaFtSTbg95qGzSQbXTQntHeNGV9kerK5d3hevNdbYOsuhxuBwGCjA8lD0EM/G4h0zQURWtO
 he3ZQwHFYfeOcK2GsdwVzfmGMN9a/UwCovRXGBXZDjVeNOnmpohP/abhRl8xS/ib1J4=
X-Received: by 2002:a05:690e:1341:b0:65d:93bc:dad4 with SMTP id
 956f58d0204a3-662ffdd7328mr2809854d50.52.1781874269794; Fri, 19 Jun 2026
 06:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260618040718.572950-1-richard.henderson@linaro.org>
 <20260618040718.572950-6-richard.henderson@linaro.org>
In-Reply-To: <20260618040718.572950-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2026 14:04:18 +0100
X-Gm-Features: AVVi8CcXs1kA0nJ7aKIcWMio5Wk1oFJopC5aBxvNtlYs_2ktiEiuXtwvaqTk63o
Message-ID: <CAFEAcA93AsT5wN-Cmkr_5piOHgBCb1WJ7EtaX+QNwdE6mJXLyA@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] target/arm: Implement FIRSTP, LASTP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 18 Jun 2026 at 05:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve-defs.h |  3 ++
>  target/arm/tcg/sve_helper.c      | 30 +++++++++++++++++
>  target/arm/tcg/translate-sve.c   | 56 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode        |  3 ++
>  4 files changed, 92 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

