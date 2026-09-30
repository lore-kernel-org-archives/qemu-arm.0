Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5696ECA5FB1
	for <qemu-arm@archiver.kernel.org>; Wed, 30 Sep 2026 07:40:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBovP-0001bu-Ld; Wed, 30 Sep 2026 03:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBovN-0001Yw-RE
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:40:21 -0400
Received: from mail-dy2-x25.google.com ([2607:f8b0:4864:36::25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xBovL-00045y-8b
 for qemu-arm@nongnu.org; Wed, 30 Sep 2026 03:40:21 -0400
Received: by mail-dy2-x25.google.com with SMTP id
 5a478bee46e88-347866278b6so1507394eec.2
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2026 00:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790754017; x=1791358817; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+uC2yEMOyxovh8AqIe1jMTAS15AngsrHXCfZuPeSjeE=;
 b=oae9caM5YRUa50ukA2kG4Gx1ZAZObF6+A7WKhJ+3VEj63A7XIuPyV0VrnXXdhUcsJs
 qDD/BQ2k8diPcBHGpjHekoW83O6WWk2E705f1XUiQWAHF3bMO0nCEF6QUohWkEfWxsyv
 ijabjjPScbX0l00VXtt0N84H9XmJjKxi+n+X3i/Ob07QfDOI+1SUgE9acUUcXEpmE5Zt
 Ow18jXqfuK2cxBmVgPiVFzWb0AME2Y//Q45kGeVboh0HHLKrDoU1/9RGbsG4wWQUHI1j
 SIfipDOoCzmksCiWqudlRRVshOnwgmNm7GyaNuIgTFO4oN395tcn6u4oZgQ7+o7qWGuc
 Lkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790754017; x=1791358817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+uC2yEMOyxovh8AqIe1jMTAS15AngsrHXCfZuPeSjeE=;
 b=VIoXlfq5Cg/lehv2obMKyu1Yf6qCjyoNXvPaoxsVk/ZWDH4PuyJZjKAIBb1kHBvZYI
 PhEOBg8ExukRTCMWJ3E7qwXFj2a+VcYe3CJGL+TMcm1Emzz2F07Tj/5Em8EqPaUJbpsg
 jOoIM714bGvAWeGb8NR4q2Nl/8dcZvyTddAXNkd+gDmKA7Bznn3f0xtMpQRs1oLBC4ID
 RH12bkuowJ7kX/EwHjgBJeRauEROiP/r1y8e4dPoF1Mxx5FAS05cXqpf3tcNwU2br4lk
 6bq8H/VAbF9wox96ckRtX+ffsjlcdvl0vrNywxPUMjiC/bz6s3GcbqkJukR9xO9HtY93
 3Vdw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwk8stoFLfcn4whAFbhT8K4YQ7w5T4byJuR3xOIDkYmlK4eEFvWajmzREsujWSOATnBVQY/V++SaA==@nongnu.org
X-Gm-Message-State: AFq9FYJZ/KsoWHet+vdsm6cqDpgYIPblKOXZBah7F63zrWQtC7IKwWIU
 2xIJ4qJvkFj7ibGo/pIW+r0+Gx/rjD9SxcCrSZ2JwtOWDy1iVj26H981
X-Gm-Gg: AYBFou27hSdmiXjUcvuJH7Ijpc04sDBr+fqxy0GhtuYQNrVKnnnHc3pQOyylRQC6HuE
 4lyAPtQTQ7NJO8fHNkhHVaVXP4TU5EEq5RMoOEoK301Eyzogo7ddSxIiBwvgfvU8kRKQ/OTa0Qn
 hphrbzlDtGhj+Nrzn84g/u5NhSqDP6qunWwRH+DDCwkJcoIUbRU0ZmsUiIRyBjpz7DXuVnF0/5q
 IcAozg0lSTIL66a7VKOqx0dfC5ilzDjeQqh7KlhjUxNk/ts0q3h4EQYRyabfirJU4y8NWOJjc/m
 pUPwFQOQuG5WDAPboV1GEZ38FyFWOq4PGKnxOBDvwzZsg3RfDwrRstKtk3wie5mwQZWsgB7AcBS
 gNdMS3ga3+5e0hycOiJaty+OuNJZoHy+urlUs4WNrjA/WVKwlnRdqyOl+yidWd4OJI94UG4JBJt
 uUCmmyQdd1sDqqYsgtNcZSVusOrXjTgpdn/3w1VxW9KhsHM/5DLGthP7Vsz2GeeEwpGvZkQmNmy
 uggX6g7X/zyzzMc7uI=
X-Received: by 2002:a05:693c:41d1:10b0:33b:d4a3:81e3 with SMTP id
 5a478bee46e88-34cdc6c2fc0mr973019eec.25.1790754017169; 
 Wed, 30 Sep 2026 00:40:17 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34cf5b4349bsm1825773eec.25.2026.09.30.00.40.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 00:40:16 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Song Gao <17746591750@163.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 6/6] target/arm: rename raise_exception to
 arm_raise_exception
Date: Wed, 30 Sep 2026 15:39:33 +0800
Message-ID: <20260930073935.712-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260930073935.712-1-luoyonggang@gmail.com>
References: <20260930073935.712-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::25;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x25.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

raise_exception is a global C symbol. Prefix it so one binary can
keep that short name free for another target, and keep the short
name as a static inline wrapper.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 target/arm/internals.h     | 27 ++++++++++++++++++++-------
 target/arm/tcg-stubs.c     |  4 ++--
 target/arm/tcg/op_helper.c | 10 +++++-----
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index c41fa5225c..c4d6f2d9ed 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -333,20 +333,33 @@ FIELD(FPMR, LSCALE2, 32, 6)
 #define M_FAKE_FSR_SFAULT 0xe /* SecureFault INVTRAN, INVEP or AUVIOL */
 
 /**
- * raise_exception: Raise the specified exception.
+ * arm_raise_exception: Raise the specified exception.
  * Raise a guest exception with the specified value, syndrome register
  * and target exception level. This should be called from helper functions,
  * and never returns because we will longjump back up to the CPU main loop.
  */
-G_NORETURN void raise_exception(CPUARMState *env, uint32_t excp,
-                                uint64_t syndrome, uint32_t target_el);
-
+G_NORETURN void arm_raise_exception(CPUARMState *env, uint32_t excp,
+                                    uint64_t syndrome, uint32_t target_el);
 /*
  * Similarly, but also use unwinding to restore cpu state.
  */
-G_NORETURN void raise_exception_ra(CPUARMState *env, uint32_t excp,
-                                   uint64_t syndrome, uint32_t target_el,
-                                   uintptr_t ra);
+G_NORETURN void arm_raise_exception_ra(CPUARMState *env, uint32_t excp,
+                                       uint64_t syndrome, uint32_t target_el,
+                                       uintptr_t ra);
+
+static inline G_NORETURN
+void raise_exception(CPUARMState *env, uint32_t excp,
+                     uint64_t syndrome, uint32_t target_el)
+{
+    arm_raise_exception(env, excp, syndrome, target_el);
+}
+
+static inline G_NORETURN
+void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
+                        uint32_t target_el, uintptr_t ra)
+{
+    arm_raise_exception_ra(env, excp, syndrome, target_el, ra);
+}
 
 /*
  * For AArch64, map a given EL to an index in the banked_spsr array.
diff --git a/target/arm/tcg-stubs.c b/target/arm/tcg-stubs.c
index aeeede8066..7f9f684ed7 100644
--- a/target/arm/tcg-stubs.c
+++ b/target/arm/tcg-stubs.c
@@ -16,8 +16,8 @@ void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
     g_assert_not_reached();
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
-                        uint32_t target_el, uintptr_t ra)
+void arm_raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
+                            uint32_t target_el, uintptr_t ra)
 {
     g_assert_not_reached();
 }
diff --git a/target/arm/tcg/op_helper.c b/target/arm/tcg/op_helper.c
index af56eff9f1..ae48f9ab98 100644
--- a/target/arm/tcg/op_helper.c
+++ b/target/arm/tcg/op_helper.c
@@ -45,8 +45,8 @@ int exception_target_el(CPUARMState *env)
     return target_el;
 }
 
-void raise_exception(CPUARMState *env, uint32_t excp,
-                     uint64_t syndrome, uint32_t target_el)
+void arm_raise_exception(CPUARMState *env, uint32_t excp,
+                         uint64_t syndrome, uint32_t target_el)
 {
     CPUState *cs = env_cpu(env);
 
@@ -70,8 +70,8 @@ void raise_exception(CPUARMState *env, uint32_t excp,
     cpu_loop_exit(cs);
 }
 
-void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
-                        uint32_t target_el, uintptr_t ra)
+void arm_raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
+                            uint32_t target_el, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
 
@@ -81,7 +81,7 @@ void raise_exception_ra(CPUARMState *env, uint32_t excp, uint64_t syndrome,
      * the caller passed us, and cannot use cpu_loop_exit_restore().
      */
     cpu_restore_state(cs, ra);
-    raise_exception(env, excp, syndrome, target_el);
+    arm_raise_exception(env, excp, syndrome, target_el);
 }
 
 uint64_t HELPER(neon_tbl)(CPUARMState *env, uint32_t desc,
-- 
2.55.0.windows.3


