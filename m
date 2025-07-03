Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp491336dyc;
        Thu, 3 Jul 2025 05:13:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsmK5HEuArvwuSx/yCQaxIMOUSWxEASgLOkE3AFBfs3FU4sPo+FdV6oiFWvX+tML3/uRfUCV7erAkgiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEZRVJyCZzYkQkSYu5XorugnGho5K82SKQoWCiHl2tFXOGRD6JKsJ0RjCFRDguUz99YAFIU
X-Received: by 2002:a05:6122:3c89:b0:52a:9178:d281 with SMTP id 71dfb90a1353d-53466733bdfmr2434547e0c.2.1751544809132;
        Thu, 03 Jul 2025 05:13:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751544809; cv=none;
        d=google.com; s=arc-20240605;
        b=iFHd7L5htOXugkaDf/v4JoGe+XudJIWp7O/nBjpqT6Z4vn0YYRScDeFirNfx5hgAzC
         T+LI6litIItCnrXnmQdsA68/ac5ocP/vJGatlkNTXaEkARO7vFeVzLj+9oGGxsU614Qk
         QKnvIh4RYeGZvSyGKFqurf8MEiBXJ21p5EcZiYieovg2PEWE7kLxHY7eFj/frs3HwZem
         QkFyK1dAMV9CaPmWbPy4VaQ/jsiF2bJKA1QSHAnWSUA2uY+eUyN9q4Y/GzvLBgU+sR93
         2BwXoDC6Fd8OEJHeolGdmtrCvj+B/Ipnv13sDEm7dbFkzPrDvL8kkRg6jPFk7upmZxpc
         d+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9+ZA32YvUuWwIi13W2XKODXe1yTxf/SCxzSz4JFmEmQ=;
        fh=pj1/YrxPV4bXwK+RolLHQ4TI4ERynPFVt9gnhUA2Wmg=;
        b=YTqC+w+KrIbuQIu3IHBfK/CH/PE/G8ZUO0flYhfK7IIt3cKdpQLaX++T/944lWG/+K
         JvtEdJaHeXeOgrVuPl2Ma44qwN262okC1KgZbXqHphXCV58KookOb2K9cAwGedKITKLi
         GvZcyg+PGUC1B5ane3tSaOUqq743o6zV9au9bH3JfaU+jkoI0dPX71vt8/GYrN567NGF
         AX1uYPm5lSGDVOWU1FifqbOJX/Ql6sxZb5ttYnGOCXkjcz9SZO6jbgAO8xJfrTR2f5w8
         PoQBRh4zPnvKnemOS7kkP/2LLc2E0a8wDKhI286V/l8XKe4w94jgjRNl8CMiuQFCUSNk
         67lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJxQ5tXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ee4cb93859si3471968137.446.2025.07.03.05.13.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:13:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qJxQ5tXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXIoW-00011W-0G; Thu, 03 Jul 2025 08:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIoT-0000ry-Kk
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:13:13 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXIoR-0007XB-Hr
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:13:13 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-70a57a8ffc3so82299897b3.0
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751544789; x=1752149589; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9+ZA32YvUuWwIi13W2XKODXe1yTxf/SCxzSz4JFmEmQ=;
 b=qJxQ5tXBFg5rDj3EBTK7XsEIx+VLVCaYK4CN/4NV0OlwBBb31VQerqO6X84OyZmnlg
 KOBViZ2sYDxu0IRIRSgVUGrg5yUQbQ2NereX5LwEu7KcChzpB1ZNCw3vl6YwCMrxIn5X
 ModVTFE9LNE08cII759cfotCEmczG+WUUHHWYXSsFnEwfOSTWPZmvUbR/Jp/URCWuc8l
 /mq/Oo4tcTac3YSw5Q2gMD7qEdvwG6XQKnq5GeIGqbA1QlE/k03nv3JqUeiEDYNfZ8wg
 S9rPV+v/mL9PcwLozEPbav2pGlRhANd9dRil5mgETNEerO1sAwcmcGGAz5UX9djSV5fs
 gBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751544789; x=1752149589;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9+ZA32YvUuWwIi13W2XKODXe1yTxf/SCxzSz4JFmEmQ=;
 b=crI62NvriuL5OoHaIixj39K/kyUFbIi2nkbvsEMvH55ilo+KWiuS+FIfR7at0e2qhH
 Uy1Abufr/lVIOy7AKKz9qTwNaFbsNTeUMw3lPKojd/qgzYy+4d61MrTivCfVeWev/N3X
 xLiXpEx1Q49OCNSO21+zIQZEscLANtu1edbP9nfnSwyPhbFm0Ul9urMNAwpJE4KEyRwj
 Fq468K7fcy7iOmUJhFufOEyiBNxkGCbw6FE6MwmXTQasBb+8gMNVmFDZlPSMkv2gQpwf
 s8u+w3sXIsy9ORdXaqdofxXMQlHvbFD950UoCeQ2StcOz/5e+woytg+hBUcs6sm2FdOX
 h5Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXs3gG9irKN7qy87EAAxmjmTagN8xjNfw5W8QfYKH/gFNz+joku2UZODlyWZBjW9oJzZADbCjQBCw==@nongnu.org
X-Gm-Message-State: AOJu0YzsM7dng79PNlKvv33RBzYse1ytKiLrMWRXm4mg8JmtOW7cnHzJ
 3J0Yh7L2JeXwCGCQwQWXuWdTVhylPMc19PR6ZX7n8OytBZdIabjAi0oxORTuPe66dQatiK9peLX
 mk8rl4GdNZqmyGtGyg8lWakKjSploUEG8osXI1AOhUA==
X-Gm-Gg: ASbGncs4FH3uhUAiNw2YK4Z7i+MWb2xiP9Nni1YF32GiHoo7yhqu0822+J8f5GS2wYA
 y82KcwoS6tFMkMK4oATFLM3VmSHoq97EwgZ+qMeAinMuR+k2sJsuXdPaUx6Ieqe7wJIxiob2Wbl
 q9B27noUtVxateoD22tx8gVcWwR+m0XQYyqZDhqAoeryIp
X-Received: by 2002:a05:690c:6809:b0:70c:a854:8384 with SMTP id
 00721157ae682-71658fe391dmr53998387b3.11.1751544788910; Thu, 03 Jul 2025
 05:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-69-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-69-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:12:57 +0100
X-Gm-Features: Ac12FXxzUk62Lfx5-g9TEmHNU_YY-vv0fvdy3xZcTPK14jVOIIHzs0IfB4S_KZo
Message-ID: <CAFEAcA9LRz0FhXsZJsbfwevVbp=YtQqJWf_5EBV-Wd2OiquDZw@mail.gmail.com>
Subject: Re: [PATCH v3 68/97] target/arm: Implement SVE2p1 WHILE (predicate as
 counter)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4NuTksYcZSsz

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-sve.h    |  3 ++
>  target/arm/tcg/sve_helper.c    | 51 ++++++++++++++++++++++++++++++++++
>  target/arm/tcg/translate-sve.c | 22 +++++++++++----
>  target/arm/tcg/sve.decode      | 11 ++++++++
>  4 files changed, 82 insertions(+), 5 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
