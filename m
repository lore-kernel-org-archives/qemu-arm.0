Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp6074463lfh;
        Fri, 3 Jun 2022 21:16:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaVAu1njMTSFM3wZBl0IXAliFbUja9ynqZhqIu8nnp0cC20n+LQfslPj1lhh7zoeijtTrJ
X-Received: by 2002:ac8:5cce:0:b0:2f3:cbea:57c0 with SMTP id s14-20020ac85cce000000b002f3cbea57c0mr10430672qta.422.1654316185739;
        Fri, 03 Jun 2022 21:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654316185; cv=none;
        d=google.com; s=arc-20160816;
        b=jgxbJntmUXmQki0ZZH2ZKJreFbfTI57AKtn6bwfJPRAOt4ZIr8GluTNQfrC/lsbkke
         sRrDxheAxaMZf5tOLxMR3vstnHHtNh4PYrGbAJjcOQXeqr+2KLUENtg2umTOv9ko2JJp
         TU7khn84yvL06BU7PkdCcGcuYp3+lZi3Q6X5ln0roiOVFrMWBl4VnEGVHU1FBuU4NF6v
         sAUUEGRcKrsYYWVol9Y/i+Uuj2a5BbmwUn10KBPSz40jwGrLwV9CnmsJkGZZaNSqebBq
         pNbBJmdPP54Jw5+CO2fw+LqfhW1iWGQSeA+tJv/LwZ7+Lumowlw9MG71v7UXKWbDOK04
         0IxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6KKo07UAnM87DaMoH4z3hFQneciCBNYbYQZeTrJ63eA=;
        b=FntYgEkPnnhiHodRn3iVo18GaSc7j2moyQuNhlPHmUZQrcH1WeuDT4fSL9vJLaP4zw
         OgmaFvFWTKB7WXTliZzjLo6KnGgAocuWP6fqVXdrwyQAmvShw341R92c9IsExyISEW5u
         ZXh1gnDtDSt16Qk1f8lPpurlxl7Vz/rTggHG3tr2bm5XRpxr3ENNaUlmDsqARFnITTPk
         4E3Y6H/p1WRicEi3DzxKayvF7RHeL+MQCSiRF0pT9wRGFVf81ZATZuvCsfJiTA5r5SL/
         urdGTeOpQ3tAJf4rGWVl6LF054XaBhwJLL+trrSaD+fXVoLQ6f+9zh85KWYIA7J4BCXl
         zmJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JvM1wUMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020a05622a001300b00304e039325fsi2181919qtw.418.2022.06.03.21.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Jun 2022 21:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JvM1wUMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxLD7-00068T-6c
	for alex.bennee@linaro.org; Sat, 04 Jun 2022 00:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3X-0008Mc-Mq
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:31 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:52134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxL3V-0000AH-JA
 for qemu-arm@nongnu.org; Sat, 04 Jun 2022 00:06:31 -0400
Received: by mail-pj1-x102d.google.com with SMTP id cx11so8713239pjb.1
 for <qemu-arm@nongnu.org>; Fri, 03 Jun 2022 21:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6KKo07UAnM87DaMoH4z3hFQneciCBNYbYQZeTrJ63eA=;
 b=JvM1wUMfOld2jZAq7MIwZrb9A/eGZ68mHqo14HneYJdq5h7IkUSwDhfNflFiFUUyC/
 DxkQtuBldVsPz868s73MEHZvpZT8qGlBER8kVbobzRCq6A/ijrOsPxhe+m6Qf7yPwVLO
 aUjDCeuUn6bciWaQtwJ8xEbOR4xWgkEHqPBCdXXDfdMoJlFz9uuDg2Qw5quvx9Uylhjf
 QMxzLQUZWGybT38EILAV6aIo3lWcGLVeGQ8V/YzGEG6UPFzCY3bT5iQb/oG/zu84bP6E
 6CaORFgp1on+PJ/7DlFQD9kxeWLWUKH2Ltb4CiIKIEyN9cPcUU4YenvOvK5tNuxAkpQx
 TIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6KKo07UAnM87DaMoH4z3hFQneciCBNYbYQZeTrJ63eA=;
 b=v6RIDMg3HAA1srdDodQYR9MCcCXajjGpB1vSJQhrbgl3Ng8vCLXJdM7Vz7wU+SvnKj
 TWpGhXxBGJyLfBJNi1aZFShgX1rPU5SA2RdH83ke7R6iipnD73n9JXRLYg+Uqh5SYFkc
 oy1zjU16504fMbm0VangHFWoTuUVmDI8wKDk29XN9DKgVRTXqZADP+Hl7Q3Bblsh6c8X
 wQW4F0dvdcfWeYc9pnY2XWEeK/NKC9cNVEJuH4hBtz7/3lOREURdKyph0yDQuFyybK02
 2rPRejRPUM2H8n4yBjILfy95GvwvRLoUhoslK10QHloybC9jn87+9yj8YSDER7ACsb/z
 MZkg==
X-Gm-Message-State: AOAM530g+PRYP2Qc3cQT7HelPSx0qFivZbVM8hvV3ieCQ9OA5yLmEzxj
 CBH3l/JTcoK5Fg5GnKJrIzuLYQ==
X-Received: by 2002:a17:90a:ba15:b0:1e2:e76c:f725 with SMTP id
 s21-20020a17090aba1500b001e2e76cf725mr14161949pjr.7.1654315588232; 
 Fri, 03 Jun 2022 21:06:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3286:cc26:3d5e:3f94])
 by smtp.gmail.com with ESMTPSA id
 a37-20020a631a65000000b003c14af50626sm6093779pgm.62.2022.06.03.21.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 21:06:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 21/28] target/arm: Move aa32_va_parameters to ptw.c
Date: Fri,  3 Jun 2022 21:06:00 -0700
Message-Id: <20220604040607.269301-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220604040607.269301-1-richard.henderson@linaro.org>
References: <20220604040607.269301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: iI0SsWzxqISX

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.h    |  3 ---
 target/arm/helper.c | 64 ---------------------------------------------
 target/arm/ptw.c    | 64 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+), 67 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index a71161b01b..9314fb4d23 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -25,8 +25,5 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
     return simple_ap_to_rw_prot_is_user(ap, regime_is_user(env, mmu_idx));
 }
 
-ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
-                                   ARMMMUIdx mmu_idx);
-
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 5dfe1f9cc0..02e65c9e98 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10735,70 +10735,6 @@ ARMVAParameters aa64_va_parameters(CPUARMState *env, uint64_t va,
 }
 
 #ifndef CONFIG_USER_ONLY
-ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
-                                   ARMMMUIdx mmu_idx)
-{
-    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
-    uint32_t el = regime_el(env, mmu_idx);
-    int select, tsz;
-    bool epd, hpd;
-
-    assert(mmu_idx != ARMMMUIdx_Stage2_S);
-
-    if (mmu_idx == ARMMMUIdx_Stage2) {
-        /* VTCR */
-        bool sext = extract32(tcr, 4, 1);
-        bool sign = extract32(tcr, 3, 1);
-
-        /*
-         * If the sign-extend bit is not the same as t0sz[3], the result
-         * is unpredictable. Flag this as a guest error.
-         */
-        if (sign != sext) {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "AArch32: VTCR.S / VTCR.T0SZ[3] mismatch\n");
-        }
-        tsz = sextract32(tcr, 0, 4) + 8;
-        select = 0;
-        hpd = false;
-        epd = false;
-    } else if (el == 2) {
-        /* HTCR */
-        tsz = extract32(tcr, 0, 3);
-        select = 0;
-        hpd = extract64(tcr, 24, 1);
-        epd = false;
-    } else {
-        int t0sz = extract32(tcr, 0, 3);
-        int t1sz = extract32(tcr, 16, 3);
-
-        if (t1sz == 0) {
-            select = va > (0xffffffffu >> t0sz);
-        } else {
-            /* Note that we will detect errors later.  */
-            select = va >= ~(0xffffffffu >> t1sz);
-        }
-        if (!select) {
-            tsz = t0sz;
-            epd = extract32(tcr, 7, 1);
-            hpd = extract64(tcr, 41, 1);
-        } else {
-            tsz = t1sz;
-            epd = extract32(tcr, 23, 1);
-            hpd = extract64(tcr, 42, 1);
-        }
-        /* For aarch32, hpd0 is not enabled without t2e as well.  */
-        hpd &= extract32(tcr, 6, 1);
-    }
-
-    return (ARMVAParameters) {
-        .tsz = tsz,
-        .select = select,
-        .epd = epd,
-        .hpd = hpd,
-    };
-}
-
 hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
                                          MemTxAttrs *attrs)
 {
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 525272e99a..427813ea56 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -615,6 +615,70 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
+static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
+                                          ARMMMUIdx mmu_idx)
+{
+    uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
+    uint32_t el = regime_el(env, mmu_idx);
+    int select, tsz;
+    bool epd, hpd;
+
+    assert(mmu_idx != ARMMMUIdx_Stage2_S);
+
+    if (mmu_idx == ARMMMUIdx_Stage2) {
+        /* VTCR */
+        bool sext = extract32(tcr, 4, 1);
+        bool sign = extract32(tcr, 3, 1);
+
+        /*
+         * If the sign-extend bit is not the same as t0sz[3], the result
+         * is unpredictable. Flag this as a guest error.
+         */
+        if (sign != sext) {
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "AArch32: VTCR.S / VTCR.T0SZ[3] mismatch\n");
+        }
+        tsz = sextract32(tcr, 0, 4) + 8;
+        select = 0;
+        hpd = false;
+        epd = false;
+    } else if (el == 2) {
+        /* HTCR */
+        tsz = extract32(tcr, 0, 3);
+        select = 0;
+        hpd = extract64(tcr, 24, 1);
+        epd = false;
+    } else {
+        int t0sz = extract32(tcr, 0, 3);
+        int t1sz = extract32(tcr, 16, 3);
+
+        if (t1sz == 0) {
+            select = va > (0xffffffffu >> t0sz);
+        } else {
+            /* Note that we will detect errors later.  */
+            select = va >= ~(0xffffffffu >> t1sz);
+        }
+        if (!select) {
+            tsz = t0sz;
+            epd = extract32(tcr, 7, 1);
+            hpd = extract64(tcr, 41, 1);
+        } else {
+            tsz = t1sz;
+            epd = extract32(tcr, 23, 1);
+            hpd = extract64(tcr, 42, 1);
+        }
+        /* For aarch32, hpd0 is not enabled without t2e as well.  */
+        hpd &= extract32(tcr, 6, 1);
+    }
+
+    return (ARMVAParameters) {
+        .tsz = tsz,
+        .select = select,
+        .epd = epd,
+        .hpd = hpd,
+    };
+}
+
 /*
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
-- 
2.34.1

