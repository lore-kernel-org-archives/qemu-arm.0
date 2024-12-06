Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp838475njb;
        Fri, 6 Dec 2024 05:20:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXMnQ4rv2yZ9GnGzcYoQVZnbrBtDYAsNR7pD9WJkmhXr33xJUNMvRy35oatSUe2Zt6s8PPLv7c2iYwspw==@linaro.org
X-Google-Smtp-Source: AGHT+IF296Fr6Gs4RZTMSAHMP7Xohav0ZP/PrStDitj266368Lql1c0M9o+O96QKfQ2sN0HmbdtC
X-Received: by 2002:a05:620a:6014:b0:7a9:ab71:f820 with SMTP id af79cd13be357-7b6bcac224bmr393778885a.4.1733491214414;
        Fri, 06 Dec 2024 05:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733491214; cv=none;
        d=google.com; s=arc-20240605;
        b=EH/PmpZN7oBlVb7bxO5mhwl91PZrmTCSQMudpkVFJvX+6x0pyWSps8L4VpE1cAgMhW
         xiCMgvYGxryHTCqtf8XRGC7Cmuv2D6mj4o6DewqmWvyjA87KVHY7Mz/Xb2IyfLINbTlX
         c/AIV/dI4fR0VGrzJJkBivLwnUFtA6Y+CBUygG/mgHS/kMCaPHO/JMJN0pGsOB8SCVr+
         Ux/j6MQHTVdeAJpschOgqLpo/l0PMC1eUFjQhvD6zub1S+3QO6i+5zoraaKmI86Zo7zX
         lrH/MrAB+gkQjsmxfQR9zibWbqQ4MB19vtkztXXViHLr7th03BOy1cVd9PeXNpBjkS3e
         UcRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=J8W6Yx1kiMK6OyXVZVjPdT943ho4eigo5ojsBCAKRe4=;
        fh=Ls6E+yvOMMM3ild34ZgdU+7a383Or6ZxZ5vqu4Sva4E=;
        b=LFObu+o3vqCAM4srhG4ALlOLA5STES4DBxsdQCRTbwwMoJhXGMFI5nBw3tyssiG/CR
         OsLEuH/63RpP+mZfyHv+322MIS6dOdTZYHyNFNHaVcKCyQcSTENbiXtJqn9Lsq3yC3UL
         nnAfqfxhdcSXxZOJT/LFIFfDaTrXjyYkoX9qumnA4mG28BoPlrl3mVmbDpirOIuz5Xvq
         J4JOermt5hRQpLUF5teCO2TWnc39bmeS7eApukuUjr3xDE5uj+mozrSravg2gRnOqvfw
         DYC4WlGqGmymq2TtYsE+yQjiGkZjd+xFOicJSZlWN4gKnqMmzY5Ioxd3WBSbBr4fJRxB
         Em/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sDic+n8E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296bc30fsi42885801cf.4.2024.12.06.05.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 05:20:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sDic+n8E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJYFV-0003eW-5f; Fri, 06 Dec 2024 08:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYFL-0003Yf-L6
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:19:52 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYFJ-00089J-Dl
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:19:51 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so1391431a12.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 05:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733491188; x=1734095988; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J8W6Yx1kiMK6OyXVZVjPdT943ho4eigo5ojsBCAKRe4=;
 b=sDic+n8E+F2uaN73pvWcKjCLXCTH9ehtsnkZAlC3Qo1Go5rDxJc2TqVADh6sy3SKnY
 k8MjNYbUK3O/yweIKnp4zNJdhlLxYR/QzTRE73OKg6XR28VDGP/iXN7uJUifMxe6DatF
 C6b+S+gMCTFEKnKotiv/6W9XnmTBvk/IpU12hFxoW7zubmxN2il3aDdYgB1r5qSSZQu6
 2x4SRR85huYshk77J+ZWHdoxOIdReqdqRFtNlkwTSmNfC6giE+iys8w/cm0FbnelomlE
 2uJRuxlVFRMVlhE+Lbjx0c8LzdUcLfBH4TS2LKyk836mh+sxcIorfiVBXtScztQ7adQ9
 0+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733491188; x=1734095988;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J8W6Yx1kiMK6OyXVZVjPdT943ho4eigo5ojsBCAKRe4=;
 b=OHGguU16QX2HeOrQb8WSWuK5iMtt+3L8B9uqT/Bk+9wrpkmzuL5n2AUOjZ2uGMX4Ei
 LVVfx0IYuPZEKYD3J/f+skin3KZTQ+7wkNoTN+SZmUq1SS3tS/iG4ZS2WP57bu86DelF
 MD2tb0/JKs7xoDanKIMizXIOjjQT3av+VtxJx1Vcvawi7tuMSyBof+kKMzMntJ/dgzpA
 gZ4cQSxSnwFrAznkP0yAWtXZ1f5YmC+dmK9duVwWt7XgqofLTYMV1baell8jP3TAPM0/
 rwSp+u3kXqZIgCpT6OQSgFy4tSn2dO8sMCpOhDHNDB9Rw3S7p9YK/AUWC4MW22q+mrkA
 Hn3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhIWlxcCXQg0Xkr3tb+/J3i/9RYvPmbxEXlGr31/GL0Nj2vvgVNuAvNWROlNNViKJnmbpD+Q7xcw==@nongnu.org
X-Gm-Message-State: AOJu0YwzOBXyTG9ROpB1bCrWYbHEmmQcMXGkmy9lB1YyPqJIjmIMOmT6
 mF0sXpdUPxHmGttqtOuL97yDOMfqYhMPX+XFtnRGvdBhX3+VTHFxd/ICKKRjtZUdB4gkK1mmlPK
 psYWUZZ47g8hslefhilNlMSsMZStxweCrzulipA==
X-Gm-Gg: ASbGncuIEcC6Z90xe5Q2Krno0WLGEsvqwp+MI4ZzD2INjTiaQve2YbNUnEzU6QAFZXh
 Pv2VmDSLXUlAgYV+AzHtynA9VlNHG10cd
X-Received: by 2002:a05:6402:3906:b0:5cf:924f:9968 with SMTP id
 4fb4d7f45d1cf-5d3be661c03mr2503267a12.2.1733491187651; Fri, 06 Dec 2024
 05:19:47 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-27-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 13:19:36 +0000
Message-ID: <CAFEAcA8ZXozpg8pJMmmDdpF6_FuoVr0JA=Ay=UXkBGbnZvKMeg@mail.gmail.com>
Subject: Re: [PATCH 26/67] target/arm: Convert FSQRT (scalar) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JrA1kWL++WKF

On Sun, 1 Dec 2024 at 15:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 70 +++++++++++++++++++++++++++++-----
>  target/arm/tcg/a64.decode      |  1 +
>  2 files changed, 61 insertions(+), 10 deletions(-)

Other than the missing code in the old decoder mentioned
on the comments on the earlier patch,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
