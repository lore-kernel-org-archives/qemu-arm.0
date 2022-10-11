Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2886221ocg;
        Mon, 10 Oct 2022 20:27:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5dbAacDNt/lSPmBzkqMJ9mwHxbWiTALsDwtMjbRZizFFnl+SV2XiBKIs2wItSxKYPPKDGV
X-Received: by 2002:a05:620a:4919:b0:6cf:5a4c:e3a3 with SMTP id ed25-20020a05620a491900b006cf5a4ce3a3mr15019855qkb.309.1665458866708;
        Mon, 10 Oct 2022 20:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458866; cv=none;
        d=google.com; s=arc-20160816;
        b=oOBHKo8qajYy4iNHCfzlUxL/wjKGUY7+CTTgOtjQPfHio/nTIxQ4oQy3Ycu2Z+RlDD
         div8C8W8Nnl4rL9mmiYy3+sY9W2aV5d8hZNlcd8f/6pKUI0dVzqpjBbqkH7VFsH2ZYj6
         N+aV7mK7wb30V/50hgD6yNS/oWcr7G/YSzZlp/jn9FU3kD7lm9jQ9HbcslfxbfKfApFA
         Uz40b/hoM4uwLFYSeiJVIGbLmQLZYj/26mAkkSt/kT+SnLCMXzjcFUWkn21FWe5l1VGp
         ub6t+vSLOmzdjFyvx7fltlN5xqIodyCUKj/vu17n8BlrPLUUuoz6hxLcpnZ3naEkhiAc
         AZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dJuTd0SPwgfrCTEDatav1bD/h1Bh2C4XRFMrqpA+5GE=;
        b=eyizhLXPYuEyx9vtDRGoc5FnDq66DC+DDv14yvSsQt9jKa936A4zSjCNehfjHuTKtY
         w1eVbsxwZAHs7lUa5BTBkFjIHqthp6V6rD34B2+ImEqJ8IAJE/Y//Hf+4UX76v63786m
         iHE869C7sFen5mHmXtZYmHHodAWLzbST74ixAmcr39NUF1SLO6AJoTtTwC7NmHamTa5g
         WJ3PX/f9kwxxq2r7YIH4XVO34ASF9Ge4Oin0x+l/jiuXnd0xDGOpfYClzlXNs07bvpoJ
         ZEoJMRgbCszzJJbea4tA+UZ0fgzAOzVDkUbZYr2tzU9+yVhlP59d/QGvShhdiCyHq3j5
         H48w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpmd92Cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05620a136200b006cf4d30dd61si6039298qkl.542.2022.10.10.20.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:27:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zpmd92Cv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5vm-0000M8-9B
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:27:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ns-0002OF-Rn
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:38 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:44583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nm-00031m-Uw
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:36 -0400
Received: by mail-pl1-x62e.google.com with SMTP id x6so12000039pll.11
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dJuTd0SPwgfrCTEDatav1bD/h1Bh2C4XRFMrqpA+5GE=;
 b=zpmd92Cvkk6YDZoie7K9QJDeyE8WWXtXCnW+EKJIXtW27KFZVnrgz3T3oL3ytifYU+
 UGe9RFZYBDR7Iv3eGHitfUQy2YGBwoJxU0LdUxduEmMqjdSZ4APc9BWMs3DVC8mzXsAC
 RHdAGEJpIzpcYaQ+4QwFFeTeTuwlaRsAK60IvcKA5GENdo89ZlykR/m+/hlThwurOIP8
 b96CNzfLQ4AhquU8/q2+L86baNci2IHlQcY7rBi5kZ8ZXgi8EfROnsoPo/ZGZ1XoEZOa
 k9495FB5vCrT1yyhG9o9dB3bNOyF8SeSHgdaBJI/4jTA6WRCsiti9KC7OLcAie0TUvdb
 r6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dJuTd0SPwgfrCTEDatav1bD/h1Bh2C4XRFMrqpA+5GE=;
 b=t2aIS+n5O1w7Zt5wl3DFptLY7I6121/ImBcZuzH7HTuCkCcbNPWy9qOqZDl1X7HO2H
 kIstsYolWMEdudTKEOWUqZmodewCk7p5QuwO7S4PxRA8jE5+iTMd2tamgYbby1LPQiq8
 4Ks4kmWBxw2vAgZJMETrUQDfUP9+qXqAvo/Qx/SZnyFqcuzQ9f5n11bGKeeqPwAG1EAs
 pOeRX3/MGfZ45FtjttgOyCf41LQ2aPXTEpW/ltR/konxmwMfO1i+Se9rfIiSQDtKzhSd
 Y5cZMetKr+d5p7mTddmjtfq/puk7p1x/dH2Y4mMHBEPJVFIXvmZldhtvqbw5OIvEw03e
 PgzQ==
X-Gm-Message-State: ACrzQf1pPfXRlljpgnr/qEwphT2fgyo+NnLxmEpUcH0EfZqVPF83J+EF
 Vmsqn+d3Wni0qN0ZSPy79zWxNtZEU2zkVA==
X-Received: by 2002:a17:903:41ce:b0:182:a32f:4dde with SMTP id
 u14-20020a17090341ce00b00182a32f4ddemr7197864ple.47.1665458368864; 
 Mon, 10 Oct 2022 20:19:28 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 09/24] target/arm: Move be test for regime into
 S1TranslateResult
Date: Mon, 10 Oct 2022 20:18:56 -0700
Message-Id: <20221011031911.2408754-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Y3dzLxrgXXZ

Hoist this test out of arm_ld[lq]_ptw into S1_ptw_translate.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8fa0088d98..c58788ac69 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -19,6 +19,7 @@ typedef struct S1Translate {
     bool in_secure;
     bool in_debug;
     bool out_secure;
+    bool out_be;
     hwaddr out_phys;
 } S1Translate;
 
@@ -277,6 +278,7 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
 
     ptw->out_secure = is_secure;
     ptw->out_phys = addr;
+    ptw->out_be = regime_translation_big_endian(env, ptw->in_mmu_idx);
     return true;
 }
 
@@ -296,7 +298,7 @@ static uint32_t arm_ldl_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
     addr = ptw->out_phys;
     attrs.secure = ptw->out_secure;
     as = arm_addressspace(cs, attrs);
-    if (regime_translation_big_endian(env, ptw->in_mmu_idx)) {
+    if (ptw->out_be) {
         data = address_space_ldl_be(as, addr, attrs, &result);
     } else {
         data = address_space_ldl_le(as, addr, attrs, &result);
@@ -324,7 +326,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw, hwaddr addr,
     addr = ptw->out_phys;
     attrs.secure = ptw->out_secure;
     as = arm_addressspace(cs, attrs);
-    if (regime_translation_big_endian(env, ptw->in_mmu_idx)) {
+    if (ptw->out_be) {
         data = address_space_ldq_be(as, addr, attrs, &result);
     } else {
         data = address_space_ldq_le(as, addr, attrs, &result);
-- 
2.34.1

