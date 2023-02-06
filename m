Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4237356ejb;
        Mon, 6 Feb 2023 06:21:43 -0800 (PST)
X-Google-Smtp-Source: AK7set+SFslelmi4rlngCk+pwDhmiDMk/tWF2CSOkyzYD7rRiG375lJLr/0vuByEQ9xVdf7YPw94
X-Received: by 2002:ad4:574d:0:b0:56b:f99f:e0f with SMTP id q13-20020ad4574d000000b0056bf99f0e0fmr5458353qvx.2.1675693303227;
        Mon, 06 Feb 2023 06:21:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675693303; cv=none;
        d=google.com; s=arc-20160816;
        b=acjY5+67LgH2bab/6SKTDofLpvN8O9ahEevTB9oW915DSXYRNrYIgwh41sd+q/Acyq
         98AmmtoRZRoMOq8MKY8+lfnt/dzCcxWvTZOtcxbBojCsVTpJMwJ1TmjL7ODD7k2b3Weg
         5WfNAin/leIeXqkF5so0E6tXCCAmXGweaRvxdh2Kmup8i+A46Alxpt5o9Iu6vFQeJxNz
         SxncwzPS2WROJBk6MsutjP/gahCgcNkIQAnuP+7zo/QWRHsXREwJ7+xbRcp6QVHLMNYH
         sUm0ZcRR5Kpz1OOPsNmXWMQDgvFOVGbcxYSnXb3mOmBkA8OMkTJnf99htBeVRS7t/mJg
         K6FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kViHKUJOlJW21zcz/nnCiv73PNNX6+GNTuFoCxgjCy4=;
        b=l9+Y9ZQvW8U6GhK/MVlz4Yo2XCjzvijDRKQC1H18vhzr/zT2iTi0VT5syUV4Va10Tp
         QunoVi4wNVqqJ9Ev3N8zBvI8PGhL/zTOUo8GKs53ATXVoLpwDo+oI+D+7es+/NFyUMKl
         BhkvQCCL74ka7R8sIe52lM8z52JW/LAllMmnYqw12VnU33VYIEgywBBSvk82/muXQL2W
         ehD7Mu3Sa3QcA6FlIzV6eQtCytOXDINc8+Fxh0VrM82980WXyB7//PZzj1GkX3TZGF6Y
         MkQr6l+eAr1yOr19Lkg0R/puaBIuCP+ddeMXYJYFWmOBKv70/6elH0+s/klokeUQQVJE
         CoEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ucArZ1ej;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bt11-20020ad455cb000000b005355b481cd8si7496853qvb.66.2023.02.06.06.21.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 06:21:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ucArZ1ej;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP2NH-000561-5k; Mon, 06 Feb 2023 09:21:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2NE-0004oO-VK
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:21:37 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pP2ND-0006MZ-F9
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 09:21:36 -0500
Received: by mail-pl1-x62f.google.com with SMTP id h15so4887354plk.12
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 06:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kViHKUJOlJW21zcz/nnCiv73PNNX6+GNTuFoCxgjCy4=;
 b=ucArZ1ejisJ83BtyZ5wftnBUDiJpSV2x4PezAQIc97D8mu0ac9iF/zT+Hy8x1LWvV6
 H9k3SHniJ99xrF/vvmnGmTZ/C3MEQr8DfQKtA1+7j1khCXdMOxBqE5mrf0uD8iHmjPWT
 /uLq6R7b5bKH7+yR1aDSBukSBpgAL/LqACi5y/jGNB/A5YvrSemSDgLRokbEEDVuh8qV
 ddqVKiHzf9gGFJt5fidl/fLLXMOeIUWM3hfoexQe1Gti0Nue53iq9cNrbsaJ+ZGstoRO
 Mlw1iQwi2zoW3iaIlTq6iJs2EMH5WN11X1/i1KVvhbIn3MqD7e0VoxVf5ORzjkFjuH75
 Gb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kViHKUJOlJW21zcz/nnCiv73PNNX6+GNTuFoCxgjCy4=;
 b=2IqzH34JiJATZvhJE68/9oZ5gc9pl81dEt/3CwAsR9KFwUe3Harz4vzFGTnVxQJDnW
 0dqAlC/yGVKAJPUtBVVyAce7Bnmz1bp24uun69ckhVDfCVh6daiZUnhR5Fdi1YIBxWjQ
 NwTmmzqcfFnLcpzDnO0YNZjAoGQ0/feBvl2lV8N8TJraYq3sKuhTeyYsgCPq2Ut5+der
 XXaKuv0ndIc1jqr03pZBjlW+v1iPF12o8MJq2fhfQBDdP6kF/aDjOi6P3qCj8770e/Vx
 hCGdjlaGE2m6ErOXRBpOGdoP6pFwYM+nV8lXsrgFlGEpP/9fHDlIZFQOnXHInWTn7YL5
 omCQ==
X-Gm-Message-State: AO0yUKU25MLlbOaavtCk3NuR41ong/kIwS4+5tY5NFiT3fhQhQFpL1Yk
 r4VZOBpoXwvMxXxCdnXweNlHDqwUkpI1nKW/nNeQ/A==
X-Received: by 2002:a17:90a:313:b0:230:c24b:f22c with SMTP id
 19-20020a17090a031300b00230c24bf22cmr667461pje.53.1675693293905; Mon, 06 Feb
 2023 06:21:33 -0800 (PST)
MIME-Version: 1.0
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-8-farosas@suse.de>
In-Reply-To: <20230206140809.26028-8-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2023 14:21:22 +0000
Message-ID: <CAFEAcA8exx1H0+LAEGDMG8iuFN+yARyCpdAHu5HPhmhhQ3_Qww@mail.gmail.com>
Subject: Re: [PATCH 07/10] hw/arm: Select XLNX_USB_SUBSYS for xlnx-zcu102
 machine
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I9ECdHlNvZcH

On Mon, 6 Feb 2023 at 14:10, Fabiano Rosas <farosas@suse.de> wrote:
>
> This machine hardcodes initialization of the USB device, so select the
> corresponding Kconfig. It is not enough to have it as "default y if
> XLNX_VERSAL" at usb/Kconfig because building --without-default-devices
> disables the default selection resulting in:
>
> $ ./qemu-system-aarch64 -M xlnx-zcu102
> qemu-system-aarch64: missing object type 'usb_dwc3'
> Aborted (core dumped)
>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>  hw/arm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 296d4f5176..552e3d04ee 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -405,6 +405,7 @@ config XLNX_VERSAL
>      select OR_IRQ
>      select XLNX_BBRAM
>      select XLNX_EFUSE_VERSAL
> +    select XLNX_USB_SUBSYS
>
>  config NPCM7XX
>      bool

Shouldn't we also remove the now-useless
"default y if XNLX_VERSAL" line from the XLNX_USB_SUBSYS
stanza ?

thanks
-- PMM
