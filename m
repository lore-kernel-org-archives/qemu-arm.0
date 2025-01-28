Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3006087njk;
        Tue, 28 Jan 2025 02:46:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUsHDzWcSO2VaR7iXQ23fbV4TBwGD/tb1HjQ+Rxka3gpbYzP/nAh305FnbusXLPJPChRz4nWfbS4Sdgrg==@linaro.org
X-Google-Smtp-Source: AGHT+IH2hrsAHhPYvCl0IsLjV/CqQwpC568MxTObEOp11SQOXV/W/EMKuWvO2ZIvtiFlp/ru5fMb
X-Received: by 2002:a05:620a:4447:b0:7b6:d4a2:f123 with SMTP id af79cd13be357-7be632199c7mr6388431385a.2.1738061194532;
        Tue, 28 Jan 2025 02:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738061194; cv=none;
        d=google.com; s=arc-20240605;
        b=B5A2huLmLKNy/xZZjxc2AUCoprIXIDpYEu32mIeYvihZomYmOd0NXymKf8gF4fustg
         VAuuRzIpOfZQtEKPXJFGe8xSnU/RPLRc4TqppuOL3m10s4dbhk7/mTQlnbiePoPGmYO2
         u+ynfeI9GiXnnDSICOovU3xfXq7iLGnH/Z5zAroWkMVp8EfVdmmZ7i8GdxR0Y/P2ICW6
         KYwY1Ejvm5hu485E99Z0iPcBJybSShXD30UWv54rc4XFQPiycwANjBkZGkSNErkM9wa7
         pxRDgONym906//vZMhSOpkLfyJ2HEVkQh1n7UjDp+sLgpZwEY8/bFyxOOOBxJNZDAcKl
         WOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=dRwvcaraC/scDv+rDmHLiP+gKuIdNL5huOLcky7sR+E=;
        fh=+G2pS+eHXkXmiTvBmAfp3MHxpcQy3FOKsTHIyiZ8RcE=;
        b=N+uMYmdpiJNmQwx9Lr/Oq8EiYR/euaa7RITUCxbuRquJmSKN+O2NijvDjUKnHNV3XZ
         XISVKyqGLovBwS4VbVi9YXXJytS4sCae6M+sOn9ZXnm4xeVcmH3OSon6Z3GXauphyfGj
         WjTIht+J1wmEUwRp/1BnjkmNApOuTqjrNVq6U1jUhSl2D+2O/8rmWoro0dr+VlUCvdbn
         yuuArRgMMXXIaj+OR+PNnNqBVtQ5YFbS+oO1mb/3gxmojIv8+UDw+Ytt/kUfqEkcXiza
         80reVBag/NnTmruxg3AjryHNaz3ByyMP/jFUYfdcuWBztr58gQR3+5+GKwOQr6tS11WI
         0PUw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTjakx5n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9aeee184si1221214885a.437.2025.01.28.02.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 02:46:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lTjakx5n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcj6R-0001FS-Q0; Tue, 28 Jan 2025 05:45:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj5x-00017M-FK
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 05:45:27 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcj5v-0003Uj-22
 for qemu-arm@nongnu.org; Tue, 28 Jan 2025 05:45:25 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385dece873cso2917490f8f.0
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2025 02:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738061121; x=1738665921; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dRwvcaraC/scDv+rDmHLiP+gKuIdNL5huOLcky7sR+E=;
 b=lTjakx5nICWKTRkb8z9V2KAVdlWVmGkMzcYgj2znIz+SoKAROjxY5njOew+3npW1tX
 cZeKSFK+rrCDJ2ClxvdSm4RH9EzfG/wzGWN6leC2s14SMFu93uXQQGz7YAFoelPpxVD/
 gZIYcr2pEnBb1YtqXUcwj1EaH2tSgEDrLvmmuiClfCeYU+v99BLXqfgXW2znyao46wSx
 OkqFK3wHvVbKDhfjPHQeV3chTsVxuGOWb1AY7euy56gqpmhR+jYICAqICbdmkdacaU97
 Bx27MxHou79kC2f8zjrjI3gS9fXWbdUp77y46SpPH4CAZx5Cfwa190X5lBtjtyIKMUlG
 j2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738061121; x=1738665921;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dRwvcaraC/scDv+rDmHLiP+gKuIdNL5huOLcky7sR+E=;
 b=G2oK2J4V82cst8fdQ+4ILLtt/D/yvVWjqwtXjbOORFHLQatZ5FzjsNYuO313AYVS3d
 d9M14mxpDWlG0zgDwQHQgSEPwdBf/Le2hYdIhpAzzZbqNCc2+4r3DsazI932iT/L/41H
 DqswdHKlUG2SCOtjkJrNxm0A/G+lUtmwhrteDhH/8U2zEahCY7G1mMbf5uFEw7KITsSb
 IKUdnSJUxhVuxL4A55oXSnj7ao0e7JNFp8077z4A/aPKEskZagw1dzm0CJRS94pYnMkS
 6K+8SeKaPEawpxg4M+UYDq3q+sQvvSTR6CWUgvFKYlXipktJrNPSwcuQTTd0pRWz2m28
 lXRQ==
X-Gm-Message-State: AOJu0YykYkQrkymwm9BKVcNWovU4oGEPEIr/F+3mqU3I9nypLXZpd2hy
 PgNUxAtGlO03VBi186aaNn6tIZs5Esl5DICVwMzOf5/uAr8EAzeQWUniD02XWGw91CyOP8Ic+K9
 4
X-Gm-Gg: ASbGncv/M6YRsptctu8lAtPDgF3WD6TzqmpzzPM/dqR9BF25FnoUn3wxMAvy7qExwlC
 +nIfUkmG5GqaBgAWda+I03k25jzMW3H9eeNmmlqPRmyvUbV3BLhXauEEMsxDSL8sISgk5CpFJFi
 texvycXevi7MTMiXh10CcBFBf0tJplO0pt0rsMKjUncc12jdRN/8leaw3YBPVdNHpxDA1F587si
 yQcMzMhW6WLaYW37LhWabyCoKixwrDIVcvLGRgl8PuXa8Il18jtf/lYo7tLITP6pOykwhQLxIWD
 xq8F6hTVkYOyUKnhOuX4
X-Received: by 2002:a5d:490b:0:b0:38b:ef22:d8ba with SMTP id
 ffacd0b85a97d-38bf57b3fdcmr32477971f8f.44.1738061121318; 
 Tue, 28 Jan 2025 02:45:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c418esm13920133f8f.95.2025.01.28.02.45.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 02:45:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/11] hw/sd: QOMify omap-mmc, remove legacy APIs
Date: Tue, 28 Jan 2025 10:45:08 +0000
Message-Id: <20250128104519.3981448-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
X-TUID: yPoveyQ4R1ly

This series QOMifies the omap-mmc device. The main reason for
this is that this device is now the only remaining in-tree
user of the legacy SD APIs defined in sdcard_legacy.h.
The first 8 patches QOMify the device and do some minor
cleanup on it. Patches 9 to 11 then remove the unused
legacy APIs, deleting sdcard_legacy.h entirely. This includes
letting us get rid of the me_no_qdev_me_kill_mammoth_with_rocks
codepaths in sd.c.

thanks
-- PMM

Peter Maydell (11):
  hw/sd/omap_mmc: Do a minimal conversion to QDev
  hw/sd/omap_mmc: Convert remaining 'struct omap_mmc_s' uses to
    OMAPMMCState
  hw/sd/omap_mmc: Convert output qemu_irqs to gpio and sysbus IRQ APIs
  hw/sd/omap_mmc: Convert to SDBus API
  hw/sd/omap_mmc: Use similar API for "wire up omap_clk" to other OMAP
    devices
  hw/arm/omap1: Inline creation of MMC
  hw/sd/omap_mmc: Remove unused coverswitch qemu_irq
  hw/sd/omap_mmc: Untabify
  hw/sd: Remove unused 'enable' method from SDCardClass
  hw/sd: Remove unused legacy functions, stop killing mammoths
  hw/sd: Remove unused SDState::enable

 include/hw/arm/omap.h         |  17 ++-
 include/hw/sd/sd.h            |   1 -
 include/hw/sd/sdcard_legacy.h |  50 -------
 hw/arm/omap1.c                |  26 +++-
 hw/sd/omap_mmc.c              | 256 +++++++++++++++++++---------------
 hw/sd/sd.c                    |  94 +++----------
 6 files changed, 190 insertions(+), 254 deletions(-)
 delete mode 100644 include/hw/sd/sdcard_legacy.h

-- 
2.34.1

