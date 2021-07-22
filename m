Received: by 2002:a05:6214:acc:0:0:0:0 with SMTP id g12csp1604104qvi;
        Thu, 22 Jul 2021 10:54:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxK92wpm9GAoEz6Ut/XRZ3cA61Ht3EI5f0OsgQP+XQTWbNxV45iY1/zYTy14s6/4GsIDuR7
X-Received: by 2002:a25:f309:: with SMTP id c9mr943581ybs.113.1626976444001;
        Thu, 22 Jul 2021 10:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626976443; cv=none;
        d=google.com; s=arc-20160816;
        b=Xn247PI2X1odZd2FgjomNSgVy86LlGU+ClTcTCsdIjh3QpDlAppwnnzQNFCRPKxsgZ
         nj8hoa8IYT2zObV/QZy0wzaEA5rxtfKayffPj8Qd+CWpz9OQ4AiC8XPozuD3/R886ArH
         6aegf3g++cw8e/bls0xHr/GofdPbSRMgE/r8RIa42zJeqmTQMrWkXMGr3xZyVBEOCN0U
         ym4y26bphmkjRvexZNkraDer8Z8dPpD9JC3+9D6Ls8yuAN7pb+b4TPLB+lkbjCWHSnBz
         qiJvE4fXPvuliigPBjxm7/KfJWqPm9SGrnrilq3am4S3hxd+VE3QGz1JNOoQFMScA8++
         a3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=74f+hApLCCjhuECeBbrvH7CjKMuQYwF916lVlUEeB5U=;
        b=tBSf6BH3sAt3reETuEmP/w0BLKrLDnhE78BuDOa0Ya3Tk/rv7ke5C2x71MW3eUJaW2
         RAbFzG/oITgtEc24guIBpRA7e3MIycISV0evE86uebpJLu3g/7d5RS7cksquhiTFP0P5
         NIEhTi74yRtBZVzBCYnf+gY9xnlBURxmvIV5Url4Bdu7guFCA2grU7g/B6Wte0ZBJ1hs
         qogiL+t/sbydGnw0068oRI43wgUBMD6JNMpGWWOJLbJja5ODLSrOdR9aMvfWR54VCSlh
         hqJyOD6L246BlJkoAvWLtiT9f2hZQt6NR4eaqRceRQ0ak0SyeW48mhJQhGRdpigcz71E
         QJDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a8n9Vys3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8si32354961ybo.48.2021.07.22.10.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Jul 2021 10:54:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a8n9Vys3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m6ctX-0007m7-Fj
	for alex.bennee@linaro.org; Thu, 22 Jul 2021 13:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs8-0004M4-DR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:36 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:45736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6cs5-00020E-NX
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 13:52:36 -0400
Received: by mail-wr1-x42f.google.com with SMTP id t5so6803011wrw.12
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 10:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=74f+hApLCCjhuECeBbrvH7CjKMuQYwF916lVlUEeB5U=;
 b=a8n9Vys3ASOZJ3vS1W1F6kvHdkMFYmWFayfRRxzwp4FrHSHipYALLqLfUXuuWBXhhD
 UOf7QWevZ12rOfyC29hRM7ZoPeIQMBPp9U5171NQaxYvm6s3sRlzwZnnEEmQziagNm/a
 ZQNCVXt1ZcwqzG6w1f1Wkm2UfkGrg4fh5hzfqxuBO07rlKqy3PDiS6lQ5KdvXvAmxEwk
 uakPqo8zhxZcRW81CATENpDLTByVZG99kSAA4md4NCqztCR3SYPASbl75qagd0pioHMh
 zEGF8wauxHLGCdQRlVUpHCxFiVXxuzlVT7ufbdoZMu16eL449S5lbsI2gikQHMK/q5X2
 QSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=74f+hApLCCjhuECeBbrvH7CjKMuQYwF916lVlUEeB5U=;
 b=DYB1tjwIMlk56R5sYFk7qGJnIuElRWjt00WWKZzHNhBRH2/MaGyUk1dPrVy/8sqbrj
 SMYhAv6zkVaAtmzL0lasuW73GsKc9yM0oKe8+DoukF37SkV2/hl1wTEmD2HiK/mrMbB9
 DkTxglAUxU/7ZyxQo5YkCXYBNypCAs6EWGY2bwKyl3LcEGXUjZ71jkZ/Fvvj1yVxFJFL
 jBFqktzNSBr+vLcYLIeerkuTeghBH8a7Z9S9dIeQzmM7AEfAtqoLA3L6Iu9Jv6FUShU1
 2rlDnHMrN/tOK1HKnb9+0aZLPWV3B4a0w9VrjnzTrfhiR15AK2nPYV7a9U1V7mhaN217
 fMfg==
X-Gm-Message-State: AOAM532j16FWP/Ph5fOdYh/5hoqgtf11MIuI++uh55AOrbgtBsCG1JF7
 1wUgALi5UcM6+u8Udd+FtTNECA==
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr1196110wrr.74.1626976352483; 
 Thu, 22 Jul 2021 10:52:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s13sm30278651wrm.13.2021.07.22.10.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 10:52:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 1/3] docs: Add documentation of Arm 'mainstone' board
Date: Thu, 22 Jul 2021 18:52:27 +0100
Message-Id: <20210722175229.29065-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210722175229.29065-1-peter.maydell@linaro.org>
References: <20210722175229.29065-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VGCLL4C0IyEN

Add brief documentation of the Arm 'mainstone' board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mainstone.rst | 25 +++++++++++++++++++++++++
 docs/system/target-arm.rst    |  1 +
 MAINTAINERS                   |  1 +
 3 files changed, 27 insertions(+)
 create mode 100644 docs/system/arm/mainstone.rst

diff --git a/docs/system/arm/mainstone.rst b/docs/system/arm/mainstone.rst
new file mode 100644
index 00000000000..05310f42c7f
--- /dev/null
+++ b/docs/system/arm/mainstone.rst
@@ -0,0 +1,25 @@
+Intel Mainstone II board (``mainstone``)
+========================================
+
+The ``mainstone`` board emulates the Intel Mainstone II development
+board, which uses a PXA270 CPU.
+
+Emulated devices:
+
+- Flash memory
+- Keypad
+- MMC controller
+- 91C111 ethernet
+- PIC
+- Timer
+- DMA
+- GPIO
+- FIR
+- Serial
+- LCD controller
+- SSP
+- USB controller
+- RTC
+- PCMCIA
+- I2C
+- I2S
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index c0c2585c0ad..ad3f5f435d6 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -90,6 +90,7 @@ undocumented; you can get a complete list by running
    arm/highbank
    arm/musicpal
    arm/gumstix
+   arm/mainstone
    arm/nrf
    arm/nseries
    arm/nuvoton
diff --git a/MAINTAINERS b/MAINTAINERS
index 4256ad1adbb..47ddcbb7f7a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -856,6 +856,7 @@ F: include/hw/arm/pxa.h
 F: include/hw/arm/sharpsl.h
 F: include/hw/display/tc6393xb.h
 F: docs/system/arm/xscale.rst
+F: docs/system/arm/mainstone.rst
 
 SABRELITE / i.MX6
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1

