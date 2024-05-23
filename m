Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1021456ejb;
        Thu, 23 May 2024 05:23:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSUtxp/WwjQY3Ux98/DpfdtmOQph6Twfnj0k+zjsz0aXJyU8eBVfx5eVRTf7682fucN+5Id0mzz8MK6xAD9rK28/UBvdZO
X-Google-Smtp-Source: AGHT+IHyAn0qF3HyiPfQMVENRQeG8ijx2JO/BnQFQpzphNCT8x4NgO31A+pdVGhgHYJIJbXEj2Vt
X-Received: by 2002:a81:89c6:0:b0:61a:fc3b:fdd3 with SMTP id 00721157ae682-627e48b1f91mr47800467b3.43.1716467003163;
        Thu, 23 May 2024 05:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716467003; cv=none;
        d=google.com; s=arc-20160816;
        b=gFWp8QjX2tMAHxOLxCOdHH9vXYKPb55IgxOVD0BT9uJLJ1mIx8kSI3c1XIf5n7By2d
         9fYC3/A4pIW+LdP2vY2kPw+udLzZ4ZklGgq43XVQZxbSKe3U2y1WcBrcF0vRJmEHWU9j
         n2TcyrSzLUuZJrvTxfiJ1O3tDcjj++9qCLGlT68IvqshvLtZZ6O+St3jVQkFCA/IKIdp
         qzYTHsGx7ZpB+3mnoufVMxtnHGiBjTxuRkxISybA6Pwu/bwoMxuO9h6pFSwuRDDLuU9j
         20ow6JFVdSsKypjK20yaoyfOihyxOAs6zVkv+dnES6gLHuwqXQhvhMlnpcQIsw9wOIBA
         PIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DyVhdIbQLAcGTVeFpbhFp2SdJOB8dGJIsYLEV94Ho1w=;
        fh=zpPxjef3WShDnoGRZp1E7XUiTKCYLLWJC6WOmMC7qP4=;
        b=llZkkVmxUw9+QRGLQFbpbsyjfc/1X2qVGP9neSQH7nGE3FRM5jHFX5omSlvw24W2zK
         HCyYzJze9Js5RhvpU2pn6+oRDTtTqMdLhg6FzVKXlb4/NCXbMZN1v7CWsehm+u6wl/7A
         3GV/SR802ye4DDejlQqKEZm0tDb9ESSSmevGMl3isfUKzqhsxOxHiwZB9V6KMSM9MQVS
         yT75tnpz5Qz4ccydIKKyUaiHOGaiawc7btZCH72cM8fuoi+vTy7KMM9OQX05L+dblT0/
         z2y4YX+mGf4Ozx4Sm1UXsSLA5yzJC3V8Vqwd6nNJLRa5WIXdoAnR+YrGNq8IscGlNysj
         rT7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fR/HJpXL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-48a30bcac91si110847137.448.2024.05.23.05.23.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 05:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fR/HJpXL";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA7TH-00077c-MY; Thu, 23 May 2024 08:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA7TF-00076o-IG
 for qemu-arm@nongnu.org; Thu, 23 May 2024 08:22:57 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA7TD-0006Lg-Mj
 for qemu-arm@nongnu.org; Thu, 23 May 2024 08:22:57 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5755fafa5a7so6683040a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 05:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716466974; x=1717071774; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DyVhdIbQLAcGTVeFpbhFp2SdJOB8dGJIsYLEV94Ho1w=;
 b=fR/HJpXL4AAD1qwRkDjprFPSHj3UD2VPzo8DPSkY48wvKM75Bau14JLmqCp2HhmNxz
 lIW7eJmmlrUorGAkwc080qMT2OjD8SpXMN7FkYLaywh8p3ppNyM+QXZsbwp890mdRgT8
 3rWfOppp1CsxuhXnmLT57gT8GM1r7xPF5uZZhvbAt+rcX9vJWvqZYftNKEIqRpHyw3Sj
 5Cxnw1X/Etp5hx688YyPKsWguT7opRxj6/cyGoJu8mZmPNyvxDjnC5hXZxS4OJbcJDHu
 7DSwBPq8ok0Gnc36H4Os8riep7Sbx2RObHR105qPW7RSZnWYYDQwXpoj9k3/tTWaAwAw
 NlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716466974; x=1717071774;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DyVhdIbQLAcGTVeFpbhFp2SdJOB8dGJIsYLEV94Ho1w=;
 b=etnXXi9N9Rr9MkxoOdt/W8PO8vl/fTWx83ZWccuiOQCfcaYnBZ7nEKZdakBgZW0BlG
 Mo7thCpFskGy9gSuj68vqJlaSuon9N6KihJsE5dbAYRGifxtXOIJ+RZoPHuHGiY6Cudo
 gvXCFjsIhreZmkRiEoGfgSzDTREeZ9Qs/stnC1+RUFe6M/LxHLA2+SP7FI4t8lfgxl+f
 /AQy5EW2AGjHvlJxEGsUbD142TcBz0SZd/C7aXXQU7ZmiCUebfoXiJ6Dy2CiGBHWp3Ai
 bwOybrg3XfEi9LzgRyppMo+Q83vYLAvFvlU81YxhSnTiA6wxen9l0AC6ILZNDzLoYcse
 gfUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbE0aFTysbDFx2KFlu/GooyHWdTXVsNdP8NwBzmaz/+KZixNy7L+FVKActg7W9NpXEQR1mfW1cNUyZrb0K7frfNKzF
X-Gm-Message-State: AOJu0Yy5RXnthzWgAILc8zT1WQMWjCRtfPENtFq5BphgnAN5pUzdmFfj
 2aDuyvfN7zTFS0msSe48xwKGp+iHNAKA8nuIbVnQdpe2Uf53fS2p9AzyBHYfmu95jGOMRJbevUS
 tac5Q3HDXJ1TplNf2A5RKTITsZHQtJOr7H/2LWw==
X-Received: by 2002:a50:9b08:0:b0:573:5c1c:4f5e with SMTP id
 4fb4d7f45d1cf-57832854af3mr3229702a12.0.1716466973755; Thu, 23 May 2024
 05:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-22-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 13:22:42 +0100
Message-ID: <CAFEAcA9UMnt61ZW_AjoLD4UYB-vUusbOGaB_E0toH38_5Ojgfg@mail.gmail.com>
Subject: Re: [PATCH 21/57] target/arm: Convert FADDP to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cw0wXi3SV/Qv

On Mon, 6 May 2024 at 02:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This fixes a bug in which scalar half-precision did not
> diagnose sz == 1 as UNDEFINED.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |  4 ++
>  target/arm/tcg/a64.decode      | 12 +++++
>  target/arm/tcg/translate-a64.c | 87 ++++++++++++++++++++++++++--------
>  target/arm/tcg/vec_helper.c    | 23 +++++++++
>  4 files changed, 105 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
