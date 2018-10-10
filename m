Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1487466wrt;
        Wed, 10 Oct 2018 13:48:00 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62dMXdsAqR7EcNosGzfSgoLwh27U6UofZevUEj17f9MnlSOtHCjhwmdp1PWftc3vrRqtosh
X-Received: by 2002:a37:cf88:: with SMTP id v8-v6mr26192433qkl.355.1539204480253;
        Wed, 10 Oct 2018 13:48:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539204480; cv=none;
        d=google.com; s=arc-20160816;
        b=vp1AFSNFR1yq+1CT7cvdJdVddFeLzBUY7grqsMIjVt9MHTpDtnNGx+pel/aZjvo0Bc
         WsEYHXp9eXmGZr0OrUAY4iQEc6RS38HH5bCSZU4ttofGKkTL2ItWioGUl5DWzuXPUbbo
         rogDklKhJgemhBAX0g49y1AuTLSYA+UDkHoGeggJ2jX/G+DTMTVoN8Jey22aSHCpaZpk
         NEOBGGSwBR83rCRlNUagD/yLwIzjhZiSwoXL75gt6YPr6is6+ZxE7MEg2iVLwMQ5Vl/s
         D202fWV11kl/OcLxwvodSuopW6jYID3e6AIYzNjHiyId+Y2dqzdGMncuKr685ZJCymNs
         q1Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YJ6eE9L423EKbyHgFwS2f9XgDpoJJ4DU/ssXptC2hWQ=;
        b=OVPOptKMO3n4I/hp4HRD47uR0trB/+ES9KvxWbhqGkZN+EkN4MCIlvNTOLFmsfIdYh
         NeN6H7iizO2qyRTrFEAQF643u2ykmRDscyGOImCaCVO2fghEnqUgyOqwkuowFiy6Z2kT
         zEZMXXGf6/Te6k68ZT6Lj2VDOT3lk8Nte7GtfvvqIMgxizHXioU3XR1s5c6RMGziU6R3
         yLbKJOFLbU3aAMRLE9lefZDPTB1TfMrt+BpQb/Lxu7X6+JWAdItvvxGwdNeYnKAcgGW+
         PfNcX3VCPzbkVbQW76tZwVTr4SJHktc90sPMy36PAEuZdM8fR4tnFw2CideAKsTnIEHU
         9hrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=deB4FQOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y23-v6si2577621qto.342.2018.10.10.13.48.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:48:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=deB4FQOr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59084 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALOh-0001VA-R9
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:47:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFi-0002wF-CN
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 16:38:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFh-0002k6-IG
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 16:38:42 -0400
Received: from mail-yw1-xc29.google.com ([2607:f8b0:4864:20::c29]:44722)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFc-0002XI-Ky; Wed, 10 Oct 2018 16:38:36 -0400
Received: by mail-yw1-xc29.google.com with SMTP id s73-v6so2710425ywg.11;
	Wed, 10 Oct 2018 13:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YJ6eE9L423EKbyHgFwS2f9XgDpoJJ4DU/ssXptC2hWQ=;
	b=deB4FQOrIsIZ9P4Nm3RNbpVIQA8SCtTpMR5nWT7iEM4o1e+hYzwS9k2Rq5u8HN3GQk
	if6glw0NfW3qWblWKvMibJli3LlIQ4cb+CR9iSTXbmSrlRqGaOsGIIvj8habLV3ya3+3
	H2VIZmMsYG49ImDuC4IRNmlh8hKrSrT/aC9QVUBWVEtMMmPFv1JU0A3OMLSONO7kE9Yv
	HkqQn16IaGM+yCpAwN7xw7ktzxWD0JX8dahndGIcoFArwmQgbsKbE/aJzxlMH3n4TbZE
	b2ktKD1aJ6z/M0uhjdN7Efr0dNaXKiq24bAastAWTt+Hd5wP86n2aRRVE5qvHXDYK6+o
	smeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YJ6eE9L423EKbyHgFwS2f9XgDpoJJ4DU/ssXptC2hWQ=;
	b=BxUsfiDSyI+58dOfgt68eAwUx2lgpp9Uadn2uEXgXySNjhtRayPX+C+x0trxVzLP/a
	fiaTtXbBuGJTIasC6qyQiIFto/irgLw3rN2FYXJXpTT9yyK5QGMV93710mzoKIqIZHdX
	MusjgFlazRq6ZMHaYRo5P20AElS5Tr78RbtMf4aPBQjO2naBqS2YQ755GEvhTUSRZUBS
	bkkhqTlfO/rOVmUQkHyG+nz7TxpD8upu63CWXnIITQqqeaBhQL33H31B9oomXeVySwV1
	7j2Ja0nkttD7jzXWbV2v4fsPCaPnhB2pdjvGejgdO7oB+iiJF2kqGppUkBHjAB1m/af8
	4ijw==
X-Gm-Message-State: ABuFfojQxJcKEkLPsGGJj3FXz0q7o/IWLo9Rfv8C109zvGfTzWr+QCYu
	rhIPSlLqOphg9pZSP/lxgOWGeu4h
X-Received: by 2002:a81:764b:: with SMTP id
	j11-v6mr19476632ywk.137.1539203915885; 
	Wed, 10 Oct 2018 13:38:35 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:35 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:34 -0400
Message-Id: <20181010203735.27918-14-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c29
Subject: [Qemu-devel] [PATCH v6 13/14] target/arm: Implement PMSWINC
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SKqU6jrdEnyt

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/helper.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 89ceb34cb9..6c2a899009 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -994,6 +994,15 @@ static bool event_always_supported(CPUARMState *env)
     return true;
 }
 
+static uint64_t swinc_get_count(CPUARMState *env)
+{
+    /*
+     * SW_INCR events are written directly to the pmevcntr's by writes to
+     * PMSWINC, so there is no underlying count maintained by the PMU itself
+     */
+    return 0;
+}
+
 /*
  * Return the underlying cycle count for the PMU cycle counters. If we're in
  * usermode, simply return 0.
@@ -1021,6 +1030,10 @@ static uint64_t instructions_get_count(CPUARMState *env)
 #endif
 
 static const pm_event pm_events[] = {
+    { .number = 0x000, /* SW_INCR */
+      .supported = event_always_supported,
+      .get_count = swinc_get_count,
+    },
 #ifndef CONFIG_USER_ONLY
     { .number = 0x008, /* INST_RETIRED, Instruction architecturally executed */
       .supported = instructions_supported,
@@ -1345,6 +1358,24 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     pmu_op_finish(env);
 }
 
+static void pmswinc_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                          uint64_t value)
+{
+    unsigned int i;
+    for (i = 0; i < pmu_num_counters(env); i++) {
+        /* Increment a counter's count iff: */
+        if ((value & (1 << i)) && /* counter's bit is set */
+                /* counter is enabled and not filtered */
+                pmu_counter_enabled(env, i) &&
+                /* counter is SW_INCR */
+                (env->cp15.c14_pmevtyper[i] & PMXEVTYPER_EVTCOUNT) == 0x0) {
+            pmevcntr_op_start(env, i);
+            env->cp15.c14_pmevcntr[i]++;
+            pmevcntr_op_finish(env, i);
+        }
+    }
+}
+
 static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
     uint64_t ret;
@@ -1751,9 +1782,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.c9_pmovsr),
       .writefn = pmovsr_write,
       .raw_writefn = raw_write },
-    /* Unimplemented so WI. */
     { .name = "PMSWINC", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 4,
-      .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NOP },
+      .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NO_RAW,
+      .writefn = pmswinc_write },
+    { .name = "PMSWINC_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 12, .opc2 = 4,
+      .access = PL0_W, .accessfn = pmreg_access_swinc, .type = ARM_CP_NO_RAW,
+      .writefn = pmswinc_write },
     { .name = "PMSELR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 5,
       .access = PL0_RW, .type = ARM_CP_ALIAS,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmselr),
-- 
2.19.1

