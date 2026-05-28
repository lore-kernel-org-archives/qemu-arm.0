Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6EECD4F54
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 13:48:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSb5J-0008Hy-Dc; Thu, 28 May 2026 09:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSb5G-0008HV-DP
 for qemu-arm@nongnu.org; Thu, 28 May 2026 09:47:39 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSb5E-0002bg-J7
 for qemu-arm@nongnu.org; Thu, 28 May 2026 09:47:38 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-6563f83ae9fso12404567d50.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 06:47:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779976055; cv=none;
 d=google.com; s=arc-20240605;
 b=B5ZP824cKDBf/GV46ZpeX3P3SIEF5yO5YEesM3qQoKa4zFLkT6pU5KwN1mE3DYQtr1
 jjKl4QWm0/FUktXpb/RoWB9rAGfLAyQeO70GsCz/k27T55XWRvnTW7Kptt18T9boNfzg
 qYBrripLdp77fAcfquv862uvc2NEBi5MMiu++nBNOnVIXz521F43b+8SugrBLP4XKNKq
 XqzLavw403cUsizRIhadZsHbCBrdjE4182c+l9SStqxb42p6yqlAGWnnJbi8bCnzB/IR
 18kCKnCPCs9qssZ7tesfR3R4fYKb9tPMuUbjKcq1qfSxfVQ+oZdbOyMbvXmzW7XcpUbL
 QmIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wHL/sTz8VjARXw0cyfzzQUdONA9BFPkB/Za+alI3VaE=;
 fh=aVNJZOAgPQaiu6GkMO2PXVoAxrtg9/7tHSGsIIJSPLA=;
 b=IeOL+GkF56BdVNpKLAohnjczpOOlUoLBDBP7iQ81WkFIfSJ8MyNKR/+hf489H306c7
 jwRasGRpJwor1bIwzZNOMc9Q5pDzdXIAOKL4x32sU7dItE5P0St/dDBQ1JR8VNDyxUTe
 sKz5nrUI8gTh63cFut0p7rLMKFpXw+vYJy9RNsd8sxJpmlJJKXxTUajJxnH2BCJCLRiG
 Eyc6DxX9L4MyX1hvuWGKMl2MEzhrW891X6996QBGnntj3VF09VbB6FiMD7h3+2gGSEb9
 Ceev/dJaTeXBJ0nCLrqc9eCzjuyscHripok7eCsvDGaKA0GmZtkj99ULH9T+fgRJGztp
 VVUQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779976055; x=1780580855; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wHL/sTz8VjARXw0cyfzzQUdONA9BFPkB/Za+alI3VaE=;
 b=xXwt4gTOHtUnb3uYaERbM6fE8rTtSXF9t/bLeQuNU+IcT8M7FpMoSIzis7AY0UbpA4
 5ytx8ukU+gK837yMa30gim9x5C4SCAu0y/1UUBbDFVYUUX4Lz20ouhGIsqU6G7rslP16
 taRejrsHRNvSEYnJ/kjOCLpAwqsiU321fDZRSAj02X0xo4ada3breXVADFlKl0pM8x6W
 Kk1mKAyjtg3R4L6DZxGq3tawAiua6dObykwRzLRNUeo7qM4iLPdxpAIoGjKVYBVJdxV6
 1/5Vl3vD1QOt57VmTeL9hTDKnb36BArlZ6w8InRF0cL3I0eJyacioybDqqOBCjD/Z6st
 Dj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779976055; x=1780580855;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHL/sTz8VjARXw0cyfzzQUdONA9BFPkB/Za+alI3VaE=;
 b=NAfYO7KIYc3jFNZfrN7m51Yq/XhMNiZFONx6qiYVgScMEzPf4O0N+4xdhzGBxs+gXb
 6oFnWmw7mGfYhalFI+zOVKjA6oC4aD9KxR4ZBNIxpvzEDlnFB/cOz7XfdNm0Z2NAMISY
 aTOmXOc+vRrbkK3UXVo1mlr2qX9TxGavM7QktBg8Xw0uQyW0+GU8r3Pod/PF+/B0KRH0
 VMQgbRv/LuOncSkol0WrHPjIbDKkHDeiZXcOLw7ZMOVX8O0vjrzfGYwEmgvSHgi16rqI
 4bsuAHwIPhScfs1St5GpJKcsniQRAQ2gmeX25JhmSCx/Oou57f77a3vm8m9fduD6dQJs
 2jvg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/y+ebTcJ7e8MRKVta7vgA05h7c31sL/tMI3dYQu8xGN19155c6fPQA6v37FvB0XYee89Ji2pxhew==@nongnu.org
X-Gm-Message-State: AOJu0YzQoNbAPWNe8RkYZlTnfFeDuHDbpt1J/q9iiDpmLKrz32Ig883v
 ym8NXk0QL4TAU7lCzC7mhS7QKofBBWeQ9Xj+d/f/N+2saGnFf/38BWlJWBIaPLJM/nGkgfoDf8k
 3oWM60fgNXMHlQXGjEYwnAWPuCV+NzOBrJ6Ji7Zh60g==
X-Gm-Gg: Acq92OGE5c2SBrHQGx+YHM/Rng0c2WpTs+6cSsB5clN0ZQw/bgqQV3KbZgHwyJw15/T
 LT5qrU1+KY0X3hpGlEK2CD+CcnPxNp7NjPOlxKIkUauNv6W/3iLw8r0jfav46Mbx0/MoJ56eeX+
 bUqPiKowS3UYecVyiKlMvCDaZGvA3LmkIPajUBLFH9L5TdkE1p66D9m1/X4uhT8OqSxNFYeKueH
 Q36gsRqs004WXeklBNwLpURuMUqrJ2njqTK1aA0qRITquAqCfEAasU2roV5hRYnztvVdPG2a6th
 WUNRjExGTG5eNk5+eX02yKgLyk4FwLfQ3kEdipumI0aEf7Z1REE9pNm8Gn/uQXrlno/VmMTLHEu
 aTw==
X-Received: by 2002:a05:690e:43d7:b0:64a:e781:891f with SMTP id
 956f58d0204a3-65ec98199dbmr20409595d50.28.1779976055229; Thu, 28 May 2026
 06:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260518174750.660258-1-richard.henderson@linaro.org>
 <20260518174750.660258-2-richard.henderson@linaro.org>
In-Reply-To: <20260518174750.660258-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 14:47:23 +0100
X-Gm-Features: AVHnY4LUmfX7XMF6RiR96MH6PrnDF7cuZSqZTphCHlio16m-doyrBYgWd3ZTmAU
Message-ID: <CAFEAcA_No0Rm=egSsCADG9ujfz7ZG4+dzhkx9bjiB8JTLt7JpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] target/arm: Add feature predicate for FEAT_CMPBR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Mon, 18 May 2026 at 18:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-features.h | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 4e44245a8b..217ab29bb4 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -1043,6 +1043,11 @@ static inline bool isar_feature_aa64_cssc(const ARMISARegisters *id)
>      return FIELD_EX64_IDREG(id, ID_AA64ISAR2, CSSC) != 0;
>  }
>
> +static inline bool isar_feature_aa64_cmpbr(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, CSSC) >= 2;
> +}
> +

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

