Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp464157ejk;
        Mon, 29 Jan 2024 14:20:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFppF5gCmSm6zQcmNpfkWSJnCbQuN0Vf2vH1qx0y1+jm2fOmNYGELO0eGMxcVUm+0ywsf7F
X-Received: by 2002:ad4:5f45:0:b0:686:aed4:396 with SMTP id p5-20020ad45f45000000b00686aed40396mr7443927qvg.88.1706566820573;
        Mon, 29 Jan 2024 14:20:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706566820; cv=none;
        d=google.com; s=arc-20160816;
        b=y0QFHAKVAMW0PjSOziMgZTgMW1o3XoESQDfJfYQCERYpM2GYfKfA9HMyyJs8FRv8/n
         b9tHFllzFmWn4kbr3ePZ63u88po7bOnrkBDiNgxVQrq076nIFjUQt5XwCGnHSw0IUQpD
         3kmwlkXLk8ZG6KXWJOO/R7yyKvO3sHvzwNWjes5gddlNX/0AhsL9TP5lhQU0Hd+uNbQq
         BZb1+ZoF+GVKnoBlYMhXJqP3+iD240gX3zpgZ7+Epet67wyiY+DwyVOchSCjhtKmzTlX
         IAGehx2zAtlUyT5/fL6+G15sqTY0HLw+dTEoxyNEEzZOg4K2Zc9tEfBSlc17Rbv5Kilq
         hsOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=nzn8IIaY+k14r5GGSiVU99mZ7IVSK6EhpOMu+lBWQow=;
        fh=4MpYe3g2WjWqUr93l7JvWw+qx/t1yDCg/+zCriEMnZ0=;
        b=jq1+2Y/pm8mLPYBzaZ7rAsZ5qWiiZ+eyx/Lq+ofGqWJTexFkRTbzLP3daExnwq0GCl
         pRR5dr75uNyLGl6kFNek5WNFIf7hg9rrj+kkCB3D2yGo4paOWhBd/nmGmJWoAXiwbPVJ
         ybtgc//1w0pLU+TtE2uu4IpcDyPluQBlv5NqK4gaNH1gw4PVPpWocJ4majMTC20lga17
         5+AH44rpNqzrSzo+JUqyFmYpzt/DzB9O2Yr88RZ4Mo65wrDTq22j1z8lEQVVGROyxbnx
         bS8HpTBqLBBr5REb3Y8sZ2raKPcTLUTEuIfINkI04YfrCpqi+De4XSsOmPtlVc0R1SX5
         ngnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PMoi221o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm6-20020a056214268600b0068c452b8f8bsi4964151qvb.346.2024.01.29.14.20.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 14:20:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=PMoi221o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rUZyl-00014J-R3; Mon, 29 Jan 2024 17:19:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rUZyk-00013o-6D; Mon, 29 Jan 2024 17:19:46 -0500
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rUZyi-0000iN-O7; Mon, 29 Jan 2024 17:19:45 -0500
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3be8308b3d3so361290b6e.1; 
 Mon, 29 Jan 2024 14:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706566783; x=1707171583; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nzn8IIaY+k14r5GGSiVU99mZ7IVSK6EhpOMu+lBWQow=;
 b=PMoi221osJsrbvJWsdo4qKWO/wJ8dQzF217LdEyyDc9SsQGgQuXbH8sab7h0e6fLba
 s4T4Bb4urSthhx/Sp/v9VApEZVtBh5454JMOOEGlIrFphoRpxFiimR4U6xJY87gWedaT
 mXQ98jS53Cfg/bFgaZrJptKIZJTI8kExeLaIRGR+Xm0zq6TFzqpfLR5e1wlC/9oFb2Yj
 +dy9tzuvP/1YFW2PIgZqRZrT4wzivyjb43B7ekxC+IRIOsQj9g5nRtKck6HRqKw0tMH4
 Rs6cvwVMGKdjp/RCf3VKvwFoEnXnOJP2AJKE6STT4kXW5wpe9x7+euXVzQRj8h9PXkGQ
 QzMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706566783; x=1707171583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nzn8IIaY+k14r5GGSiVU99mZ7IVSK6EhpOMu+lBWQow=;
 b=KGs8w3FZvOFXaJfuDOCfXv/wJniGQHhlOJMSgnytgC9LJkVw8IXCGUmct0sNhA3S3B
 bR1LPc+B8SkvLZSQWZs4UPbzSKx1HVeUEPNgDDJA2elB5AZlmSrlqVGLq1iYnxuuRxXw
 UagrMjrs8QdPux4MCBsFXKE4CVMyKooguK56tgbmAdncS8xOc6mWNVwyFWiEpEN07i4H
 ndt7HEFluidE1fx5I+mVQ3wVvDjfyukyiX+ciy+8ZzbB0IOc5S4qRDM0XqC5XrKoHXpu
 qyDQJpBwQeyMcAhH098APdpGpqwTf9/fEC44ykFLdP4EOnrayhxPOsw1gMhzIoZc3W4C
 Tm0Q==
X-Gm-Message-State: AOJu0Yzij0Nv76gbPyXkDsfdxHcXIGUd6jeBU47MIrv4d9Zg7/Ws5uy/
 rgMWViJSQWiWB4++TZBCBhn2wuartAvGS31wUgGtiZ241afUZY5r2a2/nvW6zG+uaw==
X-Received: by 2002:aca:2407:0:b0:3bd:9aed:90c3 with SMTP id
 n7-20020aca2407000000b003bd9aed90c3mr5744298oic.58.1706566766649; 
 Mon, 29 Jan 2024 14:19:26 -0800 (PST)
Received: from localhost.localdomain ([49.47.195.100])
 by smtp.gmail.com with ESMTPSA id
 r19-20020aa78453000000b006ddc1ae04eesm6353084pfn.192.2024.01.29.14.19.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 14:19:26 -0800 (PST)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, alistair@alistair23.me,
 pbonzini@redhat.com, qemu-arm@nongnu.org,
 Rayhan Faizel <rayhan.faizel@gmail.com>
Subject: [PATCH v4 0/2] Add BCM2835-SPI0 to BCM2835
Date: Tue, 30 Jan 2024 03:48:06 +0530
Message-Id: <20240129221807.2983148-1-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 1WdoTUUBV5zO

This patch series implements the SPI controller for BCM2835 boards.

[Changes in v4]

- End Kconfig file in hw/ssi with new line.
- Fix accidental deletion of code in bcm2835_peripherals.c
- Fix stray whitespace change in documentation

[Changes in v3]

- Forgot to CC maintainers and mailing list in cover letter.

[Changes in v2]

- Forgot to CC maintainers and mailing in the patch series.
- Sign off cover letter.

Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Rayhan Faizel (2):
  hw/ssi: Implement BCM2835 SPI Controller
  hw/arm: Connect SPI Controller to BCM2835

 docs/system/arm/raspi.rst            |   2 +-
 hw/arm/Kconfig                       |   1 +
 hw/arm/bcm2835_peripherals.c         |  16 +-
 hw/ssi/Kconfig                       |   4 +
 hw/ssi/bcm2835_spi.c                 | 288 +++++++++++++++++++++++++++
 hw/ssi/meson.build                   |   1 +
 include/hw/arm/bcm2835_peripherals.h |   3 +-
 include/hw/ssi/bcm2835_spi.h         |  81 ++++++++
 8 files changed, 393 insertions(+), 3 deletions(-)
 create mode 100644 hw/ssi/bcm2835_spi.c
 create mode 100644 include/hw/ssi/bcm2835_spi.h

-- 
2.34.1

