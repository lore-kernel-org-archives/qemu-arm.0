Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1039439ejb;
        Thu, 3 Aug 2023 06:22:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGrUSalA7gyObY4+s36k7pR42t97C99K475TxDAyZSFR0JzM9YZJJrsBMd13llI4AMaMJuT
X-Received: by 2002:ac8:7f05:0:b0:407:30b8:5f4c with SMTP id f5-20020ac87f05000000b0040730b85f4cmr25583739qtk.29.1691068971232;
        Thu, 03 Aug 2023 06:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691068971; cv=none;
        d=google.com; s=arc-20160816;
        b=iTx0NFdZDdXRdtIY2P4qfQN+jP6L9TE7jMdFwtDPWnGx/Ggq52ZotB0JnYxGRpGpBL
         TZOa82LS6Vz7S41demaZ1HgJzfIjSZfPyRVaqXWbU6Brb7TTWC5kSYPYyLOwhKBJhQ+I
         Fq8vBJcJ3BqdRczJexaffbt26ke2AHihhKOeu2QgP0WE+SDBFFQimcSsNuv8cp7R9+LB
         TbanECZcFB59FUsrEEyzYO7pPiE2Jq4CYddxi1SXJC/xSk9Z4u19/eBb7/eekkqyL/Lu
         34D6xHvuqRBk7gtfhuGl7hfNE/JsYNuuRwwFIOn/rAjKDyuT5LqZ3lixC+fRsCsJv0xt
         pXow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XkEoNrGj4MxU4lbhNxctuYoVXCP6gtmRLrqZfPBUW+g=;
        fh=XBL7wuOnmyes3GPK3AEoJ+XBo7B8JI753uFIVICnU40=;
        b=gnMxgbqjTPR4P33HH/N05F2J9PxARoIPp6JRiO+mQy8/+R9XCN115RA/rM+0F7FmVZ
         +Ug1jEHA8QRLRz8auY6pBvVu96+zGmxufygbbfwxaVcTY3Ez/JN8D3UNtWjXmdcDzXsm
         hUh+t2J3CgL1CEgFzGLK2TtBPU4AHb1nLMk2ZO8X4Yu1Z+qKvZdA6Ho5f/onZn3YpcsL
         HmhXCX6JGuXp6bO4fY1ldaxVJ5nT2ZmihrG6JkJ7d/hWSFDTDWuNwfMEdg2G7nS8QfAM
         +Rjz1+97Y1sQKHnmkZIOTUqifjCE4N1Np6Ypo9xHyt1FVf+GcGKRI4lBUYz13FsZ1beu
         3POQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTODm5bl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ra12-20020a05620a8c8c00b0076cab653f6asi5832738qkn.153.2023.08.03.06.22.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Aug 2023 06:22:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTODm5bl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRYHM-00054F-0C; Thu, 03 Aug 2023 09:22:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRYHL-00053n-8c
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 09:22:11 -0400
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRYHI-0002eH-Oo
 for qemu-arm@nongnu.org; Thu, 03 Aug 2023 09:22:10 -0400
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fe48d0ab0fso1642067e87.1
 for <qemu-arm@nongnu.org>; Thu, 03 Aug 2023 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691068926; x=1691673726;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XkEoNrGj4MxU4lbhNxctuYoVXCP6gtmRLrqZfPBUW+g=;
 b=UTODm5blmU5pEVxhlXArvq++7f43fqaMdgk8Hsm+cAdoI0aB7m7MsfdGEYsHD5EPaE
 UwVqNBumZmPhW+Z6uOzOXHd06tB6RYX9pXsZ3zF3FYuJQpsj87X9rpdqt45fSmCOp6BS
 O5SF0dCAXswMnHAQiNUBjxRAhKGGgk4k8vPpxUpf5DzjEtBGF/b0lHbV5zNwjsMYaJHV
 oL8+5jB9hF8Wk0CfMay/C3qJMgv6sx6SA/8FS6etLRqwjxQgiPXIaek1rVVgwNcm0Uv0
 PTdpmI8KR2Bi+Ui2ycJlVJSxxgomlNOEnlEDWqNTjJbkG7zjdJRiUnwZQkLnXf3SOU3q
 GdrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691068926; x=1691673726;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XkEoNrGj4MxU4lbhNxctuYoVXCP6gtmRLrqZfPBUW+g=;
 b=WoJ31q27J9YFPaGP7GCCPbYAdIeZ2O2j9Ikn9FScSVDDht421545Vi7HcXWtvOlu9X
 6rKqqVh8YRRRt/Yi2cnwcHAj/UMDH8vuYdfkISlg6y6OqouaAbdq6K5+9LgdvhHdj4n3
 NXCZzUokb6jwrrg6LwmZtONBz0YTP1QFywujPaTgASCDBaHwnLnb/tl3S8t+/h6fKXOJ
 wdO3FT7XiKSdY016B7smcnR4nrO+JNA4FVFUu/i3cZyIVvY9/5ZbLLQAILtl2yGW94Br
 JqNfqfmXvnwaEWJFfzgTNj3JDcowh0leA2ntvDCZbstPpeHsR5cczknN0B4ygA80m3PN
 VrOQ==
X-Gm-Message-State: ABy/qLZI7ZQZZOVsUbBnduM8ktgeJOEjnr0y4RPgOqqUpflFVVH/uT4E
 4+d7dI00Y1lhbm6R7uC4PqNFDlx6uRODLGBNQW4Q0Q==
X-Received: by 2002:a19:6418:0:b0:4f8:6e6e:4100 with SMTP id
 y24-20020a196418000000b004f86e6e4100mr6831548lfb.52.1691068925563; Thu, 03
 Aug 2023 06:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230728160324.1159090-1-chris@laplante.io>
In-Reply-To: <20230728160324.1159090-1-chris@laplante.io>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Aug 2023 14:21:54 +0100
Message-ID: <CAFEAcA8GsmK5iOm7L1UNgSZL7jY=+-nk+atQqaMLyn6j7+ippA@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Add nRF51 DETECT signal with test
To: Chris Laplante <chris@laplante.io>
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::133;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: esYg2/bQa3SC

On Fri, 28 Jul 2023 at 17:04, Chris Laplante <chris@laplante.io> wrote:
>
> This patch series implements the nRF51 DETECT signal
> in the GPIO peripheral. A qtest is added exercising the signal.
>
> To implement the test, named out-GPIO IRQ interception had to be added
> to the qtest framework. I also took the opportunity to improve IRQ
> interception a bit by adding 'FAIL' responses when interception fails.
> Otherwise, it is frustrating to troubleshoot why calls to
> qtest_irq_intercept_out and friends appears to do nothing.
>
> v2: https://patchwork.kernel.org/project/qemu-devel/list/?series=769532

I've applied this to my target-arm-for-8.2 branch; as
the name suggests this will be to go in after we release
8.1 and development reopens for 8.2.

Thanks for the patches!

-- PMM
