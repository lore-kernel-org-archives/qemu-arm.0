Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5564426lfc;
        Thu, 29 Jul 2021 04:56:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6KJf0lvEzlOm490zsqDa7T6jfuljFzaVy/+ANAMVAo+suUIrqyRcQW69I6GZOEQ7LWLR5
X-Received: by 2002:a05:6638:218:: with SMTP id e24mr4255857jaq.38.1627559785527;
        Thu, 29 Jul 2021 04:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627559785; cv=none;
        d=google.com; s=arc-20160816;
        b=tMlcRUS/fXUde7t8Y/O6oJKBGRvHe9zonwvXCoA7mmyeyy6ih4/UqQHjjD8rgWbtwD
         6HFspmirU7sRuvyoaG093ha6bTH4tLz8g799alwLQEonZj6+sCQETtAv57+SxxC0VNwJ
         7Ufp/TggQN78mvINKrqiufCl9zWZ0ZDDFMwajacPqBYHdZRPO0zR461kRfrW9fir6MmH
         j86ns9O+0QaK2BviKxpjr7eg+gS/kMGbJh+reT/98dgnrXgFhlada6KlwZuD/wabLFs9
         O/3i+MN+iMUAGthQTcIl+8WD7SND7INur9XPv8jgUbjC3Dqg7/XI0/g8TaBmA14PWxqL
         mJEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1nPPw7sf6+ACZS1KSJaNNWd+RZu2j3hEbtkOKyLj6Kw=;
        b=KGcDyG4vXHneHNjzCzohQvv/xy/64KfjjOWYRw6YVC4cfa5UBhwOz9N2ity/DUauEh
         +4Gx5OjjI/9bWaReVdtbAQukA9Z6BOKiJvbo1brgyyQPRohAx9VGxz9xWz1sSctTTPeD
         sm3oQcqXzvKHBHQjPY1Nl24hjcXuxrLsS+fGTXCgtOANvyvRLKmu1atyu+Jx4Zr88nZq
         rUrM2IE+MO3dOCItkVe9x/IOdCrqkJOjWlGl+DLPzi4LiZEWbd7mpnTjUI3JBwKd4YTG
         evwfevxNL4JAHXLXR+I6bzwhGBe9KoW6JMTxnIEForxZBNCBfxEkONKFeJze6iyhbtjr
         zz6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eo5Xakfm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si3173031ilg.116.2021.07.29.04.56.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:56:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eo5Xakfm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m94eG-0002IN-TF
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941f-0001ai-HQ
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:31 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m941A-0001W5-Bd
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:16:31 -0400
Received: by mail-wr1-x436.google.com with SMTP id l18so6463762wrv.5
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=1nPPw7sf6+ACZS1KSJaNNWd+RZu2j3hEbtkOKyLj6Kw=;
 b=eo5Xakfmv7I1HlifNM/udWOgc6jt+ZL52gj3uUt84STRxjLsqBC83kcqq2qRwdpZaQ
 +/PObFMo41KBDHpcch5MLaiGvv7S5Z/Jy9pv3OD2+5wRIPUKYk3D9wX2iiqoKXqy79xt
 26lxIE8Ni1Vn9BrX6XzxTxDdZQ4HDbagHF8Zy+hfMCOzl7px4h1jlvWMgoDMl+crjdu0
 hCr0HCWA7cO0MLupQ61o8jH5vE4F7pqJa2D2NWEcwjIjaIVjlp+mk4n+qhYFhzTRgFUX
 0lY0cvZQF1XhnlkyzzLEWUtaPJVNoRKal05x+PGFnM/GVBox/iqkrk//o9guC5eihDPv
 vuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1nPPw7sf6+ACZS1KSJaNNWd+RZu2j3hEbtkOKyLj6Kw=;
 b=ZXQVK36Dg0lJ3i2zRZjUXZJOln5QNpm0MAITnALT+0MIi8QMhLYPOw+ueHPObpNTqS
 0hB1M/3FHtGJ32Uam+/THBdmhRSDWmAQgvI50kVi2/OfHWlAFsGBqAIXHMH6OAedCfPh
 Z/jAAerH/8O/5yTFTNgcvWD1ZzTDu6MYhcaOPolhOSK/YDeK1ognFWP3fOopS3fofbLt
 Xcag8XONzUIBC8fgtqCPVieJoixHLIdf4YMEjcPkpZV84SNPQjcneCiczTdhYtJLMrWp
 xP0AF/NaegJ3soITk8Nx3UCtEQqZ0VvOpcgFfiCXTCzVcW4RkhRrTA0ya3xJX96Zh6ok
 15YQ==
X-Gm-Message-State: AOAM532d8QtLgoOITLO4owr2J1evvZbYOJakVhN7ZBNoLIQUytMGuWmh
 zcJiWEeFs32Fat3AlbK+nENC37XI7auyLw==
X-Received: by 2002:a5d:6608:: with SMTP id n8mr4118152wru.427.1627557359030; 
 Thu, 29 Jul 2021 04:15:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 53/53] target/arm: Enable MVE in Cortex-M55
Date: Thu, 29 Jul 2021 12:15:12 +0100
Message-Id: <20210729111512.16541-54-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wKUuvSrmeZvM

We now have a complete MVE emulation, so we can enable it in our
Cortex-M55 model by setting the ID registers to match those of a
Cortex-M55 with full MVE support.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu_tcg.c          | 7 ++-----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 144dc491d95..89310e4842f 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -87,6 +87,7 @@ for the following architecture extensions:
 - LOB (Low Overhead loops and Branch future)
 - M (Main Extension)
 - MPU (Memory Protection Unit Extension)
+- MVE (M-Profile Vector Extension)
 - PXN (Privileged Execute Never)
 - RAS (Reliability, Serviceability and Availability): "minimum RAS Extension" only
 - S (Security Extension)
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index ed444bf436a..33cc75af57d 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -654,12 +654,9 @@ static void cortex_m55_initfn(Object *obj)
     cpu->revidr = 0;
     cpu->pmsav7_dregion = 16;
     cpu->sau_sregion = 8;
-    /*
-     * These are the MVFR* values for the FPU, no MVE configuration;
-     * we will update them later when we implement MVE
-     */
+    /* These are the MVFR* values for the FPU + full MVE configuration */
     cpu->isar.mvfr0 = 0x10110221;
-    cpu->isar.mvfr1 = 0x12100011;
+    cpu->isar.mvfr1 = 0x12100211;
     cpu->isar.mvfr2 = 0x00000040;
     cpu->isar.id_pfr0 = 0x20000030;
     cpu->isar.id_pfr1 = 0x00000230;
-- 
2.20.1

