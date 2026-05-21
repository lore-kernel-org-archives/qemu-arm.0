Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F107CD5BAC
	for <qemu-arm@archiver.kernel.org>; Thu, 21 May 2026 13:57:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQ3tB-0007Ue-Q9; Thu, 21 May 2026 09:56:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3t8-00078d-DO
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:56:39 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wQ3t6-0000lc-7n
 for qemu-arm@nongnu.org; Thu, 21 May 2026 09:56:37 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-65c37eafcbeso6578463d50.1
 for <qemu-arm@nongnu.org>; Thu, 21 May 2026 06:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779371795; cv=none;
 d=google.com; s=arc-20240605;
 b=HUkVhtSSgJB5V87w3EhDQwy05AE5CuIofwCLF9H1xZi/mk5hRXhbEjncnArtc1KmhM
 X0uJAHB7jzb41QquZ9gpE9KA5DCxaX69IAt2t2fBX/GZAt/yRwx1FbM3hGG6mfE/w2Lt
 C49EYGcQbHpugkYsOa3hmhy2nYOrdiqW8Ol/yk2zwUS1Z3V4ZWNC6WEQdS/jFsxru+3M
 IdZ+2EgWI6oeKTbgqMcI9eRi8uCJ4ReWFB7emQ51ivu/FQT3IhGU4hk5XIhCQ414ppmw
 QMZQzojdEGwyZPq/iim729vYUBU8Prf1jOcDLc695EAFIQaXkpS171FMetBQN+8WX/CG
 +3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=j1afOWLioth1c/QT3cgJWLgos5ClUpYjBi60y6SrEzw=;
 fh=dVO/Y8Pyymvgtaq8kl9l5GdZkvInhemQbBFFocE3StI=;
 b=gpbDgpgBaz+izWqf/TTduusq1rt76KRoi/DO7or1egFeF5dv/Tz+h3GnnU9VA3pVXz
 SFy5f6Qx/nv8w7B6IKlrSrMH4h1QTs1PeGbUmjaRMyKMlg3U9xzo6eba3ouQqSthqLCX
 L6cjGAZoZ5o7JJpjRe+lXS5CNYWfqzdBfDZNECCpHNe8FerpN4NEYrvvWiZ9WlvO6gS7
 vBQrPkOiiVI97bLe5g3YJcPZme+U6EZ/niqBTzvoi3AbZhJ+iWUmqCMqvZuFulDp4hWy
 Bua+wq+n0RHz6NwAT/yL7kaqjpyF2v1xvzCucSZLgKVjIsR/6ZlKYJjeU84C61EzS/Zp
 anRQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779371795; x=1779976595; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j1afOWLioth1c/QT3cgJWLgos5ClUpYjBi60y6SrEzw=;
 b=DBRu28sA0KinOq+IAnMiA9RlaidpSbT6U/XrcEU7N6x8aMczZA1jTCGF0dQqigsCU4
 5etWWjxJXxz0fZR1xYWqV3rSRO9QGC66D4ll+bJ5haWeN5YODWSA9chTDk4WVKicDK7B
 O4OIElW6Arn7tYal1smGh7uiAtvhDDK8UfQoW+12aZqA4spjSDW6TlLifitDZxgCFXcU
 oCAFAJk0/DSVi10fKI1eDzFhLhj88cpxRvVHfqYaGZ4/BWRo0ugUZpQVVkOBo2urI+Fh
 xXTqqQzmFl+PyB1ZHJijP3DwIfLE3C2vhRAU5dAQrpWcZx7a9L5ohe3MF/XA/Q7ZcCK+
 LNKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779371795; x=1779976595;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=j1afOWLioth1c/QT3cgJWLgos5ClUpYjBi60y6SrEzw=;
 b=UkbEY48IwjnTlMmVvjqcxhmzBu4+uqGW1axRffmfSQrQNfiLf/E+WMVt1BhgK+Qat/
 DsAsTB/DkIS8/2waSzmxu4CizkrEFvIN5ISxEOQD7XdFrLEKLB3rwvXmLMr3KT4pJoDf
 DdLqWqfY1x6odfh+Ek2AnoGvuQY9fXHjSW0u6D3vPO8Ej9fJuLtjiYBM1/6vsKHswlCV
 R5XCisdhiSXuvG/wufJgc/An6+oJLS+/MPAzL/fZfluyDERPOeYkL1OLVjDVMPWUGp62
 8sYPKTRgvbSTvpdHhg9LnnQO261GDckTM+RkmOjG36PeBOtPX2ZDwnXzQT5MQVI9BsdG
 +AMw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+tnzzKuh8gLMSz3Z7v5gEblhTEgFMou0Vm0kQE+Io8CBsDlBR//yUQS2mwTfIOkU/n6cgep68+tw==@nongnu.org
X-Gm-Message-State: AOJu0YyezeaowwIpOskOJ99Z/IDAC9+Gw2xdHulDLrX0PYpoHGnjFbKo
 rGhZJgFT3p3dZFcaqWwsVgAG18tOUn/Kg31h8wt+xdOHKH0ZzXLwRd8cukjaYmuxD0K6oyc4VO1
 iNtET886BI4/Ljir+jvDBjhWyGZnGiwbi/Xa83CJwGg==
X-Gm-Gg: Acq92OHcG74dhaGZpkt8b8YnFC2Ko5vxV9qa5dnon0Da1DgD77YIrAdaNg91uK4GZ28
 KpsU0awMbHhcElcl2w6Pt8twh0LXIP4IItecX/9LKXqAnMAjPT7ROFeVCYA6uTIyIHjEsrYfknu
 ToXoCF9ywqmPUnbdEqLyK9Wj88nSWkF8g1LJMEdVf+2IFh4tQ75wganrXUQhMoBPxlS7Hi+AeLA
 ExStsIZ3WvlEMfVksMkrPWYa3+HwVvhCCbIUVusNCwnRRvHVyGEtWpMbWTDAJfyob6Dz2Mk0njU
 WHcPl9wTkVofcbvDXXDJPQtR6+SXluyaWfBr9VfNj+wbyi0pey99f5jTRDMci1vd2VWWgvXyuYJ
 KBA==
X-Received: by 2002:a05:690e:251a:20b0:651:b8fc:5490 with SMTP id
 956f58d0204a3-65eae2850bemr1941355d50.38.1779371794908; Thu, 21 May 2026
 06:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260520182213.872945-1-richard.henderson@linaro.org>
 <20260520182213.872945-5-richard.henderson@linaro.org>
In-Reply-To: <20260520182213.872945-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2026 14:56:22 +0100
X-Gm-Features: AVHnY4J-YggElKj0VncB-UaBbh9Qwepu0hoF2CVao4P4i6Aq4H0AZ_beTWWU-Wg
Message-ID: <CAFEAcA_uZsqTZn7uGrkL=o86_kzjO7MXsieYdCsEqALs9ZSQRg@mail.gmail.com>
Subject: Re: [PATCH v6 04/64] target/arm: Implement FEAT_FAMINMAX for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Wed, 20 May 2026 at 19:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sv=
e.c
> index aa7d72a35e..db32230595 100644
> --- a/target/arm/tcg/translate-sve.c
> +++ b/target/arm/tcg/translate-sve.c
> @@ -4253,6 +4253,8 @@ DO_ZPZZ_AH_FP(FABD, aa64_sme_or_sve, sve_fabd, sve_=
ah_fabd)
>  DO_ZPZZ_FP(FSCALE, aa64_sme_or_sve, sve_fscalbn)
>  DO_ZPZZ_FP(FDIV, aa64_sme_or_sve, sve_fdiv)
>  DO_ZPZZ_FP(FMULX, aa64_sme_or_sve, sve_fmulx)
> +DO_ZPZZ_FP(FAMAX, aa64_sme2_or_sve2_faminmax, sve2_famax)
> +DO_ZPZZ_FP(FAMIN, aa64_sme2_or_sve2_faminmax, sve2_famin)

Does this get the "OK in streaming-SVE mode only if SME2" check
 if IsFeatureImplemented(FEAT_SME2) then CheckSVEEnabled()=CD=BE else
CheckNonStreamingSVEEnabled()=CD=BE end=CD=BE
right? I have lost track of how we do the streaming checks...


thanks
-- PMM

