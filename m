Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1478775wrt;
        Wed, 10 Oct 2018 13:38:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61fOGy72+J3fXuwE/WRQAzwpoGgJjp180+DUjSDSMGzqoL29HNmivJ4Eg9snKrd2JzEoFSU
X-Received: by 2002:ac8:88:: with SMTP id c8-v6mr28500311qtg.173.1539203933477;
        Wed, 10 Oct 2018 13:38:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539203933; cv=none;
        d=google.com; s=arc-20160816;
        b=bOCqCiJOcPmeDZPkSmA0LA1ZiRJtvy+0ApTOl7ZvbMj4+55RUtunQsmqBg5ceYQ6WG
         KNFmXT5aJZm2jBezFvY66dhhbyEtRI1Ny4Dajpp96fbg2+nTkhEUr9EewHQgiUvrljoj
         WpKEiJ8DXvxUx2An+112BstvBYzhF5hgAAYhEFRiStEHoXUGKv86I0Jr5BSLKLn3bjE3
         P/oRfK14B1sblulNz2PM/fsiveq2Ycu3I4KeXEdYtUxEkDDjI6uneAQLSWWDWuAamwB+
         K0LIwVZm/DEMCfcklWF7gmFimWPMJ6nKp9dSiCrEG8hitbflDJrcTuCM7h27QhtnIlxV
         FNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=AnhG0/ln6p/5gZevgYimHTnAiMxu17Lcq2p4OJVwhik=;
        b=GgPwk/saI620EsR2YEgTmO9CLhoUWerNhqZ4iK1Ae6f7nlK3+5GqGRNeZloHxp2Hzh
         /zPY17vYDzdCZLPnSCaplNTqogeZgZkHgkA7+NRzWJiNXDFdB/nfaTRVpVCtJe0RUc3v
         L9ukmXqMsE2Va9IOnB7MdTMwGuGyOUGFsCzfjK8A/lYspBOC9N4RhN95bel0a1IDArT1
         012yL2bv1j+7dnzLT+QdQfR61o0JmlypB5IImku9y7uzs20olVGr6P6ToKkHlYs0jGJn
         JqlodxUWgY8heUvjTqjStIwzBfFy6JCdMaIs/LJ8+cjnZ7i5A1in0umNuESisLkVrrqd
         9o3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qZluxc2H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f55-v6si4281709qtc.65.2018.10.10.13.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:38:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qZluxc2H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59022 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALFs-0002qX-UT
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:38:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFZ-0002ov-5t
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFW-0002Qq-Tn
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:33 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:47096)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFW-0002QO-Oz; Wed, 10 Oct 2018 16:38:30 -0400
Received: by mail-yw1-xc44.google.com with SMTP id j202-v6so2710196ywa.13;
	Wed, 10 Oct 2018 13:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=AnhG0/ln6p/5gZevgYimHTnAiMxu17Lcq2p4OJVwhik=;
	b=qZluxc2HhKFPdM1xvKHLm3ozdP7BNmdCOknzP+UT0wv1+BTY6x3i7GMb0qqBli+1Wd
	djTAlJmus0o3YJhzMUM6j0YwvrO+1Kd21AkQOmdy8d+D5DmaBfohgYDqNdVss7hwbjpN
	PYrvpZDuHqPOaObhP/xRebxB7KRkS62n9AxPFG2yYzdD1xNuSa6Ff4MbTwmrGXCIM58b
	F0rjwm+UNazjNCPpdI/wEfS++fmgWxRRwENa8gHCPJqLysySwHT1Mz+q3/vsNxnRQFe8
	+2XjB0sY5xfugSck+MuT+X4kLgD1GG97kQkOHKNoUHDnj2Mas9fPJ+bhe+yKLbs/Fcmh
	fyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=AnhG0/ln6p/5gZevgYimHTnAiMxu17Lcq2p4OJVwhik=;
	b=Qq+uw1oObvgTLhRsbpZD9TIa6rpjOpBYAYkDQCogKaF5ZlDVx594i2O4eWMk1nvGSk
	vT+u6+rG05Bm3P2SVAfL/G2vO+B7CsO3cvAOPVupiIt3YhnDQw/PBqAAB5A1nGkYi0ku
	uUHsbIHhVL9+Z0FuQlW2xhbC9SYmPfkC6iDsIqkxOzH4ab3g/AEqTr/AG2qrKou5r0JC
	MUIFOi/frzQySCG45ErbBYk/JbWvH0SIbJer5a+6QFU1l+KbMw/bo8YVzE62GPOi3aYr
	CHtvo5CSzDT/r8g0DGGVtnq3IT+Z9/P4DaiAq1SBv/0KPfyXeKtBemsHTwnrkT07ajLe
	EtwA==
X-Gm-Message-State: ABuFfojbVU+2U6ISYjJztTROHudOUBOdDcw10TZscuxs6CnbHkh+YnRD
	A4y5y1TF9xtOdNLk7CS2/0uL/L+X
X-Received: by 2002:a81:560a:: with SMTP id
	k10-v6mr19013985ywb.80.1539203910103; 
	Wed, 10 Oct 2018 13:38:30 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:29 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:28 -0400
Message-Id: <20181010203735.27918-8-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c44
Subject: [Qemu-arm] [PATCH v6 07/14] target/arm: Allow AArch32 access for
 PMCCFILTR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>, Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nwUrAN67GxBN

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 52bd13fdde..e804caaced 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -961,6 +961,10 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
                                PMXEVTYPER_M | PMXEVTYPER_MT | \
                                PMXEVTYPER_EVTCOUNT)
 
+#define PMCCFILTR             0xf8000000
+#define PMCCFILTR_M           PMXEVTYPER_M
+#define PMCCFILTR_EL0         (PMCCFILTR | PMCCFILTR_M)
+
 static inline uint32_t pmu_num_counters(CPUARMState *env)
 {
   return (env->cp15.c9_pmcr & PMCRN_MASK) >> PMCRN_SHIFT;
@@ -1264,10 +1268,26 @@ static void pmccfiltr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
     pmccntr_op_start(env);
-    env->cp15.pmccfiltr_el0 = value & 0xfc000000;
+    env->cp15.pmccfiltr_el0 = value & PMCCFILTR_EL0;
+    pmccntr_op_finish(env);
+}
+
+static void pmccfiltr_write_a32(CPUARMState *env, const ARMCPRegInfo *ri,
+                            uint64_t value)
+{
+    pmccntr_op_start(env);
+    /* M is not accessible from AArch32 */
+    env->cp15.pmccfiltr_el0 = (env->cp15.pmccfiltr_el0 & PMCCFILTR_M) |
+        (value & PMCCFILTR);
     pmccntr_op_finish(env);
 }
 
+static uint64_t pmccfiltr_read_a32(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    /* M is not visible in AArch32 */
+    return env->cp15.pmccfiltr_el0 & PMCCFILTR;
+}
+
 static void pmcntenset_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1489,6 +1509,11 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .readfn = pmccntr_read, .writefn = pmccntr_write,
       .raw_readfn = raw_read, .raw_writefn = raw_write, },
 #endif
+    { .name = "PMCCFILTR", .cp = 15, .opc1 = 0, .crn = 14, .crm = 15, .opc2 = 7,
+      .writefn = pmccfiltr_write_a32, .readfn = pmccfiltr_read_a32,
+      .access = PL0_RW, .accessfn = pmreg_access,
+      .type = ARM_CP_ALIAS | ARM_CP_IO,
+      .resetvalue = 0, },
     { .name = "PMCCFILTR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 15, .opc2 = 7,
       .writefn = pmccfiltr_write, .raw_writefn = raw_write,
-- 
2.19.1

