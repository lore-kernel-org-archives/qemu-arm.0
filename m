Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1319916lfg;
        Fri, 28 Feb 2020 17:32:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqwsePmkqP5z0qIb/ulQ8iaO9yACX33qzIEF1pH+I26Lsrr/12Kv0wLqRIZwDXOvgckjSOwR
X-Received: by 2002:a37:4c82:: with SMTP id z124mr6896588qka.47.1582939920873;
        Fri, 28 Feb 2020 17:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582939920; cv=none;
        d=google.com; s=arc-20160816;
        b=jdF4Cp00iXkUJdkhRmMSQ0nqgptL7KqyONSD4ExOplsD/jx0XmjbyhSFZ2hX59aDEP
         Kp2ZTMfRnxDnurLeuMgTcX2RfXq3uzCN9UVBLXpc9UcNo5vgY17sTqV8/aJaSkagnJFP
         kOVHtTrohbrsAxdM1PXwnY6Lm98rjCD6vhjuGfeM5/KXlHOf+Z0zCkWXQZOF+6MlyeVp
         PRAePzR3kC2i061zfxTdBeQ66Ck7uqwgMl9eDH2HZAxiIJSgmF+n22DEFp2XIUgp5tGe
         50oAlSLY4gmSPxXLs3TMJNVBkYsrPCDbjB7hYMm5A6xJ4QjkQ1dbnB30HoRm9p9wVT2/
         mQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pnBsdmgd+K1Yf7h5c1j8apGf/ntIFnarc7b46/SCqJo=;
        b=aLXxjnsFv5626bClYFAJlWAtCIkxy0zayK147TGXgelbStKUd0OtEA/CqHck5CtzHF
         GZFprRu+wISfLFh+RkV80hs2TZvtZh8S6QOgscEee2ff/0pPx02OaF1GJa78nW338OgS
         I+8gepz1ABxuHhoo4qdYvziDRYE8jn9YG9djR+fIv9eFJJijTfWW092Hp3hVOx+AYFLi
         eu+vWB6Mk5eYIL3h37G6wlRVOOpd0V7XM0aA+w7+IWfzYzSy7WpdY4XBKi4rxaQf7vxO
         0Q0AmgVH44Awwj0Mf0mNtGihizon1sxWYKHU2H6Z8JQRGCxsn7q8/cmbZo5eBgMjnBQz
         ro3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QBuCvpGz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5si2298556qko.43.2020.02.28.17.32.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 17:32:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QBuCvpGz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7qz2-0003ms-Ar
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 20:32:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37139)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvd-0004w2-OR
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7qvc-00066M-42
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:29 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:38676)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7qvb-00065a-Nm
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 20:28:28 -0500
Received: by mail-pg1-x543.google.com with SMTP id d6so2396322pgn.5
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 17:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pnBsdmgd+K1Yf7h5c1j8apGf/ntIFnarc7b46/SCqJo=;
 b=QBuCvpGzy1XivFgp2aDM3fsm+2gH6Fl0PX8pu1kV41V77kWcY9sUpwrkX15ZFcbRcw
 zGXkN3wkBtzNoyogNyqJeKA9PNaaTEICnvyKZJwMiGLEvbcewhOzWiqGzK8gy1tgUHGy
 fenHV+zqcl5fH2ypRZ8oXvWu4jQ8g9Dr8NhH+2G+dbb4Ha4nasGT8lnm2Xe2DClqFVS6
 OKBqoQb4SocdD1aNzmwqtPqJLlgY2bdrqJRILqruCRmca4Vluvsu8EXS3GPldYWILuJL
 RjwJbYj41JavXRFzzoRMgv0Wj8fPvsmy2pT0zPeks3DF8JlfR65FZhP0b1euVbj+uzS6
 GFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pnBsdmgd+K1Yf7h5c1j8apGf/ntIFnarc7b46/SCqJo=;
 b=OLZZDe163Ayeh7KZRDZrmR+KX/HRjiSay8FgonRTQuBo5313Jz1BpxyowBX/7ig+gV
 J0SvMP4cckc6VM0YIgUy1cmxkvVyHq/28Mrzf7cfsnwG9oYFuGm2FSbT9JjxEbNkz8Pa
 YP1n22TtPNMv92SYZx1jc3ByBfaVicx59B0VPxgUGewEGk2RZuOg5Nk2nlh2qKwlQKKY
 G/CmrEJLkib7/qliIWkioW81CEf4N1WgwiVOcpc0rZMDJvcjfL0eul41rHIEGDJ5+x/r
 CcdQ8n+31Rd+WyAJC56pE2Wo0D6ZHTALWPORGQDk8cTOP7R7b8L79lBi/qmVTEMOZGdD
 /wXQ==
X-Gm-Message-State: APjAAAVkr+ikso19YzndYgKMVAMh3xmSo8VFWAmHAoXloKegRFQIvXci
 mC1AT4z2V+cRgLdf94fUREPQTcQ0ASc=
X-Received: by 2002:aa7:93a6:: with SMTP id x6mr7236480pff.72.1582939706213;
 Fri, 28 Feb 2020 17:28:26 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id r3sm4606313pfq.126.2020.02.28.17.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 17:28:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/12] target/arm: Honor the HCR_EL2.TPCP bit
Date: Fri, 28 Feb 2020 17:28:08 -0800
Message-Id: <20200229012811.24129-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200229012811.24129-1-richard.henderson@linaro.org>
References: <20200229012811.24129-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6sn1y6tp4CHg

This bit traps EL1 access to cache maintenance insns that operate
to the point of coherency or persistence.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Fix el0 fallthru (pmm).
---
 target/arm/helper.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2c06ac8d02..e87a76c6f5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4314,6 +4314,28 @@ static CPAccessResult aa64_cacheop_access(CPUARMState *env,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult aa64_cacheop_poc_access(CPUARMState *env,
+                                              const ARMCPRegInfo *ri,
+                                              bool isread)
+{
+    /* Cache invalidate/clean to Point of Coherency or Persistence...  */
+    switch (arm_current_el(env)) {
+    case 0:
+        /* ... EL0 must UNDEF unless SCTLR_EL1.UCI is set.  */
+        if (!(arm_sctlr(env, 0) & SCTLR_UCI)) {
+            return CP_ACCESS_TRAP;
+        }
+        /* fall through */
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
 /* See: D4.7.2 TLB maintenance requirements and the TLB maintenance instructions
  * Page D4-1736 (DDI0487A.b)
  */
@@ -4721,14 +4743,15 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
       .accessfn = aa64_cacheop_access },
     { .name = "DC_IVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
-      .access = PL1_W, .type = ARM_CP_NOP },
+      .access = PL1_W, .accessfn = aa64_cacheop_poc_access,
+      .type = ARM_CP_NOP },
     { .name = "DC_ISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 2,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
     { .name = "DC_CVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_access },
+      .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CSW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
@@ -4739,7 +4762,7 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "DC_CIVAC", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NOP,
-      .accessfn = aa64_cacheop_access },
+      .accessfn = aa64_cacheop_poc_access },
     { .name = "DC_CISW", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
       .access = PL1_W, .accessfn = access_tsw, .type = ARM_CP_NOP },
@@ -4921,17 +4944,17 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
     { .name = "BPIMVA", .cp = 15, .opc1 = 0, .crn = 7, .crm = 5, .opc2 = 7,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "DCIMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_poc_access },
     { .name = "DCISW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 2,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DCCMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_poc_access },
     { .name = "DCCSW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 2,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     { .name = "DCCMVAU", .cp = 15, .opc1 = 0, .crn = 7, .crm = 11, .opc2 = 1,
       .type = ARM_CP_NOP, .access = PL1_W },
     { .name = "DCCIMVAC", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 1,
-      .type = ARM_CP_NOP, .access = PL1_W },
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = aa64_cacheop_poc_access },
     { .name = "DCCISW", .cp = 15, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 2,
       .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     /* MMU Domain access control / MPU write buffer control */
@@ -6750,7 +6773,7 @@ static const ARMCPRegInfo dcpop_reg[] = {
     { .name = "DC_CVAP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
-      .accessfn = aa64_cacheop_access, .writefn = dccvap_writefn },
+      .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
     REGINFO_SENTINEL
 };
 
@@ -6758,7 +6781,7 @@ static const ARMCPRegInfo dcpodp_reg[] = {
     { .name = "DC_CVADP", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 1,
       .access = PL0_W, .type = ARM_CP_NO_RAW | ARM_CP_SUPPRESS_TB_END,
-      .accessfn = aa64_cacheop_access, .writefn = dccvap_writefn },
+      .accessfn = aa64_cacheop_poc_access, .writefn = dccvap_writefn },
     REGINFO_SENTINEL
 };
 #endif /*CONFIG_USER_ONLY*/
-- 
2.20.1

