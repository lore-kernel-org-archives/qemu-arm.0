Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82861CD5BA4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:34:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZE-0007b5-Q8; Wed, 20 May 2026 14:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYr-00077a-PJ
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:31 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYo-0000X2-4v
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:29 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-36974221f93so2779310a91.2
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301344; x=1779906144; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZVsvcQjrwAu/Fw5QeICNMsfPv4wnEzD0NNefmVwM0W0=;
 b=MC1Oyccwl5dqZKiVp/qQTHMqSwsjKuJ/K6qwxxiizr4o7PNC+2KroEMOa9yT+GSITH
 pSHCVbi9aGgOTNBMAsopTS1MQYBrGXcmlYVbe7SSeCsKfv78ERyF7E0ycldQER6cNJJB
 4ME2FU7bwRfyp9SOKCB5jzA3IF25+jPuogQxe0oiRnyekyoaQWOzPJA6UlGIGx7bch7e
 gwxP5Jy9l0YrJcKZMduVtfYa3yh7duWbOS+u/RQVpARoskfH1VYmzYtLeZq6n3yet/au
 EAJTgAAF5MDa6sbrACj20mDhPcatiBrFZc9uCzJpWQWKUI5EypzecpbPQ6O8WdcFM43a
 ot8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301344; x=1779906144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZVsvcQjrwAu/Fw5QeICNMsfPv4wnEzD0NNefmVwM0W0=;
 b=dwlrAMv87exdlxvpXc0Ll6qKPT8kEUFHPYFd+sLZYja4QjhI9Ers5h5EDYnqEqPonD
 NzhYn7qHnVd6MigNCtLjZief40YD6x1r1PaGVWo4mat9FDDhnthnhC0/yk1osUMVoxsk
 TlPmW+gKlkzgjNhhG+ftpbmXhS5ZT7nbA3LgA436xV0ULbx2af9t2fVQtpyfOdzv12Un
 RFlcno0gp4tiRbyEOQ3VHzgBnmJOSvvrcuKTlTV5l9f+YsZ3XCQbOFihBZOFT9JV6t9V
 Xxw/aq7ui/6X+ghDO5ct/n3v1BNFjB3BH41u8eB8mMyquzRBnVG4/dAfrXRahT3G9phQ
 xfQA==
X-Gm-Message-State: AOJu0YyHTHDNCqNsxIFtLxGfi07qsIwv9fxWv/HvfWse18Nts/tjbXrC
 L7PnXzKphcnCnoft+gK3I4HwuUCb2bMbAFicbDGpAykUr+UBG3VBIgEPp7/jsOo9vAcIookziF4
 jVAsbSgQ=
X-Gm-Gg: Acq92OEyatEr+tXtA1mlZQc8MaQLWod0VPTtY54vSDM9nlBrq9KA0W3A2eNsLyVTyFw
 68iGFRVxO1QGmngZpHwbFUCvFtuEtlOOmhvESVLvOqgN52E46+qj1PvrtoS+EJjSWbGFh1wUyjq
 EB96I0LKecvJYcVXwGcjO7nR4pnxLu+OvcEZlRuOcCiQBF1v4N3ULKnGiwJYySPJyvdtab/EohS
 JPsLDxkXIvAmTjSFRqgySFY9zdeREHynU97it3eZchk8nVeffeMCnXIXZe7BLtpV5ovj9ecYbdd
 PaYgMTyySsbCA8wNHWM3FnbWpeIe/ZYcDAUoOqf5ZbZh3F5NKat6U/Yc/JuR0hZ357EZTkS9W2r
 +tVSEjaKokHG5scKC+Ax/88etUjCrNTWg32ZQLsuNvhcvrx7ZgyCHB6d3RtkOOb+5xYH/sagCy4
 HwhQTxsVdMDU4pMAqJ+SUOAXMx/ChR
X-Received: by 2002:a17:90a:1c89:b0:369:932a:2b8a with SMTP id
 98e67ed59e1d1-369932a2ffemr11573283a91.1.1779301344203; 
 Wed, 20 May 2026 11:22:24 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v6 14/64] tests/functional/aarch64/rme: update images to
 support FEAT_FP8
Date: Wed, 20 May 2026 11:21:23 -0700
Message-ID: <20260520182213.872945-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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


