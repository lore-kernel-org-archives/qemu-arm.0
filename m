Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D2BC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 13:28:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd6b8-000859-0L; Fri, 26 Jun 2026 09:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6b6-00084n-Oa
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:27:56 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd6b5-0004T4-07
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 09:27:56 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-662fa4a4470so1106657d50.0
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 06:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782480473; cv=none;
 d=google.com; s=arc-20260327;
 b=PccpQkC2lhbPIwqr+nVyvCTkNtHCgf1Dz+NIxUFVwrHSDHFCp6CJjZKPSAe6prU05l
 80UyLepqN8qPqw8FZwaZfLuF4WBgv8UHg2XAon78obIWpYfVKyNAqxz3IjyhPDRHIEYA
 PbjHVy8ZAhytDJ8p81N+DCEPuHDfe1FZvPlU6nbSX/exdRvHyY0XgP9xhbDvY9UszZfy
 Tw3cL1Yw2LpCjjagbyds8F4CBTsD/cS4IAE4HeKgdShKHZAal4BfyQoA3spmjlQ/z9bF
 Gk7geU67ybYXbZDcwY1L2yzEe3fJV64N21T1F4SKkBWxRqiQJn+Dpznb4jYLvoiTRX0q
 E1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8VwcliHq8xl464nnWTtg3JJJwkYrSrQwNu9NWItGi6w=;
 fh=6aFYZkdqWJVs3bUdN99efeHtPRnwgQvwFBB0TyK+V5A=;
 b=lWwLi3qt7X46FhmkgtdlNs3k1djQ7bGdAJWlTzbtetzXKPYRNN6xfPHf9ngTVH1mEO
 zUG1YkgNbeAf0mWsldjyaVjESdgUz2bUgdAGW7ASZ4zV8RQV9QJWG7uOq/pgO5Y/sHiv
 EP5PVXkdc7kzKUQTx7WEh/IGdF10k4XIhYrJ09cqxICk0KIIQnGX3wNuD5un+B6a9fbG
 kdFIPJA6ozdSRpPRwLrsKFIKNcTKEjKV6uTf5ixUc57VfpUYYGKiMU7OKghS+wIIKTfe
 V3lBJKDYRLfg8xDuKEVgYdyosB4JWYXfQC2Rs1vgShP7Xh6CHSL1YVZE69xwXE/cDzIO
 pPfQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782480473; x=1783085273; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8VwcliHq8xl464nnWTtg3JJJwkYrSrQwNu9NWItGi6w=;
 b=OZf8fLOiXlenzl2YhUBApvyVPJQmUIcCTTJgFFxQuqzUTG6Rj8TLw45mo0RUlH7ohv
 ygLRmYkYG3ks/07yaejtvHGVKaSG58qjps3up+xcc2UXvi/YCF3uPwcVPpmmI24xpqEb
 nlc7yiz0P86RBBUFjGTCkLWXBzOL139CGnC6rZEQAQkLd9xtkntw91cJSlAxvoOFUvB+
 IVPvqzxy/g6vXLLCi8sQ7zl6EjaTqOoRm8cE47AtwGAQjlTsNfOwDFTq7nvyH/35NeqA
 ukuI781msV8v5OJhh9zrkdKrcaZA5Aq/0NoKZWNZY9Jjx+anOf2A5vC5HUvX8qwePjdC
 H4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782480473; x=1783085273;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VwcliHq8xl464nnWTtg3JJJwkYrSrQwNu9NWItGi6w=;
 b=o8ROhnNEMd1ZaoMWgddp8I1LX7T9DyobHkNzuJJ1OPwZAfWf7Vg2lCn0+iH6wy8Ee+
 Ymst0k3r5N8Yt2RU0Z56xR/j+8C/8b4fesRt1yV4X3nLxrbSDZj8Cr2VWXmISfwDE5Zi
 mTwmpcc+QsQ1WcaCRS4i4W0ADmuudtk9s4b8RJQFixW9OXbB1qEL+W6psDhTWborMHiX
 jhFs2E8THj/beSWU6Krfl4RYQUv16w/FogkjuDg+QgWB1Y9x3o3kJ4IQoGAYuSbrvg9U
 0lW4meKzYMw1DC43ZCcbyCZl7ZTUUmzeovk9LzghjwxdC6Lxod81cBahYlRG96MqTor4
 Gyug==
X-Forwarded-Encrypted: i=1;
 AHgh+RrzvxHriRV5A8eLkol/LfYohnoN3jANec7W5GcxQwJfC2uXeS7aSEdnVdxs9Fy8wh+T0Eban3zUMA==@nongnu.org
X-Gm-Message-State: AOJu0YznOVB4ACjXSxYx+KGg81abtSlnteV7/SCRk1whkLHM6Z+eAGSt
 hTCOZqygofVoCyuaYV057If5G+7tI4Ydqktik1ILkpVkITY+6FZOeFQOrZTJ+MiUgmKC/HtljGS
 XxP1m6AdC7aV6CQ4zKWjyX0lp6uV+oqQdgERvaIiOyA==
X-Gm-Gg: AfdE7ckqIFkngfTdvJAUE4a8fV2CuSka8XdUA2S0lrTlZLgOcDmBsRoV/kiyZDnu3+z
 5/28XkmVnM5occn+GyRjF8X/8cN36jFo6PMgkdFpgHVDZlQtBhH6RInPxd/S3fyv8vrxTrlYEVc
 xKWxatUawrrJVFYlqPBRS0QIlpKiQFjUCZIU/18GapJD7s/f9UvRNVyvvoHaKex0okdJ1B0eRv8
 MhZeMhZQj0X+u9wxJy7kpbSPf2/ZEePEO/e9CrO620Gq6F96HGqwZD0dknGVuhSkpsVKxM6KQ7F
 Q3I37MaioVP9Ib+yF2wpFaKJ+U5duhOSOnBBWVympF0ysPFqoFgMB3HJ
X-Received: by 2002:a05:690e:1304:b0:664:9bf9:3dbc with SMTP id
 956f58d0204a3-6649bf944d7mr2183759d50.33.1782480473338; Fri, 26 Jun 2026
 06:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-15-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 14:27:40 +0100
X-Gm-Features: AVVi8Ce-yCl951hmDpeLYpY6CU-Tt2DRGkd_qxEQpl952alAI1jO0rygJ1LfstY
Message-ID: <CAFEAcA_i9JLDPaRmjyyONAhQWknZK5jexGXnZu6MdpF7XJbY6Q@mail.gmail.com>
Subject: Re: [PATCH 14/15] target/arm: Implement USMOP4[AS]
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Thu, 25 Jun 2026 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

