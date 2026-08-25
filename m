Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B89C61DBD
	for <qemu-arm@archiver.kernel.org>; Tue, 25 Aug 2026 21:30:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyyij-0002Vh-SX; Tue, 25 Aug 2026 17:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyyif-0002Q5-NM
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:30:09 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wyyib-0003Mr-NH
 for qemu-arm@nongnu.org; Tue, 25 Aug 2026 17:30:08 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-3964dfb5a69so474104a91.1
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2026 14:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787693404; x=1788298204; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=d9vZmtDzK9BaCqOMKO6CDu9rwbtI575ats31dCsjvHc=;
 b=mWdFgD+WEu3a1bKrFBet41IYdt87ooZo7OfEPoaQlXGUxZgqO3Wk9R6Us3hlpGpU7H
 9m9ohmzPhT72pmz1H3DiD4U5uT1Jol/Bpq6S9D2AuPMVylr1mXNx0ld3hj1o/fWloN4z
 /b/Niqxz06/wY5LDiRRDrG3BlHFmmzOszWP1qDijJKqLg1ZhyF0uXbziHgDwB1Gsualz
 Wxj7cgmFgcOueWt06DL3M8aV3sQj2d4mKYG2G5GxTm3YdYc0C3DmMHsI+aMfnEODed96
 Tg1xmpUzuUzXujjh5YCihOebO3LTUKvKE3v5C59cPYOzXEF9KxEKrelUswdHynGre8NY
 piNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787693404; x=1788298204;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=d9vZmtDzK9BaCqOMKO6CDu9rwbtI575ats31dCsjvHc=;
 b=BPlfsThowhzimER7s7ZKgndAIdxnlbhXOzj/LvEydcxOJQ47mScVaaO1cO8VeMkKiZ
 J2T0gOwlK2vhxb5liirprFWKqsGxNXNf/ASvyhg0dMgT+cFqf9Uz3K2SboYdrihGDK0n
 Le+lFjqjnW9SieUYIkNBi5P+RwnXTmPavopiZbZPf1khKSLeL4uRvKDF6HIsHUE8DBVE
 9lDP7wcg0tqUu4MJtWPD9i6KWb8tsemNWuoVgFa/r+jukPU4/U8I3MWz0YQbad46BU96
 jYbtW/3m2+rV6iQO28PXRRAQvI9Gu51RWu2aexDMc3PkacLOHWhpWv6nH5/IYr9eukb8
 kIIg==
X-Gm-Message-State: AFuF++mEcm8h1W6zEWBzpXcvXxPOSgivTDBLZ7en9930MDwt+uAY5wY5
 eEuTATs4mXWl4L3TxK2o0T+SDymttrmsPv9gichIydB64gkCz1IwaIQ9YCwnahrXJOU=
X-Gm-Gg: AR+sD13+kWD1JdSN8nrxEn2Eo59yv9HzUtj66mN1DuQBfVP874N+976pmtdsEP+cleM
 ypg+QYoAUzj6klHt3Z9HmWuUDzdoRHU/Nbknu5UBFQ+SAmqHDP1McX5iUNyBpQjsz1ognPyf5DF
 S66K8YG8heZEy/PcMN0jgIUHKCKrz0zXkXDXx2+n8Kyd2PZZWALf1WZfdS1eLnT1Oh6tQ6O/I84
 9uL5oUFvZsf+YCGV27YOqxjfQ/78PQyYh8nkqFs5aiXP5HQqxiJLVejYfgi5b/Ppl39XnqUjYZ2
 DxE6NY8ZyDbq5SHY1fTBtIW3uLBLSXClEpDRPxC6WST6DObAQ8Yv8+zzGU6NuFMkzqaLJj1cFeR
 gYisLwr9MqrpA78bXuO3/YQUUM2fC4OB5grAmWRSLa6rKLZI6Ic3FURRfkVsBpPMY0l12Z5aPDP
 UbleI0/2uiotHt8vm6sxAFZhiOSnBUD6hooJ5N7m7ghJEwjzXO4CRbNmF86C1tGLonXTHBNHFJR
 isLOCNQRr4C4ZWuPw==
X-Received: by 2002:a17:90a:c10f:b0:390:8361:a532 with SMTP id
 98e67ed59e1d1-3966d373968mr4606446a91.7.1787693403513; 
 Tue, 25 Aug 2026 14:30:03 -0700 (PDT)
Received: from stoup (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-396689fa52csm1207163a91.12.2026.08.25.14.30.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2026 14:30:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 3/4] target/arm: Use -cpu max-v8 with aarch64=off
Date: Tue, 25 Aug 2026 14:29:59 -0700
Message-ID: <20260825213000.221822-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260825213000.221822-1-richard.henderson@linaro.org>
References: <20260825213000.221822-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Armv9 does not support privileged aarch32 execution, so
aarch64 cannot be disabled.  These tests must use Armv8.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/arm-cpu-features.c                    | 4 ++--
 tests/functional/aarch64/test_virt_aarch64_off.py | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index cb4d01fd46a..7348fb8d28b 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -493,8 +493,8 @@ static void test_query_cpu_model_expansion(const void *data)
         sve_tests_default(qts, "max");
         pauth_tests_default(qts, "max");
 
-        /* TCG allows us to turn off AArch64 on the 'max' CPU type */
-        assert_set_feature(qts, "max", "aarch64", false);
+        /* TCG allows us to turn off AArch64 on the 'max-v8' CPU type */
+        assert_set_feature(qts, "max-v8", "aarch64", false);
     }
 
     qtest_quit(qts);
diff --git a/tests/functional/aarch64/test_virt_aarch64_off.py b/tests/functional/aarch64/test_virt_aarch64_off.py
index 13d8b73b0d7..73c9a4109c0 100755
--- a/tests/functional/aarch64/test_virt_aarch64_off.py
+++ b/tests/functional/aarch64/test_virt_aarch64_off.py
@@ -18,9 +18,9 @@ class ArmVirtMachine(LinuxKernelTest):
     def test_arm_virt(self):
         self.set_machine('virt')
         # KVM aarch64=off requires a host CPU that supports it, so
-        # restrict the test to TCG only
+        # restrict the test to TCG ARMv8.
         self.require_accelerator('tcg')
-        self.vm.add_args('-cpu', 'max,aarch64=off')
+        self.vm.add_args('-cpu', 'max-v8,aarch64=off')
 
         kernel_path = self.ASSET_KERNEL.fetch()
 
-- 
2.53.0


