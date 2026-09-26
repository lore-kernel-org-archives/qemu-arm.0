Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39011C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:13:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMWu-0004BT-Ex; Sat, 26 Sep 2026 03:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSS-0005o2-Dw
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:30 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMSQ-0000kH-Fs
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:04:28 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-3427493501eso504229eec.1
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406264; x=1791011064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=xBSqXEkr1ev4UBbYnYTwgul/tvqRWOfBQ9ClBL2I6+g=;
 b=OL151cEL7mwmL1sN6Wxb4lG9vwbSWY/j2qLkBjed82QtwxbshFYowB0MFxF5Mk4HJZ
 r8Xe+s+w7YmKo8SRNUOE46prnDOpdx0R4KTrWa7jQf7+rDq2arVZvm0zVzw0b2VSIUEF
 vwynV7fWMguRIA53YCSjutKpxmcuugsG9hrAUqwBezCPOm1OG1l9Q9d4XaU+cW2YVY06
 twkIr61ahPrGB6niKZSUiSQW/gfE+oORb2/zItYygTBjsGG5Ig5Q15poqiOCgwWeBD+p
 BEeVKaMMAlBay5zXXPk044PX877ULiigfnz/dh0Pt9vuN/hqCIirdM9dIW/o4W76GmvZ
 gtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406264; x=1791011064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=xBSqXEkr1ev4UBbYnYTwgul/tvqRWOfBQ9ClBL2I6+g=;
 b=bQBzJeugC4G+c0waGBN9szFcFS6FQfvzr1DwpzBv61yb5T7ZhIMRruvcgi4ReZ2zEg
 HwBjbu7c1TbXxvE9mrMcyKxXadp39llVs55b048WyBkgCkjLCUM87/sbuN6bYA4CEsf7
 Py5pAHyVoYk/LThrAxgYtHL7rjPDflNw7TUfHd1gGje6BuCx+d0/ysUPLE4yQEygMIls
 NOJGtXDVx0TBGc8o61V7UZr6E2lwC3RGPWbhuIStVhvthTq58dGP51Fbu+y/WqvPEKmB
 +Z8fH9ERbdT7yH/TrUp1E05UnEL2fRL3gjvMgD3B1r8AEvzIklqOWdy1aJGHTnTTkKPL
 TOiQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxA/eCLr+bRxeiKKiefgiP1ZhVEO+mk4cWEL3VNv2C9rN6CpsWNjSzkuqvSfwxeFEh2T6yW8Bgjgw==@nongnu.org
X-Gm-Message-State: AFuF++nSejxK/MakDftD6JEGe0Fxjv5K5EgafLUZzLXJ1vtk4xXzegiI
 tuYydtFShA7lyBydJYB9ods9hNXyK6rgYVgWP0wKjYoaitfyW7ni9jUX
X-Gm-Gg: AYBFou3/dM0DHCvZvTj/6NjhEfA1K//9KdM1bejh7L8lVau6+CNkiE+LY+EWatw9Pyd
 uwwOxoe5rpL2p0ghL0FFqGyTjcz5mc8v3sF4tLqypT5HRXeDbiO7jyWnVThdrMCk9/hqY614h1P
 Uk7LPBw4ELBAIC0U6E8bwdkbJumWqPCSSbgIlBKGhZEKWdxIOJCEhBQdEETGxJRdA0yILi5/zse
 w5JobsarhsNZkBWMljQhE5FCOLXjq8Z5aFuD8euA78sf5IzYukMWeqtHva7sjgf5OGtf1WKyRrF
 1SY0zEJzK0e7ViDXcbMBtguDwBtNFd8M6O5+eEVFCiVWkYzUHvbGpkzlNwwVlky20VHf3iSnVGP
 Hu0aboQ2QhfNhlPcIoU2mKRM+AVuYZKOQwojZKpk9n9hlN0UxP6YxEt+kPV7ZdldLoE7S1il+7Y
 Yunoq4H4cIF7nbEjhILk9yaO6nd8PO8FEauiJTWGOzLtVfGb6VwE558AOKrPjfX3xunk3bgtX7z
 fE+gRgPMINCoPsW1CnLHVFGMtuc1hPROmI6bvEWtQ==
X-Received: by 2002:a05:7300:7fa7:b0:341:85c0:91ca with SMTP id
 5a478bee46e88-3427217a1d7mr3157912eec.22.1790406264285; 
 Sat, 26 Sep 2026 00:04:24 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:04:23 -0700 (PDT)
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
Subject: [PATCH v4 51/55] hw/arm: expand imx8mm-evk DEFINE_MACHINE to TypeInfo
Date: Sat, 26 Sep 2026 15:00:50 +0800
Message-ID: <20260926070057.1234-52-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
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

Replace DEFINE_MACHINE_EXTENDED with a TypeInfo, rename
imx8mm_evk_machine_init to imx8mm_evk_machine_class_init, and set
is_available to target_is_aarch64.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/arm/imx8mm-evk.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/hw/arm/imx8mm-evk.c b/hw/arm/imx8mm-evk.c
index c3215b11cb9..5dfd8250459 100644
--- a/hw/arm/imx8mm-evk.c
+++ b/hw/arm/imx8mm-evk.c
@@ -8,6 +8,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/target-info.h"
 #include "system/address-spaces.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/fsl-imx8mm.h"
@@ -122,8 +123,10 @@ static const char *imx8mm_evk_get_default_cpu_type(const MachineState *ms)
     return ARM_CPU_TYPE_NAME("cortex-a53");
 }
 
-static void imx8mm_evk_machine_init(MachineClass *mc)
+static void imx8mm_evk_machine_class_init(ObjectClass *oc, const void *data)
 {
+    MachineClass *mc = MACHINE_CLASS(oc);
+
     mc->desc = "NXP i.MX 8MM EVK Board";
     mc->init = imx8mm_evk_init;
     mc->max_cpus = FSL_IMX8MM_NUM_CPUS;
@@ -133,6 +136,18 @@ static void imx8mm_evk_machine_init(MachineClass *mc)
     mc->get_default_cpu_type = imx8mm_evk_get_default_cpu_type;
 }
 
-DEFINE_MACHINE_EXTENDED("imx8mm-evk", MACHINE, Imx8mmEvkMachineState,
-                        imx8mm_evk_machine_init, false, false,
-                        NULL)
+static const TypeInfo imx8mm_evk_machine_class_init_typeinfo = {
+    .name          = TYPE_IMX8MM_EVK_MACHINE,
+    .parent        = TYPE_MACHINE,
+    .class_init    = imx8mm_evk_machine_class_init,
+    .instance_size = sizeof(Imx8mmEvkMachineState),
+    .abstract      = false,
+    .is_available  = target_is_aarch64,
+};
+
+static void imx8mm_evk_machine_class_init_register_types(void)
+{
+    type_register_static(&imx8mm_evk_machine_class_init_typeinfo);
+}
+
+type_init(imx8mm_evk_machine_class_init_register_types)
-- 
2.52.0.windows.1


