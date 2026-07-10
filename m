Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423A2C44506
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 20:56:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiIFF-0001nB-0f; Fri, 10 Jul 2026 16:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIF7-0001fo-RP
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:42 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wiIEr-0000n1-VS
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 16:54:40 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-8484f229529so1094150b3a.2
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 13:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783716864; x=1784321664; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Uywufw6tvUASB9x55Dq0IZwzU/8JaTqzxiT122QYyUo=;
 b=NQDprAMqGYaDL+LBWGu4tNeMJQYJ27lxgRID9jRHinzm27aYeHwMaCZHb8EbE+WdRY
 CY05TzFmxrOklF2aBHdtkEJCtNpCcDQbrHD5a/vVmglIacOtVlZ8wuNV1nfTs1QB839R
 i3B/1GEBvYOUQtZ0HO3BmjFKToLHgMT5XQIzJ3ZB6yqU06TtuDf4xfsKJwSXiqapfMIA
 lSRJM1iKFDgqVpES7AEX/6bfQpYbVYAyaayy3DSETnWzB6H4FCbwkAuqOI5S0BvS/xs4
 XOe5mpgDPgwaMND0/y+vbx9IShWYSAEaVtvz72sVf7r6JYWOHHWL06m9EYOFPnB1n8rf
 e8OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783716864; x=1784321664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Uywufw6tvUASB9x55Dq0IZwzU/8JaTqzxiT122QYyUo=;
 b=L5YxejOQwRwMNYigTrlvyMnJM71+qYQ6pFGV2TPBcjmwh2sTV3nouwFuXLpej1JJAl
 3GNnyhQLJMllPKnjz1B6AvlVfphv+Xhr6E07qsggZ2s34kjt0yfqnecodV0Q75SBWCUl
 t1lEOOZmnsBMqODdnZnTISHHp5N8XzNlUPfE1OZIyk3oz6/e3XriYwdMhVq9AvvOulML
 nWBRiO2hdlPKHCzOn9nPdsIgQk2QyfJik9cbxsr+Rd8hywtwVlepZv5BjLzAhnwD2mmq
 RMgVX2y1FiK4QKbY5bsuzq7zmrVdHNHX6ERFPiasIf96JODVexHdkhFODRCqEMCCmkwR
 ybAQ==
X-Gm-Message-State: AOJu0YyF9ixoIhrB9hYJ2Y5dW4IxJN5cpJQccTgEiq4//xlEn6XE7sWa
 ytYaBfGPe7TG9KYb9Hon78qzMC1UadOFVajaCrewE6Xd3fkYJMdqom+iJ6n7ke7v8WI=
X-Gm-Gg: AfdE7cnZ1LsvkLebNhKO2PdGigJq3Fno72j9ry3YPqPfhuW6Q35KjgaFrpAFSPQJwyS
 yNOzJZwJtVxttu8yCnollDnhFcHzTAgf48kpAm+ICsfYBQsa9dBofQm3X6Ud2+aqYI3Ym11hGuw
 AUw0IEwHJ6k7kv/E2ykPCgA5fkFNepfzQgCJ15gTudPDLuGKc9peXdDN/l3K1kAM0GqwD22V3L2
 GSkBLZ1iFH8voIUsF0n8lAzV1LK1quOuuJiD1lUi4/TLZ6uY1R0POb42MNL5tVRanbACsXj1xOY
 Xrbv4XQT3qcvUD/Wzi3gSvTy11sRIinUz/qgs9PdQiY+IB58EhdqscxSG9ZgpEMJUrpmg+9FWNw
 35FLD0Lh6Q3i24LInNUVTueqNuP+DBseLetAHmEkxNSq/BHdV3PjLDxicj/APdfl+uoVLnA70uU
 iCUztN48xaQCF6YXT2qA==
X-Received: by 2002:a05:6a00:22c9:b0:848:5951:ff78 with SMTP id
 d2e1a72fcca58-848897d2bc7mr497196b3a.36.1783716864532; 
 Fri, 10 Jul 2026 13:54:24 -0700 (PDT)
Received: from stoup.. ([71.212.146.49]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847f6d76106sm10780574b3a.40.2026.07.10.13.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 13:54:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com
Subject: [PATCH v3 20/51] system: Remove cpu_watchpoint_insert error return
 path
Date: Fri, 10 Jul 2026 13:53:30 -0700
Message-ID: <20260710205401.836304-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710205401.836304-1-richard.henderson@linaro.org>
References: <20260710205401.836304-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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

Move the validation of the address range to tcg_insert_breakpoint,
which has to deal with gdbstub inputs.  Leave assertions behind
in cpu_watchpoint_insert, but no error return path.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tcg-accel-ops.c | 3 +++
 system/watchpoint.c       | 9 ++-------
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index 644c5b04a2..4dee5ea57f 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -143,6 +143,9 @@ static int tcg_insert_gdbstub_breakpoint(CPUState *cs, GdbBreakpointType type,
     case GDB_WATCHPOINT_WRITE:
     case GDB_WATCHPOINT_READ:
     case GDB_WATCHPOINT_ACCESS:
+        if (len == 0 || addr + (len - 1) < addr) {
+            return -EINVAL;
+        }
         CPU_FOREACH(cpu) {
             err = cpu_watchpoint_insert(cpu, addr, len,
                                         xlat_gdb_type(cpu, type), 0, NULL);
diff --git a/system/watchpoint.c b/system/watchpoint.c
index ed505da403..01cf0f61a8 100644
--- a/system/watchpoint.c
+++ b/system/watchpoint.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "qemu/error-report.h"
 #include "exec/cputlb.h"
 #include "exec/target_page.h"
 #include "exec/breakpoint.h"
@@ -33,12 +32,8 @@ int cpu_watchpoint_insert(CPUState *cpu, vaddr addr, vaddr len,
     vaddr last = addr + len - 1;
     vaddr in_page;
 
-    /* forbid ranges which are empty or run off the end of the address space */
-    if (len == 0 || last < addr) {
-        error_report("tried to set invalid watchpoint at %"
-                     VADDR_PRIx ", len=%" VADDR_PRIu, addr, len);
-        return -EINVAL;
-    }
+    assert(len != 0);
+    assert(last >= addr);
 
     wp = g_new0(CPUWatchpoint, 1);
 
-- 
2.43.0


