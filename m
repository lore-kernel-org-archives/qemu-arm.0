Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099F5C71130
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 21:01:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYsxb-0006Ve-It; Mon, 07 Jul 2025 17:01:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsL3-0005F5-Bj
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:28 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uYsL0-0004Fw-Fa
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 16:21:20 -0400
Received: by mail-qt1-x829.google.com with SMTP id
 d75a77b69052e-4a774209cf0so40151791cf.0
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 13:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751919676; x=1752524476; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jc2oN7irUyYl9X7QOUlSFDFaLc2q7UiRV+m8B2csJtc=;
 b=cx62i4ah8zTMhBYuDcectY9D9PP4+RcTDVZxt7OFWgL2izUa3F4Rcvs5juBB2JLpq4
 7PaebbydouGh37fBMWXlskc2gIIzsitihkaCTVrBUHRHK9JqhA7zL4musbxjUJZOX1MY
 FFdLwtwMmv6FttbNNYdl/sf1Q1C8RHUU6XrYz2vfZHZWcB2XlQlmJ7HCfVp+Cuxke9vp
 01oinG/Do35aECgD7E4vDRiS+PFb84ZwBseSGseK5pqG3aBvlqxXYdpopSk6rQeC8OkY
 J6qzaofGHgrgpGRRtl+PToYnov5VTJ2884N3v3+BBm3O8l9dFQ+VDvDdWYu0OhNqrxHw
 TG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751919676; x=1752524476;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jc2oN7irUyYl9X7QOUlSFDFaLc2q7UiRV+m8B2csJtc=;
 b=huH783UDXWQnD8UUWpHZmS1J0hiOw/2gUXo8O9ZsI4UfK32NkjfXJ2BjtqPJBiOzCZ
 n7jiE+8oZUwfapPdKitbwakUgb/q9f6Z9Og1tzNubJMShFUJVEalg6TUqFEBN/+3xlj8
 NExkFLlVVVJm1OgtlJAblUUbip2RpRqUQULmC5/U+fPwzMdq/VnGhO8RNDJVMj+AgTZ+
 Jhoxsa7AojpNtDZ72TBzFJPSMlD3Iyxg/H+5k3RiIBsCmFyRHoOQXU89EvzuG74uzz+j
 2jmCdTmEdLGXUlqNK33P/ioUvjX3JLOzF+Md77u6Z51ngQqQ7opC8M101X2PJXblbULC
 PLjQ==
X-Gm-Message-State: AOJu0Yzz+k59d0+Oj8nElnnpALvIbP9RdeMgpqmkpBRNUpXuY/nRizwp
 wUcUk2tG6pku7mkIFjjsZ9mO+begzutOW7TR12AzbLwPbHNsrqTgUoPesJ12IDVhQ9pEvYH9oWY
 17l1HL9o=
X-Gm-Gg: ASbGncstrqnNkXqI7qPSyFyt+EJ7dv6JsZbNqU284iyTgsmZ71q4gIgG5Z6W51VJcit
 yJV+YIRyl0mdKlHr/7FY61HnkCQIa+SjqiQlwWfd9Orr7w5zwriL2ahfCkhPWKCdPUYvGZ+vG1W
 rCkBhHUT3Q/ooYCt1PPZm67kPwzFRC8384KUbKEVlzS9upcXi5jS/OM1DmY256Nmf7W2gAoOTu2
 /k0Xce+PExjPhF5Mf+J6b4wXB/dI82wgbLAfL22h/IMRnff4kD0jQjoB6YLa8EcgNkMltuBRWsH
 /MyIzLAN9Ut1Yml5mTvz8HInuB69N36p9Bl2TSGjRFm4Y8SRG3YcDIcCwqF+zNklPiyVohdoFC1
 7QVgR9hKD/lCytNd3
X-Google-Smtp-Source: AGHT+IGhza7YbWOCfWAOzvKZyRCkyo7i9yuD4JzgHHcoFlXcZtVZhr47fHurAKIOB0g/PNWjAKluyw==
X-Received: by 2002:a05:622a:410c:b0:4a6:ef77:3deb with SMTP id
 d75a77b69052e-4a99881e795mr219551371cf.40.1751919676605; 
 Mon, 07 Jul 2025 13:21:16 -0700 (PDT)
Received: from stoup.. ([172.58.142.143]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4a994a78dd4sm69050351cf.51.2025.07.07.13.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 13:21:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 01/20] target/arm: Convert get_phys_addr_v5 to access_perm
Date: Mon,  7 Jul 2025 14:20:52 -0600
Message-ID: <20250707202111.293787-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707202111.293787-1-richard.henderson@linaro.org>
References: <20250707202111.293787-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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

Begin conversion of get_phys_addr and all subroutines
from MMUAccessType to a mask of required permissions.
Notably, access_perm may be 0 in order to disable the
permissions check.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 561bf2678e..760387b4da 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -979,7 +979,7 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 }
 
 static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
-                             uint32_t address, MMUAccessType access_type,
+                             uint32_t address, unsigned access_perm,
                              GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     int level = 1;
@@ -1089,7 +1089,7 @@ static bool get_phys_addr_v5(CPUARMState *env, S1Translate *ptw,
     }
     result->f.prot = ap_to_rw_prot(env, ptw->in_mmu_idx, ap, domain_prot);
     result->f.prot |= result->f.prot ? PAGE_EXEC : 0;
-    if (!(result->f.prot & (1 << access_type))) {
+    if (access_perm & ~result->f.prot) {
         /* Access permission fault.  */
         fi->type = ARMFault_Permission;
         goto do_fault;
@@ -3515,7 +3515,7 @@ static bool get_phys_addr_nogpc(CPUARMState *env, S1Translate *ptw,
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
     } else {
-        return get_phys_addr_v5(env, ptw, address, access_type, result, fi);
+        return get_phys_addr_v5(env, ptw, address, 1 << access_type, result, fi);
     }
 }
 
-- 
2.43.0


