Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0DBCD4F3D
	for <qemu-arm@archiver.kernel.org>; Fri, 22 May 2026 22:09:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wQXzn-0002Y9-Er; Fri, 22 May 2026 18:05:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxo-0007kZ-Ta
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:35 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wQXxk-0008Bz-JI
 for qemu-arm@nongnu.org; Fri, 22 May 2026 18:03:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-36622412e97so5751848a91.2
 for <qemu-arm@nongnu.org>; Fri, 22 May 2026 15:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779487403; x=1780092203; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RAB7loj9VDjSb25aGvzXTzAFpuLmyHB8zFhbthAMQc8=;
 b=ATxMJbSNbCsFcFvqNR6yKFVVW53bD5aU/p4udc4l4yvQhXjsUiDwHHTFybRB3RCqoH
 ExMTOOQIv+BaOOpLj6i/7dERf3OBonzDnD6Xrd8xrp2sUo1K5rrsKVviKEAj4heORFw5
 U18B8cK6StX9H/RomKtCVrLVARYQvXbCOxNB4RNxSwNMTNNVm4Y9FLPnhvj5isE5OLbO
 473TBl8ZDCBVu1oJK6C4txbDPMm3zCX+liJMN6Xl1xYTOAsI0iryNg/4o/srUZxEUmNY
 dJ4ST+sFEO06ww0cAhUWCUyc/h4y8V2MReYdSb7LuudTPvL8iwfVvgyo3e5mkA69E77B
 4aAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779487403; x=1780092203;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RAB7loj9VDjSb25aGvzXTzAFpuLmyHB8zFhbthAMQc8=;
 b=q3ymGKoRIYs5vsxPnSOVT8OomVgubMqluw+617qfLxe0qyCWpkG51axGeH+O9Yy63B
 zjqAAJ/itHNIFwltfl0Ly29de/LjwsRvyoR/RfQfcOtIytszUGuS0X6BVLg2t7ZsWKpv
 iGIMcSHMXRpFKIwrIEtgXGDR9HalUq6nIL9uQ4KJJ18tZ85+lgnJHksK+Z0A81jdGKTS
 LJgT7CZ94PPW++elrcqd1rm+DoVFLoF4KtUdwnHPA7VYkXLfyJPZVVXFUhYlufEGZ0xq
 MNkY3IwXOOiLGav4kafSRsp55L1zkNpZ/bsYOtyWnfP+P+WOJLuV8H5j9eG/1lxQfoXy
 su8Q==
X-Gm-Message-State: AOJu0YxiEUsmieNMGpvZBWSt5531zPNnsZ2accAJP5ZUWLnrcTU2FRTv
 lwaelP3xu30jqZLzWjTTZiKWtk63LrTCQeldyqKZzbidZAOB7oYi5VLkC0PLcfxqsFs=
X-Gm-Gg: Acq92OHYeta5wDAdPDqIJIWvkZfZ/wF/kYgjqfCouE3PG1v78V7jZKRZ7XcG6pCndpN
 F0PvG9umpLmaXprTFVKSYOE9VFxG2mLxFzr5YFLcskiO0eWNnCYzD9A1Xiu/RwOfZlvl9dDjTph
 dmNKfhvGArppN8lPWoKt/l1F0xLBQMV6nnoS4myHF3GcqWGhdvT+SGqIRj1bFyIcxX73idXq6Bz
 glcdwHcJ7iev1/bGBKpvqfwjidaz7HqUBy706SnYDAOQSSrub2afJKr6I2taOqvTRgWQ8TCtQ6q
 ZplAIG1bIf4dz8KwZEjyX7jBHO0vach4pqQ4pysUZs0iXPrfAI4uO4XaL9a/AVoR32TWqymtetP
 qVLSGGAKkPBIKHxoJ5+nWexgyXU+7ccBSmqZA0fAuJdeESZC4c3zLhiarSPMhOvo5NkTChpfudD
 ZJ87qNnkAXM0lldMmJOeeDYZQZ73CY
X-Received: by 2002:a17:90b:3dcd:b0:367:bb47:9fc2 with SMTP id
 98e67ed59e1d1-36a674221c3mr5676622a91.2.1779487403116; 
 Fri, 22 May 2026 15:03:23 -0700 (PDT)
Received: from stoup.. ([50.78.183.177]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a6772f486sm1726789a91.2.2026.05.22.15.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2026 15:03:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 14/64] tests/functional/aarch64/rme: update images to
 support FEAT_FP8
Date: Fri, 22 May 2026 15:02:16 -0700
Message-ID: <20260522220306.235200-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522220306.235200-1-richard.henderson@linaro.org>
References: <20260522220306.235200-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


