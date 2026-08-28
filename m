Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0B8C61DCB
	for <qemu-arm@archiver.kernel.org>; Fri, 28 Aug 2026 22:28:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x0528-0002kt-F1; Fri, 28 Aug 2026 18:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0527-0002jz-EB
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:47 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x0525-0002Hn-3B
 for qemu-arm@nongnu.org; Fri, 28 Aug 2026 18:26:47 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2d58efc7356so17059025ad.1
 for <qemu-arm@nongnu.org>; Fri, 28 Aug 2026 15:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787956003; x=1788560803; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=d9vZmtDzK9BaCqOMKO6CDu9rwbtI575ats31dCsjvHc=;
 b=l0XQNT+u2IN0BmRwE2qWZp+h5utV91Gk2S5aOfbpkR1OlYGpkeayqEkHVwuvZ7iUkK
 2MzZrHlulqGDm6cnRltzt/DC++IA3W6lr/BjxQrwjAafr/2C98/JLDvPiVBRRI3Tdqcb
 JuaVQ3EI/nGJIaKUkIap5Kh1QTNLVAQNGqPj/lLo2iI5cDIOSxRlgynNZWXdxZ920alG
 k8y2LjrCAafyeRhpAFsqmt6L9/jUHCpowcHJg7BfWNnsXkWG3j7hfMkDoY1w1QsGyGqq
 3NDrnu/9ybI9TDtXWT7HHuhS9Lzym+foXVTTWmh2nG3bKnsNpNHrDfdEhV5XKO73nhDT
 XyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787956003; x=1788560803;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=d9vZmtDzK9BaCqOMKO6CDu9rwbtI575ats31dCsjvHc=;
 b=KYOSCjZ2jp3aS8nJMFKCZflC0r++UHwNrsunztYj3EohhnfLh5BUjoG+2ZsE7120uR
 PEnuaH53Le7fNOcUcyKoqygffrdj3Xcv3RkOwTBSEDfTWgOTct4tx5cLfCaCqsFWp/40
 uAI+WIsx+mDUAYmzF548Vi9mtghgRT7Tf1n5Ochy9zttQgTECCU4CHiA3gfljtlzCifx
 9O1KR9BK9vd3zU0Sr840LpqPi+kCccEWT5/QDk0AchLdt1z9sZOUV8HdjIl7nCHTJtlt
 4DQSZJCfhmugE6WV0NNpdjFjFVDw0V9Xkhr1bCCKBgRRsVjdh5X4KZpWiJdRANUz/mpP
 qNBQ==
X-Gm-Message-State: AFuF++kvxDGaIqM4z3RGQI4mw5Vdq9RnUPbCsV8/gCauwGy8MjKkd7cD
 R4Tz4Bhs9Y6dSm/y4EjwdYLYJGU8BnLp6hlYrrIBrAkRuf5PIJ3tf7EPVG1PtD/v3ek=
X-Gm-Gg: AYBFou0wU+WrGazKgAakJ5Z9yqs9xQlh6QP/4U2BCb9Z6Y2cuTXuqwgLK0tat5m/DH5
 cGknodAQlbzXA91wOE0biM2qZdAy18ICjhStYbcZkG6qXDxtHKK6r/awIXRapDfs1kp9gIg6H1c
 +nux2M5p+eCyCUtsdyfaUGRWCsOLc5zr8K3T6M8cIiXyH+9FRTWsPWinElOrIrFODkaNW9pWWD/
 K5XvHreyn5afHC+z85UnmHRhXjH69IsMH5n7SGnEuVGBZbfYSh7PCZU0I23qp3Cy73aX43g3Ol4
 xpBhJY/ULjTSL0UzuY7Bgpg9HY3KmNTfjDDVtvQ8OirlM4VTG9N2t7+tDpkXVC1Q8TMfucuIFKe
 9DTqlulT7pbCXEFlcvBumfncK3/VX+6cogzYsqSrYy9deh4Lr1pIk6xGnHyhBaTrOv2QMuW97ef
 F2ZSOlVX/5bqpUzX+mLK4QTaXRcFIkrcYaWK/iRzwDHgA5UWc/6w8Lo1B512oRw4Ghfkfu0r+iz
 IgCBIyAO6Ywy5QpVxIt
X-Received: by 2002:a17:903:4511:b0:2d6:ede8:51c5 with SMTP id
 d9443c01a7336-2d74dc83cd5mr150243015ad.6.1787956003552; 
 Fri, 28 Aug 2026 15:26:43 -0700 (PDT)
Received: from stoup (71-212-39-143.tukw.qwest.net. [71.212.39.143])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d759640270sm9178355ad.34.2026.08.28.15.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2026 15:26:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH 03/13] target/arm: Use -cpu max-v8 with aarch64=off
Date: Fri, 28 Aug 2026 15:26:29 -0700
Message-ID: <20260828222639.1432046-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828222639.1432046-1-richard.henderson@linaro.org>
References: <20260828222639.1432046-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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


