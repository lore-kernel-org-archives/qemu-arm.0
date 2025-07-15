Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E94FC83F27
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Jul 2025 21:24:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubn8Q-0002E3-Di; Tue, 15 Jul 2025 17:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubn7s-000252-TZ
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 17:23:50 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ubn7p-0001oZ-WF
 for qemu-arm@nongnu.org; Tue, 15 Jul 2025 17:23:48 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-742c3d06de3so6624672b3a.0
 for <qemu-arm@nongnu.org>; Tue, 15 Jul 2025 14:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752614624; x=1753219424; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pT9XuDubvwqaBHfbGdu9WYR5yikQAJybTCHMnJE+bvE=;
 b=AAN1AirPTGA1FohkOsTevV4ShyA7IZBULNb8pwVbf/82VWplS6kD+/1teR9Xtd9N74
 fhbvuT1HxWvdf9AGHqhkuAZOlvT7oUhZun20Me1ECklq2mNfsQ2wnDh5husSJpduByMA
 dynL8mOxqoKnR2aO+NmxEdh/Pb9/QQt2j+MyfGDxi7OS80KyuaF7083fOcAJa11BC8a8
 57hD5uzfN5i29H7xmODEz+eh8haBa4dM78r9tQF7BnxHgVBmZrFRLNpezHQG38R5xnsl
 zAWFJRu6DPX5R1i5F6c2D+V3pAB7awjkxy+JAdJp0q0m0iUgCg+mvC2HnOfl3FDCwbNQ
 7XIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752614624; x=1753219424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pT9XuDubvwqaBHfbGdu9WYR5yikQAJybTCHMnJE+bvE=;
 b=j6wu59Q+e+2tlsKLHSq5Uso5H42cwjnktvtNoJFo6QtAWQJVSuXkQuEDuXJuYeaH3e
 qMEgJ7Cv0OGC3h5kHuqhMuekz4BHzll/+M3ai4gnN+LG1+ccyBTUDkg0XMJGJmzKbXcN
 rw8gxINQx/jbwhhFshq0QtBoUoivy/yRTiMsKa6XW3EXJOIh4HGGadMYjDQfx6dbQWvH
 5OeD7qmTt+jxOOkQMc9jYDCZvu7zenqkxPovzYv1iZyoqlOTcer1COIJ6+bEIKRKEzv+
 hkjlDpBSzFKW+nLId+85LJohEoeCEr58RBDPIs6DAGedzqRJVN0JgZAJVg5tE8iCOELn
 rW/g==
X-Gm-Message-State: AOJu0YzTru/7AmtFs+aveJWeExa0vDKeSxAqyTNSRlqtUdYTBv9kVhgy
 Gq8fdzLF5Serdscz/ELNsMtaf6dw8opa8/878Rtx1VvCPJ5kYa+RSoGffm6EWbSTyUk=
X-Gm-Gg: ASbGncuia/Jl8RjjjfPWa97J0Z+8TRDm3Chsr55qhc0HYRqWxcn/fpUx0lxkP/qnBJ7
 1kgQQm1Dy57C4rG8NHmTEDTWLrNBMzUBjn5rBKxYsGc0TISmVsz6EaM4UT7FYvHS6llxNfpKrjN
 vSSb8iA/r0hf5nxsZswrLyvuFGHPJkm0YE1F6190zawW3rwdqrZRu4YeHjYng1fgFWe4jD9ZpbY
 aq5Q5vtFvGEp2u97bymx9leyE9ArCz7k0gyVe6Tdg9J7tAzF1gjIgwn6HV76hla7So+YszXMegl
 e0dRRSYHpGNnG5vctgRZohKOUjGgZZz/Cffuwq7Uheg9NBarAEeiKyHxjiniox+m+K01gUrJpuZ
 60BoO7mzK2CGOpCk/JuNI5Q==
X-Google-Smtp-Source: AGHT+IFsEwZzomrROCR6F4kpRI26XSpLRHorzonK1IOuteKZRLpIVWUDRC6Ce+rAioFqdy7D+FKfLw==
X-Received: by 2002:a05:6a00:23d6:b0:748:33f3:8da8 with SMTP id
 d2e1a72fcca58-7572267d51dmr131337b3a.5.1752614623808; 
 Tue, 15 Jul 2025 14:23:43 -0700 (PDT)
Received: from pc.. ([38.41.223.211]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f4b16fsm12281708b3a.120.2025.07.15.14.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 14:23:43 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, jean-philippe@linaro.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 1/2] tests/functional/test_aarch64_device_passthrough: update
 image
Date: Tue, 15 Jul 2025 14:23:34 -0700
Message-ID: <20250715212335.2215509-2-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250715212335.2215509-1-pierrick.bouvier@linaro.org>
References: <20250715212335.2215509-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x435.google.com
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

TF-A needs to be patched to enable support for FEAT_TCR2 and
FEAT_SCTLR2. This new image contains updated firmware.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 tests/functional/test_aarch64_device_passthrough.py | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/functional/test_aarch64_device_passthrough.py b/tests/functional/test_aarch64_device_passthrough.py
index 1f3f158a9ff..73bb0df8aba 100755
--- a/tests/functional/test_aarch64_device_passthrough.py
+++ b/tests/functional/test_aarch64_device_passthrough.py
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
+        ('https://fileserver.linaro.org/s/bz9cjSGPgWJ2iQT/'
+         'download/device_passthrough_v2.tar.xz'),
+         '5e892ee9ea4d1348e673524485ecfb960f748dfdd76dbc396347b1781a4f4252')
 
     # This tests the device passthrough implementation, by booting a VM
     # supporting it with two nvme disks attached, and launching a nested VM
-- 
2.47.2


