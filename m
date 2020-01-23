Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp237356lfp;
        Wed, 22 Jan 2020 21:26:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUT7hBtoFoHZs29l5wOxvyul7dfBZaLtwajMaP49rKHBAxHv8owPzEse+SFQj7CCSjiODc
X-Received: by 2002:a17:906:14d5:: with SMTP id y21mr5434149ejc.212.1579757170482;
        Wed, 22 Jan 2020 21:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579757170; cv=none;
        d=google.com; s=arc-20160816;
        b=STCIOSP6WxbojL0luIyUbpVJuey61f4ENsTdjIfA9u0WgQWDdm0bugceCKlDGtq6d4
         7XWs55f74waMK0Ax6oDc1sNhh+LjuUFaODvPN51+LKM6fqjoaapCLwkf/4FkKx2IUW8I
         MlVLStwAG96u7UZ5nHujl8mdaw/aKcC0ppK09c2mtMMj7bGECA3TqxtzLvOaUTVPzJmf
         xoSCaza3wU69EkrmeOAvGeAFW+4AKBG/rvpkZdpxbqSu2lJwzhNWHv/4A7ShaGZPeRwY
         YuyTw3UxVgDX196/3iYaGEsZ+cTIV4dfsknMTBBKxwfREU0cYmbPRaev6pWpmH2xaZac
         IVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=2duhfw96sX4LBq6GDO3w2q/itW+l/UJOYIKKmbqgxFI=;
        b=h1UXceOzyy6ugxsgdyY3VH4iigGXtY/t2313xUYPYT77Ne8vLlJoYN2qPAJ7Jfn0Rw
         oKS52OClkzI/XW1BR66qhUQFDBoR29U5+3U7AzeiBWjfFId50VhMdCGJyZeuU8XLCOET
         u/fL8A/UbPv77H4XPbEDHT/b/4X0fPuMfsgKWtKTnXdKxvibuDWW52bgNpMMHxODIYsy
         vBJ3Z9/ix4PH6f6//PoV+YFqWyJzqclG7dYGoNijAhxYWd2vrR59w7DlMl+vFcoZbsij
         PYL4znacuobgXB7Y9uQrMnOH9Mm6ILMnEkiLcK7oTbrCtwcM9hwjs2+UEANjjSyK5IJc
         W7dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XbIELcrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17si504078edv.553.2020.01.22.21.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Jan 2020 21:26:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XbIELcrU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iuV0L-0004cJ-8o
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 00:26:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42071)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1iuUzz-0004Z5-Bp
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 00:25:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1iuUzy-0001jd-Bk
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 00:25:47 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37087)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1iuUzy-0001iq-4c; Thu, 23 Jan 2020 00:25:46 -0500
Received: by mail-pf1-x444.google.com with SMTP id p14so978577pfn.4;
 Wed, 22 Jan 2020 21:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=2duhfw96sX4LBq6GDO3w2q/itW+l/UJOYIKKmbqgxFI=;
 b=XbIELcrUceOkmOeYXmEhPNhiHGDWMhs/oW2NBlUPu//SIjWE+M48kdvIQsUl0CGriS
 I1QszDNHaJ8CL7mAYHHJKf6xeZAw6/Zhp+LGCnYoECl/+vv1AN7vNkoBdgJMng5VkODm
 2s2DmNhkVRZYmIeeG7bVftPV3Q+CQha/XGarebg7JVhDCV56QfpOFRxsNhp4T81nNKOb
 izBqwa/y7q/JYqJXs+S+XCKbrWfSbXsw7llakl0zv5lJYq5ep1gIxyRh/Z9GiVt7bxYv
 zjjR1IVj6GgkgTEqQg7ODxxoI0G/EebY6B4/eKqBcpg+lOYGhMMoLOiz8docz+Qgr9kc
 Sn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=2duhfw96sX4LBq6GDO3w2q/itW+l/UJOYIKKmbqgxFI=;
 b=FT6Wtbj6Jp0cJlKysu/+zEl75qqw2ZScWmvagv9FybBT7g+wRbdUfg4v8BvAN5OEvZ
 D1wKuigl7EszxDiPSb7VHnRS9NowpiGpJNJ6FgGT2Yj264FQs4vWlKHm7uwa7L58+X2o
 7DVU5B9WhBnn1Ae71cNpzsHsYDo/Y7N+rEzfmgzdWszhHZNyVe+fBThsUcDAN96NMk9d
 F3wA58K7ocHIneCt8BYn1aJVb3c7d8jymuUJ2E8okUQrrAXj6FwdwLjTHnyUKIa++ZbF
 i78Y4wht3O+F6RztiS1ozf1lU8WYIHjiwGp76UMFrG8YZcq6GP62boyVfCaAaeHe0W4/
 nXbw==
X-Gm-Message-State: APjAAAXUVJLdDMGPvMwNLCC6S+eh7z4XSliNn0o1DGoOJbPmfBITpljO
 xU9XUugiUaRvdPrdxfwlVBQ=
X-Received: by 2002:a63:ed48:: with SMTP id m8mr2059270pgk.399.1579757143993; 
 Wed, 22 Jan 2020 21:25:43 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id k16sm763630pje.18.2020.01.22.21.25.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Jan 2020 21:25:43 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 0/8] Fix Exynos4210 DMA support
Date: Wed, 22 Jan 2020 21:25:32 -0800
Message-Id: <20200123052540.6132-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EqQ3IO8+D6ut

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

v3: Increased number of or-irq-lines to 48 to support the full number
    of lines needed. Simplifications in handling UCON register when
    handling receive timeouts. Don't save timer state in VMSTATE.
    Added Reviewed-by: tags as received.
v2: Addressed all feedback comments but one (see last patch of series).
    Please see individual patches for details.
