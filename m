Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp1950529njc;
        Tue, 10 Jun 2025 01:42:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiS8AzFCxO6W0H4cUaHmCWPp/oWvI48iH44K7lIpkKP6ViT3J3tcXUE3QfZLOdp4x6og28l1cmpcY7qg==@linaro.org
X-Google-Smtp-Source: AGHT+IF15Cgj2dQ+iiXoZLdtx7k6XV8LCisthSWPE0lAeBUYh54p6TGS6nMeF0l+lqDvHdRYIrLK
X-Received: by 2002:a05:6214:2682:b0:6f4:ca4f:43f8 with SMTP id 6a1803df08f44-6fb08f4f62amr227712926d6.6.1749544963210;
        Tue, 10 Jun 2025 01:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749544963; cv=none;
        d=google.com; s=arc-20240605;
        b=juERLWx/UPLfZJDEk3t3dhmSWUgC/V/iOXhXIqqNgmF7paXhfOOinSHukcBXik0JtB
         xpYzy1W/awaZa81FxFunvyLNVfo4HYjak6dKV//BaWep8XckdrwP/4kaNsjn4Q9Mg0r3
         uazNgcNyZ91t8fWT8Q9fOPRsd49Q+nq2Sau/zfMWaRLV7gRbPrktw9THCb9SGZzco3Vy
         clLEBxiYeGIP6FPnhTWVIXy0cItMX1srxHLB3LAcPKeo+lRF8RQ+cZMcrRyt6qXa1ShO
         ssLIgglb0yqCn0DdsRlCeqakrNNzyJPB1Yr7M9QFygJ2fvU1WqaRiZNq4CdlpGm3iyI0
         u6tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZIuPnCGNokh2r4qO0IZf3QHexp85bC7lYzuRr1HstuA=;
        fh=ToG9gWQHl4rKkPaKTSvYLyXRTepADijZ5iboFEyuOjs=;
        b=Szo6K7kInQ5BERGAZYAfFVjBiNriCFBUpm5i+dZRpYGj8aTtK49tUTPjdyD0BVT0YQ
         0dJ0vGGV9Vbyui85CMovcG8XZr8d8s6G/6GPp1wnQh8x+TCN4HVufOHdMrPlAIHwYgQW
         DD+Te62mriO0S6eXDWYcMZXH9ddgKJMha6h5qnCFNcqLgIMnQHxl3YFaTgF3DV81pxsC
         x/iBShLhqcCT/bmEPsFdpArj4VSY7GRHYo+8zm0Si4Xd8nf4VVqW0vnCZ3t+r+NvGvLI
         goJtyXWn+t/LH0sh1sZeqODHqnc352AQt9mrS3ANvPv5xIK79CZ+1tDkZXW663tMnymb
         /Rkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ss40eniq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fb09b2fa20si92159216d6.378.2025.06.10.01.42.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 01:42:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ss40eniq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOuYu-0006Fq-37; Tue, 10 Jun 2025 04:42:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOuYs-0006FU-SJ
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 04:42:26 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uOuYp-0003cj-QQ
 for qemu-arm@nongnu.org; Tue, 10 Jun 2025 04:42:26 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-70f862dbeaeso52294437b3.1
 for <qemu-arm@nongnu.org>; Tue, 10 Jun 2025 01:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749544942; x=1750149742; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZIuPnCGNokh2r4qO0IZf3QHexp85bC7lYzuRr1HstuA=;
 b=ss40eniq4u3XWzGuhdoBf3upOrpOa2Ezbt7tYLO6K/E/owcIc1k5U+WSwpQWEZ9XUR
 iDTIHwPYQ7BIffRNmfQaFMRKbQUZgcW8kMRCn8M/jHHDw0fI7PDueJcKk/RwvZ+9zLj6
 xV3WzSnd6Ctf+Gnl2cE1gu6aXBn3z1Jf5nurYQs0CrY/DnBowYsrgHOQOOMnuVgJ+7bW
 1UCUPNYi3LzMFCP2kfhvK76sC8Qwbdo4oL1JFsacLz+C2IvE6pMV7X9LOO331lDZQbvw
 cpvjOFeMWGMumAxGMuOmrnb1JKM8ZvelDWLuIjjZCnwBCzi8TUM5mJ2kQg9/oAQinZmD
 seMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749544942; x=1750149742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZIuPnCGNokh2r4qO0IZf3QHexp85bC7lYzuRr1HstuA=;
 b=SISBaEHZELD2+XtRuqSQUeNhtcqUQRzRI5ED9ffqDz40oLmaf4CmJ1/epim58G1y2H
 tojdgVA1L5FgM0eb3aUzQF8Jv4UVtYvKGahQuZVT5C/rgLToqvQDC8Qd71yIg3XWEZIw
 FPSCbmPgT0VUCzJrJZSprtV5G3EayaGIYTiJpOorbcY2a7CBMmDZnFDmh3BS/CRpR97T
 jp9A5N02nGGLZ49qUJDDYTwD3CrDFOQZJNN0TZuxcH+uA1jsjF3vvtNw+5WhG5WwrSll
 6ra95ireXRRLnV89mhD1AuMVkdar2YdZv3Av6a0fyw2IhRmTTOnIJpnEG2cDwv/2W8cC
 0Atw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXosgJUii78Ad++bKhw+O5QRMDLtEw6XKi3tiG9sllTjEdSlii3SflgsN/tQe4h7ZmbuGsmKqOo7A==@nongnu.org
X-Gm-Message-State: AOJu0Yxc8SRxNfOkQyrolkvulYiXuIQZ5N3uZ5JTvhsXaru2kirxsBc2
 eDk+NS7Y2jgSPeyozC24ssgOfzdLA7mjVGJSsxfbTGT2qV49KPnQyNv0to84P+fq4axLgAFY0ik
 yVmLcXHMh4Pnm/dPZVKlB26tDcir6C4XGU3tKEnmhN/YH+zQoRgYu
X-Gm-Gg: ASbGncsI7TEI5ydH00o5wU9l2Omy2kg5/MeOZ0iVjgUQwdfsm+TmpZXH0YhLTK+yNAY
 iiSkYVjtF+PvJKQgF6QDnU2/I/vrHaXZtKSxXcvKNzrd6B2yHMbJ9VLTp0GFfDfT2ebXn9UVbs/
 HNx8etci4ToDSTZwk3PSxiZ6Ay1o1tO86dUg4hQzQML+cs
X-Received: by 2002:a05:690c:6a02:b0:70c:a5c2:ceed with SMTP id
 00721157ae682-710f76ffe14mr221894887b3.25.1749544942061; Tue, 10 Jun 2025
 01:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250610012851.1627715-1-linux@roeck-us.net>
In-Reply-To: <20250610012851.1627715-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jun 2025 09:42:10 +0100
X-Gm-Features: AX0GCFsI9n_plIj9Jxbgt6bAPEPMgxofXuZ5eYc1CyFiD0hVGfQM2QzqVQkSWvQ
Message-ID: <CAFEAcA-aznHrcSk9xfmLHkpJTiabjd4oX2KnvC5TXkkLgW6n8A@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/npcm7xx_boards: Add support for specifying SPI
 flash model
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tgGPotRnEdcw

On Tue, 10 Jun 2025 at 02:28, Guenter Roeck <linux@roeck-us.net> wrote:
>
> In some situations it is desirable to be able to specify the flash type
> connected to a board. For example, the target operating system may not
> support the default flash type, its support may be broken, or the qemu
> emulation is insufficient and the default flash is not detected.
> On top of that, the ability to test various flash types improves
> testability since a single emulated board can be used to test a variety
> of flash chips with the controller supported by that board.
>
> The aspeed emulation supports an option to specify the flash type. Use
> the same mechanism to configure the flash type for Nuvoton 7xx boards.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> I don't know if there is interest in this, but I figured I should at least
> submit it. Background is that Macronix flash support is broken when running
> upstream Linux v6.16-rc1, thanks to upstream Linux commit 947c86e481a027e
> ("mtd: spi-nor: macronix: Drop the redundant flash info fields"). I needed
> a workaround, and using a different flash model was the easiest solution.

I think the question I would have here is "is this the flash
device the hardware actually has?". If QEMU's using the wrong
flash type, we should fix that. If QEMU's modelling the right
flash type and the kernel doesn't implement it, then that's
a kernel bug and the right fix is to get the kernel to
handle that flash type.

thanks
-- PMM
