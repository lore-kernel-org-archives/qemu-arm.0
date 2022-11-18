Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp340629ejx;
        Fri, 18 Nov 2022 07:36:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf41nuDALLjkN42f4LtRvwRSflpSq0AVtepUwkDyz/FeUsiQ9BdDsR3aYi/7Fq1A0gzZYXt9
X-Received: by 2002:ac8:5d8f:0:b0:3a5:448:cc69 with SMTP id d15-20020ac85d8f000000b003a50448cc69mr7014493qtx.530.1668785764180;
        Fri, 18 Nov 2022 07:36:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668785764; cv=none;
        d=google.com; s=arc-20160816;
        b=tnaAppzUBQ3SBAgOmucXzYo6lthtFpyWbHBtoGnFOUQZ3Nch0BFWQ/qXs9oj6mZTnF
         sLWiSneKGpUIGxlVWpWsXQTZgv0nNPtiiobY/r0/43UZmyGD4ISoEimzlU/vmHArVv1D
         lHf2ZwNBLnezoZyMnZA1RTtgFMWlVGW3CukipJc/8wCsyOSR5ZB9Dqn2uS5xGZ5GvZuG
         FwLJpmNvkFnlrv/eh71u78ZPGHxiEat/hi44csCjMgURX4KSTx+wWVvmk3No1/zPaBX0
         5lSDy1awtSWAx+xCt5MZjXpoLRKPaC65MitYcTsEh3yRenpRRnfCV51Axpud02SkZwya
         pb1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Lw5NODinhhYorcz0OqeiqHzIdlpb+FNWOMAn5anAcNM=;
        b=VJxfrntNlTlFOHx9/lb9K99iO4zSCsG/8WcYBjmHO+9kYn+WhgL6oIfekcfNnXfW5B
         gOJpu6u1uOiOXE/M383Qi/IIsrt6OW/ZbUxRXMA7fxTxyuCMXiD1BBFusuiiAejF3xke
         OXP7mqadrswZ4YfQioCgUwIKTAl8ISEBQjmMqcv57lZuFG6oIoIQuEx9KaqqE/bdfGVc
         hhG+I3ZoJq/kfLBu2B3JW+UEnIaPIFYT+i/BZxIWIFRf/ebGrWf7AQsEiDaz5VJNAC9/
         QBphP7Q4GNGfWedvYS25DgYoZ9L+NZjxLeONKL8gV4drim+/aQNkH+Vai+KRRa8PY9Ox
         BHbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VioNoOO7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kc9-20020a056214410900b004bb615cb6f9si2171472qvb.129.2022.11.18.07.36.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Nov 2022 07:36:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VioNoOO7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ow3Oz-0001A8-8k; Fri, 18 Nov 2022 10:35:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3Ou-00019f-QP
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:35:32 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3Os-00082W-VU
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:35:32 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 q1-20020a17090a750100b002139ec1e999so5392955pjk.1
 for <qemu-arm@nongnu.org>; Fri, 18 Nov 2022 07:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lw5NODinhhYorcz0OqeiqHzIdlpb+FNWOMAn5anAcNM=;
 b=VioNoOO7c1eVsVXz6+eRJ72VZ8fCwdxUxMHorTbYwC6veoZrN09tYeF2QFaDVZBvNI
 3OmaYnT1HwjYgNfhqNPTE10Qv4ynZc2fbwqNivmnG7PSLopYtHn+C0zgOew0d+9RUuKK
 ZqRecoMxK5LW0CRnR3r69Bs5DZZzAkUK7sYsOBUNp3XBpVkZZHXF5mOsD/8mTDyQ6i6L
 IsVDNIjJN1lFCU5bmoFhHcpsQeojvn204dxcJtFLln5VYZ6KcvZo/whY3uCfo8I1n1zD
 TzaiMu2Jpict1CaIF6KanPYeDe0XKgmEggYCtVw+MeLerirDIp51w/IwWLGXSLrKShC9
 qm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lw5NODinhhYorcz0OqeiqHzIdlpb+FNWOMAn5anAcNM=;
 b=b9ITv3gPEypk86gmFREwvnSlba6QYtR9BoOoFjj6o8cOWbnfP7dMzswpQXXGMaJIvg
 VvhRTnr3Co3fY6c37Z6JRztKHkbiC+QO+O33FRDkahAz0SAvxnw42UwZeqbGpHmB29BX
 4HQxLnKU5ebQaPvNJ2LJPhg7MTVLGQXtWrqWDHJ3+OP330hl3NkP7524CkoNJG5RxtD4
 I2+bDSXaWhFYO79SvkPS1TcakDfFmGkbqsJScRtXSiym1tfF33vJayjbKjF9uFBpM7Rc
 tPojDuqWJYt5lK6Yoh5R87UePzmboU1DmlnlDzRvXVO6DV0bL5+1HhZmNLyEanB3q+9+
 8waA==
X-Gm-Message-State: ANoB5pnxEGqHuwmPkSsA0dUXFpwQXHB+uXfJOgjVVB1mKstsfA6gcyJK
 eJXi/JY+G+1OOIbyvLdeh9RaCsiexFRzNfWTVIbX6w==
X-Received: by 2002:a17:90a:7004:b0:218:8757:8f2b with SMTP id
 f4-20020a17090a700400b0021887578f2bmr3430431pjk.221.1668785729443; Fri, 18
 Nov 2022 07:35:29 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-1@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-1@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:35:18 +0000
Message-ID: <CAFEAcA_BHbfO+mz3-nXGtJFcft==h4Y1OxbpGV_Y-BYPOvEexQ@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 1/9] hw/timer/imx_epit: improve comments
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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
X-TUID: 2YIaAfnxiijC

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> Fix typos, add background information
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
