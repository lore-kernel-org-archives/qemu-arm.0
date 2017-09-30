Received: by 10.223.197.9 with SMTP id q9csp1227483wrf;
        Fri, 29 Sep 2017 19:09:42 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBRQQG2g2iyD19ZTwLGeI1ZC6zp8k52uJ2pIjORKLDYjwKQW/jXmp7c5TvJZGzqSPMc4EPT
X-Received: by 10.55.103.14 with SMTP id b14mr5942947qkc.267.1506737382560;
        Fri, 29 Sep 2017 19:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506737382; cv=none;
        d=google.com; s=arc-20160816;
        b=DYVK8yEriLuIorLGQTOsXPLZZNbOhNusDfJyWJeQ/Y3EDGxphH5HsYCoVFMcYV1zNl
         fMySvvt5bRMBOc6cPT0Q3EHozPPBxVZinAVtzY8O9XfUQsJdhB6hNFZOy5Vh1dQnDSRO
         dFvPCcUm7zG3X8P9OsaRQpvSZLeFWXeU0TnBSgeT3dKWLxG43gTds7yqs6sDWpN4j7q6
         xig2TMfz33/v0PxzCPNvp9amO6rKaM74JjiWzyaSOp03JUllk2tmi1w9gGi36GSIQFWs
         W4wymn5RwdHOl8xd50RS07Wit8nQWWoX3lti6ycmyK5VvrzvyNP8WCflAOj3QCPTx/Ju
         ydbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=+wVWDr1dDiOLNoUNH8HxQpuLSm7Vd9SgaqBlVi0fU/k=;
        b=aZOYLfEiDohnXSVOVftSLgLn9NvC1qrQ7E1SrD7bYoWXsqPg5XYlmGJvR3+2juAjZV
         szryHhvZ9bLoAj9CDNUnPIqmFFhOKM/sDkRbNIEGFDqBjbB9UTH/h40bNBceqme40krj
         SbQzA5ro/j3gu2XTpMuQNnfx2k3OZQ39yy3xW/JcGsqxvyHA1FIGq2uM4YuIZ4stPbrz
         jQB+owpgaYOTmFTEhqBiziI6Lf83lRk2czZrY76KbRXYCCo3aOs3x2+JAiHmBKK6koey
         OA/fISEXuEfQ7M1dZ9dt0KSd1Adx6Y85LTnwezjtblwxxj+CXs/U8oeo1HD/lmdVfsQM
         Gisg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AtxaboxS;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=hwL/8jt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si2299285qkd.252.2017.09.29.19.09.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Sep 2017 19:09:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=AtxaboxS;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=hwL/8jt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Received: from localhost ([::1]:37783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dy7Do-0002TK-7L
	for alex.bennee@linaro.org; Fri, 29 Sep 2017 22:09:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DY-0002Ps-7U
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1dy7DX-00051F-36
	for qemu-arm@nongnu.org; Fri, 29 Sep 2017 22:09:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:35052)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1dy7DW-0004yk-QJ; Fri, 29 Sep 2017 22:09:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 0DDD360B68; Sat, 30 Sep 2017 02:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737362;
	bh=7YU2QWEMySNqARZdGv6cx8SULI5F0r/7//dnxm8qBhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AtxaboxSjFw7MuTkR/Q5P7kNNcs6rVCMLE/jaAULBIFRQ4TtKMvG0SmKI0Z0o5Jp0
	Zn+zS0liHXowWDe6ODm73pOyqHI0sJ3ij5c7HLEHUzIArYdcgn9v7mAUm4aNckfLAJ
	5VVvny5G6AeDpgy53IuE/GFQECmB7lgfOlDEKUA0=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id ADB8760A09;
	Sat, 30 Sep 2017 02:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1506737361;
	bh=7YU2QWEMySNqARZdGv6cx8SULI5F0r/7//dnxm8qBhc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hwL/8jt8piRBw2y7Irav9A4e+JyBfUnCS8F+5DglzKmOdqXXKmT/NJ/znlncVoc/v
	g8sExM3Cawki56CyKPGADZW9QNOc70gHWDcY+pok0Hl1plbB1iivVaUZAncDOAve4x
	WgfdmVoPqHGDoangukdkjvb68qfFgf708xZkI7PM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ADB8760A09
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Wei Huang <wei@redhat.com>
Date: Fri, 29 Sep 2017 22:08:20 -0400
Message-Id: <1506737310-21880-4-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH 03/13] target/arm: Reorganize PMCCNTR read, write,
 sync
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: gntj64ZQ0ofP

pmccntr_read and pmccntr_write contained duplicate code that was already
being handled by pmccntr_sync. This also moves the calls to get the
clock inside the 'if' statement so they are not executed if not needed.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 55 ++++++++++++++++-------------------------------------
 1 file changed, 16 insertions(+), 39 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 40c9273..ecf8c55 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -973,17 +973,18 @@ static inline bool arm_ccnt_enabled(CPUARMState *env)
 
 void pmccntr_sync(CPUARMState *env)
 {
-    uint64_t temp_ticks;
+    if (arm_ccnt_enabled(env) &&
+          !pmu_counter_filtered(env, env->cp15.pmccfiltr_el0)) {
+        uint64_t temp_ticks;
 
-    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
+        temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
+                              ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
 
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        temp_ticks /= 64;
-    }
+        if (env->cp15.c9_pmcr & PMCRD) {
+            /* Increment once every 64 processor clock cycles */
+            temp_ticks /= 64;
+        }
 
-    if (arm_ccnt_enabled(env)) {
         env->cp15.c15_ccnt = temp_ticks - env->cp15.c15_ccnt;
     }
 }
@@ -1007,21 +1008,11 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    uint64_t total_ticks;
-
-    if (!arm_ccnt_enabled(env)) {
-        /* Counter is disabled, do not change value */
-        return env->cp15.c15_ccnt;
-    }
-
-    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        total_ticks /= 64;
-    }
-    return total_ticks - env->cp15.c15_ccnt;
+    uint64_t ret;
+    pmccntr_sync(env);
+    ret = env->cp15.c15_ccnt;
+    pmccntr_sync(env);
+    return ret;
 }
 
 static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
@@ -1038,22 +1029,8 @@ static void pmselr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                         uint64_t value)
 {
-    uint64_t total_ticks;
-
-    if (!arm_ccnt_enabled(env)) {
-        /* Counter is disabled, set the absolute value */
-        env->cp15.c15_ccnt = value;
-        return;
-    }
-
-    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
-                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
-
-    if (env->cp15.c9_pmcr & PMCRD) {
-        /* Increment once every 64 processor clock cycles */
-        total_ticks /= 64;
-    }
-    env->cp15.c15_ccnt = total_ticks - value;
+    env->cp15.c15_ccnt = value;
+    pmccntr_sync(env);
 }
 
 static void pmccntr_write32(CPUARMState *env, const ARMCPRegInfo *ri,
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.\nQualcomm Technologies, Inc. is a member of the\nCode Aurora Forum, a Linux Foundation Collaborative Project.

