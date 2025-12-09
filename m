Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05379D3B7FB
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 09:25:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vStxz-0006mF-Ko; Tue, 09 Dec 2025 04:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vStxx-0006jz-V0
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 04:25:05 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vStxv-0002Hj-FI
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 04:25:05 -0500
Received: by mail-wr1-x444.google.com with SMTP id
 ffacd0b85a97d-42f9ed40b8fso239798f8f.0
 for <qemu-arm@nongnu.org>; Tue, 09 Dec 2025 01:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765272302; x=1765877102; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7RMZHxSEFh1H+EN4/zwFqnLve2WFyXWk67mVJ0UVQEQ=;
 b=RK8JXedGjqVuus8qdHmD7nTUQjiwBXqPj5BvME7mBAmt6Lg5G8y6fcWAkBBkF8Gv+3
 deOwxkU5mpI2aslOeDEh0foGeqc4MamiKhYGs0P0PiohqLbh2LX5XlkFj0TO3wwT7PDJ
 a4kPPTmQN9/ymPPIwXOiREHxezrasrwZDDf8/C5uz+BID7azONM+Ai/JxLYfLYQaiqU6
 j7egNlXdSHt9xc3BMIwWoDap8y+VUKprlh+qQ7ZMg68WnoIIaHIR1AbF8viDiMqrornY
 TqvFqMoTm4z2ZSxYnXNG8On0GgGiT/nnCTXabCInneBCpheXE9ppicrGt08SgIK7PTt5
 1wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765272302; x=1765877102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7RMZHxSEFh1H+EN4/zwFqnLve2WFyXWk67mVJ0UVQEQ=;
 b=vHQ7IITD5yZIMNlsXsejTPghZ0BpDF9tu9peXV7+r6HpB3PHJUaQ1pZUg8o4x/59Tg
 ptYqyKs46CidFwmvGszUFunRqrLBPUKdTlzlTQdGEdfWVlFLbT4Y9iR6xly2qfAFptPO
 5TxvMk7JUy6USy1aeC27Ru9wyHuQN6G78DSU8YFs8MK7C8nYYAKgn2sDmCZwlc0d3sM0
 e6GgcrGwV/a+WBrUzr1M8/AVhjdUQjzt+zf+8L2dUDLOK18scidVv5lOnspvXGdN5fiG
 3O8OQBJcVlVFWhqSVY99QVSUToIejgEp2T1RcArthotr7nIrUiy5LMB44XuxlWfGdPIF
 mvPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUACj8VXmX+02zqplCarIU2ImyQFdGni62IPo5mwtlP5eXi4QPe1aYQepEeNYtUoPb98YaowSyvzw==@nongnu.org
X-Gm-Message-State: AOJu0YzH0bPPUZSy5zJ1JxVtxU1p52YyDIW+TZBBJNMKj4aP5U0jr/Wp
 VYODn9jXlzJiR7A+GaJm1h3yN3Q4neuiBnXpDLv+gUu1JrGUcPdHLv187E7GzP9k50s=
X-Gm-Gg: ASbGnctjJVdNCIlAbIf/gNEVgAg33KbCOVIN94Mx2lySEUHkdbyCmBRFKyXNv03HnES
 4j8V8+KRMb0JgiA8WEbqtAybXXAt9QbYCtIe5A+MfCfLxEtCBhhAOwmlJX5ZR2LwvlQCLKANz7w
 Lg/B2w3wztnU3DZunj1g/icvmPHN10OoZizN8wvlvNlu/pEMkh94nBmYu9TssHr6Kpv//BezBAs
 qjLQWdpSodMI5pik8tLviXjHEWU2a5CXHheMBe2IgO5pBKl9Vlq737R1K4wygvzoBBCaUbNc/b1
 GukYcOGhyWd+TxmQzuMuW233hrs5gcAF4atGl47wud483z3bRafQ9lG79eVRi0VnNpAPhszuLPy
 3cNAgPyb0xrL5//d9sO57PavewvRtKNAI9YUu9bwEZY2ho4Ik9Ng2BNxKwyyKtw11i6IMTkR+Xi
 QU0GsjbmC3Sfo=
X-Google-Smtp-Source: AGHT+IG7Y9B2K+FlMc1KuDQmJ2LGmOiz/9npsbYAthUvLaA+C4MSJePu0Ze9MziNaXgCNNTPgeDDSg==
X-Received: by 2002:a05:6000:613:b0:429:dde3:659d with SMTP id
 ffacd0b85a97d-42f89f563femr10728348f8f.47.1765272301857; 
 Tue, 09 Dec 2025 01:25:01 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d353f8bsm30858331f8f.43.2025.12.09.01.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 01:25:00 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id CFFA95F898;
 Tue, 09 Dec 2025 09:24:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mads Ynddal <mads@ynddal.dk>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 4/4] target/arm: handle unaligned PC during tlb probe
Date: Tue,  9 Dec 2025 09:24:59 +0000
Message-ID: <20251209092459.1058313-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209092459.1058313-1-alex.bennee@linaro.org>
References: <20251209092459.1058313-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
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

PC alignment faults have priority over instruction aborts and we have
code to deal with this in the translation front-ends. However during
tb_lookup we can see a potentially faulting probe which doesn't get a
MemOp set. If the page isn't available this results in
EC_INSNABORT (0x20) instead of EC_PCALIGNMENT (0x22).

As there is no easy way to set the appropriate MemOp in the
instruction fetch probe path lets just detect it in
arm_cpu_tlb_fill_align() ahead of the main alignment check. We also
teach arm_deliver_fault to deliver the right syndrome for
MMU_INST_FETCH alignment issues.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/3233
Tested-by: Jessica Clarke <jrtc27@jrtc27.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20251204203540.1381896-1-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - Fixes -> Resolves
---
 target/arm/tcg/tlb_helper.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index f1983a5732e..5c689d3b69f 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -250,7 +250,11 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
     fsr = compute_fsr_fsc(env, fi, target_el, mmu_idx, &fsc);
 
     if (access_type == MMU_INST_FETCH) {
-        syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
+        if (fi->type == ARMFault_Alignment) {
+            syn = syn_pcalignment();
+        } else {
+            syn = syn_insn_abort(same_el, fi->ea, fi->s1ptw, fsc);
+        }
         exc = EXCP_PREFETCH_ABORT;
     } else {
         bool gcs = regime_is_gcs(core_to_arm_mmu_idx(env, mmu_idx));
@@ -346,11 +350,18 @@ bool arm_cpu_tlb_fill_align(CPUState *cs, CPUTLBEntryFull *out, vaddr address,
     }
 
     /*
-     * Per R_XCHFJ, alignment fault not due to memory type has
-     * highest precedence.  Otherwise, walk the page table and
-     * and collect the page description.
+     * PC alignment faults should be dealt with at translation time
+     * but we also need to catch them while being probed.
+     *
+     * Then per R_XCHFJ, alignment fault not due to memory type take
+     * precedence. Otherwise, walk the page table and and collect the
+     * page description.
+     *
      */
-    if (address & ((1 << memop_alignment_bits(memop)) - 1)) {
+    if (access_type == MMU_INST_FETCH && !cpu->env.thumb &&
+        (address & 3)) {
+        fi->type = ARMFault_Alignment;
+    } else if (address & ((1 << memop_alignment_bits(memop)) - 1)) {
         fi->type = ARMFault_Alignment;
     } else if (!get_phys_addr(&cpu->env, address, access_type, memop,
                               core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-- 
2.47.3


