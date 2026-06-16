Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41297CD98E1
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:28:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZSu6-0000LX-6M; Tue, 16 Jun 2026 08:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSu4-0000L4-LY
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:28:28 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSu2-0004qF-Ow
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:28:28 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-66061993121so4528726d50.0
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781612905; cv=none;
 d=google.com; s=arc-20240605;
 b=UHP5VjzkasURyuxlu/GSj6yZzcYVtcEagGSgAe0Jl6C9KtqpGeHQkbhWe4BA17dlqb
 7fMP35t6FpLBHvIXtQmmHBOXrsT3FnAnJrFqCkU1BxEfkzDkzqEOBvC2nSWQ37dFRAMR
 4CwkVQlsplF/SMMmQm5Qzbijs8oaNsKwrTHv7ty3qpsuTHJc2EtDaJSCGAH/iUvPmyg8
 8u+r0vMaZv4gZzteAoHQo/XCmCwxsGu8PjUJQQfB07s8SA+/jZAmkV/8QkGFin7MxsUW
 ySfsecJfk/upquepll8A1zr5GD2ZJWbopllM6TKP65Aso4x3449KS5cR8qaccFBuAfCp
 S/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=cykzMoqhj9Pvqurt1E/yxJhE0PiJuYvWeaXlCrunfPI=;
 fh=rI+m/ZoLKHIZk8v5prXefSLThpw8Fy7G7yvcDUc6nbg=;
 b=RfIVDtv4lRGxrxuZj+7NAfuPfsQcCuegTi39b3DVHaqBpV5VT6dMWfUhUFlkZiOYbe
 5jMK5rm/12C/8byw7r51tb87dJYM5gGaKHkZ2/F/50afqjZ6Ttd5ZbAtTdip6V40lwvv
 G3SnJPYBmCl0/gXpeH4vEshMC9eeAd/LXltGYtAVeZI0kagAxD+H/L9Tx0UEhSxNh+E5
 C4SP4nSvWzk7jZuukv7BbsBIrDdVMRqIcvQGBzsDNktI/r39Zl40Dvpb8WVjSFP8YhC0
 XmaFXn+QbZo+dOosxFXiyyfL/PvyFDsjTFErDY94qed4ughlK5qaqWIe1dd1wcTJa2d9
 Ypyw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781612905; x=1782217705; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cykzMoqhj9Pvqurt1E/yxJhE0PiJuYvWeaXlCrunfPI=;
 b=az2NoDMwAagCjS0gSsOf8tU4yWXp1vMZ0dM7WUVIz3+imsIHbJVXxFBK1sMZnt+scj
 mn1l0Eou+e8Rd0r6q09uv9kgYrVkWV3I3OK/OQSEOC/lu7Nu8dVq1ucXRO6zKqwhlsvI
 IAZLYv4L+47Qfev3/04QOeOZ/03UdBYA22M/wEWHf8OrRpyvK/cgGqSgPY80gXU0Kq0x
 hZ3KrIYhHIYu2Cl4NOEfLDPSIJhlo3u1hNSAcUVLC0ljTbWq7WmnsDATuTHrIiytve+L
 RCa7SPPRC/xGkESSIA2nMJcZ5K7aDmBQadachXyKJ+QV3kH6Gb2u3LignPEvycIKL44B
 36yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781612905; x=1782217705;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cykzMoqhj9Pvqurt1E/yxJhE0PiJuYvWeaXlCrunfPI=;
 b=fn+AjOAcPT3osFrTKn/2MBqTM21UDhAduwWAJDGgFC7i0oRxWgV3LAVY9o3IGVBT9s
 o5z4XiL18mio70r4mKBxw2PtIbJuBc5ziHy4NkkWmR4yb8fTX1wctyp+UZIUUq7fE2g5
 t38IgGexoV8CFwNkMHcBLauk9Rg0n9Rd3KNaUS0bBpTSeVInS3PumlcE2ojWeiwIlDBb
 DqZpLbFEAPSBBTUE8yb+ip5kjHQmybqJztIkmY0/zAESUFR4tTv8TziAhUvx3g8N5Uja
 CIKLacz95QCB1kgjrbIB5T13MgKreXfztC5z0UEHw7vk9dx+2ETJ25KIvvf51Uohu/X5
 irqA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/8SYtwi2+968F0UY02enBh4nWU+RuEVGeRXFbux31NJA/nCvS4ESe12GGYq3TzHZ4+nBF6rSwq5Q==@nongnu.org
X-Gm-Message-State: AOJu0Yzlc9nK/8JvZ41yITmVVkSExjpmJtPIyyysVE075V/Ldh4nL0Wx
 GD4uQF3BurS+E/px0G8WTq6Qq2482c4IRnsPIjQwWeL0MzillMFJV2veGn5hkoe/WKdgHqVYlEm
 zOHfIFfaji/X+TfqGXNwM5FEoni8/14/ZtyQK7Vw5Vq0ck5DgWTX8
X-Gm-Gg: Acq92OHBwrmxECrP2JjLdhdiT1tBjnAf7PLuR5YF6bVc1sbCnywmo08YQoHe8T2rMb5
 puOTq52orau/RxmINUqyaNbL4wwWSgNFqFEhpReXeToZhtv/bHyVqpnSpzK6yZlo21ejyU93oyq
 9a4IgX2gJZwZmG8ImPa+fk5kb03vMPpv9oeieipbmVOT1u0ZKD5J2T2fL8MA5m2mROFy8rDNICP
 JHeaojNzbj2ysaIbZeU2n7jO5Z/O3/6a5LNdNQJgBYaHeVLHut1fCSubgKEfbS0N4dnplrT9UFO
 /ErLIMdXYYfvd9IGqbxC+8AQjlUd4+tEp1dFqwtu6RwJD8Y6B52j+cFElTp8c+cRbDY=
X-Received: by 2002:a05:690e:1309:b0:660:e35e:ac09 with SMTP id
 956f58d0204a3-66284dcd488mr13199491d50.8.1781612905274; Tue, 16 Jun 2026
 05:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-8-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:28:13 +0100
X-Gm-Features: AVVi8CeIhxEb8xrvUVQ3ru7VRS1qBDcDC0fWZxP2YENubg4qj9rOu-1Op8RFobw
Message-ID: <CAFEAcA8N8ERKTVefUF7-YQC0F+=LBMybFa0RvCsUrnuAxT2mSQ@mail.gmail.com>
Subject: Re: [PATCH 07/25] target/arm: Implement SVE reverse within elements
 (zeroing)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Fri, 5 Jun 2026 at 00:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes REVB, REVH, REVW, RBIT.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

