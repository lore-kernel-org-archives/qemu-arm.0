Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1530774ejb;
        Mon, 5 Feb 2024 19:06:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM+roqGjfckcA3e2lMx5Vtg18rcWZzOKhqvxl28xUpuSxF3eUIaSbNotz98vqgGkck1BbW
X-Received: by 2002:a05:620a:1a8f:b0:784:8c3:36aa with SMTP id bl15-20020a05620a1a8f00b0078408c336aamr1243891qkb.63.1707188788911;
        Mon, 05 Feb 2024 19:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707188788; cv=none;
        d=google.com; s=arc-20160816;
        b=IukjEzQZiu2Yp7z6LQ+bdoZlTUjLdFaSxxsyMVhueOA5ofj9vPcr+usazGeWHrf2Q0
         PkL4HVGGAJxnV0uVLzjM163H9VZv6yxYM//QTufJHwHEldaggMuTswPeCgvkyu5PHnlo
         mhzL1n24QV+yEM/m7Oa753yFxdOkgw5X9c5/zygJUgFUyLG1qZKTJqc7or3m38abcA6t
         AlWUP24k06ocjGVwHKRHVT2GoCloNr9xIHbifoeLKNhZsUrevPmtPvG8qUjTnH1jl5tq
         XRBg5ugu0dcF9cJTnMmDdRjTIdRn3TtPLYqNnOriiW5dT+xvjZEBNtfSaMBicHU8f6/K
         AnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tm00fo32ukKBaFGSugm65eVz3+HZdTUwSvO4kdDzRYM=;
        fh=m5fqlM79VaUY/SgOMWc7Ypmc/BYeWVRjpBTm6yTCVNQ=;
        b=rXpCGEeEkcgGG41FLHqFNbOwmFCxr6A5GGVjQl9Dy2Kl441A807nGu9H4UtAsaDixW
         HsJY3vEtPTcF7D+o1zMBwOMtZV9vLCcG/Ytnt7mfhqemlFQl5Z+uy51Leb2qMFcM5PK4
         AFOvxyD0xyD7pO6kCUEw4QE3im4o8hI6csrVZcEyMZExLDPi5NCMsuEGDON4o6EQiSRx
         Q0T5Vd1g5WaofpSCRQW8MvE6g5YSh/P+PjT3c+6yM1czLtc7YZGzHs93c8ZDiiYuxGwn
         SJGSDyBxdtrrMCPsOC0a3HdzXm5ui53o1tJTndLPOGrG+PpFdaDRf+GrLrblMEpqmzMl
         Le1w==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9eDtN+T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXAdrQsJ9qRJV8gea2JlhUfpLEZdNYItachUDQkGMmDqSN085ChH/3Hut98DmeBg7dcwRr/ShxGzmeSGuwwn0bJoHyGwo4Q
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020a05620a122e00b00783fbb2113esi1314210qkj.452.2024.02.05.19.06.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Feb 2024 19:06:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x9eDtN+T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXBmY-0006yP-Mn; Mon, 05 Feb 2024 22:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmV-0006wB-Ma
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:55 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rXBmQ-0003Jo-Ln
 for qemu-arm@nongnu.org; Mon, 05 Feb 2024 22:05:55 -0500
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-6e04ea51984so656140b3a.0
 for <qemu-arm@nongnu.org>; Mon, 05 Feb 2024 19:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707188749; x=1707793549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tm00fo32ukKBaFGSugm65eVz3+HZdTUwSvO4kdDzRYM=;
 b=x9eDtN+T0iAt78E0EV+sP9GWYQaBhJJ7jIh+RL8InKhzgP55imRHcUqoSr8CVbY7eF
 q8DvGfz3lBhpw6OqV5PVOLzdHtI6RYd3QuPI6U4264xmkQJ5GSZVXMx4fCxO8VSeAMPi
 3IHre6wIqPyxCUGtG7jdMgG6YCr8j+BpGQO59sGAWYTjsfHvGVdvTTD+iZHty0S/ddTm
 cdRZI0ssA+mypUPeeUzNAWAhNskwD/cjIE5VsOgtfyJFdp64xUnJoVcFWhj7QdcASrSS
 iO8n//PpqNyFkx6HLj/utUWkdqCt9y8Uiwg+Pmp5CYj0yNxOeTfRxCzok277oKSVHAJe
 +J/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707188749; x=1707793549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tm00fo32ukKBaFGSugm65eVz3+HZdTUwSvO4kdDzRYM=;
 b=nmi689OhKahmAtl5Ewp6ssahVvHgo5mvgUu554O1Aku64tZ+6kQhFFTk/ytmhkMSBZ
 KuU4dWNtJZXmP01/skgeFwpjITP3m7QitbQ31WB1QTHytX5fu5w5XKGbN1Hq7xe3sGvV
 WeT3k1oqZuKgMCykv6ED/iQcoyU37n/IQD26DhC2AAiS5DaeryMGkhxy3hxTYny0OvkW
 xIvMHWwjx0hgHbalR61daAmOAvIGbUHT3/ZnMSF9P6I/BJOBmM19zcjepoV0wSp+CLAP
 hHEDkzYkm0SBuo76sk4OYyI5H3bCbhyLoX9Oje2mtBOcx19hAdI62KLP1hZnUzG8dHzu
 K5Cw==
X-Gm-Message-State: AOJu0YzD4ElSa4bDjxdFACsqMBsqw04RCJRU4NhcP5A7WE1cD6qTQhN7
 M2dHA1Yxlc3uDmIPUaPdWq9FrzVbO+0G2mrkiX1m2VTydlF7sZJL8Xfz4Xn7iws=
X-Received: by 2002:aa7:874c:0:b0:6e0:5424:6b3a with SMTP id
 g12-20020aa7874c000000b006e054246b3amr987791pfo.11.1707188749199; 
 Mon, 05 Feb 2024 19:05:49 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU1Y4di2MPgGrpFmen04hrz1M+h89gix+A0v+6dXJzquMB0uqGKoV2Fa1HA+jUoqhgZVTLR3TNZFwjnm8/gD60yh5/VD//MS4rM
Received: from stoup.. ([43.252.112.200]) by smtp.gmail.com with ESMTPSA id
 r14-20020a62e40e000000b006e025030700sm627478pfh.190.2024.02.05.19.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 19:05:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	gustavo.romero@linaro.org
Subject: [PATCH v2 6/6] target/arm: Fix SVE/SME gross MTE suppression checks
Date: Tue,  6 Feb 2024 13:05:27 +1000
Message-Id: <20240206030527.169147-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206030527.169147-1-richard.henderson@linaro.org>
References: <20240206030527.169147-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RM0tjsVTCgCt

The TBI and TCMA bits are located within mtedesc, not desc.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c |  8 ++++----
 target/arm/tcg/sve_helper.c | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 1ee2690ceb..904bfdac43 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -573,8 +573,8 @@ void sme_ld1_mte(CPUARMState *env, void *za, uint64_t *vg,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
@@ -750,8 +750,8 @@ void sme_st1_mte(CPUARMState *env, void *za, uint64_t *vg, target_ulong addr,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index bce4295d28..6853f58c19 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -5800,8 +5800,8 @@ void sve_ldN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
@@ -6156,8 +6156,8 @@ void sve_ldnfff1_r_mte(CPUARMState *env, void *vg, target_ulong addr,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
@@ -6410,8 +6410,8 @@ void sve_stN_r_mte(CPUARMState *env, uint64_t *vg, target_ulong addr,
     desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
 
     /* Perform gross MTE suppression early. */
-    if (!tbi_check(desc, bit55) ||
-        tcma_check(desc, bit55, allocation_tag_from_addr(addr))) {
+    if (!tbi_check(mtedesc, bit55) ||
+        tcma_check(mtedesc, bit55, allocation_tag_from_addr(addr))) {
         mtedesc = 0;
     }
 
-- 
2.34.1

