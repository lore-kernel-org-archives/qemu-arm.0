Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1174305lfk;
        Mon, 5 Jul 2021 05:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRm6uzOovjwkFTI3DIuOx1fVOJPwKmF3EXoLIParc2uADjcKMyT2ny3gi4ON/IPM7Qits3
X-Received: by 2002:a05:6102:31a9:: with SMTP id d9mr1137513vsh.42.1625487822398;
        Mon, 05 Jul 2021 05:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625487822; cv=none;
        d=google.com; s=arc-20160816;
        b=X8gBnbr8+BpF4dlpJGreUUBj+OpsRMKaDRJhsuzw0/amX/IYmJRmuC5OwyZ4dBL76n
         CjXvBDcCHM8ubF8yEX7tmRnwBc47X/w0q/eXhHRCEYoxm4zA7Tg34yG7G70FqxPDOb2E
         l0ZkpzY57RpUkZfUEfgELkpxjm91lC5+BfIuL8RVfcqA4Rd6akpeFBFoU7Cle1gp3QoU
         Of8M8WpXaunc8FeJsCm9qBfYKULKftgHc1pZxjoQVzodaIwSltkIIFefCm1P1fcXZQAI
         QU61nSFctLylrC1kiVuutJD2nZaxHT0FO9/zEnKnOLnbGxTwDLMqcWtIy0Q3FYemMGmG
         F1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=XMUB+p/IFGPvYVtXtlwgo5/EDMvD/ScL/O9/NTh5KPI=;
        b=x3cRbVbxa4X/KO0P8Kx34q96BbdwfKAYwwArrEZav1PXtwkz/WhEGs4z8UKPhTk/Br
         w163PDNUd0S8B136xxmDpbgiw9pj7VvXW3qBm1/edWPDf/AXQ9XNcS3/OreAQHfzxQkA
         mpY9NPgiEjfMulAu68XO/xFh+6S5NYJCH5v8hRtDUTiVKqVEnr6REycpfCGtxpL6/Mjl
         XjUXOn+5ICaf0Ax74RZZ51P8+U2EZZ5XoYjVONJ6m/3i4MntMvZ1eQyVTkCx5CeXyg0P
         p2Cj7YM034oYWaRTEOvSB6+j4OD5NeGVS1E/OQawn9v0NsYzcpZaoGZQyFZZrvoyl61C
         uxcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="A6X/FhvH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si3506572vsd.421.2021.07.05.05.23.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 05:23:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="A6X/FhvH";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0NdV-0006UX-FD
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 08:23:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaQ-0003gY-En
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:33 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:43809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0NaI-0001yo-6P
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:20:30 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 q18-20020a1ce9120000b02901f259f3a250so11275230wmc.2
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 05:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XMUB+p/IFGPvYVtXtlwgo5/EDMvD/ScL/O9/NTh5KPI=;
 b=A6X/FhvH2aXMlyR4zE2WIOe6x2R6EXaPRzcqgho61CzA9O4xiw8t3wug11gVzLE5v4
 LfkMimKpL7YEer1YVwWrZT8oOFjn7DmhjNgqizTgvGdW5y6Mv0sJS1V7bSfQP2r+Z6/4
 dbBVT42BKKxeoMMLjicYd5YHloLNklQCCBFOSXzt/a5UXoKcK+a4u44eo+qiEzdIbv5I
 sNyTuZSVMquuzffd5WftwtWCWceGYv8jMmz5z36MjOU2e9+Uv0RDVlvpYHF1yE+3JwhJ
 ufSG6kKbhOh3QoKNKILmcmqtiKdBMmJB/PFSRbjcTHxZK0OxlDqs/tZhS3Hssn3flSGr
 S3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XMUB+p/IFGPvYVtXtlwgo5/EDMvD/ScL/O9/NTh5KPI=;
 b=BdfFoA618X2/LknuDRRSG7thhdsUaZPpc3TC6QTMLtFxnNeQsLCu3EazKe+4z3OGu8
 Zt3QYKX6l795Brp+iDMV1IjQ6h5usMhVVZt+lscqub8qpLIgr0ZSAag28+V6S1+zW0CZ
 UoCAmk2Md2bkAQ8gBPb+Aeju+exnM4EJHnyoIAVRSZqEnkHP1u23ca408MJ/c4vvHGsU
 Ech+uUhTmANbP08bjRIWVU/MP3LMhbd+hc+1OWo/AfBKyhJqSLlUWrjWA8CkJ0N6Nkt0
 g/xf1AeezYXZmGNP90UBzd62fhPtuQtTAtp5+4je62kdXmFSp4YsFkht2E0HGAAf88F4
 gGdQ==
X-Gm-Message-State: AOAM530YaJ0HU3eGKBZl9supBomiibZcbQpgS8KV3PE5jjslIn7IB3Ha
 0WVgnzza+5TuWdWe5zKe7dXw8w==
X-Received: by 2002:a05:600c:4f56:: with SMTP id
 m22mr15055889wmq.16.1625487619365; 
 Mon, 05 Jul 2021 05:20:19 -0700 (PDT)
Received: from orth.archaic.org.uk ([81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f18sm13450406wru.53.2021.07.05.05.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 05:20:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/3] docs: Add skeletal documentation of the emcraft-sf2
Date: Mon,  5 Jul 2021 13:20:10 +0100
Message-Id: <20210705122011.753-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210705122011.753-1-peter.maydell@linaro.org>
References: <20210705122011.753-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y0cZQR/EfCQg

Add skeletal documentation of the emcraft-sf2 machine.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emcraft-sf2.rst | 10 ++++++++++
 docs/system/target-arm.rst      |  1 +
 MAINTAINERS                     |  1 +
 3 files changed, 12 insertions(+)
 create mode 100644 docs/system/arm/emcraft-sf2.rst

diff --git a/docs/system/arm/emcraft-sf2.rst b/docs/system/arm/emcraft-sf2.rst
new file mode 100644
index 00000000000..9f10b86427a
--- /dev/null
+++ b/docs/system/arm/emcraft-sf2.rst
@@ -0,0 +1,10 @@
+Emcraft SmartFusion2 SOM kit (``emcraft-sf2``)
+==============================================
+
+The ``emcraft-sf2`` board emulates the SmartFusion2 SOM kit from
+Emcraft (M2S010). This is a System-on-Module from EmCraft systems,
+based on the SmartFusion2 SoC FPGA from Microsemi Corporation.
+The SoC is based on a Cortex-M4 processor.
+
+At the moment only the system timer, system registers and SPI
+controller are modelled.
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 0a3ef309472..d316e684106 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -86,6 +86,7 @@ undocumented; you can get a complete list by running
    arm/sabrelite
    arm/digic
    arm/cubieboard
+   arm/emcraft-sf2
    arm/musicpal
    arm/gumstix
    arm/nrf
diff --git a/MAINTAINERS b/MAINTAINERS
index 76a2c608d1e..dbbd71958ac 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1007,6 +1007,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/msf2-som.c
+F: docs/system/arm/emcraft-sf2.rst
 
 ASPEED BMCs
 M: Cédric Le Goater <clg@kaod.org>
-- 
2.20.1

