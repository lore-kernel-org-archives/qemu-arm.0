Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2886196ocg;
        Mon, 10 Oct 2022 20:27:41 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM47BS7WTlpAVsQ8l/E/IpxVFrKlqLwwCtAHxhyxcEiLl1SwiiMgWBBiMnIY3k1ZtOrq0OMJ
X-Received: by 2002:a0c:f054:0:b0:4b1:709a:2051 with SMTP id b20-20020a0cf054000000b004b1709a2051mr16995473qvl.0.1665458861403;
        Mon, 10 Oct 2022 20:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458861; cv=none;
        d=google.com; s=arc-20160816;
        b=sul3MG90bSHQMl/YpQmJm1FlgpNu+Jnyma7vHb4R8vFvu2Hsn480VBCiCSdxqFB39e
         tO1uwjkDUD1DfBnEwccEgRFXLyGsnBvWORWukHrNpIT8G1PYrMn47k58kdXbqpeONpTW
         4i1gZXKwtXXliegBThuMObeWkiynsdFjEO/JNpckSnQAoPAZGmwe0YHR7i6WUT5PUSnS
         kwMrUEgOkf0BhBj06Z8fg9j4MaiuLP43z7QbJO1zu8n537ZwBMzqYGL0fH1LYRibMMjU
         Pjz2FalGkrW5Bgmq5JzpMpwN0Mkq/SbxYm6/5drolaryi/lan8cMUEYfRJ0tnlbWWH24
         OQEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yLLkCOK7bzChQB4VCn3LE0QgfibyZ4Lat7LyMKKGuQg=;
        b=CUOn+W9IJQj2j5jfBNH9Q0L9afxBLfBGtZ91tuug3yQ7P/mytep22lpDjkpW87R1oj
         7SLhU1Ktzt+KWcAvgnLEfaqnNyHISwSsPfyhvZY7rdM8V0kvRXrAI0+mIeNpzsIUIBXo
         fGoaqpVeCEp9BqDD8xhST+iEHUm/wgI7I/KwxUu7pZ5yEOy7rDmtZQvp5oc1rfMPOafS
         M1hZYZr98ZuWuJcOax8utmzgtkPWKlbakwJE8s4P11mOWFZhL4mYoN7na0RsNqP3GNgs
         8z+3R4Ur0ef/ZseZqiQQtk64xEqLEqf6L5dmhXrtVe87a/L6aj+3svGQUcBD6JZ5A1EO
         9rEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bsWsWIg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cm26-20020a05622a251a00b00397e910165esi2228819qtb.417.2022.10.10.20.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bsWsWIg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5vg-0008UA-VL
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oG-00031i-7b
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:20:00 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5oE-00039k-Mz
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:59 -0400
Received: by mail-pf1-x433.google.com with SMTP id y8so12320809pfp.13
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yLLkCOK7bzChQB4VCn3LE0QgfibyZ4Lat7LyMKKGuQg=;
 b=bsWsWIg+qvdmH6FWPNsiw35tXhii6WawZXObtX4Y9u38J9yJqYVoYz+gzgdc4uiOX3
 lYkmgMIV+ah86H0FDuqZA0NraW+B1ZlBYNsyC5BuFpUzG9d+hyr4ok3VQViczYeyoSpA
 lVoApaw6T7Uwsa0AnkItZ191LCNsr17FgFZ4FU/KI4mBMwv+ndU7DfGd+oK/6uBje8/G
 YGu9jZR5g38NPfnMey+xBXk35EqBpZ7jASQgI1Op8iLfekFghhXklDurGbnNbptbKAIg
 GMXzsbNG9X4HJkkQ3tZPlVB7GgUx2Xq3vIIeVggl2r39xMnINnqfRuht46ADS5MDDKgo
 nsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yLLkCOK7bzChQB4VCn3LE0QgfibyZ4Lat7LyMKKGuQg=;
 b=57q/Yc+2K3y8CPvM9rkP2ASNBA406Oq5Rl+SRABg6OM6UTCpw6DDLuqFG5U7b/boDX
 KjU1yoY3OcWMKwGVkcI0oDA7GDuNMg1G7KQp9qgW15Z+Ur29Bvwommd1eOnGk3SBHaZh
 33HNrHf3PIOF44NIwc+GIOtUoaqAkPe4EtXzNd/susGp6WFI5aYa6un7+O/eR7EjIBqr
 JFVG4gOtx1JuSrdfnuqkesiBsU/BbzPsjO+i9/68RXhc/tVOIEgTEQ39uKMeIyDd0WOQ
 GF/LpKpDdx1yM9kd4StqLzFJ5E0JuisSZcilWsGdWyxg6XVDNPIvNFXQ2mbau8Ak5YYk
 qemw==
X-Gm-Message-State: ACrzQf3MyfMQmiync1RiKJkhhpyJJ3ashUuArv+P67xgwQaBdbZK4vQX
 MJakXAEcwqCrCt1U8be1OfqTVg==
X-Received: by 2002:a62:144b:0:b0:562:38de:9a0e with SMTP id
 72-20020a62144b000000b0056238de9a0emr22981955pfu.78.1665458397156; 
 Mon, 10 Oct 2022 20:19:57 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 21/24] target/arm: Consider GP an attribute in
 get_phys_addr_lpae
Date: Mon, 10 Oct 2022 20:19:08 -0700
Message-Id: <20221011031911.2408754-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
X-TUID: NP9owgUUw9a/

Both GP and DBM are in the upper attribute block.
Extend the computation of attrs to include them,
then simplify the setting of guarded.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 2227d2a2fd..8db635ca98 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1079,7 +1079,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     uint32_t el = regime_el(env, mmu_idx);
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
-    bool guarded = false;
     uint64_t descriptor;
     bool nstable;
 
@@ -1338,7 +1337,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     descaddr &= ~(hwaddr)(page_size - 1);
     descaddr |= (address & (page_size - 1));
     /* Extract attributes from the descriptor */
-    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(52, 12));
+    attrs = descriptor & (MAKE_64BIT_MASK(2, 10) | MAKE_64BIT_MASK(50, 14));
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
         /* Stage 2 table descriptors do not include any attribute fields */
@@ -1346,7 +1345,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
     }
     /* Merge in attributes from table descriptors */
     attrs |= nstable << 5; /* NS */
-    guarded = extract64(descriptor, 50, 1);  /* GP */
     if (param.hpd) {
         /* HPD disables all the table attributes except NSTable.  */
         goto skip_attrs;
@@ -1399,7 +1397,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
 
     /* When in aarch64 mode, and BTI is enabled, remember GP in the TLB.  */
     if (aarch64 && cpu_isar_feature(aa64_bti, cpu)) {
-        result->f.guarded = guarded;
+        result->f.guarded = extract64(attrs, 50, 1); /* GP */
     }
 
     if (mmu_idx == ARMMMUIdx_Stage2 || mmu_idx == ARMMMUIdx_Stage2_S) {
-- 
2.34.1

