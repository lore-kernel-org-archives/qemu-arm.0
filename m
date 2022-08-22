Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp979811ejc;
        Mon, 22 Aug 2022 08:28:37 -0700 (PDT)
X-Google-Smtp-Source: AA6agR66YA+XWc/66sadhDLw5yOYXgmoJGnbDuzfIQOSMuZz0gIIvLcTZIkVBOuo5TbDnY2QTJTU
X-Received: by 2002:a05:6214:1ccc:b0:496:ab6b:7089 with SMTP id g12-20020a0562141ccc00b00496ab6b7089mr16443074qvd.18.1661182117317;
        Mon, 22 Aug 2022 08:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661182117; cv=none;
        d=google.com; s=arc-20160816;
        b=AjeSHn+W9V7d22DFPbfykQiEmdRXn/dU02qu7x4aP3PJktvflolmM1QynSFhN3n0vt
         L8Gqno5GRp2GwKUw7/bSm+QHK/ZZhujCNUFSF/snsbjVRt7LsHl1WeaNJl6QwyDzxjH4
         Msv/jCQqwLzxogQhs48xxs4qBh2BLMXj5/FzRtViles/QLiR0qmEa2/65FwEWsJ8i1RG
         PsSMPNdImy542S5W7/tB3Be5Ec6o0kbPxVzntK5IzJcTfGhN+BYgRN93Mod862Gjq5ka
         QkQ027vy9VTHNvyTHOtsDcIva/y6x14obYIzUK/j5n3rUtNHoyOllH1ws8w6c8NIIDiq
         QTzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RTuC78nAmKRpy6AilqJ6/PXnPW0S1OBfJlreo9tIjlo=;
        b=JZc9jy+OjAy6Hk2XFabHDd9l1VhOhcvBUyx1bSHE3eeMFK2b+Q2/ioMXe4gMcToIhL
         As30QKQ3LUpn8/vHASt2vvXmgsvi8LSrXkcwcNWCFlm8FiM29IvXlaba3YMFWcAIqOV3
         Fe+hIJ5f4I+KYNFYyu5XGA5iyedN5sRmew60XzcE+7FPkHu229m6a612Q5OpX2AuUdcs
         ErRne8vkMmjUMl614lQk5masTL5wrkrHN8b2xq1aoyqNvzJkGq88hrAA29kPIRIgxV68
         0+vi9I0tRFZe9hoCN//1H7kgn8MaW5xV5zZnoKsLopYuRe8AInn1ZKtah+nCOf1TEeUW
         /hpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdWh6jgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i8-20020a05620a404800b006b5cea10197si5459893qko.731.2022.08.22.08.28.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 08:28:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DdWh6jgh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQ9Lw-0008KF-Lk
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 11:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9L9-0006zn-L0
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:27:47 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9L7-0000eK-HA
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:27:47 -0400
Received: by mail-pg1-x52d.google.com with SMTP id s206so9690819pgs.3
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RTuC78nAmKRpy6AilqJ6/PXnPW0S1OBfJlreo9tIjlo=;
 b=DdWh6jghg6sPIZt5dYG1EFyZ9PFXE9H5lHaiNcFThNTuPrnpgd7ODCz574q8+s3+QZ
 3Kqeh4TFT5HYLc5HYsjiQFi8T7A2hMRGn1H1B7wnHr7lXTV+dInGi5O4/ahCSypuO73J
 wrCxYCNhcb13HuhNZAZB7nuKG5giAf2librZI0y/ORJU7j34eF6Th6qk17XtyqXk5yd6
 3xjWuPj2KTV0q+iU5rtney3SBOHUcAB4DZs9BgYI1hWAOywhizh3NVd65apx6a+XY2tQ
 A+FS0PQhIjfQVqSJElJKBfGVB2gmq517tmYObUMyiMSjuegJFP56t9cwpwQoU25EPoz6
 IXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RTuC78nAmKRpy6AilqJ6/PXnPW0S1OBfJlreo9tIjlo=;
 b=22h+UuXTvIDXuicgzjpEaHOw2Z8IjISKyzj52oKhhHoBf9/q+fXt1KDZirjYUIHY33
 fOfiqcr8W7l73cv9K2OPK8kiIL9ppRYBTG5SVtaKwwOOQ/DtR4TvBU1qi1P5YufRpGuW
 3BNWIOL31OKOpvuJ3weyaqLsWruJQGnoaZkMElAeZDrNoyyvuhDvsN00cvo+HGxLBuD3
 AlCbDz+hVDUj/h9+xSnlaqXMChzP4PwmzFON678ib6qV7wX3p+2vsXfXP3JsORNl0qIf
 /KABEbHK55hRMQuy428WvNkkFZGo4wY8i47A+feKc+f9b3zIw8HVlHcUOwrRzA3UTC9e
 zT9Q==
X-Gm-Message-State: ACgBeo0ba437nD68j0kt+bU8g3O2VFIG6Y9vviT2ioWueXIjUuwJilH4
 PEblw5nU9kUR5ichcnC89Ss2Mg==
X-Received: by 2002:a62:be0e:0:b0:536:76fe:ee96 with SMTP id
 l14-20020a62be0e000000b0053676feee96mr6999547pff.44.1661182064127; 
 Mon, 22 Aug 2022 08:27:44 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 q7-20020a17090311c700b0016bffc59718sm8665222plh.58.2022.08.22.08.27.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:27:43 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 02/66] target/arm: Fix ipa_secure in get_phys_addr
Date: Mon, 22 Aug 2022 08:26:37 -0700
Message-Id: <20220822152741.1617527-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LphhyVypgKkj

The starting security state comes with the translation regime,
not the current state of arm_is_secure_below_el3().

More use of the local variable, ipa_secure, which does not need
to be written back to result->attrs.secure -- we compute that
value later, after the S2 walk is complete.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8db2abac01..478ff74550 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2308,6 +2308,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                    GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
+    bool is_secure = regime_is_secure(env, mmu_idx);
 
     if (mmu_idx != s1_mmu_idx) {
         /*
@@ -2332,19 +2333,16 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
             }
 
             ipa = result->phys;
-            ipa_secure = result->attrs.secure;
-            if (arm_is_secure_below_el3(env)) {
-                if (ipa_secure) {
-                    result->attrs.secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
-                } else {
-                    result->attrs.secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
-                }
+            if (is_secure) {
+                /* Select TCR based on the NS bit from the S1 walk. */
+                ipa_secure = !(result->attrs.secure
+                               ? env->cp15.vstcr_el2 & VSTCR_SW
+                               : env->cp15.vtcr_el2 & VTCR_NSW);
             } else {
-                assert(!ipa_secure);
+                ipa_secure = false;
             }
 
-            s2_mmu_idx = (result->attrs.secure
-                          ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
+            s2_mmu_idx = (ipa_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2);
             is_el0 = mmu_idx == ARMMMUIdx_E10_0 || mmu_idx == ARMMMUIdx_SE10_0;
 
             /*
@@ -2388,7 +2386,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
                                                     result->cacheattrs);
 
             /* Check if IPA translates to secure or non-secure PA space. */
-            if (arm_is_secure_below_el3(env)) {
+            if (is_secure) {
                 if (ipa_secure) {
                     result->attrs.secure =
                         !(env->cp15.vstcr_el2 & (VSTCR_SA | VSTCR_SW));
@@ -2412,7 +2410,7 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
      * cannot upgrade an non-secure translation regime's attributes
      * to secure.
      */
-    result->attrs.secure = regime_is_secure(env, mmu_idx);
+    result->attrs.secure = is_secure;
     result->attrs.user = regime_is_user(env, mmu_idx);
 
     /*
-- 
2.34.1

