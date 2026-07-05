Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B9AC43602
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:49:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEbn-0004gd-7F; Sun, 05 Jul 2026 00:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbk-0004fG-Ri
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:32 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbh-0003x3-I6
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:32 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2cc6dd436c6so4874895ad.2
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226248; x=1783831048; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9ndt7/Xaf78gbnm5ds/w+OXU431kvwyAI4qL6QO88k=;
 b=wsMY2mNOYuPLulFUuO3Dlh4yKKS/tdt504sZLYOaeLl9TIu890GAthrvxB+JN7gyOj
 t1chpfmlpiwmXxQZtLy9u0tcZMlDd+jYQRLED8aXyC50pG1llinxt5HO1DNuYydzX8LS
 s97AuG9ngyltdyMpcjOoxPozEeRAhf6u7u4if6VKOGHJuU6AeL8pYwc+Y6mTGATMnZ5V
 c4SE95KaoscSwnIVwNYTr856W5Fns8TkCn+u72jWVT7E16yfIsrY5FC5ftO4unCFVC+1
 i66qsNwDHlIbDJKeI7RRNlIPabXYZzoxNVmKtwsLr3Hiibp/pfR0KlCQFQ7lwCE95r4Q
 Eagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226248; x=1783831048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=E9ndt7/Xaf78gbnm5ds/w+OXU431kvwyAI4qL6QO88k=;
 b=IzehQvtFJRtEKaRmWsKoYXolnBTiV9GvLqcU/NcF6xwCUW/Jg0+w40E20JTWCfywvH
 c8uxL93D3D5TL6Jhkrj7FneoK17RURgFE707luWsD7etEMGSlU+Oy3Qv5l09cy+Fg9Qe
 TvF2mp7da6Cqs1caipD0gSrXaikHs3mJvdxTZnsvdq7dDOoupVk3NCkiwDzJSGTvA7om
 FU4ZkNGeVUTjPaAsNyzfDmS7i1rOXuvwIUgl9u5bhfwctNzMHLeNZbzzg4sUHTvRzoDA
 jvFcBzp5Arzd99Fmi10Q+YNmlyVtXcq592dwXC6WokzMNS1eZAeiVZGQF7YZD3k7WoGN
 EWbA==
X-Gm-Message-State: AOJu0YycS7lUed25E5FWVQJecsDsOnwdjTgSZtoR9sphGFtwBkEt9GMQ
 gncUOQs5EKNSHIDc23AwZmdi4D1IxVAJNcXha/06u9qlw85eOE99CM9oepfDOy/QBzg=
X-Gm-Gg: AfdE7cn/eo44/a8NSnnyEtRQpAE0uxHrNvVrGozlvi4p8kByvFllfnUWe/DdCatQCeV
 XCogeqalAr5OfLbHEt98EjRhQOnHwqzzDsV9XyfZocRVswOa9jyKUQahFjlpcVXmtnsZkSO1NHs
 Pzoryh1e8uoQcRhnai3nbTMatEsgJiIB8FX+wxB1bocV3BQpUbHfesPL3VPRECcHd517BQyKoUt
 5aNNUu3Ga5BcBws+fapNOZOtLh9lNJXNvNlbf83SNE8WmJ4cn4RnsjzWH7VeSQbszr1oABLaDIY
 KDPGQmFeLCfxUzJ8WTtKt3cRNA/3G+iIju0IIyg17xPJK5YlVHbZJmldVolStgGt7Re6DLRWKTA
 R666JafkVAE19ywpd+RSUjFfjnHfD/9Et5YrbYUlJC6Lz1ozK7NxX9+OwdNr8qzT9Fa4ZoD0aWE
 FDqltEl0vbSaH3dkWS6RdG8oy+/Pz7bEGESMEx1G/CojZZEyiZk5MpzUnrQg==
X-Received: by 2002:a17:902:db0b:b0:2ca:6514:9201 with SMTP id
 d9443c01a7336-2cbb9e2441amr46886065ad.15.1783226247981; 
 Sat, 04 Jul 2026 21:37:27 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Subject: [PATCH v2 01/46] cpu: Move BREAKPOINT definitions to
 'exec/breakpoint.h'
Date: Sat,  4 Jul 2026 21:36:40 -0700
Message-ID: <20260705043725.1373137-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

From: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20260630220100.1289-18-philmd@oss.qualcomm.com>
---
 include/exec/breakpoint.h | 14 ++++++++++++++
 include/hw/core/cpu.h     | 14 --------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
index 95f0482e6d..cc6fedd09f 100644
--- a/include/exec/breakpoint.h
+++ b/include/exec/breakpoint.h
@@ -12,6 +12,20 @@
 #include "exec/vaddr.h"
 #include "exec/memattrs.h"
 
+/* Breakpoint/watchpoint flags */
+#define BP_MEM_READ           0x01
+#define BP_MEM_WRITE          0x02
+#define BP_MEM_ACCESS         (BP_MEM_READ | BP_MEM_WRITE)
+#define BP_STOP_BEFORE_ACCESS 0x04
+/* 0x08 currently unused */
+#define BP_GDB                0x10
+#define BP_CPU                0x20
+#define BP_ANY                (BP_GDB | BP_CPU)
+#define BP_HIT_SHIFT          6
+#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
+#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
+
 typedef struct CPUBreakpoint {
     vaddr pc;
     int flags; /* BP_* */
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 59d601465b..c3959607df 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1138,20 +1138,6 @@ void qemu_init_vcpu(CPUState *cpu);
  */
 void cpu_single_step(CPUState *cpu, int enabled);
 
-/* Breakpoint/watchpoint flags */
-#define BP_MEM_READ           0x01
-#define BP_MEM_WRITE          0x02
-#define BP_MEM_ACCESS         (BP_MEM_READ | BP_MEM_WRITE)
-#define BP_STOP_BEFORE_ACCESS 0x04
-/* 0x08 currently unused */
-#define BP_GDB                0x10
-#define BP_CPU                0x20
-#define BP_ANY                (BP_GDB | BP_CPU)
-#define BP_HIT_SHIFT          6
-#define BP_WATCHPOINT_HIT_READ  (BP_MEM_READ << BP_HIT_SHIFT)
-#define BP_WATCHPOINT_HIT_WRITE (BP_MEM_WRITE << BP_HIT_SHIFT)
-#define BP_WATCHPOINT_HIT       (BP_MEM_ACCESS << BP_HIT_SHIFT)
-
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
                           CPUBreakpoint **breakpoint);
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags);
-- 
2.43.0


