Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07013CA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:26:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfqy-0001LC-DD; Mon, 05 Oct 2026 06:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDfqE-0007ME-FF
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:22:49 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDfqB-0001XP-8S
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:22:41 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-66c7e3a2332so872650d50.2
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:22:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791195758; cv=none;
 d=google.com; s=arc-20260327;
 b=iLHV4eWipWja71IrIqdIunL04y6+4b81APMypxqRLIiHZQ43B3ODbg0L1dZte2mJU+
 sbNw/pIXAqiGkj3OUsEgyH0apEiQr1xOcBe9q2Mmk8DbMAD4YuMryCOLtPuJsMSsf4U7
 gwsYHl3rGQ3lKqS9BBval2QxAuEVsw1RJoRY+/XoMoXrg+DaT7CA8CaaMX+D+x431aAK
 lTap2zGPb/zGH9AdBtU+RvoU/oeZdPMcQ7ZCaTqZ0nJ/NDRz893dBW0p7odZNRTOVCO7
 UESrpqOMZXK6isOJVecQHlTFKxYkwslxoz/0h4dEWUgEPZkp20h6x3HEKZQJciKHwlsN
 KLwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=R15Oyss9wprL0XMCOr44LJEYKtBT8GUKIm/MY0njC88=;
 fh=6rwsmZy7IRXDD1wo+H7eaNc7V7vvUQh3xRmMAnGhePY=;
 b=p+AuDX/QPSUtPi0TaVCTcTTNOn710bvu71sgae/XTFU4BDR+eaeh3E24KIGMQyHGqg
 SNMQaYB7Rw9r9462AvLdbKzcYdIQL+PcP5wRjPeteyXrAg2HhO8xuD3CsKM7DTSA25GI
 2rxvvQ/gAyPOVeAi2STUNFIpi7BbP6a5qTzVDWbFCd6YUZVFg1oYXjVJofwiijSuvotM
 z8I9E5wWZzjr2jofDuE7dzL+YHRlMSenLlWxEdWizflB4pCr9SYOmjZKTqxZKc5ZSY0R
 +QAkc/GSFOKFjceBaA9BR0Ke2HFG4RkLv9IMF7Mm66pX4P17N/jm+x30jQ9pExr8N2N9
 PNVg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791195758; x=1791800558; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=R15Oyss9wprL0XMCOr44LJEYKtBT8GUKIm/MY0njC88=;
 b=mOoz1JcgpfByB2SiTgDciNB/TKzYPLR5UiI9oAv8wLpd7W/UedPpLH/5L3JaVI71/p
 Aj3RpefqD5jRSTIL9T2eqH5DrKY/QTYThQhJIHskHDp2fO2uvbsHq8i9aXZztVGhruW1
 b2lPjo/5j08gW1wI9yfqryZ25OILHv+J4ZbHgDgw44VpDObiOOfPokWG7SsDVCRcGThs
 SGOkwfd2vwPDe3W2pjOXuySmdsnNAS/EtbOWsTfHnH+IWHGsQWJmhH2waqs5NvsG7G3e
 ysaQeIwXY5YotnJJbrqRiRY+CW17szN0vfDkDVkPZtrpzW8Dnvs3yMWVF7jd4W+A3nFj
 D+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195758; x=1791800558;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=R15Oyss9wprL0XMCOr44LJEYKtBT8GUKIm/MY0njC88=;
 b=g2OLRZ0M347A65AzDuf60w1jd3ebxbw4afVTLeVEem+Yw+wRBt/cYp1mhcE4Z7IHTF
 t6LxJqYVnj8UYVRI7Me1ye2PlfuZx4gomI3FJaahKyG5OhDUpzhBBcPmCgOD+UXJVDxP
 K9wyNEwe2PTyie4sObrCydG/6o1s8RN4kykfJ2bbg7UbsudqPyCoOjvogDCXBE/Mv7/K
 6lR/cnffsbXZ51SYhKt9eJE1TRfdUimCpS3dDZEdPuNURBbHYwJHt2zcGjiXsJAB+03N
 FL4JDG2SWWCMur5H75IB+wPvmj57IfW30DCrco7Vwrm77eA1C0QR5U/GQ8k1tEpt+2cN
 6rSQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9yyv4glo4zWFPonyf8uwoUrbmtG4HO+ZtmDw2NK7dApJSPQYYqxMk18UlT2QuLzn7ZLtevAI51w==@nongnu.org
X-Gm-Message-State: AFq9FYKnByYCwePbxAjpI2O6exv0KwLO6VInx0bn7+gMNrBCp/yLZaPM
 Ht2skOQ/kGmKuCBRVXwsV+4DgkXMh+roXGJHlDHgu9EtfqzkErT1YaioOZuzBBh9WNFkniMbjlt
 0Lu61m6crVKWJGB8u+DYLA1m8CK4hki6yMlvGT8zddQ==
X-Gm-Gg: AYBFou25alXYcdZUH3i5FhjO5XurE44QiJClCuT1FR39n/m8u+UdArMuW1sCfGjBSq2
 RtkN1BP+DHQWcmd2kJtv18J9rQ/uBGEMze2yo6Tw95dVmhZAFu3sj4TeWTMYYwwvVQ5guu4PEpk
 Tp2F42aM/Vk5EoY5k3fFiK1eCpVYz248fYwTEcDEDb79sOUHPt24w2Ry6Xru1ci4IJ8/kuvClZi
 EKk6kcviqLhqK75xAMi9eDE8sCw2upCmdPKonAp6VXO/fkHOIvJOGdM3LSilIRr2++I60axTq46
 KCDLTlGXcF2+V6E+JonIL9bIss2hQf+W3CMXOXobf0NO8IDqeKYlBfhrYeZiHHTms1kZa21fgtq
 iZV6RBryFqhOqO5+bv8rguphA0MD3YrwZ11h7dEg=
X-Received: by 2002:a05:690c:ec6:b0:8ac:4531:829f with SMTP id
 00721157ae682-8ae950f2eccmr20411047b3.66.1791195757822; Mon, 05 Oct 2026
 03:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-4-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2026 11:22:26 +0100
X-Gm-Features: AclHuK8SdaXN6tAyevNCJpW0NivQcZopKzKr8TuUr2SreUOv3VLx6n3GSAEpdmY
Message-ID: <CAFEAcA82eVaZRLFph3_7jcad+oTWoh8sBp5XV=BTQnACAh_iCA@mail.gmail.com>
Subject: Re: [PATCH v3 03/31] hw/watchdog/wdt_imx2: Clear WDT lock on reset
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org, 
 Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Mon, 5 Oct 2026 at 11:18, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The WDT bit gets reset and becomes writeable after power on reset which
> imx2_wdt_reset() represents. While the WDT bit in the WCR register
> already gets reset, its locked attribute wasn't. Fix this inconsistency
> by adding the missing unlock of its locked attribute.
>
> Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog support")
> cc: qemu-stable
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Bin Meng <bin.meng@processmission.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  include/hw/watchdog/wdt_imx2.h | 2 +-
>  hw/watchdog/wdt_imx2.c         | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/watchdog/wdt_imx2.h b/include/hw/watchdog/wdt_imx2.h
> index ad36b8820d..fc01fc46e7 100644
> --- a/include/hw/watchdog/wdt_imx2.h
> +++ b/include/hw/watchdog/wdt_imx2.h
> @@ -85,7 +85,7 @@ struct IMX2WdtState {
>
>      bool wcr_locked;            /* affects WDZST, WDBG, and WDW */
>      bool wcr_wde_locked;        /* affects WDE */
> -    bool wcr_wdt_locked;        /* affects WDT (never cleared) */
> +    bool wcr_wdt_locked;        /* affects WDT, cleared on POR */
>  };
>
>  #endif /* WDT_IMX2_H */
> diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
> index d897ff6e52..a15f452d48 100644
> --- a/hw/watchdog/wdt_imx2.c
> +++ b/hw/watchdog/wdt_imx2.c
> @@ -60,6 +60,7 @@ static void imx2_wdt_reset(DeviceState *dev)
>      s->wicr_locked = false;
>      s->wcr_locked = false;
>      s->wcr_wde_locked = false;
> +    s->wcr_wdt_locked = false;
>
>      s->wcr = IMX2_WDT_WCR_WDA | IMX2_WDT_WCR_SRS;
>      s->wsr = 0;
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

