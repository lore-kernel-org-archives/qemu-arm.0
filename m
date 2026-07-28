Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C55C54F4C
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:14:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohdC-0000C2-HB; Tue, 28 Jul 2026 09:14:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohd0-0000B0-9z
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:13:50 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohcw-0002KU-B8
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:13:47 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-667923d86a7so1617980d50.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:13:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785244423; cv=none;
 d=google.com; s=arc-20260327;
 b=Gc7WG8OSqZYMZasrjQi0mVAWBpvqBGOR67nRNkzLBHSpjHUS5gM15nTn9P2culroV0
 480LpCeQ9WTb6crpkzHDeYzlT5C3hLHZ4FXRfIZoWn20Oh8LoYF8a2t8jltwW7w6IWYa
 l659pzKI7gTQ+dnY7Ca+i5OL5yMTCPQeJ7CUO5qxHaZYXM2OuI/4xePkedbNnAKjbnLB
 /kZZ9posAfJyDBQEdEMGSuyq/NYKZB3fruREII9Vuw7CaK2kCRUrf3VVZJAxqNG4c/4T
 xhLV5dnSicUaASvvJRMd/ac9IBTo8YHm3NRXdkRMIviVZXKsXiwsNZE2GZDOd8SAVj9F
 ZFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=MU1owYP/D3gktGqlzAbq4xHyJSuZ1mIySueCS/JKmYI=;
 fh=bjvKGqoOvtjys5y7AR77quKtWSulrGk1zdB+ElrYjJk=;
 b=dAjcphYE6WzAb3jZKnLhW5uFBXPg3gLGklrx9pAzpcFjMPcroU/+Zd7bW7U0CQOfI7
 uLxsl9hQb9XlpHJHL2Q6FWxbi2w38ekd6Qf7MpYqctQK6vomceR0ws76sXmvzbltbebD
 voL5vDBTf9X56L81WkT7FqOuecDBFgyD8a5tnzoCNpraTGJ3Hyq5tFOtOI2xvWmg5Evy
 5Tlo0zJZ0ew/D0vZqToPpmxpJf1sC5CvAqCYCZJqJRNGgMu3f3zkEjKg6d3as9DFxI3e
 B9zT1R3G7E8lnbNpWSINpvN5d5eEzMATJd2uRTRlzYaXKWGki8WWKJh1F8rgypv0Zt1H
 F6eA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785244423; x=1785849223; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=MU1owYP/D3gktGqlzAbq4xHyJSuZ1mIySueCS/JKmYI=;
 b=d2Go0v+pfrYSNyWbbQyG306G3WZ4+Dq8Yy5tWj6Lw1V+fk0SlkmuiKM4ugpofNqdPI
 eCbLQdVdPJnpHWf4jFItXY+BGrcLZ9szh+cNXaBUwPX99CvkmsI1YlrgQAlAy653EFz5
 +17QFjHnhixPR7rA5vR/GyAGM0mT2DqJm6F0dTTpPH4o7GkGCOJdWufb4YhTnW0GpQAJ
 Mv0qahQGxPzPaRn6EDEzIgY7IFOf42MptwyzFsauB8MKwIGCpwDBHeTr34g/7dYUVXxQ
 DckxhV2PCVQjQp0Bki2o5Cs/jc1B1mroSvQ8IakgAuen8rUkKvEi82WFL40SVXY5q0bf
 /CwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785244423; x=1785849223;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=MU1owYP/D3gktGqlzAbq4xHyJSuZ1mIySueCS/JKmYI=;
 b=bVx6/gOh6M9Aqf/ig6nvp7ywAHoF0vqncrw1NA8fAHsBy0N8EsN/FrYr7ZDFv/YcHj
 hfvaLgttJ+Z6zU18tCNMuVEKmaNs3gSV3Xxa5QN7t5u4bfYA7dbCF6LaGY0sF2LRK/wR
 WnZT1wCgBqpvAz2gWSnmFg6BZdPQx3d5qF7svtquwoT6U/iSIHmlJQ3NUvB9md0qSaDT
 R+z2uKGZbYXh/UYafnXhL2TwhioLtBhtXu58/DZJuqPk37bT6zd7d1+pevj+jHlUK2U1
 7bB5zOnAbBnyN8eN0ktntDiZs26aQBiTV4I+UH3X85vmZIAJdhMCKaFc84M0+S7BAByn
 kgCw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq9ECo5XCo1J9wyGesn4sJVPoFV/l/K1zcOzaVfVq/6e/E6RjG9b/kIjTdZx78DTXqONwR7Tv3/cQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw2ZoOaHgiV2IWf+JWiKCJYmoWKV1HsYgAMaBdf+5e+k+U3jVTr
 MHTQ1tq7Kvf01MbsElVf/t4mOdC39Q8m7D1U+bLIp/jXYzTdLJqrALt73W3tyzMEIJ6MpcCIvjY
 /Nr8maSR/tyoRxw8ES5ga4BXTIKtnER5w77hsqMpWFAhXaXYDAXen
X-Gm-Gg: AR+sD135C1y15j5Np7/+JGE2gtrNUycfusYh8T+8InkK4q7lYETFQ3uTMNqVL03AedA
 pE8mfEQM7CPAR1bbbourwCB6PdodzqLRiff3hBY/yPTSNm5PTLgxjk3oyOFlybkCSGO/DvkCK3I
 YveOS/N2jIZj8jAcEtFIEOXJbp7m69klaNcVt3O8yybzSne927HFcRb8tKDQsEJMwjrwpM/PRG9
 qLl3DXFCGNrdFr2ZwjeGWwC1BOOLSJeygjRCH7x3FekcRIE5o5cDo2+KEwR58ksqFO9ey5jmOl9
 vTpiPVqGL8v2FeKY/Mm4C38/A8syLb6Or+/TXEze1vkOHg==
X-Received: by 2002:a53:a386:0:b0:668:110f:8581 with SMTP id
 956f58d0204a3-6690582d2e5mr621168d50.39.1785244422729; Tue, 28 Jul 2026
 06:13:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260713230244.70174-1-richard.henderson@linaro.org>
 <20260713230244.70174-7-richard.henderson@linaro.org>
In-Reply-To: <20260713230244.70174-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:13:30 +0100
X-Gm-Features: AUfX_mw64BzBQ_G9vhtFk5f0LwiYR4wxz1uXgdVWigmcYLDqDw-adVkvVP5BTvg
Message-ID: <CAFEAcA_Uy3QYOkY2TU_C_Zj8V8r+aiCtGRNNh8pBkXoe_VseWQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] target/arm: Implement FTMOPA (widening, 2-way, FP8
 to FP16)
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

On Tue, 14 Jul 2026 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h        |  5 ++++
>  target/arm/tcg/helper-fp8-defs.h |  2 ++
>  target/arm/tcg/fp8_helper.c      | 43 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sme.c   | 12 +++++++++
>  target/arm/tcg/sme.decode        |  2 ++
>  5 files changed, 64 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

