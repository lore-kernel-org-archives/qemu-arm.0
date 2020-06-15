Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1670428lfm;
        Mon, 15 Jun 2020 06:03:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV2de9PEDhPjvwpFmSgr/w/KF5T/DpmmxAR4NzSrn5ZZeKelOBnr+2SNU7ltgzQ91lrCeg
X-Received: by 2002:aed:29c3:: with SMTP id o61mr15750124qtd.15.1592226239345;
        Mon, 15 Jun 2020 06:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592226239; cv=none;
        d=google.com; s=arc-20160816;
        b=BqKvldsNsvUD2xE+vt7lSJvtO72LEafzguJ6iAKm2Fp9W08CBlExrGq9FnwWAO17OV
         FReFVZgmc/sP2ahr0xaW70T78/g0SoGWzCuRwJENqpjxbiJG0SIyQT8z/XFUaXOkx4n7
         RVgonhGoH0dTMuVAcwzpoUQV7wk8G9LcAJ174+uOrsNEZs/gasD4VvqLRpBhsgRt8BUb
         Xhu7ynD8kWHo+cZtO/CIT8onwCE4G9UH0dZ8AA9dGpP0MH7sqaXCOW9kdgy2//XwmpeK
         tPo58ukjYsba1OV5iQtWfukEn4IhkJpl9NrNH3h79DaBOv051LqdEKZN+e5W2TSR37X6
         j6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J/F25bttsw8SdxqO6QIv2TREGEGLu98IP9Mvu9kOtuU=;
        b=SPOVYOImWor6unn0g6sLEtRQz/oVQCR3hw+5RZviv7GCQQaLAvzN7kWvYGXUu9b+te
         vT5pJr9+VsLt7GPADm4UFCeVmJ7YogfxzU0gb74mBpzDKwR+fpT8+QrDxwPvysbIjpqC
         fhSohDJ4Q1EINjdjNJJ1vNkVvVy1hC5m5QNosDCBs5K+M8VnAg35xCn1+PXX/0KuGM3K
         9EH1Xz2dtOc00ZG6T+f1moi0SYJczxd9DQBTXNrjwNpvr5kH7TYXjLVusK4Cugvz0lc7
         8wynyVIYyVi/lmhVYtwLORrqJ36LCxO4zPqknvXYJYdQ2ZXNOelz8kdrnDBkxw/BF95A
         zPZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I+ruPTLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si7358665qtw.355.2020.06.15.06.03.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jun 2020 06:03:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I+ruPTLP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jkomM-0004c4-JW
	for alex.bennee@linaro.org; Mon, 15 Jun 2020 09:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkomD-0004bi-SU
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:03:49 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkomC-0008Mx-7h
 for qemu-arm@nongnu.org; Mon, 15 Jun 2020 09:03:49 -0400
Received: by mail-ot1-x342.google.com with SMTP id g5so13018370otg.6
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2020 06:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J/F25bttsw8SdxqO6QIv2TREGEGLu98IP9Mvu9kOtuU=;
 b=I+ruPTLP/NfTcO5bDgtKeRcYNS6AYB2cX/VcMiIYBIHQwZxlmou4kUKtBH73oBQy4M
 /76rLqDVcUAVbZ6JKBikcW41k5lARds1aYLLc43Ijuca5oV1P3brsdlXSND+ouJuxhg7
 9pRXiG3cxLZgC1IKV0vrwSl45RXnPCp5zv8DwwUf/zfwZcp28YF9TAAlD4t6PMYLKHfU
 LAw6HY/1N6oJv98QtSPxoX59GhkRRs2mKhvGaxwoTJlOwR04f59dW95pBt7f7TOWbxBM
 2Rr8VcPvZdqR3pnQybznfGe49Hr62l/ORPuKSdRKiK5DCinP3hjkMJ8DNq2FXm3UAmee
 Yj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J/F25bttsw8SdxqO6QIv2TREGEGLu98IP9Mvu9kOtuU=;
 b=Oq86p0j4d/q8uj4EvV63Gsg3cNs1G4mQ/71IJNUB0No/szfHmgx74ATqpTDgTJZ8Zf
 9LssrWhX9VAG87YUcuJ1Z6Rr55cuoEAfznhsW9QDqdnKgC0HRuxJzUfdz1PQywZJSUcz
 Z/6Jp453NgXrqosFwNNiPgBmOCEe3mMz42kq8EsE4GIsEhMAY3k3ep134d7F9CiHCIHl
 rLXE5n5wXU7s6tOGsUH0sbowaDa85eQbEMqefKEQt3Fvf7rMMxYJHpvHQEjXaf2e/sR9
 mF0v+or3G4M6jzrFZxVXPSjOAPb17vYxB1keS5byfsHRNdTuUequYNW1kMwXmbrF9Nnw
 I6vQ==
X-Gm-Message-State: AOAM532EVcocVlr9q/d9Ygr9yvt8EhzJpGtgcg2vHJZWF61fAJPxpGIA
 9OlDHJRfN5bUyH0zId9eSasAd5/Opc6h243Pi5X7CQ==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr21877594ote.135.1592226226838; 
 Mon, 15 Jun 2020 06:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591272275.git.jcd@tribudubois.net>
 <cbafa49a59659051387e43b7b35d8f280e59f1a3.1591272275.git.jcd@tribudubois.net>
In-Reply-To: <cbafa49a59659051387e43b7b35d8f280e59f1a3.1591272275.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 14:03:35 +0100
Message-ID: <CAFEAcA-ivCjAcK=mVBktdN_ms09M096WF=9zoKM+11=HzgmwSA@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] hw/net/imx_fec: improve PHY implementation.
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Peter Chubb <peter.chubb@nicta.com.au>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8ziceou3J8nl

On Thu, 4 Jun 2020 at 13:39, Jean-Christophe Dubois <jcd@tribudubois.net> wrote:
>
> improve the PHY implementation with more generic code.
>
> This patch remove a lot of harcoded values to replace them with
> generic symbols from header files.
>
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
>  v2: Not present
>  v3: Not present
>  v4: Not present
>  v5: improve PHY implementation.
>
>  hw/net/imx_fec.c     | 76 +++++++++++++++++++++++++++-----------------
>  include/hw/net/mii.h |  4 +++
>  2 files changed, 50 insertions(+), 30 deletions(-)


> -    case 5:     /* Auto-neg Link Partner Ability */
> -        val = 0x0f71;
> +    case MII_ANLPAR:     /* Auto-neg Link Partner Ability */
> +        val = MII_ANLPAR_CSMACD | MII_ANLPAR_10 | MII_ANLPAR_10FD |
> +              MII_ANLPAR_TX | MII_ANLPAR_TXFD | MII_ANLPAR_PAUSE |
> +              MII_ANLPAR_PAUSEASY;

The old value is 0x0f71, but the new one with the constants
is 0x0de1.


> -    case 30:    /* Interrupt mask */
> +    case MII_SMC911X_IM:    /* Interrupt mask */
>          val = s->phy_int_mask;
>          break;
> -    case 17:
> -    case 18:
> +    case MII_NSR:
> +        val = 1 << 6;
> +        break;

The old code didn't have a case for MII_NSR (16).

> +    case MII_LBREMR:
> +    case MII_REC:
>      case 27:
>      case 31:


> -    case 4:     /* Auto-neg advertisement */
> -        s->phy_advertise = (val & 0x2d7f) | 0x80;
> +    case MII_ANAR:     /* Auto-neg advertisement */
> +        s->phy_advertise = (val & (MII_ANAR_PAUSE_ASYM | MII_ANAR_PAUSE |
> +                                   MII_ANAR_TXFD | MII_ANAR_TX |
> +                                   MII_ANAR_10FD | MII_ANAR_10 | 0x1f)) |
> +                                   MII_ANAR_TX;

The old code does & 0x2d7f; the new code is & 0xdff.

>          break;

If some of these are bug fixes, please can you put them in a separate
patch, so that the "use symbolic constants" change can be reviewed
as making no functional changes?

thanks
-- PMM
