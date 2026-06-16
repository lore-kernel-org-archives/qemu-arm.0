Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CE9CD98E6
	for <qemu-arm@archiver.kernel.org>; Tue, 16 Jun 2026 12:24:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZSps-0006kB-Kz; Tue, 16 Jun 2026 08:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSpr-0006jZ-Ev
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:24:07 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZSpp-00038Y-Un
 for qemu-arm@nongnu.org; Tue, 16 Jun 2026 08:24:07 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-6626cd98209so4679372d50.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2026 05:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781612644; cv=none;
 d=google.com; s=arc-20240605;
 b=LjIrMfzgHqEikOQxH7z7FM/4CstpCZz1pGdMcP1UV+9NcHix/Py9fC5+fKQlImMR1d
 9HAKNXxC1PLuVwdZ1DfobPSsPSHwfPomgTN4iWxn0BuetVULQAoIsaGcdWFj7lUnmwmY
 kbOjtnHsn2p/EyNcuZneMLqrs4BO8MdZwi3WL6nQU6eG1e/1FPLhfei/wYTvrDiXPb7d
 qMfQ7TJBttjf/UT1sPK9JMZvewbA4hXWCT/7suWN/F0yfKz/m3N/PRIzh5HT8Xh0WV37
 yAgbkbTC0HuaUF/7Aor9XLpYHobw7Skre4DBmdjEjQg+5Qx130Ix3pLe3Dv/YEX9T35M
 dqiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/B94nqu8Guq8yp5C/hGc7K7TeKF1J8c/HoyWNijNJWE=;
 fh=Vz2NvlWPE5PYZ5DEOCvvQVJ79Ci8XjJVHy6f+1gzjDY=;
 b=dv9JJaDXWzN6DGIjjfhm+DCHnZFfmfkFGjB/UIk86Bd2WIX6VvrJ1zaEcP0qfzPj+I
 Uf4rw7uHKDCmrxZ9F/gOY9fJQMwQQ13fYHLAlTUu+oCVxT2vS3tizjLpcbnt14NMVr2H
 RvywgtOjHy4fKplh3WAnGjo/x78p/f7aBqyu0iJT5lHdsUA76j4fLKB52H69HeQ8yzyF
 I2pZ4GQiMnRcjisXMcIDXrcfpAL73QmE8CwGJ8RKrJPt5isGGpOvH9iLTZ705DpSFJSs
 rUq8W/OxnyQZ/KX0vG0cpyVN2ZxowIrTUJwWmd1uwz4KiCY6hW0ieq841OqC5B/Bb6nE
 TDpw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781612644; x=1782217444; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/B94nqu8Guq8yp5C/hGc7K7TeKF1J8c/HoyWNijNJWE=;
 b=F2riTnGqMfKNqWxgVolm+dwXIrL09YfLH40H61dIZFBkJ1GoYoq+HhAW3wXbP8Lzcc
 7gb5L0pnhHyDrIE3wDqmKlUeIRhNtYtOUVU1B1t3GlmaTxuTImgBak//RChIcMrEImMY
 g4BL9uFvIh4Dzc5ACJmY+vGalYI+L6IBffPfgrMMy06gRa8PzbQMX+CBAmpz4pmLjJO+
 LVT1frlNoHa836lfj/5FuLWAcvswpbxdp5GE3T7cRVXyNXFpEzBDiJH7HR0ekkTWvAWy
 ufmy1VCOGLhMVb8zN2KKca0RlMPUSuO4QsacvM1ZcyxHu+yYhhn8EMXx6jvuh9OCnfkd
 5BRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781612644; x=1782217444;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/B94nqu8Guq8yp5C/hGc7K7TeKF1J8c/HoyWNijNJWE=;
 b=qOASwsDq4jfgVnEGoPOnv2r2NF0wMjgyyUlrkVyhpdH/ByyNQiELPSnYcObTTNbyB2
 kW1cZV4qOk0Km+MnHu6qRMJvH3AlhIYdLtW2eRfLvKBDm9CGZJkdXUO6KvpZDRL4vznq
 01cR/KJUymJ/Ac4MSDYvMT8F0IAyDjciApg6JmYWzstIe8HaUycHQw8fJY/2V5OJf+Il
 ypCxIwtMWYPktcFlPWwyxbvNoklRM6+/w3/TShlv4txZ+qBfNvYlwm3TGHeWGlUgYoAL
 khzs4DIi+I6G4PG6H//Y5URIZyday+acsk1jVS6LOBVxGfGAf/3kOaZCyBIvrXElInXX
 z5/A==
X-Forwarded-Encrypted: i=1;
 AFNElJ9g2QA+gPZf/NdYXLHMcUQja5f7jFsjpy3l8O9YqzUSsQN4WJQt36Zen4Z+sjYP6+n2C0zQFdbpig==@nongnu.org
X-Gm-Message-State: AOJu0YzBf1iy1l1DrV2DTACQPuzjE9yCq5L+NBv1DYDziANKfuPnLJrh
 KZY75xFnrF7fdL68RGxKxrarg6iIgs03RGAk5tnr1o0V+jSJP2Y5EmoJZe92R5OEsOH3A4ze49+
 rtY+yVkkV7c0NEYNCTSySfKDpf5EytiELWkyIz9ReTQ==
X-Gm-Gg: AfdE7ckuKifOmehRvDudem1ZA3VQC2eVZ5KfITPGlHOFJSLmQjzlF5bo5+gIxRZ3Lz9
 GtS64QbpcfeObosm9kvHHARjBI1nYo+chd/gF0r6VMER4sCe6GpCyjf5P9ZAldV7fUeS5QbU8ni
 NfNR9zaXNnt6JyRgiv55A+jqydYfVH4OFa03DoCWipg8Bzm+HCZo+UDj3sAeymnIth1dbog8KL8
 KtZOVnOUpdoPXVuL3Skq2ik6PYT3OENdoebNMrXM9a08sohdaIDqzc/572l4qL9TdgSxlQKMO/L
 jOUAb+9BQ53dSUV1iJGCrKiLnlEq30jVv3eqj0YrwH/yYJgx0aZ/MtyeZRae032z0HY=
X-Received: by 2002:a05:690e:4390:b0:650:789b:a3c with SMTP id
 956f58d0204a3-662b6105c9cmr1704342d50.35.1781612644509; Tue, 16 Jun 2026
 05:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260604234852.573178-1-richard.henderson@linaro.org>
 <20260604234852.573178-6-richard.henderson@linaro.org>
In-Reply-To: <20260604234852.573178-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2026 13:23:53 +0100
X-Gm-Features: AVVi8Cf9_dhQLNh4XVACnboRTQYHWGRkBc7jEPJugMFR7ckYNT9TwXQfPUbeiKc
Message-ID: <CAFEAcA_-c_Q8uwM3qdP76HE=OcHokEEjL61PPwPrnfWBz4N+HA@mail.gmail.com>
Subject: Re: [PATCH 05/25] target/arm: Implement SVE integer unary operations
 (predicated, zeroing)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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

On Fri, 5 Jun 2026 at 00:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes ABS, NEG, SXT{B,H,W}.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 15 +++++++++++++++
>  target/arm/tcg/sve.decode      |  9 +++++++++
>  2 files changed, 24 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

