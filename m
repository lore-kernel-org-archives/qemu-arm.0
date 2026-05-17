Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BAACD4F3C
	for <qemu-arm@archiver.kernel.org>; Sun, 17 May 2026 00:36:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOPPg-00084H-M0; Sat, 16 May 2026 20:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOl-0007Ds-Jk
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:31 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wOPOf-000514-Gb
 for qemu-arm@nongnu.org; Sat, 16 May 2026 20:30:26 -0400
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-c80227b1f6cso340781a12.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 17:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778977817; x=1779582617; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZVsvcQjrwAu/Fw5QeICNMsfPv4wnEzD0NNefmVwM0W0=;
 b=pBjTfX4Z5hdj3cIYMVVeIFr52mkMeBhMim/nQr5UXl+3gxOEhgxNKSJjWCZSGil+Wv
 SXSyzaTCzmfRcotl4GA3yzKuUrsRlTe1jbCemUHx9wOY9sOv2c1VW5A1HnRDrJ6YMhug
 Nd8aEuPyq9qkz97ZEA2wcJNXJ+w5I4Oa4I7A1ThXzcn+msVebH4B6KC00rL9Hvom5tNm
 V2rB6G2QC9u3CXHoS4mWYXIFEfLPWH+L3kdN4HAfClGF4yJxftcMzzL5R+JtCEHXST5Y
 aUkMmcfYeAQDo9nI13c5/RFCYVDFiAyYj3WTakT2Fosf9UCf3UU38TMI2vXraNUHsNY/
 MCiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778977817; x=1779582617;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZVsvcQjrwAu/Fw5QeICNMsfPv4wnEzD0NNefmVwM0W0=;
 b=epFT4tPSkbYZ8++9OwimRWDNwQB1x3+vFypyXxU4X2tfsTO8BovjRlG5b+ZEeXM5qB
 vy6VVeWkxDvTo3pyW5gz9xduop62vn9thyJnVH+PgpFYFxwzUlMkSB3qt3I3xC/R46mH
 Cn2Xab8fS18A1suzuxcBBpfva+2XYnhjGr1Bq1ZsS2OUQSXLP+ng1lWXkqwGLEzBP2R9
 gUlzjbLvwkWb4noGcMMyuRRIW7JfP1Pln+XHiGxJohvHYkNkCDW9D1yqH1gcPO6yaU4l
 On2MiSwvi9Z+oo7OR2VIyADaqdyphFy0LSGUys8jOMggkLnFEltITPEwXT3fUDrsFgL4
 mcxA==
X-Gm-Message-State: AOJu0Yy99P7HRyQozViyfI/uiw6QGeqYQ5x+7p3wGKMKoHLoQKxmd74c
 Mhd/SV/loj249Fsh/8ltEgGC9R9zeLTfAJYM21sgCUKmAiq7a6/tGmoUUsYVfNFwPVM=
X-Gm-Gg: Acq92OFsaOPStyZK82XNbj80fJiN1nHUdO3Fjj9iGMGdZr7VbvFo3roCUT1bKN0Fea9
 qYw4FiM8dXJLXnIRIMEuDhGxU+3QuFIwWeGYogOzfBn+PR7ihlLkoJfV3OmsXsvUvfm/mSqNFzX
 EXRWy59ZrIyXiH43hdiB5WgruJV5gWT95uCBnXWbSSf7OXxvNbNuw3N5upv65342S6G64ZNi0UG
 Vk7MYwy7mstjttMySYecS2x+McZELPUDwdTzHj/4OkCpJxI5SM/zOsufSEwxikRwrbvqy41g88U
 q9Hl3iJtgxmkGcVxqbEG03IQjoxUgOAR6wcsYweF2yC3/4O0G9JDERFHsFOTP5nE8BLKhAkA8o3
 KtxHsj8VX829ozvDvXnhaEqpWprbJTaJjciGTv55e0uakoithDE2XAk7aSt1MZLF5b90hCCOwwB
 Q6rbMCe+/f9Qxmiqnm/i69aKJ2B2ZM
X-Received: by 2002:a05:6a00:2793:b0:836:3f6a:3e7a with SMTP id
 d2e1a72fcca58-83f33d2774dmr9458967b3a.26.1778977817266; 
 Sat, 16 May 2026 17:30:17 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83f19663cfdsm12272745b3a.9.2026.05.16.17.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2026 17:30:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v5 15/63] tests/functional/aarch64/rme: update images to
 support FEAT_FP8
Date: Sat, 16 May 2026 17:29:14 -0700
Message-ID: <20260517003002.321430-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517003002.321430-1-richard.henderson@linaro.org>
References: <20260517003002.321430-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

As well, use -smp 1 since there is no visible speedup running with -smp 2.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/functional/aarch64/test_rme_sbsaref.py | 7 ++++---
 tests/functional/aarch64/test_rme_virt.py    | 7 ++++---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/functional/aarch64/test_rme_sbsaref.py b/tests/functional/aarch64/test_rme_sbsaref.py
index efea80c578..d252101ac6 100755
--- a/tests/functional/aarch64/test_rme_sbsaref.py
+++ b/tests/functional/aarch64/test_rme_sbsaref.py
@@ -20,12 +20,13 @@ class Aarch64RMESbsaRefMachine(QemuSystemTest):
 
     # Stack is inspired from:
     # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
+    # Built from:
     # https://github.com/p-b-o/qemu-linux-stack/tree/rme_sbsa_release
     # ./build.sh && ./archive_artifacts.sh out.tar.xz
     ASSET_RME_STACK_SBSA = Asset(
         ('https://github.com/p-b-o/qemu-linux-stack/'
-         'releases/download/build/rme_sbsa_release-6a2dfc5.tar.xz'),
-         '5adba482aa069912292a8da746c6b21268224d9d81c97fe7c0bed690579ebdcb')
+         'releases/download/build/rme_sbsa_release-74b7fab.tar.xz'),
+         '82a754bacea04e709cb1cf2759d1d12d09fabd612e014961eb32368723c7920a')
 
     # This tests the FEAT_RME cpu implementation, by booting a VM supporting it,
     # and launching a nested VM using it.
@@ -57,7 +58,7 @@ def test_aarch64_rme_sbsaref(self):
                           ' --params "root=/dev/vda rw init=/init"')
 
         self.vm.add_args('-cpu', 'max,x-rme=on')
-        self.vm.add_args('-smp', '2')
+        self.vm.add_args('-smp', '1')
         self.vm.add_args('-m', '2G')
         self.vm.add_args('-M', 'sbsa-ref')
         self.vm.add_args('-drive', f'file={pflash0},format=raw,if=pflash')
diff --git a/tests/functional/aarch64/test_rme_virt.py b/tests/functional/aarch64/test_rme_virt.py
index dcb18678bf..2afcdc6b07 100755
--- a/tests/functional/aarch64/test_rme_virt.py
+++ b/tests/functional/aarch64/test_rme_virt.py
@@ -19,12 +19,13 @@ class Aarch64RMEVirtMachine(QemuSystemTest):
 
     # Stack is inspired from:
     # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
+    # Built from:
     # https://github.com/p-b-o/qemu-linux-stack/tree/rme_release
     # ./build.sh && ./archive_artifacts.sh out.tar.xz
     ASSET_RME_STACK_VIRT = Asset(
         ('https://github.com/p-b-o/qemu-linux-stack/'
-         'releases/download/build/rme_release-56bc99e.tar.xz'),
-         '0e3dc6b8a4b828dbae09c951a40dcb710eded084b32432b50c69cf4173ffa4be')
+         'releases/download/build/rme_release-2701e89.tar.xz'),
+         '8c40af440f5bd1518f7add7d0a43b39289865ee48430979db8024cb897a74790')
 
     # This tests the FEAT_RME cpu implementation, by booting a VM supporting it,
     # and launching a nested VM using it.
@@ -44,7 +45,7 @@ def test_aarch64_rme_virt(self):
         rootfs = join(rme_stack, 'out', 'host.ext4')
 
         self.vm.add_args('-cpu', 'max,x-rme=on')
-        self.vm.add_args('-smp', '2')
+        self.vm.add_args('-smp', '1')
         self.vm.add_args('-m', '2G')
         self.vm.add_args('-M', 'virt,acpi=off,'
                          'virtualization=on,'
-- 
2.43.0


