Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp3754851lfh;
        Mon, 23 May 2022 13:51:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFAtxBgk3WpXEiSgarzB91oTlM+BW6Y4O0ZTogeFOuuQJYuI8ctFVg7unW8cpVSXs+SoDr
X-Received: by 2002:a05:620a:3722:b0:6a0:26ed:41e7 with SMTP id de34-20020a05620a372200b006a026ed41e7mr15306139qkb.422.1653339111307;
        Mon, 23 May 2022 13:51:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653339111; cv=none;
        d=google.com; s=arc-20160816;
        b=DkaCivKlEoKaJwSyEw26fzsBTzzkPTb33XIV+aitHq78wErmhBWnSf0A9XMBbtVh5r
         uRusXfolhevlADHcLv4vL1eS0xuAO0UjW5bgkdG653WfXGOCgB6/Ufc5tU48/D1eFdLD
         dmp2Q6lddHX3hwcEjycXL94LKB72TRTGYic5d7t3E+gPxypm9Ux2FN9xcI8cUhW0X8qh
         eIOjZM3G4oHGB1PAl+ex8Q2yu0+S0YT7/R4nkS4arTVmtZLEygUhKq6BgT/m+m1zLHb6
         LyZkM0baa12Yjx+tbMV49rTkohfOFT0WBZudDtS3BJyVCaqlYGCz9ivk1gTvsrG0sY8T
         65Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MX1GOuVouWu0Qr0+DdSMTNcH8UOwJjn/VDcrD/8BMow=;
        b=Vx+nY0U/5iLUyZ8ktncLsJvrJaU1ixOAuNoZoan9XJdra5fqG5tikcU5uRNVwaYO+G
         OLxkoNcSd4ZA1AlZVyonda9oEC8bHd/9aqDMvMKcfp1FwH10p2xNkZC0bVYMzCgcGQVl
         qUzaEcn8oPyLLQeqOUike9n1iXvweL9lXYsAWHFMz2g3/xBF+SPJQbzOF4ldzFKB4c5B
         t9e82gFN1zkWR7kNoYuhzvDF0iBPXqNDo6quCSM/wQ8A2TViN1RUPC2gjX9y9wNZPmm9
         NRomkUdrXuVCFOcRUQoPHhJFUDJrgRWsrPWoMKoFL+3eU5GdVOib+GI0raRX55PKAkTS
         32iA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eLQDQRKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t79-20020a37aa52000000b006a33ac276f6si2895140qke.754.2022.05.23.13.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 May 2022 13:51:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eLQDQRKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ntF1q-0005sh-PU
	for alex.bennee@linaro.org; Mon, 23 May 2022 16:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy0-0008Dq-89
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:53 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntExx-0004zn-5a
 for qemu-arm@nongnu.org; Mon, 23 May 2022 16:47:51 -0400
Received: by mail-pg1-x52b.google.com with SMTP id c22so14676494pgu.2
 for <qemu-arm@nongnu.org>; Mon, 23 May 2022 13:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MX1GOuVouWu0Qr0+DdSMTNcH8UOwJjn/VDcrD/8BMow=;
 b=eLQDQRKBRxW8MeBz6zb6ZMyYdWo+28EiNR0n1eORp186evBDWesuRACOX3Llbjh+XV
 ztsGcTODkuTm1zLOkPezGWlw4ee09NSa0+EUrj2tY9PD3ylf4JkA2zDjeUItTrz0P7xI
 s48p4HGqnbhYqbAgm2uxhZoOAJnr3DvH9BwTTGJ83fPPZA7qALKfLNXVcOambYzi3Jmb
 kPzb6TyrFnku9JxL1nAiDjF+c96Wx9NSeF4K6AeZhD9sXrzvFJkNg4yo0AId8XCHt9Pb
 /b675T1DLyMQoE9mmrtCQLMvLY2SzHfjFDIs1zuq+QdDfSfp90J9w1xjUxWJoXBvfQZf
 BDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MX1GOuVouWu0Qr0+DdSMTNcH8UOwJjn/VDcrD/8BMow=;
 b=PwVK8YLKbJRzdhxMtrpH3Oi7oxQlzPkW5uItVol34oGbba9w/U1UScr7b8HeNsIImQ
 j3rn6Es5dvoyoCG483Nx+ek7jYWvuc55vNzkGM3VuLjfXN3JUjqKS7MzxG1McuCxyDPi
 UXruBs889tyFHS5PHhmiqLVsqtoZUEEmrdJ2jVsHMJWUTscI55TnAfB4UxqxL52j//jj
 +xqpLLEAF4YvspJ36zpahUAGpOf3oc3OI4JC4tMm1mao6VemfA1iW2PbaU9PTlivKb2i
 tahFmbfqjSPcI1YotpI/f+1LFLeF4YsQ1YXbtNPNTfyG5w05UlY4X4H1M4Lv/QPoR8Ho
 kXXA==
X-Gm-Message-State: AOAM533kyGWhxD/PpvePFH7inDzOPrT0yrRV5+/hPLImRNdBs3Xj3+E9
 wzpcvMLzDlwQdgpWfC6Xhze1jw==
X-Received: by 2002:a63:dd4c:0:b0:3fa:a80e:8ba0 with SMTP id
 g12-20020a63dd4c000000b003faa80e8ba0mr269410pgj.167.1653338867855; 
 Mon, 23 May 2022 13:47:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:47:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 04/18] target/arm: Move HCR_TGE check into exception_target_el
Date: Mon, 23 May 2022 13:47:28 -0700
Message-Id: <20220523204742.740932-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: J/eBCUVb8JyO

Move the TGE test from raise_exception into
exception_target_el to consolidate tests in one place.
Note that this ought to apply only to origin of EL0,
but that cannot be confirmed at this time.
Update the AdvSIMDFPAccessTrap doc reference to DDI0478H.a.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/op_helper.c | 47 +++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 19 deletions(-)

diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 6858b8980d..55440dfa84 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -30,17 +30,39 @@
 
 int exception_target_el(CPUARMState *env, int cur_el, uint32_t *psyn)
 {
-    int target_el = MAX(1, cur_el);
+    /*
+     * FIXME: The following tests really apply to an EL0 origin,
+     * not to a target of EL1.  However, the origin will never be
+     * EL1 for these cases (no aa32 secure EL1, can't enter EL1
+     * with TGE set).  Delay fixing this until all places that
+     * might perform MAX(cur_el, 1) are audited.
+     */
+    if (cur_el >= 2) {
+        return 2;
+    }
 
     /*
      * No such thing as secure EL1 if EL3 is aarch32,
      * so update the target EL to EL3 in this case.
      */
-    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3) && target_el == 1) {
-        target_el = 3;
+    if (arm_is_secure(env) && !arm_el_is_aa64(env, 3)) {
+        return 3;
     }
 
-    return target_el;
+    if (arm_hcr_el2_eff(env) & HCR_TGE) {
+        /*
+         * Redirect NS EL1 exceptions to NS EL2. These are reported with
+         * their original syndrome register value, with the exception of
+         * SIMD/FP access traps, which are reported as uncategorized
+         * (see DDI0487 H.a rule RJNBTN).
+         */
+        if (psyn && syn_get_ec(*psyn) == EC_ADVSIMDFPACCESSTRAP) {
+            *psyn = syn_uncategorized();
+        }
+        return 2;
+    }
+
+    return 1;
 }
 
 void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
@@ -49,21 +71,8 @@ void raise_exception(CPUARMState *env, uint32_t excp, uint32_t syndrome,
     CPUState *cs = env_cpu(env);
     int target_el = cur_or_target_el;
 
-    if (cur_or_target_el == 0) {
-        target_el = exception_target_el(env, 0, &syndrome);
-    }
-
-    if (target_el == 1 && (arm_hcr_el2_eff(env) & HCR_TGE)) {
-        /*
-         * Redirect NS EL1 exceptions to NS EL2. These are reported with
-         * their original syndrome register value, with the exception of
-         * SIMD/FP access traps, which are reported as uncategorized
-         * (see DDI0478C.a D1.10.4)
-         */
-        target_el = 2;
-        if (syn_get_ec(syndrome) == EC_ADVSIMDFPACCESSTRAP) {
-            syndrome = syn_uncategorized();
-        }
+    if (cur_or_target_el <= 1) {
+        target_el = exception_target_el(env, cur_or_target_el, &syndrome);
     }
 
     assert(!excp_is_internal(excp));
-- 
2.34.1

