Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp660331njc;
        Tue, 25 Jun 2024 05:38:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU/Mg6sBOQ3ITbQwVy2bDW1P/DCTuYBRxLw/Bmw8i8bKEvpLCM/pGGEQ0HtMdOjvu31eZy1MVdQq4GMzSirtpRwmqUKwLSQ
X-Google-Smtp-Source: AGHT+IGb4mwsSh84gdiJrCuKSvVGvUbtThvyoiSyFXHw4oo8wY+PR5kywzCIVk40e2iHXVA+/Vkr
X-Received: by 2002:a81:7241:0:b0:618:1034:f4ef with SMTP id 00721157ae682-643aab82db0mr63025087b3.16.1719319118192;
        Tue, 25 Jun 2024 05:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719319118; cv=none;
        d=google.com; s=arc-20160816;
        b=fDEuGEHdoAAS1h8v2SgUOz9d69d04nkZ8S2z/0A53ZBwXI5ijpy/HYw1hOTYUPewOD
         5DseScA8RayWjhlOzkBRlNIoiBzo7dt9Txw7wpaqs29rC4OpNFaHcCRNDQRuS/jkRRsh
         MZbyQpGd9h1tdIGVuwPC8F7wBb517t2SmCAgXNOE/08CrdpaTYQ8NUMJ50g1m8pi4R+/
         mjTbBjPQQXwqFdzA8qk15hbwcbwmTdqPFC9k5IdFaFgqB4Z7eNIZvyPu/p6UYryxI5dg
         ErnE1KFKWR/DFWWG2scLd5IYeqi80R8dnUVWpzDhLodt0cYe7VVeANZYr/vkLNKf03Vr
         vkWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kcWgWYD2GIFGfKoXbG09siq4L1d5KHolHjJ73IqMLZU=;
        fh=ByZxeB80lqKROSiuZVSOpiV6IfUeUf/HFAeOoN0YJkQ=;
        b=n6TE+ZPMTAy8wKeWSl1p+5cr04lz08dXHjZJUN7niEGvwTVoyT/JaCdedMBdjEizfY
         pKoKcflP7qPGn95VxFVv9uW2U71w4ItsSbYvFQc3vKNYa56rW7OHbyUQoX7Zlih3Y7zJ
         +4u6ZfP9+bOKF0sh1kMyxNWBPC70TWtk7g4EeSlC1WpMidM3Lr2j7yltG+GOOgFEXAyH
         h0okSCkmnv6ItvyhFmpEK27bC9MsExy1NEnkG0RHTOo5g22yCtgP2NA/S7/Q8HbXCbU8
         fTZPvyYZQ8GlMe3c5NVRUDhv/NLEBY1qHHDCVT5hdl2NbCyZsgsNbtFwdgWk0bufeoh2
         1CNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uzqXPaqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef66fb1si103851386d6.610.2024.06.25.05.38.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 05:38:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uzqXPaqI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM5RQ-0002rg-LM; Tue, 25 Jun 2024 08:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5RN-0002r7-Ub
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:38:31 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sM5RM-0001sP-GB
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 08:38:29 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57d06101d76so5857160a12.3
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719319107; x=1719923907; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kcWgWYD2GIFGfKoXbG09siq4L1d5KHolHjJ73IqMLZU=;
 b=uzqXPaqIIyeqrEpxaccT+kY5jENych2mO3709CoXIejg03a3bPGNnnTEmwxjcTl8x0
 +jw+aEBBrWxyjemCsPb8AsvAR+GPFl2gyUJ1R52fdBeXpwt7tOQ1mAywxnsHQwf0a+Tn
 obd7k2zLVrsIA5jUoIvZ3OzMGB8/vD5ObbCQOU1BrY98jLfe77UDjO7CN7cYkB/0XGWg
 fYKFB9OY1hrQevsW+SVYxOmMSKBRPxw4ZoinOHhHVRMUUTq6dXO0T8MEL8G0ANXM3YEJ
 xCJFALBSgOzKlthmU3RmQLOp8e1OvzWumxqBRu0gJGY45sI/R41r3TFP0hDBsO7Fby0i
 7sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719319107; x=1719923907;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kcWgWYD2GIFGfKoXbG09siq4L1d5KHolHjJ73IqMLZU=;
 b=SzsJhlTyR11AMVBlDDOy9ZUv1Z/5IRrNcoyx1WJunmLzPDKVfpC6kitlKwwy9yJn8o
 kiO0jGo8ZlB6SoUYbw7A2452Y7zZGxtiR753IYrQNeLYX6jjpZ9Gi+hS3sWonsvGzE3T
 eqdNe8KutuoagbgJ5clxsa71JCC0shIUYZBwpAU9jo6pQoZdQgTsJR6aAjO353BlKhHg
 6i3AEuJmdNqfUw0FfKvNqxTVWUOrt6fqykh66eMgNquHLqaIt50+oKqiTShz/1Vow7QZ
 JQOcs+ChCQGn4BF6Cqzg9qpA4DqZ8xrbygxxUeShIzDfm9V7tx5S3UZ2fD9jZckd4aJT
 06wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEZtAm23Jp2aD63iam9iRNmF5lu/Di73lHKsFQB4s1RwoOolye3lnjqwhtHySsTBZSSTXbkqKbHpYLGUOK8T3qtzkq
X-Gm-Message-State: AOJu0YwfZAQTvFu+VuXdnSi1kwrC4XKC95vlEtINEBy2A8y8Ey09krU1
 X2+NSxll+Zg9psCEsKzXXRNC4TsO4eVLNa9SPsR64xUHKwSmgxtnbLaKmF1oM696I+OhoC2XcF2
 2gi6bgUgsrGXbGz9a8AB3qOxuG947GHDy90xV+A==
X-Received: by 2002:a05:6402:270c:b0:57d:6079:3916 with SMTP id
 4fb4d7f45d1cf-57d607939edmr4482108a12.26.1719319106728; Tue, 25 Jun 2024
 05:38:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240625050810.1475643-1-richard.henderson@linaro.org>
 <20240625050810.1475643-5-richard.henderson@linaro.org>
In-Reply-To: <20240625050810.1475643-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jun 2024 13:38:15 +0100
Message-ID: <CAFEAcA9YewrLJdU0EnZ5TdKcCvaR1S4vFNH2cPdV+AZzmXsPkw@mail.gmail.com>
Subject: Re: [PATCH 04/13] target/arm: Convert SQRDMLAH, SQRDMLSH to decodetree
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
X-TUID: XWRBjN9r+HxZ

On Tue, 25 Jun 2024 at 06:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h            |  10 ++
>  target/arm/tcg/a64.decode      |  16 +++
>  target/arm/tcg/translate-a64.c | 206 +++++++++++++--------------------
>  target/arm/tcg/vec_helper.c    |  72 ++++++++++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
