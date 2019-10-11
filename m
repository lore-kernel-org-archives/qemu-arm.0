Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp871477wrm;
        Fri, 11 Oct 2019 06:59:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwA4zrTeUfk4TLwFW6qu1Ard5o3HRlj/Ed7fCMmhi+52YtUCUTz2rnIsOkQl+YFVb1ERDLf
X-Received: by 2002:ac8:3476:: with SMTP id v51mr16837222qtb.285.1570802346240;
        Fri, 11 Oct 2019 06:59:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570802346; cv=none;
        d=google.com; s=arc-20160816;
        b=f5KYb2kR5OwdZMr0lT8BfUoxhh61D+1o5ZRjN2WAR3SEFi0AwUY5ov3z8rSASmcaP1
         WnaAf2cbgAsC/K4IXYmryUdDdTBXgXiaBRVfWAikMC6ft5hB6TgfxOLo+sO02T0FBqbq
         MHc9UudvbIcSwqckZ0EuE15veVzrNCs1KrBJNgrFgJ5L5RxqKQVb42ubSdGloyMewDRI
         7iMNYtR94cz2A2bEHCjrs24YPItAhdBrhw6QhF5IldO/QVpf9DbwOgcaimqzsrv8sDdC
         jm+FdGFiPe8DSypF5Lz9KYeejCix7dDtHxVYDKrW3ErdDnxklbXffghi1wqFRlsW91Dy
         /D8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=fmdmkU2Zh+ktxeMt/gay8d04S3LmhLt8jnMCWxeDlf4=;
        b=U499tJ8B37NBs401wnlrwPwnIG0QCYT10Y9fdlj3OVaXbDc01we5XGv9hZhdnB2/88
         OY+ML4ybMRUXeoGPwSxkPnGYjc47hEuQeQiDX1PIcCETC6tluaSsZ418it8zzmA1X5Da
         e4dq4ow2cMTGGqE30QKhZKSX8VxUMvgOPM7h4Gub8ukB821QUoVtJUApQjMl8d/UpShH
         gxz/hK3AIEacVaeH+a+9N+orlNNF+7NhzSef63UVTmV3U/SYdf+ZMLs71wW1R8y/p0+2
         MR3rYMQsLhMN4I2DKf1fauQUB5F/7YDPqfFKnOMpH49wQhIQaFq9aaX0OsCuJaIWDXT9
         zLYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JpUbxzlV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4si8552520qkm.309.2019.10.11.06.59.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:59:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JpUbxzlV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIvRh-00005F-AC
	for alex.bennee@linaro.org; Fri, 11 Oct 2019 09:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39326)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJN-00066h-6Z
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iIvJM-0004Ax-1J
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:29 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:37185)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iIvJL-0004AC-My
 for qemu-arm@nongnu.org; Fri, 11 Oct 2019 09:50:27 -0400
Received: by mail-yw1-xc43.google.com with SMTP id m7so3496682ywe.4
 for <qemu-arm@nongnu.org>; Fri, 11 Oct 2019 06:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fmdmkU2Zh+ktxeMt/gay8d04S3LmhLt8jnMCWxeDlf4=;
 b=JpUbxzlV4uswbaJPDJA8Y/qbYUEc3BtqiTXRjynxmYcnPhpxsZ0WznseAMeS30IM9D
 w9a28hzfzLtCCBcblxOgzxDAzdiNjQ3Hx4u1y1rYsISXQ3U/N1lkv068KJF5pLhYf31u
 tmbdGXR+Db45liCV35aWKu3TaGtF8HC7D6i1DrmwgCinoIvD2igLRJYxTy3Xt/V0Vcfd
 Vtl8LZjQZa0o2MYRHNkC0tA3EoN7LVFWP+NU+LY7zwyM6uwQ0IW0rqg3CJS0ZBl8GOmX
 37ZrG8pluANeKZIp0zk8ji7CCLWj2+7jcnztfEqrn+Bi6KStmcZd0qdYPyzd0bLmaJ4x
 8KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fmdmkU2Zh+ktxeMt/gay8d04S3LmhLt8jnMCWxeDlf4=;
 b=dxGXeib9eCYKMu42VL/Sgzfi4k/D/njT7nj2D9cAKvrZmaNqdS7lKyOiRBTQ8qQCJx
 +RGLGTtF4sEAIVYA4RkKT/V9AZ9vJaPYRNDGGBdiCo9O7Fl05U2wLvxq1Fox8ZZKLxGu
 3gOg+WRZ9qgmrvMpXhcRCx/U/W97/xBJ8NAvn7LkhBD4GW2uaDzDvbcC8Pm9Y1RpvXnk
 HvegOsfLBdkeinnPomVVB/o5OMBU5Pb8z8ijQuDlFXiQ9qUeigJjAjKyFtHEGN5osDsm
 7im0UvwObMmHVzjfmpUT01lzMaHuCCo4OurgKG7kkkcQw9tQ3TJjleK5b1sQFQNyOIsc
 ZKTA==
X-Gm-Message-State: APjAAAXR1Fh0j6QqqTs25vPWSrFW5U1mVjYHnMKWYhZ9FHR2BrJOB83W
 uLaeUBj38y0hYkp+bpjhnIT8dpog7tQ=
X-Received: by 2002:a81:f10e:: with SMTP id h14mr2471006ywm.49.1570801827105; 
 Fri, 11 Oct 2019 06:50:27 -0700 (PDT)
Received: from cloudburst.gateway.pace.com (67.216.151.25.pool.hargray.net.
 [67.216.151.25])
 by smtp.gmail.com with ESMTPSA id f68sm2534000ywb.96.2019.10.11.06.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 06:50:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/22] target/arm: Cache the Tagged bit for a page in
 MemTxAttrs
Date: Fri, 11 Oct 2019 09:47:41 -0400
Message-Id: <20191011134744.2477-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191011134744.2477-1-richard.henderson@linaro.org>
References: <20191011134744.2477-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
X-TUID: bHSDob1PuRC1

This "bit" is a particular value of the page's MemAttr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index e988398fce..17981d7c48 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9609,6 +9609,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    uint8_t memattr;
 
     /* TODO:
      * This code does not handle the different format TCR for VTCR_EL2.
@@ -9836,17 +9837,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         txattrs->target_tlb_bit0 = true;
     }
 
+    if (mmu_idx == ARMMMUIdx_S2NS) {
+        memattr = convert_stage2_attrs(env, extract32(attrs, 0, 4));
+    } else {
+        /* Index into MAIR registers for cache attributes */
+        uint64_t mair = env->cp15.mair_el[el];
+        memattr = extract64(mair, extract32(attrs, 0, 3) * 8, 8);
+    }
+
+    /* When in aarch64 mode, and MTE is enabled, remember Tagged in IOTLB.  */
+    if (aarch64 && memattr == 0xf0 && cpu_isar_feature(aa64_mte, cpu)) {
+        txattrs->target_tlb_bit1 = true;
+    }
+
     if (cacheattrs != NULL) {
-        if (mmu_idx == ARMMMUIdx_S2NS) {
-            cacheattrs->attrs = convert_stage2_attrs(env,
-                                                     extract32(attrs, 0, 4));
-        } else {
-            /* Index into MAIR registers for cache attributes */
-            uint8_t attrindx = extract32(attrs, 0, 3);
-            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
-            assert(attrindx <= 7);
-            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
-        }
+        cacheattrs->attrs = memattr;
         cacheattrs->shareability = extract32(attrs, 6, 2);
     }
 
-- 
2.17.1

