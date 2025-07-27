Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BCFC87FCC
	for <qemu-arm@archiver.kernel.org>; Sun, 27 Jul 2025 07:43:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ufw1U-0006Tk-Ea; Sun, 27 Jul 2025 03:42:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufw1M-0006HE-TE
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 03:42:13 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ufw1K-00014k-QC
 for qemu-arm@nongnu.org; Sun, 27 Jul 2025 03:42:12 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-23636167afeso29800585ad.3
 for <qemu-arm@nongnu.org>; Sun, 27 Jul 2025 00:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753602128; x=1754206928; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XNubQwhHjekWcdPAePqyJsttCoxvHncnRgRs+UUfMAk=;
 b=k6JsM4eMC1iaoXT/C1fTGJUWLWHvYMLrvmRybUKZmkVBuWffqOXteRWRYXrG4QZ6pb
 fDY+/734KL7hRZfHfX/fMZCtTlDJHWfe3Cw8qW07LplQBsoku/6tySxau2t8OhgAh5EW
 wBTIypzS1ymjf3gw75j0o3ngrKB1SccVk1QpN15l9h9HPMS4bLbUIEjHMLMFcC8aRz2f
 q6mrvIw7hZSoDr4Hfqtok8+hZaAjtZ8YAv32yIjwv0vD9/6mRbFimYAvttq73gIs3ChG
 wIsfTLoZywqTzLFm8Y1TvqIt53jl+xk1sFUl04vicyuV4uUt1n9b0b9Ifl7PhK43UOjX
 gEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753602128; x=1754206928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XNubQwhHjekWcdPAePqyJsttCoxvHncnRgRs+UUfMAk=;
 b=BPYpHtSlh4hoUpAlngXBGweLq07Pqmw8kZOV8fzvCGlWdcutJQdXvSKIaMmrKDmS6J
 nGODZ3pJO8FNXLx4KluxnLKn8SW9/mAEP9DCcb8208cKlxQgKPVqzOeLL85xvwJgK13X
 4+dUiF5TfsfL4Q70oiug6r9t0R1xA65ke4EN+YaSjLfb3BcqPNc2PxthFzJFxOXWE/ID
 A8zBwag1I761kysQ4hUqkc8OfLL1wXh22TAnc8mVjAVYUy1kTheK1XC7VYXl7vcEK9Be
 amc8UWnOHONQsFHnbP3GAVc4xnlshDQEzTer7S+Kh2o3apLbbZ6mLvtebcx2GGww96I+
 YZ+w==
X-Gm-Message-State: AOJu0Yy27BiRzwiLGypXX/rg4TRw/QiiyhIMzA6haAd79fdNsPb2wBFO
 SudSWRtYtBWuKasbk7oXSyozuRvx2h2wIQR7B/ueVH/SdVMgZKJQ9g7tHEYkUXvWlRA=
X-Gm-Gg: ASbGncsNfwrtymhL84kgY0RrnBdzn5rSBemaiciGViVkvLxcpiTMeCdXPhZmL2UL/IB
 D9KhJXGiUoxMAJFvhgrv6aMrcpip5fLxHP4mtbzFoQTa5TlqUFdWYeTwvYE1w3Yv3qk8Pzxr4FC
 ora/LecCurNieauiL+PHkbJQv4LomUABQRWC0KQ2X3slv/mgdsQutU+YSTSSLH1A5UOoJU00thS
 XSg3sD0pg4dzAQZs/5sCXRC3drwQdEot5PrUoJVbMlt2IwfubVzKlpsP359ezMLwjlbOfiChfsP
 loMvi6gtXmMSmSzDS0DK//PAERTn/PIU78ZT6B8Un1nCujXlBEiGU2LAyKi9E45rliQFNT/WX/I
 U7vryOyseDVdkbwmChvK9dTcL0j/cw/X2+a0hmpnYC/ONcCqPTdskPUZX2K1YUm2QDo4WLuripd
 WIV2y3A98/XA==
X-Google-Smtp-Source: AGHT+IHBB4zlTMZ3rLRelmgvt/+6G9eF+jrUElzNVihq1WOHfeBvgx+4GIro0XahLQmnhrnyfZpsoA==
X-Received: by 2002:a17:903:46c6:b0:236:6f5f:cab4 with SMTP id
 d9443c01a7336-23fb307c150mr108722485ad.5.1753602128605; 
 Sun, 27 Jul 2025 00:42:08 -0700 (PDT)
Received: from localhost.localdomain (syn-098-150-199-049.res.spectrum.com.
 [98.150.199.49]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe53b546sm29633055ad.177.2025.07.27.00.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Jul 2025 00:42:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v9 1/6] tests/functional/test_aarch64_device_passthrough:
 update image
Date: Sat, 26 Jul 2025 21:41:57 -1000
Message-ID: <20250727074202.83141-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250727074202.83141-1-richard.henderson@linaro.org>
References: <20250727074202.83141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

TF-A needs to be patched to enable support for FEAT_TCR2 and
FEAT_SCTLR2. This new image contains updated firmware.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20250719035838.2284029-2-pierrick.bouvier@linaro.org>
---
 .../test_aarch64_device_passthrough.py        | 27 ++++++++++---------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/tests/functional/test_aarch64_device_passthrough.py b/tests/functional/test_aarch64_device_passthrough.py
index 1f3f158a9f..17437784bb 100755
--- a/tests/functional/test_aarch64_device_passthrough.py
+++ b/tests/functional/test_aarch64_device_passthrough.py
@@ -9,7 +9,7 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-import os
+from os.path import join
 
 from qemu_test import QemuSystemTest, Asset
 from qemu_test import exec_command, wait_for_console_pattern
@@ -77,15 +77,16 @@
 
 class Aarch64DevicePassthrough(QemuSystemTest):
 
-    # https://github.com/pbo-linaro/qemu-linux-stack
+    # https://github.com/pbo-linaro/qemu-linux-stack/tree/device_passthrough
+    # $ ./build.sh && ./archive_artifacts.sh out.tar.xz
     #
     # Linux kernel is compiled with defconfig +
     # IOMMUFD + VFIO_DEVICE_CDEV + ARM_SMMU_V3_IOMMUFD
     # https://docs.kernel.org/driver-api/vfio.html#vfio-device-cde
     ASSET_DEVICE_PASSTHROUGH_STACK = Asset(
-        ('https://fileserver.linaro.org/s/fx5DXxBYme8dw2G/'
-         'download/device_passthrough.tar.xz'),
-         '812750b664d61c2986f2b149939ae28cafbd60d53e9c7e4b16e97143845e196d')
+        ('https://github.com/pbo-linaro/qemu-linux-stack/'
+         'releases/download/build/device_passthrough-c3fb84a.tar.xz'),
+         '15ac2b02bed0c0ea8e3e007de0bcfdaf6fd51c1ba98213f841dc7d01d6f72f04')
 
     # This tests the device passthrough implementation, by booting a VM
     # supporting it with two nvme disks attached, and launching a nested VM
@@ -96,16 +97,16 @@ def test_aarch64_device_passthrough(self):
 
         self.vm.set_console()
 
-        stack_path_tar_gz = self.ASSET_DEVICE_PASSTHROUGH_STACK.fetch()
-        self.archive_extract(stack_path_tar_gz, format="tar")
+        stack_path_tar = self.ASSET_DEVICE_PASSTHROUGH_STACK.fetch()
+        self.archive_extract(stack_path_tar, format="tar")
 
         stack = self.scratch_file('out')
-        kernel = os.path.join(stack, 'Image.gz')
-        rootfs_host = os.path.join(stack, 'host.ext4')
-        disk_vfio = os.path.join(stack, 'disk_vfio')
-        disk_iommufd = os.path.join(stack, 'disk_iommufd')
-        guest_cmd = os.path.join(stack, 'guest.sh')
-        nested_guest_cmd = os.path.join(stack, 'nested_guest.sh')
+        kernel = join(stack, 'Image.gz')
+        rootfs_host = join(stack, 'host.ext4')
+        disk_vfio = join(stack, 'disk_vfio')
+        disk_iommufd = join(stack, 'disk_iommufd')
+        guest_cmd = join(stack, 'guest.sh')
+        nested_guest_cmd = join(stack, 'nested_guest.sh')
         # we generate two random disks
         with open(disk_vfio, "wb") as d: d.write(randbytes(512))
         with open(disk_iommufd, "wb") as d: d.write(randbytes(1024))
-- 
2.43.0


