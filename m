Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2471FCD98DA
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 13:15:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZTdU-0001GP-4b; Tue, 16 Jun 2026 09:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTdQ-0001Ev-Cw
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:15:21 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZTdO-0002Yh-Nu
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 09:15:19 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-7fd8446a1cdso4461527b3.1
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 06:15:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781615717; cv=none;
 d=google.com; s=arc-20240605;
 b=RjRkoVcG44xuxzsIZAy9puFAMM2mHBMT1o0lXV1Lmk1Obb/ufVCChw9+y2MOHRmIHq
 XIwo/0DEs+bMNRuf+iyjFLPh5kpx4U28Qijlcr4iWYSsQgdnMO7768jfSSjT8+4LtWcs
 StCmqqArzp2aLCOvarWHLb0SvpGc1yGxeetn/MxyCO/6nchu1McoXNIMCS3mVVNeLwDT
 vNwYUPXV1XFOJgH+Dune22XKGoDQmpOgr7h5FGvB2pcOvZD4p93/UtaFjN6+vxM/c57j
 qUxQfWHAY+yagUrNQKZirq/45vl/rH/W0g6xnC9qivgxXZh2BVF6TvvACcwbWQO0Q4Uu
 HJeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wiwSA+eYC5719VbwnHl5FA+TKINMENvh5LtGUpUzGHY=;
 fh=PpMq+3Fh6uypZRG7OrrJNdJswiMtTANlxU4cdl0Ntwc=;
 b=Kn8h6DwtBTiZyc+QSopns+xu7KwDO/ibuiaU6JGFkVzkKXY53GIw/f43eoK1tQxysx
 5qO5EQClolvsECzBgB4aCNgXZ5usu8hl0yF2G6+5AJtGVen/ooD0vS68phqn7RPKlchN
 MBDZ7VyUS1EOy4sF/jMIKaoVrvavBjxllzyWs3rjyA06J3K7YlXVdoDrYDHLmKxZs1He
 fA2DqSV931LnlW0gSafx5pspMwp6SJcm6ZYNPXP86R8PdzS2OdC+DbBFO8emuc+s3H0U
 K8Ca//XuqFkEzMRbkjRAZyYRx48z+6E4Jsm+m+XZQToOGMjFW7kskUGfLaIVg4F9U52S
 lwSw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781615717; x=1782220517; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wiwSA+eYC5719VbwnHl5FA+TKINMENvh5LtGUpUzGHY=;
 b=Q+J1xxhaLUyfDx0DovBCeZRZt8ImRocQyFR5x+5FOW7Ou1sby6N4x7ZOCYrZj7MC6I
 k2nf/o9RYlsLc/vZjfFbocWCQaWlcNR4Fy9uh6mzwxGZi3m/p+/T2muUWDH4zL2rKr0O
 JTQhjpW04B3FQjYSi2MXGSn2JEYtjP6fLGF0RE46JeOr+Cxsx9/l4jjGc7SPzRUyeUHq
 E3VLbR32bkyQkaw1SHMcusZwIcxGno0KZMSsw1663yWODVb4ce6KI3DGriJFB7Rt7aN8
 mKeWweV00UUNI8/sMfRAl6/9EnHKy8d6ykFz7mSPPufHD79cBxd8FvCe7FbD5YdhTCdf
 I2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781615717; x=1782220517;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wiwSA+eYC5719VbwnHl5FA+TKINMENvh5LtGUpUzGHY=;
 b=dqIYpstelP3DGy5RuH2tIPWxY4yOSgIPPdockpx/Qs3/G/ckPYk0RPBBV6YMpbs/0v
 6O+pP/d0SVHqV/MPEFikBwRFK5roPKJiV/UWisdM6bkQBfuma4LouC/iL4ouyv8jxZpt
 n/sx9fafFK3D9eVSnMLz/Cp8oYZjS8OjPWdGAATEwSh3KS/UrDW39iqZAQscocS9aVy8
 oYx2d2cM5q4yRBt5TwILizZX9vsrnphMLTe9zPH99a4jeccytzBnkFdHAGuHBZmJqoR+
 vljGhaxxFIutnwMtO+6UCjNcdC/VOUmbX4NRzx8/IRfQoqTy6NszaZfYaNodjiqpEqhn
 IB+A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9h0ZzywnNulDnBhSybAZvM4mCehFB5+EWh+/r5US2quxo3T9qivaHlI4g/VmAlS+2lTaD413DDgg==@nongnu.org
X-Gm-Message-State: AOJu0Yx1bEVANqDqQC1uYTG1BpVTEyUkWigyzZ6YMYCkcgZxdWsYWMcM
 LBAdYQbQbgDBRtb7OhI0n4fZXKsASebm61O7J8qFMyMLygNKdtUbBvNmE53e6zKDLZ1Dcz630Cv
 gJJQZOEfuZLThd81LBmLF1YIOREbH21LAuO7rO6Lj5A==
X-Gm-Gg: AfdE7clNxJS0nDAvKxbMVSAOnxHtApWdl1M1WhXiYq179wrNoH2SMX2ioMYg1gx7PWz
 XLeyqFT7pTn0FUbvva0Hqa5YslgUFfVyzMzXTwdHyJ+4Oq7XsZYYbZYKKcPuQmdIMe16N5nWPeY
 YqzJCX5OyIXVc4KN8yeP8RdO+78zegO2EwBYVpJSqulHQ8FyQb3fo0yAxwGQ59vimM6dmNsVQVw
 E/U96J0l2pt2s9co5CSiaQbARlhLroMxdtFjyxrV/4OkaESS4Idt9Trk9grZ61El17qy/UlMFBu
 OYWHT1WoLTSTggP6Obu4JlQ6bShGjEb+qKLWieU1ntmckKkMq7j5+zNhntGcOMMcDiA=
X-Received: by 2002:a05:690e:128d:b0:65e:43da:a470 with SMTP id
 956f58d0204a3-662b6190804mr2564219d50.30.1781615716936; Tue, 16 Jun 2026
 06:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-16-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 14:15:05 +0100
X-Gm-Features: AVVi8Cd4ukrQBgzMF7REWpzpomguZVt70zrJa7owfNzbxqBZgCKPTSz3Ouzr5KM
Message-ID: <CAFEAcA-CPdGLxR8Cu5U1FnijaT7aC7=xnt0=XxPLT-hFC=4kaw@mail.gmail.com>
Subject: Re: [PATCH 15/25] target/arm: Implement FRINT{32,64}{X,Z}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve-defs.h |  9 ++++++++
>  target/arm/tcg/sve_helper.c      |  5 +++++
>  target/arm/tcg/translate-sve.c   | 36 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode        | 20 ++++++++++++++++++
>  4 files changed, 70 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

