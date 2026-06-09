Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE2CCD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 16:23:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWzF5-0004ML-Hm; Tue, 09 Jun 2026 12:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzF4-0004Lo-AJ
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:23:54 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWzF2-0004cg-QB
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 12:23:54 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-bec3f69d343so859487966b.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 09:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781022231; cv=none;
 d=google.com; s=arc-20240605;
 b=PRg5WE12K9tva9X+o0ScA8w2lN8mcCgld/JKd4phMEtQRaPwDIu7dXGn8YcADMIC4r
 TukOkuiYTepR7WIWl5Z7Tmt8u+gvX5bB/JeGL0wcFYYe7k0iRH/UXgM09mNKdtQPeV7I
 n3csfMdjM8HzvZeMnZtk8z0t6ErQswaNSBvF8O85UC+GMUiWUOoQ2AO7ow+KPI5iCMSa
 eiQJa4Rlwph66wum/zyG+/+A15sbXhqaE9wId1/s5aAtE/w9vvzkVwdQrpfJE8eq9mF6
 3Iz5WMGV3m42DFiu2BmHhlQwGdeEShsPs00H2Wz09a0OnINcNRj1nOw3PF4dJFpwGd5t
 zANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Z+KgRu4cybzfId7TsQ7wz6qLEalcFcnFgAHvMpT/vF8=;
 fh=sesmbZPR0w9Jp10Z5Kc2tBCPaW89rmAtKUtG499i3Ms=;
 b=BI++eYn2pUOtiBvYd8BoNNF849KKT2G/E3PPqlkf3AiqkBnJWK1mrDlawwnW5zLUVh
 8VRTnj0k+QcSp74BndGHsXh/PQM4pbIMP8y8Iq03H0ic+kiR2sh1ZjBMC3V1GA5tTAnj
 rbVanMQeP2YmOMTs0QwB9/qHn8kIoECvXHvyMgi4IHqNffrWP2uRLwQ0+VZ9vOMBT9Bg
 OO1isEgRVjEP4pBRI3/uFdJlpkaDW7W4Wuv7F0LI2eI77wN+RrthJBn5aEAozgryFUkQ
 4sE0g1kRrAxxih7yWQr3NIADDeSF3wE834dUU73Hvfz7nl/v5idOSluLjO9E3CAwrvM1
 bIrA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781022231; x=1781627031; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+KgRu4cybzfId7TsQ7wz6qLEalcFcnFgAHvMpT/vF8=;
 b=jKGPJqWjs5Me1UY2uaMIt+etADlPtfGGQpRClzzGNS/L8+oYzGHzLSukABEhwUQ3H6
 ZOggkPFJEI9hQv0GqMATyh8TohM8FHZnlKEU+b1JDv45vssqzLnLtsTN9k7O7Z4wRUOV
 p/pP2rZo4Gjsox4rgxxrJzrFHt51PczsmGOW3pkbajRsD3n2Ktdyzn7X80SJUlR/Ap4O
 iMmJ1AU4Jk0aBuT9QCsJ//74BAir01qOHKCeSq3ngCsfn5dva5WXtXJrz6aU+439GqDy
 TQK0yy9vVOt3tHfsAk84S8Y+XwjOI6PwXBL5ZbtJvmnM70urDv4Mb6c5NHCrTHyZLPcT
 M+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781022231; x=1781627031;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z+KgRu4cybzfId7TsQ7wz6qLEalcFcnFgAHvMpT/vF8=;
 b=X2ItgrxCc3kFiLaPDdLuT1AhR4h4BFcHsZj1s3giBDCB81kQZVVOpSL2Rz0UMuuiGP
 VIVSAJ3EMgXnQD4CEiaIEevyINISYPPGZMkGngEwaVrHIREl1leL3NocDUlyb2CeYnv1
 yZzCEaFN1MOO40aJ5ltU20CxuBPVEMndksFX/K1M6LdlG/972EMWxMn0v+DY63GXRPzr
 t7tXG3x4Mj6Ov+/qjQeCZCeMHtd/blKsvF8gLrjEu3Xcp0Q5Nu6/nzNi0vZnb7LU1fPR
 G0N2RaSJSBOdAmdnJnbcZDCVoEtb2LYdRMk4e9jAn5hoYASq0FYiI4Jrig6UsQfkP3zv
 OYjw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+wyVO/8cPXANHEpHs1gjDF3glezVdGvBbvNMQpp4oBLKR342XZhz7DTYdxzOStXQ9TmtAYIq1IGA==@nongnu.org
X-Gm-Message-State: AOJu0Yw8wunRT4v99wD2lXe9V2rw+d3LuVmb9dsPTj/nH98P3CUdJuj9
 nECEUkjFKcfN/XP12yw1OReOHWi/XRZFyRP8/ozY7KeUhIfudxoPA17dIK8nEdwWk7to/TTGsWg
 4TiKq9lH6Baga8NAIgKDDLI9W6uFSV6htpQMjGmRlEg==
X-Gm-Gg: Acq92OEkUGysv4Y3WDuRXb7bqlqUcbMyuXjLT8KQsNjWbi+Qq05UTb5miXnogSyDhRk
 4jefS5doKvNOpnwUjbLbuciyw7sdCgCaa3lpxst886olo/ZaovYWEt1XrZ1RLNYISsrg4LpsLWO
 WPN7vfzZ5eF6JXGL86i+aLudFBRzRIr5YyPrPbUQ9CePkUnZuDyNiwYWzGBY2S30xTvoE0F9XIU
 zg9XxJQ+AoI6nkvFF7dPlVcDRVA32oApnpG4cVsPT0bD6nn/bqmOjYen6q02aYIAdrFSmmBbPH/
 NqGx/W/zKgjVq+jrHDMHIBZXXj6icYjlNvplrB0Q1IcmqMdlMyDqIbFtzeXEW+3H9GFs3chKXhW
 cAA==
X-Received: by 2002:a17:906:8a46:b0:bec:4b96:5fb9 with SMTP id
 a640c23a62f3a-bf3701806dcmr684123766b.3.1781022231395; Tue, 09 Jun 2026
 09:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260603032855.106930-1-richard.henderson@linaro.org>
 <20260603032855.106930-45-richard.henderson@linaro.org>
In-Reply-To: <20260603032855.106930-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 17:23:38 +0100
X-Gm-Features: AVVi8Cd_wKcDu922_dwvFi2FPOxRC_1XnRtW7TP4jo8twogu4Oq6lXiPg2lK2iQ
Message-ID: <CAFEAcA9sAzDU4LQ-mTpjPp9uOhT1EqY+fqSH2xNxMby7gctqvw@mail.gmail.com>
Subject: Re: [PATCH v9 44/45] target/arm: Implement FMMLA (FP8 to FP16) for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
> ---
>  target/arm/cpu-features.h      | 5 +++++
>  target/arm/tcg/translate-sve.c | 2 ++
>  target/arm/tcg/sve.decode      | 1 +
>  3 files changed, 8 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

