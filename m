Received: by 2002:a19:6a18:0:0:0:0:0 with SMTP id u24csp286053lfu;
        Tue, 5 Apr 2022 15:39:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzcA18es/GpFeTMJhz93Vd5FFx7Ufhd8BXlUADVuHvHKUp/RinrTcZcywUOf9EwkhjlKPQ
X-Received: by 2002:a05:620a:2802:b0:680:9ca5:47a4 with SMTP id f2-20020a05620a280200b006809ca547a4mr3839850qkp.71.1649198360314;
        Tue, 05 Apr 2022 15:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649198360; cv=none;
        d=google.com; s=arc-20160816;
        b=0Jg1bqaaGzHsiTmduY+bGBHLJnmtm9TYJujTuSWT2yeBdbJyTsfJkoUjnteFhc10IF
         1S7cnryXIYPTaJ5Fxry87jJjx61a+x7SaqgD0aXse1fma4h8ZOg2t4zk2nqCFLjl7Fnu
         rzjTSECVCJReqe2KztwyzbYprwWlhh4xVtuPlrHkBTOYfd35guyeg0aY/4VTH+Xl+beB
         siDRLM1tfIGuvLIXXv7Lk5UbvynFkR9qiHQPMW+WLA0WB7LPIL4L0hc4QtmB8PXRmSsB
         XGGXX549mRELtUfyVVYa1GuIcMCNKeAyNLOyY37wKEEpwUewVaiqS5IZeM2WqIUC4JMk
         xtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=VYxWL6bZEYLrJGNbQRZ1dyCdVAbahcbUSnlVpK3x3+w=;
        b=zFkrJO9UfdYi+2gFZwxmQMEaqoZ1960yXlMQ53k1+nPC205S63QozSpvNzH5LnH2EE
         weKA2c/l+H5pO4U3SXsX+E0PzYVyrog/54EKU+u6kjdfSD4/SKuToNpwYxQcDMkQ7kRF
         eK2TwGyTTvSVgzvvEJHvg38eDaQLNjho/SJ6x1BMYjrNTBHv2jghyBy17Y5tYMbP4r+D
         oB0Tyhd+PpFIXFra7rn3wa1m4wy4Mbh5oIhaxFWsxSvHPjmZsz/VOm0Q6PvLABjodnBm
         WYPFOTuTXE6XAvj/fIPMwCQ6iucrBcVX0Nh30r+UJhuZboHbte3jb4c3IAtZ28fSLLTv
         kiGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Yx9jwV/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bc11-20020a05622a1ccb00b002ebb0937648si3773672qtb.231.2022.04.05.15.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Apr 2022 15:39:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="Yx9jwV/L";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nbrpX-0004G9-NX
	for alex.bennee@linaro.org; Tue, 05 Apr 2022 18:39:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3xsRMYggKCJsRPC5JONCBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--wuhaotsh.bounces.google.com>)
 id 1nbroR-0004DQ-MA
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:12 -0400
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049]:55197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3xsRMYggKCJsRPC5JONCBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--wuhaotsh.bounces.google.com>)
 id 1nbroG-00030e-5f
 for qemu-arm@nongnu.org; Tue, 05 Apr 2022 18:38:09 -0400
Received: by mail-pj1-x1049.google.com with SMTP id
 i19-20020a17090adc1300b001ca70b4a71aso388004pjv.4
 for <qemu-arm@nongnu.org>; Tue, 05 Apr 2022 15:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VYxWL6bZEYLrJGNbQRZ1dyCdVAbahcbUSnlVpK3x3+w=;
 b=Yx9jwV/LKMrp0Op8M7XIjKg1ImCArvg+CtjGIVY9mdZoSPaZRlWttfLpzjs9U2eaf9
 vg6rXXlSXNkGdrXQEA/w7JTk2lvm2XDXMJr7At2eGP0uknsNbHgorc4NjsoWg3FiKtSq
 dOeazbDATOtQz87vvHomeRkx6gu1T6EWHVTRMrD+hzErDoJpCrLeQItjDrYQJGdCgDVE
 MnLYWtwGu0CVs2M5MKW9wpI+O8p2HWF9fbIy6nMn3ZRZ+mnch/9dwHtVYbjCFNW8x54Z
 WoEaodcjNl+1frnVl0NsZPlX+ngpu/7oN4Gfan9a0gNkiR5tIPfsl7RZ0y8v7Vaoeb6/
 XEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VYxWL6bZEYLrJGNbQRZ1dyCdVAbahcbUSnlVpK3x3+w=;
 b=itBH8dZ0lVyqRFpH+YekGAd3gAI5kPu8EUkYAu4TADipd1NZo5GiFtrmfHZXVr6wI1
 2ErougQCcGCIuTpdn+Zd9roOq5gBp9nlfd/lqaah64D1s7asZGLlx3WVhYSSUSyyGcwg
 k5IxzlI7aWBbK2GNE29PT2CidnGtkKrJB4b4BOrAUz4ad9sf+CubJCfp2hmpSuJgOhrM
 qEumK2Qs0VDa79/+1f0MSvq0e4WGMYoFpxfC8oZpM1K3YPvN3+zchFtuMRkmWLPyS2Zz
 WCLolaVgith6St2v2PLbJkeQ78/bv1Oawz+iJZyE8dTc3KMkyJOWHwTFoF3sIJcca3Xn
 +sPw==
X-Gm-Message-State: AOAM532yA6QLz+MQcvPixzgewXqK0JaEt/Pdz2zV6bM5J54NIU9hvHsB
 AmNeKgCLqTQU8MYXepWFWWimKvhAgjSNTg==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:9b98:b0:156:52b1:b100 with SMTP
 id y24-20020a1709029b9800b0015652b1b100mr5695162plp.174.1649198278208; Tue,
 05 Apr 2022 15:37:58 -0700 (PDT)
Date: Tue,  5 Apr 2022 15:36:30 -0700
In-Reply-To: <20220405223640.2595730-1-wuhaotsh@google.com>
Message-Id: <20220405223640.2595730-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.35.1.1094.g7c7d902a7c-goog
Subject: [PATCH for-7.1 01/11] docs/system/arm: Add Description for NPCM8XX SoC
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, wuhaotsh@google.com, 
 venture@google.com, Avi.Fishman@nuvoton.com, kfting@nuvoton.com, 
 hskinnemoen@google.com, Uri.Trichter@nuvoton.com, Vishal.Soni@microsoft.com, 
 titusr@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1049;
 envelope-from=3xsRMYggKCJsRPC5JONCBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--wuhaotsh.bounces.google.com;
 helo=mail-pj1-x1049.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n8uZOyZ75baO

NPCM8XX SoC is the successor of the NPCM7XX. It features quad-core
Cortex-A35 (Armv8, 64-bit) CPUs and some additional peripherals.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture <venture@google.com>
---
 docs/system/arm/nuvoton.rst | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index ef2792076a..bead17fa7e 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -1,12 +1,13 @@
 Nuvoton iBMC boards (``*-bmc``, ``npcm750-evb``, ``quanta-gsj``)
 ================================================================
 
-The `Nuvoton iBMC`_ chips (NPCM7xx) are a family of ARM-based SoCs that are
+The `Nuvoton iBMC`_ chips are a family of ARM-based SoCs that are
 designed to be used as Baseboard Management Controllers (BMCs) in various
-servers. They all feature one or two ARM Cortex-A9 CPU cores, as well as an
-assortment of peripherals targeted for either Enterprise or Data Center /
-Hyperscale applications. The former is a superset of the latter, so NPCM750 has
-all the peripherals of NPCM730 and more.
+servers. Currently there are two families: NPCM7XX series and
+NPCM8XX series. NPCM7XX series feature one or two ARM Cortex-A9 CPU cores,
+while NPCM8XX feature 4 ARM Cortex-A35 CPU cores. Both series contain a
+different assortment of peripherals targeted for either Enterprise or Data
+Center / Hyperscale applications.
 
 .. _Nuvoton iBMC: https://www.nuvoton.com/products/cloud-computing/ibmc/
 
@@ -27,6 +28,8 @@ There are also two more SoCs, NPCM710 and NPCM705, which are single-core
 variants of NPCM750 and NPCM730, respectively. These are currently not
 supported by QEMU.
 
+The NPCM8xx SoC is the successor of the NPCM7xx SoC.
+
 Supported devices
 -----------------
 
@@ -61,6 +64,8 @@ Missing devices
    * System Wake-up Control (SWC)
    * Shared memory (SHM)
    * eSPI slave interface
+   * Block-tranfer interface (8XX only)
+   * Virtual UART (8XX only)
 
  * Ethernet controller (GMAC)
  * USB device (USBD)
@@ -76,6 +81,11 @@ Missing devices
  * Video capture
  * Encoding compression engine
  * Security features
+ * I3C buses (8XX only)
+ * Temperator sensor interface (8XX only)
+ * Virtual UART (8XX only)
+ * Flash monitor (8XX only)
+ * JTAG master (8XX only)
 
 Boot options
 ------------
-- 
2.35.1.1094.g7c7d902a7c-goog

