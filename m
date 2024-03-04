Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2620367eja;
        Mon, 4 Mar 2024 06:25:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqY468Bn0jh+2El0IDwTeMA/sq/oAk0SPNbGmZiL+RLFPSBZuzmjYw72Lr8tYoCrL3M15Y5Y+kexYJNao6tGN816JADpqw
X-Google-Smtp-Source: AGHT+IGoFafw5+I6kWl4gpBfZeMqWyIK+eKnD9miBpVjoSjDMqGuQAvbn9t7jTFU3FntjbwIq1q9
X-Received: by 2002:a0c:e343:0:b0:68f:6c38:c4b0 with SMTP id a3-20020a0ce343000000b0068f6c38c4b0mr14226843qvm.23.1709562320705;
        Mon, 04 Mar 2024 06:25:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709562320; cv=none;
        d=google.com; s=arc-20160816;
        b=eUTsJryR04bux2x0kRBGV5ejnQv+EnlteAEGjNmo1trWOXMCHLw6MFu7yWr8SIpIAT
         7XUVbSBSYXNpLcfr4CnlbuFOS/MpKwMa9IgsqbGcosDURzJg19YahyS1wmCuA9QWurDL
         jj4U+MZCPt5j/4syR8s2pkOY7RjMWvSybOIJHUlgTsQkEEGcQHqJnBCyIxpiNE/9MWKC
         /fvYqrlHOduL3fr0rZUs/iTSqF8/ewnf9P9gjhnpa//9GUb7YZ7eCfHKW6WP/J79l588
         eiVRjNV3su265/DV2fsx06f4JYZdvcdh23s4wGzQOlIFEcU4fI6Rkr4oNNkRI020FLaY
         n76g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=SLFaLbJKTvZVrg6KNlFEGyOYAUZQ3f61dVszsVZcUjc=;
        fh=e1c2ZiWZS7NdiUyGFpRgx4SOQcK6RxAh3qVwchH3J7U=;
        b=ioiNZNJHnwC3w4hDrww/OX0u/i59+g3J+5/T0loecspIu4z5L9Np7p9sLUUvK2XaGt
         AV+VfSvPROa9N6swxbfTwB1zliem15kwdpfSmcyIEtJicqdXA5E7kZTTJCoYoyP1IhE8
         NokwtD9gufJibl6y2NaUsZ3wwJ8BcNyKHsuxq8mdrsk2KgfM4MxVA54YWLL/PuLen41D
         qGMK4slUoelqOSfZKOpU399CJNnCOonIs6buyF7NaNAqCtJWZZDF5Q++IEtngJ2dFkce
         NHmi8xBGESuRfi1alSbmLCu8+zwoOjgny3jLSROqXqiX2mjZrrCNSNN3sYqrfXmmipWQ
         tYlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnGCxu3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv11-20020a056214262b00b0068fd2ee2b00si9684018qvb.19.2024.03.04.06.25.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 06:25:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnGCxu3h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh9Fa-0006Lo-KM; Mon, 04 Mar 2024 09:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rh9FY-0006LW-O4
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 09:25:04 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rh9FW-00021D-39
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 09:25:04 -0500
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56759dc7ea6so1178677a12.1
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 06:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709562300; x=1710167100; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SLFaLbJKTvZVrg6KNlFEGyOYAUZQ3f61dVszsVZcUjc=;
 b=TnGCxu3h9zy90w+KyfFmBlKsiJKRHSSW5tPUq/nDpKgdPpl9jP3JbPddNhDblaNmBB
 +bgzNqW0vnxVsu+FLq6Ec5l+UW+fpi2trxnVYcKH9Pf6/c5x+QmWFdbANRKudMLlaqVc
 1QHv8arqhjU7cHfzCMrpdRoxAGzMW0rvgcyCq91g/5S8VssAC0bH7oB+1YgP8gTKkGVe
 Hayysp00tSWd3AcFOoZXA4XOmz1+6DjjB5PIHYaGm4kZxvKin5dqFRt1LI0NIlVkx4D/
 dimISR7SuXz0Pa/rUfL1VnEJtYFHLKso9c58UtGwlB2jhZWEgW6DEBQZdmZ26mBomXMb
 Eadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709562300; x=1710167100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SLFaLbJKTvZVrg6KNlFEGyOYAUZQ3f61dVszsVZcUjc=;
 b=N2seJIPtOFF8AgHT/iB0aGKXvxUFaY3P8ZOouP2xxmFBR+i7OECsAsz/B2ab6TIFGa
 OHXgr8wOxke2gyeKXd2YoVJ3KDsuB3l+8r6F/7kicEF8caWVvaROsfgSPniwNZ/oTvkp
 4XlknKqFICBZJZz5hEMMCUJtjR1HE9PrjuNktjpX6xyleLiMG8FeHjgxU52DBFf4cC/5
 lJwgWwPX2MIwNfxe6SKN8bG+jVCn9doPl9NawTg/nvdDF0fzrYllCIxGfqbjDvEn5JUp
 zX/nLy00rSkuy7Czp23UsGoeH5Zla4Km9tTy52glBCwJrDoWKka3DlIEbCYrfxdVaaiw
 UxUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBp+sFXcUslAsEonJ0kPoHv45UVTi0oLezR4FjZ490NEYhLE/iMg15H58O3BxE7o7Sex+HE7LL4NJyXYwWNIhFN2/R
X-Gm-Message-State: AOJu0YxaWPz7zqKnrKviNLitUWnL83T7rpo8KQUQdC3YvOw7i1DgkHS5
 ROMgUYPmEh2vN0NPrJi2U48ATx05Ba6bFUOCrGuQ4AaKAzG9DD/JVJjBQT6OCBjRu6kLk4xVO8F
 IgFeu5Hj/h3SIxltYQ/3v2p/re+vRRBecskZkBA==
X-Received: by 2002:a05:6402:901:b0:565:9fa4:dd59 with SMTP id
 g1-20020a056402090100b005659fa4dd59mr6274481edz.5.1709562299796; Mon, 04 Mar
 2024 06:24:59 -0800 (PST)
MIME-Version: 1.0
References: <20240224191038.2409945-1-rayhan.faizel@gmail.com>
In-Reply-To: <20240224191038.2409945-1-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Mar 2024 14:24:48 +0000
Message-ID: <CAFEAcA9DUbXi8pectLuHx7c8v8jPbbJ=sqZ9yPYa7M-T7B-mbw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Add support for I2C in BCM2835 boards
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, pbonzini@redhat.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: GX0HI1Nzqf5L

On Sat, 24 Feb 2024 at 20:31, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> This patch series implements support for the Broadcom Serial Controller used
> by BCM2835 based boards for I2C.
>
> [Changes in v5]
>
> - Improper whitespace again.
>
> [Changes in v4]
>
> - Added IRQ or-gate for common BSC IRQ.
> - Added valid sizes to MemoryRegionOps.
> - Use version tag instead of master
>
> [Changes in v3]
>
> - Add SPDX license identifiers.
> - Fix a few minor whitespace issues.
>
> [Changes in v2]
>
> - Fixed and simplified writing to status register
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/481
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
>
> Rayhan Faizel (3):
>   hw/i2c: Implement Broadcom Serial Controller (BSC)
>   hw/arm: Connect BSC to BCM2835 board as I2C0, I2C1 and I2C2
>   tests/qtest: Add testcase for BCM2835 BSC



Applied to target-arm.next, thanks.

-- PMM
