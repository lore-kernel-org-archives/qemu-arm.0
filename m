Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F27CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 14:48:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL01w-0006uu-U5; Thu, 07 May 2026 10:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL01l-0006sh-4L
 for qemu-arm@nongnu.org; Thu, 07 May 2026 10:48:37 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL01j-0001kx-1e
 for qemu-arm@nongnu.org; Thu, 07 May 2026 10:48:36 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so14212135e9.2
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 07:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778165313; x=1778770113; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aSZyGlE/3ZUG/BJAP5hidhitoTH4V8t7lHsZFK1Q5pc=;
 b=vUvBKmk+XFgc3iPgaKDUEKiwWwXtNoEI4wFZfwzRD2a1H225lw+5kW0qt8UhkMYeRe
 j/NTiQAcHm8Emgz/Wu7+czcanaEtDPIsX2f1IiX1NVFLAcvQxR7C0Yyr2te7A2qpXjg3
 TOnCYIRGQ1ipjIsfsIsFj4HZeahvMTLykEgmGM9Xi1BRShzBMACLKlP7uujLhlW48CNL
 8Uj22CiByJP39Zj7Ty7IQxRReUMCO9//7ptL6VoQbZ4Q0wdAD/ot6Ylm7xiiJveFpg8u
 FXW0bs5Dlg1u91ohOcyCqrUMppJxgmCPk8iqzMHyO/ApaCUNTxRLySR61OUynhQ7fxJQ
 lv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778165313; x=1778770113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSZyGlE/3ZUG/BJAP5hidhitoTH4V8t7lHsZFK1Q5pc=;
 b=VzwQxdPfXkbLcNja7ICTYdYO7WUdDmVX+kLHK9lhPzvBhHPcWlfj+ss+Ul7kPrkiOF
 sgYtilE7rYrWI0/tUvRg6DOfSe3OkkkEf/qF6itpuJZV9DwlPCo8FYBqu7V7tAxGiiSb
 VRaiI97MKkZiIikxRCVDq6H8L7L4zfkXYeCMMEzeaaelhRvm7B+VDyq2UZjs57dKKiw3
 YgesyvPH8qmhmIGsQoQ6wEiuGTlPFYDIuMMqknIgb5YXmtp6v6E3PdXZ8Ez8g0mYYb7G
 vFGF9GnuJXXuboAS59gzNxEz3Ems4fckyB/Kdc313eA4cKaN4XHH0kg/M6H7KP+vpg+V
 QZcw==
X-Gm-Message-State: AOJu0Yx0QzSYUR15koAUKt5/vI60s1JoqK0ZGDXRG8Tw+M2tntnEGANC
 ycktYtLgvn4b7P1cGhTiT2tW/iyBFJ/eNm4b6Kcnrtq/3A9GjyE4L8FPbKncegzy7LMq2JaF+20
 S651q
X-Gm-Gg: AeBDieuJkhaIH8a7dd2GCnTIRtpG8x3tMUh7Bbf/ooMBlTIOlFycEDpBZYMKh0W+wyy
 Kncvcs8jgB/c16+tgebrC5jIP+dfo5XkVKYhrPkbVvvDXyfyVM+dx2Qi3W1qNuuGtvSS8irqwZs
 48/VPEHYujrQkPq5gl2ldgNL9WRG656ZrwCtP3PnpHWjlXdS/XM5Q1FomLtGBVfKG5ea5icexLc
 rZsM9aBKXKMQ/JPJjh8X0yClE7LCtVdsTAqGta/t7fKTEfR2ub16cv6GbxiUzZ0GvO68X3am3Lw
 Qz/E9XBEmy+v5VS2DDcjxEtbClq08520bIqVpWmDeN3x6HuGHtUZzb62Z0jA1qgpfsamhssylY2
 ET+xypkSixM88s9PMUqbkN/DeUvKaD5SKBE2LZ6Tmgh1xgtRse32CP8rJ56s+1P34GF7BCBWzT4
 6Vk/iDYHqEMDUFeFt2FrRiFAQcWebtxvX/4D79RZo/FSv2LWBVbOOqYEC0YSAuugyT0AoRG1yeq
 X4HZzoliITsWo1F49+waSF/Wids/3Ngu5jDVZOCMA==
X-Received: by 2002:a05:600d:849c:20b0:488:a2ac:a34c with SMTP id
 5b1f17b1804b1-48e51f220e7mr102228055e9.12.1778165313333; 
 Thu, 07 May 2026 07:48:33 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e538b6e9bsm219153905e9.10.2026.05.07.07.48.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 07:48:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] tests/qtest/iommu-smmuv3-test: Skip if no TCG GICv3 device
 present
Date: Thu,  7 May 2026 15:48:31 +0100
Message-ID: <20260507144831.1604398-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

On a KVM-only (--disable-tcg) build, the iommu-smmuv3 qtest fails:

qemu-system-aarch64: QTest does not support GICv3 emulation
Broken pipe
../../tests/qtest/libqtest.c:201: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)

This is because the test runs the virt board with the qtest
accelerator and gic-version=3.  In the virt board this selects the
TCG (emulated) GICv3, but in a --disable-tcg build we don't compile
that device, only the KVM GICv3 (which isn't usable with qtest).

Add a check to the test so we skip it if the arm-gicv3 device isn't
in the QEMU binary.

Cc: qemu-stable@nongnu.org
Fixes: d8d19c31b220142641 ("tests/qtest: Add SMMUv3 bare-metal test using iommu-testdev")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Looks like our CI compile-tests the --disable-tcg build but doesn't
try to run "make check" on it.
---
 tests/qtest/iommu-smmuv3-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/iommu-smmuv3-test.c b/tests/qtest/iommu-smmuv3-test.c
index dae9821b92..708fae5fd3 100644
--- a/tests/qtest/iommu-smmuv3-test.c
+++ b/tests/qtest/iommu-smmuv3-test.c
@@ -64,6 +64,11 @@ static void run_smmuv3_translation(const QSMMUTestConfig *cfg)
         g_test_skip("virt machine not available");
         return;
     }
+    if (!qtest_has_device("arm-gicv3")) {
+        /* This can happen for a KVM-only build: qtest uses the TCG GICv3 */
+        g_test_skip("gicv3 not available");
+        return;
+    }
 
     /* Initialize QEMU environment for SMMU testing */
     qts = qtest_init("-machine virt,acpi=off,gic-version=3,iommu=smmuv3 "
-- 
2.43.0


