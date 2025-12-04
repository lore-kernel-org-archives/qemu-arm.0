Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00632D2A532
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 20:36:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRG3I-0002Tr-4v; Thu, 04 Dec 2025 15:35:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRG3H-0002TI-9f
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 15:35:47 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRG3F-0006Nw-GH
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 15:35:47 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so12852685e9.2
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 12:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764880544; x=1765485344; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ADXnR0TbdNMzWQdMQoPHqGEf2r7+AjyVPKeqyWdpADM=;
 b=OrVC74NYiIhmE3dnhryQzg0JXIaXdRI3gdSwdnCQBLcG3qMTM5VRAFJE48vSC9N+gk
 IYkaatS55oABPdfzc19AzDgA9e81kqNyIW3amg94lWkTM+5dQyvtEZf1AoCPPJdszuRq
 LafSdIf/EpnIEWvRNlkkxGtbXxNFg8OFf/jIwuReM7F9c5uCAHVBpNDvCeH8stqPxCDP
 hdrWsqhEytBCba7UNR62D4BzU2PbatkwYpZxkHWh05OaZStX3iQJI9/H/63/u1nfrOQs
 PXISAl267IrhoIinDAMAMeG+hCoMo+y/Sahnfwd5+M8ar3v+iDwpeBF6oPVGq9lP/ous
 eUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764880544; x=1765485344;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ADXnR0TbdNMzWQdMQoPHqGEf2r7+AjyVPKeqyWdpADM=;
 b=jut492HFu/xXduGIhb25aZYcC7Oatn05unInzqNQLRQHKwcpMbIPqZ3IXksfPFVD38
 awwN/rW0GN02/TaP6Joy38JwDU+Uic7bEZQXx5HdRvjFzOmFdmrgBBLIKujuKHuF2/tY
 P0FwzCDXAtyl96UFF1lFg4uFDBDVGfGqC4doSLcjwpFra1s6tyKjm06L2bg4lMpUUj4u
 f4v1r2cECihCBkR6C2xn3GNrXCzOCZJULsaj84QSGZyYYJ2qHTokPHfwqu+4oRt/HZVf
 9uv+fEaT5av3tV/u5GoxHN8+JFWgXePG5v41ujdt5cUD2aGgMIM7ivZWhvXat9OgmEMf
 0W6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPpYzHrRicODGFy6Erykv8ZAfaC3HciZ1T6bD5x1UYVdxqt2Y+fqQiouQInpaqNApRfjheZPIA0A==@nongnu.org
X-Gm-Message-State: AOJu0Yw/exNgCtlWRgBYn4dkcgK5yQvdQRQ3LYEk3aUzpwmFibZnCZfa
 FZ8EH5xkRSm0EMAoGVVHiZHzU80fMxYY4b5KIftBTRnBviph4BJoFUcpmHa8DFKAc6dtPY+beXc
 13kL0
X-Gm-Gg: ASbGnct3G9OuIRekL6ogDbf9DCmjvyU5X4BzHWc7CkJXwYu0S4i1D+kbDCoqEJZZpoE
 djFLfafkajT7aZE7xe+bhS+GLFLJvftsiule1libCJghy2QGvOUF3oXasFAnlpocF+dMZdOPupo
 xqA0RCt1U5ZezdmoKgNZPnYmyeNp2DGcOQ1K8cMIHhMZ963mbJYOz2pLkwmQMfrEXaFgJ46V2PK
 I6CLotcHrWAS81OLnFbI1o0cHiYsSb2zIVA4nyal5DzY1y8m4EK8WTEujHUiJq/gRNi9jzikhv1
 HeKI/tC8rPyb5VSiLjKlEVaL1Knb7R7spy2p/V0LBtqOHoay09qUqchDrzrPHrRLiZmOobtmshk
 eXS2mn+1uN8MRLHHaldPumAqJ34Eg8xjnGHKmNW5RoUKXUIXoIkMLqBbiyQicIvgfTqyele4kMd
 3HqTWw7AO9TAA=
X-Google-Smtp-Source: AGHT+IEpubWCIp7iEu65iFT7ZYXVrQ/bGONIMjX5RRVsbTOh3QysnqHaoJAO9IFlnVVnxVADCKks8A==
X-Received: by 2002:a05:600c:1d1d:b0:477:abea:9028 with SMTP id
 5b1f17b1804b1-4792f24418bmr44440775e9.6.1764880543664; 
 Thu, 04 Dec 2025 12:35:43 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4792b157783sm51248535e9.5.2025.12.04.12.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 12:35:43 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 46B625F7E9;
 Thu, 04 Dec 2025 20:35:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v3] target/arm: handle unaligned PC during tlb probe
Date: Thu,  4 Dec 2025 20:35:40 +0000
Message-ID: <20251204203540.1381896-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3233
Tested-by: Jessica Clarke <jrtc27@jrtc27.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - don't mess with MemOp for alignment check
  - expand arm_deliver_fault to pick up alignment issues
v3
  - update commit message
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


