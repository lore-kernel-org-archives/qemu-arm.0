Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1542616lfg;
        Fri, 2 Apr 2021 09:21:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9Xj4rc8GBKMDpZeNIWaZWMc3foXxm95fLe6SwkdY/UlPr4wh/4+O27KC86hfMYZLBZrZR
X-Received: by 2002:a02:77ca:: with SMTP id g193mr13527892jac.41.1617380474658;
        Fri, 02 Apr 2021 09:21:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617380474; cv=none;
        d=google.com; s=arc-20160816;
        b=b7pzhL/4EbRYiPufwy8I22uKth9a08yZzbVqiBJZHWRCbsdfNjSRWvelrtLXHpvU1W
         cTJS0YM4dkmDuGMv860L3J1lBhbJMNPWMyfIpOiuS9XYSzOUjP8FnWzGcGTwiuzsNW/7
         ycw3o38NNR+JIiv99aq352lsxrpZ5YJQZPjcqUmlF6YaLS6S9p5O+4NI7ltL8946Yv69
         5UFzKh1BTC0Sz28MgigvohosIz/SwNYOLHzUxFIGnNgUibnJR9EBJy5rvlY2isHwm5gH
         asZ5sMsGH32mQCi6BYrgWckY1mbLHgS3BGhyhm9bTjM40/EOkB+/EfROBTpuIVAobeMG
         SnoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
        b=ec6TfEAX/Mo+UZqhfQHA3DKVhCgxLktx9VUM7fzGbkglWoH0TKzAi4yrYUGxcsCNzJ
         hqOUC7W8I1qr8DhEJjD6QM6BagVI4MeQ46MA0Jb1sDr+7/tAHZTxI6SY+CI2j9Cbgv5M
         EKazh7vFwaS6yU0FW4yRJ7Dhpya8codnBMgT61VQ95hMAOQAWPl3Sf9k+BuVIUMljG+o
         PMkBVfyNVb1S16JB7RpDVIf7SSYCXHyEG+FWN/MGcTC8LyZUXTE9XzhkiRd8RtyFPNf6
         hsI1OmNTuKwQHlbyoBFOn/VTDGcgu/gKc/IoCYcxHLuAHhoQ/tOrLSk9Xk845V+L7UuN
         lVCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l9y2N/FQ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15si8235277ilu.143.2021.04.02.09.21.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 09:21:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="l9y2N/FQ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSMXp-0002vT-W6
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 12:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVQ-0000vC-CY
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:18:44 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:34348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSMVN-00035N-1Q
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 12:18:44 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so6368396pjb.1
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=l9y2N/FQMRgq1j+ah+xdquCl5SSxrHBiED0OUHza/FscU/Lp7cdzoLyMh73W+tzlDx
 mjD9L/l8cxDVuZiTEDoHux51ozT6oCdK8M4UZZVG8/GfQkteGDmfxDtIGfTh0s//Xj5e
 sEJBi8VJ1rbtBg3NkAM/yLYb74i2s5m0ZAaT7a/1PU1V/5Oscu1N2bTSHkobcvdUt2GZ
 VWU+fWQmtAwTXtvWTId2zfXPTJfivQNQsmppzqCAs5o0vKGgxhXtZSKui4AMVVCwVMOb
 +kSmlnGVLvoD0CWWo52c9ZuPhfV3W5qtlt9Dpkf3kUIN54ZqxZvwHLIHxONubLH5A+Xk
 tZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=k4WbTCaEGxo0n/P6R7kFsQXMY+XMwrnt9lTg6qOZEymRctDJVdBWIITh3n9gfli41c
 PCTcV3zkjKOswrLewMCloAk6HHAl4LoMr5dV+VwaClGEuQauVaDR+2ze+wlnvmdMNSAJ
 xWy1koCTpBXFlW+BX6TVSCJrH19xZHfy0unVegvvX8z8ABCZtZOdGl8ofm1KvB6gXX6S
 qZY5bWoML6M36i8K5ePXH1e4cqEjderYX9adHifjaB0G93+PKpTG6wxEXE/EmF7oB0tX
 kE3faCS6IEvJ264WocflqoGZYDlfGLQURmCQwpMMEoeQGk96BWcRZigiGh8Tr3RLZnQa
 wNwQ==
X-Gm-Message-State: AOAM5305BiUxXP/EYcE8+SebeTfOwIHmQVRUqz0zO+JT1gblZh6A6trq
 RhoaARxvSbl6o5SMXbl+exwtxhwBZ5Lghg==
X-Received: by 2002:a17:90a:5910:: with SMTP id
 k16mr14965471pji.207.1617380318663; 
 Fri, 02 Apr 2021 09:18:38 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id m7sm8821761pjc.54.2021.04.02.09.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 09:18:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] target/arm: Check PAGE_WRITE_ORG for MTE writeability
Date: Fri,  2 Apr 2021 09:18:33 -0700
Message-Id: <20210402161835.286665-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402161835.286665-1-richard.henderson@linaro.org>
References: <20210402161835.286665-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9CCg3+Qoo6wh

We can remove PAGE_WRITE when (internally) marking a page
read-only because it contains translated code.

This can be triggered by tests/tcg/aarch64/bti-2, after
having serviced SIGILL trampolines on the stack.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mte_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/mte_helper.c b/target/arm/mte_helper.c
index 0bbb9ec346..8be17e1b70 100644
--- a/target/arm/mte_helper.c
+++ b/target/arm/mte_helper.c
@@ -83,7 +83,7 @@ static uint8_t *allocation_tag_mem(CPUARMState *env, int ptr_mmu_idx,
     uint8_t *tags;
     uintptr_t index;
 
-    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE : PAGE_READ))) {
+    if (!(flags & (ptr_access == MMU_DATA_STORE ? PAGE_WRITE_ORG : PAGE_READ))) {
         /* SIGSEGV */
         arm_cpu_tlb_fill(env_cpu(env), ptr, ptr_size, ptr_access,
                          ptr_mmu_idx, false, ra);
-- 
2.25.1

