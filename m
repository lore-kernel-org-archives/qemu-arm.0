Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C79C61DCD
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 15:37:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzc9y-0003XL-0R; Thu, 27 Aug 2026 11:36:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzc9x-0003XD-7d
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 11:36:57 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzc9v-0007fa-JL
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 11:36:56 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-66dee7a0c09so157314d50.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 08:36:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787845013; cv=none;
 d=google.com; s=arc-20260327;
 b=V7J05HU/+rRwFrECgL8J/udzwZfbugCAX+6NhLWWh78N01nFgEptYEQihb3d2FgNCI
 JxaMMg36uePJ4obaG8SSV/+UjFrdVnDacwmaz7w20bVJ3JqYN6NNrekocjCTTUh0G+m7
 MLfzX3S5dER4lhi0jfEz38PIbAXaHPaAbSwnXn0g0+HsgdqXMX3PKWOxbBZo50flxu0K
 DQstu2D9CLVQ7EbGGNTcsAutPgEloiVr9IMzDPyxQzGi/4U8mRh5AUPPIEraZsGatLar
 7zMWJmFMC6gtQ4IBJmNz7yTtcrbp9r/wAbbmRwAmbfMfs5nW024TZcPvsbjxF8HeR8Id
 /87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=l/TIyVx59OMApJQbBVsOFK1nHzU6lLIk98gtKNMSbdc=;
 fh=eRtWDfrKLZMNBtVK84GKsD2rS7cIg+XMIV4uOlqiaq4=;
 b=DS8xzRcTE9De7nou0fc1ByTIZppn7vzioC3esfAX9Gf4/ZQkRG8Y/vmc+t/a9b0YYz
 TK2OcwHmLrqB0nZEG1q3V8bq2+MQv1FILeDyuwVBnyU39aX0E18INrbLv9/PdXvxldC4
 uLG0CsUNH2rReml7JGn2xzz3xF/rAAQrmY+RvrC9TPOgzB0K+FeGTT4ZD5H0rfraGEd/
 uCJtfZ501tEPeN1FLNho6ah/Ymm/jJRUKTfBay2QngwhGRb3O8lINVSSJyGb9BeDC17x
 V65UagxdSX6UZLrW/Zbe1atfSB+VkNG0vjfUcoHqE60pNBQ4R8/uE5CVkNeWcS9uel2v
 pV/A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787845013; x=1788449813; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=l/TIyVx59OMApJQbBVsOFK1nHzU6lLIk98gtKNMSbdc=;
 b=QtA0KBtnuxpV0FnJiYEqRzceMyBzwJEBIEAmwZNG15iOHNnZQuez1zhLruh9bMIqKX
 40iyn8bOd+J2ZsjOZdXIoEN8ihWBktNZ3GA98tL2Y7dxRbIYx0MpAWgzN7svBQmOde70
 gPI6jRnFMg0gc/nzA3hugzOwDDEBd4pHVwRDBew7rNTczo73qRLiQHGIMEqqDiU2TfvE
 tMfQBXcrkxPxgLhaskFvFGtp34/jRAjL4XHRV7M3ORLRhOzR75UolSlv0+3VcU/J5L3b
 dMD87gbuckW2hYGlpKuqQmJuAW9sBovZcq2/Q/4shFre3G0p5nLfzEMQ+wQC2FWn/ZWw
 rATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787845013; x=1788449813;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=l/TIyVx59OMApJQbBVsOFK1nHzU6lLIk98gtKNMSbdc=;
 b=DM3WRcaSFaxktjrkiYaPKz7aWTmFW9RnoFMaTCKalQpHoh2a1OpcYYD8iYjg5Y8JYK
 bZ6+Ok5p95jQwh/s0/omyI8iguHfhYaj72g76N4CD+6txQIuFCihpQyuYOh3nbj7NmUE
 Ih6rc0I/R0eQlH9Udij/TZmYaxRqjYu0la7/XctnfkgMZ0ORuEbrZHUi+cOMGrfKyX/F
 5HbQl/uBQm4cPVCmb+f3cTpH8ece9Y+tJ7poaocpLnvRsGC6VY4d7TDhzqD+z6HP14gj
 p3i8uNFuIE3PVD+Is+wH04xsYI+Q0mxPaODHWY6/CWN8pwq73uuzjSDZDAblEsDyJiHz
 mE4Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RotBmUYsQUkS2ob8NFClRNEH8dmzOGCfAebXXH+r1oCeH8zpnqyYlpqsA5bTrT4E/K3Qfolhzi70A==@nongnu.org
X-Gm-Message-State: AFuF++kMGy22nt/JAiQ0kYTs4F4vw6BPsPsy4zVDRaP6/CpRssvrDmKd
 TtTyDXaZbHoNqR7hpbQ0wu38+3j8uR0CG0NlEQBYN6YR5alRl+fxAznXPUA/xOiKd88PjtGXjuu
 tOHvKUGofUFHmPy4owvgqjUwD5HkILXiuIUV/HSbxgw==
X-Gm-Gg: AR+sD10/1ajKT3IZxpFvjwEC6uLbi1UlJEZogZ3KYxp1qqz0rw2wzZm0vkhSzaHalLR
 EwBD+ks/J3aTh3cDZDGsfXgF9hSmuw6Fm+c5JbMBa1n8TF//mRkOFQmOFPiKG+5tGxGwB9pCgqs
 SDSIkY25OMkpGBx8y5mKWYwHzdUXwJfMPYsjYSLKIhoQJ+xbCkO63Fbh+YLdwU3RKP1BzY1n6M1
 lyVoE4IEluLyk7EJU2jzL7ubNO5hsVCPVlLoIulTOfnmEdtG5lsh1A5LrDoBLUBXO/2NMKKh5tf
 F13a+jcE+L+Wp6WrML8XYLgezVLJPJIixry9bQ/6MoWUhz8f5BWvluxcQCzZV445qFQAwbCjUoV
 461a0Dhu1DhlVCiILU/NKBXo/brQM
X-Received: by 2002:a53:d4cd:0:b0:66b:245f:bc5c with SMTP id
 956f58d0204a3-66d265b185emr4118134d50.24.1787845013526; Thu, 27 Aug 2026
 08:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260827041557.775080-1-richard.henderson@linaro.org>
 <20260827041557.775080-7-richard.henderson@linaro.org>
In-Reply-To: <20260827041557.775080-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 16:36:42 +0100
X-Gm-Features: AcwNN1VE4A6DEQBsF9B2SBkhWaLHpuI2MlkXT4GBej8LorOtY5HOOEoOTmHpQtA
Message-ID: <CAFEAcA9HkALxGJ-iExtMCyw-KKnJD2UGwfjh85iKo0zi0cf4Ug@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] target/arm: Separate cpu types max-v8 and max-v9
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 pierrick.bouvier@oss.qualcomm.com, philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Thu, 27 Aug 2026 at 05:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Do not include v9-only features in "max-v8".
> Do not include the prohibited v8 features in "max-v9".
> In aarch64 tcg mode, define "max" as "max-v9".
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

