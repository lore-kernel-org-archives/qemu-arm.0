Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1991376lfg;
        Tue, 25 Feb 2020 10:10:34 -0800 (PST)
X-Google-Smtp-Source: APXvYqycDY2gNaoHgwtMTWmOsyQZpgAI6lQ+qNMmPtb2SAKdtJ1e0xwRLtzEySwmw7lgwHK1sG38
X-Received: by 2002:a37:4c08:: with SMTP id z8mr91107qka.22.1582654234639;
        Tue, 25 Feb 2020 10:10:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582654234; cv=none;
        d=google.com; s=arc-20160816;
        b=uFVPwh0EJVQzi5UhphyAEJ8TCtl2nyMsND/mxSD/PGv132VWmBV4JU5n7iRw82VMIP
         b90plQUYEEoJZvWwunKERXOOJQ7LI5Bzetd0z1tXui7u5PsnFcPben1W44zgJI8ECF4k
         f/EIcACIqnrnw7nsWjkImsC7XcL1cqvH6GgnGHZEVQnRURM1w6s+FOOSP3Jw3MirA8M4
         lIA/Ekqp6UU1CxoLNBIbNIStWeBgxzMv2SJuIguj+DVk3poBHOU3YnTAfDSZUuUTpCcc
         a+/zzoI/jgzdNHC3uAsK+/fhI4A2B6qBI6v/Hc1SqV5jyRrlM6BEUVRtjla/Pq325mJ3
         oz5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rCn9KEM9PXXgFtnK73d+AiT9YkDrEQbzS/XrB8FG7Ao=;
        b=W+yOleASt3aZvDxAZ4Ytk4ZFqDDc/32g4cB46rH2F03PdQlzxvCrssUv37gAueii/s
         0YeJnkD/QPYCXOZia1hNkqoemtYy19i++gWSdcNyQWS60cRj3W5DwEjuu0Lombs0pMPW
         IZUfVxSFxTQuHv30T0OTlPxDSV+L++iWw+pb9n+NLo3UjPSf0m1dI4PwC5PC8YJXiUTA
         DLarLI3HPZ4vGhHoPUlUg4YR5oj2+XqivMIOIugLT6oFZHXad00P0CCQ543NF6NLE2Ks
         bpaqDY0eFMOD4MSq11DDfD/fNZbdIQWvvxSxtkuJY56XgsqQu3UPpciQRmyQ4Z4/f1FV
         +Wlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vflkItrc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p185si152548qke.32.2020.02.25.10.10.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2020 10:10:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vflkItrc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6efC-0005QU-2S
	for alex.bennee@linaro.org; Tue, 25 Feb 2020 13:10:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35076)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edP-0002Hf-VB
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6edO-0004R9-Lo
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:43 -0500
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:33747)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6edO-0004Ox-0r
 for qemu-arm@nongnu.org; Tue, 25 Feb 2020 13:08:42 -0500
Received: by mail-pj1-x1042.google.com with SMTP id m7so1265999pjs.0
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2020 10:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rCn9KEM9PXXgFtnK73d+AiT9YkDrEQbzS/XrB8FG7Ao=;
 b=vflkItrc76uuDrQG3Tf30j6zvOA2ZxcI4pATWtQjVFikv4q0rLhi8sBYziu61Y94qB
 fxVX/1YjWKKC/HyHcHNrkNIKRJunZhg1UBLl+iKbIlO/wj3Z50cPEg6NKtb3xEmfT037
 mGWtSkJ+UgIEzQPAKyEcUG3VbTAIf7GmclcE1T2rHOPEo2USHMWF/cfglm/S/9N7kbLN
 EsqW6f0FGbsDdpRigVoB2XEMwRiX/wsX8VMLBnPM5oqJP75NYGrxjYhTjmuhAZ+VRvf+
 crW6Jvu6TCux6c1xO83lE5UzAdzwZTQmkKG0D4LXPP7BJs8xVpxm2WsXk26X3HWJJ2uQ
 Heyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rCn9KEM9PXXgFtnK73d+AiT9YkDrEQbzS/XrB8FG7Ao=;
 b=HimrTMWMQhUShvM3NYNqDBHHsTMF2GDyYYUbZ9vfRNqYSupQWdZ8RCX+u5DrcqhnJb
 Ow1MHf9hCjn4MsHSWdsVi00mx9RIgHrrIRD5GLSnkRnNV4TbFz5G73hPDaY+dDjhaL80
 7LPQJM0R/ntzmjkS7rptKdy6wdKgSQwSWLolhtR+aw7mhpLR457slTgrqsbwF1y2bAu3
 8lyXXhOx60iSHvrXpEwL9/HdsnNMOm2a9RY09vpkq6DufGhNxzsyVRIcSujDXaw9+pEQ
 BODCzWlP3h3VoawbjTL93KR5WheSBmz7raM1vTWuHEfg6Wc6h2eh61o5AAavUwQ4EwUA
 1pVQ==
X-Gm-Message-State: APjAAAVBVzAKBWrDYHF3imqIGW6F2m6ck+/QVxq+m3uGpQ2Rfnt4nxbo
 FlK5kMU8kFOpGpTu9blyQDH05A==
X-Received: by 2002:a17:90a:8c0f:: with SMTP id
 a15mr248731pjo.86.1582654121046; 
 Tue, 25 Feb 2020 10:08:41 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id d69sm19069704pfd.72.2020.02.25.10.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 10:08:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] target/arm: Honor the HCR_EL2.TACR bit
Date: Tue, 25 Feb 2020 10:08:28 -0800
Message-Id: <20200225180831.26078-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200225180831.26078-1-richard.henderson@linaro.org>
References: <20200225180831.26078-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
X-TUID: nRoBDmoH11hx

This bit traps EL1 access to the auxiliary control registers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ea42e0d26d..5cb7844f3f 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -553,6 +553,16 @@ static CPAccessResult access_tsw(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+/* Check for traps from EL1 due to HCR_EL2.TACR.  */
+static CPAccessResult access_tacr(CPUARMState *env, const ARMCPRegInfo *ri,
+                                  bool isread)
+{
+    if (arm_current_el(env) == 1 && (arm_hcr_el2_eff(env) & HCR_TACR)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static void dacr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
 {
     ARMCPU *cpu = env_archcpu(env);
@@ -6924,8 +6934,8 @@ static const ARMCPRegInfo ats1cp_reginfo[] = {
 static const ARMCPRegInfo actlr2_hactlr2_reginfo[] = {
     { .name = "ACTLR2", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 3,
-      .access = PL1_RW, .type = ARM_CP_CONST,
-      .resetvalue = 0 },
+      .access = PL1_RW, .accessfn = access_tacr,
+      .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "HACTLR2", .state = ARM_CP_STATE_AA32,
       .cp = 15, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 3,
       .access = PL2_RW, .type = ARM_CP_CONST,
@@ -7681,8 +7691,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         ARMCPRegInfo auxcr_reginfo[] = {
             { .name = "ACTLR_EL1", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 0, .opc2 = 1,
-              .access = PL1_RW, .type = ARM_CP_CONST,
-              .resetvalue = cpu->reset_auxcr },
+              .access = PL1_RW, .accessfn = access_tacr,
+              .type = ARM_CP_CONST, .resetvalue = cpu->reset_auxcr },
             { .name = "ACTLR_EL2", .state = ARM_CP_STATE_BOTH,
               .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 0, .opc2 = 1,
               .access = PL2_RW, .type = ARM_CP_CONST,
-- 
2.20.1

