Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F72D39413
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 11:17:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8G38-0007hi-D8; Thu, 02 Apr 2026 07:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w8G32-0007gB-QJ
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 07:17:18 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w8G30-00028o-Am
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 07:17:16 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-6501c0399c4so713540d50.2
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 04:17:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775128632; cv=none;
 d=google.com; s=arc-20240605;
 b=D/AtzFkAOtoPX1U7SV3sqN824CPcEZXve/SWnmZjYmfsmciRUhNckM91z0YWYb0JkY
 txAFdXIT7m3/7e9exhSt/+shGw8FZUA6kspUj40YuRcvIaE/QpZzknmJqWrowCDwBWYk
 gbnyD91NAf7M0FnKuGJ3b5NOL+S9I978gzyrAcog+m+dECW+0vT5P/ibAs1Q4oGrBYsm
 cM1OdxIVg3cZttN6u6yGcGS0eU47EEPA5rc7fFsJpFPsW+xHZ/jNdBb4jF63mZSchRBG
 6vxFOeyLaXAPNYsPDITlgv9F/3TIc88utzWfoTmyETJaJGuOtMCOJts0OBWI5kFT6vdz
 7I5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=IUVtHv9CaQTlE1ApCtPVjBKYyai83t3OO/g8dSSIlsI=;
 fh=i4k2nxGe1fnolBtdQCZdhzxpKx6wpml93CsBDOo9WdA=;
 b=ASNdj2pWixdDsF/S7zYL+/htiPWurZ5sLiPKnUBnXCtXvlmty1ctS5dh6zy7nngEv3
 ZHOK77rewSAkoBFOcZfYxteTInuiFfgkSmL/w/tUltExorF/ucy69l6Ahznk+y6FPVgO
 f/HcOuH/BGeWOb4zQdNFrzBURNLQpspSzSbhtAioDLpqXzwFG20bsstKj+2S9icJirRi
 iZYtOAcEBgo8CcAF+eoMCndR4UFTqLddeBjR+YwK/PTs2zaF9IKdCBDIcM2X7CJrSn1K
 2w9dAg7g8TgfBdoofbn3SxVxvZcJ2BjaQWp8V7okiS1jQO9rUcvkkJ/A+a3ogAHWMMsZ
 yHyg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775128632; x=1775733432; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IUVtHv9CaQTlE1ApCtPVjBKYyai83t3OO/g8dSSIlsI=;
 b=EW3/t3hJyWmVFe/eoFYGBWFuJcNUZpl8ffJigraJUN6Kxr1wti3NWvaMPxKsBcyf9P
 lMYIO4Ix4Tl4oXov46KIVTABYp5eCnapTLtxuY947262Kk3vmjDSE0/MyOUsdYx7DD5u
 dmDZSOMxZ3S0sFtJ4rLdp8xl+YVIxR/PK7/08BPzkd1Us4AaYy3g7qrzxv2+mZtaZneE
 LP5uaSVAlCJcLge/8plDLWNhDsWKdfFadzOwCk/gv+HPFBO0oRsw4xVHtCYowH92XYUx
 ZlSvforpDjXwursWwC1j/FsLA0ra2zDwjSfeBINPiEXLaxDgzYvYHkF9Yw1DsI6b6SN2
 ZMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775128632; x=1775733432;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IUVtHv9CaQTlE1ApCtPVjBKYyai83t3OO/g8dSSIlsI=;
 b=QVpiLn/wZUaeyvplh3clxm5NSnW33C+e1i22dEcFrFdFTKkOr1c4iBndgLqtY0gUdl
 He3JCOiLyCPuKbIldBXdyaiclqYajdXQLCVteuRTGJhKByl7UnQzLGEVa04PkdF/++/o
 Rhe+hwDggOWRz6aXusA7E1IFaqoePDjaZsPE+V0QZohhKj7WOngwuBoAQE2OyNEmknvE
 o7zLG49ixxxc0mjlSfle6aNzxheNQOtTxNv5Ixm+WEXUCF/1+Khw+SRl/lAm+W8/oMgJ
 KzoGNQB95Wn93idcb0ffU7RYzqwB1X1w/VARqKDAgV2/mDD/kqcgaprs0KCqKRSi9YzX
 EXJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWKJu3kr4nrmohuoOQERJVKB1bBUiJCb0uTXq3JFKdEmCwlaeCzEiSizfaqNTDRRM1j4si7s5eCA==@nongnu.org
X-Gm-Message-State: AOJu0Yz58hvvSIEwqz80i5QsDbDJ/FKO+P83sVVPb7AkIGoy75bfLldc
 qqRqBVB92QvK7rkpinJWt9f0md+BtTIOC1WkVv7ZarketvRxsdlIfDgewD1NWAQDz3lVnpm4h0X
 Us6YXL9YuExD4yry9L5Y+d22xTmoIFcVRrzcuW6e5qg==
X-Gm-Gg: AeBDietDgzvBdxHyMNg3LykAwawvwhtAjQpNwXh1ORCcaYUu4pS+g6pQp6WflUwYdqr
 szoSjcXv3cpD5gQ9E8bq+0w5mtTdWIOgSSruO0praC0v9KnmrxEfUvIlB4Mubwd9vduIFiMoFbR
 wb/XZL0NlYARxCIdm4FPtSmZeo3hCIlt5p5KI2rC+MHmYae3sQjVJpNEIjeIz+EJd7ipsPHL4DK
 5eIRiVOrAvmB591Caevh1/A3QB5FEFAQHCz/8wDCkDV9sDnX36Bm95GNw7C+t5HQObK5u2yff4S
 KDQBgiV+vksavps8nUUppGg+MedebIiWaDdIld89xGyX3DIjXuON+/zbn96551FEkx/TyNSIsxB
 qtQ==
X-Received: by 2002:a53:b4d0:0:b0:64e:e0fc:a314 with SMTP id
 956f58d0204a3-6502fe7bf8amr4557982d50.69.1775128632265; Thu, 02 Apr 2026
 04:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260401220720.19555-1-mohamed@unpredictable.fr>
In-Reply-To: <20260401220720.19555-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Apr 2026 12:17:00 +0100
X-Gm-Features: AQROBzAV94odNk4MQPdJgImb3kgtACC_8dUyZasaiwXt9GWJXTptjuwHxnp0q0A
Message-ID: <CAFEAcA8qchsEganwrejiqoWabUd_BmNfnS0AXzWR+tT61OsjyQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: cpu: add HCR_E2H on reset for EL2 + !E2H0
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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

On Wed, 1 Apr 2026 at 23:07, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>

This could use some rationale in the commit message:
why do we need it, what goes wrong, etc.

> ---
>  target/arm/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index ccc47c8a9a..5ffb1e3096 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -685,6 +685,10 @@ void arm_emulate_firmware_reset(CPUState *cpustate, int target_el)
>          }
>      }
>
> +    if (have_el2 && !cpu_isar_feature(aa64_e2h0, cpu)) {
> +        env->cp15.hcr_el2 |= HCR_E2H;
> +    }
> +
>      /* Set the CPU to the desired state */
>      if (env->aarch64) {
>          env->pstate = aarch64_pstate_mode(target_el, true);
> --
> 2.50.1 (Apple Git-155)

thanks
-- PMM

