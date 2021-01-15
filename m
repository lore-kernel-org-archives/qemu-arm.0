Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp677169lfq;
        Fri, 15 Jan 2021 14:54:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2o9Vbf5fQ9cF79tlXM+5dKeU4vS8dK88TFB9ml6NeNGUZ9vt/PZQbO6dztN9HqDp+2ElY
X-Received: by 2002:a25:500c:: with SMTP id e12mr22893401ybb.129.1610751285743;
        Fri, 15 Jan 2021 14:54:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610751285; cv=none;
        d=google.com; s=arc-20160816;
        b=F32YL+++721sOUy7aF0AsOp9Lxpltqppp8n2M/DiQmhunRSypsI+KIf+f8SIVOaSbq
         fQ/YigDrDYLAoCOXnpYkeMSeEbEv/CbvhSDMrZmIiCIF8UJhLZDKCZ6fN2LwiWnwHwNi
         Rcq597ltzTPUC7pTE8dV0bXuqqMY0wY8Q1UvORgi6pgB/HT/Pvw71pa2Th9G8x21lX+z
         wZy0ptZfR5o3tey8WEcNyU/s3lyDQqS6IC1EI5mjiwHeYkQ01hrwoSle5PeZqyLcBZ2Q
         0ki9WsCSL0x+eiyRsL+DGnc167iy3IGMyKj41WhfrHtHZYCHGcbO5sazKc5fDZZxbLEe
         uuNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
        b=omKAkpfY8PSXjqkrvcQs33PEAalEBXA/Qh2tak7Za1+20Gx6wV561EMGWuLXdgGOU6
         PzUsQttz+RmvqFsKB2CldEzQM0fIaqbpajB/xjpeF9V1oli2ueRHljZu4HDF9Ofc183J
         D8ekjPML8ay2a1z0btz518KN1LCab3Rf4p1Znp/n8mR/juplNa10BfzUWJkh0l2cmNqA
         GCsMgx/D8pGK8zZn0F4IbcS6L67YcfjbDZrl8woOQVuwGJff8HK9A+WCz7JQMPvuD/BS
         95xazU9fcHRbXpU+lG6N881cyOpBGeYn6uzO2owFaC9HrvL69rh/f8FK1NAYm5189nXV
         VRcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LcG7qzDJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14si10084091ybl.390.2021.01.15.14.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:54:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LcG7qzDJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0XzR-0003Ky-4Y
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0XsF-0003dM-KZ
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:19 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:34070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xs3-0005G2-J0
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:47:19 -0500
Received: by mail-pg1-x530.google.com with SMTP id i5so6959454pgo.1
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 14:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
 b=LcG7qzDJHtDNdykP4TizHyjuonvDePY1rRb+OzUOPSISfOdv6f99MecPmI4SQFsF/+
 nl8ZcxYvz6Y0w6HeI1ml2PWZrOym7gftokPucD4W7IZ2EdcVB0OT5JIGYAnNBj0q7FmV
 Amejm4HesUHbbbSrgcxzQEvrP6mzc80yj8xrXqmSpUhp9AeT21VjsXB6tXyXgmqhRh6H
 U/J33hGJT1lE+amylRe5H/zivAw+xyw340BVXyvl9Kg1hN0jR5c41MvjaqhN7KVIMGrG
 XxcXUGr2pISM4z2cDkUFctVz8btNmF698Iy+p6kyzd5W0uPduXLNK7q/fEuYGxmI8O0k
 5C9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
 b=q4f4ITuMUxTsG/9GT9TxZ/W0q28gEaSxP2SQxd0Vyc2/8z8aCHlqurokN2LVp0rdtf
 tvCwUXd6RqfK4M8yI0nr48RLu71ys7p2U1he8DLNfagsgb87Ak4eyQQdjiLSMnIznyJ4
 V6/MM2E36cO3N8kFxRRMfKzn4IcdBenBvE//S+tO5ISUqVa2OU3Ic7AWBS8jGkZ33GFk
 qmsJF4GeIe1TIThxy1+2JgAGWWbxXQ4z+FjEoTMjmUbK32RtX4f6tW/gATEN52hWzKS6
 0Ut1ocWGnkC3oCtiKP6h15MMql08S6zQOPM69kEdRX09yJPRaIW9hklihpFtFgImxsv+
 /ZBA==
X-Gm-Message-State: AOAM530/ZLCu4TmbwQzjSt3+CYCwtXRGZvXwnD/jx6X9Uk4CvEpsfwEy
 qB2QZ9BnD9Nq0FsmxzcQNW1nOEb2Ub7gm386
X-Received: by 2002:a63:574b:: with SMTP id h11mr14885891pgm.25.1610750826381; 
 Fri, 15 Jan 2021 14:47:06 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:47:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/21] exec: Add support for TARGET_TAGGED_ADDRESSES
Date: Fri, 15 Jan 2021 12:46:35 -1000
Message-Id: <20210115224645.1196742-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MONgEmirc8Vs

The AArch64 Linux ABI has always enabled TBI, but has historically
required that pointer tags be removed before a syscall.  This has
changed in the lead-up to ARMv8.5-MTE, in a way that affects the
ABI generically and not specifically to MTE.

This patch allows the target to indicate that (1) there are tags
and (2) whether or not they should be taken into account at the
syscall level.

Adjust g2h, guest_addr_valid, and guest_range_valid to ignore
pointer tags, similar to how TIF_TAGGED_ADDR alters __range_ok
in the arm64 kernel source.

The prctl syscall is not not yet updated, so this change by itself
has no visible effect.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e62f4fba00..1df9b93e59 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,17 +69,31 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+static inline abi_ptr untagged_addr(abi_ptr x)
+{
+#ifdef TARGET_TAGGED_ADDRESSES
+    if (current_cpu) {
+        return cpu_untagged_addr(current_cpu, x);
+    }
+#endif
+    return x;
+}
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
+static inline void *g2h(abi_ulong x)
+{
+    return (void *)((uintptr_t)untagged_addr(x) + guest_base);
+}
 
 static inline bool guest_addr_valid(abi_ulong x)
 {
-    return x <= GUEST_ADDR_MAX;
+    return untagged_addr(x) <= GUEST_ADDR_MAX;
 }
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-    return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
+    return len - 1 <= GUEST_ADDR_MAX &&
+           untagged_addr(start) <= GUEST_ADDR_MAX - len + 1;
 }
 
 #define h2g_valid(x) \
-- 
2.25.1

