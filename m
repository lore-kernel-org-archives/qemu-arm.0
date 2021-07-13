Received: by 2002:a0c:fe44:0:0:0:0:0 with SMTP id u4csp684147qvs;
        Tue, 13 Jul 2021 07:27:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxabl6HhNj/Cma8fw3g4Ajia/6RCud/StBMf+iTc9BT3ZGmq1dkAzXaDYz90UWguDY5bmFK
X-Received: by 2002:adf:dec4:: with SMTP id i4mr6103248wrn.191.1626186475650;
        Tue, 13 Jul 2021 07:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626186475; cv=none;
        d=google.com; s=arc-20160816;
        b=eH6AQ9Lym2kzoS2fQYMMDt9DJFOS6Qb/oqpG0vo246067Gn9H+jQC4fWq1PRe8FCWp
         zqx2l7qRuHU1f7LzWpGKc/WAEPlRLXquTBKH8Nun6eCL0y78qVT7D4XFUy/7yoG5gxOT
         LZqypRzeZNaZXfey1KfyLU2eVHbijW0+2Chs0rmAgTlsKpr/9iUAKZNSumtLUyher8Rt
         8Dpwtjjf2NRXaOuvx9Cg3sl7s2WhA9wyx4q+DFmu0S9I89hi9avZApaGmqF/Fvm5XIWw
         LljXDLT2EJerQ5MFanZ05aeTu358anPtdbNAFqzGSTQM9Hi67BtKgWDmdZvY6BuNuz0l
         mgsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LceErhheS5L5/y4VH2OfmPzwif8aAP4fxnUPjSh8ZQs=;
        b=NI585IbIRwctrOjoWrIle9fZqSFaB5APyQwS4v8r8EsaL1IbG3PNng+1o2kOyark9x
         Ivllo/iIttK4gd2uimu3l2Si+d0jaOj5F3eC9Ayn4OxC8xc5/vyI9TSyODoQxqTyqgvp
         bKRnhMg78oFrnGgtNMIZF4VCSRl1IV+9soF7mGX8EKSXMm8lsnXXMBV3WkfwkEgzA4dO
         ulQ4sTF8p9nuOeyXPuhnBOUUuh2dYb4NGSSv2pom/1w5kkIUcGQt7J9Mj0yWpz0yuRKo
         o3SFIBMHglu6HDmwCF6TFrv6ovkmZ+gAF0ZKW6/O75+UdDqcS0VqmbdF0RGPjRXld36w
         RkBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v5CTGGTh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si11522604wrr.35.2021.07.13.07.27.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jul 2021 07:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=v5CTGGTh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3JO6-0003nU-Mh
	for alex.bennee@linaro.org; Tue, 13 Jul 2021 10:27:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIz-0001hK-9v
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:22:40 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50995)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m3JIw-0001f3-CW
 for qemu-arm@nongnu.org; Tue, 13 Jul 2021 10:22:37 -0400
Received: by mail-wm1-x32f.google.com with SMTP id l6so5481267wmq.0
 for <qemu-arm@nongnu.org>; Tue, 13 Jul 2021 07:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LceErhheS5L5/y4VH2OfmPzwif8aAP4fxnUPjSh8ZQs=;
 b=v5CTGGThGJ5hMIZM8nbBH2fiYUDXi9N24IiwqgEHpJk0f5TK0kyTHwb0YWc5sj2lj+
 TpRjk7pOFC7QL+MyhNCqrGlccrGrbTZzLLP/hdH6ZeCAtR3rXod/t0rFencWJdlliAi5
 uB1mJp4hN3a5C4HC5tA9+suc+tsOcYiOU1mLx1ag3Rd4QdHWxfcqumghdjHFinike0Tm
 fiaUyckd6ocIYzaiMQmQXpezJVbgMiuVohSpL/+2ua/s2UDnjxoVAmlmbBOO4vf6N3Qi
 EPf8Abtu7XvZBfdlhWrvH6Fviulvt9++aHMzpsNEIrCxHc62p6LtrtZx1YmPiry+jp5J
 AQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LceErhheS5L5/y4VH2OfmPzwif8aAP4fxnUPjSh8ZQs=;
 b=Khj26/LA6ae9Ue0hnCBqF8dQySxW4xA4awobTeHP2VGoeZl4Np9GeEekwx47yfOpAc
 yJDOUweU6G0blbcf+4IsXc7KdlxbyZAj8HDliOTGexwjIBO+DaqzpnHoZUqMi87LBdAl
 o6Dqr6VJIFPC7ow22U69f0aSVvMQtPD1InaBbWOJJFDYn90L4ruQgvFm/GP9dtymGnZq
 2qnaGPhp+rITB21DQls4arBmw3UIYDtHIk5tUViTxUfKJPzFoMMAqOPET+rPHka0i0ID
 AucYLgwFluKCJhC29fwT5uyJHUvEjtvQ2/epe7XATFD3Ohlqlvr0vtlVZcF/qWdKuFMR
 6e6Q==
X-Gm-Message-State: AOAM5316mrsTTG2DCFPFo6aDvh9ldWsp1IGqUx1E44ZFCpN68ps0lw0h
 ZfFzwuMfTVzJD33JPATPukarBc+7gxqHEL4X
X-Received: by 2002:a7b:c7cb:: with SMTP id z11mr333237wmk.102.1626186151307; 
 Tue, 13 Jul 2021 07:22:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l15sm7916469wrv.87.2021.07.13.07.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 07:22:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] docs: Add skeletal documentation of highbank and midway
Date: Tue, 13 Jul 2021 15:22:26 +0100
Message-Id: <20210713142226.19155-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210713142226.19155-1-peter.maydell@linaro.org>
References: <20210713142226.19155-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bcUH6RArX5AX

Add skeletal documentation for the highbank and midway machines.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/highbank.rst | 19 +++++++++++++++++++
 docs/system/target-arm.rst   |  1 +
 MAINTAINERS                  |  1 +
 3 files changed, 21 insertions(+)
 create mode 100644 docs/system/arm/highbank.rst

diff --git a/docs/system/arm/highbank.rst b/docs/system/arm/highbank.rst
new file mode 100644
index 00000000000..bb4965b367f
--- /dev/null
+++ b/docs/system/arm/highbank.rst
@@ -0,0 +1,19 @@
+Calxeda Highbank and Midway (``highbank``, ``midway``)
+======================================================
+
+``highbank`` is a model of the Calxeda Highbank (ECX-1000) system,
+which has four Cortex-A9 cores.
+
+``midway`` is a model of the Calxeda Midway (ECX-2000) system,
+which has four Cortex-A15 cores.
+
+Emulated devices:
+
+- L2x0 cache controller
+- SP804 dual timer
+- PL011 UART
+- PL061 GPIOs
+- PL031 RTC
+- PL022 synchronous serial port controller
+- AHCI
+- XGMAC ethernet controllers
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index c52902acdad..c0c2585c0ad 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -87,6 +87,7 @@ undocumented; you can get a complete list by running
    arm/digic
    arm/cubieboard
    arm/emcraft-sf2
+   arm/highbank
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index f23cf874c66..767adc64ba2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -642,6 +642,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/highbank.c
 F: hw/net/xgmac.c
+F: docs/system/arm/highbank.rst
 
 Canon DIGIC
 M: Antony Pavlov <antonynpavlov@gmail.com>
-- 
2.20.1

