Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2060813lfb;
        Thu, 7 May 2020 08:18:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypJFUg1XdAwNdguQfUHF3jmub67iWHoIs+dTLWV95cVsO2Wc2rKQgIa8uuLgz52t057Fevrc
X-Received: by 2002:aed:3907:: with SMTP id l7mr1874345qte.62.1588864732247;
        Thu, 07 May 2020 08:18:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588864732; cv=none;
        d=google.com; s=arc-20160816;
        b=JSzUjwUnaPBOvMpMC7X/oxFFN6K8CnPjSOjtLCxTuGBE8gVThnI7/XQx5Q9uaD8mKC
         ijv0gDf7gKce6UzUtM/k/c6R4K5RvMoV0metDiyrVh8Uw1iHFnKoPkxXeEZ7ROr3f4V7
         T+SrqG0VNVlzLmepVoqiawl5dOr1K9xl7Pi+gUHKZ5a5ipOlg7X0lD+1kE0QYZY25VNn
         8Ej/cxe/9OQcylw1acAEmEe2uUkCG1zr0Uk3SyTGXBKt4bFcrXj+lqkxVE09aLwuxJ7z
         nZNUPDsp/iptMDkYMbgRJWbdQNtkwGowBH2TXjMgbC543mGGfvkFzzHzET1q+DSuu337
         2aGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rTf9IBDSAsF51iBWcS+fobjD1nzCOzkNrL8OJ1OV40M=;
        b=YW9dBvTZNdk63ULNHZltswCrfv8jB8VvPxcEbjQM0kGqPEdSUJ1TH7tEVvgzt/iK31
         VW77Bwok3clxZ68yqqCArn+qeLeXvhdS5530Q5Hn1rFctmb++aUY6u+Rk8ONURVMpzNV
         W+ZK2onBWSInoMveKhjY3NM4QU7VQYG+iimSbgTzAwsDWbvkvmtIF2mEspieyZimFIe0
         1dtWJJquYvgGV7Uqlr6oy64JRH2GR7gS71Vs/ixpdrVq8xCOmRKjgHWAe1e4/NUr+qme
         2wQAad0N519QAxMVFMMAblFgI9+HwIe+GUznecl71/wGvo5PEZn9byYwqmKXhbkeomSd
         BW6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5AQcm++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id j15si3029110qkl.292.2020.05.07.08.18.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 May 2020 08:18:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i5AQcm++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jWiIV-0007JI-G9
	for alex.bennee@linaro.org; Thu, 07 May 2020 11:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiIB-0006sg-4S
 for qemu-arm@nongnu.org; Thu, 07 May 2020 11:18:31 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:33630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWiIA-0002ax-8z
 for qemu-arm@nongnu.org; Thu, 07 May 2020 11:18:30 -0400
Received: by mail-wr1-x444.google.com with SMTP id h9so6882635wrt.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2020 08:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=rTf9IBDSAsF51iBWcS+fobjD1nzCOzkNrL8OJ1OV40M=;
 b=i5AQcm++hyCzhLAgoHyYhSW5VN3U/ORNfWsg2zSpo3vBirDxM03uvaBesTfw5L/NOM
 AHu/BhjjL98extszOh4q9euqMFG51934dyNOn+U4Iqg7KcKlrJoNee2ukpRGyfdmovqV
 2ibXtvztYqGMs0XgEBu8RGNAvWi7u2mMnITilnBXlTcSse69UbbSktCksXOs8bCigKht
 w1OX9s6MD/dCiFIWcKQKtkjAmMTZj1DQnUCb9DYP0fKJKtUpxrtSbyje1c849hAEChjT
 g2BuxEpGBOLXOk3jFz95RrF49Sih9A4yPxHRhJiLNXkIwOinRY9Pg8EYVDqWzLeC/KQ4
 3cSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rTf9IBDSAsF51iBWcS+fobjD1nzCOzkNrL8OJ1OV40M=;
 b=mrYagjTPj5/DcuzZwx8lJmvK4W9EX3c2y7n13SRo4wNIQzktr+rHkD0iaVfj4OurVg
 qkM6zaqVZEuquqNIU8RGPgLQ7HzUK8vK/9omJWs14/ZGHsKbfAK4ua2OVKHL8eThT2eM
 3xPxvRVMlspUZ/GwrqrsQLKjh52ZukmpUEK5JXmDxo/mS8Xxmfho460f7OLEFHdhrY0w
 bfrh0feaddQ+C59mlIiWCxqZiLrP2giwUr2MZFBJqt+S218h8VIN+ZvWmfQkayPmfqDo
 HZbr4xjLoKrEVU+hMxpuNaafVYMWOlWWxl6T5JDkdh+Qmzvui4pgVuZz2RGpR95hmIvr
 90zw==
X-Gm-Message-State: AGi0Pua0knyLPFx1kQ/2khZV4Ll3M29CqgegU2nGmkGrXOS7yaxFwVrW
 nvjIGmLs6QiU7ybH6V5c8pH+XOTwKpfuVg==
X-Received: by 2002:adf:e58d:: with SMTP id l13mr17143980wrm.187.1588864708620; 
 Thu, 07 May 2020 08:18:28 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q74sm961246wme.14.2020.05.07.08.18.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:18:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] docs/system: Document Musca boards
Date: Thu,  7 May 2020 16:18:19 +0100
Message-Id: <20200507151819.28444-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507151819.28444-1-peter.maydell@linaro.org>
References: <20200507151819.28444-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: mfJfd93bJ3Kf

Provide a minimal documentation of the Musca boards.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/musca.rst  | 31 +++++++++++++++++++++++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 33 insertions(+)
 create mode 100644 docs/system/arm/musca.rst

diff --git a/docs/system/arm/musca.rst b/docs/system/arm/musca.rst
new file mode 100644
index 00000000000..8375c5008d5
--- /dev/null
+++ b/docs/system/arm/musca.rst
@@ -0,0 +1,31 @@
+Arm Musca boards (``musca-a``, ``musca-b1``)
+============================================
+
+The Arm Musca development boards are a reference implementation
+of a system using the SSE-200 subsystem for embedded. They are
+dual Cortex-M33 systems.
+
+QEMU provides models of the A and B1 variants of this board.
+
+Unimplemented devices:
+
+- SPI
+- |I2C|
+- |I2S|
+- PWM
+- QSPI
+- Timer
+- SCC
+- GPIO
+- eFlash
+- MHU
+- PVT
+- SDIO
+- CryptoCell
+
+Note that (like the real hardware) the Musca-A machine is
+asymmetric: CPU 0 does not have the FPU or DSP extensions,
+but CPU 1 does. Also like the real hardware, the memory maps
+for the A and B1 variants differ significantly, so guest
+software must be built for the right variant.
+
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 15bcf9f81f0..1b86b93c346 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -72,6 +72,7 @@ undocumented; you can get a complete list by running
 
    arm/integratorcp
    arm/mps2
+   arm/musca
    arm/realview
    arm/versatile
    arm/vexpress
diff --git a/MAINTAINERS b/MAINTAINERS
index ea7bdd359e0..f8e0fdb4ef2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -706,6 +706,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/musca.c
+F: docs/system/arm/musca.rst
 
 Musicpal
 M: Jan Kiszka <jan.kiszka@web.de>
-- 
2.20.1

