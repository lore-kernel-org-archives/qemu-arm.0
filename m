Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp498359dyc;
        Thu, 3 Jul 2025 05:25:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXshmDrHadTzpFPUd7E2kIRg2eqXFM9ZmAl4oZ0yRGD1DW7uPXUdDElZt3hoX3lh/VBwyy9hUnYRuX7yA==@linaro.org
X-Google-Smtp-Source: AGHT+IH/Qh2bv1QNJ3SnWBy4RtxBtDGZnhYMpHhU6oiFXwRd6FZzn0wrA9CbdSF5W5eO/a7H47jn
X-Received: by 2002:a05:6214:2428:b0:6fb:6114:1034 with SMTP id 6a1803df08f44-702bc93c6d6mr49981206d6.39.1751545529039;
        Thu, 03 Jul 2025 05:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751545529; cv=none;
        d=google.com; s=arc-20240605;
        b=dEjKhM1KYsgqkv4VA0yMCywK5JgaXdWYL0EAbWF5xal+U1s33z88IO2azFFKb/qhkv
         y3NFaUTHLXwhboSAjEgsHIY2Wu/68Pn+mdF/H1nX14iw5gIE4Q3EArdgYzOGTzCge0Dg
         z29uUr6MCyo3uJPwI+z8ACV61gVOKSW8KBDY9efcCZimCSkUkXxvkwkobaIL0r5TueLE
         UlQGDUXG42DuwmmQmkcz3u0XvKsOXwMlstsO26ecAAfmw61MD2htFNozMfCWglSt3+q4
         VubWOPrABGNKqdbF6cXWw4yvXRkx2JnExe5uLwOVG308qU4eXLpfKZT3cQzxzWq/Y+h8
         J+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9y4NiBnyY+L3VyKqidewsL1aw100XTtHWrS2Ux/0R6s=;
        fh=Tqh2lHOmyST00UtVRCAUJP9VmpfywfA9GgD9oF3F2ig=;
        b=cyyU9Z2sudxPttTVBDJMredJDN/XCuZv28kwhR1sC3bA6w7U9GNp7kQ8OsLKgErrP9
         OmyHKY+sxgBfUITBZeq6C03YKo6Mq5ZZrn52MBgUmdF94OR6O6toa5BmIzZ5RINasv7s
         8RcMYnAmDBNHi0e32v5tsjfeGt+egPjzw+pKMZy2V7I1BlP2URPMWmyPCu6d6wt1JSYt
         dIB49X5Rtui1QwGB4mvm5fFcoT/Z7Uk8z01jRfEto8P75cPX1QurUnhZvs/TIMbM7ue8
         xvPpXG7h2DZn/rI4rj/Qo6o35ShUPH6OLpgPdQ5s8SEMTzCx3nbUvU0dplqm1ijHpygB
         8t6A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hoKbclEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7736ba6esi170189696d6.329.2025.07.03.05.25.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:25:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hoKbclEs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJ08-0006wh-3V; Thu, 03 Jul 2025 08:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ04-0006u1-Je
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:25:12 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJ01-0004ZP-Pu
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:25:11 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-70f862dbeaeso58097197b3.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751545503; x=1752150303; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9y4NiBnyY+L3VyKqidewsL1aw100XTtHWrS2Ux/0R6s=;
 b=hoKbclEse41I4C4pq4/NEjzoFM9LAh5FJ1YxiXWZlFoflQG916mEVerD/iDyJq4eqb
 jhFYEUTFRFeS9jc4xxvIcK6tE6PHQPMEa3KZOpTFrl6K3wOmOoeeP64dYSlmm1zArnZW
 k/777ekp2abD4UGl+a46EnHkcrgRCa1xcV1SBdXTnZjmswdnMPDJQXKhOl1sQUb0Tndp
 8LcZaWWsfjcfBrJFhkEHAYYT4UyBW+8vVpVpss18YGTY83We9waC4RNx5Fm2KrX5rqGY
 ntRquKki7Kx34YRfv3XD6Gnb+zDLn5MADYz7dsA6/Im6g9Obx2t1+COAe9DpnIIUCbyE
 UKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751545503; x=1752150303;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9y4NiBnyY+L3VyKqidewsL1aw100XTtHWrS2Ux/0R6s=;
 b=CoZfPNZW8RbcuRtFKAMm3fyQuVwVtZUw4YgaoN3cYjGpaafWCuT2TrxzUSOg/GubTJ
 ughZqNckA9Nh3ck2nAyC2DxjObnK1xPwM8sVQvP0w4TqpaAqAz78Tfd5QPDdUdjUV+pf
 f31QfUCoGaNRVEr1tV7H3lrAgIaLXCo7G2eLcHJ0cnAYoo+Hzx1DEIjaqf0zXy2ZxQ/n
 tnA/Ngbujiw7hWB9fAUPG61CuzyW1tZifMR1rdJGnIWEqFFK4GhDWgvKZvI6emOBhzgK
 /w2Fwm60JEiKj/038EKhcP9lT6vaaWcnrm8PLh+gu/FtfbjVHCwf5bgoDVj+gBJpIjLh
 wgYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW45ZZXucPSEUutP4D9itMTf6feOd0K9GzHLmUvKMakW/kwlPw8bQjdj7u5E3c3fJhTA+JNIUsfqQ==@nongnu.org
X-Gm-Message-State: AOJu0YygRZIbQitoFkk8tB7egshg5SsPvJy7xTfLC6ouqO7/rk2CLPhW
 KhPnpQOlZs84PJRl8rCgKCRE51hBdxg+6rco30lkj8VDw9NXJi1aQDNR83gFMPPEUhCIqDgHDAS
 Zc0/XbLjnJbUcoHGBdRb6l1UZAYt3IIsRWEYxAicEmA==
X-Gm-Gg: ASbGncvJI85BYo0463Jzll0Rit06R28OQh2zjJ+YOblt8ANJmrRc1zTo0p8mqdiCzeo
 XnWPEhXsiWEpWQAnIZxM3hsNEcgvVPy4fEn31bhes2tQeDYkU1J39PDCH1rpYelnsWIUZeezR2s
 ZY8pKOXhNCHQRBCAWojKT3hTaiXQhMaZRMKcKZ/xTiKMQ9
X-Received: by 2002:a05:690c:6ac6:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-716590c00f3mr42292507b3.17.1751545503272; Thu, 03 Jul 2025
 05:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-76-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-76-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:24:51 +0100
X-Gm-Features: Ac12FXzv8DzG79qI5VHevu1JcQhvIVaeNXDNhZLwOrrgZEsQHR8tWFT0TL0lG48
Message-ID: <CAFEAcA9hQZKvuu1So4PO1djg9ECn+s3nzwh3BdytkKX7uXWk+g@mail.gmail.com>
Subject: Re: [PATCH v3 75/97] target/arm: Implement BFMLSLB{L,
 T} for SME2/SVE2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
X-TUID: d9nVyMjJMW/p

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sve.c | 30 ++++++++++++++++++++++++++++++
>  target/arm/tcg/sve.decode      |  6 ++++++
>  2 files changed, 36 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
