Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp31390lfc;
        Tue, 2 Jun 2020 18:14:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6Kye+pcO7tV6snz8CSAWPRdDqR+1jXMgRGORGUCWzqck8QQo7w3ka9m6Xs1W6Cy9NB3u7
X-Received: by 2002:a25:3108:: with SMTP id x8mr9967699ybx.282.1591146890016;
        Tue, 02 Jun 2020 18:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591146890; cv=none;
        d=google.com; s=arc-20160816;
        b=h+bA0290PIP42cLBpJAd05cD1o7JRJ7DVk4FYtulLGxaRbZXNrnTgaWNfwD2R2IWuc
         8YMeP0P6+xSUzr5fER1LhipkSBaV7Qi8w1I7UQ0hb2RboEa0l3BnAhf2s/aKrR0g1O+d
         /P20KsPZwZPQNRhBEzwghhP7ySKBtojFI0ZyKlR3pcD9mFTeOG4MWfg6q1mAjFvU2VEm
         Ek1yK5OotwG3XIYj7VqVg6D5H5XKo0lIHFsTiXfRcV6PgLNwrPc/gyjsSaz/eyGqeTGH
         Iab5JPxmOsZKeTFOKAMfXAjt2P6rrx+R8Dj9pp/410Jhv3KPxWMXB5gp4WOd5iBCpfZV
         r3/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=w0iAAPJiPUMN5WMvx91TGcplu0Afl0eDKA3EhLW5gNo=;
        b=mXk6A0y+MoNIEUozaNvKhUCgfse9EEaiCzzEcibWS5WaXuq/ch4As4Jkf6j5PKjjgB
         ChhPm/GAPqDrujpLjiNKmR7ON4bcowTp79NHcwz4XyRtUCe555c3JePd2SP0bM2OzDYN
         52e6C7B6C0BAnHsc1fR720u8EbxeihzavQL6i9/MH0CyzWyYpUTyyZhxxU6gFn7bY/ka
         XIuvhzpWv6vp5tPWRRgn+7AJ0Jsl1rXoYVyq2mOnN61Uiuxiqf/Ztxb/lF9PbD21nDwp
         4VI5NceeKGxiM3ln8zUCfB25jSUC9DPBe97uE+1U6zeWEg2gHylr5bu9uzygLR3whJi3
         oE9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PFmMIelk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i184si264217yba.377.2020.06.02.18.14.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:14:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PFmMIelk;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgHzV-0005IK-BU
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:14:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHy8-0003JJ-Ko
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:24 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHy8-0003W6-0o
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 21:13:24 -0400
Received: by mail-pf1-x444.google.com with SMTP id j1so258215pfe.4
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 18:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w0iAAPJiPUMN5WMvx91TGcplu0Afl0eDKA3EhLW5gNo=;
 b=PFmMIelkaLMfRJ69igouLY4t2p0h6QeXvGx/htpKH8meFoeZa6CHwBtSs8fnerkGZi
 1Ip6W5CFanpbjzkUSueDx7t5yRm9nYJ4X/ekZZZBskew3VrMo/5tS1/C+hYtH7NmBZw0
 pLK04b01a4DazOrnUcyaZVwnwXmzf7omD5n+/CPR9DEenRrHGCNo1RG6sTRP39s4R1Pj
 sXiDeJHCGeFS0PVSZ7HRY4wotTlvApfdsvQwOD+B3twvbdVLydn0CVfBl9dKUq0BUlou
 vKc72Lhjg100ZorDtU1rqVT8CYAgjg5Lwwri4fh/z3zQ9f1ph/yXG25dRtQlsP9Jrg9c
 foTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w0iAAPJiPUMN5WMvx91TGcplu0Afl0eDKA3EhLW5gNo=;
 b=C0QS7wbbWiG8MB9GYQCp9lyfmdhj8ulNDWt5iTFNsxb6JqU7Z/IJDbU82fLWf9yKWg
 FEyM3kLSSjwmRipzQSAjeMLdHQZqR38uzKwRMKgpE6Geo+JqTscgSfl+DlZHsIyWQWn3
 02P4K/gZ0Y2KtvlfGVyb8Z/ZeiVHJQFja+6byxmm9JAqBX64jIgfQj30pGtoxmhK0mBO
 ECv58HFMo0rkYyRDskM4omfctLOxBLOy2hF/GtwkcWBNvXdO75vorL1cQHmhAKpHrx7c
 5urMjtVPIKgsL8WPk2x9LO8v2D4jSp6U7uZ3AkrslsPPNokVE0fPvHSB4cBnH5qkI+YP
 k0pg==
X-Gm-Message-State: AOAM530xxnQxGeXY1k3AWvC2+DshbTZ4iLbrrsIFB7IfzHcxRyj3cRfp
 HjSqjg+wTU5UD6Twkvrxd1gqJkpP378=
X-Received: by 2002:a17:90a:5806:: with SMTP id
 h6mr2442263pji.66.1591146802500; 
 Tue, 02 Jun 2020 18:13:22 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/42] target/arm: Add support for MTE to SCTLR_ELx
Date: Tue,  2 Jun 2020 18:12:38 -0700
Message-Id: <20200603011317.473934-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iH6GdUCtSp9b

This does not attempt to rectify all of the res0 bits, but does
clear the mte bits when not enabled.  Since there is no high-part
mapping of SCTLR, aa32 mode cannot write to these bits.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2ec49c1a55..7862bf502d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -4698,6 +4698,22 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 {
     ARMCPU *cpu = env_archcpu(env);
 
+    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
+        /* M bit is RAZ/WI for PMSA with no MPU implemented */
+        value &= ~SCTLR_M;
+    }
+
+    /* ??? Lots of these bits are not implemented.  */
+
+    if (ri->state == ARM_CP_STATE_AA64 && !cpu_isar_feature(aa64_mte, cpu)) {
+        if (ri->opc1 == 6) { /* SCTLR_EL3 */
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
+        } else {
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
+                       SCTLR_ATA0 | SCTLR_ATA);
+        }
+    }
+
     if (raw_read(env, ri) == value) {
         /* Skip the TLB flush if nothing actually changed; Linux likes
          * to do a lot of pointless SCTLR writes.
@@ -4705,13 +4721,8 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         return;
     }
 
-    if (arm_feature(env, ARM_FEATURE_PMSA) && !cpu->has_mpu) {
-        /* M bit is RAZ/WI for PMSA with no MPU implemented */
-        value &= ~SCTLR_M;
-    }
-
     raw_write(env, ri, value);
-    /* ??? Lots of these bits are not implemented.  */
+
     /* This may enable/disable the MMU, so do a TLB flush.  */
     tlb_flush(CPU(cpu));
 
-- 
2.25.1

