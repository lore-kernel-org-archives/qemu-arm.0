Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71418CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 23:47:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL8OO-0000KK-6q; Thu, 07 May 2026 19:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OM-0000It-QC
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:30 -0400
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wL8OK-000138-UO
 for qemu-arm@nongnu.org; Thu, 07 May 2026 19:44:30 -0400
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7d1872504cbso1372186a34.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 16:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778197468; x=1778802268; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZVsvcQjrwAu/Fw5QeICNMsfPv4wnEzD0NNefmVwM0W0=;
 b=fqZpb5WA9ogYuItOtSvNo6b9diPbxGpZ/yvrjuO5kXZ6ftAaUKFYVau1YuI0Zy9UGP
 WSkNZUTzgjushbHFtuz9vP+TZzkeJcfqMfCUDEvuqwyIiegZOolVwb17jLcrU0NLll7d
 wjF8WRqa/2gbGhvqVhrpCGC5h01Fz3d3M54OPKBI+eUkD01vWcB0+E9KEfeYeYXxoP/5
 pJArxT0AcixbDgVAi0K90/LtwziOGqoFj0g2gGYtTBvtSq2X9a7UxukTLGKWrEK94/Yq
 M/Q3JXQPFg0dYrb7W6wB+yt2nn/tiQdb0u1Ac1Q+EARehgC8hiBqrYBeFPePSyDxreOu
 cGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778197468; x=1778802268;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZVsvcQjrwAu/Fw5QeICNMsfPv4wnEzD0NNefmVwM0W0=;
 b=BT53VokZY4atHru4lQ7we7LjSYnl879ohv0t4CqUAvVV/gqtjW+aNSY6ftBvswq7Lk
 +x1vYR9/W4DEOzgmEUZ/4hM4W/tV7MJOh3rn/IU6Q4u3fChSbcsehx5wTRQTU1ohrhHe
 4FX36TjZa74rSspuWaisXKkqzX8lUinrVyBg2hGixQrbVN6KhYI+We6ebNwORf6Y7RTh
 BW9JlLAMMRIIdBiC+PtJvLHrpEUOVElCgv+CgG9h9HOVZPcuLTJrhhYR1D+wjL3GAM+L
 ivTBkO4FFluNMA4EtRAR6+QbmxG21DKPg2OOkkIoVojjX38jQqwtLYnecdBnhPJHwymq
 TpCw==
X-Gm-Message-State: AOJu0YyzNhjBIcWFx9GpP1PwGRzrMeukiO6RUoW3XZ6a50pMbbjUb+/c
 hR2TNlHlNXVaNcTj6W8aDQXhevaKzpqiZ4J31IcmppVefownzd4XKyHTTXQS1ur6FNA=
X-Gm-Gg: AeBDiet7S5PgwITWGQObVSztV5tGle0bQ/QIQ3E0TFWDYQbHeel3HebSgUOtifyl3Wg
 UI063YLgN6QFyB5PnOHf8imoJsM5iFPqA0L2Vd2ArpjIk1vhqrHQCm69WfCA4NY4cZPnvhx+ZAu
 8MHFIbbMNyQY1QMNZ2JmO2BYUdL5ckVDgXXbNR/rSuc3vrq3CyMNPUl/gTzVhE9SCYggrbqZ2+t
 Tqx/lKi1A2gvMeeVFnl5hx9ws7mczNsXVIvHU6wQuav6ZKIg4/b1GuUku3EVo2AjmMLc9tilmTI
 GtZEPFOSdsLfvgoQP+nY7r7I0s6QSKIX8rYKR5dt+yRaPu8ozNIEcG81y8LbXL5m/A0oLxlJJot
 iSk6tv23ItSDbsVhBfMNlQIG/wDSCDnI8ljYjXn5dd5n1xTlyGe6UgLNJmREbG3QJCPjWRAHKKR
 3a9dmtaSX/tv2eVYo5lCe90GwiqD7na4R13I3dT2gS9ARopddoR4ohtfqh
X-Received: by 2002:a05:6830:d18:b0:7dc:cf5d:df17 with SMTP id
 46e09a7af769-7e1fd481d99mr2885455a34.18.1778197467784; 
 Thu, 07 May 2026 16:44:27 -0700 (PDT)
Received: from stoup.attlocal.net ([2600:381:c938:6375:9641:bbb2:a93a:bb4c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7e367d8feb1sm84320a34.23.2026.05.07.16.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 16:44:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v4 14/60] tests/functional/aarch64/rme: update images to
 support FEAT_FP8
Date: Thu,  7 May 2026 18:43:27 -0500
Message-ID: <20260507234413.643512-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507234413.643512-1-richard.henderson@linaro.org>
References: <20260507234413.643512-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x334.google.com
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


