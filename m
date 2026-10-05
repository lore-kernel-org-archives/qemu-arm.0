Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F9FECA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:20:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfni-0002iP-Et; Mon, 05 Oct 2026 06:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmJ-0002Gf-47
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:39 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmH-0000wK-5i
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:38 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ce364488dso5052225e9.0
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195513; x=1791800313; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=b00qIVQjxzUez6mivBhAzHlvEuKBA7PieDHBj92W3ss=;
 b=quncPJLqy9/O9Lwc6jAKThGc8V9iN+xIb52c+4HG1vvbhi2MknElS58FOL0u8/sLOR
 mQu6fFR01oYeiXrXT1MVNKnx9MarrzvUSnhVBtorq6jE5qJ5F4kQNa9E1lmbbQiF/6X5
 +ZRArpjEHvLl7B0073aqWVaukHY3GhhpF2Hl5f/tm5bxZUHVQEp0if9hm9zV8QnxKGTU
 BpGOOYpZiVdWTmHCeNiUlZkKRO/xfd2FsGird4GyPQbcQSaeUdzjUEpJK50oEozRSyTi
 gQ4hjidm8qbfIJKlmjz6/aBNl8qiobCLpZn3CEG5JITQqBnoGDCB/E5yrzJycfAPQzRA
 TIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195513; x=1791800313;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=b00qIVQjxzUez6mivBhAzHlvEuKBA7PieDHBj92W3ss=;
 b=SR8WdQq4LaN9Yx3OZlFYuV3haJIcaZBsokIRWwyx9GbyRg02DLy/AjriOxsYnl77BH
 KT5nfcs5IWrY63eweCV8C7vyhoeTYQQXzoNDCdjLrSTFh9rGDoJkTAnZI+qh1zbN6WEA
 tbhk7MP/AIwCujiHJpHzG4QsbXb3DIsa67LgUjLjt41G3TYLve2vqub6FvjWyRe0/KSL
 R6E3zgM6bb3lchZPBAzilO1hFTq84xbqoYR2n3/WaaoiWIhO7d9jSg2H8pcGzduGFnMU
 rqJVW6IO9l5NZyKuPO2sjEcDZifjGgOKm3AdveOdUqjlkF9wcN+aljkcaq/+kSs6vd9z
 QhXg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzLKGNDroZ8DkXCet8wHYi5APXzL0DUv5+FFHVLj3jSR4vy1YDT0wIXIIK5W99KZMkZ60tAFRXvLA==@nongnu.org
X-Gm-Message-State: AFuF++lNHkw+lpwTjrXd7m18E9TD1K3vJe0GvjPTmnGJh3j78gXZFqti
 auefd3uRrAJ4CeIBxZzHKGjqqbmoVQGw30l4adpK4E6VVKdZUaJXrmGe
X-Gm-Gg: AYBFou2E0OYVfS8HWVATfSmmM2SgV2vvuF5VtDs7MGG0ykD//GxGevI4g/slG2Cin4G
 HvgaSFbjjbmO9fjZz4q8frLziYybZlKxJkdFliRon+3AYKE9M4ZYZYXf2kEqkgTgC1gf4b6zIVN
 D9UoscEMRcJweDRyJk4T29AJsHFYZ0/699GQiryWyguA4SyHh8Y/PrhBchUXosfzhhjWPe28Frk
 Pxxii5AWXjuCPAQVUq/1U4/5mRBsQQ2JMMO5TKJn/lBxFUucXZYqzxCw7BbygCT23732NrWkun4
 w7/FdonclZneCy+YSxEeWli66yJFL25iwk9PAxg0WF55FdtPn82rHlbw139ETmZ4IqANE0tcAWk
 WEaRJt63eR9CEM7zck4D0P/w8AEWO7Hu4t4aSs6TJuk7lBCeB1h4ogIpar7lH64Nfv0hDxGP4j6
 iUX5AuALW/O59UqTmy6BYtzDDDofYki/VrK2oDRlSxgUivHwXM3GnoaXL96ySo1E9CS9UwtWfWz
 dJKOsmVPZJHCeb7e5t4IIXo3aaU9QbHHRUnClwp8B0m5qms
X-Received: by 2002:a05:600c:190d:b0:49f:c5aa:9ef4 with SMTP id
 5b1f17b1804b1-4a02753fc8emr175863735e9.8.1791195512760; 
 Mon, 05 Oct 2026 03:18:32 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:31 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 07/31] hw/arm/sabrelite: Have 4 CPUs and 1 GiB of RAM by
 default
Date: Mon,  5 Oct 2026 12:17:34 +0200
Message-ID: <20261005101800.10821-8-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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


