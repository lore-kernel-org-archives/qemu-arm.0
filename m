Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93EBCDE008
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 09:23:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd2mQ-000153-2q; Fri, 26 Jun 2026 05:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2mN-000147-MG
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:23:19 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd2mJ-0006Sp-JN
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 05:23:19 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-80b0cd40dafso9872087b3.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 02:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465776; cv=none;
 d=google.com; s=arc-20260327;
 b=Kly/uDBH4pPCx+pu+knnXNEE82K9n8vLiZpj9xspk+i/53ztu5PM66y65RNGs+GL1/
 bJzTZVMDRZYo9mHcJUdhu3g2zKccF6e0Z9VI1tRyr3btlLZEy9Z2Q4gryDWkJ49YFh75
 312wBI4nGUDp4HdCZmY78eGq5NP4zFWka2EQCp3JXV/HIv9/32ECMGTpibmGVTKEFtXr
 nkzN8LQeFKWR4YoZfZBC5c4nD3RKxLxCUdw96XucGlqisoOYpDm2XnCTfneZPBDZYabB
 WvWvnIyQsYS5lLzu2BKS6hI/KkJFOJQIFtkENcgIG7TYgRtiVu/GzrQwApyPsBhCDMBF
 +CGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9tLL+7ob/JynzaazS6VpHSTWl1dz7nv1yrlIIWQlAJ4=;
 fh=7WGrIe/7wOtMwhRQuXmy+McVH51xapUghcImyQiL6Jk=;
 b=rUkJpxLA5t+jbbSOPtg6r7CSVaqmbQLnom+1D9is8xBhnrfCkYs6r0RloR9y0C7pzA
 rAf5/S6xPVCb2pg7VZz6aFy2/kDXH5Eboo/2KADS7l8bR9R9ydz+J5Zt7dQGxbFHmrxG
 iq5Ce7/M4PMliQ+gz/yFMZxuzoBJQYR25sMW7IVq/xAcm5zmykP668eb54Tro1Deoemg
 98kHG2bjqUF2h4xQbCtMnPe+A0XwIYt8gKlgd7vTGGqdAfZ/9FUmTP24wUrrP3H0Z8aJ
 wGBVksB0RtyE/eGBcQ1kAD5c6iZMuyY19+kCFI8ksZVU+AGxwIUSpaM0AeUJpLhl/neV
 cFCA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782465776; x=1783070576; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9tLL+7ob/JynzaazS6VpHSTWl1dz7nv1yrlIIWQlAJ4=;
 b=BlgepWeouCvJIc3GFSO6LMaKzuVziVfIdM47QO5mXOCrwsyCRWsJlH70H5DNLXfq5Q
 KMWsDEw/SsBczqj5pD7+2gf+UQERIFW12GJy8eW1Q6MMIr9EKbUFOZNkh4qm8NvRZg0k
 YxvMzrAIQa9z9LwnbnSNTjbBlUDr4xyWFyO5tpqQPuMc2rjEuPzmS7kWi9JNa4d+dcG5
 cjBk7DFG1BalmxJs+qOfq4KQOSgv5LrGP/rloVW/DK6dG8V4OAQkqhrwMJQ8yHcaJKFR
 Axrp2U4SLjWuTICQfvoDELd1laJSrdbS6QSIwfQ18NFR+8G3VCjFCkCKtFh7vNjH5RMQ
 tW3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782465776; x=1783070576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9tLL+7ob/JynzaazS6VpHSTWl1dz7nv1yrlIIWQlAJ4=;
 b=e8jjVYL9gragayqz4r2j4kUCoedKW/m7QBWf8xdhn9sXKHy6oQokB8WW0nM1M7/KES
 dZWiPYvmDceVNa3UiEWv+GyuSoozmNZNT7dcdO9pX1X1Oj/WrExM0E2qGM49eSeaEYcu
 4130Qza3tGZmL9V31m1glMXY7rtpmwjiFQIIQJkERYmNlOrecL5a8D6Oa9s5zEI8zYkr
 8Mj+Uf08ncjTSxxyy9DOu6pO9vYZMAYHtA80e1IEPssKNBe+6IW2KmepiZUsDBb/qIXZ
 x/QCAySyE5R+qDfU2ZMAMgQ6ieiBgXBXnGCxxfT8JYrEIg7n7V/G2iO7YMXxSxkAj9/9
 dT1w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rrxjzs6YmNtuf0WGGglSQfeDtXVfmxvX6/qKCwzkBfiiNuKcdg5Fdv+2ZeBPEWgQiZ9Wi7HL+Pbhg==@nongnu.org
X-Gm-Message-State: AOJu0YwkDPrfhlolycWr31rOXGnCOxqEIXY4gRKNILHKeYZUp7BYZwlU
 9jlgagJM5jriJCc4LaHk1vr8vtRPasiOxfAPQrd1T3GzazB+GO4SPG5qFEqnd4PBazAWhQwwArl
 qP9f/42V8DzkA3tlWnohldAH3Ab7yGFD0Ba+Ky8aTIQ==
X-Gm-Gg: AfdE7ck8mgCVKR/ldPN4quEsdzDEzLm5Uo52GOyJLeoyCmd4Spi2FVbm8Lslbo2Ffet
 1DUEtudqX3qz3GCsqprL+U2COAYPyrwiAY2yMwb3efcFyKe7UCdZs0XtZ7GC6MEYUfpeKidNEEJ
 l9zxhQJrqDm5sRwzIGUBdx8wG4N5DZ1cFo5hvi6O859LGTaKO5+JnXozwMgAtujtD0wxAcBnEFQ
 Y/45dj/vdxrC05vtcfuXcPu+mrSHztkvLp1RvDrtzbR/G/hmcSTHGfj9Z21YsnYs5wn08eO2rge
 em4fWy3AC+XMx5cm1GuC6paHY1DVPwn94V2TTVGgJz+4tDgcBDTQi9sGTMfhWG7gXzM=
X-Received: by 2002:a53:ac8e:0:b0:662:c6f9:946b with SMTP id
 956f58d0204a3-663556cd2fcmr11967703d50.35.1782465775575; Fri, 26 Jun 2026
 02:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260625015159.719300-1-richard.henderson@linaro.org>
 <20260625015159.719300-8-richard.henderson@linaro.org>
In-Reply-To: <20260625015159.719300-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 10:22:42 +0100
X-Gm-Features: AVVi8Cel5PaYX8UaCIQqlH3RY5N2a4-ISyzVFZaRRezfPQopaVrNFCZ29WJnSSI
Message-ID: <CAFEAcA_iMcGA57sYvAToG_gaW1jFoi81z22EHcQvjj_v+bYWYA@mail.gmail.com>
Subject: Re: [PATCH 07/10] target/arm: Implement FMOPA (widening, 2-way, FP8
 to FP16)
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

On Thu, 25 Jun 2026 at 02:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

