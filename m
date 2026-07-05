Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB968C43458
	for <qemu-arm@archiver.kernel.org>; Sun,  5 Jul 2026 04:43:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wgEcC-00051K-IY; Sun, 05 Jul 2026 00:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbs-0004kG-8X
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:40 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wgEbk-00041q-Lb
 for qemu-arm@nongnu.org; Sun, 05 Jul 2026 00:37:39 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2cacb8416a1so13306315ad.1
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2026 21:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783226251; x=1783831051; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aDmvLx7tFb72uym/SedzgMtxN4MKiCwduhbZZrMhn/8=;
 b=rY8iPn6olfLVS01wUWpJKWrHxAjSu4v8XQcW8qmWfWXOKe7Gp+RZqWXyvC2wUc9pjO
 03+IH3Lre8Sm3S5A58mr4YzzKPrhZMdXTXf/WNkjFQXuT3R3LWXX9sAe0W4MUK4JKYNI
 C0M6jdh8PxX7YKwY6LRtefqTX1Lf+Mqt8ifzuO/AfFGJf6g3o0S7SVVb0zmba8rl3V70
 QwNRKKfjXUhTi1xt4PO4ILXN9Y/a1G8H31CbETyiiOi1sfrVtI2o5igfLUIZLilBVITl
 lw8J9ipeJGcJsk2rhu9mze0aqYgUr2Eu7nNGm/FW6OE0H3d4jeJMzPsMpp2cfa0xtOst
 LgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783226251; x=1783831051;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aDmvLx7tFb72uym/SedzgMtxN4MKiCwduhbZZrMhn/8=;
 b=TqL9p7grQc0GWhmdbQuVrTVgjgrZLfO5UY2mqpI/weIrHPaXyyNT5ssKiuyQ9cU+4q
 1u2H+EMVBMWHerNKUqm6LnrW2QuFc0xV6cC2AxDjh+w5lMwHdUbog+MNyXnr+vA4AJ4E
 wThr3qC+FPN0A1yF5Sj/qIRAiSemS23vYPtkumH/fG3EWDOf/h0lnNr9JC6laZ2ePyFI
 OArhpaegpY1xeIfZWxlc9VykWUaMfoDzMVWRYJa49mXpy+kVEH25uAYqXOcJxxsmWlGJ
 eK5PTB9nJucAAi/zI6gxS620LAXP1spBdBE2VGWjFwIvNNeGL9+O1hoEYA6dJie9xWtQ
 VVAQ==
X-Gm-Message-State: AOJu0Yy471INq07mtKGAHreRD2YzVZSb6ghSONgcrBrTKa4Jtdie80Dy
 iWRmv60G+Zh/AqOPnV60Y23ZkC0HEI7crMb/CcVtKkohm8AMh9C/F96O4C5fhiR70ug=
X-Gm-Gg: AfdE7cmDqLZ6eS5t56Us6yuIAX1zd7idRKDfwlMWxxEOtxBpGwwecfyrdbWIjqEg9ES
 KQUlrAKfX96AvEjovXBXYw2JIHmAqo8ImOExoLAmvye+mHUITWS66uHVVLudKLoGPk36L9ybD64
 MWcAA7o3VkPt/gw0GD0ajFYJWYtyIuLDh2J9ZayWDMqzh0DkMBySj6ESdMVW76TNYxBBrMtwmdN
 5/IUHImXnbcojpYlYunCw6lGUXgDqfoH7vbYf4dzlR0cBhweHwdrODrvToPAHhTmLxmwJzeRzyd
 DBy/Yg3t7cFjS0FUf3P5+c4w8MCtsAvlQ5OIV4bpDKJwbjdluT/bPdmCkOCTdlqlvOU36/FRxps
 OjXdcqLDPdbQ+fI//s/WUEWM5+auLL+8+OVVzNag/+XyrXKolaxxSstAcnkVDd6ff4nvC/1+sgc
 1QEpSY7pDJXXOtTNnb6i8oFYWJg5rOr/kb/y0r+CPqFPGYgbg=
X-Received: by 2002:a17:902:db0b:b0:2bf:27b2:4b80 with SMTP id
 d9443c01a7336-2cbb8de936emr47138855ad.14.1783226251158; 
 Sat, 04 Jul 2026 21:37:31 -0700 (PDT)
Received: from stoup.. (71-212-39-188.tukw.qwest.net. [71.212.39.188])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cad712ca17sm29863785ad.28.2026.07.04.21.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2026 21:37:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, philmd@oss.qualcomm.com
Subject: [PATCH v2 05/46] cpu: Move cpu_breakpoint_test out of line
Date: Sat,  4 Jul 2026 21:36:44 -0700
Message-ID: <20260705043725.1373137-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260705043725.1373137-1-richard.henderson@linaro.org>
References: <20260705043725.1373137-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

Move the function to cpu-common.c, with the other breakpoint functions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 17 +----------------
 cpu-common.c          | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 2c58ea5e4c..71ed1f17a4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1143,22 +1143,7 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
 int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, BreakpointFlags flags);
 void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint);
 void cpu_breakpoint_remove_all(CPUState *cpu, BreakpointFlags mask);
-
-/* Return true if PC matches an installed breakpoint.  */
-static inline bool cpu_breakpoint_test(CPUState *cpu, vaddr pc,
-                                       BreakpointFlags mask)
-{
-    CPUBreakpoint *bp;
-
-    if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
-        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-            if (bp->pc == pc && (bp->flags & mask)) {
-                return true;
-            }
-        }
-    }
-    return false;
-}
+bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask);
 
 /**
  * cpu_get_address_space:
diff --git a/cpu-common.c b/cpu-common.c
index bc77835aea..ba2676cbad 100644
--- a/cpu-common.c
+++ b/cpu-common.c
@@ -388,6 +388,21 @@ void process_queued_cpu_work(CPUState *cpu)
     qemu_cond_broadcast(&qemu_work_cond);
 }
 
+/* Return true if PC matches an installed breakpoint.  */
+bool cpu_breakpoint_test(CPUState *cpu, vaddr pc, BreakpointFlags mask)
+{
+    CPUBreakpoint *bp;
+
+    if (unlikely(!QTAILQ_EMPTY(&cpu->breakpoints))) {
+        QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+            if (bp->pc == pc && (bp->flags & mask)) {
+                return true;
+            }
+        }
+    }
+    return false;
+}
+
 /* Add a breakpoint.  */
 int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, BreakpointFlags flags,
                           CPUBreakpoint **breakpoint)
-- 
2.43.0


