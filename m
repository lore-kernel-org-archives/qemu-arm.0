Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp2044390ejb;
        Mon, 24 Jul 2023 10:44:04 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHLHbR98Aa64D+SVzB4zqAfNq2/1WAnZTHJHWyWrWO+jepSxPIxMAF5c02I/zVZdkuan+ZV
X-Received: by 2002:a05:6214:188a:b0:62d:e416:a0de with SMTP id cx10-20020a056214188a00b0062de416a0demr481552qvb.41.1690220643841;
        Mon, 24 Jul 2023 10:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690220643; cv=none;
        d=google.com; s=arc-20160816;
        b=02Mb2aslPiCPVjP8tnKLnJDQdxe+kPVevmBH920piyp82WMtXH//K+o7DjxHdyc+qp
         MoPUu5D7VB8cDN8uo82y8mEycwu+BuxR7qhr5OachqGFKelCAPJgo9vQcnQHkS7XWb+6
         FyJFIbCn10pipp4NWCiNWOa3mwguuCyjCf3FlpIrE+44CW4J0bziyEr1/b66rrNcRCMK
         NwTb6rXyBZrBGliq5foWpT91V92hiT8d8CSML1m1BeAki4+TWerffCFygSJdNJGntKNm
         i1WAPDY1WqJOxVIHut3sbC9d4hCqxrIl9dQh71Cx39tBrgGR2Ak8TXDhrCrX41/WsahP
         y7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=v36Ezb822ebJ8nd5Azc7yBmOGNwXjSOF/9RPfNN4WmQ=;
        fh=jvpdohKmRoZMO537s6xMKXXtj7EZws1LOMQI/oP4vXs=;
        b=HRI7e7l2Lv/aTBOsXBw4/3K1h6sj5PMndR6KciFp+wLUsy6VgrWMbnpRfgEhVY1afX
         PREy4UVnH9bg4vJHMNUT9GtKhr1lg2VVZQvMa7opDctn3sE5LiCtdnx3txAksf4Ki06M
         YwmRwJSrE3C/EgwdOzZ+682AfMKLxXOdo11uuTkGaKTbuM7ovuWeME+Jos08FEZ8/g26
         jeWM9KfIuBi8hGYbmeFqPMUl84zFLWmhCaEZogXDrW0M7/0ZocftHemtDIV1tXyRf1s4
         WAK4AiBxP/rVr394XhAQB8kb5O3hzh5t6DL3P5TRj/X6TTICxWex/pu3a3Mwlh+s1p+Q
         x57A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bf7WG1sX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a0ce0c9000000b0063cd7353f69si1146940qvk.258.2023.07.24.10.44.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 10:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bf7WG1sX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNzb6-0007Dj-U3; Mon, 24 Jul 2023 13:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNzb0-0007AT-Q2
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 13:43:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qNzau-0004GQ-Qv
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 13:43:45 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31765792c7cso576535f8f.0
 for <qemu-arm@nongnu.org>; Mon, 24 Jul 2023 10:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690220619; x=1690825419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=v36Ezb822ebJ8nd5Azc7yBmOGNwXjSOF/9RPfNN4WmQ=;
 b=Bf7WG1sXXT6q82/+PGokC704KywPdQ7nl/CWmQ2uoivskvpTMUymGKWAk3ofh26Beg
 0CE9VMtn5zFXmUNoP3MFOfcii/sWJE3mWlwj/3ITKdZ+uMFioJYbLnO25mplzf/GTaDj
 pGHDYb3mD8f5cEG4/eE5HDaRETnhx83plARmV1j5dgTa7tdBWrWuAym8R+KRTCZh0fgk
 Ls0yGj+MfiO9r0TGPjSRL36UZeVltYfHbb7diFL9Ra87JztrYA0+1pLVpEBdjrqWUPG7
 UfYK6v4eaJbE2F1IRkC89t3HpzusVkuNfFhOg+iW80y3YpHmRo8ngffpTB/IcW9aSrd5
 fYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690220619; x=1690825419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v36Ezb822ebJ8nd5Azc7yBmOGNwXjSOF/9RPfNN4WmQ=;
 b=crrZJFSpZlARw84TKY/Y7cjyESrJL5CSMc9XFMnKoKTBFyOO9s/O3kIYodjRF5Dx5k
 o804ZYXQooyK4uO7fsfuijZG31epIWdplMqLIITC/40QapvfOLeFdbuuQ1ZSA/14lG7H
 BzyAOUYId+QumikU+dYcpPeuHHs5CjbU8EmbXAjvRfLOmauD9WChnIEpPmzfE81Sf7P8
 BPXqaxMjXuMPBYTnNBajG1wve0JjjQ//rM2cwn5PLusxky0rUfBbzvrGQH+6Hmh8EuVt
 j2UqG9KDGfPG82EZY9j4zTttOK3HUIORdu9awTdwFYgbT8YKRDOKGdHJq6JnEEIYYXTM
 MLlw==
X-Gm-Message-State: ABy/qLaBsQpE/+7DMLZidSSJ/Y4mb+JigOsgAmDr3dJndE6w+G8CMXBo
 664l1HZeJ0U6tg5MLA4qzikT98kg/eUaj0uebH0=
X-Received: by 2002:adf:f701:0:b0:317:3d36:b2cd with SMTP id
 r1-20020adff701000000b003173d36b2cdmr5808341wrp.71.1690220618737; 
 Mon, 24 Jul 2023 10:43:38 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a0560001b0300b0030e52d4c1bcsm13687423wrz.71.2023.07.24.10.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 10:43:38 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-8.2 2/3] hw/arm/armv7m: Add mpu-ns-regions and
 mpu-s-regions properties
Date: Mon, 24 Jul 2023 18:43:34 +0100
Message-Id: <20230724174335.2150499-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724174335.2150499-1-peter.maydell@linaro.org>
References: <20230724174335.2150499-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: Vv/2ZOw8wed/

M-profile CPUs generally allow configuration of the number of MPU
regions that they have.  We don't currently model this, so our
implementations of some of the board models provide CPUs with the
wrong number of regions.  RTOSes like Zephyr that hardcode the
expected number of regions may therefore not run on the model if they
are set up to run on real hardware.

Add properties mpu-ns-regions and mpu-s-regions to the ARMV7M object,
matching the ability of hardware to configure the number of Secure
and NonSecure regions separately.  Our actual CPU implementation
doesn't currently support that, and it happens that none of the MPS
boards we model set the number of regions differently for Secure vs
NonSecure, so we provide an interface to the boards and SoCs that
won't need to change if we ever do add that functionality in future,
but make it an error to configure the two properties to different
values.

(The property name on the CPU is the somewhat misnamed-for-M-profile
"pmsav7-dregion", so we don't follow that naming convention for
the properties here. The TRM doesn't say what the CPU configuration
variable names are, so we pick something, and follow the lowercase
convention we already have for properties here.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armv7m.h |  8 ++++++++
 hw/arm/armv7m.c         | 21 +++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index b7ba0ff409c..e2cebbd15c0 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -52,6 +52,12 @@ OBJECT_DECLARE_SIMPLE_TYPE(ARMv7MState, ARMV7M)
  * + Property "vfp": enable VFP (forwarded to CPU object)
  * + Property "dsp": enable DSP (forwarded to CPU object)
  * + Property "enable-bitband": expose bitbanded IO
+ * + Property "mpu-ns-regions": number of Non-Secure MPU regions (forwarded
+ *   to CPU object pmsav7-dregion property; default is whatever the default
+ *   for the CPU is)
+ * + Property "mpu-s-regions": number of Secure MPU regions (default is
+ *   whatever the default for the CPU is; must currently be set to the same
+ *   value as mpu-ns-regions if the CPU implements the Security Extension)
  * + Clock input "refclk" is the external reference clock for the systick timers
  * + Clock input "cpuclk" is the main CPU clock
  */
@@ -95,6 +101,8 @@ struct ARMv7MState {
     Object *idau;
     uint32_t init_svtor;
     uint32_t init_nsvtor;
+    uint32_t mpu_ns_regions;
+    uint32_t mpu_s_regions;
     bool enable_bitband;
     bool start_powered_off;
     bool vfp;
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 50a9507c0bd..bf173b10b8b 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -334,6 +334,25 @@ static void armv7m_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    /*
+     * Real M-profile hardware can be configured with a different number of
+     * MPU regions for Secure vs NonSecure. QEMU's CPU implementation doesn't
+     * support that yet, so catch attempts to select that.
+     */
+    if (arm_feature(&s->cpu->env, ARM_FEATURE_M_SECURITY) &&
+        s->mpu_ns_regions != s->mpu_s_regions) {
+        error_setg(errp,
+                   "mpu-ns-regions and mpu-s-regions properties must have the same value");
+        return;
+    }
+    if (s->mpu_ns_regions != UINT_MAX &&
+        object_property_find(OBJECT(s->cpu), "pmsav7-dregion")) {
+        if (!object_property_set_uint(OBJECT(s->cpu), "pmsav7-dregion",
+                                      s->mpu_ns_regions, errp)) {
+            return;
+        }
+    }
+
     /*
      * Tell the CPU where the NVIC is; it will fail realize if it doesn't
      * have one. Similarly, tell the NVIC where its CPU is.
@@ -530,6 +549,8 @@ static Property armv7m_properties[] = {
                      false),
     DEFINE_PROP_BOOL("vfp", ARMv7MState, vfp, true),
     DEFINE_PROP_BOOL("dsp", ARMv7MState, dsp, true),
+    DEFINE_PROP_UINT32("mpu-ns-regions", ARMv7MState, mpu_ns_regions, UINT_MAX),
+    DEFINE_PROP_UINT32("mpu-s-regions", ARMv7MState, mpu_s_regions, UINT_MAX),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.34.1

