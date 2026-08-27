Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2D1C61DC2
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 13:24:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wza5W-0005zg-2i; Thu, 27 Aug 2026 09:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wza5U-0005zI-SL
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:24:12 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wza5T-0008DR-9T
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:24:12 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8588583a7c3so22884447b3.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 06:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787837050; cv=none;
 d=google.com; s=arc-20260327;
 b=hYUPNnN1OYUzjj5bxSF+X8k5wUWec1Jf2z1HEi9e+qJH8W57IGQZNlzn+RAYJi26O7
 VdYydqwhdHyU/2np/JTe7lUeG74uxuS0gpltUcnkPQz+JmRD4MmNrmeH+ZZ/OTBVOCQ7
 FSbI0+CE9P0YvHt+qWt/S9XhtLC5X8om3DgFoRuR5jbnOe/G6vH16qO2Z/o8wWE6K9Tl
 kBQBG08mwiSXfBuLsZ6h1i724R/sZ8LhDQaYsVcqxf8IFBwmLiz3459w/SrsfZFUoAP1
 kILLJhA2fOrFYJCXu9KO/yi4o5uxcZq3uo8xjwJYwXe+Z3nUTF5rGmU2vfOOySFliESg
 grBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=XAaYA7j7G13b2Fv6XG2065GHaY0UFn21jSBTzq0d7xI=;
 fh=osMadRX3M6/134IMO6KFP41IjW/bfrfgZUGAW8xHaCU=;
 b=WBwh9hD9Hd9O5mSn/KOTXcWnz8g6pHvBTscG51ZnHgqULA7ExqoOBRwjNkgCzPW4gT
 5qIji6BLXdOpdR4IObAFv0qZFzEr3hJEoKbJuck3lH+85eXda7FwGzDksf2T1WqsIXOi
 tgzC1D76OvD5Lnu5mtdw1HwYgWvB9IzrLnp6C34Kqr7pxyLLOQI/tC1Uu+T8Ecj+R9Iw
 6DTc5WPwQFbGl8nAipTQBSicgU5QPZeUOnP/RAPDpKdxJ8FUsT+tx6tCC1Ey6DGmNQF4
 nkuqQd8FTdQ5BfHYrpGigsU831OIm+xLHCMXeBbkrfDDes9qhT6RgR+PMKg/tJ+iih3N
 Iwsw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787837050; x=1788441850; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=XAaYA7j7G13b2Fv6XG2065GHaY0UFn21jSBTzq0d7xI=;
 b=iCzVt+z92POn+PqXEUMPpK237dxmwwaV4spamS8SZBYkBAwMekeLI2Ak55rcnLIAfq
 4vgTYD45cLOTuL+lHnpQtapLpbL1NwSMwwWSE0aeA0kY6ou0ENmS6l/fLR47jXnUaiLI
 qW2Dy9CIq88yD0llJv0XIPq8gyIQGxZ/Mhyrgoj+73nlNEoiyFxR03z+JLkW+XMaj70T
 8zLSmbHv4OVM7tokjfMeS+9xWJfNSmNSZsgcU4BSyzk0vryAJIlhR2tnc2uVW1k92pIv
 gqSTqzSrFZ/9TfvzbzE9dB8W0FOmud7w5PUpSkIvW0Ca/8v6K8bYGveY/ThiREVAUncT
 q5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787837050; x=1788441850;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=XAaYA7j7G13b2Fv6XG2065GHaY0UFn21jSBTzq0d7xI=;
 b=T8QQYTU2FzAXrk8ktLxz5p2oTpsqQNPi6Y2j7mjGNZFavOR7ntD4JiBx+ovgNe0lrv
 AMHcsPpHZ3e/3DIMNgZYbNy8QK4LnaZcn4zRtPalkJpdYFl7HH16pjoekizRKzKas9s1
 b/C/A9rc45VyFAyzRPRRus3mXYcpKtERoWnJVoRaYveQ9elNvUuxAbV2TyjMT2SO+bbu
 UzGIDa019zU8lXecdYeFyrv/l01xF5CJhdZR44r1cxjlSnVtJT0NXLeeBaeQD8AAa/vI
 ZIK+yR5mktBuauI2W91cjrBPXoAjQZGOehtdsFGw9bhf/9MzconEqv9vDclRn1pNJPi8
 +VeQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqKwZ6b46alruhKPKeKvKsPE/RwkUPnqkxf17EVRZmU677RsDOsA8R2f8k03lahFC8gpxiExqcVoA==@nongnu.org
X-Gm-Message-State: AFuF++kZJGsAbRKRxnpQfyhhg3Iv9MIte5mnK61Eq1UoHuij1UMayfw2
 iEtf+vSMEVIWt+Nz/yGz2TIAxTU+HUTX9icLgouBtL7w6TATNzu/nfTJwcswvpcbT56JPp+2AAr
 QJSCMeMYW/w43UjLHQVAHxWpsdmwi/sfaLuJxRjJniw==
X-Gm-Gg: AR+sD10uviGbn/DUlXpGM78DdPC0tIU5SfbeKda9xJxmpypkp1b7gEuE+2JnYtDMCjz
 L8dVciHHe180/LJlk/HyKIyATqGfhjfrREoQbAGCkTJ5nJSStyBoZ3Ht8+WZXXQbGkceyKpNeB1
 MtyFXjTcK+4YvYig6DMMoWISQRDVf6ohCZviElDQJhoNSZIWLiAxNOhsH5oRGZ/tDinExIZDp2J
 yIULgl5dXlGTjf3Nnk1o+XUEp0TryMOVSiL+KruHvGKEmTkgXZ6Yk2L3j1LJB8tZkDqfuNpNAgW
 BGIPw0DDqRDRdNsDi1FhW41hb1Kkqcc8swYTu5GO57LxGAWhAyQQaTOFK8n7s4mm7dzdANtla7V
 YXHHSdrp7HOrPkk7DWNIee3Ivwf78
X-Received: by 2002:a05:690c:c6c9:b0:854:d9d0:467b with SMTP id
 00721157ae682-85741730018mr51971107b3.22.1787837049805; Thu, 27 Aug 2026
 06:24:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260818002629.172827-1-simonxhy0404@gmail.com>
 <20260818002629.172827-9-simonxhy0404@gmail.com>
In-Reply-To: <20260818002629.172827-9-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 14:23:57 +0100
X-Gm-Features: AcwNN1WYLQyXlxZfBdbBKM20gekZ9gpu6iuWXcmbFulO_pfBB29ZADNazkrdePU
Message-ID: <CAFEAcA-cT1dFhURcxB-qE80LL8apGfydrMM+pwWgbLgJWe4rWA@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] hw/misc/mps2-fpgaio.c: add GPIOALT2 register
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>, Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Tue, 18 Aug 2026 at 01:26, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Add GPIOALT2 register for new an555 board.
> Implement register access as RW with LOG_UNIMP for writes.
> Add "has-gpioalt2" property to make each board configurable.
> Add gpioalt2 vmstate subsection for device state migration.
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> Message-Id: <20260805153005.9989-10-simonxhy0404@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

