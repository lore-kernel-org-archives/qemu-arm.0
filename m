Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2707372ejb;
        Mon, 20 Feb 2023 15:28:42 -0800 (PST)
X-Google-Smtp-Source: AK7set9xlUSZ+++eAna0V4spdzIj7dva+Jy+t5qgMCM6KyehM8OZ6707aA0epDgQGqISim98DGzP
X-Received: by 2002:ac8:7f47:0:b0:3b6:359f:39e5 with SMTP id g7-20020ac87f47000000b003b6359f39e5mr3813815qtk.49.1676935722332;
        Mon, 20 Feb 2023 15:28:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676935722; cv=none;
        d=google.com; s=arc-20160816;
        b=HRb73g4HzyM6XzvpLSv8lbixCWiApttkobfXYx6CNZq7p+F9RZ+9IoCOuS55+KOkAA
         eAYZURbFDoBzPAF3scd6rJqSwMxOk51uj3BWZV1cmnHYtf6xAifiUULYJx9/TSTFzkeN
         R5UnrBula0MyKzVTnYYBEqQf78qDuEA1Du+YRsIO8TDP6/2j0gmCLCftRfPEpmQhULmb
         wp1F7r0p1gdUmBiX6QT/021YtLWfckIlJQKuUkW8NAdEavzE4nhjJ7pKrl5OEbWw3dxo
         lV7sDBmnv8m9M9W1/RqFIWNd16SoYJ5EhtRLD72rPHGCCJ4KQhAB4of0b1t7/TwwkRAb
         T0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Q2wDlc9y+ZmDdlYUvnbEL+qYl6ONKTEgAFqhyLih/rk=;
        b=elMoEJoR0lGYylUJ4YAEhkTeDU3dYnd4r1aQr1hOVDDaigmodIdsmWFby4sIxwXx3a
         ao6PJAFyhu1SJvBJMbAxQs6FdKYZJ8DQ39JBBAQNhJtGSB8LckoSoGt2vjk5OKhSUHmS
         fwnt2bndNbVrfZ9Q/wQqRhCNriL9drdCq5y0JycUaorfQmGl6rX96w2jxBIiOxcCCjRf
         QrfvfTa3Chk5Edw0pideolqY5BI8dI4NHiNdzeEcZD4hCysb1YbevY+HGZKQLMUw7njH
         fOYWe06CMUlC3yJy4oGbjjPC1cdYJWIFO1hz2EQYVADzm1BfRFXS9N7RPi9VpDX0gTdN
         efdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SI9939Ck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac85e0d000000b003bbd8bdb935si10527671qtx.793.2023.02.20.15.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 15:28:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SI9939Ck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUFYe-00049U-4d; Mon, 20 Feb 2023 18:26:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYb-00046o-JK
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:53 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUFYZ-0000Ik-SR
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 18:26:53 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 co23-20020a17090afe9700b002341fadc370so2883243pjb.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 15:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q2wDlc9y+ZmDdlYUvnbEL+qYl6ONKTEgAFqhyLih/rk=;
 b=SI9939CkfMXh2gPFkBNyfUSn311jdAXhlcxpI26CQBa3jmX48aYVUJnNUe298tv0tA
 /55rvZT1CahipYUH1Ds2W1emizOmKY1KMHEU2McyMcTk5Ao+cM0895YjzE0oVYAZyO9N
 gaQAUwBjTxhKcIBvHFgpNgWsr1lanhNcQWEz6QMY/nM8ywl9WNlJnL0Z+NoJC+M4rKw5
 YlJkGHlgHVgr1LiYKywbBMqXEZpHmEO13E1a3u94o6N0MKb7RhgNEouS4cgr51/G+lhE
 c4x0uqPh03jiltHhtgLOENZ2EFiy6G/ANfowJLNf13Vo3+O3RfklFKG8YAJZfFVpg+Ao
 0Q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Q2wDlc9y+ZmDdlYUvnbEL+qYl6ONKTEgAFqhyLih/rk=;
 b=FnQiVCwWT3b9wQUrKRkJ68kepO0OdQHJn/2gPWtphpFJCI94vNG2I68/EvZKDwJCUQ
 Ij/hwGl+Nlojk393d3Bo7SZlvYVyhMLR8SAoy3i87adWgfWAdf7Od+jBekydcaUtQiv7
 iVyVF0hrmWnQ5pQ+9ByqJgddSXp1BPAfsNJCRuSGCk+JLSyiExoUEga5jmacQL4A+yZl
 gHFk48mbwf3g3X7UjKC4jRmBTmFTtIqmkqD8T6DpCJ+JIpQqQozqVtZ+/zVyJKvn2oby
 7AbKlMAXJpQC4O2Nx5J4w3HmoYmgv6dfxap31q1OuvIDTE29BM18aXtHHt2m5Bw2t9Qg
 LIjQ==
X-Gm-Message-State: AO0yUKXg7KfKVj3iyV8gNdUh85cYJxKiPdSu6//0a1+YOhLAa/euX4ze
 vWjoXyy6JZ3HHcQ1YvhN56TDnQ==
X-Received: by 2002:a17:902:e547:b0:19a:a815:2876 with SMTP id
 n7-20020a170902e54700b0019aa8152876mr4075649plf.62.1676935610970; 
 Mon, 20 Feb 2023 15:26:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a170902690a00b001992e74d058sm2665348plk.7.2023.02.20.15.26.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 15:26:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 13/21] target/arm: Handle no-execute for Realm and Root
 regimes
Date: Mon, 20 Feb 2023 13:26:18 -1000
Message-Id: <20230220232626.429947-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220232626.429947-1-richard.henderson@linaro.org>
References: <20230220232626.429947-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
X-TUID: XgQvtqKvDGVO

While Root and Realm may read and write data from other spaces,
neither may execute from other pa spaces.

This happens for Stage1 EL3, EL2, EL2&0, but stage2 EL1&0.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 52 ++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 46 insertions(+), 6 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index a9a9a8a403..54e72baff5 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -909,7 +909,7 @@ do_fault:
  * @xn:      XN (execute-never) bits
  * @s1_is_el0: true if this is S2 of an S1+2 walk for EL0
  */
-static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+static int get_S2prot_noexecute(int s2ap)
 {
     int prot = 0;
 
@@ -919,6 +919,12 @@ static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
     if (s2ap & 2) {
         prot |= PAGE_WRITE;
     }
+    return prot;
+}
+
+static int get_S2prot(CPUARMState *env, int s2ap, int xn, bool s1_is_el0)
+{
+    int prot = get_S2prot_noexecute(s2ap);
 
     if (cpu_isar_feature(any_tts2uxn, env_archcpu(env))) {
         switch (xn) {
@@ -984,9 +990,39 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
         }
     }
 
-    if (out_pa == ARMSS_NonSecure && in_pa == ARMSS_Secure &&
-        (env->cp15.scr_el3 & SCR_SIF)) {
-        return prot_rw;
+    if (in_pa != out_pa) {
+        switch (in_pa) {
+        case ARMSS_Root:
+            /*
+             * R_ZWRVD: permission fault for insn fetched from non-Root,
+             * I_WWBFB: SIF has no effect in EL3.
+             */
+            return prot_rw;
+        case ARMSS_Realm:
+            /*
+             * R_PKTDS: permission fault for insn fetched from non-Realm,
+             * for Realm EL2 or EL2&0.  The corresponding fault for EL1&0
+             * happens during any stage2 translation.
+             */
+            switch (mmu_idx) {
+            case ARMMMUIdx_E2:
+            case ARMMMUIdx_E20_0:
+            case ARMMMUIdx_E20_2:
+            case ARMMMUIdx_E20_2_PAN:
+                return prot_rw;
+            default:
+                break;
+            }
+            break;
+        case ARMSS_Secure:
+            if (env->cp15.scr_el3 & SCR_SIF) {
+                return prot_rw;
+            }
+            break;
+        default:
+            /* Input NonSecure must have output NonSecure. */
+            g_assert_not_reached();
+        }
     }
 
     /* TODO have_wxn should be replaced with
@@ -1563,12 +1599,16 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
         /*
          * R_GYNXY: For stage2 in Realm security state, bit 55 is NS.
          * The bit remains ignored for other security states.
+         * R_YMCSL: Executing an insn fetched from non-Realm causes
+         * a stage2 permission fault.
          */
         if (out_space == ARMSS_Realm && extract64(attrs, 55, 1)) {
             out_space = ARMSS_NonSecure;
+            result->f.prot = get_S2prot_noexecute(ap);
+        } else {
+            xn = extract64(attrs, 53, 2);
+            result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
         }
-        xn = extract64(attrs, 53, 2);
-        result->f.prot = get_S2prot(env, ap, xn, s1_is_el0);
     } else {
         int nse, ns = extract32(attrs, 5, 1);
         switch (out_space) {
-- 
2.34.1

