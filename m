Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp52487lfm;
        Thu, 25 Jun 2020 20:41:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0XTgBBanSnemlLyH/paoYq1rtQvb8L8xq5AaAk5wX93bP0vklAwZHEYJkLGfaavsGXWJp
X-Received: by 2002:a25:c6c2:: with SMTP id k185mr1849233ybf.94.1593142888449;
        Thu, 25 Jun 2020 20:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142888; cv=none;
        d=google.com; s=arc-20160816;
        b=MpD8L4389YJfJwRhmu0ke7wbyHDOtIMwz2JttQlu52s0P5vtu/lfeGvWoUOr+wT9V4
         6u4Gi8SofgRkUeBfHgQZoTXK74mbWkpd66cQ4g8Gm1kCb5s5qJjFREBFZSC0P2FvA0jm
         DPa45tu6c0iVpZx1uWMQ/srlp4Q2BO1H0G1Uy7lJTFIVsKesyItsT7mQBedNFnt0qwDB
         dwN7luaAJFapYOclIbWvtCnuR4rE5NZQoQjY+AN7Dtf+JdhXwqpya3k+XZiXeZfSD+EU
         mOQLXQtI4BVhjOf90GwpNauXthn3EjaPMJ3h/nhSUuruGTb4WIK3lrFm8ZX9799JLXyZ
         iFhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HSjBCHwavjNr37NIxaEpavJpEI8ou/nda9kEqEE9VlM=;
        b=L7Zvl+H7VZFmdbDF1nubWWrs6BOVrJ+eL/rGpiSm9KY2VzWkfZev1s7AlKst2SZzjl
         zXXqe+UP+OTTRUwlNdQUl+qydxK97Y8/AfsZB99V8PLOBQ4bxMEkGjjwDBDeXFEiRgYZ
         VD2HK96lz3wA+wu6xaujqQ8RRLbT0ZE3jk5/Ne/f5QZnXwccNHoTr0TEbagdB0knPcIL
         z1n6cb0ci1s5L+D+aFuozw0GufdTXokBI4msHT6BkGulkpjO4KMCoXkd3bPi/5/eH76r
         tvk3LNkM1nr+MwuLCw/9HL0ny6rlbrwWKD3mzfoIQtwBft62+q5sTAvQ6z/O++P5EZ4c
         gUOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=miWWnPz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k186si24643860ybf.383.2020.06.25.20.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=miWWnPz5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofF1-0008W4-NZ
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof69-0000EW-Ux
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:18 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:36480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof66-0001uF-5d
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:17 -0400
Received: by mail-pj1-x1041.google.com with SMTP id h22so4367944pjf.1
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HSjBCHwavjNr37NIxaEpavJpEI8ou/nda9kEqEE9VlM=;
 b=miWWnPz5TKHVh/oD5UPi0M1GOkbPbVTeLTbRbcTS8bgzkBgBZs7w3Sg1qvqA0ZdhyO
 7Zp4rEDoATiAm6kLy33kZjmLKYpUdvi4tdJFIf3Lq1o46Y4uGUhSUx+M1SMNjIUOXw0j
 MA8JsPxyhFAkWWG4Am/Wn0LPvlNrWHna4lZPDNGzu3kkIrF4/cRo9yiDJq7IsMFCsLGl
 9BYrZi3Psr4vGiOHK7h7lmbXXr1HVC5IoJ9SVu9KD9WFr0YaMoyYr1eTxhtf/7UR8UDx
 8UCkyk4ISQoakvFzDc7/PQa4YhGI2DIG67v4xKqBVDLoohHjfNMgr27yv156yZUMfw6y
 eFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HSjBCHwavjNr37NIxaEpavJpEI8ou/nda9kEqEE9VlM=;
 b=tvLbAy+K7iVni1R1IyDlsovQAz8bU84Y1ljYafZR1vmTWnLf3q3ojIymCqFoQFoqls
 0G9ul+6PnXNr8XZlvcrRP5myXEiTKEQk4HDYAKsvTUESExyoLxruSy//H80BH9BRJlyv
 yf8gcQ7CshrBSPZiC3Eu0EIdob/BDdex1jkmwPt/8jP728+LyVt4e6FZVIS1+rA+9CuK
 qOAnTIm7UtpNVnh2kfGXyRHRMqOvQTd5Ip4+Bzja1/uXSXMR/dhYSu3Rfl2VkqlQMYzu
 CX65fWHnCmFlyWQ5ffIdiULGe2uAk3NR3QrutwsNxfPtKSn8GbjX5W2v6OsTuXn1N4s0
 ltaw==
X-Gm-Message-State: AOAM53298PxZMEoNN3jNTH90rRoOy+DeKNDWtjUDo6coEses/na3vwjA
 xgtMiJNMM2Ztu0cNmfqkoNfjs/RBuZk=
X-Received: by 2002:a17:90a:a62:: with SMTP id
 o89mr1093458pjo.188.1593142332856; 
 Thu, 25 Jun 2020 20:32:12 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 20/46] target/arm: Implement the access tag cache flushes
Date: Thu, 25 Jun 2020 20:31:18 -0700
Message-Id: <20200626033144.790098-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RJVJ9sM+rTE5

Like the regular data cache flushes, these are nops within qemu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Split out and handle el0 cache ops properly.
---
 target/arm/helper.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2c6ec244af..d8c31d03da 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6929,6 +6929,32 @@ static const ARMCPRegInfo mte_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 4, .crm = 2, .opc2 = 7,
       .type = ARM_CP_NO_RAW,
       .access = PL0_RW, .readfn = tco_read, .writefn = tco_write },
+    { .name = "DC_IGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL1_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_IGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_IGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL1_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_IGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 6, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 10, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CIGSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 4,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
+    { .name = "DC_CIGDSW", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 14, .opc2 = 6,
+      .type = ARM_CP_NOP, .access = PL1_W, .accessfn = access_tsw },
     REGINFO_SENTINEL
 };
 
@@ -6938,6 +6964,43 @@ static const ARMCPRegInfo mte_tco_ro_reginfo[] = {
       .type = ARM_CP_CONST, .access = PL0_RW, },
     REGINFO_SENTINEL
 };
+
+static const ARMCPRegInfo mte_el0_cacheop_reginfo[] = {
+    { .name = "DC_CGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 10, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGDVAP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 12, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CGDVADP", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 13, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CIGVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 3,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    { .name = "DC_CIGDVAC", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 14, .opc2 = 5,
+      .type = ARM_CP_NOP, .access = PL0_W,
+      .accessfn = aa64_cacheop_poc_access },
+    REGINFO_SENTINEL
+};
+
 #endif
 
 static CPAccessResult access_predinv(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -8071,8 +8134,10 @@ void register_cp_regs_for_features(ARMCPU *cpu)
      */
     if (cpu_isar_feature(aa64_mte, cpu)) {
         define_arm_cp_regs(cpu, mte_reginfo);
+        define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     } else if (cpu_isar_feature(aa64_mte_insn_reg, cpu)) {
         define_arm_cp_regs(cpu, mte_tco_ro_reginfo);
+        define_arm_cp_regs(cpu, mte_el0_cacheop_reginfo);
     }
 #endif
 
-- 
2.25.1

