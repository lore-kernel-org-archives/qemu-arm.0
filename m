Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B6BCAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 14:20:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4gdB-0004Rp-00; Fri, 03 Oct 2025 10:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gd9-0004Rh-TJ
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:19:31 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v4gce-0000PT-8S
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 10:19:30 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-26e68904f0eso24000035ad.0
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759501131; x=1760105931; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jokD56wajshYv74g5ApJLjeyFkJUqNnydeoGpzr//Zw=;
 b=AntG1Kem7POYRNSTU6T1tDlxuh2lLd3DwuL3xvCkT+72aE5GDm9nrX5ibq1ezxRmXB
 t7nJzKIXibtcR2HsIQwW2kHC5NCq0Z1mw1O5dnoaBn645VnzfLDr1iBKKKQIvlgClb0J
 ZIXmdgXa03yOz2QFMSrkS7QWhH2UFfrqLQh+at6yDZHjGcV44BsHWOA7FbDTCl8wNHHs
 o5+JWkpOStrR+4M03jBDpSrAlYBCnHMUnzxBTmaNHYL99Ag016CkkHIDC7pu+yYHJQrH
 rszzIfbUERJoZORVYL44X03H9M4zC0jcugLeJD6HOjRIvOq7DAIoVGySP9pzjHG5dB5U
 m06w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759501131; x=1760105931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jokD56wajshYv74g5ApJLjeyFkJUqNnydeoGpzr//Zw=;
 b=FHW8/W1xObug3M+pnf0nwG3b+gOtJWIeYVNqkjiMCcbHYXE7Z8iEjhtcV3xfZVEF7Z
 UkVj5W5qz/wGZl94sdS3ioxHWmp1vcDJadfoAIAzSk46MUI2ifM8wIggcOG+e+tata99
 GtEHv4jT9QfEDB/RyXcvDc3g46vnd/uf/rPeLr2CUqc71nGxXhTQLXBfg4EyMdoLHC3p
 xQDeO7iIjhSR5tN38Ff14XLwaB1TlfyU1VFcDcNPptUkgMFO25tSr1ppcdeYQtVVO2k+
 L7TBIt1NrMYwLlSMQE+xkAJ430GGR8pTDSidfjWC+e6PhU0PrFtJwZ4ynw32WjIJwUvx
 Ut9g==
X-Gm-Message-State: AOJu0YwoNoNBcQ36fbL6EyBhhSt0MgwlqSmpwsvksYpqT3g3CNdZVHIs
 D2F62Gqg/0+zLRWzAtVMxvIfJCp56kPR/98DdbHzqlSuHxvK7Xk143y95Oh5lahA4/Y=
X-Gm-Gg: ASbGncvmc22tQ6B67jUaLiSva2+xAvoCNflz6jcxQljxoUcwRZ/ZFq8DZp3EA+T2Tpy
 fbG9lidY2lnxdKd9rdnUAUID2+iwnE0Kj02t3MEG3FJFfWgjL5vN5ppJb9A7/YwtoP4QIKxClzh
 luRzWJCU012w9D6HUI7OjzDymaHUmE5c9TTtN5rlQ99GdSXVJiPqMCTD1ZsTSUdzSGzs7GxIXbn
 y/jrAJvu2OH3kkAj9sGsfmIVCwlmWNlqoqyO0nBzADaFjvWCkParF3mImMPAFD21T/txdi0YZ8Z
 mT+U10njXJiIZjWKpTzJ6l2LsqjOFL8Cv07qe9pVTNRwZkyi8R85SOReu2zrBhYoz6mXO3VTk2v
 HIVkcqxfzskhknM2L8KCEqgxKDAzHv4g33rZKxY7FRIHx6NUWXsNkahWD
X-Google-Smtp-Source: AGHT+IFt+vaQd7pSavoksEgfOncnCXu/UI67BUKVQS8+9ay81OTLaQbOCU51feUj3MZovKhlEGuw3g==
X-Received: by 2002:a17:902:ef0c:b0:25a:24f2:af00 with SMTP id
 d9443c01a7336-28e9a543ba1mr45691365ad.12.1759501130915; 
 Fri, 03 Oct 2025 07:18:50 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d5635sm51759645ad.102.2025.10.03.07.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 07:18:50 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v6 9/9] tests/functional: Adapt arches to reverse_debugging
 w/o Avocado
Date: Fri,  3 Oct 2025 14:18:20 +0000
Message-Id: <20251003141820.85278-10-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003141820.85278-1-gustavo.romero@linaro.org>
References: <20251003141820.85278-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x635.google.com
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 tests/functional/aarch64/test_reverse_debug.py | 11 +++++------
 tests/functional/ppc64/test_reverse_debug.py   | 15 ++++++---------
 tests/functional/x86_64/test_reverse_debug.py  | 15 +++++----------
 3 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/tests/functional/aarch64/test_reverse_debug.py b/tests/functional/aarch64/test_reverse_debug.py
index 8bc91ccfde..906f10aec5 100755
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
@@ -31,7 +30,7 @@ def test_aarch64_virt(self):
         self.set_machine('virt')
         self.cpu = 'cortex-a53'
         kernel_path = self.ASSET_KERNEL.fetch()
-        self.reverse_debugging(args=('-kernel', kernel_path))
+        self.reverse_debugging(gdb_arch='aarch64', args=('-kernel', kernel_path))
 
 
 if __name__ == '__main__':
diff --git a/tests/functional/ppc64/test_reverse_debug.py b/tests/functional/ppc64/test_reverse_debug.py
index 5931adef5a..69551fb84d 100755
--- a/tests/functional/ppc64/test_reverse_debug.py
+++ b/tests/functional/ppc64/test_reverse_debug.py
@@ -2,39 +2,36 @@
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
-        self.reverse_debugging()
+        self.reverse_debugging(gdb_arch='powerpc:common64')
 
     @skipFlakyTest("https://gitlab.com/qemu-project/qemu/-/issues/1992")
     def test_ppc64_powernv(self):
         self.set_machine('powernv')
-        self.endian_is_le = False
-        self.reverse_debugging()
+        self.reverse_debugging(gdb_arch='powerpc:common64')
 
 
 if __name__ == '__main__':
diff --git a/tests/functional/x86_64/test_reverse_debug.py b/tests/functional/x86_64/test_reverse_debug.py
index d713e91e14..2b31ae8724 100755
--- a/tests/functional/x86_64/test_reverse_debug.py
+++ b/tests/functional/x86_64/test_reverse_debug.py
@@ -2,34 +2,29 @@
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
         # start with BIOS only
-        self.reverse_debugging()
+        self.reverse_debugging(gdb_arch='x86-64')
 
 
 if __name__ == '__main__':
-- 
2.34.1


