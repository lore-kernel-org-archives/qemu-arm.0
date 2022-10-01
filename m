Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp464764ocs;
        Sat, 1 Oct 2022 09:38:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6RsrUaFWF8wtLrvvVHBFdmBQ1a+vcMQ6s/+8NrDvzmUoPOuC5oENv8em6PvC8ygZIKNfr4
X-Received: by 2002:a05:622a:191:b0:35d:4f6b:16df with SMTP id s17-20020a05622a019100b0035d4f6b16dfmr11212775qtw.541.1664642307352;
        Sat, 01 Oct 2022 09:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642307; cv=none;
        d=google.com; s=arc-20160816;
        b=bUQAbx953G7RtgVhVLYTruHHL2lHK1AftNuCaFElHIp7nXJ5htRKLn9UDcwG8wzULL
         9CQ07w/b/LXVZT/MC3FELxDspS8NVoyy6Lml+ZsI58Hf6QboKGTQcaBYtS11+q2LTdcT
         8O+B12Iq6WpAG02GNa/RtV3gSKWofUZQFpzYuOCbzTTtZv2F8ejuPY+ckN/TRAjc0rPO
         VauVnM7EArVZ/OuUjp+ZmOuXhCOGkCHm24CxwxkQGaLXZ1X+Mw7z8WMeHi5VUfV1XEm6
         4LPkcM7lII/88+nG/7R6spd80WxxVBT/2iQ2xikYvVxEUOo20cz8BBzY84FCjG6KwofU
         6/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4bFcMUoE4kIp+2MWdZM5AsV1Ns0C4SweuGTMktPkM3A=;
        b=K0femm0PUqc5lsEJkKNSnou6nO1HsONGDqYF5F1dJFX46/7eHLX0Ss+P+o/avCPIEH
         vRsHfOmT3xxuAUE07IqC/eDMaeJIIduokV3e9KKSruiKFEuDhxmsha6vcxloL7x2VWX3
         rY2oBTPwCjLNZnp07p7I2QS/K32/c307b0KeWjklNU3V9kGSb9W0iwigSmyeEojMWxAp
         UQcQkNTmw2RN0ZItj2CjyxtPfUtdJlQTBHNJYJP71v/CGLdq31CGi40LPnxBh3agPIox
         d1AXWurPEH035fFSKm5+dlJcA5r9mMKBddpnpt9pk2GZKzr09C/WqW54o74jC19yBdga
         W3jg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RmJrPXJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020ac859c7000000b0035bb49b2668si2884577qtf.400.2022.10.01.09.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RmJrPXJW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefVS-0001uy-S3
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHY-0006kx-NR
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:06 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:40807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHU-0006He-3y
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:03 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id h10so2939605qvq.7
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=4bFcMUoE4kIp+2MWdZM5AsV1Ns0C4SweuGTMktPkM3A=;
 b=RmJrPXJWq/ozpee8FKrA5+CKrZFEc6P5gjFoLee1ET3rtcfkjbr9IEDLwCMC5LWfVZ
 +vdiwm/iiN+ET2ste4EwEkUtCGFbWuOLC+VlVc+uwhxfUxgMmlYPAclypK+XRcnjIXpc
 I5f3l+j3FKHsKhgJvWkD6+eSllHvCIY7JI1J9mkm4xtvdrug595RGc7bzQqqP0AkAL7C
 ecxcKq1UtgBKPCCa7qnQl9D+4WCHorv/c9zaa71V/sNGixlxyyWZZccuWhvjJRoCZ/LM
 MiDnTtoC0rZR7fWlwqzxap1pwop+YLFYSV9Z86V/Lv6HxlDQqlKnsog2s/KOP1sJPC7T
 x2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=4bFcMUoE4kIp+2MWdZM5AsV1Ns0C4SweuGTMktPkM3A=;
 b=Bb0zs3TaHHIvMeaB51HGp90ST22z2m2UycUWv1KKsXtMGiP+iBxvcLUhpT82dJ/Em9
 zJOM2P4/t59enMXwugaH3W/MRdQz4KM8OyUIn52XGyFq4Q7LNIEmHZpmTFoil6TuL8PJ
 SplF6IjNc0/Ynr30XkW/Zrzjiy7WiSNy6J0zECHgVERjBLkA5dROXDTbG/RpG5ogWdIB
 QwePIKjJJEmp5jd8YxZYUMyqbxqHQQZOU0jSdIL/jIKUzk28ckZGzFklnsv2ohp1B1bD
 DYvcz6/RSekfODYQJqNYBrhRSpTzTpgOp5Wkj66lGEeEDZmz9G7M1gqy4xGk41NMDTX2
 I+PA==
X-Gm-Message-State: ACrzQf0UXIYmfYBKpzQzZwsLIZME6jTudMWDe+NN9K09+XKtcnXkf0LB
 9P5CFHsw4deBQMGJki6sTvFrK953DtMGXw==
X-Received: by 2002:ad4:5966:0:b0:4ad:7832:a8ec with SMTP id
 eq6-20020ad45966000000b004ad7832a8ecmr11298393qvb.82.1664641437306; 
 Sat, 01 Oct 2022 09:23:57 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 14/42] target/arm: Hoist read of *is_secure in
 S1_ptw_translate
Date: Sat,  1 Oct 2022 09:22:50 -0700
Message-Id: <20221001162318.153420-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QTGDZqwh8fws

Rename the argument to is_secure_ptr, and introduce a
local variable is_secure with the value.  We only write
back to the pointer toward the end of the function.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 1ea29bec58..cb072792a2 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -207,24 +207,25 @@ static bool ptw_attrs_are_device(CPUARMState *env, ARMCacheAttrs cacheattrs)
 
 /* Translate a S1 pagetable walk through S2 if needed.  */
 static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
-                               hwaddr addr, bool *is_secure,
+                               hwaddr addr, bool *is_secure_ptr,
                                ARMMMUFaultInfo *fi)
 {
-    ARMMMUIdx s2_mmu_idx = *is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
+    bool is_secure = *is_secure_ptr;
+    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
 
     if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
-        !regime_translation_disabled(env, s2_mmu_idx, *is_secure)) {
+        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
         GetPhysAddrResult s2 = {};
         int ret;
 
         ret = get_phys_addr_lpae(env, addr, MMU_DATA_LOAD, s2_mmu_idx,
-                                 *is_secure, false, &s2, fi);
+                                 is_secure, false, &s2, fi);
         if (ret) {
             assert(fi->type != ARMFault_None);
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
         if ((arm_hcr_el2_eff(env) & HCR_PTW) &&
@@ -237,19 +238,20 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
             fi->s2addr = addr;
             fi->stage2 = true;
             fi->s1ptw = true;
-            fi->s1ns = !*is_secure;
+            fi->s1ns = !is_secure;
             return ~0;
         }
 
         if (arm_is_secure_below_el3(env)) {
             /* Check if page table walk is to secure or non-secure PA space. */
-            if (*is_secure) {
-                *is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
+            if (is_secure) {
+                is_secure = !(env->cp15.vstcr_el2 & VSTCR_SW);
             } else {
-                *is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
+                is_secure = !(env->cp15.vtcr_el2 & VTCR_NSW);
             }
+            *is_secure_ptr = is_secure;
         } else {
-            assert(!*is_secure);
+            assert(!is_secure);
         }
 
         addr = s2.phys;
-- 
2.34.1

