Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1045903ejc;
        Mon, 22 Aug 2022 10:35:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR47bcl2E8gYm5AaJViuSTRS1/XNYsHRJO17Tb+FGc5OfmaHVZUNE4VYVH+XNJQ3YuNXWDJ+
X-Received: by 2002:a05:620a:220a:b0:6bb:2648:6df3 with SMTP id m10-20020a05620a220a00b006bb26486df3mr13559220qkh.290.1661189739914;
        Mon, 22 Aug 2022 10:35:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661189739; cv=none;
        d=google.com; s=arc-20160816;
        b=fBQi1VkPe/dpDIIQz7vWfoh1FTdDo0VSIfzm89CwTFigesDZ4XxwzYkyDbga3rLCts
         YsI0CRh69bZKfBTzYkc1m5zjM8kAdJV41AnkBYK69IMzb6WwxGYJn9OWQ/yATApIW7kP
         9W4BvYBHCwaiRbMh9l9YEVKHxqo7ALjXX89D9W4zhDbZWVv1Z8kzRD1TGUzNLWYr2sUu
         8wQzNM+mcmvVhjNuw8/nGEkMdhjLK7DgKeh066q7J0CVOqvQGhKb3WgbwppAMC24ZHyc
         yzdd7mx0mIN1pOIuX+Knc9COBXa4xF9qv0cz4t+WEPlS7gwQ5AOdPvTra3SEUo8GlQci
         MOiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dgGRXfqBRyRwvYaWW/xMoQ57AfJT2+cy/LziIxT5Jyk=;
        b=QVoY4YC+aHKTYjXZIlVoTAoD3zmzoXBfpvKyuzW7V8ROOHb9HcLOcSwHT7x7UagVZV
         H13l/KyvJaYJjLQd5THxGRTJCtjn7f2XWFmgKGGo5NK/+1qzGEBw80BC+xyD5Nsqk5n6
         IZ4oUhP+MA4jAfZNjhD2SphQsMyYm7nEy6klz2yugIE29AmP8cJ/EG/QVVJh7kPwvB/o
         3GUiy6BgNiXmJIp4l8bs0VdSMHS06Sii9F9jXKRBveNTRIDIXKsSFs327Kepn9mB2LhS
         34dhMhsZ6qJcy27AL9CShOriV/PQS6KzXkg/lBvNKUtxoov83LxZSUZBLOJ0Q2nte5oi
         JZ6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rEKsOcEb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020ae9c20b000000b006b66d9dd917si4403054qkg.117.2022.08.22.10.35.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 10:35:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rEKsOcEb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQBKr-0005Sd-G1
	for alex.bennee@linaro.org; Mon, 22 Aug 2022 13:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Ox-0004lT-Ky
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:43 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQ9Op-0001bb-8S
 for qemu-arm@nongnu.org; Mon, 22 Aug 2022 11:31:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso11663351pjj.4
 for <qemu-arm@nongnu.org>; Mon, 22 Aug 2022 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=dgGRXfqBRyRwvYaWW/xMoQ57AfJT2+cy/LziIxT5Jyk=;
 b=rEKsOcEbdGRtMJ/BQTJu4uv9iKaJuJxmXD7CJZBG2trWvgMc38DNYnE5p7KWyhyJ4J
 HfcKVlUkIpvUaHAv4L/gnntO6tN0WrUaBUl8Eu87QdT1USNHo5P8WZ5HjV96RMJNLXbJ
 UORpSX1giweIfqByBpJKRC3XpDwrIxvHDFfHes8GQrSxppXs0My4tu++93gZnE+n79LY
 F15F41/5HOzDFKhSOVGzN+pWpuYfjl+8FZume5L1HxIpOk6OAas16LfBV+SHwxxUqDS+
 XGo6lm8Copc5leuRYtIpsvff9uKmkRUb7IHA3iQ5+aiNHislx9QuKXLdhKbGgYcqQFpZ
 EX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=dgGRXfqBRyRwvYaWW/xMoQ57AfJT2+cy/LziIxT5Jyk=;
 b=L76XgFSNJPgIt6FYCZJRqm9Bpfo75n9I/pz0ijWiXBf9RxjSGadmiYPbAf0bqvwQO7
 eEguiKQAOMhTfK7MxL5UY/kxNqD5uhiLJOslebptdnzLoWfV1AyCw9VNreijuGYRWOHH
 qUfZVV6NwMBPZksrLKDCqaKuOzBNPK9PxQx3vUPAx7qQdnmtugbQT0SPyxekSm/aT27B
 Q8bK1R2fdZCBDsWXmnCGe5bLUvrGRNq+bmwAk4+Tr4/iZAIw8oqh1DCCOjFl87C0Cnqz
 6o3zZTm3yg1Ivy6gLjlXb7NSfWw6BcbO6VvDd6vfcj7V03n4CyC1UKPgy9JNDyMxEblP
 jTRQ==
X-Gm-Message-State: ACgBeo2v7cB5UHwoFGj5ln4dbJcP+1izdp49kPaEQKkrq0lwhPKNdGFZ
 1+ykBAi0gXWbvq+hK1lVGITMpg==
X-Received: by 2002:a17:902:c411:b0:170:91ff:884b with SMTP id
 k17-20020a170902c41100b0017091ff884bmr20767560plk.58.1661182294248; 
 Mon, 22 Aug 2022 08:31:34 -0700 (PDT)
Received: from stoup.. ([71.212.157.236]) by smtp.gmail.com with ESMTPSA id
 i6-20020a17090a3d8600b001f262f6f717sm10353835pjc.3.2022.08.22.08.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 08:31:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 59/66] target/arm: Move be test for regime into
 S1TranslateResult
Date: Mon, 22 Aug 2022 08:27:34 -0700
Message-Id: <20220822152741.1617527-60-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822152741.1617527-1-richard.henderson@linaro.org>
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
X-TUID: VY/F7/yNxUSE

Hoist this test out of arm_ld[lq]_ptw into S1_ptw_translate.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 7c44e7eadd..e898db8765 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -192,6 +192,7 @@ static bool regime_translation_disabled(CPUARMState *env, ARMMMUIdx mmu_idx,
 
 typedef struct {
     bool is_secure;
+    bool be;
     void *hphys;
     hwaddr gphys;
 } S1TranslateResult;
@@ -261,6 +262,7 @@ static bool S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
                         : env->cp15.vtcr_el2 & VTCR_NSW));
 
     res->gphys = full->phys_addr;
+    res->be = regime_translation_big_endian(env, mmu_idx);
     return true;
 }
 
@@ -272,7 +274,6 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint32_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
@@ -280,10 +281,9 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         return 0;
     }
 
-    be = regime_translation_big_endian(env, mmu_idx);
     if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (be) {
+        if (s1.be) {
             data = ldl_be_p(s1.hphys);
         } else {
             data = ldl_le_p(s1.hphys);
@@ -294,7 +294,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldl_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldl_le(as, s1.gphys, attrs, &result);
@@ -315,7 +315,6 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
     CPUState *cs = env_cpu(env);
     S1TranslateResult s1;
     uint64_t data;
-    bool be;
 
     if (!S1_ptw_translate(env, mmu_idx, ptw_idx, addr, is_secure, &s1, fi)) {
         /* Failure. */
@@ -323,10 +322,9 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         return 0;
     }
 
-    be = regime_translation_big_endian(env, mmu_idx);
     if (likely(s1.hphys)) {
         /* Page tables are in RAM, and we have the host address. */
-        if (be) {
+        if (s1.be) {
             data = ldq_be_p(s1.hphys);
         } else {
             data = ldq_le_p(s1.hphys);
@@ -337,7 +335,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
         AddressSpace *as = arm_addressspace(cs, attrs);
         MemTxResult result = MEMTX_OK;
 
-        if (be) {
+        if (s1.be) {
             data = address_space_ldq_be(as, s1.gphys, attrs, &result);
         } else {
             data = address_space_ldq_le(as, s1.gphys, attrs, &result);
-- 
2.34.1

