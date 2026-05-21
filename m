Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF67CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 15:40:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ5VE-0007fE-8s; Thu, 21 May 2026 11:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5VB-0007eQ-7N
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:40:01 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ5V7-0003mk-UQ
 for qemu-arm@nongnu.org; Thu, 21 May 2026 11:40:00 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-651c7ddf514so5909488d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 08:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779377995; cv=none;
 d=google.com; s=arc-20240605;
 b=NaGL0iX7c3ncihyT6U2CR/vVL4FuTC94yYrbp5CPNGVUVjaYLYmcLVY9Qo2xxeOJQW
 B/o5+tyLtCWwo6ojvrP/iuQyJfkVQTNX0YVZWHu/Rymp6taI6Z/YAUyqg4eyolzarWEx
 wpHrhqnFPcxjAdTXkdpdL0VuXUqMgmN7ETQXxYEwsDx0Ff9B78gaYupOTmrqzMlH6+0a
 sONqTZgdcimNH8WbIhRCCooZBcDd2AKS1DPxihSIUDhbZGpmpF9dp7yNEcgDEJgJGHsv
 vj6UFve++s/Cbeu1C4uN4KzYyhk7HU//dKe0jBkzrcPQ+c1NDwh8cjaKuTdqVzb1P5vJ
 NGgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=9igfbuUAgn9th0yGjavjkEn06WhKftK7Mrg6Y9WER/Y=;
 fh=zc1x2F3sySBBDLp15CpMJHa1aZGau33vXTscOkvZy4U=;
 b=SglvWFwPTY7y+AcNuOvlqrGPcm+bGmGUy94odiPdPZrBFK+Kn8vfLaVLGTvA908tK0
 kqNrrBUUu/fDhdv6oiGRVqNdW1CapXcIvE3xc/aXn/M6DVXUyEVokSDM6hFOSVChxMhX
 vPMnejTFtf49XNjVUpjQVbOqsQ9k9UB1A4vNrTefFzeJR80BN5AxF8Z1xRcD2oG+afaB
 C6iL5Iaki9s6qiQEbWfW9LCG4TWWMzeUsGwQHDbNBB/VRHQ9YF9SphZu08bKU3+53Wvj
 9f6rBY6lHR+117FIfc94EO0fHGs5ykv5wNewR2QdlXNOttMBWrKXUEwE9xkVU+c4fjJ4
 td0A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779377995; x=1779982795; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9igfbuUAgn9th0yGjavjkEn06WhKftK7Mrg6Y9WER/Y=;
 b=N12iB4wgvjWISckkKGMqRcwhPL09MCerNtHVFQgggQHl26hnI8uqOtLLwKxWMH0vD2
 DiD1/99cW6UXkex8CHXa0hwQ1N48aeZga+PMp5zBMpVpVm/4yLhSksP/gHp0Umdl0NQA
 DFzB/HavI4nhrzG5xTsbbnh1jrEUNiXWn2yrHSGfGKXTx8j0FgcjRqX+A7SroeCOEZre
 b9AVT1PkumMVz7dR3vU0QP5OwmwvK994tGGkedpNELb1NUnInD1IALAguGLfg2cZSLe6
 sfj0iyIvIlA2HniVxifAJtFnV2w27Jb+ZcDJOYRJcM3s5NBW0c+lm2NKHH0jnTBPJoOQ
 tBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779377995; x=1779982795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9igfbuUAgn9th0yGjavjkEn06WhKftK7Mrg6Y9WER/Y=;
 b=P9FnNFHKk2g7FGiHTvXfATxrGqzi4BGFx1T3jTJzrZiKO8ut/lmggdVJ3nmgw5a1hk
 SBcv5As36BtG+zKM1UIAF9jqZ2JBVKjEsCXqsc6MhKAignetcSMNiQLkaMUlHzzbcGXw
 bZSWY5czgDy1Wpof8ckNt75jK8FBPWQmxnOI1YAq8int1E8ytD0y2x7SVpLblSbzW+H+
 4ii4U/nyZI/DNJ+Eo5C/aiZbNyaVFuCjdvqyjuNutYZzRhDO67lgz1eJ4AGbWgBQNKi/
 mzWfJy7euWTWc2SyKFx9HRxs/MJNgf/j1qnPeo3Uiy/IwAod7Xqib07Y9BTlnFy9arrZ
 EYsg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9e84ivs6MVXbW0rJDSqGlcXgKWty8SyVioaC4EL36CBrCa9grdT+eOTo8vfF4jg1mAboA1dHINiw==@nongnu.org
X-Gm-Message-State: AOJu0Yw59IM2S5dO0gZT3oIvgo0GSeE4DNsxNNVoHU5BSm5azZxgsL+4
 sRALjCy6ZxAdMQsiY3ENTkFaUvYElykx0oHjJjpc2ib2FU9apxtRrMJIsqcUXjYGcD5dzWvEhmd
 lvJifU//WSMEOu9aQFCeft3OwKMpBMAMpKEU/mpTHCQ==
X-Gm-Gg: Acq92OExiKBDP7mkjB6c52dc0ugxfB+ngKBg9a0kMgvRkyHG/hyzGSMCITMY8aP7IYR
 e6adzIiGorvLuAMrh/BObgATua33eJxskLIoasZweZoCzXo3IiUyyI15qYuJv5gHH8aKFy8hb3B
 CZaN+OLyOxVT03XandsPCKy4bjhODT3AN1ZdHXZDrxvwPgOMqx67/zq2IroX4V1WhvWDZ3qJy+y
 l7BCAeC0+/HygIxFNKgeM5G6HfX7cOhCUalfRp36BPfoMPszanX3gz10Zhm33rc5yr/bQAzdwdK
 ovkW/7lZJX/p3MQxmT9xtKzEmoM6gKKg3+yXRoBgbA7nyAvEbSC6lXPr62ZeWB3QlkNehLoaJI9
 72A==
X-Received: by 2002:a05:690e:1688:b0:65e:4cea:a088 with SMTP id
 956f58d0204a3-65eae0e4aa0mr2926773d50.36.1779377995068; Thu, 21 May 2026
 08:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-21-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 16:39:43 +0100
X-Gm-Features: AVHnY4LPoBLFmKtSAhG_gu-VIMQ6Ji2-OcwIqUP7PlG_93PAj3pOuRR07hWTGWM
Message-ID: <CAFEAcA-Pz2Tw2AYeDy+E3HdDWtRfhSV2zSBCzNNmGzdJP=1aQA@mail.gmail.com>
Subject: Re: [PATCH v6 20/64] target/arm: Implement FSCALE for SME
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Wed, 20 May 2026 at 19:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h      |  5 +++++
>  target/arm/tcg/translate-sme.c | 15 +++++++++++++--
>  target/arm/tcg/sme.decode      |  6 ++++++
>  3 files changed, 24 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

