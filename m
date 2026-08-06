Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B450CC56208
	for <qemu-arm@archiver.kernel.org>; Thu,  6 Aug 2026 16:40:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ws18O-0006pD-B0; Thu, 06 Aug 2026 12:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18H-0006mf-Mh
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:51 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ws18F-0000JW-B4
 for qemu-arm@nongnu.org; Thu, 06 Aug 2026 12:39:49 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2ce98cb8165so14784475ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Aug 2026 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786034386; x=1786639186; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=3JOD9P96ewq1kt9dQtTWRUzN+g3g91eOzCcajcg6XGs=;
 b=AlClteMBnRsqW97jPXE/APdjGeBaT+2es/GrrPxw1n7B7OlV35Ayp2YowMcBZn8XDo
 uVT4qryTqqkkwYI3KIvCaCGwsXNZdNFXKtBr7f24LS7o4a7LP82WYm0EeJ22jR2mCrAp
 kVBtieMAEREIa5qaQNdCX7IDpLGqvmUsBUe5JHMuzAB/8fQLAFg6iPwAUKeWTZd1Aad2
 /BLKBmxZjzMMvWIKQOwHZm/m6zAgBX96l4hkpyOqmN2MAMc2ouwt90p2NVGBL33Qj6I0
 AgjIw1wqMUKh2GyIx6EjEYZVPgM7rw926gBbIMduEZRK1tJHFv4YGJCHUP+c42de38z3
 8dgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786034386; x=1786639186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3JOD9P96ewq1kt9dQtTWRUzN+g3g91eOzCcajcg6XGs=;
 b=YmBckHqkerFSlJO4onsgzpvOBv+q7rTBKJPshLzhipQNWdQcSPdGqvej8M9hi+aloV
 xfKKBfLThiX7KaK60HGcynjnRWURzLPoAgFTj4ttce7BX4S1Sx6CO/7YkldNlP5eaAeE
 Ow8SNFTrx0brlRLOHewYITsTct/l/ys4eo/AwP0asAZuCxfZhBRbKmQcaxckNbJrB3OB
 ZZngJaL3tmB0EFCjl7lVwTl/lzdUuzMD14XcrfC5TskHkacLJu6obWh3KI222CjGiplb
 GEC5oDCA1P1IpbRYhMmU7mZATcoPANMjlmXQWI72x0zfJ3Vl5wKdze79eaNSEgU+jI8e
 BeKA==
X-Gm-Message-State: AOJu0YwFnwQd5JUssJp72QQsPdZXDL15IrK3tyyPK0qETt4Wwq4PDjvR
 pXNP9zna3G1F+XTOSswzBO1PgTOc0xWUN3uJ91zxexstcHpXvQihxPg0qYcQfcZOVyFWhidGh3g
 z6BVA
X-Gm-Gg: AR+sD12NSp37r223t5xKSiHoaZx2T6g7XK9ndYp/5O4b+zTIjH9v65Bhzxo6+ufcnCd
 2Cz/zZXU2g6AEhi0ljeqorr0IlVOnwmozDxqVQPdeUEosxVuprFP0hS90/rqLv01C3w4zKsV+eP
 6qPVEpgMby2W6q4DQV4mqa2KP70diYRNqCoXbFayspA0v0Bl7ScbBKrcjVYt15gJwLhRJBsy8Qi
 OfMCo02qhsLKO9G6OsdAdkeJkXqLhVcNRQG+iue21G1/RyFZjw671YygxWuaJO62Brk2B75yZOW
 w2OddM9JaxfqziNJKXnseS+Z20DlvH9jHPQ7X0GlPf+EozjyZ4lBkeabwjiUZ3qCfUdr1lpL5BH
 qUgSpTdoX6ME/kHTWQy66zlzSuFKCEDF4sgnbvaw+Mez1KXsW2AhI3+bOgOBDv4JGwjunx14hVm
 AtIHPwVThe9K4YK5fGP5aGhJlpaYy0A/hMxDpNGPnD1k4jwhIRkU/qdrxoOQvkb8z/A2KIma0dA
 VhACVeau/fHsoc1pD1QMk/fv1LimGI=
X-Received: by 2002:a17:903:1aac:b0:2c9:d277:2cdb with SMTP id
 d9443c01a7336-2d0f7094842mr34239875ad.9.1786034385805; 
 Thu, 06 Aug 2026 09:39:45 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d0aa4ec8c7sm34280735ad.80.2026.08.06.09.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2026 09:39:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 6/7] target/arm: Use -cpu max-v8 with aarch64=off
Date: Thu,  6 Aug 2026 09:39:38 -0700
Message-ID: <20260806163939.328201-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806163939.328201-1-richard.henderson@linaro.org>
References: <20260806163939.328201-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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

Armv9 does not support privileged aarch32 execution, so
aarch64 cannot be disabled.  These tests must use Armv8.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/arm-cpu-features.c                    | 4 ++--
 tests/functional/aarch64/test_virt_aarch64_off.py | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index cb4d01fd46..7348fb8d28 100644
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
index 13d8b73b0d..73c9a4109c 100755
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
2.43.0


