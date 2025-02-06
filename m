Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1692205njb;
        Thu, 6 Feb 2025 09:26:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNOUR+d5DXB2eHgTWykagjLvzn8QfTOIfaHOAqgBuZlMuzEgl4+M5b34PyP1tR6ylEvDlZNKr81k8rhg==@linaro.org
X-Google-Smtp-Source: AGHT+IH/j+CsJlworD9PDKLiTM+0QpdtleXQeOkMD5cb1bKh/9kEr3vwzICKLz8CBbRZV0AKBGJG
X-Received: by 2002:ad4:5c62:0:b0:6cb:e648:863e with SMTP id 6a1803df08f44-6e42fcaed95mr97423306d6.43.1738862777426;
        Thu, 06 Feb 2025 09:26:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738862777; cv=none;
        d=google.com; s=arc-20240605;
        b=SFIsyNrcQostqUc5giSqdCuq05/aY/sU9Gh5EMjjWX8sfY7p30pDeM45aPzv5e3geW
         Rrjs2mqqH2E197BKIEoHshE89orcJNSXjOnMnn9txnjvjt9zyIfrVdld7eCEI1/JnSoF
         GV/ZIz4jrUZTi5Q6dZoJoGQWON4/0H4MJ6efatb3cpvOwvluxiPMw69LOYTEsE+UenV0
         pAMXiFuIubZfqDr+4gK3iGTeCW3G3ozuBAxl7Is6HhN7kG8CeNDyB3RYCr9+xRrWO8Mw
         YnMSpIRVHyEB3XbHeP6CVWN02m9apvT/QTpwdDBw+MWpWgO4SF2hJjq5FwlNpiprfdj5
         jBsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8hBbwUu0fn6MeAYbv6ppKP6HaGN0VsGK/e1ezloXiG0=;
        fh=9R228b9//eerPboaB1557lUXl9KHnsqJO5vyQVpJ3HI=;
        b=FJQkbnDS9oyAVpqPo7J8Zcexbgp5/8DT4XmHeBJAvmHY50NZ/b5jG44yAsqwqN2xXD
         bI+gP5HR5ba+NY3oL8DTFRdnlp6DuZIRuxlWp+z0gjwDeMdy8BLihfjvVqLfo6eX2xXU
         5iI9botATGHo5lvE4KBwl3ZLAymvgR8mZc4iCDuTUFfv8ETbiVaJ9VAYbNCsxogBeVSY
         3ILjTyjRNll2cz+ZN2Ehnu9q8MD2zAg8ARhUz4apjk78DuROqMiHfVVPeK5Xi0nvmAB0
         CPAu8YwrlxdJHRBmiDcTW1FHpSdenU6YGyIo1x/z+M42Uax2888M6561oR7Vung8XhIb
         AIOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYxGnNyq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43ba2d60bsi15135596d6.56.2025.02.06.09.26.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 09:26:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IYxGnNyq;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg5d5-0003Jw-1c; Thu, 06 Feb 2025 12:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5cz-0003Ib-6p
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 12:25:25 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5cx-0000CF-EH
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 12:25:24 -0500
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e3983426f80so930391276.1
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 09:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738862721; x=1739467521; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8hBbwUu0fn6MeAYbv6ppKP6HaGN0VsGK/e1ezloXiG0=;
 b=IYxGnNyqWAQ++O4R7XFAcqEObboJI9QwydZbr0pB2uFbr4PK6srb1g12atqfT7/G3T
 iNCndLUAnACqkBz5gRKwWUGWJunZagemVgVJh5o4098EGQ1daiFYVw3CylGRth1gKkXB
 XF9/doovmCu8IC2kHBy7+vB0slom9ZDkJ3Mhgy1FaNhfUrTvi0x4+8Pbp+QdvQ9fjahN
 UEzcUfAKCwY/oDSAdMT/Z4Phx7YAIGsP5noOJ+GVjn6xYBFwh+KL+AHiI8I8y74HJAYY
 XO59BrvwW5Nn9TGeviNlnwQym3lbmZFGD40g1v8JnslLHalKgVI1zZmfTr4Lv8ZyWp6m
 XpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862721; x=1739467521;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8hBbwUu0fn6MeAYbv6ppKP6HaGN0VsGK/e1ezloXiG0=;
 b=QvLRWeBrICRyHCM/BmmkQs3wEJJMPYWSDKa08h0X86eDCKPCXlx90yKdIJedmdQE21
 GtAAQN+MvFba545Qj+LzS1RkJrFANMadj8uum06eJHIPoeAjo+ozq4lDZMl1xdq03bM5
 OZ34FtDTucG7IKgxmdNuFRduKoldOd82T9v6jsbMXGGAcRnf52/vTDiRGJk6OcjgBRtZ
 303+AoSfJBwPxBKwNi8DE/9D/BPt0VpMAASBemFXAb65psTVjlUTanhr2poIhp4p6HdV
 3mm10Ry0Y/EdOD0SoMU2ZZAP47E6WtyAX6/bB6Sq7hWy0Eqt4ICLgZpOwfgb6m+/Tnz+
 3kJw==
X-Gm-Message-State: AOJu0YwMNHtfLfm9XoTeGM8voxJQPXBPb9MLMr9L5sEyBu/df7EjPgv7
 aGKmKpjJd3J+fpRd1VzMJma8DRLI0XP2qxlHx7gmhk0gWB7KkkeN0C5RP2UdIYBDsvPg5kd0yvG
 0o9ys9RkZRkAx1/E9F02mBpj/GfXHUbfqFQWZGQ==
X-Gm-Gg: ASbGnctpx+syr5/BIOzk9BUH3i5IyC8ICisSKTYLMgi3fdf1O5y4HGyOdTVEPapl2EF
 9TouKfbVYvoPeRE1Pahh2mudav8xanbeO+TwoU1flb8PhOZaxvi9n207Bsm3sy1euJE37gRJ8nw
 ==
X-Received: by 2002:a5b:d48:0:b0:e5b:3af0:d4b5 with SMTP id
 3f1490d57ef6-e5b3af0d646mr1608649276.34.1738862721266; Thu, 06 Feb 2025
 09:25:21 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-8-shentey@gmail.com>
In-Reply-To: <20250204092112.26957-8-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 17:25:10 +0000
X-Gm-Features: AWEUYZnzzvwxN47FLZpOw3kYwzVTT5r1VCrJutji2PKNOIupwlQNbe7f3hbIGq0
Message-ID: <CAFEAcA9dGSSOhAXE-Tu1hwgJUakkWe139LE3ORmXt=8jJd9HWg@mail.gmail.com>
Subject: Re: [PATCH v2 07/18] hw/arm/fsl-imx8mp: Add USDHC storage controllers
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hChG0iS2MQ0E

On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
> The USDHC emulation allows for running real-world images such as those generated
> by Buildroot. Convert the board documentation accordingly instead of running a
> Linux kernel with ephemeral storage.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/arm/imx8mp-evk.rst | 16 +++++++++++-----
>  include/hw/arm/fsl-imx8mp.h    |  7 +++++++
>  hw/arm/fsl-imx8mp.c            | 28 ++++++++++++++++++++++++++++
>  hw/arm/imx8mp-evk.c            | 18 ++++++++++++++++++
>  hw/arm/Kconfig                 |  1 +
>  5 files changed, 65 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
