Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79050CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 05:45:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0ZMc-00088j-3n; Mon, 22 Sep 2025 01:45:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v0ZMV-00083J-IF
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 01:45:21 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v0ZMP-0004vL-It
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 01:45:18 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-267fac63459so37603155ad.1
 for <qemu-arm@nongnu.org>; Sun, 21 Sep 2025 22:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758519912; x=1759124712; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=51lPqiebpu5zL2+dy3jcywPPraPkvqTAkxbf02qUiQA=;
 b=RAjmBSgitotc+Hj5B9bhIctzGybJIflv0YCucFlS7T2wO0FEPxlDeCkVO69QSbtets
 Bq/Ti67AZakyPl5eU7+AnNQVOVGw2g2q3Fj1i/v6c423afLFaTVd+46WkX+3C9mijO2Y
 v7yi8qFkJlSu0t//IBqUZWlU1ma+6mg2/Af349icWVVbmb617oqCK0MoN+4pFOQCKOJe
 5Ir3w0lyAh7Zr5byg9Cu5e8oDWRwiOhU3sNmO3NScDm/dR1V4xAV2UwUaSCcQMlAaZA7
 Rics70PSMqodNbR94upPDoNSgF4hzyWWHn3LABtRfLq5EfBRoE4XmQbbp3eaDmH2MzO4
 2+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758519912; x=1759124712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=51lPqiebpu5zL2+dy3jcywPPraPkvqTAkxbf02qUiQA=;
 b=bOHRbxgEHrrv6/Wmar/JPrcB3jDJCl0oh+r9sXlViRmEkm7PBIclQSjZx95iNs99Cf
 44MhpCJnvDryNC4WZnS7ti1m7pInPYMeeGP1/uKbTk70OvW5UjBCOXcnFeTh+QW9UC7q
 0d0yxUdha7Dgzm4mzZZYdkiHwUjHVFLN4BWwgdn1ufyxE2GMR85FMaGkJnSU5FuUKEBl
 jrqzXRNH+szE/UrO9XvPB4Q2INZER0SR1V6M+zYXupjUEw+gRvW9tQUSNLXRAHYFU9Dr
 cWHffzghifZH8tmpEjxGdi9hvv3Bz6rlEefGaqelsO5f2yEFePPNO2aCnV2F+OG/eF4J
 Q9FQ==
X-Gm-Message-State: AOJu0YyYfaQetjVryDy+a/OJgpLsP5+XHgeTTTiOyvOnYkYcf+Pm1S2u
 r4YQFRghMeD9lmbthuhb7Ja/EoiTOXAprsEW/F3h33q6bloLgxaf9r7ELTrJvS5H70Y=
X-Gm-Gg: ASbGnct/0HjlUKKbhm8GlWgDmQS4XdZVnwcapO49IHogJVxK0Lf/wvwoEaMs9yU+UXD
 M5zpyiIy7R2qjO3fqJBNecJEUO/M1tjpGVZl7AzTIc1acp9qrmsJnjbbDUEqaH6QoslnOuytyjQ
 sVhtqn+BGvcI/KE7otRzSmod1RbGxpRo881VIHS1TEgwKfXSVW3FfXcQv5UzX/Y7nWhsAimrV+A
 3Od7kLFRC2qJXPPGN/A1r5nX0FIt1Xtdyi/gM+4vyrJUtMgRDXn8f+Rq41DqJxRWvRtyHsKKrCt
 So7a8/R/76imSn2iOh6adXUuebqZ9LWk6VvSCD0l25fU7JIGNjs2cAAtevF/zmg2bG1S4yyflz8
 +kUI+bWJKOA+APcTS+m6vRpxWEt7PI4M64YJMtMEifNKyQBXAxHxwU6cmgFrXDvEl2gR6Mi2q
X-Google-Smtp-Source: AGHT+IEHJhfrMzTumGa4LxUTFUsaVLT+ZBq0rsm/EQTIMJA3R24yC3wRxIbTgvQyS035IHtfYUzjeQ==
X-Received: by 2002:a17:903:4b04:b0:24f:dbe7:73a2 with SMTP id
 d9443c01a7336-269ba514490mr130608025ad.31.1758519912135; 
 Sun, 21 Sep 2025 22:45:12 -0700 (PDT)
Received: from gromero0.. (200-162-224-93.static-corp.ajato.com.br.
 [200.162.224.93]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b551c279cd5sm7691377a12.3.2025.09.21.22.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Sep 2025 22:45:11 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org, gustavo.romero@linaro.org,
 manos.pitsidianakis@linaro.org, peter.maydell@linaro.org
Subject: [PATCH v3 4/4] tests/functional: Adapt arches to reverse_debugging
 w/o Avocado
Date: Mon, 22 Sep 2025 05:43:51 +0000
Message-Id: <20250922054351.14289-5-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922054351.14289-1-gustavo.romero@linaro.org>
References: <20250922054351.14289-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x629.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

reverse_debugging no longer depends on Avocado, so remove the import
checks for Avocado, the per-arch endianness tweaks, and the per-arch
register settings. All of these are now handled in the ReverseDebugging
class.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 .../functional/aarch64/test_reverse_debug.py  | 13 +++++--------
 tests/functional/ppc64/test_reverse_debug.py  | 15 +++++----------
 tests/functional/x86_64/test_reverse_debug.py | 19 ++++++-------------
 3 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/tests/functional/aarch64/test_reverse_debug.py b/tests/functional/aarch64/test_reverse_debug.py
index 8bc91ccfde..7f816025a9 100755
--- a/tests/functional/aarch64/test_reverse_debug.py
+++ b/tests/functional/aarch64/test_reverse_debug.py
@@ -1,26 +1,23 @@
-#!/usr/bin/env python3
-#
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
@@ -35,4 +32,4 @@ def test_aarch64_virt(self):
 
 
 if __name__ == '__main__':
-    ReverseDebugging.main()
+    ReverseDebugging_AArch64.main()
diff --git a/tests/functional/ppc64/test_reverse_debug.py b/tests/functional/ppc64/test_reverse_debug.py
index 5931adef5a..2b7b18e9a8 100755
--- a/tests/functional/ppc64/test_reverse_debug.py
+++ b/tests/functional/ppc64/test_reverse_debug.py
@@ -1,41 +1,36 @@
-#!/usr/bin/env python3
-#
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
 
 
 if __name__ == '__main__':
-    ReverseDebugging.main()
+    ReverseDebugging_ppc64.main()
diff --git a/tests/functional/x86_64/test_reverse_debug.py b/tests/functional/x86_64/test_reverse_debug.py
index d713e91e14..408e5d1f48 100755
--- a/tests/functional/x86_64/test_reverse_debug.py
+++ b/tests/functional/x86_64/test_reverse_debug.py
@@ -1,36 +1,29 @@
-#!/usr/bin/env python3
-#
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
-        # start with BIOS only
+        # Start with BIOS only
         self.reverse_debugging()
 
 
 if __name__ == '__main__':
-    ReverseDebugging.main()
+    ReverseDebugging_X86_64.main()
-- 
2.34.1


