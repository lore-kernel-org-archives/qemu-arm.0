Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A33B5CC6B1A
	for <qemu-arm@archiver.kernel.org>; Wed, 14 Oct 2026 09:33:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGvM6-0002bD-54; Wed, 14 Oct 2026 05:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvM4-0002U0-G7
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:33:00 -0400
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xGvM2-0000OK-8m
 for qemu-arm@nongnu.org; Wed, 14 Oct 2026 05:33:00 -0400
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-15ea896ddc8so1076996c88.0
 for <qemu-arm@nongnu.org>; Wed, 14 Oct 2026 02:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791970377; x=1792575177; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MjVzzCq5lYIVN6hg7aa362sNxRreisqotHHSgGdfXuw=;
 b=hG5jIi7vdDBNA6FqomjqxxgXcfKsqoSZozd0OiVYXZKu9fy8+asgGmPd4i75QBv4IJ
 EUS9n5hwwP24WH7xTLSvEqSyCgzEgFfIkX8iyKDQvohtamL6WmrbBLYXJ/pe09Xud2cb
 txcGO5PBEDTCge0fqAmw50KucwRNGMEJibDGryWSEofiHq9fE3MV01GEtPRZxK3VGVU4
 /98BstAJddMThyXQgsoUYqJosdbHtvFR7CPpzQBdpHJInyhYHRxnGHk4LUCu0jKXTUJI
 lPNnyU9800hoWXtK+GWPBK6sXTkGvQYPPocP4X7czDGgg+my3TWUZgIvzr1AimtA1/aG
 vpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791970377; x=1792575177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=MjVzzCq5lYIVN6hg7aa362sNxRreisqotHHSgGdfXuw=;
 b=ogk6WqAXZiBGPeXLu/I0NjqyFRqvt0d1vzY79PO5CN1ja8xFOtYf4SVJA7p7ycvO3j
 FW13hOA0xUF11OuNp0+NcSGVLfu38rvfO4jb3e/d7wr5dBi2HMbPks42d1A685R1/JEh
 15i+FEt2m2cwwa5eKavlQPCGkbek37l2u9IoUBhJXnHBTHE7iyYWioNs9SdG8asxgxxm
 0m+K9Wt5H/2lKH3xczczI1ycgZE7AwdJMY5pTcnr03HxXPi/nUgkxg5roMEoO5yEljk8
 1BztkRz9vTo5DpiqOjXvk3/027lgFuIl6GPHcOXkltmfegOUVgNVRV44opTWXCU0cAHs
 H7gw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzNlGd9PsHI9h/1rvTfBK2TGfafI7dn6ncN9tYlS/7398D7Gm8G+Qpcf4nLVeyQYQoVzEyyCFUPDg==@nongnu.org
X-Gm-Message-State: AFq9FYJFjCOGWkh7QS2dzpXmcR965ol3Zr/skKw0UZVspbhPjl7u48Es
 2RrXf3V/9XeS9lg2n0c+2oJtFznaztsYYQJG9lhdXof2k2tGRBPCTbDE
X-Gm-Gg: AYBFou3CSNzT1kiIfuwQI4JePBwsquA2xWGFxY6CqQ6F15LMaxrLEQzaKbZ9ppGDggX
 Va7iw9WaV0jjrrU0qNWvAVRUSFAqfdyJkEVdqrtguxJuAuLcO2X6L7mB18M+T9fmNhM+rn79was
 Pzj2eQY2mh4O68uMpZXX708vrWFr+94+xlw3gsOCV1dHG+7EDfEicgzB60RQxguDaAihoe3LpGt
 GtVYbmQ8vzCCOInDNTihzrURpgLzXXywi3Bveeh+k98R9ERF1jdZEHrzT92PXOEbUo05m2wtoC/
 xsiG/lgKug/jl+2tgmxlSc2i4bzPc2aMOsA9R/T6c5z229MTe9LfdTIpb+YYsXTPyMltiZD5ZjB
 W85ObjvMTxwxWOrHRpX9Dyi8P8f8GiUx5s0XvR6cQeMj+5d8hBNkgJEDSwSorArlJDdSyqz8hSI
 vwoqXl4iZNVPDl/R/wgmrMrGKyvKQubAIM32vH1WMb1b5k1LtbAXt/ce7R/NVMlHYGlIO9pag8C
 FYOcFNfiU7sn1yZ4Q==
X-Received: by 2002:a05:7022:171c:b0:14f:8e70:fad0 with SMTP id
 a92af1059eb24-16a6090d024mr20119702c88.33.1791970376544; 
 Wed, 14 Oct 2026 02:32:56 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1698de65af7sm48769303c88.0.2026.10.14.02.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 02:32:55 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-s390x@nongnu.org, Song Gao <17746591750@163.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Eric Farman <farman@linux.ibm.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stafford Horne <shorne@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Zhao Liu <zhao1.liu@intel.com>, Weiwei Li <liwei1518@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fam Zheng <fam@euphon.net>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Chao Liu <chao.liu@processmission.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH 05/34] qapi: add missing Linux user-mode targets to EmuTarget
Date: Wed, 14 Oct 2026 17:31:15 +0800
Message-ID: <20261014093152.834-6-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261014093152.834-1-luoyonggang@gmail.com>
References: <20261014093152.834-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1233;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x1233.google.com
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

This usermode targets:
aarch64_be
armeb
microblazeel
mipsn32
mipsn32el
ppc64le
sparc32plus
are not in machine.json

This is a prepare for directly using TARGET_ARCH_VARIANT latter.

Also get target-info.c to be compatible with future TARGET_ARCH_VARIANT only usage.
So that we can define TARGET_ARCH_VARIANT to target_name directly

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/qemu/base-arch-defs.h | 13 +++++++++++++
 qapi/machine.json             | 25 +++++++++++++------------
 target-info.c                 | 26 +++++++++-----------------
 3 files changed, 35 insertions(+), 29 deletions(-)

diff --git a/include/qemu/base-arch-defs.h b/include/qemu/base-arch-defs.h
index 7ddecc3d0be..6f3dadcc3a8 100644
--- a/include/qemu/base-arch-defs.h
+++ b/include/qemu/base-arch-defs.h
@@ -11,25 +11,38 @@
 
 #define QEMU_ARCH_BIT(target) (1ULL << (target))
 
+/* Unsuffixed family masks cover system targets; _ALL includes user targets. */
 enum {
     QEMU_ARCH_ALPHA =       QEMU_ARCH_BIT(EMU_TARGET_ALPHA),
     QEMU_ARCH_ARM =         QEMU_ARCH_BIT(EMU_TARGET_ARM) |
                             QEMU_ARCH_BIT(EMU_TARGET_AARCH64),
+    QEMU_ARCH_ARM_ALL =     QEMU_ARCH_ARM |
+                            QEMU_ARCH_BIT(EMU_TARGET_AARCH64_BE) |
+                            QEMU_ARCH_BIT(EMU_TARGET_ARMEB),
     QEMU_ARCH_I386 =        QEMU_ARCH_BIT(EMU_TARGET_I386) |
                             QEMU_ARCH_BIT(EMU_TARGET_X86_64),
     QEMU_ARCH_M68K =        QEMU_ARCH_BIT(EMU_TARGET_M68K),
     QEMU_ARCH_MICROBLAZE =  QEMU_ARCH_BIT(EMU_TARGET_MICROBLAZE),
+    QEMU_ARCH_MICROBLAZE_ALL = QEMU_ARCH_MICROBLAZE |
+                               QEMU_ARCH_BIT(EMU_TARGET_MICROBLAZEEL),
     QEMU_ARCH_MIPS =        QEMU_ARCH_BIT(EMU_TARGET_MIPS) |
                             QEMU_ARCH_BIT(EMU_TARGET_MIPSEL) |
                             QEMU_ARCH_BIT(EMU_TARGET_MIPS64) |
                             QEMU_ARCH_BIT(EMU_TARGET_MIPS64EL),
+    QEMU_ARCH_MIPS_ALL =    QEMU_ARCH_MIPS |
+                            QEMU_ARCH_BIT(EMU_TARGET_MIPSN32) |
+                            QEMU_ARCH_BIT(EMU_TARGET_MIPSN32EL),
     QEMU_ARCH_PPC =         QEMU_ARCH_BIT(EMU_TARGET_PPC) |
                             QEMU_ARCH_BIT(EMU_TARGET_PPC64),
+    QEMU_ARCH_PPC_ALL =     QEMU_ARCH_PPC |
+                            QEMU_ARCH_BIT(EMU_TARGET_PPC64LE),
     QEMU_ARCH_S390X =       QEMU_ARCH_BIT(EMU_TARGET_S390X),
     QEMU_ARCH_SH4 =         QEMU_ARCH_BIT(EMU_TARGET_SH4) |
                             QEMU_ARCH_BIT(EMU_TARGET_SH4EB),
     QEMU_ARCH_SPARC =       QEMU_ARCH_BIT(EMU_TARGET_SPARC) |
                             QEMU_ARCH_BIT(EMU_TARGET_SPARC64),
+    QEMU_ARCH_SPARC_ALL =   QEMU_ARCH_SPARC |
+                            QEMU_ARCH_BIT(EMU_TARGET_SPARC32PLUS),
     QEMU_ARCH_XTENSA =      QEMU_ARCH_BIT(EMU_TARGET_XTENSA) |
                             QEMU_ARCH_BIT(EMU_TARGET_XTENSAEB),
     QEMU_ARCH_OR1K =        QEMU_ARCH_BIT(EMU_TARGET_OR1K),
diff --git a/qapi/machine.json b/qapi/machine.json
index 07fac4f0764..a3d6e08a847 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -15,11 +15,10 @@
 
 ##
 # @EmuTarget:
-#     The comprehensive enumeration of QEMU system emulation
-#     ("softmmu") targets.  Run "./configure --help" in the project
-#     root directory, and look for the \*-softmmu targets near the
-#     "--target-list" option.  The individual target constants are not
-#     documented here, for the time being.
+#     The comprehensive enumeration of QEMU system and user-mode
+#     emulation targets.  Run "./configure --help" in the project root
+#     directory, and look for the targets near the "--target-list"
+#     option.  Individual target constants are not documented here.
 #
 # @rx: since 5.0
 #
@@ -30,17 +29,19 @@
 # @hexagon: since 11.0
 #
 # .. note:: The resulting QMP strings can be appended to the
-#    "qemu-system-" prefix to produce the corresponding QEMU
-#    executable name.  This is true even for "qemu-system-x86_64".
+#    "qemu-system-" prefix for system emulation, or the "qemu-" prefix
+#    for user-mode emulation, to produce the corresponding executable
+#    name, where that target supports the respective emulation mode.
 #
 # Since: 3.0
 ##
 { 'enum' : 'EmuTarget',
-  'data' : [ 'aarch64', 'alpha', 'arm', 'avr', 'hexagon', 'hppa', 'i386',
-             'loongarch64', 'm68k', 'microblaze', 'mips', 'mips64',
-             'mips64el', 'mipsel', 'or1k', 'ppc',
-             'ppc64', 'riscv32', 'riscv64', 'rx', 's390x', 'sh4',
-             'sh4eb', 'sparc', 'sparc64', 'tricore',
+  'data' : [ 'aarch64', 'aarch64_be', 'alpha', 'arm', 'armeb', 'avr',
+             'hexagon', 'hppa', 'i386', 'loongarch64', 'm68k', 'microblaze',
+             'microblazeel', 'mips', 'mips64', 'mips64el', 'mipsel',
+             'mipsn32', 'mipsn32el', 'or1k', 'ppc', 'ppc64', 'ppc64le',
+             'riscv32', 'riscv64', 'rx', 's390x', 'sh4', 'sh4eb', 'sparc',
+             'sparc32plus', 'sparc64', 'tricore',
              'x86_64', 'xtensa', 'xtensaeb' ] }
 
 ##
diff --git a/target-info.c b/target-info.c
index 241be2b5563..b2abcd55bd3 100644
--- a/target-info.c
+++ b/target-info.c
@@ -7,6 +7,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/base-arch-defs.h"
 #include "qemu/target-info.h"
 #include "qemu/target-info-qapi.h"
 #include "qemu/target-info-def.h"
@@ -44,23 +45,19 @@ bool target_big_endian(void)
 
 bool target_base_arm(void)
 {
-    switch (target_arch()) {
-    case EMU_TARGET_ARM:
-    case EMU_TARGET_AARCH64:
-        return true;
-    default:
-        return false;
-    }
+    return (QEMU_ARCH_ARM_ALL & QEMU_ARCH_BIT(target_arch())) != 0;
 }
 
 bool target_arm(void)
 {
-    return target_arch() == EMU_TARGET_ARM;
+    return target_arch() == EMU_TARGET_ARM ||
+           target_arch() == EMU_TARGET_ARMEB;
 }
 
 bool target_aarch64(void)
 {
-    return target_arch() == EMU_TARGET_AARCH64;
+    return target_arch() == EMU_TARGET_AARCH64 ||
+           target_arch() == EMU_TARGET_AARCH64_BE;
 }
 
 bool target_m68k(void)
@@ -75,13 +72,7 @@ bool target_or1k(void)
 
 bool target_base_ppc(void)
 {
-    switch (target_arch()) {
-    case EMU_TARGET_PPC:
-    case EMU_TARGET_PPC64:
-        return true;
-    default:
-        return false;
-    }
+    return (QEMU_ARCH_PPC_ALL & QEMU_ARCH_BIT(target_arch())) != 0;
 }
 
 bool target_ppc(void)
@@ -91,7 +82,8 @@ bool target_ppc(void)
 
 bool target_ppc64(void)
 {
-    return target_arch() == EMU_TARGET_PPC64;
+    return target_arch() == EMU_TARGET_PPC64 ||
+           target_arch() == EMU_TARGET_PPC64LE;
 }
 
 bool target_s390x(void)
-- 
2.55.0.windows.3


