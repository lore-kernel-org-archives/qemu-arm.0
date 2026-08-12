Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406F9C5AD5A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Aug 2026 20:46:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuFp3-0003tA-54; Wed, 12 Aug 2026 16:45:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFoo-0003cd-Uk
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:59 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wuFon-0002H3-Em
 for qemu-arm@nongnu.org; Wed, 12 Aug 2026 16:44:58 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-cbb7926836eso56405a12.3
 for <qemu-arm@nongnu.org>; Wed, 12 Aug 2026 13:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786567496; x=1787172296; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=92Z59h4EjWpGyEMEUV984CWvR3PXtWrfjl/HvHT0LOw=;
 b=VjmTfj1oOIEq//rIrQme8RLIpcJGdIT+I6DV4ZBJ3TsBCIW4QeEGP+oF8ZecUm0pDx
 bnhoOZ0Op05peGm+WiaP/R4ri31yPCyOQ2E984u5cgxv5KcS85C0IQmn0fyjGDFfNUyQ
 jfZ/Q50jdOLRsM/yLarglTvDkd+aY/kXcq+JbPt7uTTRNPnTH2o27xabIuajdkkSs5ir
 S6s3S/ZyFJhrkmUtxozthKTVW8EwEhJkcU6TdkltMMx3kvSydDmwD0/hAK1LdbfRtXFq
 UnhFj809nRXbUNY2XVVVyVx3Xmu1qGZXHxUGJg6YBjcGy0/z7WlZh532lRhLkhNdrubl
 jILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786567496; x=1787172296;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=92Z59h4EjWpGyEMEUV984CWvR3PXtWrfjl/HvHT0LOw=;
 b=r0zPsVoSteM4mVA0rnEhybkotIS5GHla6Shu2mofl1+igH8je3sHLJAmnvUu0z5OCF
 lv9yevDBG7b+wwujc2OORmbtjp8Rr6ZGmObxBnvM6pUanDiTi1lD3N+/hHlpwZY/nKC9
 cDu2SEZQE/H+Kxhl5s6q/asF/GT62ogG1T9+gO1UUQ6l/JwjiIMkQu6YM7NzNkP3AO/l
 QfUKH2yc16GE1BRnnOcazepAMZjvXSFdWBqDcCKxyCyl5n//fX8k8+FIcdGzBKIHo64e
 910Y1gGtwVeRJaN4spwTahgA3TDMHv6zCfkc7ELPIRCBC+U+Y/EWDnwxlpNDgYOtgpKl
 f2HA==
X-Gm-Message-State: AOJu0YxF7Q6W9UbhhML1jjkfjRDfsyJIPqzVs60JuxSYjxHY2CbXI5Kz
 6SA6pmFE/FkYJM8hTwC5NxSqAFIeyAec5s8FjVInbStHUmFBtnbw39phK9WG4LyABkk=
X-Gm-Gg: AR+sD11Zzm4cphHeTXlUeNANHrJ0h2i3MuD2y7XAeD4nQ6Mv+lRS1+vyxV2D6RmRHhF
 LzETy8ViIg/26z0SLGkyLjffILhe7r2NIUoeVtkvqFvGkQ14xcbCBXP7HHTZqPXxzOa/KWS6JNU
 3ser9XiTszgIHklVvOj8DVLK2QLiAssIpZiFGktBM+or2GsgRDTo1Gj10OSosJrM0+4peRYg+AM
 /42Vk3fRSPX7Fi8hNtvdS8/WpTNgjxr3+ddHGurJprpWb5uuLX5sYZ7Dm/fMGKh9FVaDjiqowJ4
 43fFmnYAys/StifHpbc3l1XUXeJWB1cdDZ/402tml1BqhvHw+KPdzLLZTwGSf9f3V5OM3TDp7E+
 59PKBWBoThzOKEw39kGVZETL2b59k8He4kt27iF7/OvvU+ez1OvE+VX843Ad0s/SdSi8B/Nj5iP
 u7FNqlWHE+PziwYb5UIlP+R9iAGPiUTHNwrRnJD6q7NQJL0pGgsLp2mTshOiqFrSIjp+6jFcbsk
 tOqbJy7PT0jOM93anr5BeP5asp0gUg=
X-Received: by 2002:a05:6a00:f06:b0:848:3dae:66e2 with SMTP id
 d2e1a72fcca58-84fc7159e61mr596882b3a.26.1786567495964; 
 Wed, 12 Aug 2026 13:44:55 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84fc4787325sm125308b3a.23.2026.08.12.13.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2026 13:44:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v2 08/10] target/arm: Use -cpu max-v8 with aarch64=off
Date: Wed, 12 Aug 2026 13:44:33 -0700
Message-ID: <20260812204435.295067-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812204435.295067-1-richard.henderson@linaro.org>
References: <20260812204435.295067-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
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


