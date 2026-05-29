Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CE4CD6E50
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:29:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSyAf-0006wa-3J; Fri, 29 May 2026 10:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAc-0006oO-Oo
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:26:42 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAZ-0003Fh-Pf
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:26:42 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45e8a834cc2so8692161f8f.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064798; x=1780669598; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbRLYretApx2XFNweDx4MjqL1BkYigncE9vMgvnIk44=;
 b=xQWu5vhRixQtyGmXZ4O5XxYftfJJrMH9BYK5UXHqqj1gDy6GQ1o6Ss1syvFM1NDe7A
 SyKLUQJ1zeJGMdIDlhirnaxbdFHXc8voEqE0NvRkDlw3Oh6qBMXGHfuXOcKtP9AqPo1q
 uIgc6tcSlyl2p9D4F5ENY5qOyCR4g+IGCkslf+ncpxTdwUVaOQbHJVQ9GZBNN697K/BX
 GsyWfQ8CVFB/GGBGRYuYHTji3b/Hq5Pt1GjT+sBbECfCUVg19xtxQhQoMuhIgJNi30bZ
 5YzLXdR+yzrQGob4phDmrzEe7DUhsFh5/lXtlQKIj82ePJ59ksuEHJIy2fAvMMTgRPTI
 mfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064798; x=1780669598;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GbRLYretApx2XFNweDx4MjqL1BkYigncE9vMgvnIk44=;
 b=ZCN5KlDg0Z6QND3diAxIj8DWVa0K8KWeYV4nuxRrPOW7VaR0ygiNr2e6QcjuwHQceo
 wyDPKtrHhOLOxURww5hSBtgzpIlIxL/AXscEYcJuAv+Fwc03baKuSVCgQS6h3A3+cYUX
 ntDeDiH8O6nayeFnAPyKf4dMx4FMxZkzMlZyAPNGzH4urxBA+QZ0qDT+iMwpQ0cAsq9k
 4Dlb2P7VwOiqa9ZWj6QaQ2DB4Ac/ryl9E9H8zwvnaZ5f1aOFBW8lDswI6qe+NGmb0ERc
 b+UuDKFHW5hGCr/rBdg9zJhMSPxdXV6b4CfwoezoFQlDf8XyB1vA0Fn0bU+y7hOGO5hk
 Np+Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+dlQ/tc/fPGXw++JhDbZcrQEydyxcmvEB5aTCQoDYWhbc7qm41dVAFd3ibxZWV8Xnli3d4I/JSIQ==@nongnu.org
X-Gm-Message-State: AOJu0YxCnE6mUbvXkbqxDSyXkFaUrcH+YRbN5W9/sz2PDFum4aAydFxA
 BBjzGcoTz8Bz+JhLtUfd+jCI2B9QzGBabji2e7VGRNZnAYUD6EwNa9ve9Y3PLodDn34=
X-Gm-Gg: Acq92OGy92rjkmTEWCG4UW5Emuf+ES+83HN9EREj/Vy7orQRRQam74crqdGBsDhf+Ab
 wIQMuafGUoXGPGQBSW1DTD6/rRB+uaadKsbNGEmVcehGDv45R63KoXHSrEno8vO9hnl0nru75B/
 /PKUE7UUZsXWxaFoM3xneWZkDNoBE4nEmvgpQEGmQPyoAaYkoreoo9Ob/NisESU8loi0qQyGrSf
 paY0jx/p5CyzWFS0pfWd0c+aPIvO4F9CjFH6EkgQkePq/reVguSFOPwkL9KoTfOYyCX0ATythrE
 lFoA9ot0R2JOrI8adqIJy3H4IN4Tf+reUP7RXRo6dWIqy+zEJHJkwSJjpqDVWCUv3v5d1wmbpyl
 Ljw+pA9+mhKUg1Z5x+LIzhdTk7X+2VriTcR94jPT5Bt1ls+ADHA0pRCKNwBjpVWRmBhCkNQzlZW
 Jkxdhz7vf56QEMGNg0lR2nnIA+00lGrFbNdfHf3cOLVMk5Sg5nnaF+1A0EeDmSKseXsg==
X-Received: by 2002:adf:e7cc:0:b0:45d:b14b:23fb with SMTP id
 ffacd0b85a97d-45ef6b24f8dmr59899f8f.11.1780064798213; 
 Fri, 29 May 2026 07:26:38 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef3556f51sm3823250f8f.25.2026.05.29.07.26.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:26:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>, Glenn Miles <milesg@linux.ibm.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/17] accel/tcg: Convert RISCV AccelCPUClass ->
 TCGCPUOps::cpu_realize
Date: Fri, 29 May 2026 16:24:31 +0200
Message-ID: <20260529142434.87880-16-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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


