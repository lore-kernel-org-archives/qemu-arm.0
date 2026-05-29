Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C558DCD6E49
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 19:52:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wT3FZ-0001pg-7Q; Fri, 29 May 2026 15:52:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3FK-0001Py-LR
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:51:56 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wT3FH-0005Av-Pi
 for qemu-arm@nongnu.org; Fri, 29 May 2026 15:51:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4903d730b1fso74470905e9.2
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780084310; x=1780689110; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g/8lHSi3EP+6l9bUS/wKfhybD6uSaQVMlqXN20XnJKM=;
 b=R01vJtRvTg7X6pKqlCaMyVX0ZGOfT4oUTJWOXwPf53GQxzI03X40yZKmuYUOGqPswS
 PtkXbMffkBtVmN29OEOGzDZf0UERIR6PGyLXL0hZuN4AGims9iyXiBaedN9tcCztkh3+
 z26yeawI3heeSjeG584JUO7SsQY5xLvtNc225DSXlg7w/6fKUlSJ/rA2Neepfvq28NTc
 iSZ65CHVg7Aatzbnp5qWpfZnWGkgqsGAh1/jSpJQbSeYhDgQDddxxeslktULWh4m9feG
 yzWVnq+8AbsC6pzKBj5itlFbuWB844g0K9ul+0tz9wNiCF+zqtM8Zka+9f13/0k1M+Zv
 T7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780084310; x=1780689110;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g/8lHSi3EP+6l9bUS/wKfhybD6uSaQVMlqXN20XnJKM=;
 b=JrwswmbEMw+fH9N4/POSH+S1RDA5QJvW2mYuUIQFmOsOW0ztDgEu5JOkX8K3gzivwt
 A29o9yoRqywL0OQvXQ4KYvhzHbIVzje8e3KuLblVXE6BPCmKWyHbOvHVQTIiPAvcLNTi
 PTBnJhCVXgbjWVrn/+W1FxJSQU8unVpOw4+gBsunfjOz0mRXok9cjhYGdcFNOXXTe2xe
 oKvXmkTKMwVOCpwM0O6Z5mW1rmNKSEiFSFaAUr8vp1cAgevrJeRj+76J6o4d4o18BMjl
 mRAduDJY8r1WcoymP75jIpCJBm27B9xtkhYDmXtoYotktmePyiV1Rn0ZiW4m95ggxJLE
 dyqA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/iwRU6ZbgJBjxT4CzqxGmIpy13PhD6lnYzZeetG48JeEfGvlXCkm0yPXC/6I1PRiLcxtLddKUHlg==@nongnu.org
X-Gm-Message-State: AOJu0YwhRt+rY1I0l7V3Pq1mjjhqfMMo+TjE/Z106N6WteX0imCT1f7i
 90m72oaVytOTg+TsOetEsTxURaS0K7DU5zXZbwAvbn8GGAMhkjbKie8SorIvGc03ARs=
X-Gm-Gg: Acq92OHd9WCKMaPl9/lfMwtJF3rg0UppyoTLe95gQWwC2l+UJZLObS8f6mbDY0hp/cR
 YVVs7KzxBmMShXII57+ETfltDHnBZI7gGJP75PyMNJk0Ec93TPkfexYqfNdyiP0LIfMCSu+rURQ
 Np8+LZrcOFOL7zs53RQzFeW8enOCPn03zYKIGmwf2QCSuwpkzWlJ+bQtbyeKonbD0bUSbasg2x+
 mwWI/ywWjTA8Hsb+LrSQ/SF+kJ8y+jvnELmJZF7Z4dE8VhNN1u9DIkzrmgZmdNeMkPwC0aOtQzq
 0GFNgrWcas4N/G23bkZMXasgSF/G6GTchhYdG3wsqEkfzMBajga2sPZ2S5y4yliXJ4WVbCl7m7i
 ucPf+L8xjicXBU8ITMRwwdit/k1CgvujiB9QXxKUiC1ESPcS4W5FmXW1M3xFzQG+LRqR2xK7Doo
 DYwA9fHavpb9Km1/audcPbaoeUF7Wn54ewDkhe/PpUDpA7BEZAK/BdLTvF+8ETbhb9Fw==
X-Received: by 2002:a05:600c:4f08:b0:490:5149:a242 with SMTP id
 5b1f17b1804b1-490a290d4f9mr16749005e9.5.1780084309682; 
 Fri, 29 May 2026 12:51:49 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68980csm69622085e9.1.2026.05.29.12.51.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 12:51:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 kvm@vger.kernel.org, qemu-s390x@nongnu.org,
 Chao Liu <chao.liu.zevorn@gmail.com>, David Hildenbrand <david@kernel.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Song Gao <gaosong@loongson.cn>, Paolo Bonzini <pbonzini@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anton Johansson <anjo@rev.ng>, Claudio Fontana <cfontana@suse.de>,
 Eric Farman <farman@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Cornelia Huck <cohuck@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Reinoud Zandijk <reinoud@netbsd.org>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 15/17] accel/tcg: Convert RISCV AccelCPUClass ->
 TCGCPUOps::cpu_realize
Date: Fri, 29 May 2026 21:49:37 +0200
Message-ID: <20260529194940.97143-16-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529194940.97143-1-philmd@linaro.org>
References: <20260529194940.97143-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Register AccelCPUClass::cpu_target_realize as
riscv_tcg_ops::cpu_realize. RISCV's ACCEL_CPU_NAME("tcg")
TypeInfo is now empty, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 target/riscv/tcg/tcg-cpu.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/target/riscv/tcg/tcg-cpu.c b/target/riscv/tcg/tcg-cpu.c
index 703c2d9bd0a..c885af6c03f 100644
--- a/target/riscv/tcg/tcg-cpu.c
+++ b/target/riscv/tcg/tcg-cpu.c
@@ -30,7 +30,6 @@
 #include "qemu/accel.h"
 #include "qemu/error-report.h"
 #include "qemu/log.h"
-#include "accel/accel-cpu-target.h"
 #include "accel/tcg/cpu-ops.h"
 #include "tcg/tcg.h"
 #ifndef CONFIG_USER_ONLY
@@ -269,6 +268,7 @@ static vaddr riscv_pointer_wrap(CPUState *cs, int mmu_idx,
 #endif
 
 static void riscv_tcg_cpu_instance_init(CPUState *cs);
+static bool riscv_tcg_cpu_realize(CPUState *cs, Error **errp);
 
 const TCGCPUOps riscv_tcg_ops = {
     .mttcg_supported = true,
@@ -276,6 +276,7 @@ const TCGCPUOps riscv_tcg_ops = {
 
     .initialize = riscv_translate_init,
     .cpu_instance_init = riscv_tcg_cpu_instance_init,
+    .cpu_realize = riscv_tcg_cpu_realize,
     .translate_code = riscv_translate_code,
     .get_tb_cpu_state = riscv_get_tb_cpu_state,
     .synchronize_from_tb = riscv_cpu_synchronize_from_tb,
@@ -1676,24 +1677,3 @@ static void riscv_tcg_cpu_instance_init(CPUState *cs)
         riscv_init_max_cpu_extensions(obj);
     }
 }
-
-static void riscv_tcg_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-    acc->cpu_target_realize = riscv_tcg_cpu_realize;
-}
-
-static const TypeInfo riscv_tcg_cpu_accel_type_info = {
-    .name = ACCEL_CPU_NAME("tcg"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = riscv_tcg_cpu_accel_class_init,
-    .abstract = true,
-};
-
-static void riscv_tcg_cpu_accel_register_types(void)
-{
-    type_register_static(&riscv_tcg_cpu_accel_type_info);
-}
-type_init(riscv_tcg_cpu_accel_register_types);
-- 
2.53.0


