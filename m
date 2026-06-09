Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6762CD98C5
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:17:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWz8Z-0000hi-9o; Tue, 09 Jun 2026 12:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz8W-0000fr-QY
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:17:08 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz8U-0000mG-DJ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:17:07 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-bf84a2b2077so241358066b.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021824; cv=none;
 d=google.com; s=arc-20240605;
 b=YpYneMLV4sRjxmx0Tk2JPOfVS0NciuRSclK6yOGt8keQGmRF+uToY4v+czmV+EO3MP
 M1g9OrP11XSI+ZME75ttsFizNGt/pbFcse1ZKSOKy3/NYLcd0oKVTkNjuDlG0WjFRptE
 fDdrgriznponblG5IBxJvJHMZOp2ewvpfjGvIaHi6IbPFQhpNjuOudaKtHMmGFTzljDN
 eN8d2Dj7fvsEuDa4wl4iSAK+U9bh8PvDaS9CHrhlHuYGUMymDWPmRe6qRi4lQdDzoRDp
 cxcRG+gA3kMAuJ3vuaVm8zVUrbJ70qTZgjBTq5kj0P0de4Yq74+rlLQmwFDPLV5a/Sds
 BoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=o74JHeojs25MWgZZG6Z/h1tuZpvQAWxc/zH1Lxru8Go=;
 fh=Pp/7h3BKp1HHln0lbhxdYvk8PE05518QCCcCQhyZB10=;
 b=ZaucJmBcG3FS/SWETsTD6kKmW9Q5eVEIIa7ku6ekOcvQzTwkwhF8Pxu9VttKlC8D9U
 yo96dvNxB02YcaaxC7VMoGP8PrOjWZ7L0i67NlsRdJpb6OZrn9mxWcgocxnyN4CN/XbK
 R7fVVkGksxni3c0XG54XnbArx/Hal2XWJsRXzeS30mdXDW5bd6xMwbK6EMtSMNPxyyyN
 PHcabf5DRDVuVxR3oFCuH+HdRBIZUY+ck7de6pwofTJmZQ4MzGCZz7Z2Iub6b0CMzs0g
 6b1H9Avk9D0tpnuthpZkq5oJcMVoRXdBbM4mTVWZ+tXK8bUTieeDiRkzahFkdNNSdn98
 +WGg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781021824; x=1781626624; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=o74JHeojs25MWgZZG6Z/h1tuZpvQAWxc/zH1Lxru8Go=;
 b=P4BgrxATbx+4AVKlM2vQs8eGXbwn5Pe18PzPBcyreG9XKy+9+R5/Rbv3Zhci04VZIX
 aWUArWV5jv58RSEriTC6KFXaR22OPrkkF1hbcVG7Bg89MZzCmFsO6KlJ8Yh7iVfwPpK0
 eb8/Mbp5fQxr7IPLn+FOOyZ2W9Kvlyr7uQRMxYNNSpRWCNDD9cc4HY+xUr4+zkQqA+d0
 ETSdPVuIxvIbHveFqePvadUAhZKOuK9sq/cic1N+gfgA7VvT5aihUW0XtWvxk0Ddo1Q/
 CgxAtDSsOdixFr4cnERGqNMoEgF3Iw9VVUXaMdW+/l7ZMRMRidLrG/Km9AzOwJL4sro+
 pB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781021824; x=1781626624;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o74JHeojs25MWgZZG6Z/h1tuZpvQAWxc/zH1Lxru8Go=;
 b=R41Csh/l+3ULx8u4vUOW3lCkU6zawfdHmaj+B+jtqKNCYzjRfK/2cochiN0asW2kEJ
 xYUkKA5DTLOlU7ppN2B9sWxSfylfYEiuU41xJ/BpBcagB2nXTfejMDSRFMbmdh3QAGyx
 f+fQbAc/B5ZIXtEbOQ2lUGu5Oi65K8SMC2b2ft5wZSoDlNDXx5DgCpHSwxoPnnyFIi9M
 r/6qvOS/gbtxSu3mPXjurF3JOwIB1X2Wb2NW0CFjBw6xtjiLogaoxG1HC9JCMDfK8X+W
 JwnMRSOvGcM1KG3EuaQYLD1j8UnHh/Fqy9pLTVF7ZdDsxB18P8CIQpQYQAxA8UaO2fg+
 dU/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ8eK3PhphfNdfAJiZpd38QqMiDgk5OvgRtWLEa8ak+ZUIB2iX+Sr6QMWaZXLz7aqkLWGcnfXeqT2A==@nongnu.org
X-Gm-Message-State: AOJu0YwjfxBy/VWYf2d1OuQVhPsG0L/b3BkLYg0kDITPz1ubvZugwVEI
 oVTJTavOq6LprHajTYKsBEeVyq6wnw2g4BuH7uMktIfGNiq8ayDdXWddfGeN+YYNwJjLwajJP8E
 Ag+MdgFbMjPnOAbk51cjqVHfId+8XLagMYjIQtG0CjPPeUPQaYMRV
X-Gm-Gg: Acq92OENijVerck1lgvToYw0yXiKQatJNob53s1Art6LndT3XmjHyqHLODuCRjm7oiq
 RZ9jMNqSqXhoCcBedaltiJf8Jyui5874fu4Xaxnbn6JIiQhQ16MtcunTTygSl2gj5rxlJkMbP35
 v7P4xYOgmIYMleuBnCOLYEZnA4XugDgKu0wbYY9yxXbeaDoxs2PQQPGgSi5DB6osm2d5iNLGz+x
 Sl9AMyCrix9io7uN7s14A2oFz5x9ISiE1I38JBaB/I34IDVIobjQK/+K1ewaKD0vqLKS6sFrmf8
 w06nDt9x6OG9Po3SkTnAXib+ArXhcDdVSUyWR25Y8NF20iu9TJBI6uidr5RVI8oKBuAviAgPdN0
 4Gw==
X-Received: by 2002:a17:907:267b:b0:bec:bd4f:e495 with SMTP id
 a640c23a62f3a-bf37155192bmr759739666b.12.1781021824521; Tue, 09 Jun 2026
 09:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-39-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-39-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:16:50 +0100
X-Gm-Features: AVVi8CeYx8Uyk2ovu2HkVksac9HkCaE56KZm5R0stbByaGxtIKQFyejEt3G5CSo
Message-ID: <CAFEAcA-8cAPMSL+cDiUejPagVnRuiBU9tZQZV_Lr302h-hSEhg@mail.gmail.com>
Subject: Re: [PATCH v9 38/45] target/arm: Implement FDOT (FP8 to FP16) for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h      |  5 +++++
>  target/arm/tcg/translate-sve.c | 35 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode      |  2 ++
>  3 files changed, 42 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

