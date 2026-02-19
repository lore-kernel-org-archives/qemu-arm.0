Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B54E9A055
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 17:20:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt7fO-0005M3-SL; Thu, 19 Feb 2026 12:18:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fN-0005Kz-DH
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:17 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vt7fK-0000Pz-F6
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 12:18:17 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-65c20dc9577so2053815a12.2
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 09:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771521493; x=1772126293; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PctGYd5Mfdikoz9PktEn3l1PiB58v2keUC2KBTjncYk=;
 b=n35egehwbG748bnECAXwCMMsqrAbn8dFTPDqOt0RQgqHCcLgyJScqh6n1CeYD781j+
 tJg17l0OR5+whzZHoVrXXJrb5nKs+jfi4Zy8iaX34f2yAhEeeXwGKC7Ccr3010eG0CAF
 syWsa0QEjLnQpGeIA5WiFl5U3IgOqMxNqVvyWI2WYB+xMhDhYEhQ6lfKnnuzK5P1Z9en
 tj6Rkwp78Lo3Jhz+CPIpNxG5hikZkXDr9a8IDn1NMFb/TdyDBnPwL7NGcLt5xD/FAwpn
 ZHcR+pkiHe3cdCM0hbOBBkC6/7SeIpuDH87+OK5sK9yY7dsD9u+uIfBcYvGh6X9Un13+
 Kxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521493; x=1772126293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PctGYd5Mfdikoz9PktEn3l1PiB58v2keUC2KBTjncYk=;
 b=wsrJPvr5pK8FM8p+C1TZCrKCzHZtDnpMFJFRRLdhwMIHuqDg3Cx53anqHBbVbKfGIR
 EsQgj80+VtCDd3SHmTdiODx1gVMW64sqCdrk+KQXZLv9Wf84ZI0n4KXuOVuIwgRxnwA9
 8yYKm1um0JIYMGyW18VXd+6berTLEHI1AK9+20TUz+uamSG+eG81tV8v/3eNRlODDPQV
 1TJih/WjibruYG/th6vB5/r8e1bUZ3lvQvttlvyS/AvR4rCiXLEENKa2zAoAdyhcEb4i
 aHtC4WjOe+dWHk00eWEJurRZ72xO0rEs3Vckj5zMI6t8Xhy/2O0Ping2SqWyutyP5Qfi
 gdEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB6MQ3PtKlwKaWnhzChggQjBXLEqz2krUKu4kHIkW2DzkMUcSprpcYDySMPcBJ+w15mbc3D8MYXw==@nongnu.org
X-Gm-Message-State: AOJu0Yx4Ppdaut9AWC7gdVO8w/XvNT4BuAvedT0c+RDuTwI9dW6j9zOS
 ayxzhFEWfNZCY56JFvoV4fF1rOGfa1NxVKoY7vHmYm8CPRpEw2ZPsQ3IsfyF1scS0NU=
X-Gm-Gg: AZuq6aI0XKBiGYUWAjIYkTMLR+MWv1ZYev+aGsID3SnQJP775Mful5ghvuvWP8iPZYM
 NILKKitngYvLnFjGQqzVVjjPOXaBbFuBwtoZW/ghXk1h/rP0qF+5dO08ZnhqrAdJ1FO1/eQsniH
 mXqrdFwVAw30NBsEYvn+DUbqiNtsSPmbXHFl7s+QxZDolK8gH2uG/8urw3UZFJjx+uexyACU7nk
 7J9LZYQkS6kyEJvt8fPAJCSdsx/8aK2L1RhJ5erWolnE7lhDQoPvzLpgxW/5ashJAQdFCG3Rlqn
 MsUEVuKWis9P4kYwHt8oMJjPMJDgzDWBdyR1hjUJv6MqVvn8dPZLvET6DTNEbH690NT9jA45Y3y
 OCYB5RYGImtzrsP8wnEz5xP1NLAd9iIDhtSea3Fu4T8wsUXslXYXdeCLU9/4FdtOMmE9YaWsO/2
 7GZlXP5SGzaEOY8pdyzyzqPag=
X-Received: by 2002:a17:907:980a:b0:b84:1fc7:944f with SMTP id
 a640c23a62f3a-b8face4d5c1mr1161789166b.45.1771521492516; 
 Thu, 19 Feb 2026 09:18:12 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc735e5a6sm597992366b.1.2026.02.19.09.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:18:11 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B417D5F8A0;
 Thu, 19 Feb 2026 17:18:10 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Yoshinori Sato <yoshinori.sato@nifty.com>, qemu-arm@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <huth@tuxfamily.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jim MacArthur <jim.macarthur@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH v2 02/14] target/m68k: initialise pc/sp vector during reset
Date: Thu, 19 Feb 2026 17:17:58 +0000
Message-ID: <20260219171810.602667-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219171810.602667-1-alex.bennee@linaro.org>
References: <20260219171810.602667-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
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

All 68k chips should be able to follow the architectural behaviour on
reset which is to load the initial sp/pc from the first 8 bytes of the
address space.

To avoid any potential issues with un-reset memory controllers we
punt the final setting of the register to the exit phase when
everything else is guaranteed to have been through the hold phase.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/m68k/cpu.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index d849a4a90fc..0dce8ef282e 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -25,6 +25,7 @@
 
 #ifndef CONFIG_USER_ONLY
 #include "migration/vmstate.h"
+#include "system/memory.h"
 #endif
 
 #include "cpu.h"
@@ -174,9 +175,25 @@ static void m68k_cpu_reset_hold(Object *obj, ResetType type)
     }
     cpu_m68k_set_fpcr(env, 0);
     env->fpsr = 0;
+}
 
-    /* TODO: We should set PC from the interrupt vector.  */
-    env->pc = 0;
+/*
+ * We defer the final setting of the PC to the exit phase to ensure
+ * if any memory controllers need to be reset they are before we read
+ * the initial reset vector. This is a NOP for user-mode which will
+ * set the PC in init_main_thread() after the CPU is reset.
+ */
+static void m68k_cpu_reset_exit(Object *obj, ResetType type)
+{
+#ifndef CONFIG_USER_ONLY
+    CPUState *cs = CPU(obj);
+    CPUM68KState *env = cpu_env(cs);
+
+    env->aregs[7] = address_space_ldl_be(cs->as, 0,
+                                         MEMTXATTRS_UNSPECIFIED, NULL);
+    env->pc = address_space_ldl_be(cs->as, 4,
+                                   MEMTXATTRS_UNSPECIFIED, NULL);
+#endif
 }
 
 static void m68k_cpu_disas_set_info(const CPUState *cs, disassemble_info *info)
@@ -396,7 +413,6 @@ static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
 
     m68k_cpu_init_gdb(cpu);
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     mcc->parent_realize(dev, errp);
@@ -641,7 +657,8 @@ static void m68k_cpu_class_init(ObjectClass *c, const void *data)
 
     device_class_set_parent_realize(dc, m68k_cpu_realizefn,
                                     &mcc->parent_realize);
-    resettable_class_set_parent_phases(rc, NULL, m68k_cpu_reset_hold, NULL,
+    resettable_class_set_parent_phases(rc, NULL,
+                                       m68k_cpu_reset_hold, m68k_cpu_reset_exit,
                                        &mcc->parent_phases);
 
     cc->class_by_name = m68k_cpu_class_by_name;
-- 
2.47.3


