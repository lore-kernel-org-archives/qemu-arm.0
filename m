Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A6FC98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:09:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMWN-00038m-4u; Sat, 26 Sep 2026 03:08:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSd-000602-IW
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:46 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSb-0000lg-QW
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:39 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-328664ef791so902864eec.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406276; x=1791011076; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=1Q4keI4TP8YVH/qoyQSJo+GdMMgFJJFdW1/lFaTcTQw=;
 b=PYl0VnY3ctOPDUMbs/Vbl7wQGOIU86ueoPCGuzzEKQhOJGq2qqwoshOGkljTeuZetB
 ujk7tLI5gplG1RkjF4JhDCSyPE31lkFYfTbJsRMsTbTQWb7lWHMyM+AU+LWH+DRVcVOF
 oB9w+YPMcVbIU7HkgT9ujYD5MGjSHlh6QGuyin+tC++lZUmim3fTtDs+L+FlHEtIh6mA
 igiMIV/wb1SKLRXAnHx2Ic1u+8zv3P3wLw3bo1lHRutMTjFnKOFxckNsrv4nTj27PYE0
 RPUQMuHI2NHYvfexJeCdRJFqjo92F2ZQ44rBo7QZqtJnwgAyZ+icNtpxazPWCofZiiIa
 aL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406276; x=1791011076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1Q4keI4TP8YVH/qoyQSJo+GdMMgFJJFdW1/lFaTcTQw=;
 b=tlALwcK+rlq5782TCH9wEtB5zeL9J7Hb8vY3sjz7sdR86M7W0qmId2IHrEwKyMioKi
 Y1A828hRdH6Le7dxuXu6NdX1RtQkxsba/sADfRuJArrN7b+w/NBZyN23Fyo7x9QYJmJX
 XN7yTaaDHvLaseboS0h3QxqiGsZ8E5F7qg+QoaBwQ89lvLYwgrZjr3iOgzHjpRmdg4b1
 Mfwk7tP/cqGghMtHTuVybZSaU/M+ml0Djbxvk53vK9eDPlIs3UYGyo/tON5LJWLa2EFn
 2+2ywRtAAT/VnpygRxEh7TyEaSq0yt3BXAlH7MOr623+cw+b2C5xMWUE0wobSWIvXupO
 HArA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwaT1lkQMnK5YKiRTym+GVRgHc5dRdPNvUfneK2UWBqzuZG4vh5qf5glY4PlAf5EgqpZwKmTsZAMg==@nongnu.org
X-Gm-Message-State: AFuF++l5MhUr7rwFcHXSnkP3r3U06e/TGVV0A8APh04t6Jl1tfHYlF1N
 jBBpy16spsbGuaaUPVYMYlT2QZt8fbRzoSmas/7EMyGqzK01//bUFt/k
X-Gm-Gg: AYBFou0Rtv+qItcpfKEuucxQSeZiQKJOnwK1ZkmxPIp1cSlM+UcGrRbNBkPris49Pot
 /YNUZbWLoqBm3dj+EG2+yCB0Lzmo3wLe1piQIwqE+dUyYClh1S5cgVAfKA2fDc10xZrCK4kIuGy
 LP6Ol62pG0tS7bs/lIq9U4llcvIzs4/8IMV9r7m0r8FBN34/rsUQiWPGCvhexgeIh6IX1ZX6Kod
 AmK0WGLeERzzvdgp/LCbYqhx8e6gqo7K6p1hZ7XPw8vcjNfXse5xVdNokTtUq2buOKK/qWhySXY
 X87hRHA2jdxl6ZQc6UFZDIRfpF+cb7ghKfYVXFr7dz0+g2UGaMW7KMBQkrFAYvvow2Db3DaF/Ra
 KeQbk0YKIXYjxUyDjhmB5OagGbIJf9+EwD1gpHERMbU24YM2nVKWaYtl4fUbhHZQ0g5cbYgzbWr
 7oyZIWo6/J34v7WIbaZ9pgFjm7WR93K49LoJ2A5FZcWYXY6IGAgViVGhiLBqaEPENsrkeclEGz3
 CkujYamc2/sPZA4rLaL8EL6aN+byGo4Rn2KklyCdA==
X-Received: by 2002:a05:693c:8807:20b0:33b:e264:362a with SMTP id
 5a478bee46e88-3427169e0acmr2042711eec.13.1790406276353; 
 Sat, 26 Sep 2026 00:04:36 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:04:35 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 54/55] hw/arm: set aarch64-only machine
 TypeInfo.is_available
Date: Sat, 26 Sep 2026 15:00:53 +0800
Message-ID: <20260926070057.1234-55-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Set TypeInfo.is_available to target_is_aarch64 on sbsa-ref,
versal leaves, xlnx-zcu102, imx8mp-evk, npcm845, axiado-scm3003,
and ARM xen-pvh.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/ax3000-evk.c       | 1 +
 hw/arm/imx8mp-evk.c       | 1 +
 hw/arm/npcm8xx_boards.c   | 1 +
 hw/arm/sbsa-ref.c         | 1 +
 hw/arm/xen-pvh.c          | 1 +
 hw/arm/xlnx-versal-virt.c | 2 ++
 hw/arm/xlnx-zcu102.c      | 1 +
 7 files changed, 8 insertions(+)

diff --git a/hw/arm/ax3000-evk.c b/hw/arm/ax3000-evk.c
index a1708488710..0c3e53e4e7d 100644
--- a/hw/arm/ax3000-evk.c
+++ b/hw/arm/ax3000-evk.c
@@ -21,6 +21,7 @@ static const TypeInfo ax3000_evk_types[] = {
         .name          = MACHINE_TYPE_NAME("axiado-scm3003"),
         .parent        = TYPE_AX3000_MACHINE,
         .class_init    = axiado_scm3003_class_init,
+        .is_available  = target_is_aarch64,
     }
 };
 
diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index 3f376f86d91..bac2f9cbedf 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -159,6 +159,7 @@ static const TypeInfo imx8mp_evk_machine_types[] = {
         .name = TYPE_IMX8MPEVK_MACHINE,
         .parent = TYPE_MACHINE,
         .class_init = imx8mp_evk_machine_class_init,
+        .is_available = target_is_aarch64,
         .instance_init = imx8mp_evk_machine_init,
         .instance_size = sizeof(FslImx8mpEvkState),
     },
diff --git a/hw/arm/npcm8xx_boards.c b/hw/arm/npcm8xx_boards.c
index 4b3af165034..67b10843d88 100644
--- a/hw/arm/npcm8xx_boards.c
+++ b/hw/arm/npcm8xx_boards.c
@@ -248,6 +248,7 @@ static const TypeInfo npcm8xx_machine_types[] = {
         .name           = MACHINE_TYPE_NAME("npcm845-evb"),
         .parent         = TYPE_NPCM8XX_MACHINE,
         .class_init     = npcm845_evb_machine_class_init,
+        .is_available   = target_is_aarch64,
     },
 };
 
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 158b461eb48..426fa914e80 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -945,6 +945,7 @@ static const TypeInfo sbsa_ref_info = {
     .instance_finalize = sbsa_ref_instance_finalize,
     .class_init    = sbsa_ref_class_init,
     .instance_size = sizeof(SBSAMachineState),
+    .is_available  = target_is_aarch64,
 };
 
 static void sbsa_ref_machine_init(void)
diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
index f05956c1662..d9515f23e3b 100644
--- a/hw/arm/xen-pvh.c
+++ b/hw/arm/xen-pvh.c
@@ -95,6 +95,7 @@ static const TypeInfo xen_arm_machine_type = {
     .class_init = xen_arm_machine_class_init,
     .instance_size = sizeof(XenPVHMachineState),
     .instance_init = xen_arm_instance_init,
+    .is_available = target_is_aarch64,
 };
 
 static void xen_arm_machine_register_types(void)
diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
index 4018f2bf7d1..c02aa011916 100644
--- a/hw/arm/xlnx-versal-virt.c
+++ b/hw/arm/xlnx-versal-virt.c
@@ -401,12 +401,14 @@ static const TypeInfo versal_virt_machine_init_typeinfo = {
     .name       = TYPE_XLNX_VERSAL_VIRT_MACHINE,
     .parent     = TYPE_XLNX_VERSAL_VIRT_BASE_MACHINE,
     .class_init = versal_virt_machine_class_init,
+    .is_available = target_is_aarch64,
 };
 
 static const TypeInfo versal2_virt_machine_init_typeinfo = {
     .name       = TYPE_XLNX_VERSAL2_VIRT_MACHINE,
     .parent     = TYPE_XLNX_VERSAL_VIRT_BASE_MACHINE,
     .class_init = versal2_virt_machine_class_init,
+    .is_available = target_is_aarch64,
 };
 
 static void versal_virt_machine_init_register_types(void)
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index bb596218540..03b03b8317c 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -302,6 +302,7 @@ static const TypeInfo xlnx_zcu102_machine_init_typeinfo = {
     .class_init = xlnx_zcu102_machine_class_init,
     .instance_init = xlnx_zcu102_machine_instance_init,
     .instance_size = sizeof(XlnxZCU102),
+    .is_available = target_is_aarch64,
 };
 
 static void xlnx_zcu102_machine_init_register_types(void)
-- 
2.52.0.windows.1


