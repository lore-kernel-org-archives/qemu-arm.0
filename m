Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30A2CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:18:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWz9H-0001G6-1e; Tue, 09 Jun 2026 12:17:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz8w-00013y-Av
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:17:35 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWz8u-0001Kl-PD
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:17:33 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-69165354c87so3902215a12.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021851; cv=none;
 d=google.com; s=arc-20240605;
 b=DiZrHMbneYZuYfGnMZL62fohy8bcEJkTWhPot8jl6/hiil5x/LbZN9LZWbAh1+EeyT
 IrAaoIKW/ie+K4S5wT90pbq107mdCdIljuB+DSGz3P589zTWpCyluAVhY1QuPiWb/jQS
 5hlEftH2ZGwcdLe9Ft2idXOc8SFDkPtg4ipcXrstLuFma3vJxFIxm0H/VdkPNmVuCKu/
 8+h+835RMgke55m68DPkHzB4GwB72cFVEQ1OB1+ZLF0DvwdIWrjFNOVegxeG1ESdembC
 woXSfk7horcpIQMwkmCX1PRCHZOf3U5c76y83kZQCmD2PfZaqQAzhLl7KAtigw5HiQWw
 umAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=EV6b8p62gD/RHU8mkv+v2jx/O0iQI+nv2OxNnCtoUsg=;
 fh=lTDkdzJUizD3zT7PPXzXFAp3L/FH5I4EPIH8UdfLkt0=;
 b=Ld9kI1uKyYIagigyzIaau6H/dlsRFliTfDhnLhIslQ9hmjIzJDVa2eWZXlc6BIlKlg
 9kEhMQq3WvrOU1C9DosWql1HYe7Fw6AnUEU2aG4+LD8uXF2aaRxm3w7oFqPebilqv8IL
 mdoWBWqMwykm+3sVYi9akqMdUDdF6NfBw2c6HR1NAaAzI0lObZ1WC4qw8MCpPcB8rUIL
 ND+Kz34gey07A99JSLNcF2nwYgLrg4/lccQjCTNSE7uC19dY+m4KyjtprXJwJa89iJGk
 KSv1s6LuqCdOLxEfVOWsgtGsTUJu3yQXrVs2DmBLDkDMcZq9rqV2m/L+dngnn0nmbKrA
 h/aQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781021851; x=1781626651; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EV6b8p62gD/RHU8mkv+v2jx/O0iQI+nv2OxNnCtoUsg=;
 b=bSpDF3K6H9oM9Itv4jsc/f9P8mbGIY9dz5Yx2I1M81Zy0L0s0wwZD4hx3orKwQzORL
 nIjLoGzH0m5/j+wbdYxNuCU4oirLHRJ+GALS7qcQNM71zCCgzY5IAXYU/s0eReoSd38r
 2xHBr2ww1m5mk1dx8CmUwV02r0nTP5sSDJNK29mj6LBCIRVb25x2LwNEm9ayyqsUQQ/u
 ISWNxYy4ZxaMTJDW3uEjhWM8wKUxCflnBvHjYqt7tHfFBP7RMqPDIUbgd6EVa7MZ4iMv
 CSig6rxVQ9nBEwCewQ/JNSB5b3YUbpB9ZgYxNSnym3O6d2XlL9+caAkHr/BDQeOjV1nv
 Xe2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781021851; x=1781626651;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EV6b8p62gD/RHU8mkv+v2jx/O0iQI+nv2OxNnCtoUsg=;
 b=e5zqmiZsl9ncRAruDOWbLvQnd4FeVHWZ5WER6rZ+ehl5VeK/Yu4zo9u1C/c1t6Csrn
 d7p1+S7OnnIsbfAXhlP9PhfIlmlnbQmqr9HmZDJFby1FmSe4LchjL3h31Xm9THY48BbY
 AXgQyfI0MmdEv/npIVBdQs3ILcHCFFYNnREwVPlVasScqytCn3Exeu32vUJP5Ve9IVy8
 ib0+wPiK9kAgQL6N9AMzr6xE2zMDf8Kg0pOGG5jBl77csJ21qU+jDoixdJtp98XSoJiZ
 iJWpwr8XeRf617CUi38QM+A8vl+H4tcVGhMd7VheEbMoY9PFJf7cvDB47M1y6QX7V1t4
 JCiA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8CeF2zT7zm4OJ0d4Qg8lwRcKMOzbIxI8pWsstISl4USW9VrekSCJYxuc5v7mhK6UYjhD8RcoOCtA==@nongnu.org
X-Gm-Message-State: AOJu0YypvnM1xYDwWCfZl2vWHWJsqOc9vIHvBqJI+a1uBnGLWCHsqZ5z
 CQK7zGtRX3Cc5G8DqhlrMy+B1Px4yzGEQCEH8MGR6FVeH+6p0M1415gu4UzNDqOqPf+yP+QcWA1
 hXBQnRmshxsrIkzLoEg3zywT58AGPxbxSMDFFGtCBe+86pO/BvNB7
X-Gm-Gg: Acq92OE4mMehCXdTuo1PoVWV805fEBwsFjC7qYvYXT6EHgArx5KaYU4CUt7aUVyAwr1
 xGBwq7M4xHOWF+lDxBuXIxWt1oCimNZMvjJGoj2dsUDaHKjPYvVi6OuqOy+38sjdhGqTJ+42iNB
 Ga7Al2GGVYcF6QiE+oWy2Sp200wfRLlpflH++gySTwT0TotEkGcZPkmoX00oJphiodGZwnrRA4M
 hfhs27Hj47g/1XAIt/VxJKFz+6Sj60GAq8CYT9IHOfA0b4BeOK9s2oTKXmB7Ur3jE7Ej9j/E4kr
 FYmLmCkzBY1y4jk5xHEscKO5iXjpJor2bu1gEUp5VhAOa4sNIvBW2edzmFlD/F7dxeVTuylgX8s
 mNQ==
X-Received: by 2002:a17:907:75f7:b0:bee:a25:b977 with SMTP id
 a640c23a62f3a-bf3745dce08mr753397566b.45.1781021851059; Tue, 09 Jun 2026
 09:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-40-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:17:18 +0100
X-Gm-Features: AVVi8Ce0l9tuDcTK7VaHj427P3KUD2qPcJ1SaU7xBYUoFWfI0Qg9ks8e6M7nphw
Message-ID: <CAFEAcA8M=cUusZOCcrPe4MsqfaWRjP4XKHKK_2R3xCH71DCQxg@mail.gmail.com>
Subject: Re: [PATCH v9 39/45] target/arm: Enable FEAT_FP8DOT2,
 FEAT_SSVE_FP8DOT2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Wed, 3 Jun 2026 at 04:30, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/elfload.c  | 2 ++
>  target/arm/tcg/cpu64.c        | 2 ++
>  docs/system/arm/emulation.rst | 2 ++
>  3 files changed, 6 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

