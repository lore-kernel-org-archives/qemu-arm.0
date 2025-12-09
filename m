Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B625D3B7FF
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Dec 2025 16:30:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vT0Zy-00066I-52; Tue, 09 Dec 2025 11:28:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vT0Zt-00064S-6k
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 11:28:41 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vT0Zn-0001rE-4b
 for qemu-arm@nongnu.org; Tue, 09 Dec 2025 11:28:38 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42e2d5e119fso2469525f8f.2
 for <qemu-arm@nongnu.org>; Tue, 09 Dec 2025 08:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765297713; x=1765902513; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=orxGf9vqJHAjjzl/pLsxIBSrWtr0DnP/NmbqdtgUE7o=;
 b=i12Ooo7HiwEvUbBevwS05vbspaMdzDWMNOEXsO+LF58RdyYAPgp/nif/N3/XB9AW8F
 dFh3JPREtTyj8hnPOeqXXfyDPIdIBiINqD3E2Pq2FnKEbFPmlhAeK+NGvpYASEMgX7oZ
 xJn8wrOFL4Tx1F8iC2gdjbqS+Ea2+Ae7H0OHl72IAG4vzfj0fj/m1SZMMhIR9JNe2Z01
 gr9M8pZ5zwxzwMB3WGpWINJTCVsS/SdBDPRbhrH3ir7fOITNtKEVmhGhk0gt9o9ABw2k
 TTYzTjqxJ75yF97a63NxrhQOdONHrfevoMNEJ/XDFYQKtFkReJjlI0d/PzF29bba+cTz
 8m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765297713; x=1765902513;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=orxGf9vqJHAjjzl/pLsxIBSrWtr0DnP/NmbqdtgUE7o=;
 b=VhxYWuF575s23uMqpWiIjE0wfBCBCuWCiTwnecnbqgjH41zlur4LbfmL6o6ECAcZL2
 74SWsHmIf7vx1sJmgm8S8d6ZWy6+OhEeogATykNv6aeieoMOjwXyme6NWxxqEs9GKPd9
 a9hg1iuwQHPNO0M35h7VXB+z/9hYHjZiAys9GqsNP1kh3dXrdmLNGArqrdMFntMZhkFM
 RWZeRu1DiKFt+RNmzkQwmP5Xm582ZYpQBr+gjfQPmyS2bEB3u5T1c05npJqQtto/cVvc
 zRMNscoHFARV0JJJ+7+4vPRuKofir4sFdu3G8nTVuKYhYLVlGXC4zNDl2N3GA6Jf8dOP
 6KuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXupbpfNVYgbVOlyiiJujt2yBHsqBEE3ThQdHSa23kkcqwjVP5p//QuP4nfEk6KWMi39RSJcYa92w==@nongnu.org
X-Gm-Message-State: AOJu0YxarMYlLkNBLYa+cC8sxyDkNABju8phoaAOTALoSXYkee/Vqp5F
 e21FDRLfEtxIfW4bRSkWXeRtu4EJOWMJvBk9HgFCSoDP2LnWgWwn0I/NUve4akQKNSI=
X-Gm-Gg: AY/fxX7pilwpjt2JwNNYc2Gya1ZqGJEt1c2FjQfBNecEa0M1q/RcK3XYOG5+NpR6fWh
 8kC0EwfwUSF7VLzp5/c8hmtT5yXaQAJa41JSFSf0pl8ShsIn1Oh6dLfDcDdbnoliWZ3ue2QCatU
 Lsa1s2G+s2gZgfQ1SIXnMmy3p+c8burAie15efKveAUEr2JTOtRMAvwAOar8ThI8lpRe3nm54pS
 ehoe5fA09R//wYEFK9Pyzz4vkBejB3eH80QqR1iu7hMPh90lU+n4Ur2KRFuwgGhERT78zqwB/w9
 usAJnzOAYV0aqN/QBBaHuPBtv24iu83ivC3gTd3meUdhhzPEtzqrh/FnDVZnjUZPDgmmnC7twv5
 qAaZGDRMxmbXLa4S53+fn+Um5LTcw7TUp/N9uVFR0RvV+v6Juw1G47i0Ho3PXfsNTrDrby6qfje
 pB7Josn728K14=
X-Google-Smtp-Source: AGHT+IFpeqFSFRZ+WdAMqTiKKsbd5C9blRgmZwm8adPxB8bexth6KqJm6E56vYwfVEWPjB2fY7W9Pg==
X-Received: by 2002:a05:6000:40cb:b0:427:8c85:a4ac with SMTP id
 ffacd0b85a97d-42f89f54bdbmr12554927f8f.47.1765297713459; 
 Tue, 09 Dec 2025 08:28:33 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe90f0sm32753005f8f.9.2025.12.09.08.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Dec 2025 08:28:31 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 2A11F5F898;
 Tue, 09 Dec 2025 16:28:30 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PULL 4/4] target/arm: handle unaligned PC during tlb probe
Date: Tue,  9 Dec 2025 16:28:29 +0000
Message-ID: <20251209162829.1328559-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209162829.1328559-1-alex.bennee@linaro.org>
References: <20251209162829.1328559-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-ID: <20251209092459.1058313-5-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

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


