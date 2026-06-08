Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D27B5CD6E79
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 16:35:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWcwP-0003rU-2w; Mon, 08 Jun 2026 12:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcwN-0003qR-81
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:35:07 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWcwL-0000w7-FN
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 12:35:06 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-bebbc325000so554008366b.0
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 09:35:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780936503; cv=none;
 d=google.com; s=arc-20240605;
 b=BaUGwGcbwo2f1H/3WhV4g+Vi/n5iuw86m6TfqGD2qGXBT1aumkAbZ9sD/pUcCHkHxK
 xFoId+kxYMjzBJV2jR5nGYwW8PD8+ZmP6gBl4MY+c6NMERYuN6Vjuy1muCB5ZgcLAzJA
 dQ3s+uSCQWD7qrs5YykstWq5AtJkHEi4FlCCEVXEuBYcohgK2/tSrKD57Dc2Wf7AaioD
 ikgjvYu8ytKRzud+wVPKpxOmvKr1dN4WqAZDaiAwq+DrJyvPo66Pirx4OB/jU4uFxCX6
 FIL2A/7N7FIsPpQsG+1QOK9Yk6qPSUU5Q90Qfiugrfz0eOdfwNhCxqaA0QrRIqCuA/Vy
 4cyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=h9ViwVnTJv7S2FuxhT2/rxwtOAzaa1wdajcnLd0l9DI=;
 fh=O1JN2c9Fl/UQb+zRSZvITzuVF4BKCyg2l1Kemfpk9lw=;
 b=CQXvsmaW/OyIUgcBRAxK4VAGTGA/mzWDMkTI/GBJsd+U5IFnyEDNaTI0k5lCGMHHm0
 sClVDXBEbJ/7CFVBjdk3QQ1eHXhL162plYs/GJsksTG/71wdjz2jImXzbEdL5msQZ2fp
 f/1Y65cYyXFAkxSMaM8jJVDqCOJdStiUbWpD2B06wpDi2ZS4055XBME2GphAxJMp++ja
 3CwNvbTxRSy3E00XqOi8Q5D9c5ZqIEcd0+e6fST90Nxdz3JUcD2fBHH83rPLIeSf/8IE
 IMVOiZljqRTnJPxUIEYlCl/RcmDZgetJALV0HdAzLg1nDwhkKu+wpZciT4CB2WOiL91k
 3kSA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780936503; x=1781541303; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h9ViwVnTJv7S2FuxhT2/rxwtOAzaa1wdajcnLd0l9DI=;
 b=O3JX7k2B9tSAHifDuD9QymsLhDhTadfZa/2/uaVoiZDNm2LNidQ3WTEpzcgtUaXp40
 6tVbD2UvU4wiCR18xPLDGKKxOQFPfdiURqSRC6WpYp1WqRxTzpD0qyNNq1E+sVhOwXOS
 OdyydL6dFguWY4L7Jo4kU5EFbQF+QzsudB0KYiSxBK5FvUSVb7KcVh97oAF5iqF4W/GA
 la2P5/PbsKO+afo4QtDPmdLHqApwYoyvBEKgziQdkgRizEanykFUCWSkVpPlz4fFq/r2
 T4cKirN1vBRK+RYKo/PkvOY/ANmIijbB0dRgUXOKFKPFNT9TjN1ARSiwKi3ZYOtLka/t
 vPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780936503; x=1781541303;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9ViwVnTJv7S2FuxhT2/rxwtOAzaa1wdajcnLd0l9DI=;
 b=gtr0AOZomI95SlMLXOyw0js3XJrtrE9fv291ADWRQgKJtLa1dltHBOpb9K9icTkpo8
 IqmqzSG7+icCznUHdKWVqwA6OBjALcWPod6WW7ng459l/dgh6QGfSvxeOwQe1IVeGpKM
 zKD4RBkAVv/8ky1gmxFgX9MdWx4ZLgf8xz1VKLtV8M9wuPcG3wq5Ls+RRxKxJYui/+e5
 l5ErvvTE/8EJ0fF2U+16DCX8aznwdSuACMIMFf6rHEbJQcA64IX5Fw8YtAhYax1SjV1f
 VYX7P2KA0pSX56oZtZq2B+ZaIJKO+w2GSVDQlMvzskS9ZUpcb3JKN+S7HABpXVPGXHwh
 /+Sg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9j9RWnkVehXXsVgH0/pXX+ryKg4pXnbmhRjnwYVkIwVEnxdHysuMha08KixacbQrJHsmRXu5S3wQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw34Y7YMCzNkVd8Xu4D0ElTwnTxE1LfGSGdUfczjOvsjYmV1r4+
 lNCKJP87Lm+UvJ/GxxsQCcDtYNV3hkn0nF++0mnPJyIhCjYtVM28+6pU81nOJHAQsLfSIuQK8k7
 n2838Z88gZaS2eXbHJT8Wk97QYYo0VuYIiOowhlIBcw==
X-Gm-Gg: Acq92OEw8kGayGib7gauoD57RSO1sLI19W7M1InW6MaA0P/PELpT3nNJis7Il9bKzZu
 7oVarO6TwQ/FGFVNOJ3R/CEFPAyem8/C0x38taDwBAVUi7JnARW937tGmxQUL6sLJcUhvUq7EDg
 tICIutQ7cNevGkdBO9ca7EaLRRyF/UvlmjFRp532Au37tGGFxLzDnwpTBtI9uoxbej8CLLaNKEj
 2GOl41Kxcuz9+Ersqb9a8TJreIc0TX1edvOKODq+7/+LD5W90wNhFWFGOz6C8DFqmCZuKsSwRwA
 QYtC/l2pXdcMFryTKioxFSY2YpShN8IJLXlPuRT5Mss7OtgyZC+ulXJ3DKmJzusU5hmdg6geYuj
 lmA==
X-Received: by 2002:a17:907:8b97:b0:bec:929b:cee6 with SMTP id
 a640c23a62f3a-bf37253fd8amr795583966b.20.1780936503083; Mon, 08 Jun 2026
 09:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-5-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 17:34:49 +0100
X-Gm-Features: AVVi8CeeEC7pjcpK0CZWsSTf9ganbGmBMOCFW4pf9x8Z0pvO4baKT0pa6pavCSo
Message-ID: <CAFEAcA8-UYHuSBP0p6UPfMM7EXE4VoNWFuHh8nqGE3KvnoU6rw@mail.gmail.com>
Subject: Re: [PATCH v9 04/45] target/arm: Generalize TRANS_FEAT_STREAMING_SME2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
> Rename to TRANS_FEAT_STREAMING_IF and add a new parameter.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

