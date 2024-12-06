Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp935982njb;
        Fri, 6 Dec 2024 07:37:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX0RmFNm0ZG9lLwMFK7nRrGVRzSxI6LWV1HMMt7wCS+DHBokhkt6E7cs91IVlolQvcrsbs809Ua/dNa9g==@linaro.org
X-Google-Smtp-Source: AGHT+IHapyovsiKu2JHoW7Ao7ME7Y+cQE8ofwVQ8OkYU7oqCzu0PhOcKGY4NNZfJiaVgt9kpvYyt
X-Received: by 2002:ad4:5c66:0:b0:6d8:981d:529 with SMTP id 6a1803df08f44-6d8e71e939emr48972176d6.48.1733499442509;
        Fri, 06 Dec 2024 07:37:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733499442; cv=none;
        d=google.com; s=arc-20240605;
        b=MSqy0cbQlIT7L9DzQHI8es7EDprITtHPK7jS0o09dgUTJuu/dzo/4w5ADvhN0Xx5G8
         EHEU0Hv9VegREp9kNRxeJLTBJBbnmG7fOVrtamFn7Ghqg3WVvImQ0WS/tUYZPUJZBTsD
         hNXjMAng6jCAx3OT9cC4F8jHidk4orYOPEclc8BJCagwE39se6LAKFjTjFhyDTY79dm8
         wmzNEak2PrfeUGQPRjHJWrnIqtlY1QQumj7OLgNmfOGS8OpMYfMHrv4xE2UZHvLMWBA3
         Kqc0rMqjA9QXutCCboPUV4HaN/ZY0BFVqqVNvlo/F+cgsw70wIlZsSR2FjeqhaagZSuC
         mTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yQ4A3/g/2pS6c784I2euUtTqJcCLeS/MepE1AhkfSyI=;
        fh=nZhqLgKH+bv5m5rR8xSA9fS4zEEyLN0QwR4/wJIofWg=;
        b=haKdO88FOwf1IzyqjyYSEB7BiYvRrKPVy0LcjKN/PZ0ihmrt088+Fvb58Ve7ZQh3tT
         xzX8qp/b8jou1h9LG2gx+STJ96weLaVbzw5AhNkOsGKorbh67mMFyIl5f6/aHTRGmtAy
         K8g1kwGk9oK09HDk1fd7hMvaB9zVMU3W/ySEhbkZQoFEnrdQutx3BsuAXrGHxKU3iv+3
         saQyDkmxzxq5gXiDLF51zToYlAKuBLbpCZEPJuP0EhGsL6MTZkbe3xd3oH8B7TA/L/0p
         B36+Iveb70SkeYlH7lITZcXld7YVKM1iAE54gRoyPL2Hyj9HxZoF4JIfaZ5s8atlbFyO
         0SCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXabn57R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8e6e5d408si26273036d6.251.2024.12.06.07.37.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:37:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PXabn57R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJaO4-0003L4-4c; Fri, 06 Dec 2024 10:37:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJaO3-0003Hz-8O
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:36:59 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJaO1-0001m2-6U
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:36:58 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so727246a12.3
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733499414; x=1734104214; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yQ4A3/g/2pS6c784I2euUtTqJcCLeS/MepE1AhkfSyI=;
 b=PXabn57Rh4NSNdYagskd2qdmCCvZUllThFIc6y0blq1kLG4aS3blKnPFmYgWJSwB8t
 BVR6CGCcqF96EP47RChZElq2u/cF0ydSFCWv9GfOZ3SbO9s3wuBFFgMN1PWjy3L0eYzf
 Wjwcc1uo6lJKIfd/ZayJiPk17bf7Z5cV69ckfMulr1t1SUVuCQ2FQ2+sRJI6yV7bwDHz
 BLw8jlcUIInXy1DFL/MHNofbhjjpux75OGrZoF4ZFWvxcr0JA4G4FNwxKQJbPPw0iT8/
 2e1gmiawfWtmqPHnewQcZ66B6MRZKc+QG5USJX/DShNS8RQ1zD7XCmefllDzXvwmRrBM
 bMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733499414; x=1734104214;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yQ4A3/g/2pS6c784I2euUtTqJcCLeS/MepE1AhkfSyI=;
 b=e5qGVe0/H1J3Px+4+3pV+GHLG+b0vHq+mQXqAzZ/VtVIBtd350oo2chlnUqEd/PuSi
 HHcj2BMBoeNLSsg+8mUDI9+bWiWrNumrWE8TQsfT8kWmLZqCa59AWKzR/5VkRAtngZCE
 AiWmg/19P/hopeaguXB8ktJfFIFSzQ1C0YHVgnoc7gOl73Mxzk/9zKAqvkOr/DfQ1zQJ
 mUQkh0EfCk9FVQCRXG9ac/MOo0Jec7Q1n2wBO0qCqwMjkoOSu+OokjOjlA6OBkFvHVoL
 mcS+Qj8+izLsmaAtqTDEVZ94JA97xVnhZ0AzmZCthay9q9NxNCBPjQ6gHtnwuxNLZicC
 LAhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrWrz6wwarkn74tIBaOutOAKpoq4xgviE4d1KI0ruPDjnnLpv2FCbR7rg/ZZp/D0e4shBrGdm20Q==@nongnu.org
X-Gm-Message-State: AOJu0YyGqtmSkKQReufk18BhWwohJcRYyn5FWGwtRGJQ0B/UNpzvIm7k
 AwaaWoynBdCEwIrey2+gnYNzNsAvRkea4uMySjsuMX3ER4hu62fZgmq/HYrlO5h9Ri4qr4hvzLW
 aOZiLzs5YvEJgha7fFx9hJjNMEp9OQAJ9DOXcOA==
X-Gm-Gg: ASbGncvSufb6BB78DvAmIApjnC2LqCnuN3hYQ++CHY6Xs5AN8EgT8YxhplhoFSS4AvU
 d0unAv3Vo6JyYsl2W/P/RAb0vxkfIAITg
X-Received: by 2002:a05:6402:2742:b0:5d2:723c:810f with SMTP id
 4fb4d7f45d1cf-5d3be783193mr4379864a12.30.1733499414416; Fri, 06 Dec 2024
 07:36:54 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-45-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:36:43 +0000
Message-ID: <CAFEAcA8Kk_AKZHF_ew41HY0=Hyvo4jjzfxgzaYw0_vVLDZvdLw@mail.gmail.com>
Subject: Re: [PATCH 44/67] target/arm: Introduce gen_gvec_{s,u}{add,ada}lp
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
X-TUID: KlnXg79AAtbx

On Sun, 1 Dec 2024 at 15:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pairwise addition with and without accumulation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             |   2 -
>  target/arm/tcg/translate.h      |   9 ++
>  target/arm/tcg/gengvec.c        | 230 ++++++++++++++++++++++++++++++++
>  target/arm/tcg/neon_helper.c    |  22 ---
>  target/arm/tcg/translate-neon.c | 150 +--------------------
>  5 files changed, 243 insertions(+), 170 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
