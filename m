Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D13CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 19:35:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRxYq-0003in-Gz; Tue, 26 May 2026 15:35:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRxYo-0003iX-4Y
 for qemu-arm@nongnu.org; Tue, 26 May 2026 15:35:30 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRxYm-00053i-Bv
 for qemu-arm@nongnu.org; Tue, 26 May 2026 15:35:29 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6579254f996so6857642d50.1
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 12:35:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779824127; cv=none;
 d=google.com; s=arc-20240605;
 b=c9dV6FffPw6NC7g92K9HPf2YnaogNCyAscf9GjGFI9P2mT8wZng/BjotBSv8XasAyM
 E/0+zXYI/Dc8KkYyF/EQZwvFZ7lM9TuOCselhPLJ2a04G6BxKK6MpZNtFIgUuTlvapFA
 ghPUyH0XgJLO2uGeZ0cpLODrZdLMF8YcYGfiSMKKn0mU+nuNiOekZHJz1A74pTXvQt5L
 fy2/nS2WFK51cwNY7eKDTfCeSEY76gX1Qa+C78MbapOd5VbIObOdMIYdHd8s2cXWJWNa
 2DzvrsHr+B/AmxF59Z0wG2DMHx8nsmN3Xr7EuwXw8orVxVC4wEq5nPbchzQUiI8AtQoT
 FS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :dkim-signature;
 bh=6PnqVaY/NN2kfARNKe9yvKSpfkwhROM4WdwQun3RfVY=;
 fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
 b=BcFVt3K1NDjYR/hF/IJp6MDcqTOSTHeb7zbyzSOsqVwSstLhgiNbcebDTim/U0qjql
 QtVpWA22dnxrx8aFbdNu7aDlnV8yuahIx+T6IVkTIE9lJTcA3u9GIY4v1r87hMCApL71
 8wtkho0Zp1G+zHb6IJvEa+UXgN3U6WhczYjc0AdzsnTzTTPkXsh8mA46EDEw+MuZnX73
 S5zOYap/ci0URAJH3LYAMfhjmFqYB39y/96yyESt4g4nrJjMS5nh2UrqAdyFBwrOMyBa
 yWr3ZHfNiPYAxdoh1cXAp6Xf69xjS94klAQjZhrUVsujVmnN2qfvwEfyieJxag3w4K5Z
 U7yA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779824127; x=1780428927; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6PnqVaY/NN2kfARNKe9yvKSpfkwhROM4WdwQun3RfVY=;
 b=BMpc8DNO/6SWVzdha6aDIrHXAYQfzd1jDVbl+g0MPUD/iZNbHO+lt1gf4WL8xLQygH
 ngUEfslr4FYehZTezdpca01bMaRr2L0V8SJf62eP1qgtfHUu0/Vh46juxuTVrmTZPK8Z
 4z/B6I27xf6i5Igv0GLkKxgMjp8o/r9HVwk2/sj1bRVV5XxenKde6kzBVzPG88JGYGO0
 XoQ1bFO9wDqIK+7NWqdXg33+qxPBC7Xyy/JTIRzKMcxvfT957XYSkiSCTlk7Rf4DGS1l
 4AJxTs+izuTTi+jCo+cSgOr0Ju50qCDgeUO5y/p1Fb14CptMcKbJ3krbO864W18ZhBAl
 WOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779824127; x=1780428927;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6PnqVaY/NN2kfARNKe9yvKSpfkwhROM4WdwQun3RfVY=;
 b=etTIPECKy3nyhdVDohc3l0om71WeaeKag+vDjEKdnz6mHwpiPJmGhYAQwm8vZHQDbI
 jU/kuEN3AmGAZ/fMPxzraB/HBV4k9u1iuhchghzvjaVTbmNfO1P2lAmjP3hUCf3r+zfe
 9GVBwTZb+3xx23FCQ+L4jIkA6IQyKmN0beYK3KpyOPqvOVsFlgUAKWoM7arhcoBW4Bbx
 7RYw4PusvkXiduI9QnoGORghcQWgsBOFo0rSyMjmXs13wUw1plBh0HdTupWcWnCLq+Ly
 2dJUoV1WZXqInSMSWeLti2YK3JKroHsbRtWvIvJh/U90VQSFPov0faf9P9GbgMRxTy0s
 TjRw==
X-Gm-Message-State: AOJu0YzPXl50SNTM/NcKBEsKOjNF+iweOBg5cpHokqCGYy06OxFY5TW1
 Q6CGDIjzAnB+GnzAd4aTdfrVW/iysscj+uU/2H5OoyHrJes9GcWcxWxTqEhEpt4zikX3Y/f2s6v
 NFwrmnse2RRAnODQSMFW/EHbKLclnvsO9O+68PbqsvCmEEHZchouV
X-Gm-Gg: Acq92OFqhZnOvNI3/mHTdFWJoz8Pd2qTEx7MEZWo31C1DqPqZISaG8Sl4WIOzAjCXG4
 PxIsafE5O/BrTrAcGe8YxHKop86zKUeLt/84j3rfqBucG+AhgFT6YxEwPePWGZ7ZoMl5wyMx7wn
 w8wfl3+OEFXswOqJyg8RUGsP88ImloEZfXO48+DhAzxdTqdjOX4DoKi8uWy7Af9L2Bljr6HR/6c
 GYxeljnIyR4SGMDUqOIwF2pAA9QRXvorq5p2guV1tg/6/HlWJ14hmHY5/pTGEX9ztlDzPca9BsW
 O37okMjo0OTpFsL7tnfpTY7PNfaBxpE0tAzchvpqsEvHKpFbinaokQ/EpeIz9/Wejtek7PlO1u7
 JXNUjq8g5VB3O
X-Received: by 2002:a53:b1c3:0:b0:65c:2b92:f8de with SMTP id
 956f58d0204a3-65ec9808584mr15451807d50.28.1779824126670; Tue, 26 May 2026
 12:35:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260526174155.2491217-1-peter.maydell@linaro.org>
In-Reply-To: <20260526174155.2491217-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 20:35:15 +0100
X-Gm-Features: AVHnY4L3r75_kZNWoOipqsJoijL-re3oIYdX5SBKVTZIMVgYWh1PfJw-_HfyngI
Message-ID: <CAFEAcA-dKxq8S=Mb7NfgRp3060QwokbUkxey5u-XcwB77Nam3A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Don't assert if 64-bit EL2 AT insn sees a
 Domain fault
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Tue, 26 May 2026 at 18:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> +    case ARMFault_Domain:
> +        /*
> +         * This can only happen when doing an AT insn at EL2 for an AArch32
> +         * stage 1 EL1&0 translation regime using short-descriptors, and
> +         * the translation hits a Domain fault. This needs to be reported in
> +         * in the long-format PAR. Compare pseudocode AArch64_PARFault_Status().
> +         */

The "in in" here should just be "in".

-- PMM

