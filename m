Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A19C5DF74
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 20:40:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvL8l-0008IV-0U; Sat, 15 Aug 2026 16:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8h-0008Dv-5Q
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:59 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wvL8c-0008Ia-Gb
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 16:37:58 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-2cf452def93so25334435ad.1
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786826267; x=1787431067; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qu9I9gYRpkRKcID2nB2noN8+9kKxwJxKEmAKtZFUHmw=;
 b=EjDb1tj9zvVUGif3IKDwtpBQhM7He/hNsJZ15qLP1/Qr3kG5K2YR2Z9LgfxxmfNnWn
 R+R4TajeXLLYdkH0q+M+g/jpekHOyubILQl7E+WSrxjz6ooKomhluujxNZyNR8leXp0I
 XBIs197btzYt0B/xQhpd+QTevrxhkNZoV9IEyTQr44+p56fvGUyq5ajwid6sNMaLMmr5
 6XEB1gFzlTHhF6+3urTOi8WuVEyKL3Keq0Qo5fH8xtGhovZknQTxQqnbVHPHDlrSQKsl
 eFaDv3AcE+BEIRrcLVbk/fvhZzszipUAL/spw780pLtMVEuZexbGwW10sX48e9YNkB8v
 Bx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786826267; x=1787431067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qu9I9gYRpkRKcID2nB2noN8+9kKxwJxKEmAKtZFUHmw=;
 b=SZgQvWk6QQQyRs6mazWp3fMuqKhT2rcyZtafm+cjP1Ko1Db4Sk/qGEWui/eVIsYIVm
 gI2B1moPeEdsRw6wXC1U7Pd954cr9n4/tiITKnVNYDcvbDIFSF+prVxCNssmrRWnghkq
 px4Ye/a8yp0t3qwM0+RKm+0vueaKeX4s/mqeeizKITpThks0RureYF41mQojX7GLuY5W
 Rb21LOn2CmoYOuZ1L1fSiFiW/olOY+2tqFx0vDVr+AY4sofCc68MhQtZFgzLozJWmAtq
 l5gniyEozHIdeB1vW81KoDKOkliqpMIc3gXW9u7hAqvORvqdmfGhmN0qtMTFdpNAkmgF
 waXA==
X-Gm-Message-State: AOJu0Yx7P7X7jnnfVzTO/lYMfD9xledq6rfuLteubezTBZ21Nk0xY2/F
 Q6xIkHZJODYrj5THxWnCdz0pqKbq05b+s3lMZS8G4m1DWStUatlj6XpvkOiKuMjVmVg=
X-Gm-Gg: AR+sD11CVTSqSo0abgrCc/WSB2ezBxsmGsG6XjyT9LxEZqoMv3v6ZdHrJErd+YFzADw
 iS6djFaED3tKfXBoxKOiuW/qF2dsDSpml8dyEouB36nE07HR4kOreJ6ZBXBsTHYAVZIHt+8/9Ff
 QcHsqWzYQV/NOoLbMg9kCT13ud46N4N4QNy7nkx66h4u9GZxdRGPu6TqujNnBRrGOnQ+gaGW86R
 vc9WhIr955dwZTZJzwn1gKY/6oV7xdt98pBALiEy8PEjOUIU7HbOwi/ffnv8YWdLB9HuGnjLZxC
 4rPeJJ7v5kQAnMPOVO+Iv6xnXFy+D3HcJV/+gaU5i7dySDU2Bi42GIrtO7bQeysTaw5nLFwjSGd
 H8M7GnDtNMwIisw95lEfDIVxjFx/D8FPRJbhF2Ie3jEJVm8+FVqm/TL8wireDfgXNC1f2AiWyOj
 nQ1Rz/u9Q5AKCBycWpjMSmNfnTwSdsV8YsuCkyBoZDmUtnhnsckhnQ9XY6utbs9c9LMAIdBJv53
 r8mTnypVS5JS2YXngDA
X-Received: by 2002:a17:90b:574d:b0:38e:5828:a446 with SMTP id
 98e67ed59e1d1-3933b1091eemr11924186a91.19.1786826266554; 
 Sat, 15 Aug 2026 13:37:46 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-394ea97207fsm7066853a91.1.2026.08.15.13.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2026 13:37:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 09/18] accel/tcg: Allow phost to be NULL in
 probe_access_flags
Date: Sat, 15 Aug 2026 13:37:21 -0700
Message-ID: <20260815203730.1468365-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815203730.1468365-1-richard.henderson@linaro.org>
References: <20260815203730.1468365-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01 autolearn=ham autolearn_force=no
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

Do not require the caller to create a dummy variable.
The one instance so far is riscv check_zicbom_access.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/accel/tcg/probe.h    | 3 ++-
 accel/tcg/cputlb.c           | 4 +++-
 accel/tcg/user-exec.c        | 5 ++++-
 target/riscv/tcg/op_helper.c | 3 +--
 4 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/include/accel/tcg/probe.h b/include/accel/tcg/probe.h
index 06faf1269d..477320c88d 100644
--- a/include/accel/tcg/probe.h
+++ b/include/accel/tcg/probe.h
@@ -68,7 +68,8 @@ static inline void *probe_read(CPUArchState *env, vaddr addr, int size,
  *   - if @nonfault is false, raise an exception at @addr
  *   - otherwise return TLB_INVALID_MASK.
  *
- * Otherwise, return the TLB_FLAGS_MASK for the page, and set @phost:
+ * Otherwise, return the TLB_FLAGS_MASK for the page,
+ * and, if @phost is not NULL, set @phost:
  *   - host address for @addr, if direct host accesses are allowed,
  *   - otherwise NULL.
  *
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index a192c50e90..c2ea31a397 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1465,6 +1465,7 @@ int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
                        bool nonfault, void **phost, uintptr_t retaddr)
 {
     CPUTLBEntryFull *full;
+    void *discard_host;
     int flags;
 
     assert(first <= addr);
@@ -1473,7 +1474,8 @@ int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
 
     flags = probe_access_internal(env_cpu(env), addr, last - addr + 1,
                                   access_type, mmu_idx, nonfault,
-                                  phost, &full, retaddr, true);
+                                  phost ? phost : &discard_host,
+                                  &full, retaddr, true);
 
     /* Handle clean RAM pages. */
     if (unlikely(flags & TLB_NOTDIRTY)) {
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 44e9f7fa1a..3578282a3d 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -801,7 +801,10 @@ int probe_access_flags(CPUArchState *env, vaddr addr, vaddr first, vaddr last,
     assert(((first ^ last) & TARGET_PAGE_MASK) == 0);
 
     flags = probe_access_internal(env, addr, access_type, nonfault, ra);
-    *phost = (flags & TLB_INVALID_MASK) ? NULL : g2h_vaddr(env_cpu(env), addr);
+    if (phost) {
+        *phost = (flags & TLB_INVALID_MASK ? NULL
+                  : g2h_vaddr(env_cpu(env), addr));
+    }
     return flags;
 }
 
diff --git a/target/riscv/tcg/op_helper.c b/target/riscv/tcg/op_helper.c
index b18bf683f4..9c0cfd35fc 100644
--- a/target/riscv/tcg/op_helper.c
+++ b/target/riscv/tcg/op_helper.c
@@ -232,7 +232,6 @@ static void check_zicbom_access(CPURISCVState *env,
     RISCVCPU *cpu = env_archcpu(env);
     int mmu_idx = riscv_env_mmu_index(env, false);
     uint16_t cbomlen = cpu->cfg.cbom_blocksize;
-    void *phost;
     int ret;
 
     /* Mask off low-bits to align-down to the cache-block. */
@@ -251,7 +250,7 @@ static void check_zicbom_access(CPURISCVState *env,
      * permitted to access the cache block is UNSPECIFIED."
      */
     ret = probe_access_flags(env, address, address, address + cbomlen - 1,
-                             MMU_DATA_LOAD, mmu_idx, true, &phost, ra);
+                             MMU_DATA_LOAD, mmu_idx, true, NULL, ra);
     if (ret != TLB_INVALID_MASK) {
         /* Success: readable */
         return;
-- 
2.43.0


