Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp478879wrs;
        Fri, 16 Aug 2019 00:37:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwxZygoqLLv1UrcNfMWCQz9x6KHf32MniOGYj5XOM/PHPeaSFFbI4JP/02iZktC+FOzWIjq
X-Received: by 2002:a17:906:94d3:: with SMTP id d19mr8070420ejy.298.1565941054379;
        Fri, 16 Aug 2019 00:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565941054; cv=none;
        d=google.com; s=arc-20160816;
        b=0xQSZ5apm9VgGn98p/ctQyHxSef6EX3/56PCNI1MZ+cjuJsVroic9XCW+9w8qQpb/I
         bKnGMuC3UURX8Kd6H0rmSjumb9dVIUyGM6v9plfS7SOz3arT3WCv8qjXsuLLVqiVHrqx
         7dX9QxYGr2o9m0+2Lz43MRV07fRJDfKWGCZVOxSBMx/AWXX62GVinZ2Rk1lbPKS+Lq9S
         c+/ND+lxGZWD6+RLM7uWev+knGg1CH8Mo8kvKFFIC365BSxyb9aJ9o8btoHOo903aZRG
         462go+iqhiyrWhu/p7LXj/kt11LDvuwNZl3Bsf1UZYpegv+SQkZwesd83uoaV1uUzXMZ
         E8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=B6NXQRQeCGanV2ONUcT5078tmiJBI2SoR0Tty4lkfZY=;
        b=Tjxeh5IQ493or+Y/w/lTS+eaKQ+8zlBWTewnoNCxrpE6yKU5BM9qTtV3GrjXOanZGF
         dUMZp4GpzZll3isRDqfuXHma7BHq2lEXft1WML+zsfTNgtRx+k2wU9Ab83lVrZP1B7Yq
         bLXfB8f2q5XGV6TMBBhSdFquzIQopo7A9Lrukx0Qh3knScl3ja+1WEafIn2PpZj8bVEB
         +Y9PFBElPQ4yZfuzVwCR+eKq8AnMDI36DeHDWYOfMWZvwHP0K44R2kOJX53jlUQn74lu
         fQltSGajZ/8VxhT2R4xByD8zhCU0F2VW3Yxuf1Y103mo7NUjMZvoKz9NGx9JYDGI4Svw
         gSkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jUsp0QMB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s8si2639199ejo.45.2019.08.16.00.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 00:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jUsp0QMB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyWnl-0002bB-40
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 03:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rashmica.g@gmail.com>) id 1hyWjO-0006MF-5m
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:33:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rashmica.g@gmail.com>) id 1hyWjK-00007L-SS
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 03:33:00 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:33391)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rashmica.g@gmail.com>)
 id 1hyWjI-0008VX-Do; Fri, 16 Aug 2019 03:32:56 -0400
Received: by mail-pl1-x642.google.com with SMTP id go14so1809239plb.0;
 Fri, 16 Aug 2019 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B6NXQRQeCGanV2ONUcT5078tmiJBI2SoR0Tty4lkfZY=;
 b=jUsp0QMBnX30pUKSuiboAtI9oAK92OqbCK5G2vN1OzOj99VTuuws8X7w1Ki27dteMZ
 KCGcuAAEIoy0+hhWfvnuJrNrMhLaoz+sBN6aKdeE8aWh4L04ju3rQ/spgY9lZY2qR02N
 jyL/f7OO4a9R2GRW7Y8iMXXd4zkUt4AGEOFuTjG05biLoGasKeOlgwR/QlezmL0c3Jj6
 AWHEVVlkTxd8Hg4VSmNBuv3cdhw8IS3Rzi3iV5YRlTytIbZ/QGfcIzX5lDtHNK4iF8k6
 upoyrpaULdr3AYi+4kO7OX6DKRh/VGtD3sWTQWFzSfeQ+SNc5mThUKvk/b8DwFg2TAzL
 SU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B6NXQRQeCGanV2ONUcT5078tmiJBI2SoR0Tty4lkfZY=;
 b=acDTBmIdj2JAqKw/D/OvZUcuI8m3dWVui9cC9fR1nyABEZkeMpMDCJhVat/ZksICWq
 I3mr7/3fQvI1i5+C8HZpS1unUxXa0ankkdBe679lJJKUwOVokMT0npcbpB6OUxHEb5os
 TqRI6BN4XZUzUFrxZWLQ9BgalUrX6hRaiswsU1Tf2xdfY8GX92SlpCH+5SXW2YKXYNFI
 pt7F9h7Pm/XBKJqCYfngs9eG6STRY0khiJyRpffcyQwc11y5uB6VRUlokWvww9ILljDy
 ksoZI88hRB2bQ1y7oaOkkNutEjtEYvywTtd1gthf/jsYNH3KIw6XOXwSqqCQgUoC0ZmX
 xiDA==
X-Gm-Message-State: APjAAAX21QzthyMvab8Kbcl/HIbmUD4mlj9JVBIv3Dt8flodz6T0HsY5
 j4O0CeWRmxb+OhOgCX9yRRs=
X-Received: by 2002:a17:902:82c4:: with SMTP id
 u4mr8038206plz.196.1565940771859; 
 Fri, 16 Aug 2019 00:32:51 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id w129sm5638589pfd.89.2019.08.16.00.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 00:32:51 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Date: Fri, 16 Aug 2019 17:32:26 +1000
Message-Id: <20190816073229.22787-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH v4 0/3] Add Aspeed GPIO controller model
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
Cc: andrew@aj.id.au, qemu-devel@nongnu.org, aik@ozlabs.ru, joel@jms.id.au,
 Rashmica Gupta <rashmica.g@gmail.com>, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u0UYQKlg0oBJ

v5:
- integrated AspeedGPIOController fields into AspeedGPIOClass
- separated ast2600_3_6v and ast2600_1_8v into two classes

v4:
- proper interupt handling thanks to Andrew
- switch statements for reading and writing suggested by Peter
- some small cleanups suggested by Alexey

v3:
- didn't have each gpio set up as an irq 
- now can't access set AC on ast2400 (only exists on ast2500)
- added ast2600 implementation (patch 3)
- renamed a couple of variables for clarity

v2: Addressed Andrew's feedback, added debounce regs, renamed get/set to
read/write to minimise confusion with a 'set' of registers.

Rashmica Gupta (3):
  hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
  aspeed: add a GPIO controller to the SoC
  hw/gpio: Add in AST2600 specific implementation

 include/hw/arm/aspeed_soc.h   |    3 +
 include/hw/gpio/aspeed_gpio.h |  100 ++++
 hw/arm/aspeed_soc.c           |   17 +
 hw/gpio/aspeed_gpio.c         | 1006 +++++++++++++++++++++++++++++++++
 hw/gpio/Makefile.objs         |    1 +
 5 files changed, 1127 insertions(+)
 create mode 100644 include/hw/gpio/aspeed_gpio.h
 create mode 100644 hw/gpio/aspeed_gpio.c

-- 
2.20.1

