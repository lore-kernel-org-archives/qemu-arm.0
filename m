Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D658D2A532
	for <qemu-arm@archiver.kernel.org>; Thu,  4 Dec 2025 20:31:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vRFyZ-0000kN-8D; Thu, 04 Dec 2025 15:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRFyX-0000jP-Ab
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 15:30:53 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vRFyV-0004dd-90
 for qemu-arm@nongnu.org; Thu, 04 Dec 2025 15:30:52 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so16500185e9.2
 for <qemu-arm@nongnu.org>; Thu, 04 Dec 2025 12:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764880249; x=1765485049; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3BqwSOzW1wtwIWsV9h67dzQ80+RnxXRVz74+RBt7IdY=;
 b=ao53uJxIZ5EXBKFpcyllfoi2/vUi7GZwJucn0bGnLB1MJ45hWTIYkZRIzERr0gMSuX
 1gCvlAj/ppN4LPBp58LyYFNVLVQJHb5uaaq5L6C1/PWMBAzPuy/V0cl7uHDKLLSK1oY3
 D6y9KOTaPmjbaeueGvXwfd1Ln0DH51fWGKdocCd/BkERoNcFcg91V6THShoVicsDJBN6
 tNJB5lVsmWuINDbheKIwyb9+rSTZWC9aOGnc+JDRj8+ZzrhUQSZ90oGsPt2r1JzTYGXu
 JGWB/YzzRMJLAPIvzX/ZZPFPXLQdWDoEGHWc4nwQqxSr8QbVRisxDGIpEjMZ4kNR+U4J
 sRIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764880249; x=1765485049;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3BqwSOzW1wtwIWsV9h67dzQ80+RnxXRVz74+RBt7IdY=;
 b=s9Dme5vVFxKRzvBBq7OICCDSVjUz7CgRH56YHL5YPtCs+4DgHX81SsQcoJ7kThdgaD
 3o4ysJge73FBS4ashVh6yRhiC4bm94tn9EhcKSXFqEJqP1qUpVZ+YWSlaJbfKIP0jX5u
 JzPkUxGImn/YgqyV8+LweufiVEPURZlS97v27e77Lfkz/vNPdo3e47boYknlWxlZkTFd
 eGfW89Q54TYn8rdBaBjFAmfNFMlGwfs+1pmLuaD/wnRKdyVAw3qd/WHy1p7d/FcZwqlZ
 q7TIrvKb1yRhDXz03V+ocQ2k/DI6mhgfaFYj8q9WXEZ7WiJwjb/FeEYq06+k65yo3Gmp
 3zQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVknAmVJWCG/pHM/5dXgD7zaIPpzZ/iqhrXDD74UruegA9ulJvAeobqAqRrS5LeFk43g0ZSf83RvA==@nongnu.org
X-Gm-Message-State: AOJu0YxgIiwcOr6xbva2MGp9eVOow5gaqnZqeH6oEqNqKUdYijQvIotO
 itmo9cSWt+1y10IPADPk9qsBANQf2cDTAXaiVxHUFVweC6wp4LBavN8xIttwVXqMmmE=
X-Gm-Gg: ASbGncuHqnkzVHSuk4UzmfyTGZsaiQ0VTMqWfkChMBk7pBijTCSPnbE/ST1GK353m3m
 dsc6uNiKOXVkaBYi+iCVS88gD+GofZFvmHd/x84fusZGy7DzBxW6Z7G2h2LWkYq6WvakbLkcQ0v
 28OBQ3kSIXMcnsb2qmOa8tY07DHY0VtZ8yNttsBXfCAvPThpTBCxStT10mLvcTWpfAwJocraqds
 a29zbjRc50uXo3s3SMD+HxS8SwPM8Eyv7PY3wJANw4jB7aMUKhfFCN6Mp51/FrTfzOxOtcINsJJ
 geMRP5cq8n9FWvle8nkLhe4tPuO40ZM2lGtU6K4vRQ0cfA9d+PlIOaCciReZkYvyMyC8oul9PQG
 i82igvDvKyPxdXiNlRRASpagMQKTxsocFPVTrFqnd7iFT2AlZYu1YmMapXkyBAE48Vxf0Axwgdc
 YlXpRMQXKmGmE=
X-Google-Smtp-Source: AGHT+IHXoEibkOrAjxxeMOd9PWIvyqsmYClUs3crg7XW64xGtrubNjrROS285RE5GsxCyAhdRGCEOQ==
X-Received: by 2002:a05:600c:c494:b0:477:a36f:1a57 with SMTP id
 5b1f17b1804b1-4792f244c93mr38919935e9.3.1764880249502; 
 Thu, 04 Dec 2025 12:30:49 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47930c747b8sm48983665e9.9.2025.12.04.12.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Dec 2025 12:30:48 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 045165F7E9;
 Thu, 04 Dec 2025 20:30:48 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jessica Clarke <jrtc27@jrtc27.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v2] target/arm: handle unaligned PC during tlb probe
Date: Thu,  4 Dec 2025 20:30:38 +0000
Message-ID: <20251204203039.1377662-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
arm_cpu_tlb_fill_align() and set memop appropriately.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/3233
Tested-by: Jessica Clarke <jrtc27@jrtc27.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - don't mess with MemOp for alignment check
  - expand arm_deliver_fault to pick up alignment issues
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


