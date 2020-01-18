Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp619864lff;
        Sat, 18 Jan 2020 08:42:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxXv0Ac7mcpMLRFsKzCqqa5wQX9g4UbjWMbzFHPWY8E67vRxRHRDHVG1CGS0HYQn0wrdD6k
X-Received: by 2002:ac8:5313:: with SMTP id t19mr13056906qtn.375.1579365765772;
        Sat, 18 Jan 2020 08:42:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579365765; cv=none;
        d=google.com; s=arc-20160816;
        b=sOxpC7daweVbNWINwfUbWCJ6FbTJmt6XxFwVPhZoeY2fqxsCv1JJvugLGGVQdTAoC0
         jmIhE9a+u6Cj73yX8+bp8YdmKibSXBWC8SJdGJ6qa9rKZ8qs96idOHvd/NO5i/Rxi2LK
         RQqPFWafZ1T2wgbJ2wcNj4zHKjHE0/WPTnnDA5LZd58UmrJJWspcffmcD+SoL+Hgd/7G
         i2BfY7DPRcA/ZKsyycFr8Sfg33LyHKswIRNPlxtRGVqi0LzeGroCBkn5Gbd6oYkGlxC9
         3sj/lYpO2D+ObmyXMfvbmJ1ffMBbJC5Md/3v+rVuUh60IktCYW0jh/35VZoE63EFp4Xg
         +KNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=nPqd6PZ8sC+NVZHb4o0W07SjU+hF6Ok7k2NBcMjqx88=;
        b=ixxd0X1FrWAv2NGH0Bu2Cb3cQDGO/VOGuyMQ26nKe54AWjhHoxDU3EC698uFSzI/xy
         BAkdPnQJxFIHhUno1wP5vJfMdgXYPEyXvH0UEOw3r02xuSzjkLmvCIjyo7nc0rsfyOHE
         EWlocgCiOP9DHsSg5rHVIxEz3J7SF9l/vSKgJC8dfuwd4m8KA6w5Y+uspl1RYp5+/d1Q
         F3xGyshocUsNH5lX3quEvkWE0qaZ8x+7r4YeUu6M5UzkEp3FkAdtOaKUn3s1wJy1KLzt
         c2KVzNNNAMvn7UOmN9MOumWHV7SG4aQtwUQne+I0AqJiaEw677t7eZ7wc7J9YWQ0rwm1
         xO8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QsZ7eGny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21si16724203qtb.174.2020.01.18.08.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 08:42:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=QsZ7eGny;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isrBM-0003we-H4
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 11:42:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36061)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1isrBD-0003wX-33
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1isrBC-000212-38
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 11:42:35 -0500
Received: from mail-yw1-xc2a.google.com ([2607:f8b0:4864:20::c2a]:34794)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1isrBB-0001zy-Vr; Sat, 18 Jan 2020 11:42:34 -0500
Received: by mail-yw1-xc2a.google.com with SMTP id b186so15873924ywc.1;
 Sat, 18 Jan 2020 08:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=nPqd6PZ8sC+NVZHb4o0W07SjU+hF6Ok7k2NBcMjqx88=;
 b=QsZ7eGnySVkNno1lKHqJtYVl9EW24gb8qqz0IuaTjfxW+8w+C5+baAW7NZUjChwz4z
 OIPwomRG3sWveUBZiML4CJRaTFbGecVfBpsUVBxiPpboKbUn6uaKlJpIQQNwkttkaHeH
 u1oN5t3VqtatZgxWozsdXL1gdM5jHLSSBoEmlA5fP8vvRvLGLqzYOBgqruR4ipJk1No/
 Coyu7wfKbteUlRYFnjgk1C6dM0J7L9FCdwdzE8yifDBYgDGuT8etkD7ICn3E3jCIgP26
 kNO3lAr9PtgS15xe+wAQff1vTR5WUOanXW1h1aN1EACYCg1JVsgqIdGQcIKh+q49MtMJ
 LJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=nPqd6PZ8sC+NVZHb4o0W07SjU+hF6Ok7k2NBcMjqx88=;
 b=bFVIxDpUfZshuJGRMViVXb/KsQ6CkLhc7S4f58EaUfPitBlc3HLkOCd6AU11tO8TQo
 e0ADmOs/snWqUos4GhauZ5ssMa7HfWDehix8iWUXymBJUtjap/eYgmxTtdcFuF1A3PA2
 +wHTYe8PK1oE29RxJO8KzCuEQPEqDQfIxo7os6ndI2Dk9jfdUkkHddce+XiP7wqywzz8
 5Hf42yuHbGzvclotRQeReiZQMHNQJvl4poE1TpjaZgTIVrgHbzmiwQGM/jq+V/p2fsFU
 KJa9VKgGrpsKxWJ3A4enLFfbVJ2l5yJ2Hx/AyNNeT/wMAvWgImz8Z5NHsMItttD4MwRq
 NuPg==
X-Gm-Message-State: APjAAAVzilaK7ziNZ94hAS+IuCFKDBmJ2V4jnCSLyR0568S5IcHZ060m
 MOxh0SA7a2mMb8XpkmijWDI=
X-Received: by 2002:a81:a210:: with SMTP id w16mr35028944ywg.261.1579365753252; 
 Sat, 18 Jan 2020 08:42:33 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u185sm13202479ywf.89.2020.01.18.08.42.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 18 Jan 2020 08:42:32 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 0/7] Fix Exynos4210 DMA support
Date: Sat, 18 Jan 2020 08:42:22 -0800
Message-Id: <20200118164229.22539-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c2a
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WGMOIvi0RtD6

Commit 59520dc65e ("hw/arm/exynos4210: Add DMA support for the Exynos4210")
introduced DMA support for Exynos4210. Unfortunately, it never really
worked. DMA interrupt line and polarity was wrong, and the serial port
needs extra code to support DMA. This patch series fixes the problem.

The series also converts pl330 and exynos4210_uart code to support tracing.
While not strictly necessary, this was very useful for debugging,
and it seemed too valuable to drop it from the final series. Similar,
improved support for receive FIFO handling is not strictly necessary
to fix DMA handling, but I initially thought that it was and added the
code. Like tracing support it seemed too valuable to drop it.

The series was tested with qemu's smdkc210 and nuri emulations and with
exynos4210-smdkv310.dtb. Without the series, the emulation does not react
to serial line input, and serial line output stalls when using DMA. With
this series in place, serial line input is handled correctly, serial
output does not stall, and DMA interrupts are observed and handled.

v2: Addressed all feedback comments but one (see last patch of series).
    Please see individual patches for details.
