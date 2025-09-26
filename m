Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E98CAC5AE
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Sep 2025 05:17:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v20pC-0004tR-Qp; Fri, 26 Sep 2025 01:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20p8-0004s2-1m
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:50 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v20ow-000624-Ia
 for qemu-arm@nongnu.org; Fri, 26 Sep 2025 01:16:49 -0400
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-b553412a19bso1370133a12.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 22:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758863791; x=1759468591; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqHlEJ+jUmeTVk3QBFsrihdSuV3s/WcYtgmO87+cyMw=;
 b=n9njWQtGQ+uSw4E0iyv4/l9oWsbKzwPlxBpmqybh1kHI3g+H35lwUfOqsKPMxyJjRE
 QWTJg+e7qzWhwKAQD5TQE70hV7s0iEtQf8+s4jD14Ag8bgZY6Y+0K81a/lU6ZKwSUcBp
 rmlrUsFJk9yAC2vV4H4UkApILs+fu+xs81HtLmohVLTX4MlaH0Ea95Dnxszxs+9u2V/C
 pvrAO+a7iDLcA8YICuOJji9mYGupDyH9CqJhUum+n+1kAHF/RLDtxgrpT1zCkKf/TOva
 OC2wihivIg0Z5PnD/ELgJruGKvxeomF4Uw5a7ZdIcip0JU1ZgAq+6PN5lShIbBYP0BXs
 BNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758863791; x=1759468591;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqHlEJ+jUmeTVk3QBFsrihdSuV3s/WcYtgmO87+cyMw=;
 b=bd1MmkdN30GaZMOKossnPE/2nO3oZNgWs/Aryet+NaGRfgvxsIXLH7NFqFHf1IP2Gp
 EDTS0VXMYG94+NNRumpHOUXy0Tw+wCqeavuqIf/IfHvtwe5lrYjfRitlw+A1XesR/5BM
 qL9eeWgmEStgUh9gBwmeuZBHA4W/5CNLsu6q30dIP0BprxCyd8fcFKvCa271M55nJdjR
 zBTi75EYynQVYihXMLnDzXhxNv3+oWS6UWBkznrl5rOU141EdSsjdlZIJEQejrsWTteh
 eDMaw291/WjSKhroLoZn0pWR910EDeWyQ5kDXR3yW6hg3Au8CW98FRa27vL7NIxqVV5r
 QW8A==
X-Gm-Message-State: AOJu0YxD8Wl1vm3FKorc7FQyfZJB27L90ct38MW2oE5T0+QGCgUNCnWm
 sxPdJ0vEIIxPCreUmRA5XtafeG4O5F7xJ/f2ik6WiiBFFiX/R/765Xa/+SswnJiHfDdiVI2NOt2
 aEctS
X-Gm-Gg: ASbGnctSICLfbKhfaFLELVTPymZYHtJIpJBOwhXNt8gPqFgkCGwzDZ94kvcqzKY2htg
 +lQxBqYOOheGaDNCSXr6epqij3OYxdXTYxrgI2qxdyvFo2yu8OSPs9TKlnea7kIqufN/+yGRc7e
 AhGKelfd5OsDBbY/gmZ11DKBERRwCiz5YDVRCILY5blhc2slL68CtkBXWJN6ANow9eIOGAbVr8T
 v1x9AEfZswd6nM6ZStop2WSqJ5fmwK7zO1cvB9seuDmaouHPo6sOnUf9XYkoFr9ySEUetVegqvE
 XsX3+EQ7l/JQYjyd/Ccj+7LlSDeUlzP62PYLIT/yIIMzU9JGB2VGoC/aHJL6dbUwso0DT0NW0/V
 yKswQ2ubPjPSIaY05jmTaBUwlgOFOMBhRGDw0/69OLC4TxXMJCRwEOARlqdaay7Hov7hS
X-Google-Smtp-Source: AGHT+IGzmVsc84Fl2ldR80zJxrie/O1D/yXSLfFIG+5awoeIvIti2ck03SfIC8nF38q4kiUfgvJdrg==
X-Received: by 2002:a17:902:da89:b0:267:f7bc:673c with SMTP id
 d9443c01a7336-27ed4ab0972mr60172605ad.44.1758863791110; 
 Thu, 25 Sep 2025 22:16:31 -0700 (PDT)
Received: from gromero0.. (189-47-45-49.dsl.telesp.net.br. [189.47.45.49])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed672a51fsm42160085ad.63.2025.09.25.22.16.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Sep 2025 22:16:30 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org,
 manos.pitsidianakis@linaro.org, peter.maydell@linaro.org
Subject: [PATCH v4 9/9] tests/functional: Adapt arches to reverse_debugging
 w/o Avocado
Date: Fri, 26 Sep 2025 05:15:42 +0000
Message-Id: <20250926051542.104432-10-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250926051542.104432-1-gustavo.romero@linaro.org>
References: <20250926051542.104432-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

reverse_debugging no longer depends on Avocado, so remove the import
checks for Avocado, the per-arch endianness tweaks, and the per-arch
register settings. All of these are now handled in the ReverseDebugging
class, automatically.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/aarch64/test_reverse_debug.py |  9 ++++-----
 tests/functional/ppc64/test_reverse_debug.py   | 11 ++++-------
 tests/functional/x86_64/test_reverse_debug.py  | 13 ++++---------
 3 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/tests/functional/aarch64/test_reverse_debug.py b/tests/functional/aarch64/test_reverse_debug.py
index 8bc91ccfde..36985a4a1d 100755
--- a/tests/functional/aarch64/test_reverse_debug.py
+++ b/tests/functional/aarch64/test_reverse_debug.py
@@ -2,25 +2,24 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
-# Reverse debugging test
+# Reverse debugging test for aarch64
 #
 # Copyright (c) 2020 ISP RAS
+# Copyright (c) 2025 Linaro Limited
 #
 # Author:
 #  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
+#  Gustavo Romero <gustavo.romero@linaro.org> (Run without Avocado)
 #
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-from qemu_test import Asset, skipIfMissingImports, skipFlakyTest
+from qemu_test import Asset, skipFlakyTest
 from reverse_debugging import ReverseDebugging
 
 
-@skipIfMissingImports('avocado.utils')
 class ReverseDebugging_AArch64(ReverseDebugging):
 
-    REG_PC = 32
-
     ASSET_KERNEL = Asset(
         ('https://archives.fedoraproject.org/pub/archive/fedora/linux/'
          'releases/29/Everything/aarch64/os/images/pxeboot/vmlinuz'),
diff --git a/tests/functional/ppc64/test_reverse_debug.py b/tests/functional/ppc64/test_reverse_debug.py
index 5931adef5a..b32a186a9a 100755
--- a/tests/functional/ppc64/test_reverse_debug.py
+++ b/tests/functional/ppc64/test_reverse_debug.py
@@ -2,38 +2,35 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
-# Reverse debugging test
+# Reverse debugging test for ppc64
 #
 # Copyright (c) 2020 ISP RAS
+# Copyright (c) 2025 Linaro Limited
 #
 # Author:
 #  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
+#  Gustavo Romero <gustavo.romero@linaro.org> (Run without Avocado)
 #
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-from qemu_test import skipIfMissingImports, skipFlakyTest
+from qemu_test import skipFlakyTest
 from reverse_debugging import ReverseDebugging
 
 
-@skipIfMissingImports('avocado.utils')
 class ReverseDebugging_ppc64(ReverseDebugging):
 
-    REG_PC = 0x40
-
     @skipFlakyTest("https://gitlab.com/qemu-project/qemu/-/issues/1992")
     def test_ppc64_pseries(self):
         self.set_machine('pseries')
         # SLOF branches back to its entry point, which causes this test
         # to take the 'hit a breakpoint again' path. That's not a problem,
         # just slightly different than the other machines.
-        self.endian_is_le = False
         self.reverse_debugging()
 
     @skipFlakyTest("https://gitlab.com/qemu-project/qemu/-/issues/1992")
     def test_ppc64_powernv(self):
         self.set_machine('powernv')
-        self.endian_is_le = False
         self.reverse_debugging()
 
 
diff --git a/tests/functional/x86_64/test_reverse_debug.py b/tests/functional/x86_64/test_reverse_debug.py
index d713e91e14..63d08bbada 100755
--- a/tests/functional/x86_64/test_reverse_debug.py
+++ b/tests/functional/x86_64/test_reverse_debug.py
@@ -2,29 +2,24 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
-# Reverse debugging test
+# Reverse debugging test for x86_64
 #
 # Copyright (c) 2020 ISP RAS
+# Copyright (c) 2025 Linaro Limited
 #
 # Author:
 #  Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
+#  Gustavo Romero <gustavo.romero@linaro.org> (Run without Avocado)
 #
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later.  See the COPYING file in the top-level directory.
 
-from qemu_test import skipIfMissingImports, skipFlakyTest
+from qemu_test import skipFlakyTest
 from reverse_debugging import ReverseDebugging
 
 
-@skipIfMissingImports('avocado.utils')
 class ReverseDebugging_X86_64(ReverseDebugging):
 
-    REG_PC = 0x10
-    REG_CS = 0x12
-    def get_pc(self, g):
-        return self.get_reg_le(g, self.REG_PC) \
-            + self.get_reg_le(g, self.REG_CS) * 0x10
-
     @skipFlakyTest("https://gitlab.com/qemu-project/qemu/-/issues/2922")
     def test_x86_64_pc(self):
         self.set_machine('pc')
-- 
2.34.1


