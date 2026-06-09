Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD60CD8CA4
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 08:57:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWsGX-0008Uh-K4; Tue, 09 Jun 2026 04:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsGV-0008TV-Lf
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 04:56:56 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWsGT-0005SQ-CY
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 04:56:54 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-65eb226b1ceso4615893d50.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 01:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780995412; cv=none;
 d=google.com; s=arc-20240605;
 b=YojOnnd8N23KE4ME2qeJef0Q5s+l+C/L61HnK05FitIm6cciaCgbNT4utub2vLtqFc
 8FySlLzChwcuHVcP+VdLofE0CWG/4Qhg41irl+GOjnxi9Cys2xJ400CPfs+SAZ27Xl1+
 l2XSxolBiAAgG8o9lcyRcKCD8GIDDXRh7hotYmIgSVJoxPQwj8jWoxOmkgi8ITHW/w8R
 TNMmJ+/wO/K83pyxDZjuz51S7knmp5GjN8jFn+LHVocQhIOf+bZtfpwDHV9EcLC1vnsb
 XA9YcRnWIF0ckfUfwGRaCelRMaFwlQK+fNn2YL02iI1WXOrnSrCjSg9E1oDDIvxLUnP1
 IMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=92SeObi6wNJU5QD/bOreW+PE6wSzLnu/KemMCuXLPnM=;
 fh=DNUN/eBxro9Y3bcvXupB0D9MoiBfU7y7yyEY6ZDwjks=;
 b=TFl7368sE7VOwI4oUD64Sxm6C11JAAPwqRze3sA0C5QvKoiRvZoL1AlNi617Ms/bEv
 rlataD7lUOWZR3hjHNNuUYv3/Y8ViYTByzAZRhyso4m2K9VEa4y/r500rVeMH7GOAK5b
 SI5ZmV3RSMlJUVtjkngWVU9fKDpadM/4yPhcDFl5UR5L0m2Y6nxijeucGClCM/95n2xJ
 yWn1vBOl2m+QlZ9OUW+xdeKlalyknz9kAZpX0ydobV+jwVd9W8xv2oQHfYK5Ec0DORUo
 Ka1eCJayG7iyGtfIEampULgH0kpoRNPnjC5/S6x0A4tDh66XUb/vsE469EjSXUBqYAtW
 osUA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780995412; x=1781600212; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=92SeObi6wNJU5QD/bOreW+PE6wSzLnu/KemMCuXLPnM=;
 b=ICSLptdrh4nDS2ezu6+T4PpOsZyacadcW674XPgOKXy4cQijvYSFUxW7J1gknabS0j
 yAtmUhvjicq4l2pX5aus8WQREolTD+IJx6FecfPvhzFpJ+Y8OTBuGXHiPsDW1ezdzMIi
 NAd8eggNjVCbEwCTagAY7ZAs+WOMTPh0k3PVQjr0WGeMlz689o1U6KMUYCmARSEpS/x9
 qMjpP2CBOne1kxaujfVRIkDqSwOqfVA5TnQzUc2Z1Vlezww/NZG/w56cKvKYiW2i/vT0
 YYrBrf0LZgo1b5rlvuQSL3fZji0/8+wpb0effFHE6Dx1emqRk2OwLL0fRIt3K07IH2qC
 8e7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780995412; x=1781600212;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=92SeObi6wNJU5QD/bOreW+PE6wSzLnu/KemMCuXLPnM=;
 b=ANFtpDgE15ZnZoOOO/FfAlWIr0mnGLIjkQtNJIT2wt2cHGphTdV8VFZNcxxAJ3RnCJ
 YeV5pBWnlPkfIpA64OIiuZwPlCa2306eONKOBHmWGexpqvE2ENGBffUMv6KTj+9TCdQQ
 47c06ZAahZ6Zr0lI6nfdiZ+CcG2q//Mb20jXYedJu1BHFlIfzFcypwirhyk8uACbUvxt
 miF7o3Z+8c1KQSjtFGhLGMioQY1cWpwqa/lbvUF8QuFlVyrr8w5gvLqggqeUNX6zDOeK
 3p4Jw03kw8LGgqweSph8tzVQlIhgEta98TTczsOuS3/KS7pS2ZNbpHZfVko9xGrqY4p2
 bBGQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ93MPh8NMuD/LzL2MGQ7ij+l8+4/i8nQ/oVZtQxuCQmj8uhEybzXq6pKurnJg9cEC4snr6jP2SPuQ==@nongnu.org
X-Gm-Message-State: AOJu0YxOO0DMrq1TDlbOFUvSXpQGzCU17122PenLjNeuk54II9rxYjpw
 i4Lsfukh+aUCdZeI1fQYl2MbRHjAdeXl6G0I5WPOFCBPX69xQ/eStC2C0v+gB0Ch1P9GOWbIJXm
 WUim02YIHxQ2y2NNybrPH2k+3x6gYFl/d4MBNkB4B6Q==
X-Gm-Gg: Acq92OG9+BSWzxi9w5WRHD0krsFgj5jbCrBJYCVbDJb4WM8i0zo9lw/H87Nhcmi78qt
 VQpq8fOf6WEAju1yP2duOEBq0pXHYXta+Yp8lc4yieHeWOmaHzvtEoRmnmYRobgpw2w9cEgYnxR
 LiUPYh4YLAfgljGzx5gxJrXJNZuLE7KNEDvEeeny1VmDsMp9tPP4eFsMfVcs3rAEq+LSz6Ndtnx
 /KbiShr1ibp+NXSonyuQMI4gcAQmxLWUw/2yZ9jeGcu2ZOrkH3fndrQ1ePqDUi/hOimL2SB34Rv
 wvGPcZn8GUFNXF9NLJ9cmejC4s8brPmJBetpDJ9FhLNLdOMRsTkXBwDqLvGsbXp87RYM0drHYM3
 o+A==
X-Received: by 2002:a05:690e:bc6:b0:660:41fb:672a with SMTP id
 956f58d0204a3-6610692194cmr16674649d50.0.1780995411943; Tue, 09 Jun 2026
 01:56:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-16-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 09:56:39 +0100
X-Gm-Features: AVVi8CeEY0_eDK2REmLejQkLuKhTNWgKD_rAjWH79HJvwUDBomNjqhh9Xcoa-J4
Message-ID: <CAFEAcA8Wc9AoxT899UpbPKRcf_D72GjVt9oa2QunfqE9A74icA@mail.gmail.com>
Subject: Re: [PATCH v9 15/45] target/arm: Implement FCVTN (16- to 8-bit fp)
 for AdvSIMD
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Wed, 3 Jun 2026 at 04:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-fp8-defs.h |  2 ++
>  target/arm/tcg/fp8_helper.c      | 37 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-a64.c   | 15 +++++++++++++
>  target/arm/tcg/a64.decode        |  2 ++
>  4 files changed, 56 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

