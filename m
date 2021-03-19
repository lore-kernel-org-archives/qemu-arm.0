Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1163494lfg;
        Fri, 19 Mar 2021 03:36:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwb6uez2IyIbUaX0lIxC8pmmz2MStyIbB8wRvgVCSDU/YQLO5RwCuQFAiMVA4R7OM8JY86w
X-Received: by 2002:ab0:608a:: with SMTP id i10mr4545869ual.26.1616150211417;
        Fri, 19 Mar 2021 03:36:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616150211; cv=none;
        d=google.com; s=arc-20160816;
        b=GnFdLYsATGIGS9W6KGRp4fMmpvdn2wRerGSEJYDhpFKAixK/kPXTr8G/LYXXoUvn8g
         XbChPFMrvxy4bp1Qn37JUKDDZffYyBem8K0TduXwfXUjT37S8/3FUKeB9JZDgGM+4fdw
         0WwuqNTjwMGvXoQcNGdgCc3kzgYAOBtaFZdHBmYtJAtm9tsgfMaj+Q/7tlrLk4PgKKyf
         TPGgR8PdGJ6GGegIIRqwhSozhiyCVdo4TWxXNJoduW1jrNC6vRF6cbXv+wDGhOP3QKRl
         2dkg0nQ3i6WvGTkRlqua9ECWnhm0aI9twcR3FfmqwlXtr9QRLCXVv9/G0+SR+ym05ONy
         ktPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GufcECr4mtD8y5rvmA/2Z4lvHMT1MO/VWODA9HUx4kM=;
        b=A609lVz0OJ+qnbMjXI+U4MvOG0On2CqB/dwe2CGBWu3gHKZj3MNNeH5+Tr/KkYXLhA
         UtmcwXzRxJzeRxVWQbzAM+H3pn4v04aW4jq5NwNVnmhdtRYi3LJMJ97Fr8+4HiXpzDmQ
         Kn1zToj1M8CkTZnCxQLH7b6TD6Vj7YllrQ/rTqKqNY1euvJ6UW8MYoy+ymxpzjkLgLwJ
         bPAwD9ZOtx3748083wY1CAg2mDpGex5X/swiyr6LqxxBh5RRudXSccoxeMFxnkYEqLqF
         HoGFIoHI46G2+OSKA5vPsoi+C9nBEGAis8Xnl+7NoajOlzR3eZ33idF15V/Ckef7gtDe
         kRiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=azg4CIlE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si781133vsf.319.2021.03.19.03.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Mar 2021 03:36:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=azg4CIlE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lNCUs-0007Lk-OO
	for alex.bennee@linaro.org; Fri, 19 Mar 2021 06:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCUB-00066h-Ni
 for qemu-arm@nongnu.org; Fri, 19 Mar 2021 06:36:07 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:37625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNCU7-0005f3-Jc
 for qemu-arm@nongnu.org; Fri, 19 Mar 2021 06:36:07 -0400
Received: by mail-ed1-x531.google.com with SMTP id x21so10152419eds.4
 for <qemu-arm@nongnu.org>; Fri, 19 Mar 2021 03:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GufcECr4mtD8y5rvmA/2Z4lvHMT1MO/VWODA9HUx4kM=;
 b=azg4CIlELdG56SczWwmlUG3h8SiwYSVmELnrKU2qFClMpyeFITChE+CCPxVsYFv8Y5
 QDFTeXy6u1O1EOd7snWUam9Q6FZc5FIOZglgbusRJHZpV0AAMEp+jOhw0FfqAzPwsDYi
 gFIQw/WhkvafHFiNs3zNUdWAyXo3j5QVgVx7dMHo9GLVFA3EiIAV3lqn+YO+BoyW2v2k
 GUY2U7UFr75CK43z1pMGoB4zyY2QOQkNUMW56JWPlHn1MY5f4Z6CCundLwfELHOEJNl8
 FzOqt2deMJESZjlHD2DiaHFaTDcVtZ0f8cCfOyWXVQaTz8YO2DnrqH2q1FjBxayoqDqV
 FT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GufcECr4mtD8y5rvmA/2Z4lvHMT1MO/VWODA9HUx4kM=;
 b=UakxNMnI/WTHzdDBAerbHMhrON/rdn2IBCN0ow6eqPRVhjB//zBfnMo25WHv/AFbTG
 igVBQ62nmi6tmhySX7aKXsXOMlDIfnLGEYcSjZBCvV1Sofao5K6DZWUnUF2xgO8v5jxR
 RmmR52mUfB45pPyGVwloCVToRyKMgBWmqivl5OD8rr5Q8xe0pHi5eO+kXvMKmpskQQt5
 37LScrDzoVC3/GDUG/pSgmDFR7aU15CWfFxZ5U6JLlEaxgT5Yba6SUiFBQgmWYJ41kLj
 ziW0AY5y4h1jH9biAptFFTR9mUGJzvaFWLvjSdavXGWzsgRlXmZve7m13+8V7ag/9kjd
 MxJQ==
X-Gm-Message-State: AOAM530YHX4T/7oOvDoKX5rAmehO1UmIAJM9Fhqu3gZcqeQdvK16SLGd
 CXLhT7w+OWlodYW7CbRCSEs8XkZR/jfNOS3TS5+s0w==
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr7593741edu.52.1616150161825; 
 Fri, 19 Mar 2021 03:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210313170131.2116837-1-f4bug@amsat.org>
In-Reply-To: <20210313170131.2116837-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 10:35:36 +0000
Message-ID: <CAFEAcA_RYO0yqKvBk-VuJTkbdC+ZOFb0m+h7ecEeEzjpHndZMw@mail.gmail.com>
Subject: Re: [PATCH] hw/display/bcm2835_fb: Remove DeviceReset() call in
 DeviceRealize()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3mQDki3w7NZ8

On Sat, 13 Mar 2021 at 17:01, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> When QDev objects have their DeviceReset handler set, they
> shouldn't worry about calling it at realization stage (it
> is handled by hw/core/qdev.c::device_set_realized).
>
> Remove the pointless/confusing bcm2835_fb_reset() call.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/bcm2835_fb.c | 2 --


Applied to target-arm.next, thanks.

-- PMM
