Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068B2C5CFC1
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 20:39:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvL8f-0008Ad-6I; Sat, 15 Aug 2026 16:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-000888-Tn
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:55 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8T-0008Fr-2z
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:47 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-38e08baf860so2217144a91.2
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826264; x=1787431064; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xpi+58NLvsNGE5roXXmz2yeQ2sLTmSOVbtvh5q+nBos=;
 b=jgoCNRYvKoHMjLVl8EppgSe84GSLFa/GaWoqDpsZwZClgDBCPZ8BeUANhq6wJkUyo1
 qJ/7B9pJgUKOI0fzIlCYCaLJST85qbtE+Arf8MA1hzQmW3XPWu7+vFkMBkVwaxWkmX6D
 qg8Zvu+PvjC0NNkAowvl5PwVDNMrLXVpZu8U8Mav1PiU804MHxcE1Vq5JmVEBqg3a9hw
 g1IBJzwv1YHXjjRRWL7pjKRmNqNpEnByY/Y8swNwL2l21gyd61StJcF2E2aGvyCQ8Rjn
 Y9JG0aZS0lNNue4yssU2ghgir0TpZ3wb8EZ2V08RKiRFxaQGeVMN0ytefb/GEZH67Ea+
 Wlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826264; x=1787431064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xpi+58NLvsNGE5roXXmz2yeQ2sLTmSOVbtvh5q+nBos=;
 b=k3bgk03ZmWwpbx5kYXVjT7T+g21KpEohQ8s6nb3IuOBzwFEcsj2yGGpuMdbNnj/FcG
 H3DgyaVdz7WeKlVG3G+61B8ZuHVxCj/lI/DeHy5/33Sgm+0yGjCmLgXxAAng0XQMtjJt
 VrXXU7K9T6SX/1cq61+it3EIsqrGz3jXVfk9nNoY2niREUbbZ7xzj9l+pWFk0BPnKlZv
 ZK8aCyDP4/gMn/XujveDBONYZcIjA4Zi3vz/a28CKDze8Ksms5VIAGz5D/rv6B9iErUx
 6r7oOfKwFIjitOOOxo2UinSvJ4YRlSrL9GoV/LPX7xvfghGl7/iI3mfeRKprtBhmM1LC
 opFQ==
X-Gm-Message-State: AOJu0YyKRdUVEEa8UhTZcoJGACL+ouMR8oSj3jmv2tUk95Yw90RcMX1p
 veA5/KtGXTmdbnopteHb3Gu1eVuYHcTK0vWbha/DIhtUp45nTAF4qi9yKs+t17aPQCevCr/CKq6
 +42aN
X-Gm-Gg: AR+sD13+tUop+aKDjCu93yftwiHeb07LsRQ0dFOv0hPQC2Sx2Vpa7EvBchvISqsqVAL
 hSPy+5La30XLvtg3YxbLZZ7Hmc/FPhx98C0006B6t4ic/q4LysoCJczcm4VxB+/wdS5SOtjS0Xe
 4ESgI+toeI29Kd7usH7lpGViaeQAsRcP7NVetH1dvLe4gzfhlWqRLzqZXUXv7osq6co3pMBA8Ro
 aMXXGblLQXy17QHeX5XaZgJ3YUQoDcTUCDWtQRcWABJigQR0Fal6BsfWXJtGsMEBZ6llUomhza2
 qGd6r6rlvFo15NdbghYu+DGdoBfApEoIt8/CF41EDOx3EhY2h/aiU6MXm3yXY+Qey/lnZd3TgZ/
 X67B0eRyRk3AJHXhxeysH3txeMlebGZu8nY+p5XTHhtoTa+SIMRQYBDmr+akf5JnRpbhHifycjU
 44mhimY/c6Hs3EUEZ5/60ZJRAKn6DlZjOrwoScbhZbmMux9ab+GBXIpHCSCWOgrBfzm5YGhaPTb
 m3BHWruIUwvYxcjvDYq
X-Received: by 2002:a17:90b:53cf:b0:381:1c96:829b with SMTP id
 98e67ed59e1d1-3933bd204d0mr16889988a91.3.1786826263584; 
 Sat, 15 Aug 2026 13:37:43 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 06/18] accel/tcg: Drop fault_size from user-only
 probe_access_internal
Date: Sat, 15 Aug 2026 13:37:18 -0700
Message-ID: <20260815203730.1468365-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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

This argument is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/user-exec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index a35aca7889..3724e5d98e 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -749,7 +749,7 @@ int page_unprotect(CPUState *cpu, tb_page_addr_t address, uintptr_t pc)
 }
 
 static int probe_access_internal(CPUArchState *env, vaddr addr,
-                                 int fault_size, MMUAccessType access_type,
+                                 MMUAccessType access_type,
                                  bool nonfault, uintptr_t ra)
 {
     int acc_flag;
@@ -797,7 +797,7 @@ int probe_access_flags(CPUArchState *env, vaddr addr, int size,
     int flags;
 
     g_assert(-(addr | TARGET_PAGE_MASK) >= size);
-    flags = probe_access_internal(env, addr, size, access_type, nonfault, ra);
+    flags = probe_access_internal(env, addr, access_type, nonfault, ra);
     *phost = (flags & TLB_INVALID_MASK) ? NULL : g2h_vaddr(env_cpu(env), addr);
     return flags;
 }
@@ -808,7 +808,7 @@ void *probe_access(CPUArchState *env, vaddr addr, int size,
     int flags;
 
     g_assert(-(addr | TARGET_PAGE_MASK) >= size);
-    flags = probe_access_internal(env, addr, size, access_type, false, ra);
+    flags = probe_access_internal(env, addr, access_type, false, ra);
     g_assert((flags & ~TLB_FORCE_SLOW) == 0);
 
     return size ? g2h_vaddr(env_cpu(env), addr) : NULL;
@@ -825,7 +825,7 @@ tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, vaddr addr,
 {
     int flags;
 
-    flags = probe_access_internal(env, addr, 1, MMU_INST_FETCH, false, 0);
+    flags = probe_access_internal(env, addr, MMU_INST_FETCH, false, 0);
     g_assert(flags == 0);
 
     *hostp = g2h_untagged_vaddr(addr);
-- 
2.43.0


