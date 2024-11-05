Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2805909njc;
        Tue, 5 Nov 2024 05:05:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVAF02HsPHpexNeb/uB1mIvnKxp5kN1aialYCUqdFl5Bv924GNITzfcjs1b3fPYKhgmu0Ae7+ON4Jihcg==@linaro.org
X-Google-Smtp-Source: AGHT+IGl7rZQ41sboflXsGHpFxnd8jyPpnvAJLzdyHz6YYPq7P1u4uFf6FCq/tBLaEACVIzpa6CY
X-Received: by 2002:ac8:7f10:0:b0:460:9e6b:1f9d with SMTP id d75a77b69052e-461716d25c7mr317131371cf.21.1730811921711;
        Tue, 05 Nov 2024 05:05:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730811921; cv=none;
        d=google.com; s=arc-20240605;
        b=WVEoxFREcZEaAWJMAIMZ0U/SeCF2CG+fySrP21zSKGA1tVBGPum3vWFYe7WkOmiNXn
         nY+RtJQwGJNki5rq1lRZCAj3I2NgHxIUxbg4BnpLc5vbnZ0IJpT7kzbyvi7n7Vn/CJNW
         vnJYXdqXXayjWXGVOFc4WZ9sVq9s4w+h3zxjIp0JKV2V6+VSPZqb6t3TUAAVMSJw6xwP
         1+L+GgQNfz/iOJnINASfsRrVKTbzydRns0tqnlhICBiy3vuM95kfyYTScXLRFR2dw16F
         UoHHTrKaOEyKd14pfvE3lKohIQgQGqAcBd6HBp3pOA+qtG921uZkNm16RI/szVUCld0u
         8/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LoKTIjDa3J8vyZOU7wutUHSCN+Guhec+PI65dsartdI=;
        fh=hUqz3fHt+bwXgtQCtvD9HheKWKwRNDC8/aN7FLjPjdM=;
        b=b4eBPUWGXANsQie5J6MxM2iEK4/YXuTwbNNkzwjtA57p/7KPjiBxFt7vbhRVdBVAv3
         zKx6dU2wQzSUST90UkLKGLbu0v6sukxP+YWmHKYCmenHooqUo7gFfEWo3SXT6F6rin6r
         EfUCt9D1kmohsJde4SeGfCLXwhC6FYoPHnc8OBTCgEiRqDHO9u+nAcJQw5UtkpOJjcPD
         njONBZKctE9UwNVbE2RZfHyyyGq8noDenGCuIhLoSvkV5jtAmA+mEI2I13Cb4Ykm7egr
         Rf+9NYf6PXq2uTLMFPKJwP4OO1hvBQVYMM+/MeWuejHnJtnivSfWUfsA38/rayH2zj//
         wP0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vX1D/h4l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad24e9efsi125955791cf.656.2024.11.05.05.05.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:05:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vX1D/h4l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8JEz-00017K-T6; Tue, 05 Nov 2024 08:05:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JEy-00016z-M9
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:05:00 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8JEw-0002Bo-VJ
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:05:00 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-431616c23b5so33967015e9.0
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730811897; x=1731416697; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LoKTIjDa3J8vyZOU7wutUHSCN+Guhec+PI65dsartdI=;
 b=vX1D/h4lsgokf2/4ecfj9Qd/Rirc+GF3gGBUvNr8rVpGGpUGq1lcauJ+e3kXm48WJ0
 f47rziE0K4bakHKtFWj2x+vOddgiDUdCbtxz7hfs5Vp8Ro+gTCKr0WAlwbGY8BxXphA6
 oTu1yioWtB9BPOpgZvCxOioEEO1vaaCr3nBE+pegmBK/a/Msd8wtosJcp9vGkDXeIoTB
 Q7IbapxgBCb9ITMD7TdiB35BSjd3jnM+hSYXGFay9WKbPRnQX6i0a8kOTmZWAnBftew4
 148uGW0iCXJr1xp3vRcd4r+Ur5DPT1wUZWVZRV+eJMmyCmFBQykzIpTeayJwEI2XIPYl
 U/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730811897; x=1731416697;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoKTIjDa3J8vyZOU7wutUHSCN+Guhec+PI65dsartdI=;
 b=fApMYHNvy4or/vbD+2wr+P3DkciNyfPmM7/fxhnRHc4QVl3oLJwK5Z6/PIbQsRGqPU
 sWyD/K9jfW0sVqNhm19ovblQQN4fb6IZiEXO13oIE7Q95BY7Z2f+aRukyVxJNQpCT6RK
 injG02UtmE3x1zJEa/nfM71B3gG8bkMaOawUaqs5acwRWrrj56PHsdNEwyb9cfHLCsW7
 PtIHimc9msK/gApuEcsy2CGSi1ZitG0cKtme7Hj2e1YZRBrlOdWO4ZmvWYl3Hx8vmBPN
 qkQAOlY/yUZ2RbO9bP9n5YJhWpzXzMpu9mAn3k8mn8bziI7g/wXc6C+Ej3bAeD623LV5
 myZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp8BXo39rm2WZp/PHhNY/ff2WbEaOYmJlp8u80RpHl4ROAqsK9SRdwUTxSjatBKY50pMsLgrqrgA==@nongnu.org
X-Gm-Message-State: AOJu0Yx2vozZfmOIZqMZqGtE8zU/3F+NrcbMRO2iKZ/jq3R266Ea4sft
 c1QCsHlwUlMKYqJNgQKi7oZrFMD6l0fsE/XSQyeKTikMz1WTk+5D3mUseRm0dIw=
X-Received: by 2002:a05:600c:460f:b0:426:5e32:4857 with SMTP id
 5b1f17b1804b1-4327d840fdemr148920265e9.0.1730811897231; 
 Tue, 05 Nov 2024 05:04:57 -0800 (PST)
Received: from localhost.localdomain (86.red-88-29-160.dynamicip.rima-tde.net.
 [88.29.160.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e725dsm16182932f8f.56.2024.11.05.05.04.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 05 Nov 2024 05:04:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 02/19] hw/microblaze: Deprecate big-endian petalogix-ml605 &
 xlnx-zynqmp-pmu
Date: Tue,  5 Nov 2024 14:04:14 +0100
Message-ID: <20241105130431.22564-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241105130431.22564-1-philmd@linaro.org>
References: <20241105130431.22564-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wgLdqWPogANR

The petalogix-ml605 machine was explicitly added as little-endian only
machine in commit 00914b7d970 ("microblaze: Add PetaLogix ml605 MMU
little-endian ref design"). Mark the big-endian version as deprecated.

When the xlnx-zynqmp-pmu machine's CPU was added in commit 133d23b3ad1
("xlnx-zynqmp-pmu: Add the CPU and memory"), its 'endianness' property
was set to %true, thus wired in little endianness.

Both machine are included in the big-endian system binary, while their
CPU is working in little-endian. Unlikely to work as it. Deprecate now
as broken config so we can remove soon.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst                        | 6 ++++++
 configs/devices/microblaze-softmmu/default.mak   | 2 --
 configs/devices/microblazeel-softmmu/default.mak | 5 ++++-
 hw/microblaze/petalogix_ml605_mmu.c              | 7 ++++++-
 hw/microblaze/xlnx-zynqmp-pmu.c                  | 8 ++++++--
 5 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index ff404d44f85..e1c8829e1a4 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -279,6 +279,12 @@ BMC and a witherspoon like OpenPOWER system. It was used for bring up
 of the AST2600 SoC in labs.  It can be easily replaced by the
 ``rainier-bmc`` machine which is a real product.
 
+Big-Endian variants of MicroBlaze ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` machines (since 9.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little endian
+CPUs. Big endian support is not tested.
+
 Backend options
 ---------------
 
diff --git a/configs/devices/microblaze-softmmu/default.mak b/configs/devices/microblaze-softmmu/default.mak
index 583e3959bb7..78941064655 100644
--- a/configs/devices/microblaze-softmmu/default.mak
+++ b/configs/devices/microblaze-softmmu/default.mak
@@ -2,5 +2,3 @@
 
 # Boards are selected by default, uncomment to keep out of the build.
 # CONFIG_PETALOGIX_S3ADSP1800=n
-# CONFIG_PETALOGIX_ML605=n
-# CONFIG_XLNX_ZYNQMP_PMU=n
diff --git a/configs/devices/microblazeel-softmmu/default.mak b/configs/devices/microblazeel-softmmu/default.mak
index 29f7f13816c..4c1086435bf 100644
--- a/configs/devices/microblazeel-softmmu/default.mak
+++ b/configs/devices/microblazeel-softmmu/default.mak
@@ -1,3 +1,6 @@
 # Default configuration for microblazeel-softmmu
 
-include ../microblaze-softmmu/default.mak
+# Boards are selected by default, uncomment to keep out of the build.
+# CONFIG_PETALOGIX_S3ADSP1800=n
+# CONFIG_PETALOGIX_ML605=n
+# CONFIG_XLNX_ZYNQMP_PMU=n
diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
index df808ac323e..61e47d83988 100644
--- a/hw/microblaze/petalogix_ml605_mmu.c
+++ b/hw/microblaze/petalogix_ml605_mmu.c
@@ -213,7 +213,12 @@ petalogix_ml605_init(MachineState *machine)
 
 static void petalogix_ml605_machine_init(MachineClass *mc)
 {
-    mc->desc = "PetaLogix linux refdesign for xilinx ml605 little endian";
+#if TARGET_BIG_ENDIAN
+    mc->desc = "PetaLogix linux refdesign for xilinx ml605 (big endian)";
+    mc->deprecation_reason = "big endian support is not tested";
+#else
+    mc->desc = "PetaLogix linux refdesign for xilinx ml605 (little endian)";
+#endif
     mc->init = petalogix_ml605_init;
 }
 
diff --git a/hw/microblaze/xlnx-zynqmp-pmu.c b/hw/microblaze/xlnx-zynqmp-pmu.c
index 43608c2dca4..567aad47bfc 100644
--- a/hw/microblaze/xlnx-zynqmp-pmu.c
+++ b/hw/microblaze/xlnx-zynqmp-pmu.c
@@ -181,9 +181,13 @@ static void xlnx_zynqmp_pmu_init(MachineState *machine)
 
 static void xlnx_zynqmp_pmu_machine_init(MachineClass *mc)
 {
-    mc->desc = "Xilinx ZynqMP PMU machine";
+#if TARGET_BIG_ENDIAN
+    mc->desc = "Xilinx ZynqMP PMU machine (big endian)";
+    mc->deprecation_reason = "big endian support is not tested";
+#else
+    mc->desc = "Xilinx ZynqMP PMU machine (little endian)";
+#endif
     mc->init = xlnx_zynqmp_pmu_init;
 }
 
 DEFINE_MACHINE("xlnx-zynqmp-pmu", xlnx_zynqmp_pmu_machine_init)
-
-- 
2.45.2

