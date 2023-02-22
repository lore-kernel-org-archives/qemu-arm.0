Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3827104ejb;
        Tue, 21 Feb 2023 18:34:53 -0800 (PST)
X-Google-Smtp-Source: AK7set8amDzHolAsSPwsumJtUGXg2q+imUo6z9GUxHixzUCxln1kvzhyxJVwdXqzs/oUui0kV2Sx
X-Received: by 2002:a05:622a:1348:b0:3b8:2dac:b5e1 with SMTP id w8-20020a05622a134800b003b82dacb5e1mr10249351qtk.37.1677033293452;
        Tue, 21 Feb 2023 18:34:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677033293; cv=none;
        d=google.com; s=arc-20160816;
        b=nvC03lt0z+fDp46VtMI37cjewLsRzgWsmYtYwC2QpzNX2LvhAFAac2AeDDDI1BQjnH
         jJnRZagd0I0J2kujioz6qQXMn8viErGn5/+8en8vI1L7M+VuEUEcvyIg2IXAAnHMnmck
         GUjZwHL/ZQlADQS88De0ctTrEuGFaVHb9k/2yIjl9V3O5GI70JhrltBs8Z28y7n2R+a+
         YQMQ/nv3c1WAA69/Hc1FKmeTOuFcs9+VUtNBn1WY/PrDWZwdvyEjJMfGlMt+4GvBCIkN
         7ByivZOWHzkb26ld2Mfubpj0Z3l2WyEDujLsZKpV+rMOB3EokKfRkxrBPVbUhf6Nh6Kn
         Pl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Hddjs2iU8lgJmQnwAvhIIZw97YOfc6Ski+WodJ2W4+A=;
        b=hHLrxdp2FoNaZG7epvxjyiecGlBhYUidVcSn17cCBxknct3tFtU/rw4Ulup2OFLB6/
         SpjmjqlXWzNxiyAQ6BCtSPPGp/+1cpPYn63uTJdjWBYguayEQ2SfmtM2JKGiRnixYaOd
         2GI9LLJoMuwO7g5eiFp/bjrRZzDk7y6qX2pqSLOVPIR1eAEJdVOfcs/Ue673+W1vODvv
         JuquAWyu+NdQdd2ZfSpxbTBCw7u3x1Z608W08KNsc5PYQWQ/ES68mdsNm8AuwpgdC0PG
         1MS2G/RiOwHpChFCtnTbPWUtBJP3FifP3y+wk6dGqUzHnbJnW42RpnRtjBCqdMJA2dfR
         RKAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SROkWP7x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r19-20020ac85c93000000b003b7ec1b1facsi14108020qta.5.2023.02.21.18.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 18:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SROkWP7x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUexL-0007NP-EC; Tue, 21 Feb 2023 21:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex3-0007JG-6V
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:33:50 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUex1-0001YT-7u
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 21:33:48 -0500
Received: by mail-pl1-x641.google.com with SMTP id z2so7363515plf.12
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 18:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hddjs2iU8lgJmQnwAvhIIZw97YOfc6Ski+WodJ2W4+A=;
 b=SROkWP7xABQfwPhAkR5n+ne6j8I64FnaMwmyfz2VxyA0+hwBBVFXdFZzyWAuWXXhLU
 2VNufgp8zyZ4SbTjlvnP2s2Y4pcSl0OfD+Kctvg+SdGsZJQmawFVPeyIcPYDAXJy2W5A
 Y/O6iEa0AaL08H0YdicxgTpOIXtzUqI2VUb+hzdznxMWxL2eFveayOiI1qE5hcbI1ECQ
 k1caLhiEUZmpS4gjnS/L2zFiPGEI0m8nNNoa9sXqoS1ubnVej94BRiV64kP69w+msN1X
 39d69W+OLXlc87cBWEVWuWcTpCTYIKo8L6JMemyUemKM4vbCajr1KTyyK2Doj5PB3Gn0
 bwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hddjs2iU8lgJmQnwAvhIIZw97YOfc6Ski+WodJ2W4+A=;
 b=mT8O4WXBCN6QRKUknFpuS6UU/10vXrR8/bDLLxM2ReJHkcm7KYoFDb8M2Y/d5DJ7W6
 XCVp7f9rvXfGF1LJtZB7pPyrUpCkNI+UHZ++L94AYOOM9R31qg/5j6TJMbmh7Jgxjp4e
 2dtS0ZAXqC+K3ky7s9NvZxseY24IAnXWj7n1i8IA7WjTXCDXC44mVLRaj5eS7x6l16Uu
 yt2tCJ+UAl7bJuYbd8uK8aoMgoU4FefCAnpSlWgI5ESI3aMHdQ98z7LYAKjdoc2nUAH1
 9AFUeFAtIvBu+NGaYJgWwm0Zqa5TjrkImESzVBY2Hw41T7XM/uhkLQ46A4iplF8jS+Uu
 Awww==
X-Gm-Message-State: AO0yUKUphssN7mkn3nu2cpt3gj0KBPd3sBMY59W9+YlXR/ongFhbG+Ny
 m4134DW+QR3dTt4vDRLWsxZ3Ww==
X-Received: by 2002:a17:902:f68e:b0:196:7bfb:f0d1 with SMTP id
 l14-20020a170902f68e00b001967bfbf0d1mr10084978plg.34.1677033225221; 
 Tue, 21 Feb 2023 18:33:45 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k3-20020a170902e90300b00198fde9178csm10520112pld.197.2023.02.21.18.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Feb 2023 18:33:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 04/25] target/arm: Rewrite check_s2_mmu_setup
Date: Tue, 21 Feb 2023 16:33:15 -1000
Message-Id: <20230222023336.915045-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222023336.915045-1-richard.henderson@linaro.org>
References: <20230222023336.915045-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lqi1/q7saK7t

Integrate neighboring code from get_phys_addr_lpae which computed
starting level, as it is easier to validate when doing both at the
same time.  Mirror the checks at the start of AArch{64,32}.S2Walk,
especially S2InvalidSL and S2InconsistentSL.

This reverts 49ba115bb74, which was incorrect -- there is nothing
in the ARM pseudocode that depends on TxSZ, i.e. outputsize; the
pseudocode is consistent in referencing PAMax.

Fixes: 49ba115bb74 ("target/arm: Pass outputsize down to check_s2_mmu_setup")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 173 ++++++++++++++++++++++++++---------------------
 1 file changed, 97 insertions(+), 76 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2b125fff44..6fb72fb086 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1077,70 +1077,119 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
  * @is_aa64:    True if the translation regime is in AArch64 state
- * @startlevel: Suggested starting level
- * @inputsize:  Bitsize of IPAs
+ * @tcr:        VTCR_EL2 or VSTCR_EL2
+ * @ds:         Effective value of TCR.DS.
+ * @iasize:     Bitsize of IPAs
  * @stride:     Page-table stride (See the ARM ARM)
  *
- * Returns true if the suggested S2 translation parameters are OK and
- * false otherwise.
+ * Decode the starting level of the S2 lookup, returning INT_MIN if
+ * the configuration is invalid.
  */
-static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                               int inputsize, int stride, int outputsize)
+static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
+                              bool ds, int iasize, int stride)
 {
-    const int grainsize = stride + 3;
-    int startsizecheck;
-
-    /*
-     * Negative levels are usually not allowed...
-     * Except for FEAT_LPA2, 4k page table, 52-bit address space, which
-     * begins with level -1.  Note that previous feature tests will have
-     * eliminated this combination if it is not enabled.
-     */
-    if (level < (inputsize == 52 && stride == 9 ? -1 : 0)) {
-        return false;
-    }
-
-    startsizecheck = inputsize - ((3 - level) * stride + grainsize);
-    if (startsizecheck < 1 || startsizecheck > stride + 4) {
-        return false;
-    }
+    int sl0, sl2, startlevel, granulebits, levels;
+    int s1_min_iasize, s1_max_iasize;
 
+    sl0 = extract32(tcr, 6, 2);
     if (is_aa64) {
+        /*
+         * AArch64.S2InvalidTxSZ: While we checked tsz_oob near the top of
+         * get_phys_addr_lpae, that used aa64_va_parameters which apply
+         * to aarch64.  If Stage1 is aarch32, the min_txsz is larger.
+         * See AArch64.S2MinTxSZ, where min_tsz is 24, translated to
+         * inputsize is 64 - 24 = 40.
+         */
+        if (iasize < 40 && !arm_el_is_aa64(&cpu->env, 1)) {
+            goto fail;
+        }
+
+        /*
+         * AArch64.S2InvalidSL: Interpretation of SL depends on the page size,
+         * so interleave AArch64.S2StartLevel.
+         */
         switch (stride) {
-        case 13: /* 64KB Pages.  */
-            if (level == 0 || (level == 1 && outputsize <= 42)) {
-                return false;
+        case 9: /* 4KB */
+            /* SL2 is RES0 unless DS=1 & 4KB granule. */
+            sl2 = extract64(tcr, 33, 1);
+            if (ds && sl2) {
+                if (sl0 != 0) {
+                    goto fail;
+                }
+                startlevel = -1;
+            } else {
+                startlevel = 2 - sl0;
+                switch (sl0) {
+                case 2:
+                    if (arm_pamax(cpu) < 44) {
+                        goto fail;
+                    }
+                    break;
+                case 3:
+                    if (!cpu_isar_feature(aa64_st, cpu)) {
+                        goto fail;
+                    }
+                    startlevel = 3;
+                    break;
+                }
             }
             break;
-        case 11: /* 16KB Pages.  */
-            if (level == 0 || (level == 1 && outputsize <= 40)) {
-                return false;
+        case 11: /* 16KB */
+            switch (sl0) {
+            case 2:
+                if (arm_pamax(cpu) < 42) {
+                    goto fail;
+                }
+                break;
+            case 3:
+                if (!ds) {
+                    goto fail;
+                }
+                break;
             }
+            startlevel = 3 - sl0;
             break;
-        case 9: /* 4KB Pages.  */
-            if (level == 0 && outputsize <= 42) {
-                return false;
+        case 13: /* 64KB */
+            switch (sl0) {
+            case 2:
+                if (arm_pamax(cpu) < 44) {
+                    goto fail;
+                }
+                break;
+            case 3:
+                goto fail;
             }
+            startlevel = 3 - sl0;
             break;
         default:
             g_assert_not_reached();
         }
-
-        /* Inputsize checks.  */
-        if (inputsize > outputsize &&
-            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
-            /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
-            return false;
-        }
     } else {
-        /* AArch32 only supports 4KB pages. Assert on that.  */
+        /*
+         * Things are simpler for AArch32 EL2, with only 4k pages.
+         * There is no separate S2InvalidSL function, but AArch32.S2Walk
+         * begins with walkparms.sl0 in {'1x'}.
+         */
         assert(stride == 9);
-
-        if (level == 0) {
-            return false;
+        if (sl0 >= 2) {
+            goto fail;
         }
+        startlevel = 2 - sl0;
     }
-    return true;
+
+    /* AArch{64,32}.S2InconsistentSL are functionally equivalent.  */
+    levels = 3 - startlevel;
+    granulebits = stride + 3;
+
+    s1_min_iasize = levels * stride + granulebits + 1;
+    s1_max_iasize = s1_min_iasize + (stride - 1) + 4;
+
+    if (iasize >= s1_min_iasize && iasize <= s1_max_iasize) {
+        return startlevel;
+    }
+
+ fail:
+    return INT_MIN;
 }
 
 /**
@@ -1296,38 +1345,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          */
         level = 4 - (inputsize - 4) / stride;
     } else {
-        /*
-         * For stage 2 translations the starting level is specified by the
-         * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
-         */
-        uint32_t sl0 = extract32(tcr, 6, 2);
-        uint32_t sl2 = extract64(tcr, 33, 1);
-        int32_t startlevel;
-        bool ok;
-
-        /* SL2 is RES0 unless DS=1 & 4kb granule. */
-        if (param.ds && stride == 9 && sl2) {
-            if (sl0 != 0) {
-                level = 0;
-                goto do_translation_fault;
-            }
-            startlevel = -1;
-        } else if (!aarch64 || stride == 9) {
-            /* AArch32 or 4KB pages */
-            startlevel = 2 - sl0;
-
-            if (cpu_isar_feature(aa64_st, cpu)) {
-                startlevel &= 3;
-            }
-        } else {
-            /* 16KB or 64KB pages */
-            startlevel = 3 - sl0;
-        }
-
-        /* Check that the starting level is valid. */
-        ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
-                                inputsize, stride, outputsize);
-        if (!ok) {
+        int startlevel = check_s2_mmu_setup(cpu, aarch64, tcr, param.ds,
+                                            inputsize, stride);
+        if (startlevel == INT_MIN) {
+            level = 0;
             goto do_translation_fault;
         }
         level = startlevel;
-- 
2.34.1

