Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE70CD6E50
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 14:29:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSyAV-0006Wo-Kx; Fri, 29 May 2026 10:26:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAT-0006Rh-Kt
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:26:33 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSyAR-0003Bl-QP
 for qemu-arm@nongnu.org; Fri, 29 May 2026 10:26:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49042aeeb75so94572515e9.1
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780064790; x=1780669590; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+YM3QmRUdwOukM/MeGpefVIWU6iLYxgHP+iBzBx3U8=;
 b=iyPJPUGBH/vn93bOZigrZiqOdGrLKyaJ5+W6M+oey58OlX0mctBDAOIg/SydzbnMrf
 d5BXds4badR1DVpOAolsp99JPqQ0fG3NT5Ci23RejPTUYzMqYQ2o/0Q9X+4R0E7Gw6bd
 Tmk3oVkoSufjWsCyaJJnUJSB8PIUv6YYoACl9boR77hv4LDchBeqxs9DefDWCoujGErD
 tvKjnRCva0go9CU4kUotZ4zrxpZmbUoM2gNk7U7iRzQtD2FuiesJk2KI1wsQSzEOD4cG
 vu38WHITH9ZRoRACPpTzc56ksUjOKKUP2RLCqCFeRSiKOJhR1ROSZOqINpAVaANV7+9Q
 7uXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780064790; x=1780669590;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=K+YM3QmRUdwOukM/MeGpefVIWU6iLYxgHP+iBzBx3U8=;
 b=PLkBbQWcAbqbbfzVXOX7FQHB1eZLrVmOJ/ySGv9ytlnzvXlbVi8/nau1ArwR0Dx3/k
 Lb4lZxgBeFragVcLxhBGF7S4oNNj1gOcBkYFVOrY0L/5Mg7GFJMcOIKBGX+wscJ4WQR1
 B3fgmUzigDDcFvIb4wgH5JdpBuUkXyb+vqj8QTf4oxqsEdto8UtN/nS2OYKsNxsh8FTU
 ljbydcOYppChbVnV8uscuYaI8tW5YpCpzCd128jJzriFaGISaCn6Bax1PpPFkeOQM5WR
 uJ0FnA5jePx13ms0uE796W0PfR+PNazHyEUHF/gD5S9xScfgjtnDK4Q88H70csO79emy
 WHgg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Dmo6klX45qGvgwCiLqhotu0PiLCMZkc3l6UfWYQOMh/QAQD2nCZ5JIenrTyBF9lQkj2DXDhfpWQ==@nongnu.org
X-Gm-Message-State: AOJu0YxCshrhEelr1kz5tzXOVHMD4xz4ZJvYwL+SYX8It4qH8DqPvPI0
 Udiozp+eJpxirUQLxN7WeL+7RXbhAx60UElIN4mH2m9jUe7nPxIKBBlmSVrQt6X8InU=
X-Gm-Gg: Acq92OHI4kRCbIxFNJTMDWkcsZWxR68ZKQ0+ITwn3tCrkv+kEz74djRQeAgphPJhEUn
 W3s0OC0KhZMatZdzWAHXqcMt/+pemvX/xXO7j05r6X4tljlmAOdBGijYRTuDmf8pFlxe3vDxbpG
 PlvlLd9IQjA1pO3SgouTsAzE+tBfU/B3OPbikuEU4m89gtQM1A6HncLkO+0WXiRXLvqToHpsu5p
 cojFlLv0pUmLNhWxkxbqHDcH8FEsSbzBQqCJC1f5bltz3lm3weRlPxkXw+Ltqgz73Qc1RiK8Vhp
 CF/ilji6w5cwEFpu+eKYFA305gQwwIt1idmWD3RPBS0TPm1J2ERdQUh7dKcj3l7BW4nA0/0/eIg
 PUn1Qd1ic9qEMNxhg0ErHaBv6wQE2fGrEBr5uzbkF3w+BT/gahOyEdxQ78s5tkZ7eMwUsaY6tV5
 /pvUmSEjuuMaW3Cb8KtLgfTr92e/qS+ttIQr9dsG0TxOzXSWXQTkPqBxHxVAKjelxLOg==
X-Received: by 2002:a05:600c:3b10:b0:490:5872:e641 with SMTP id
 5b1f17b1804b1-4909c0cfe40mr56255845e9.18.1780064790272; 
 Fri, 29 May 2026 07:26:30 -0700 (PDT)
Received: from m15.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909dff2a80sm49531525e9.3.2026.05.29.07.26.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 May 2026 07:26:29 -0700 (PDT)
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
Subject: [PATCH 14/17] accel/tcg: Convert X86 AccelCPUClass ->
 TCGCPUOps::cpu_realize
Date: Fri, 29 May 2026 16:24:30 +0200
Message-ID: <20260529142434.87880-15-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529142434.87880-1-philmd@linaro.org>
References: <20260529142434.87880-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Register AccelCPUClass::cpu_target_realize as x86_tcg_ops::cpu_realize.
X86's ACCEL_CPU_NAME("tcg") TypeInfo is now empty, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/tcg/tcg-cpu.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 04bb9787575..2a61de7f610 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "helper-tcg.h"
 #include "qemu/accel.h"
-#include "accel/accel-cpu-target.h"
 #include "exec/translation-block.h"
 #include "exec/target_page.h"
 #include "accel/tcg/cpu-ops.h"
@@ -180,6 +179,7 @@ const TCGCPUOps x86_tcg_ops = {
     .record_sigsegv = x86_cpu_record_sigsegv,
     .record_sigbus = x86_cpu_record_sigbus,
 #else
+    .cpu_realize = tcg_cpu_realizefn,
     .tlb_fill = x86_cpu_tlb_fill,
     .pointer_wrap = x86_pointer_wrap,
     .do_interrupt = x86_cpu_do_interrupt,
@@ -232,24 +232,3 @@ static void x86_tcg_cpu_instance_init(CPUState *cs)
 
     x86_tcg_cpu_xsave_init();
 }
-
-static void x86_tcg_cpu_accel_class_init(ObjectClass *oc, const void *data)
-{
-    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
-
-#ifndef CONFIG_USER_ONLY
-    acc->cpu_target_realize = tcg_cpu_realizefn;
-#endif /* CONFIG_USER_ONLY */
-}
-static const TypeInfo x86_tcg_cpu_accel_type_info = {
-    .name = ACCEL_CPU_NAME("tcg"),
-
-    .parent = TYPE_ACCEL_CPU,
-    .class_init = x86_tcg_cpu_accel_class_init,
-    .abstract = true,
-};
-static void x86_tcg_cpu_accel_register_types(void)
-{
-    type_register_static(&x86_tcg_cpu_accel_type_info);
-}
-type_init(x86_tcg_cpu_accel_register_types);
-- 
2.53.0


