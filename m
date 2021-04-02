Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1129347lfg;
        Thu, 1 Apr 2021 22:38:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbh1UCE3Ka2rQn3GNejGmlD3AJmZcI/0g0kL9Nd2uNYhIzbHG/16+a+aOduzXZMbtCPuJC
X-Received: by 2002:a25:a325:: with SMTP id d34mr2586096ybi.408.1617341936071;
        Thu, 01 Apr 2021 22:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617341936; cv=none;
        d=google.com; s=arc-20160816;
        b=uqhrf7xjnI9l1XQns0LqrBdcytCtpASoBeSzprMd4Gei1LdZaO4/YlD6cNWTc44SgB
         5MCc9SO1RBqoBWbBhmYolviHSVhBPGnWl8vaf4l3dw0jOfQ+YCHBQm3J1VFPnIt8OXaK
         suzpotjvx7wN6NiAO5vaiPnjx8jVrGj5F4Ak3TABGr5MamS1Bx9/FapYfk/Yz4qufs9o
         o3ynq7fNoO4FlsMerKRb2UaBpzuX+v9JUULQCpIX9T2T7yFjSO0DUp9glVw2q03rl2yP
         QLXYlpCx1yWcnFU4U5xsbZcWb+UaosxWN0wqpZR22czUk0hbd+EGfibNVK4eP8/ja4uk
         5eVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
        b=cIAVJoMcEydpJXedHeHvZiFzYezgGjBPkguYW+HNX5KHQiB0ShMOhnL2lFZi3UzeNB
         bJL00/sTeL8kX/PEW+sWk9b1ptIRYRv4vD2FDCMoIEm5Ff31HJ8rOrcMVmyUeZaGc0iK
         tttIIHqOZ9sERpSbmFiQHB8/IMXj2igyudFVjCcy1hWT+NDtaP+FpbFykfhAKdFEmtb5
         uKkJqdOekRkNbR792lM6/oPmOOxy7Z5DErYpv0SSdSmxgQpvN8UMW9KLRoERL2RCBOue
         XEW4U6Pu+RtMjyCJ50SLBBSBo/E1sK/lS7Nu+jtoLJJLtPKLS4gY9CV4AZ5vTWjnaEWX
         3cfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bm476dv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o189si8144961ybo.374.2021.04.01.22.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 22:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bm476dv5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSCWF-0004pr-Ct
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 01:38:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCV5-0004V7-S6
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 01:37:43 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:34716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSCUw-0004TG-TV
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 01:37:43 -0400
Received: by mail-pf1-x431.google.com with SMTP id s11so2974143pfm.1
 for <qemu-arm@nongnu.org>; Thu, 01 Apr 2021 22:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=bm476dv5KmFGLLJFdhch7hk+g9TYdW9A5BNUlZCiZ7+UHaOOtAHBDEEIiVGTuLGGcz
 O0pRBis38KND8+hNcrMayxBpZlM/2Kz1mnkL7u9xVrdWwm/hVnFPVHFS0H5K5s7TNNP3
 iNEPErcyhIf36QI2DEzOZnmzWoEvHuCtO80DfVEWaVPg0dX8ziXn+FIegAXRUR2NJzLb
 tG5glWzkA27S5gdw2bGvKUFOiuGFxL/Eo015HhSe9q5OttJvlCS/Atlj9FgNeyQf0ec5
 DlousngIrrPdER0XSqMTRonJeTLnKnE9GurDQbIqS/mPhJ4+yU1ARu0ywZFQAft+RU2b
 ksnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fmCgzHtzk5qDGe2eGqNAc4vF9R/bc/UzkhnNYf8s1aw=;
 b=H4I8mn639/lcIzR6qdg4ivnlFjMgkHocRpnDCJq14fpLa+Bouk1QyYZpbilf7EWwGH
 su8iVEu7ckAHvGbOKQ9SoVQ9Qlw1v78AShKLOmWx41p5qDOyHmkxaqMHBH4bjiEujouD
 flXhTDjfjknB3Z/Pei0sP9UBjOW5fXGVqeWIjfcN/aMLG4b3tQyhjRBQ3nqswTdkYw6I
 24X/UYMNJiAi6fXnjHfcP9l9RpcXkOirg4/phZ7QaKnV3HzicfMN819GMLiaU+DHm5t2
 mz0SJWDZqmV/EoDLpxHIsGskeFrqYFi/FboVXkcSI/Xbk3okMZoZS5EOaQUKb3wb9hhq
 PbtQ==
X-Gm-Message-State: AOAM531s80BxSJAYR8tBBV6atlAEzXlZPEh9F4AlR82IEdbMfBAyIK0E
 fvoTQveCM9vE98DoqvjM1Zz8rt3QYTIqtQ==
X-Received: by 2002:a63:f247:: with SMTP id d7mr10250009pgk.112.1617341853100; 
 Thu, 01 Apr 2021 22:37:33 -0700 (PDT)
Received: from localhost.localdomain
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id g10sm6908074pgh.36.2021.04.01.22.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 22:37:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/arm: Check PAGE_WRITE_ORG for MTE writeability
Date: Thu,  1 Apr 2021 22:37:27 -0700
Message-Id: <20210402053728.265173-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402053728.265173-1-richard.henderson@linaro.org>
References: <20210402053728.265173-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A+jagrd8HTsX

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

