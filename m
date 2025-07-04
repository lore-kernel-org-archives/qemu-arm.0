Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1268808dyc;
        Fri, 4 Jul 2025 07:55:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJMN/XBoRZfOWUKaa71IfRQq/Xl5YCzuIVld2Ij8EdjREMbyfr73Kk3aGK2KwsUYnqO/ZAE8RVY24jGw==@linaro.org
X-Google-Smtp-Source: AGHT+IGQhu2qxzruuhxQy1nTe3HRfDRn8vYkjRdrN3C5ypdrxBxBcZta8Cqqdu4mlWZw2JvDtQjy
X-Received: by 2002:a05:620a:318c:b0:7d3:ed55:c53b with SMTP id af79cd13be357-7d5df109342mr309530885a.11.1751640938881;
        Fri, 04 Jul 2025 07:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751640938; cv=none;
        d=google.com; s=arc-20240605;
        b=Xyvn2W9vehmgOCaqk6dOdtjZC9B3MEGSXT6QiP750uOLdEhnZpaV2raafvDKkp3w4E
         v063n766K8emJ79qX9w4JUaR7wXoX3ebqKH9RT0mDRz01Stz5Y5etWqQwKHEOdMdsWPL
         sUzQuom3vhGifZ9KPj6icv4yaqNbnDoalmbwmEuGV8Ago1Jy0JMlfyDmhMNxhGOhfGX/
         0J+T9cChnhwiwhlIoZw5zXpbhLhuMZatuUxCIQlYRrFeI9l6h4Jmuh+S6U/dvmQ1RIEX
         H2MUOPaUZqVeAi1oFQvH49kkjZ1u4wQucLqpZhDKcd+Aw6IxRsASBiDujfBA+BQc8SrL
         N5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2baG7bZ6dgB9epKa4XJxfahUy1VTGMjlJefV7FSwaDg=;
        fh=f5Z1grsS9ewX707CWYZwLMMjH30KCZJsvfaKuQ0JGGA=;
        b=RhxsP3O8tGaqN8E+DGTOwX8uiGYGM1V5CVVW4Dq1iK7HKlJqf89fTj4VNYNBx9/IUj
         mjoOuzais206NJsFs9rOpdxrqa4uzkGG2wixPaZJGhwLaZo/hJahpFK2b5rT0Y7Nhc/I
         Nu7BnN5UXKTv1ReJ5cbeD2xXinboFKYiuavuyZZpDIX4IpbVxABrL0vLBsCY33cNLh55
         ucIpxOMID1DmN6s8aAtXheWuh5a7UJQa16lusMu/tf+xQ5vboniq7ZZwWWwZk+MDMHfB
         A5gNtHJX2i8PXp4wCM0CQPMaFaHAKz3e/6Ovxwbw7tsTi9npjDDIcjlRov3xA0z8o/vy
         TKQg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eA+OEmQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbeea9basi234075785a.514.2025.07.04.07.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eA+OEmQ2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhZ8-00038q-Fr; Fri, 04 Jul 2025 10:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhSv-0008N2-Ji
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:32:38 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXhSt-0007UU-Av
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:32:37 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-7086dcab64bso8506207b3.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639554; x=1752244354; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2baG7bZ6dgB9epKa4XJxfahUy1VTGMjlJefV7FSwaDg=;
 b=eA+OEmQ26vHtARt7i776DN/lAMK7KMTWRkXo7gU0bPRwSYjPbQpPcWFc4aH+qk5YsC
 xI0nqxkFAPEwc6VSajSP9lImdFaQOfdLYm9xPGLmUD1epOgzFw4EYLD/jv8o8JGAM6y+
 TDUHaiKdE5Yx5dXIBrBB6cagAoULDtlD7ZLTLLiCcyCndPMTgZNI+p1XTfwYs5jr8yCy
 aRGdcalMb4Qvk/uCKUeP4xOfsp3VjuBrdHHWDPkxHfZ0xVafrOncOAPPdu/KIUYZuCfj
 oN8UhDqzjkwDnPbZH9EHCR5lvK1faxXz+83D0ANzJ5GogkqG4I84NSdEdCuyZKoPNMWH
 shZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639554; x=1752244354;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2baG7bZ6dgB9epKa4XJxfahUy1VTGMjlJefV7FSwaDg=;
 b=G/Sa7gm/mCxOFlSix1AN3tjfU/ltCXMIgSb6/uLRDSghZgogHK5/bfEvxsdNLKwYmc
 enxoF5rIqTvYI8tGb9AtWNYjr5JjULNy2LvSLOjFDPgMogAHQ5IxJMYbGGDDPFQ6Dm0O
 9MTZ3NzMEyyaiOaeKiimvSj8Fr5W/m2ykDlIUGt1kWpixaVUrp6YNDaoV5USaeAK2J+W
 BZkvVpomlSuk81IBH06PorRjN4+PjbWRxjlej+U8OU+XmW8bQ80uQhuctkYN9fMW6+h4
 2Abm3Ke+mS42kS2oKQ6yTWC95JCR0OQag4Xpm2mvOYXu1eteEhXGqm8ynPjnp9qy1OTu
 sXRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVdIWp9OtK/xMJlNmfBYhYglqAmNFYGg0uIveTIp2Oe0ihsvlMYcQhjTAg6wvtRUHrRKkOIJzFlA==@nongnu.org
X-Gm-Message-State: AOJu0YxwQFAsCsNO8G6v5Yyu0a7Xk8Ar1PvXw0NziaeXQligK1ImVAcg
 JlVNMzQdCZEufTGWOa4Ss6JHTvRok8Hg7jut+wiwdl074Cw260ovk/aRblvj4X5Iy40STvUHJwD
 mOrBov4cxBLEOSrKeRIOvn4z7QkIisZrbMW7Xkdt9Mw==
X-Gm-Gg: ASbGncsaKvQR6SkTQT7HZaVRQXCRZprLMQLlTqMd0oHwRkdWuZT8D+PJy/Y8lgNlXfF
 vA7btqZnCsi+e/yZsBPlLy3rbFvOI3mgm3Bglkz0NSvzZyeoB5lqbIpwm4NzqDaQq/PYr33tJbk
 Bs/fGeniBrrI8iQRv1UIaxeKGr9LW7nPps9oQUgN0m6oSoZKxyGHP9A80=
X-Received: by 2002:a05:690c:6f82:b0:70d:ed5d:b4dd with SMTP id
 00721157ae682-7166b699231mr26909327b3.25.1751639554255; Fri, 04 Jul 2025
 07:32:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
 <20250704142112.1018902-73-richard.henderson@linaro.org>
In-Reply-To: <20250704142112.1018902-73-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jul 2025 15:32:22 +0100
X-Gm-Features: Ac12FXymEPYrxyH0OmnyefFcShIVL8mI2lRA4uVASC_dpfbCbWZx9bbcqVK9szk
Message-ID: <CAFEAcA8oES6+USn_gZB=D6cDHsfJdyqRNhvf2Ne1j4xHf5w41g@mail.gmail.com>
Subject: Re: [PATCH v4 072/108] target/arm: Expand do_zero inline
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
X-TUID: O47R6ShoQBmf

On Fri, 4 Jul 2025 at 15:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Expand to memset plus the return value, when used.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve_helper.c | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
