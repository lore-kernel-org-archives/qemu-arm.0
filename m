Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB339CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:23:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWzE0-0003Ma-WB; Tue, 09 Jun 2026 12:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzDz-0003Hk-DE
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:22:47 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzDx-0004G2-TO
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:22:47 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-bec429c2bb1so854698466b.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:22:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022164; cv=none;
 d=google.com; s=arc-20240605;
 b=agBlv7Yca2oDQXhNQoDIH8GPMppp5Ki1QskZtslaWduqLPXm5X6u/ZMJFG/4phJF6A
 b+ZLaLbzQb1+ZD+nAVbp1gCSBhNsedXlS/PoSVDcoMVz8ZlUsvinryGDRWDc/EU5XCb9
 J/v677k11xOWRTc+IJZi1Yn7wgbltEeEmDqklJ6YLuYR8grBvoCCrsIq9ZtY1NbzlOKS
 RFsICbbisnUCT2g7JghXTYs1GUzJXOgF2ap9foAAzMD3uc6dlCl4AspbJXLHbJPi+8kN
 hCv4805/9X+JM6HjiKNkxSeiR2j7eVf+gNijSBkIucVpXOsZeD2dRTZ1RAYdv4DNLNF0
 pcog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=b55qrZn3PPWJBOfP5dZ1VSqwYMF3HjMRYZZ7Ug70UEo=;
 fh=t/GZfz1udKTzneKPWUqf08VS90tAZw+xttHLLMJhpRQ=;
 b=AzH6yY8lsyBMTmpF+Y5YExSQvVtVEUCHcCl1F6UYSxzAhcHkpNSDe0+a5UYY0XuhJu
 2mC87hK6wCJVjeOPxMWuUUq4koCHCWH59UThXWnUznTyur/rs8IZrdRVnOppV+Ql9fVD
 10/rEHVcKezhyveSoWX1URbWhnm07cfJ2vLYrD9OfUOlf1+hFoNGZC3Plq1INCilvQxB
 d5hZ2DO5Xy/rLZff4ai6mHxoeQFWQSLYsed+MwpsB+kRBypMK91v8H44l61vZ2eNTP6o
 4Bo/1gDMCceHsGXCHk291pJhh6/hMMNuL95hJMmYooVEvBwWdrzOHRgXmQ6blrHWfdvP
 vYEw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781022164; x=1781626964; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=b55qrZn3PPWJBOfP5dZ1VSqwYMF3HjMRYZZ7Ug70UEo=;
 b=bCCJV/48g1sthwBdNwth5roG6AvqU+hhQjOmAEWJijiZWVnD2c74PeCnNqE0DOkQzk
 +30X36FECChZVjaARFPo2KAzIq6NAUGOPSCzo+n+N1z5auUUKphJ3+H1TYMBv9MkTKIO
 1ogO+uL4wUOeUcNkOEKijJoBpTMjyeqj20cw22SsMqQhblU20O9xEY99FZhsbvKc+EOE
 bfYZJDlYQ6aCRWJCIEvWfwEbPOUYCa+C5M8dH/M792AFljdXzYvIuMdRNF4hjgrUQ3SC
 VYf+xNjuioB2JJN8nAzmUapaxHBV/pwX0sZLtFCfWwfwwGXvmZ2oxfuQNN1wIGVVx1xD
 WPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781022164; x=1781626964;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b55qrZn3PPWJBOfP5dZ1VSqwYMF3HjMRYZZ7Ug70UEo=;
 b=o5L/w6zF09dmbZ0c/EOk5l48/6DFalD5EVFDzVVVh5mj633Dp1ERvQBqvdzkdYXlQN
 uIU1HcJWVIPNAm37fr3Qqd9Q1zFeaNBLmGdzV+k26r3jsgN69MQh1OIY1l+Rnqf46s6E
 2wwLMsKyoULVjnfB6hLm2k4F5FJypMi+g7LuPzGNW+lwYpT7sp9BzpoFHoVa/JfQJ+8t
 qn4CZZjfM7Hx13A6iqrbBKmiK/r+2nqoPAQVtOsRvkn7cinEbjiGfEAw8WSIvK4Zf4za
 qK17xQ75ahW9KkgmWJ5ud/jn+c/zp2kxhFptt/FXaIgpOfsDCZy5AX9z5V880k5dR8WB
 f7WA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/juN/FL45T1a1y+wYBS3xng9WGii9q/KMRRVekvsmc2CjMNUCFrSRXICtXPUKCAdTEeOvT0BoPSw==@nongnu.org
X-Gm-Message-State: AOJu0Yw3aDumZqjY7FxLhCmFCxi8YCPy2sU7k096OqikIsNfrEZ8ZV4Q
 blDMKDqW2c+9SOl9M+sH8ELauMa3QOwlYgwhbe6WOD7uFAIgowHIHmMOjYD1hJiB9x1TxgtQ0cH
 iBTk3+yWwdhEGnUmTl2/LyPPcOj87OceUyPr36utEc/TdqLryz+id
X-Gm-Gg: Acq92OG2vtTHk9sTl7+6opn50jhJinZyfLHEayFInuMYalEuTIQ2QJQAQksZWAMAU0D
 GoftgFqqYdqlLnt57q8nhyJbMcbHJSatUUO42MLs1a2zV/rNa+rg4YrcBqc8z9c9NTq7TbIb+7k
 3LyFZTRwfsOJqMKXIYqs5ibIB3FX7z0E1+0z91rfaMUQ4t8yNNx/GT9RPXU1OAIq7TVxAliJqq+
 RQzk/VEmabMD5MZqYauFWXQIISe8enB2CaM2uTtaXG7bcK4NSONnRn6MYb0ilHD6mPMxmpBoxN3
 NOOP1JbFYvcJFnT4TbnUeC617ukK3z5UhLx336GSBn/KY/2F0kbC8lT0N9VJOCihdzDcK7RyWnW
 u0g==
X-Received: by 2002:a17:907:60cb:b0:bee:4562:32fa with SMTP id
 a640c23a62f3a-bf3708686cdmr1035838266b.14.1781022163934; Tue, 09 Jun 2026
 09:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-42-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:22:30 +0100
X-Gm-Features: AVVi8CfqO5sEvTluJCrkod0JYDEyp1Yap0_ZT4d6-EiDDUngLnr-n7GCceoq_qE
Message-ID: <CAFEAcA98hf5CZkZpaVZz2fnCq0yxt9RbrpDxGswxn8_RM7qUNA@mail.gmail.com>
Subject: Re: [PATCH v9 41/45] target/arm: Implement FMMLA (FP8 to FP32) for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Wed, 3 Jun 2026 at 04:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

