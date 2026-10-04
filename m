Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326D7CA5FEC
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:27:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLJi-0006Rm-HS; Sun, 04 Oct 2026 08:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJg-0006QO-0p
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:44 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJe-00077J-1S
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:27:43 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso7965655e9.3
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116860; x=1791721660; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=BBF7OAN6WfbTmft3gohIU6YoFzMIf5lJrkPTZ7ZD/Gs=;
 b=DXm+oNGSTfiXcMiNPmp5ZiLbf3HJCLC6TGNPRE3eJIjpf96I3nHOLM+lPFFjLiXYQj
 pq6aTr8j6nytD6BhrmfcfPhou9tJ7mEL/YlQU6ITjWIitGB+YSB6l1+CuIYPFft2pScg
 TG/nR+0eG868gn3bxsuPc6IaYz1DmYqFqNZMPuSd4HL4gmyHtDJlgt+tyuzn7eftL5FP
 ekfgfwtxxclw2AOMBIS4AHapGrI3OOB18VKof68sh8RzEaUZxAwd0wr67KijZZf6tt1C
 ihXSfW+ACRccRXai9dKjhVfX2ar1dEgEbQL1drIQEehuRQY7qOCbdPLmp/edRTOv+0x/
 33mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116860; x=1791721660;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=BBF7OAN6WfbTmft3gohIU6YoFzMIf5lJrkPTZ7ZD/Gs=;
 b=zCPWhccfhM9JCizKfi7Zp/2QqB4WRsBZjXgFI5gkOCeUUrRkd6X85yDQSCkJmpfFLz
 VOHgGtEYDDxkdgV7lz4EuVyx/PYk1U/GjbwFhskaWg/5EbzfRGW0Dt/8NahAAKBCjDXQ
 1DzNa9ecKp4G473roD3PCNKIAyLGFgH56bYPwPw3r9UxbznCU13Ulqg2VoSEgjB7aEhK
 KkbWX8jZeXUTtzlZSflDf9Mx1KKLGSXnD+5jG27sx+Aljx+H/71LICB8LpuItdPwH0qY
 YEbwWassfUfrh7DbjFgkxY7NUX66zqplDOSyfK9GSuuU7FA//84a1VpmeC4eoJOlZX5C
 34qg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzj5I0DYAl36rVsIU19PJHc3c4vxaVG6juNZHHaOyy+FWa5vYWZFZnJ88Y0lAyWBw56BlHH815rcw==@nongnu.org
X-Gm-Message-State: AFuF++mxPnlKaJYnrF54vZRQZ1MGX4W8gc1vujfEOoo2Yt6Vf3BcgAJS
 2REqGcRcpssOb680ARCpWQjYI+VzwKbbHoSVOlmPcpgUUAiPas12C/lC
X-Gm-Gg: AYBFou2LXSKfdMXc3S+BMPhu29Z7iOV1jFXV8d1cCwIg+cVucmjOyBoYIPD5zTQKBLX
 a3pqBtc17QL+Ae8NDvVOhykwedHv/U480OUY1db/SQyg/AkCxZDqQKbvcTONOChO4AHfyImQwDs
 FjeewyV+vZG1g4DPU2ze6LipetraaMelhQeenfuxTxEhOHQoFDf5HIX7r+ghcV3FPEZJNAKNzLr
 gA4BIAO5PCH/HiLsSeThp/V7iiIcPTrxGL7BcqpzNpQD4bm2gkTOT4pWdckfeIxRGiaJsamHCYR
 l6DHv0lyJGncAFDZA0rHrMsUYac0ImWLg/r4WU9SzjGDMjN8ygBjkMoGpYgdj9Gd/G5crhdMVJK
 Rg6ik67dLb0o3g8zvKYy7CnshrbUBBWP8DhQxvJ5fPDSpti6GKgZgy5f+xEQDtP6e1peOAOS5g1
 iComY8K+gzVv4BVh8ohP4Wik1RDVeGVkE/bJHIuIpA6R+fdutLq04OFtFJBp0HP516GnW30wH6c
 5m5GVM02ApV9Un2iefX8kKf39UUh+GjNPU1Qw==
X-Received: by 2002:a05:600c:354a:b0:4a0:37b:5c25 with SMTP id
 5b1f17b1804b1-4a1680dd0c5mr77028955e9.11.1791116860570; 
 Sun, 04 Oct 2026 05:27:40 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:27:39 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 06/30] hw/arm/sabrelite: Have 4 CPUs and 1 GiB of RAM by
 default
Date: Sun,  4 Oct 2026 14:26:22 +0200
Message-ID: <20261004122647.3913-7-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
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


