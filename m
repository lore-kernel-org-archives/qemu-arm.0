Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A8BCA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 08:53:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xENB5-0007Q0-4C; Wed, 07 Oct 2026 04:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIZi-0005Bw-NR
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:44:30 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEIZZ-0001do-PF
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 23:44:08 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c2e5d08214dso522382966b.1
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 20:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791344636; x=1791949436; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=b00qIVQjxzUez6mivBhAzHlvEuKBA7PieDHBj92W3ss=;
 b=pqRRBn33shVC0xDxdxg2Fw4cjD3uGZowhb2qxS1uPgssuS74hckBOSJDwSXr0RpKmL
 iMrKjmAzUgIt5cUfstGBUdYsM01/6RT9GPz9xKzC/ndkqVKfRiGF8dMuf0i3umgAABrF
 qQSm6iX/H0ko/re1YIrdXutIS1aJOFtImrAtFPLprp9wvNW8Vnxf3WdZOfSJ1jJVF+b8
 QG95BM27CJZKHbrjxRSIwcZN+m8X1R7/zSOMFOb75feQNbR6FL9s3Tc0b/JT6Dtb3J/W
 n77AnSqpZc0FXAiq/gvOKw78NXz1hecp6nCBQi8ma0LG2eOR+mFu0XGEnNuUM3OxFpHc
 V83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791344636; x=1791949436;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=b00qIVQjxzUez6mivBhAzHlvEuKBA7PieDHBj92W3ss=;
 b=U5swLWcg0YLHa99rfQX5ADn2m+Y1XO36cxEj30VDBjBksmTvPEnKRzMkcxF66FZGtE
 CDWdGfU2mReJYddWYUgpJbRv1xkSyFT0T7E8Yb1vibsUbZkZ+m36lN4uVG1q6ZMtE55+
 7OCR3RAq1tA4LHA4jXa9umQp3LViSSFgB39U/CkgJNL92wN1G27D1cV0y/bksUt7vPhD
 lZdLG63smRxn28TuwX4XuKgAQ6hFoZUtWzTcBsEZgUI3L15SLU+5LHIqPDxNx78we8XZ
 AodxMrw2sTTfNlYXTITKoV6hNfTab3zx7cdQ6eHOS03SpN4YakPP37+392Hgn/9TmxDM
 5Zfg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLoH1ndWnhlkwnc6EtfhkJBTIml1ATScFGSj3ebr9wi3umUderzDEfAOnOBbWWSyWDyeh2n4LpXg==@nongnu.org
X-Gm-Message-State: AFuF++nFxqz84iu2BIX84YTWHghsQsf0AzjoFi5kVKHcShCxErHH+R73
 JUB7vzhBN5fp9de93ZfqdRgPwWjHLd9AbLtJI+ZAmAVuWlTTSJ6QpIGZ9FLg0Q==
X-Gm-Gg: AYBFou3+yq5+wLs+GkKsCxX3sitnliU0SmYzL2fhQHcU/muCVc2jTFVr75w95cCmzXz
 P+V4spoqJgVWShK0W1gDvynNg25vZVnCj9LSABKToeN0w2g45EqPhl3Prc+efjqaiiJVw5Pyt65
 uFofkHAurllg6t97abrn6HPL5hne1rNiVq0iAmIUDjwTRDIghuepkQr0MPGnjmaf5HQv2ZjIxP9
 ahYqzCi08ExavaMsMOR6TrL6cpql3Xn76fswKyFzG4AGaw2jghihQmxGrJdtMio6rDhbnvdMJ9v
 wkgs794qejFlGaghG5r9rVCNQDVtBqb7UzjeVqi+HRRCiA+VTetf8G2K2wYQGGYOMvZ6NN/Fdzh
 tvO3SsQc+j18elKKbrSCTn91bbzthFGUFaZB+azQVMO2YcYA7OWHPrR4ohho2U2aKY+B4ANJWSP
 i3KetduQCUc4IgPutH1Mg7y9ZDf7+kaWwfKODqVGFEATvCti3hk0MyEYr3hYqRObo6LZup6CVpS
 Ju1Qug5MxWTOWj3RSxxxWdyYPuFm2c8YA12pQ==
X-Received: by 2002:a05:6000:29ce:b0:48c:67d6:a87a with SMTP id
 ffacd0b85a97d-48c67d6a90amr2803641f8f.32.1791275728163; 
 Tue, 06 Oct 2026 01:35:28 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:27 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 07/31] hw/arm/sabrelite: Have 4 CPUs and 1 GiB of RAM by
 default
Date: Tue,  6 Oct 2026 10:34:19 +0200
Message-ID: <20261006083445.30362-8-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Having four CPUs and 1 GiB of RAM matches real hardware. Fix the machine
defaults to make its use more ergonomic and less error-prone. Also
reflect this in the board documentation.

To reproduce the old default behavior for e.g. migration purposes,
`-smp 1 -m 128M` needs to be passed on the command line.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/sabrelite.rst | 4 ++--
 hw/arm/sabrelite.c            | 3 +++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/sabrelite.rst b/docs/system/arm/sabrelite.rst
index d3a3c01dd6..b8ac9548f5 100644
--- a/docs/system/arm/sabrelite.rst
+++ b/docs/system/arm/sabrelite.rst
@@ -55,7 +55,7 @@ To boot the newly built Linux kernel in QEMU with the SABRE Lite machine, use:
 
 .. code-block:: bash
 
-  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+  $ qemu-system-arm -M sabrelite \
       -display none -serial null -serial stdio \
       -kernel arch/arm/boot/zImage \
       -dtb arch/arm/boot/dts/imx6q-sabrelite.dtb \
@@ -89,7 +89,7 @@ the -kernel argument, along with an SD card image with rootfs:
 
 .. code-block:: bash
 
-  $ qemu-system-arm -M sabrelite -smp 4 -m 1G \
+  $ qemu-system-arm -M sabrelite \
       -display none -serial null -serial stdio \
       -kernel u-boot
 
diff --git a/hw/arm/sabrelite.c b/hw/arm/sabrelite.c
index 05dfabd937..34f302f83c 100644
--- a/hw/arm/sabrelite.c
+++ b/hw/arm/sabrelite.c
@@ -17,6 +17,7 @@
 #include "hw/core/boards.h"
 #include "hw/core/qdev-properties.h"
 #include "qemu/error-report.h"
+#include "qemu/units.h"
 #include "system/qtest.h"
 
 struct SabreliteMachineState {
@@ -139,7 +140,9 @@ static void sabrelite_machine_class_init(ObjectClass *oc, const void *data)
     mc->desc = "Freescale i.MX6 Quad SABRE Lite Board (Cortex-A9)";
     mc->init = sabrelite_init;
     mc->max_cpus = FSL_IMX6_NUM_CPUS;
+    mc->default_cpus = FSL_IMX6_NUM_CPUS;
     mc->ignore_memory_transaction_failures = true;
+    mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sabrelite.ram";
     mc->auto_create_sdcard = true;
 }
-- 
2.56.0


