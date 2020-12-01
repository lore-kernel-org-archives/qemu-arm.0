Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp148045lfb;
        Tue, 1 Dec 2020 05:21:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3dALTU3u89TVZ5VPrWZF8JY/N1xeQN7TNvW5dTRhMKdHpFKpq9KC1OS5IbNqxDKmy+7MV
X-Received: by 2002:a25:3185:: with SMTP id x127mr3615269ybx.381.1606828875759;
        Tue, 01 Dec 2020 05:21:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606828875; cv=none;
        d=google.com; s=arc-20160816;
        b=OHVBta364ecKb3cz15TXaG3BKik0GHuJIQROjABwW9CVgOVaKdlW1oEdMxQjqgct4q
         Ihobo4tfhKPBAuv9itt5wDBCiUQzYZtDQB9l1BO2oC8Nis7FNl05GW+9b5CveB+lkyTQ
         nyNu6hXeCNUVfcVSAIID8Tq0WSrIWVy7UtlLcQex13apGECyrMj9okPhW2seGMmDD/LS
         mT75QDHKaKImFx9pk+ml+CLVSYrrSkysMQysVkHUGh6iSy8ANvbE4bePL7EMKlpABB4p
         8s34ZGExSEkB1Ah/7vc82ydT2uX/m/ti20dL9B1SoCSEGQrtFRdv5wD+4DkvtVtgYWe6
         L7hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gz3Yrc58M4FtyxWzRR++tVGnggJzKQwpyPxOjGb90Kw=;
        b=dzRAnYjVUtuyjFusSN6n28f0a/79udnvP4e9F+oWl4nlxUQyXv2Kzzcv7M9U/IWub4
         NGeNVMm6UioJhL7AKyHl/460r9OcKBkelp6Ouqe3DRZDoZgrgXfCElfQlYzfvsMXlFYF
         0M7yzqYx3oB+ncDjX8Z2oOC13PRggWzJC8ruopc6mT7AXKiMVNuqgg5vDwAghJcviSPl
         9IPgEYLz37U+IraR3zZnKQs7NTx/1pJSu0Kk0Pn5yKKZyrQ+eT+u4wtqM0dPn5wNR2Fx
         JOWjOOE6vzGKq4aiTNiWlHO7ac7UhFZx5rjPZNzzf5I8OQ7RZz89jgi+3fo1tci5/E2X
         tbWg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eWTomMMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v67si1694980ybc.47.2020.12.01.05.21.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Dec 2020 05:21:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eWTomMMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kk5al-0007ct-42
	for alex.bennee@linaro.org; Tue, 01 Dec 2020 08:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk5Zr-0007b1-0L
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 08:20:19 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:35510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk5Zl-0003WE-Pt
 for qemu-arm@nongnu.org; Tue, 01 Dec 2020 08:20:18 -0500
Received: by mail-ej1-x636.google.com with SMTP id f23so4074042ejk.2
 for <qemu-arm@nongnu.org>; Tue, 01 Dec 2020 05:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gz3Yrc58M4FtyxWzRR++tVGnggJzKQwpyPxOjGb90Kw=;
 b=eWTomMMU4RXwHoLORmSoH2GZ0LkSwU1B8oYuBMoKt1UYxCyNOIOv0xUu5d1LHnbJas
 jRDB4HRzBgr5lUA86g8K5FhXq/VIFs66ewH1HUHNVEmuQJsHmJ74c8StXkakgkBZlItU
 f+/3sTCIc4n0zRG2XjW4allMkqBwPTi60xJZcccwP0x+OBxOsoIM5qtdAqnECkY6tlOF
 5DRuDC7Xev6Li7RUE5Ht5/everdeVQZgBP5TVWqRxLZnRPfswF9Bk5mnrfz3YsOVrff4
 bUwu6cCvXiI20w5oDt2qnNrwIxSLRMIgtiZvm5lhORS/Eb3YoReixTchZcOq2oG0B8WD
 fx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gz3Yrc58M4FtyxWzRR++tVGnggJzKQwpyPxOjGb90Kw=;
 b=jNq7voBRs4a1JRpIKOGoztpjlHZBTy1KUKUfs16TpySn8u0U9C2EiwNPuYgReYFSsk
 yf7LZKGML3uGdFXCAPNuorceLm6b4PUEC9O2BMjcCP/XFySLKrHeqphA1wviMgrqGqr9
 2h0ZKxYStTwklXrv95jLk2cRe38lA6c70j4YNggFLS4jpLfLFR9nzaRtx8FCSRHaTrxV
 f59QvitetKlCmzl++4gmtyKNYPAIee8Zya8vYr/CPdu5zHJiJsdaVbb3bVSo7hyNouSY
 OXm8TSaEuZ+IvfWpjuu8NEstKiQWMSRWe8RBtZ5iCTA4Z82ZviOyjm3U4pMUxowvVU/V
 olUg==
X-Gm-Message-State: AOAM532W6/ivxof0jMJFmLvCT27AkQrWFp2RcSVHw5zVzzquvXVHmgiK
 fKfjFpbiFxxBIEbTsCNORsEoecQc9EFpX72NccB75g==
X-Received: by 2002:a17:906:2741:: with SMTP id
 a1mr2953125ejd.85.1606828811455; 
 Tue, 01 Dec 2020 05:20:11 -0800 (PST)
MIME-Version: 1.0
References: <20201124094941.485767-1-f4bug@amsat.org>
In-Reply-To: <20201124094941.485767-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 13:20:00 +0000
Message-ID: <CAFEAcA-cNX85Qkc_-ZNu5hxY29C_msHUm__J0-Ac4nodhFYGDw@mail.gmail.com>
Subject: Re: [PATCH-for-5.2? 0/4] hw/arm: Add SD bus QOM alias on the
 machine/soc
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DPL6pRFvYc1h

On Tue, 24 Nov 2020 at 09:49, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Easy fix for LP#1895895 suggested by Peter.
>
> As TYPE_ASPEED_SDHCI creates SDHCI inside a controller
> (not a SoC/machine) we don't bother modifying it yet.

So how on the command line do you specify plugging the SD
card into one of the new aliases?

I tried (with the sabrelite machine):
-drive file=3D/tmp/sdcard.img,format=3Draw,id=3Dmysdcard -device
sd-card,drive=3Dmysdcard,bus=3Dsd-bus0

but QEMU gives the error:
qemu-system-arm: -device sd-card,drive=3Dmysdcard,bus=3Dsd-bus0: Bus
'sd-bus0' not found

Maybe my idea about the aliases turns out to be wrong ? :-(

thanks
-- PMM
