Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp2439886lft;
        Sun, 3 Jul 2022 01:43:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sdeMmLA2m2Fa3hZXQS9uABQJiw23z3fk00y9Rc4msa6ZOSx2wR+MmLLLAXWRWiPv3GHNNg
X-Received: by 2002:a25:d45:0:b0:66e:1ba5:b18 with SMTP id 66-20020a250d45000000b0066e1ba50b18mr7212653ybn.361.1656837817710;
        Sun, 03 Jul 2022 01:43:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656837817; cv=none;
        d=google.com; s=arc-20160816;
        b=s0qVD+1od+90cA9g/EMpXQ57iBFq6Vn/23tMTW+C5vHIwNL1G5A5ZMN569n9rAjEXX
         sr3L1I+4AKS2AAKXMt9Th2l2QARdzBEBjqN5cpJcnKuphCmja2XWsOS9K5/+5MlpiPhJ
         kMqMjEaJhpj5klOGCfeMO0Lyd0Ud1rGMi82tgw4OX8EJzkjlLzysVrZLCaenigGsRZnz
         NGRmuxDuWZqYvKZQq9AJbkPxyOyYLppePx1xG00EVVSIRXf/J26vOdgwGqj6P60rlukJ
         jHV5ZRRrXttQcwIL0ei6wykmf/Os4NINUbOf/Kktwx/sHlNoAmFmWbbJzQ3/zqsrw6T6
         0PMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UvRs/fI4qqQtxbNs3Ld/tro7HQYE0RTJrbm3VX6tYyA=;
        b=kB++qo7jTxe4pAUnOAiOS/Q3GJG4KDECcieHoN6CAE95Jmv8K4YwuSJP0GYdVkDGuL
         2rcxwNpiPw20InzBQ4gX4h24uDCB+vMO+YQH6TL1jVtx4aOkB3uQGT3HRjXmnhgadccp
         C/1cwHbLJl23T8Jvu90DdzAw9yfcKsEA4ztDXX6ThW47XH3y9wLcSqJhEpHWM0Aqh0iW
         zm/0FKQBAa0zJoadIhnrIKvk/Qj7owvMpY11U9b5kONVeZD8CC+dFKVI2wKHpVHAoEZM
         Z3uc5QPgchX1LhF727rv9A+1gKafVWQtDdcIiCO/VXPPrLqb7a5yuZmDce/T7OA5JK8L
         EiGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Crkcueic;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l194-20020a8157cb000000b00317a0fa1c61si34717370ywb.211.2022.07.03.01.43.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Jul 2022 01:43:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Crkcueic;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o7vCb-0005Fx-3v
	for alex.bennee@linaro.org; Sun, 03 Jul 2022 04:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv4-0007qS-Nk
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:30 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:43926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7uv3-00069b-6k
 for qemu-devel@nongnu.org; Sun, 03 Jul 2022 04:25:30 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 68so6236812pgb.10
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UvRs/fI4qqQtxbNs3Ld/tro7HQYE0RTJrbm3VX6tYyA=;
 b=CrkcueicowGvnycbN9HBujuF3rLvBObgq0Fyq6BpWFI3/iOlVmaPjYfLFpOvt06byS
 3BemZ1rbA7sGuzgjal8arJQIYCqL+5c7euINsTH5pE8az5h6boBQE43o870E68JYG91/
 MBSe8UA/PwImEbTziMjUI75LvVHbiy1ByC863vvK5ezgo5WnF7EwmYtJ1+YSucT8HjMw
 +LbxPZ9Qi7MFFKNt7M1H0yblKNTu++iuRG0DZMTUj8X0GxJEz7kfkVDTf9EUrQ2Q2Man
 n7ixJw+w0XrfFQaCdnN39urzvhpahXwILrkB9Ryciu1sdNVeOuPgkuD+PjhaARIV2wHL
 qfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvRs/fI4qqQtxbNs3Ld/tro7HQYE0RTJrbm3VX6tYyA=;
 b=yeCUusAyMRZUCSrR/QmKdG8bdT3MPxCQPV55HVapBqg4lwOkQeCad4APOdhx3rfEQW
 IeCj/fnAOdBbGr9PXyr9sX8GgKVma6/oJUHEV1tGNWvViNwOkVkLqaMyPxjaIzvq00Fg
 f4sTe720TJzojr2S0s1akVYrWCZabz2xY8YvvnJQuRNUtBgkDTfh58gmjHsFD0S3q2eb
 3lsmP+QPb9J8IZ8JVZZ1ODcAEuLHlAt0c0vTdxZ9rYXM+8K5t8nYqfAIGLeE58sqC5z4
 diKVK71TH3ZYpyR11un5cPUQhiHzmGj52o6prl+l3DdUO15KXpy+/w29oSAFjCVEqfuS
 Ltcg==
X-Gm-Message-State: AJIora8nPr/hqWTBTRh1hWyHID6yOHdYwYGeiqE06lNOyJDccMJnfr2C
 +bx6L25I+mcagKhwaPxNgG443yXUoGT4j05s
X-Received: by 2002:a65:6a50:0:b0:3f6:4566:581d with SMTP id
 o16-20020a656a50000000b003f64566581dmr19415866pgu.122.1656836727784; 
 Sun, 03 Jul 2022 01:25:27 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 im22-20020a170902bb1600b0016a3f9e528asm13569112plb.57.2022.07.03.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jul 2022 01:25:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 20/62] target/arm: Add is_secure parameter to get_phys_addr_v5
Date: Sun,  3 Jul 2022 13:53:37 +0530
Message-Id: <20220703082419.770989-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703082419.770989-1-richard.henderson@linaro.org>
References: <20220703082419.770989-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b6lLXqH6pJqf

Remove the use of regime_is_secure from get_phys_addr_v5.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1a0e708d11..1bef9c6c60 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -410,7 +410,8 @@ static int simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
                              MMUAccessType access_type, ARMMMUIdx mmu_idx,
-                             GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
+                             bool is_secure, GetPhysAddrResult *result,
+                             ARMMMUFaultInfo *fi)
 {
     int level = 1;
     uint32_t table;
@@ -429,8 +430,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
         fi->type = ARMFault_Translation;
         goto do_fault;
     }
-    desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                       mmu_idx, fi);
+    desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
     if (fi->type != ARMFault_None) {
         goto do_fault;
     }
@@ -468,8 +468,7 @@ static bool get_phys_addr_v5(CPUARMState *env, uint32_t address,
             /* Fine pagetable.  */
             table = (desc & 0xfffff000) | ((address >> 8) & 0xffc);
         }
-        desc = arm_ldl_ptw(env, table, regime_is_secure(env, mmu_idx),
-                           mmu_idx, fi);
+        desc = arm_ldl_ptw(env, table, is_secure, mmu_idx, fi);
         if (fi->type != ARMFault_None) {
             goto do_fault;
         }
@@ -2509,7 +2508,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                 result, fi);
     } else {
         return get_phys_addr_v5(env, address, access_type, mmu_idx,
-                                result, fi);
+                                is_secure, result, fi);
     }
 }
 
-- 
2.34.1

