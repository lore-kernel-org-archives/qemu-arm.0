Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp283615ejk;
        Mon, 29 Jan 2024 08:22:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHN5VCyL5hhJ2oDeJxBuDDxbwoKpM/Aa+pZRx0ccmLKyEqasVFUCZwpxj3B82O02Bi8tvsk
X-Received: by 2002:a05:6808:d9:b0:3bd:c15c:23c9 with SMTP id t25-20020a05680800d900b003bdc15c23c9mr2937372oic.55.1706545323406;
        Mon, 29 Jan 2024 08:22:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706545323; cv=none;
        d=google.com; s=arc-20160816;
        b=m6nQxWqKW02d1RqO36kyZFpgUQswtxoWpuZLnFLaiK1p0xf22X9KMGw+mFWFNcMhkD
         E9p+M8rG0EDImrNarS12BBgHQSC/p4Q9ZgQQv7Eunqt7CXvlCIgP7Nh1zLUX64l0sUVc
         uNO1rDJXOnqzZZq7c+dkHrzc6mn0R1OQUWVxZ7Jg49Ht5JaLC2n3wntQKyHZm4mleVTs
         Vx9rYdb8gLMlGAE+5cpbm465XfCl8e2dAZnxLwUnRtpL1+URcgFR1INGkeG9WS87uBYB
         w1gRDjK+jvulQ1Ksgo3u3LYYRx5AyrnSniwB1u/6ygBkwtg3K24pOfx7OjAN1PtRHMcU
         a18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hOTTH6nrrocKdYrOWl6KvQ7eQwW7Ni2LFEsyt7wBAPM=;
        fh=DFTE0r0fboffItx5adcLUTqOoo9YVNLEtuGe6Ejl51M=;
        b=euHKxLbCFHOFXclUnYf2ixJaDExeaW1E4QRY918HVVXtlfPVFkV0DtZ0DVoGsKcGHW
         9LLj1iJzAFOJ2fO9+VgLuuaUcjSpXMgFvXpiYDwkJ6zTHagfzXY3ApJPbnBkaxYmxAHM
         OFi1WZfZo0h1E2rHJK7PrsZKOFE6ZEcLTmaHxLOzRANumILFu5eAXsxqQ9XZpZk9r3JY
         tliFa9aB8zwOowQyS0hB1RQ1Ln+Ry9VhY6L0JSoB+aO28idGnFzpHYXKyTgGCyAkFFzz
         VlTYXzDvySWR8MgXXFYANy5DrUtGFBfcUAwdmI+r3Hey+16tv2rlm+tDl5Y4VE4YTul0
         w8bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OhQT2bKJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a26-20020a05620a02fa00b00783f957a2afsi3051552qko.537.2024.01.29.08.22.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jan 2024 08:22:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=OhQT2bKJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rUUOR-0000Bd-Ea; Mon, 29 Jan 2024 11:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rUUOQ-0000BM-AV; Mon, 29 Jan 2024 11:21:54 -0500
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rUUOO-0005kH-9X; Mon, 29 Jan 2024 11:21:54 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-59612e4a21eso1004073eaf.3; 
 Mon, 29 Jan 2024 08:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706545310; x=1707150110; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hOTTH6nrrocKdYrOWl6KvQ7eQwW7Ni2LFEsyt7wBAPM=;
 b=OhQT2bKJ6+zIxBEMYc8qfQmbJ1ZebTxFxdC0xKfC9N6nu7wAsbLV9fxiUoNrkpnk05
 6NsB3S5wvl9OpbusGmVMM1WDxDcucS81GrYR6s92ilH1i7COOAFC765dUmapUXzXFyEY
 lSj8/Re1s4SZHFlER3B/uObqfiffMUM4lLMtO9ZvSCVOSaMHAYZiCiLwM8mPx+8PVlw4
 DLiQusNHml1enftPh0XoQdxnhzg71wCm4clJ57d29wcgUFCqgok2C+PQciunGOpKUsxL
 7OpaZxfZzCQCdTd80GG4tN6JV9mW0E8DICWzQh3gwYdnqi2CZlDhDV3Pi75nZS8Uicqd
 yyXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706545310; x=1707150110;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hOTTH6nrrocKdYrOWl6KvQ7eQwW7Ni2LFEsyt7wBAPM=;
 b=sw49dGncsfeWlvwoOryNYvkWL/bf6RyRFQ2orLh0H7u3CDu6/VTMw3i7SUGaCNNpA4
 q65N7Em7CfE/aJ1bOrK50Ort+uXbXh1PVaT5DSCS6VnRcQrUw1xeFNSaQLM/CIMmDq3k
 FPg+imUVkdsSF+Wp7xsXBTO/3k4x4SgoxJ3e5w+sXEP7VwmIIBw/tfaAQwJEOuh0H5n/
 lZvSnnfd6ePmjtxpRDctlETBFnSQkg+mof4jSE/R4M7WEMcRnea5SWI+Z4YhovTK+ojm
 EK8G0ZDWR4HqWCjs/FOK7QKMpNwsz4p6l5LCrBu+vXri+SXHardpHOPzfCb9AVzIJVhi
 hhRA==
X-Gm-Message-State: AOJu0YxMxVhNFkuefIngO3ck9LYS9uPoaREFBz5S2EdApLJAOTSOoAje
 xCtu/mPvRO5qauDjJ17vlWHc2J0Ngkx9hCbPRKSXEVpr2s4McZnufdcdQCJLryYbjg==
X-Received: by 2002:a05:6358:d59b:b0:175:a3ed:f630 with SMTP id
 ms27-20020a056358d59b00b00175a3edf630mr2122918rwb.39.1706545310173; 
 Mon, 29 Jan 2024 08:21:50 -0800 (PST)
Received: from localhost.localdomain ([49.47.195.100])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a63e650000000b005d553239b16sm6241339pgj.20.2024.01.29.08.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 08:21:49 -0800 (PST)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: rayhan.faizel@gmail.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 philmd@linaro.org, qemu-arm@nongnu.org
Subject: [PATCH v2 0/2] Add BCM2835-SPI0 to BCM2835
Date: Mon, 29 Jan 2024 21:51:06 +0530
Message-Id: <20240129162108.2782082-1-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: a9shqQC1GNS7

This patch series implements the SPI controller for BCM2835 boards.

[Changes in v2]
- Accidentally forgot to CC maintainers
- Signed cover letter

Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Rayhan Faizel (2):
  hw/ssi: Implement BCM2835 SPI Controller
  hw/arm: Connect SPI Controller to BCM2835

 docs/system/arm/raspi.rst            |   3 +-
 hw/arm/Kconfig                       |   1 +
 hw/arm/bcm2835_peripherals.c         |  17 +-
 hw/ssi/Kconfig                       |   4 +
 hw/ssi/bcm2835_spi.c                 | 288 +++++++++++++++++++++++++++
 hw/ssi/meson.build                   |   1 +
 include/hw/arm/bcm2835_peripherals.h |   3 +-
 include/hw/ssi/bcm2835_spi.h         |  81 ++++++++
 8 files changed, 392 insertions(+), 6 deletions(-)
 create mode 100644 hw/ssi/bcm2835_spi.c
 create mode 100644 include/hw/ssi/bcm2835_spi.h

-- 
2.34.1

