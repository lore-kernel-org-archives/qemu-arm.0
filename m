Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1256823dyc;
        Fri, 4 Jul 2025 07:33:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUvV3arFHVQ3uF9ahFdaCcrhy1zTRnQv7H3iUmGj8qqOcR9hTTp4O2WetTMiMVY10xcObnGmsR5JZsrWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEroYJbDWaS6KrLigNXT3/82p9yFxbzqfBncZrTMwkNUfjwnfQRMXF5G6e8nz/WwZAJI+wr
X-Received: by 2002:a05:620a:24d6:b0:7d3:ed4d:44ca with SMTP id af79cd13be357-7d5ddb1cda4mr396498585a.2.1751639623553;
        Fri, 04 Jul 2025 07:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751639623; cv=none;
        d=google.com; s=arc-20240605;
        b=bVhfbFyEYxHtiuzkRATtlrp783RL9SPX3i5r1gmK2s15/+lUTxxchhHzMaGBh3D1fa
         v6kN8+kNIJIUzZS3SfBkbt+1trdvemy5k3C347hQLMwJ3BwPrkZV2pKBsajZMGl0FtwE
         ogcTNpcw6CjCo8MYsVLEGVXFdHWZeo9EB2a9CfmWzfDM3GMXS5WBtNTubmpwghdELh8r
         +T041Cw0dWZ61WCb34wvAa6N1MexJE/ghANsHKaLqhGbI1/rD0ScKL3VR4/1DP3K71Rt
         UMQ9Fp+RHycXUDwQukRdZgYGjbQIuS0bEnVa5Wlzbi5gmot5XOkOn45L9n5J0DsPpuJb
         eRAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/H2t34ohcFGW/1kwGrNHnmjU3igen0lRkevftL37hWY=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=NmtsMnYSUhvb8nMlyjT4ed1KRueQ1BTTq1xpCH8qbLwuzih4FwwOEKPq7tP5Q8Tvay
         7Wd2pNsh9QwjucdwAqRKercXywF+fdOrz3rVQucWqvn6Ey7s5FuELhNjdKyX75rjFZw2
         4NtsG8B3zypN4kfpFkwLs+6xq6UIEQ0WDGJRHsN/M3EOI1JyPYmBqXIAeCRVNeQSJaUb
         3Io8voQA7ztcU4pd4eweg5RaJSclY4dV8rzwrky9ipn25d4cr5ClBAABDJy8/AiV2an9
         2op+VhaLmhFWpAYgfw9GnvgRQkNGTd7rXJfr41D799PTKFzN0op7r6AG/aNliDDUrbmf
         8BpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="irOo/OS3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-886e93deea2si591782241.73.2025.07.04.07.33.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 07:33:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="irOo/OS3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXhT1-0000IR-5P; Fri, 04 Jul 2025 10:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM9-0004jo-JA
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:41 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uXhM3-00089Q-O8
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 10:25:35 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-61208b86da2so283868eaf.2
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 07:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751639130; x=1752243930; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/H2t34ohcFGW/1kwGrNHnmjU3igen0lRkevftL37hWY=;
 b=irOo/OS35S8wEnwo+dcMKEHnZVUNuLZrECG4y++cNGBbKX0HO8kZFS3vmf3F0MIKhe
 /rFaD3oW6B1DQCH1WFAFORUrefxl6uDhV2+AUJ1cKTKfXR3xFEkA+jOJL0uIeKPpyNLl
 +PCnJDKz4VVZ117GD3XZNSb6yoiBCCLDzNQaXmT9rADPcjbx0Q3gWlC8e/xgzNnO4E/F
 N0VAFh+cWW4CwKHVtWz2RjtgyMYARV9T9FNA8C/sbWu6UXakriEp+YYkFUbsMoSH9mAt
 +EDuIP9PbKH5R16z4xV8Qni0vZt0f2kQtpnMShaIP/hWt4XK8QDLEHpJHvFhALaZJVHC
 dHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751639130; x=1752243930;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/H2t34ohcFGW/1kwGrNHnmjU3igen0lRkevftL37hWY=;
 b=hD3W8TkyetoBsaJOWzG1y8v8D5vOvY2lBgfevxo6dcGkgCcuyhr5oalR8pWE2DgTcy
 QuEYRcc284UVQUOLbYolDgtWor8JfLvQ36EUgiPzOmknZ3doHgoBcpjIIcNQuiCb4k0Z
 nYyWv/Bf874d+dV1vteTfJYXMfDnG4yqzNb+sqZxSo8u6Ap0poUh9WwDEiA0nzVUrWp8
 rFGWL3H0e6xsntAUAUM6+/1c0zV7U124cAVE0GXtXwGNTZMDsLuErR/+JwSEqypnOBs/
 zrcqy9/FOKMqTpOs11Tkw+PPieN2VABfkJv2ghRlNuUmREM+h/r2kSMTAF1u6NE7QP3t
 p90Q==
X-Gm-Message-State: AOJu0YwoXS3bI9us+bftg+ys8jMB9Uas2ATqM26yz2l2ZVUAATtfT59M
 8xJ0XyJ8ILsEpOGdp2gWbluNBg2wUkkYoptapRPv+NjaccbvfovFGCgAUWBLqSpf/F10w/14Ezz
 3fyZoQcU=
X-Gm-Gg: ASbGncv35ubs/n1Ncpq5TjDpx1UkP6JoD0OCNWMUYqNyyheSmpNEQycqceySyxQgKU2
 jUhO5r050Xzw2gsvMcJsnub9EWyJCYGodqdxqfrLscTbOL0gvqh+sauKS39fqxcP5ayh0MxgBm2
 ylfZNyyu+R5jn9aSNLFzz6NyRLGEfUys2FjxoTaBgXlxyAoEGyETVc5oN3cUWzPeQwpl/hDvrqw
 xcm7fD4HhYi/7bwJ+V+I9zagn69M8Z2R7zCJD6OnsCg81jW0WLlxJaW0XEdZuN3gBWntu6EMeKJ
 AMyXJYQAe+D9DLPHjqdrNQxqibLP8NHf2REP/wI9uX9H3cAoJXzRAbgZ5tJyFNMV8yGgKPzPJdP
 PLsa7rqJxwrHtSkFzds7njIohbKT9s9MxBipE2HYDfnuSGhcyt5Y6Q+WHipA=
X-Received: by 2002:a4a:ee98:0:b0:611:cab3:5822 with SMTP id
 006d021491bc7-6138ffbca7cmr2137580eaf.2.1751639130128; 
 Fri, 04 Jul 2025 07:25:30 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-143.totalplay.net.
 [187.189.51.143]) by smtp.gmail.com with ESMTPSA id
 006d021491bc7-6138e5ac5eesm310233eaf.29.2025.07.04.07.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 07:25:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v4 072/108] target/arm: Expand do_zero inline
Date: Fri,  4 Jul 2025 08:20:35 -0600
Message-ID: <20250704142112.1018902-73-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704142112.1018902-1-richard.henderson@linaro.org>
References: <20250704142112.1018902-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: O2GF8BRxRKy7

Expand to memset plus the return value, when used.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index 492e42acc8..a62a647f3a 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -3952,15 +3952,6 @@ static uint32_t compute_brks_m(uint64_t *d, uint64_t *n, uint64_t *g,
     return flags;
 }
 
-static uint32_t do_zero(ARMPredicateReg *d, intptr_t oprsz)
-{
-    /* It is quicker to zero the whole predicate than loop on OPRSZ.
-     * The compiler should turn this into 4 64-bit integer stores.
-     */
-    memset(d, 0, sizeof(ARMPredicateReg));
-    return PREDTEST_INIT;
-}
-
 void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
                        uint32_t pred_desc)
 {
@@ -3968,7 +3959,7 @@ void HELPER(sve_brkpa)(void *vd, void *vn, void *vm, void *vg,
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, true);
     } else {
-        do_zero(vd, oprsz);
+        memset(vd, 0, sizeof(ARMPredicateReg));
     }
 }
 
@@ -3979,7 +3970,8 @@ uint32_t HELPER(sve_brkpas)(void *vd, void *vn, void *vm, void *vg,
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, true);
     } else {
-        return do_zero(vd, oprsz);
+        memset(vd, 0, sizeof(ARMPredicateReg));
+        return PREDTEST_INIT;
     }
 }
 
@@ -3990,7 +3982,7 @@ void HELPER(sve_brkpb)(void *vd, void *vn, void *vm, void *vg,
     if (last_active_pred(vn, vg, oprsz)) {
         compute_brk_z(vd, vm, vg, oprsz, false);
     } else {
-        do_zero(vd, oprsz);
+        memset(vd, 0, sizeof(ARMPredicateReg));
     }
 }
 
@@ -4001,7 +3993,8 @@ uint32_t HELPER(sve_brkpbs)(void *vd, void *vn, void *vm, void *vg,
     if (last_active_pred(vn, vg, oprsz)) {
         return compute_brks_z(vd, vm, vg, oprsz, false);
     } else {
-        return do_zero(vd, oprsz);
+        memset(vd, 0, sizeof(ARMPredicateReg));
+        return PREDTEST_INIT;
     }
 }
 
@@ -4057,7 +4050,7 @@ void HELPER(sve_brkn)(void *vd, void *vn, void *vg, uint32_t pred_desc)
 {
     intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
     if (!last_active_pred(vn, vg, oprsz)) {
-        do_zero(vd, oprsz);
+        memset(vd, 0, sizeof(ARMPredicateReg));
     }
 }
 
@@ -4079,7 +4072,8 @@ uint32_t HELPER(sve_brkns)(void *vd, void *vn, void *vg, uint32_t pred_desc)
         }
         return flags;
     }
-    return do_zero(vd, oprsz);
+    memset(vd, 0, sizeof(ARMPredicateReg));
+    return PREDTEST_INIT;
 }
 
 uint64_t HELPER(sve_cntp)(void *vn, void *vg, uint32_t pred_desc)
@@ -4124,7 +4118,7 @@ uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
     tcg_debug_assert(count <= oprbits);
 
     /* Begin with a zero predicate register.  */
-    do_zero(d, oprsz);
+    memset(d, 0, sizeof(*d));
     if (count) {
         /* Set all of the requested bits.  */
         for (i = 0; i < count / 64; ++i) {
@@ -4150,7 +4144,7 @@ uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
     tcg_debug_assert(count <= oprbits);
 
     /* Begin with a zero predicate register.  */
-    do_zero(d, oprsz);
+    memset(d, 0, sizeof(*d));
     if (count) {
         /* Set all of the requested bits.  */
         bits = esz_mask;
-- 
2.43.0

