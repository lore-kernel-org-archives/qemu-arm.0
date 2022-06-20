Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp602264lft;
        Mon, 20 Jun 2022 11:03:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1viygfJLPaRjPOFoUPlwdPbDH2GTzxBz2IVEErPR6uL1kNHVv0crQxSOr96xDXMcONIuFop
X-Received: by 2002:a37:a08c:0:b0:6a7:7940:bdf4 with SMTP id j134-20020a37a08c000000b006a77940bdf4mr16981712qke.741.1655748190470;
        Mon, 20 Jun 2022 11:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1655748190; cv=none;
        d=google.com; s=arc-20160816;
        b=gPqk4K1nquj8C5VRd3iJ/DGhFx2F9MDQzUAHbXxDpSmaAf6akhgx/WuJu2JTl36cyT
         +6YuTsdOOfiHYwbkZJ/Emc/ymWKmhCqzQT7HhwkRuPWTqj2v9LgjyUBhBQ3bKVYB5/GP
         PtF6M2KIr7qJ58lirQN+9HDILLWoCPE3JKrtsvelCTqdbVFvsYMDyte0DAOV5EAdfH9f
         KOwKWhvk20kpp8jnv57pVJwJjJ20srSgJ0Lmjvf6lvAhHoRoqjzzah9rgRWKfpCk0BdV
         zCsUSO0XF0ST6vXbLtSC5GE2tsueSkMhksX9SE4DxMKRqm45XMKf3pWrv4JtKmQUuoX1
         bvLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5s/+YW/vX1WwcuSwHWbOioATvoXW2euPDPUYkCg3zf8=;
        b=rvT7faAmhsLqIMpomufU7P/VpU+GwC2Zq+p7BCU9n7kPGcHRa3bJuxZOQ+jorhM1XD
         CLtn1MsuXGNFteQFx2nsgR7CWaupKuFHZB8Y03HPauZqihFAZRedwJL4w8YguTX7r/8c
         SnJo02jfQz0EtbYsXf3RwD3MmDy1WTsx32R9rkpwzK5SovVnk20L28Smvp7j/3OuiMRj
         b0YYXuU8y+5t6UCxy8a/hIxN0nd1vRC4AKkmnHBTQKDr5Wo4D7vTGT0Q0F4F7TBPC4za
         oiFzbc7EIsWnRRUbqjfzl6Kh8YkToxPEL1e0+NlkeIckz00Iq/h9DkuFsKUnfO1P4VD6
         oc5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zznQRs1f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j19-20020a05620a289300b006a69a85607bsi9947428qkp.702.2022.06.20.11.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jun 2022 11:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zznQRs1f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o3Ljw-0008Bq-Ro
	for alex.bennee@linaro.org; Mon, 20 Jun 2022 14:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZt-0005Y8-4P
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:45 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:42681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZr-0001Kq-Cn
 for qemu-arm@nongnu.org; Mon, 20 Jun 2022 13:52:44 -0400
Received: by mail-pg1-x52d.google.com with SMTP id d129so10872826pgc.9
 for <qemu-arm@nongnu.org>; Mon, 20 Jun 2022 10:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5s/+YW/vX1WwcuSwHWbOioATvoXW2euPDPUYkCg3zf8=;
 b=zznQRs1fTW5xZTmWQvugmL35dP2fkEUFzfmiY/JtJa3Xn+QiBlwjb0vhK9tsTrAbm7
 pfAArosd9aaQ0jVNZVTs9Mr3b/4JaSwr+ZCJU1166NYkHQ8S6N7kBH4v37lxelNhs+Dv
 1RErIcWZaKomyAoxZS7emEscry7ZD0phKrPAHXEP0vIBjodwQksVRSHmXGBKXAj+NdZe
 52LPMtGmEN9WZxuubR7kxbxpoVhptlQTbnQrnKMlf2f3lPlZPJ3aXNeokMe2dKHMTIS7
 KJHT6jp20lVQ9838Ue3J7GyA0nWRAAjH6117NB56yukV+4NKeZw72oXqo/TUEwGQh5PE
 /GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5s/+YW/vX1WwcuSwHWbOioATvoXW2euPDPUYkCg3zf8=;
 b=GxPNXQoiVgEI05fjwX5EnapczyFJbHgTtI1bNapJzcChLT+RvP2CKUcwspst7WOdTm
 LjFMXkmI8iT1FL1IYfY/l4bSOcI1hy/UhesR20w/Nq2MF27PmDpijUlXdmcP+ZrFiqyY
 cmVXD8pqgokxIkiOvC+e3B2RrTVeHSGIKrg22uYX7bqBTR6bsax2WEmA0pBN60/sBBaR
 peUMhszUZYpD8MC3DeraQHffkUtVqHskgdQg6PShmN6aFCkXTiXRGnqWO4mC4gY6MF08
 gsX2qeXD7L/YcD6IuB33KxJNgkaJKsBHPxzkWUUyTDVqamqzXMjc3MjlXTswbOwM8rsf
 cMCA==
X-Gm-Message-State: AJIora/qhU7w8xTAbbKedUKgqUb8JWUMQseAfr6wBWzAssfvht7J/J9K
 LhylABfnV/OQh744iw7H5pYNkYWbQiBTYw==
X-Received: by 2002:a05:6a00:1152:b0:4be:ab79:fcfa with SMTP id
 b18-20020a056a00115200b004beab79fcfamr25668965pfm.3.1655747562634; 
 Mon, 20 Jun 2022 10:52:42 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 07/51] target/arm: Add SMIDR_EL1, SMPRI_EL1, SMPRIMAP_EL2
Date: Mon, 20 Jun 2022 10:51:51 -0700
Message-Id: <20220620175235.60881-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
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
X-TUID: i6gK4+ZAOoZV

Implement the streaming mode identification register, and the
two streaming priority registers.  For QEMU, they are all RES0.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2072f2a550..bbd04fbd67 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6351,6 +6351,18 @@ static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_esm(CPUARMState *env, const ARMCPRegInfo *ri,
+                                 bool isread)
+{
+    /* TODO: FEAT_FGT for SMPRI_EL1 but not SMPRIMAP_EL2 */
+    if (arm_current_el(env) < 3
+        && arm_feature(env, ARM_FEATURE_EL3)
+        && !FIELD_EX64(env->cp15.cptr_el[3], CPTR_EL3, ESM)) {
+        return CP_ACCESS_TRAP_EL3;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                        uint64_t value)
 {
@@ -6408,6 +6420,27 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .access = PL3_RW, .type = ARM_CP_SME,
       .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[3]),
       .writefn = smcr_write, .raw_writefn = raw_write },
+    { .name = "SMIDR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 1, .crn = 0, .crm = 0, .opc2 = 6,
+      .access = PL1_R, .accessfn = access_aa64_tid1,
+      /*
+       * IMPLEMENTOR = 0 (software)
+       * REVISION    = 0 (implementation defined)
+       * SMPS        = 0 (no streaming execution priority in QEMU)
+       * AFFINITY    = 0 (streaming sve mode not shared with other PEs)
+       */
+      .type = ARM_CP_CONST, .resetvalue = 0, },
+    /*
+     * Because SMIDR_EL1.SMPS is 0, SMPRI_EL1 and SMPRIMAP_EL2 are RES 0.
+     */
+    { .name = "SMPRI_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 4,
+      .access = PL1_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
+    { .name = "SMPRIMAP_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 5,
+      .access = PL2_RW, .accessfn = access_esm,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.34.1

