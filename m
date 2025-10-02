Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F62CAC5BB
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Oct 2025 02:09:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v48hq-0006xG-6w; Wed, 01 Oct 2025 22:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48hm-0006w1-8V
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:06:03 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1v48h9-0004xT-Sa
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 22:06:01 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-27eed7bdfeeso6327625ad.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 19:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759370715; x=1759975515; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cRn1/ZHODgwk/2GbMYBF8H2MxjLut5bpkNmRuMWbas=;
 b=Gk8bmwp64K98NFqQdHLw/B7MzmlzL7oaroeX6I3AlU5Kz3pko0tiVRkTHgocQpVByz
 ODHn8VUV5xbA0iE/ig34XWzy47qi76qYJLoXB2DNv/6q/P9GTfcQ+o63EpwSjzy62Zuk
 IK+DQTqlsmgi18lQp0wBUE8/NythEPy75uwjoPU4e6kmC+x7mdR7r41BK19UAV6+UkHD
 T7KdlQ50QySicOE+yBuG+Jj/BnSMhJFX46le1fn3NDqvLACYw2Q/3thF4KHUWeDhedQT
 fUjjhpE5nDzlGsKsNHVrS1TEBVSK5vxmTdYg6QCnpS7l5dgJ69j99jsHcEbGV05y8vkm
 eF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759370715; x=1759975515;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cRn1/ZHODgwk/2GbMYBF8H2MxjLut5bpkNmRuMWbas=;
 b=G/Bx1ES9f69k4lJy9fg8d0UqG7qwlvlV7Z1HvQ4Hk3M2+gjvLK4AbwpA/+tvoKtCuS
 y89IAJXrC+8nTweVPDl+cdRrExDiYegOi+b63GokUp/2uEVIDzF7SWKmaLWlICVwk3OR
 2LE3wy/enreRfU0Z24gP0zjZs7AMlVqFMnHzrosKIWfxEuCHCQ6BKSMJXoXEboISAKOA
 4RcxHZyg/U7DQsiksyMhKjeCBXw79oDWSEa4/Y+f6lujZT/NBliT172a1buzuBM5qHVB
 IuLGFg0MsseAFzRsj0Vlgc5TO06227/uwavsHV/rf+Ff6MdxtzwsPizRWkxLewfVVlpl
 MZLQ==
X-Gm-Message-State: AOJu0YzePrDXbXZLB2+nAt1aOLAPfkxcwPNNC2tWQtxOra0mBxw/jp9E
 1vll8bLYtiKzKKuqMYiTrDljNEyxRhL3QYvarqaXH4G/KZbrvwWa43+kKztzNEHg9U4rXTyibfN
 0LXnW
X-Gm-Gg: ASbGncuwZsCa9G5ELPz+8HmVB7ODRGlXOeSG3LMJ6dFocpXqRX8wUetGnk66bhItFye
 /AjVL+o1fwIZUlTvR3UexoXAfrPDyUx+/UJRrp3OFLrGuhgdOfTmUeQthFb0nwACoOBxBobAOyV
 6SPo6BORzAJ9Paul/Q05WlHnztmgMBj4Y/nkxEkQD8idyADLmUtak3grPHWXncHH/d/+NykgfMB
 7KyFRB2i/Eax/iqtQXy065zhFYMVfZmwxeE8iS1BD5w7BdkUnrwFEsh4fah1OHW4Sd8/MHavrBn
 aFnkxJ9+8FO/MCy7eJxtN4blOCxn0Hwfk+bVIFqFmJsfq6MUG/ScxLsM9S7e2IN8n8zmOSPbEa2
 t8M4DQB+uXkcATNnEWMQPYYcM1rkMIRc/jDPuULtbvZEf61GtCoS3Io7I
X-Google-Smtp-Source: AGHT+IHQV48BAIhne82jSd+TABfxwTJV24OJZ1nXFqTeOGwFdkzFnteS/BmfI7ZUHAowkYgT1M0Eng==
X-Received: by 2002:a17:902:d58d:b0:24c:db7c:bc34 with SMTP id
 d9443c01a7336-28e8d055535mr19306645ad.13.1759370714995; 
 Wed, 01 Oct 2025 19:05:14 -0700 (PDT)
Received: from gromero0.. ([186.215.59.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d1d95bdsm9476735ad.119.2025.10.01.19.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 19:05:14 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com,
 berrange@redhat.com
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v5 9/9] tests/functional: Adapt arches to reverse_debugging
 w/o Avocado
Date: Thu,  2 Oct 2025 02:04:32 +0000
Message-Id: <20251002020432.54443-10-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002020432.54443-1-gustavo.romero@linaro.org>
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x631.google.com
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
class, automatically.

Reviewed-by: Thomas Huth <thuth@redhat.com>
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


