Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2574183lfo;
        Sun, 31 Jan 2021 03:01:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXptcftXdpLAOjo3VJaUF5fMFGlaZRBc2E0kcxOeCljpFwjSeQlINp+slHivSBPnnc9Rmk
X-Received: by 2002:a25:910a:: with SMTP id v10mr1465211ybl.506.1612090904904;
        Sun, 31 Jan 2021 03:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612090904; cv=none;
        d=google.com; s=arc-20160816;
        b=OU/FlZ/irDC0f1uOGV0F5W9F3nO2qbiXQ5337l6vi0vnmWR0ASPT6bS8KwSE+11dwv
         RWytFEsO5Bg3YAYD2BKiIG/GcbQZ9pBFJjiCIbfF9ugArIyT9jTZ3Q4AxS7HXkN+lIbr
         vui8Js2kYjlIsgkSWYUlOJ83JTmnQSYo/3bKkLcylF+fvC/jIVYzspf3pX6Zr+pyPZEV
         ovCqRGu7wwj6QIjJ2ogXROjzj9lnszFp6QNX8jzjLu2sUJ7dtHSCnybTbP3tDErKVgkS
         wcJCNBVSCzt7DQ2DaiWAMooB4O1Q8CITAeKjUGkUechUkT5QniiOnFF4ljEEGqRzyV14
         siQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rhmZGh+lLqk8y/kN/amckU6sgJUtIz3ObCH4gQGYjHc=;
        b=kvVOly7G9P99G5+dy+Pm2/JK3LLAbuVb7PLoxurJ3EvKSL0MPtnAT4LM6hZLOG+YWn
         l5JJ+P6ChbCsgvnWW4UgOm0U7boaJV8HdscodjI85M/FMEJuNhK04SlLH6SrLChQCQUV
         vrDN2vrGZ5xdnaLQGO7dN87sk5seSrLkBId2MHlb1HLWMMPsGxncvN6adizwqfkF2c1X
         1k8rLyMcgRl4DhrVF0qos2i+fIyJw/k3Vh3v/2jIq84k9SNekdIi8NJSNi+c1gxLsO/1
         zeexun7nM8TyzvzBoHzdw5EruBwiWQAECCn9JiGLDFPN1xmyPQNpGyq9pCVuANZQhyEa
         Vxwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VdrvC+Wf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i1si3657049ybg.195.2021.01.31.03.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 Jan 2021 03:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VdrvC+Wf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:35448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6AUC-0007j6-64
	for alex.bennee@linaro.org; Sun, 31 Jan 2021 06:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASE-000752-7J; Sun, 31 Jan 2021 05:59:42 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6ASB-0000Kn-S2; Sun, 31 Jan 2021 05:59:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id c127so10676571wmf.5;
 Sun, 31 Jan 2021 02:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rhmZGh+lLqk8y/kN/amckU6sgJUtIz3ObCH4gQGYjHc=;
 b=VdrvC+Wfqci72UDt7L8R8zMk3X+PU6jgBeh7dDJgh8GPVt9Dhat48Cu/EukJAsfawO
 SARDR7W2ZMfcP+5j3FrTXZ74B3y4pG13g32phI6Xs2Rnr8k53VYVIebIZWSPn6J+i60L
 wUJApDAa/m0I7kXEWm2xlmRlYyHqcXym4ODMGR6yz3b4T/6judTUaOxhZZ0rU5KO7ocN
 UdaSx4/rmM3qzS4ScMIpiYhYOpUx1rNvV16KdKdOyn1//KSWeLwxSUXYcKfw8zxQ7rGK
 JpJaOlfXNZHDSeeGLUWMleruP6ujuKIw+bBEPoLN0p6dDu2u4BdOPrTnFYaoHzno2Irv
 Va9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rhmZGh+lLqk8y/kN/amckU6sgJUtIz3ObCH4gQGYjHc=;
 b=YJH18qPoq0hjGg+74WbcFombFGR+oxnnKqL0IMZHj+QEGvOi5fhWZk/YNuALGpdZRx
 6Q9yXr/GiDbbB7kNkLRahhFlpH3jvOPXUMZ5lsuAS2fePkh5v+HFDsUOv32U/5tF4wY8
 DKlmy4XRe84kfZkKiDoHhoig5uUZZNIE/iT3FM5TRc5r/PPnFVVcpS299T3z9+JHqLf6
 rHkjRyyywl0VKMOnnMe/45Av/W8yfTnLln8FihdGaBnoSJKfO4HPszS/DJ4OYf2srPp+
 YwBuWGFzELumY2eWEv7wXkxKg6sEUkemaxKDxOFvttLxa8NMBKmqqMUT0bjzU6GkYE8b
 a7Zw==
X-Gm-Message-State: AOAM5316N4Tt0PneCoT+CnrO+Lm1SPzTyonffvVw1NN9M+bb/R8mr1uw
 bCTMIAfcGPuEk1B1KQ59OZQSxMlrE8M=
X-Received: by 2002:a1c:4e05:: with SMTP id g5mr10841953wmh.105.1612090777586; 
 Sun, 31 Jan 2021 02:59:37 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id h207sm15597265wme.18.2021.01.31.02.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 02:59:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] hw/arm/xlnx-versal: Versal SoC requires ZDMA
Date: Sun, 31 Jan 2021 11:59:14 +0100
Message-Id: <20210131105918.228787-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131105918.228787-1-f4bug@amsat.org>
References: <20210131105918.228787-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ebRobgkbFgsN

The Versal SoC instantiates the TYPE_XLNX_ZDMA object in
versal_create_admas(). Introduce the XLNX_ZDMA configuration
and select it to fix:

  $ qemu-system-aarch64 -M xlnx-versal-virt ...
  qemu-system-aarch64: missing object type 'xlnx.zdma'

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Alistair Francis <alistair@alistair23.me>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
---
 hw/arm/Kconfig     | 2 ++
 hw/dma/Kconfig     | 3 +++
 hw/dma/meson.build | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 223016bb4e8..09298881f2f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -354,6 +354,7 @@ config XLNX_ZYNQMP_ARM
     select XILINX_AXI
     select XILINX_SPIPS
     select XLNX_ZYNQMP
+    select XLNX_ZDMA
 
 config XLNX_VERSAL
     bool
@@ -362,6 +363,7 @@ config XLNX_VERSAL
     select CADENCE
     select VIRTIO_MMIO
     select UNIMP
+    select XLNX_ZDMA
 
 config NPCM7XX
     bool
diff --git a/hw/dma/Kconfig b/hw/dma/Kconfig
index d67492d36c1..5d6be1a7a7a 100644
--- a/hw/dma/Kconfig
+++ b/hw/dma/Kconfig
@@ -18,6 +18,9 @@ config ZYNQ_DEVCFG
     bool
     select REGISTER
 
+config XLNX_ZDMA
+    bool
+
 config STP2000
     bool
 
diff --git a/hw/dma/meson.build b/hw/dma/meson.build
index b991d7698c7..47b4a7cb47b 100644
--- a/hw/dma/meson.build
+++ b/hw/dma/meson.build
@@ -9,7 +9,7 @@
 softmmu_ss.add(when: 'CONFIG_ETRAXFS', if_true: files('etraxfs_dma.c'))
 softmmu_ss.add(when: 'CONFIG_STP2000', if_true: files('sparc32_dma.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx_dpdma.c'))
-softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zdma.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_ZDMA', if_true: files('xlnx-zdma.c'))
 softmmu_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_dma.c', 'soc_dma.c'))
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_dma.c'))
 softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_dma.c'))
-- 
2.26.2

