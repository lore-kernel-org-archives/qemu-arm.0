Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp361319lfj;
        Thu, 13 Jan 2022 16:42:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkk9d/5xpOCZYKNPkf4/NbwvQQhxZaAwe+y5F9AphTayKuCOzJ6EQsDPvkvEugwRtggOiV
X-Received: by 2002:a25:9b85:: with SMTP id v5mr9390505ybo.477.1642120973424;
        Thu, 13 Jan 2022 16:42:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642120973; cv=none;
        d=google.com; s=arc-20160816;
        b=RK5KgN3zmVuldk4JVu0Ckkb2Mx1OIpSjdzrH6lLu0t0FX2RQEJWi3gMYmsc4Wqec71
         90WD6Nw80rm/2UZW70cMdEFpG1cRec9OAh3RAf0bw+wkEpqcCzsLp8H9qRufFynmLp18
         tdh2TsDgH740TI6ZsJSdjZEP8vkVvSO09Hy8Gj5fuNG0FQxnJjy1678FxadRc8EDAaph
         aEUj/LhQs3JF5SeAKKA/5Q3flgzYjKsn28ngw/YvOdbWG/Kr62Jvqa7t69OeG9a28mgd
         lqyxeS7c+XNRFuCsiFOcjCaplhC6eQT62T8pJTFHqCjiSPeOLYWZvdXs80uabwXMp3Q2
         kQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=CddZa7T6MsJ8xpDZ5jTKr5EVCyIkXQhXTW/YgwH8P14=;
        b=fU8otL6KcZUyruCmjrcjyiqt6Xrl0xk1fXyj6Yicp0uvDu0/8lHAEdDehfonqnJElL
         7/IA4en7OXb0dI6HSotqwgemUGgNDbToC2vCSt6u8rGfihgsJ1a5c+DQjujtiLRK+owm
         RQLyWcH8ZDvdNQX6en9B7Vtx5MR6mKuk2Scaw8WUV2aY9oSbndFNTGFHPASG7O+5foZp
         ET99yCI0M0PAz27qt/VXEQPPY3oHJuRU3SksQD5/nxBLJeroup5TSchMExK73PMCl0z/
         PoH4wiNuyLWPpHd/Htn9RyYypycflAY39wMgD3SH+O/shO91+GI2be7CMHvrmKw0Eied
         dWow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=mB1NEH8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o8si4482233ybu.436.2022.01.13.16.42.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jan 2022 16:42:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=mB1NEH8H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n8Ag8-0001kq-K9
	for alex.bennee@linaro.org; Thu, 13 Jan 2022 19:42:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8AeH-0001kc-RB; Thu, 13 Jan 2022 19:40:59 -0500
Received: from [2a00:1450:4864:20::42f] (port=37409
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <idan.horowitz@gmail.com>)
 id 1n8AeD-00074J-MA; Thu, 13 Jan 2022 19:40:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id t20so5579468wrb.4;
 Thu, 13 Jan 2022 16:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CddZa7T6MsJ8xpDZ5jTKr5EVCyIkXQhXTW/YgwH8P14=;
 b=mB1NEH8HN9BSCslLIamGzNIpzYU2Bq8P+5CDZHGp9bBGjQgB8QUm6qfWKQrA2pbo1X
 FzEsSy5oZx5onbQp6jtd7tSNUc7tvQFzeDEw60Tv9MX9N4WbBSix+V+crsrfKU5uhJg6
 5ED1Wx+mah/85gZnd5JaPTMwpp2FwtYbHI1BLUeVZNdcsJZXGSJ8yELEnlD8GVR+KHT5
 jWq2KM8ifGq9xObtkEYQ6uyqZiOljnS9QGKVIsw9usgq+rS45x4pgS12NbpA9AOpp3ux
 T/cGuIxX7oSH5MhIzp2KRybNiNik3p5B6L3WO0yi4uC4t4HoFi/eI5SF88yq8ZKZUSEm
 cXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CddZa7T6MsJ8xpDZ5jTKr5EVCyIkXQhXTW/YgwH8P14=;
 b=Mc55bb6SJfPubIJop8S6zshG5KLgA7RXhiXZCcGQEosPB9iypz73iazSylRqNGSAxV
 u9G3qgijkQAffNYrgetCpyQrxF5W7m2+uR4THBlhCn5j0yDRdXMWGRDbR/J9zh2b0CcQ
 yCdYLLR22BQDUSzb2ktTYYJ2WutjQmqmnX1XcUMWty2dYxn5ajVv7utyT6RlmSLdFh/t
 B2/2F9bs1WCt01+E1V3c1VtmUOhqbNGWfd1Hwwn+mnhE/Nbwh2d3zGVwWMgediuMuvVD
 p9QXRvoIcl53vTHgkA75CZBSC9K2sg0AUo+6gOnAT08Kqdl9h5v5cQft1o8obC9x/IJL
 FLvQ==
X-Gm-Message-State: AOAM532AJ3es9bhx/4VuSm6R862/ePnHlFH0JjOiqjZDdhVLtsySnN0r
 IlAbxN9xpxPHVGCoB3Biy4qend6QtrE=
X-Received: by 2002:a5d:4352:: with SMTP id u18mr6121609wrr.266.1642120850342; 
 Thu, 13 Jan 2022 16:40:50 -0800 (PST)
Received: from li-142ea8cc-3370-11b2-a85c-c55585c2aa0e.ibm.com.com
 (bzq-79-176-122-157.red.bezeqint.net. [79.176.122.157])
 by smtp.gmail.com with ESMTPSA id l12sm1244108wrz.15.2022.01.13.16.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 16:40:49 -0800 (PST)
From: Idan Horowitz <idan.horowitz@gmail.com>
To: qemu-arm@nongnu.org
Subject: [PATCH] target/arm: Allow only specific instructions based on the
 SCTLR_EL1.UCI bit
Date: Fri, 14 Jan 2022 02:40:33 +0200
Message-Id: <20220114004033.295199-1-idan.horowitz@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=idan.horowitz@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PII4jZ8mD2zf

The SCTLR_EL1.UCI bit only affects a subset of cache maintenance
instructions as specified by the specification. Any other cache
maintenance instructions must still be trapped from EL0.

Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
---
 target/arm/helper.c | 68 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 52 insertions(+), 16 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index cfca0f5ba6..ac75a268aa 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4217,7 +4217,7 @@ static const ARMCPRegInfo ssbs_reginfo = {
     .readfn = aa64_ssbs_read, .writefn = aa64_ssbs_write
 };
 
-static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
+static CPAccessResult aa64_cacheop_poc_uci_access(CPUARMState *env,
                                               const ARMCPRegInfo *ri,
                                               bool isread)
 {
@@ -4239,7 +4239,7 @@ static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
-static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
+static CPAccessResult aa64_cacheop_pou_uci_access(CPUARMState *env,
                                               const ARMCPRegInfo *ri,
                                               bool isread)
 {
@@ -4261,6 +4261,42 @@ static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
+                                              const ARMCPRegInfo *ri,
+                                              bool isread)
+{
+    /* Cache invalidate/clean to Point of Coherency or Persistence...  */
+    switch (arm_current_el(env)) {
+    case 0:
+        return CP_ACCESS_TRAP;
+    case 1:
+        /* ... EL1 must trap to EL2 if HCR_EL2.TPCP is set.  */
+        if (arm_hcr_el2_eff(env) & HCR_TPCP) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        break;
+    }
+    return CP_ACCESS_OK;
+}
+
+static CPAccessResult aa64_cacheop_pou_access(CPUARMState *env,
+                                              const ARMCPRegInfo *ri,
+                                              bool isread)
+{
+    /* Cache invalidate/clean to Point of Unification... */
+    switch (arm_current_el(env)) {
+    case 0:
+        return CP_ACCESS_TRAP;
+    case 1:
+        /* ... EL1 must trap to EL2 if HCR_EL2.TPU is set.  */
+        if (arm_hcr_el2_eff(env) & HCR_TPU) {
+            return CP_ACCESS_TRAP_EL2;
+        }
+        break;
+    }
+    return CP_ACCESS_OK;
+}
+
 /* See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
  * Page D4-1736 (DDI0487A.b)
  */
@@ -4846,7 +4882,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "IC_IVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 5, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = aa64_cacheop_pou_uci_access },
     { .name = "DC_IVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
       .access = PL1_W, .accessfn = aa64_cacheop_poc_access,
@@ -4857,18 +4893,18 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DC_CVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_CSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     { .name = "DC_CVAU", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 11, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_pou_access },
+      .accessfn = aa64_cacheop_pou_uci_access },
     { .name = "DC_CIVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_CISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
@@ -7102,7 +7138,7 @@ static const ARMCPRegInfo dcpop_reg[] = {
     { .name = "DC_CVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
-      .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
+      .accessfn = aa64_cacheop_poc_uci_access, .writefn = dccvap_writefn },
     REGINFO_SENTINEL
 };
 
@@ -7110,7 +7146,7 @@ static const ARMCPRegInfo dcpodp_reg[] = {
     { .name = "DC_CVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
-      .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
+      .accessfn = aa64_cacheop_poc_uci_access, .writefn = dccvap_writefn },
     REGINFO_SENTINEL
 };
 #endif /*CONFIG_USER_ONLY*/
@@ -7227,35 +7263,35 @@ static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
     { .name = "DC_CGVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_CGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_CGVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_CGDVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_CGVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_CGDVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_CIGVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 3,
       .type = ARM_CP_NOP, .access = PL0_W,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_CIGDVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
       .type = ARM_CP_NOP, .access = PL0_W,
-      .accessfn = aa64_cacheop_poc_access },
+      .accessfn = aa64_cacheop_poc_uci_access },
     { .name = "DC_GVA", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 4, .opc2 = 3,
       .access = PL0_W, .type = ARM_CP_DC_GVA,
-- 
2.34.1

