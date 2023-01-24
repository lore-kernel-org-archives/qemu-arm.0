Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3294698ejc;
        Mon, 23 Jan 2023 16:02:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvvRspUYu1gYfdahtlqBbgq14bt9F0ohapGWu1FJ94Igf31HKyR7yk4RL5Xozsp3A+3H8Ln
X-Received: by 2002:a05:622a:508a:b0:3ac:77ed:3995 with SMTP id fp10-20020a05622a508a00b003ac77ed3995mr33577574qtb.26.1674518544770;
        Mon, 23 Jan 2023 16:02:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674518544; cv=none;
        d=google.com; s=arc-20160816;
        b=c1qQtr19RuuNWuxxNbqxavHY6LMpmpD+wE/feRGD/WogvYGoT183szFjIXQYCQSHYu
         mugq9MQDagabNohyH4vlGhlW3RNimkh1PJ0yzpJRrxIHGL8/oMUf2a4lyCDATOZjb0e6
         PGQaXWiPcJpVef575bdONd5lWpJX+VU4ot99AM17jpMl2bVnWogHceAL5SqmpxwyzVXq
         DySTN7zV/CsUIpOQ4h2KgJVTdpxdMgPlseQwvDmlemigqD/4xpay10d8rTqkedZEVA2s
         FOeLqeYI/F3gK7AkeLV27FBCfSjx5Vbgdae569ysV+wbr/jfbskogEq/uaaOwNGxzrMw
         7Zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HLC1b+miMYKSFpzmpb6sjN/lCOjEj7YzmRL1GMfHWWQ=;
        b=B+5P0b26Z4DYQfhh4HduetGESWHGhP0Ah4LB9BBjxHhDzAZ4nUfS9hDCB2vWfbO8dK
         qMdvY5UEYDARmjYqokxPhKwSZrzTCMLGd7Adlc4N9QZ/zqEGXVLxlLMYxpqUvM1c7Hj/
         SwJyiL8/LL5MsUps4iuL3KLE/8kwPPhoNkAxMjSFHMDWPlw4g47k8YP6of3MzdhK403A
         sKJLUnMUb26y/i+LU0OvW8f/G3CZrH6qpcqxWx69Fgt3C4+JZNZY0qylHQ6uAynhvPFV
         sFw1uG53J7ZD4JDVJnXctOpZOgSPdWKWSklXNNh5R40REeyhH+zAe/n8qQ/fLqpIbf2g
         Z/dg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=va0D7Jo3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e4-20020ac84b44000000b003ac3ee781d3si311981qts.36.2023.01.23.16.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 16:02:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=va0D7Jo3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kZ-0000wy-MA; Mon, 23 Jan 2023 19:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kY-0000pc-Am
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:18 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kW-0001xx-22
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:01:18 -0500
Received: by mail-pg1-x534.google.com with SMTP id 36so10228464pgp.10
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLC1b+miMYKSFpzmpb6sjN/lCOjEj7YzmRL1GMfHWWQ=;
 b=va0D7Jo3HJRLKp7iICozOQigBIOgZRTIFMFFeG9lisAzsWlinksVjz7mmXIMXvlc8R
 aplebvAWzoNq5Soc4bU0qn3Jyi0Xcx1NOoE4E9E4Hb5V4jbv0RfE0uA9uc2BTraAC/4n
 ROJbbDFHY8W0gYYnqcqd6RaFPZxHg+qbsAAK7rwQHzOUb/g9zP4a80ZQ71S53C3/vxf3
 S2CTTgWLyLAB8RoCBTTDgkH8STKWX/8FyHnIXugw2WgWEtbPPxLFG3Vwc1IFR9G7HIex
 ZyNSwNaR6Khi9mMZOusAHbwJLKtwF01K/LZZjJKyW5kTFFHdZ+MTi8Xohc3jd6MXWwoC
 8MsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HLC1b+miMYKSFpzmpb6sjN/lCOjEj7YzmRL1GMfHWWQ=;
 b=C1OGrOBC6bZfu9gOtR4ggJOKkzOQR7x2xC9NLyrQEKMkqGSPWUECkMMDcrhXfq4ks0
 T84klhYwLjhwbS1pYhzSkofXDxUZV5ipNyuH7NTbggzk81Qs7HqoPbNP5S/+jBO6YBWs
 rxI6TjjWWi2WYQwpo1+KC+BDqCUmZgNaFmDnsMxFIxOIhevUmHEXmZxHmmvr1Vqu2/9/
 D7apAyOgbxdEoEQ8/Rj1wWLh3vKL9vdqifjeE1MWybViq5dL0wiAZ0Dql43EZZzqvzVy
 DTzwICqI4AK/2BMaxSp22iq7LOljZBmcAOK1FJvX9DYilMn13qWLrxO8IMzkjfolL46a
 yoMQ==
X-Gm-Message-State: AFqh2kr3UtnooqB+K5UZijEQVk1ZP0KLP3gfzTEFjZ8SA7Pd1jNTUB4q
 j3c2nQ2Wx5lxZYAH9CdCY95auRoiRGfbPDxP
X-Received: by 2002:a05:6a00:438d:b0:589:8fac:cfe5 with SMTP id
 bt13-20020a056a00438d00b005898faccfe5mr26236608pfb.13.1674518474227; 
 Mon, 23 Jan 2023 16:01:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:01:13 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 16/22] target/arm: Move s1_is_El0 into S1Translate
Date: Mon, 23 Jan 2023 14:00:21 -1000
Message-Id: <20230124000027.3565716-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wABGGTU6HbDZ

Instead of passing this to get_phys_addr_lpae, stash it
in the S1Translate structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 37f5ff220c..eaa47f6b62 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -22,6 +22,7 @@ typedef struct S1Translate {
     ARMSecuritySpace in_space;
     bool in_secure;
     bool in_debug;
+    bool in_s1_is_el0;
     bool out_secure;
     bool out_rw;
     bool out_be;
@@ -33,7 +34,7 @@ typedef struct S1Translate {
 
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
-                               MMUAccessType access_type, bool s1_is_el0,
+                               MMUAccessType access_type,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
     __attribute__((nonnull));
 
@@ -1257,17 +1258,12 @@ static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
  * @ptw: Current and next stage parameters for the walk.
  * @address: virtual address to get physical address for
  * @access_type: MMU_DATA_LOAD, MMU_DATA_STORE or MMU_INST_FETCH
- * @s1_is_el0: if @ptw->in_mmu_idx is ARMMMUIdx_Stage2
- *             (so this is a stage 2 page table walk),
- *             must be true if this is stage 2 of a stage 1+2
- *             walk for an EL0 access. If @mmu_idx is anything else,
- *             @s1_is_el0 is ignored.
  * @result: set on translation success,
  * @fi: set to fault info if the translation fails
  */
 static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
                                uint64_t address,
-                               MMUAccessType access_type, bool s1_is_el0,
+                               MMUAccessType access_type,
                                GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -1596,7 +1592,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
             result->f.prot = get_S2prot_noexecute(ap);
         } else {
             xn = extract64(attrs, 53, 2);
-            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
+            result->f.prot = get_S2prot(env, ap, xn, ptw->in_s1_is_el0);
         }
     } else {
         int ns = extract32(attrs, 5, 1);
@@ -2819,7 +2815,6 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
     bool ret, ipa_secure, s2walk_secure;
     ARMCacheAttrs cacheattrs1;
     ARMSecuritySpace ipa_space, s2walk_space;
-    bool is_el0;
     uint64_t hcr;
 
     ret = get_phys_addr_with_struct(env, ptw, address, access_type, result, fi);
@@ -2844,7 +2839,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         s2walk_space = ipa_space;
     }
 
-    is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
+    ptw->in_s1_is_el0 = ptw->in_mmu_idx == ARMMMUIdx_Stage1_E0;
     ptw->in_mmu_idx = s2walk_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
     ptw->in_ptw_idx = arm_space_to_phys(s2walk_space);
     ptw->in_secure = s2walk_secure;
@@ -2863,8 +2858,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
         ret = get_phys_addr_pmsav8(env, ipa, access_type,
                                    ptw->in_mmu_idx, s2walk_secure, result, fi);
     } else {
-        ret = get_phys_addr_lpae(env, ptw, ipa, access_type,
-                                 is_el0, result, fi);
+        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
     }
     fi->s2addr = ipa;
 
@@ -3040,8 +3034,7 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
     }
 
     if (regime_using_lpae_format(env, mmu_idx)) {
-        return get_phys_addr_lpae(env, ptw, address, access_type, false,
-                                  result, fi);
+        return get_phys_addr_lpae(env, ptw, address, access_type, result, fi);
     } else if (arm_feature(env, ARM_FEATURE_V7) ||
                regime_sctlr(env, mmu_idx) & SCTLR_XP) {
         return get_phys_addr_v6(env, ptw, address, access_type, result, fi);
-- 
2.34.1

