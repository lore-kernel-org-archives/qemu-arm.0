Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp430733dyc;
        Thu, 3 Jul 2025 03:14:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV6R/WMnbzv6m9PzAYpzenhJF0RHBpjxwieuWz9gyKpYOIwn6Est9ucOltYA974EiAwhR5O3dMor0YSCw==@linaro.org
X-Google-Smtp-Source: AGHT+IHW8Ne+HwW/KxfAaNbgyVWhIXJVT5xRLt+gz2U+CFeeASFPSp3/aNLirngiWjpQV5Q9stfZ
X-Received: by 2002:a0c:f087:0:10b0:702:b7c8:674b with SMTP id 6a1803df08f44-702b7c867f9mr52532206d6.33.1751537666804;
        Thu, 03 Jul 2025 03:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751537666; cv=none;
        d=google.com; s=arc-20240605;
        b=eMyuZpgyWyI8oJHn41T7S/Ii8HlNXdIUlwX0VmRW2IimmobzrG3FIHy3gCRKFRkE5/
         wyRedOqukOhk9vtaHhEsXvUQR8coP2ZptPQloRsdBLzIJbM5h4dXzc4mfuXDQdjTy8Em
         pypOwPsn3TJ6wDmyJXPwgcjpeSFvLfqkjlU8ROQrLEWanMc3aHPavIDAqTT05OPzCcOj
         kCFx4oByaOMldenj0aqUXtjR6B79T1DHtG6xRXIbfo3SjwcWmBtOJc7rG/eFI8ZTF7P3
         F+CF5zGPyE4lF4uAJvmXtTZqs3wdKUMKfSlG41+MRgfFsgYHSg+RvkHd6mExCsPJ8gTV
         1rcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YcnY0ChhwlXMVkjmrPnW3qlLSY51H5NvtF/eJ7J+Qws=;
        fh=lEsGxrimPWuGeDf6YR5Q/GrJYnJpQF9dMykd4itAwTc=;
        b=gGwbprk2d3199xcxyfhtTEE7mgJcHjnj0poXJh99ixoM9hWhe2bRCIuYTqukE+T5sr
         QjIKJIApZCddcs8N40q7zkfPp+XJGtqJwQ9NDaRzdv4RDXf8qh2vFGMEP6O8k+IM7JfT
         w0km/PCv005wnPWzRG6PY/nYdR1VT4oTlKWYZ00S8j6VXrqvgbArCwW3MPdS5CS18DTE
         8LHfRAmM7geUK0H6V10QKJn8kf9+S+Dq/4SqN0JCFXJq2zhUNZh/BxqRSwD1oDdiOG9J
         uz5bgZNuOSCwZOeSYnjA3wAITUpK4gVPUHK5yQwSG6L6vJtbx50lIZpfC8TnUGJ6A2Qu
         OtTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=btWs8aUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773547desi166317516d6.140.2025.07.03.03.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=btWs8aUY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXGx3-0001fX-8T; Thu, 03 Jul 2025 06:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGx2-0001fF-0C
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:13:56 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGx0-00018j-6U
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:13:55 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-70e1d8c2dc2so54374767b3.3
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751537632; x=1752142432; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YcnY0ChhwlXMVkjmrPnW3qlLSY51H5NvtF/eJ7J+Qws=;
 b=btWs8aUYUc3fmZnr7vWrQKV9MdmMVHfLYE+gw9xYCvX2otWxBTlaFlTKvxdttpkSvg
 pP4uc8tJr3hdiflPI68m0PIdWM4E2bXEPD214Ov1POVKil6j+SiCPmrbB/moTmliasaR
 Mru4osuqyiiGMjbyGY/9pc0sjAqJOOe6UDtDDSEkQ28IBl+DQ22aGrBSQIflMZblBvnl
 PAMRWRBMPIjm53Kv0zl0tTg9eOqcnj8REQT9ZxpUu96uTCGi1HwwfRZ9mbAhGngWZD3+
 SnZkS3bYVD04EGJ4wMpDUiJCpvXdtRnKwFPdXh20/E08coZE59NHd8V22zpU6FB+WNDK
 SK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751537632; x=1752142432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YcnY0ChhwlXMVkjmrPnW3qlLSY51H5NvtF/eJ7J+Qws=;
 b=Q0tCJY/Ey/R5KhwijuRQkwLJZaieDuOtXND8TSkDil+3GD3EUR32fBAGYW/gK39lMZ
 U/B9n8YVp2hflto770QhsycaAm/FCkACO0g8Jfng1h4oy8Yodv2oE2N528P566EXcU//
 ajmLFvGSNgrG2viNCV4KR8gYGy0h0qJMuin8H7A+QsKKT04dFKKxVRsjqZtWyQuO/ruh
 VtwvjgrXABBiU40/AkHaJwIw2t31Va4nnAU2MQSm/gNuE9qb0XQhD2naySfL1xqrJZit
 ZHtkpx8LKtFmZhFxsbmCOE5Jy0eCNPNIx2FhhD8RhIhe+V/jOvIiJKgKcWH4UQDrmL3V
 WOMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6M0mCIq+YE4ZXdFU152TNIp6gIe2BEAA0U9J6W/QVulKO1gJAnuA2/QQXB48cAx/Bd6aOh6ovnA==@nongnu.org
X-Gm-Message-State: AOJu0Yzcx7nvaF4yZi6Hel2LoVjcrwj00vRAPljSh6lZI5wis2ZO8w4z
 lAfvTmEuMY+YmD+EChwtqal6uXzTWWsm5Fhqh/AxMejABhgsxPBoSfcqn/GGOXb2Z41tcQkQvDp
 EOhIJ0Mdx7eUzZn0eL8PFjSGT1859bsAkE7H7eMM3XA==
X-Gm-Gg: ASbGncs3jFPyHTvC5RGKnmkt3GqVoeGFe5sd1J5ZDWPF7GrMbsDiafjF0LYFKDY4IHr
 NEkz4Rwzo/5ZSfShFyfs4mJ0DOmzqmaYH85zWRPCK9IhJCbqs3sj8eeW8K15L3ooDjAEO70un9I
 t38wRTt+tpKpOybKDpCCRms7on6zd0L0tWtM077ayH6C22
X-Received: by 2002:a05:690c:6608:b0:70e:7663:8bb4 with SMTP id
 00721157ae682-7164d467d9bmr80835997b3.25.1751537632616; Thu, 03 Jul 2025
 03:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-42-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:13:41 +0100
X-Gm-Features: Ac12FXy3pUqudIO75Uer8xEzjPbM5S4yJweeUPgdmcYXl5ilWzZ53X3D8zbfhHs
Message-ID: <CAFEAcA9DixH6YnUJBVWOhvq185RjU9e9PM25dxgcgB6qeYiiGw@mail.gmail.com>
Subject: Re: [PATCH v3 41/97] target/arm: Implement SME2 ADD/SUB (array
 accumulator)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-TUID: 5L2qw09kd4ji

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c | 28 ++++++++++++++++++++++++++++
>  target/arm/tcg/sme.decode      | 12 ++++++++++++
>  2 files changed, 40 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
