Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BDDCAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:20:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3yR0-00020O-VF; Wed, 01 Oct 2025 11:08:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQm-0001gl-LO
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:07:49 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yPZ-0000jK-Dn
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:07:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-46e37d10f3eso58328005e9.0
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331183; x=1759935983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Nc6SQepOSDp1G+psOpOSnrtdkGiVl2Kbj8pqbfBoIpY=;
 b=s5dSnb8UWNtcOThaJUxe3jdEhQvkwpIyoF+vzWr+5Jr3y/VYDcssEVNnjwtanCb71z
 YpkCzeKdZ52lbYNLRUqJWBOo727wrVWCjWrWs7dm4tj52um/Up8kyPahffWTJYyE2WMY
 La99FQ9g2rRYq9NSZthr+BM2DGV37vlPgIk56nwo23RNpaDEwPI6mnZAx7y2f3QKkscu
 qgmP5VVsXcBOBy1hQg+0ug3+aU9nS7aQVbE+Nd6xErjFrm0cFJUfARneOIc+8v8uW9yg
 yCkWT6aBJTjH0yGW3OBTqyUirVTZhQlUnxquxetS/h+s/HcmHw9hCTgrkzuhFqXYxPrV
 BcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331183; x=1759935983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Nc6SQepOSDp1G+psOpOSnrtdkGiVl2Kbj8pqbfBoIpY=;
 b=HqkNoPGPUjUTSZ2ggpj3wLGEdaAuCgtUyB2HwZJQ/NvsAhmtDDT1TOOGiLv5aMqFEP
 EP0t1H3aqt5K4LPEzj+0fUfX3AOZOq+LP1Tlo7QiUpPKLJCNrkXEJ+4Q+3wXJdRoEKGf
 cZHxTyVfymj6pgqDbi2AX1W4VaG6HYTExYN6erwxCU50jKWPI2WI/F6mYWk2kwuCJIvb
 qWeB2m6UIgE0fUifhBxuG6LWQqRImdH2B8a9Mezw87H5jTAOKyLdXazuKZIi+lbGKUKY
 3Oam/wF7UCIYZDbjoZkcgfAOrvJ3sNMbvR/QvZ+gUKKwxgANYmy9A38tdvAOuyBDOJsy
 SkHQ==
X-Gm-Message-State: AOJu0Yz6FKpc3HbNtcJKpwEcl858lp9n7eN34lhmjkXB4Tkxv8cnN9ik
 ++J97sPswhOMdaiZrGay+dWEeZEieQbGcI3N6gEDOlTSDK50BBX3nJ0FV3MFTmbfY9Q=
X-Gm-Gg: ASbGncsVCltAc004yic8yttvdht/gWVHIhpT0dhTBH53UGFDFbUF9T/dl9KP+Hcz996
 tZ/+4dUHHNsH3Zj1CWHQSPKkZ/C7yRgOh4d6qQTqGYO8KYnIxGs8BdlLJ4yaTGZyFnVGAP9kqE4
 mieT74P/hDIoTg4tBdNTtW/Jap62MHRmV0G8pRxFx1/k++Dkuljto3+w4BqtHidfLsDFbXK0dRf
 ejXYqDEQFhOb2qVrjueA/Sbvs65jsNRN1XecBS6ZeNx+sgRFAYEs9GP3y7NH9JYlv/39wr2lkiO
 GJhBunA1+mNeXLPTjNTMccluQPXcj5Ym+L3G9P3grCYtcQhXoImv4r6dOFKP8wnb3HD2Ti9mh2y
 BHQLZTMhjJOInURqhqA9kA82NxeZUQz8rjBUqCxzpvbEfRII7SivuD9NyhDxOSskJ6h0uyVTNbV
 y87Kz1XDlKLxosy64Yy6xK2QKkV05ZK28=
X-Google-Smtp-Source: AGHT+IFGCxjXkYObmgYE3TV0nQAqOaCRAkG/1uUAE+ySA25/F2Ub5rpLDFciJ0EKWdJFqLTENDrzMA==
X-Received: by 2002:a05:600c:83c7:b0:46e:27fb:17f0 with SMTP id
 5b1f17b1804b1-46e612195bcmr33245775e9.9.1759331182898; 
 Wed, 01 Oct 2025 08:06:22 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e619b46acsm42233765e9.20.2025.10.01.08.06.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:06:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 10/22] target/alpha: Get cpu first addr space with
 cpu_get_address_space()
Date: Wed,  1 Oct 2025 17:05:15 +0200
Message-ID: <20251001150529.14122-11-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

In order to remove the convenient CPUState::as field, access
the vcpu first address space using the cpu_get_address_space()
helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/alpha/helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 096eac34458..8819f0b6cb5 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -175,6 +175,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
     target_ulong pt, index;
     int prot = 0;
     int ret = MM_K_ACV;
+    AddressSpace *as;
 
     /* Handle physical accesses.  */
     if (mmu_idx == MMU_PHYS_IDX) {
@@ -211,6 +212,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
 
     /* Interpret the page table exactly like PALcode does.  */
 
+    as = cpu_get_address_space(cs, 0);
     pt = env->ptbr;
 
     /* TODO: rather than using ldq_phys() to read the page table we should
@@ -223,7 +225,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
 
     /* L1 page table read.  */
     index = (addr >> (TARGET_PAGE_BITS + 20)) & 0x3ff;
-    L1pte = ldq_phys(cs->as, pt + index*8);
+    L1pte = ldq_phys(as, pt + index*8);
 
     if (unlikely((L1pte & PTE_VALID) == 0)) {
         ret = MM_K_TNV;
@@ -236,7 +238,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
 
     /* L2 page table read.  */
     index = (addr >> (TARGET_PAGE_BITS + 10)) & 0x3ff;
-    L2pte = ldq_phys(cs->as, pt + index*8);
+    L2pte = ldq_phys(as, pt + index*8);
 
     if (unlikely((L2pte & PTE_VALID) == 0)) {
         ret = MM_K_TNV;
@@ -249,7 +251,7 @@ static int get_physical_address(CPUAlphaState *env, target_ulong addr,
 
     /* L3 page table read.  */
     index = (addr >> TARGET_PAGE_BITS) & 0x3ff;
-    L3pte = ldq_phys(cs->as, pt + index*8);
+    L3pte = ldq_phys(as, pt + index*8);
 
     phys = L3pte >> 32 << TARGET_PAGE_BITS;
     if (unlikely((L3pte & PTE_VALID) == 0)) {
-- 
2.51.0


