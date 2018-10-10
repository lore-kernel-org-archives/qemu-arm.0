Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1481604wrt;
        Wed, 10 Oct 2018 13:41:48 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61J8PFyu3Zb+bLBlsf9/fggEB1dz/QCAVq+6EokDm8GauWXY1zUACOHUu9PmHfEH88sjlW7
X-Received: by 2002:ad4:4048:: with SMTP id r8mr9200101qvp.23.1539204108039;
        Wed, 10 Oct 2018 13:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539204108; cv=none;
        d=google.com; s=arc-20160816;
        b=ALeKA2oA0nGt/qkRA4aGPopO8CzEQY5o5vSInn/W/ciogdSR+ZB2dsRB6jEov2g28/
         rrZLQk/kM56o8WPF2Nj1HGwcOvPtNH+HIEaP8+Aw+fOBqxslGWVVZZuYKWGSuUV4eywu
         gq+xkrnYq+fyR4u3HSxIUESVGERKnUolOnU5Fr403t9y9WrtZlvzB2+tlvnKXcuqaUOu
         MAFSU6TJENvpPoWGd67vHD0i6znYvkewkh/3cw9PR6nGhOlTApH9HY73HB3TuOxLD3Id
         krQS4C9CYl6g94bJS/GZnQbBS0hGYRLZ4wGg7pNobCpGNtvp8cXMXN+NViTxkbocfFSN
         kH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0/oLOuK/SUhKNQ3tQWg3bSZl9Farv5I3v9vlbrlFe8A=;
        b=vFjV1j/uhfQxh0Gs/R7uanPBNJjpo+q//vRDCYmwMp9Z8dib+l0lAbf3OlXhWZRISH
         5UQkLOgRo9GKRjL3U0OdkisKXfZ8ubMUok0zdgpCQ+O/89xgmagVJkmv8fbBfKlVlCXD
         IWeC/jvbNySowCNN+hvR6wbmM5OxzSlatWrlOVD/bac5CE7YBNe2aJ6FiXiu/Q1Ttbmk
         4G557XTd84uuIdCL9UcQpWWFwr/vqm8NsFgJXUtPdL6C533MNqMmVZwI7YHuBvnMjnz9
         mwFG9QtABQaCCNTJFSo6OEod7C6fZM/dCbrJYqXSzXyLbSY2YCbiEpK6DOiErBY1LPkK
         RwxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RIa5IeY1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w15-v6si1498172qtb.24.2018.10.10.13.41.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:41:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RIa5IeY1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALIh-0005HA-EM
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:41:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFd-0002u1-BU
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFa-0002UH-4N
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:37 -0400
Received: from mail-yw1-xc2e.google.com ([2607:f8b0:4864:20::c2e]:37542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFZ-0002Tw-TH; Wed, 10 Oct 2018 16:38:34 -0400
Received: by mail-yw1-xc2e.google.com with SMTP id y14-v6so2726353ywa.4;
	Wed, 10 Oct 2018 13:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0/oLOuK/SUhKNQ3tQWg3bSZl9Farv5I3v9vlbrlFe8A=;
	b=RIa5IeY1tTbUIci7o8u+PehHCchEVUwFTe5sL1q6rrc8/9OUJqP22QKmKfdDEnT6mZ
	TnyD3QcDaVTFflVmN2sE/5ZhmlcjHB67Mh2VU3rrUZiaQATpGeuRKO7LPszm0G8gJWMi
	XLVF33w4HDxvuyn82qFiavsrvupOaKh6909cRpebNMPGIaN3vYA4kVD9rLZTJ6ngIQsa
	PDXuteOChQEXqlWACVkiWT3XyIG9pIEMYKDpYbSmt4tjGRlGeAnMAIUJIW8hHlsH99R+
	uKbiskwOi2oFll9MOXeSVV+Rc60crhbR7HpvwJf3HVPX+GF6xEFSyZj5lJzNtjKf8N4r
	zHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0/oLOuK/SUhKNQ3tQWg3bSZl9Farv5I3v9vlbrlFe8A=;
	b=jhyJMEhrLUSwhIPG37NQvtrPQAd4k0VgscdOTtce0myjuW64wymIVzq2P0UwDVPMqf
	RfaLWEQJ1BfRFye0A98cgD5MIOrPkxINdsABabMeJcLFizDQAgcqE0qcQmn3dfN7Is6O
	R5UOiP939uy4mhplc0Zas22jSYq/QDgycG+CnIdW4HE2eQkxekZY0UUYm7SGg51ortRH
	mjPLjRekGl1f3zXuStyhx7DO+85c9XHHv42XWfTw7VZNxp1ytQYwiWZtj+XWESN9Fber
	tvOzMz16vwADMLhGpvVMlnAWjA6x/9dTg5CKXYA3C6fepB+EbSFHs24O0INOECaAo1KE
	DQpg==
X-Gm-Message-State: ABuFfohf2u6iNHR9b6MNYKSTAvZK9AeMQw2S7d7JvFlO/Cw3QugwU5VU
	b2NpPtjPc4Ib7t2t1oXEtq2vYBJD
X-Received: by 2002:a81:3088:: with SMTP id
	w130-v6mr19682931yww.230.1539203912984; 
	Wed, 10 Oct 2018 13:38:32 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:32 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:31 -0400
Message-Id: <20181010203735.27918-11-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c2e
Subject: [Qemu-arm] [PATCH v6 10/14] target/arm: Finish implementation of
 PM[X]EVCNTR and PM[X]EVTYPER
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
X-TUID: zQ64dWjG4LdC

Add arrays to hold the registers, the definitions themselves, access
functions, and logic to reset counters when PMCR.P is set. Update
filtering code to support counters other than PMCCNTR. Support migration
with raw read/write functions.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
---
 target/arm/cpu.h    |   3 +
 target/arm/helper.c | 296 +++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 282 insertions(+), 17 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cc026f0b75..f4317f87c9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -482,6 +482,9 @@ typedef struct CPUARMState {
          * pmccntr_op_finish.
          */
         uint64_t c15_ccnt_delta;
+        uint64_t c14_pmevcntr[31];
+        uint64_t c14_pmevcntr_delta[31];
+        uint64_t c14_pmevtyper[31];
         uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
         uint64_t vpidr_el2; /* Virtualization Processor ID Register */
         uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 375b6dcda5..f0798f7a8c 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -946,6 +946,7 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMCRDP  0x10
 #define PMCRD   0x8
 #define PMCRC   0x4
+#define PMCRP   0x2
 #define PMCRE   0x1
 
 #define PMXEVTYPER_P          0x80000000
@@ -1018,6 +1019,17 @@ uint64_t get_pmceid(CPUARMState *env)
     return pmceid;
 }
 
+/*
+ * Check at runtime whether a PMU event is supported for the current machine
+ */
+static bool event_supported(uint16_t number)
+{
+    if (number > MAX_EVENT_ID) {
+        return false;
+    }
+    return supported_event_map[number] != UNSUPPORTED_EVENT;
+}
+
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
@@ -1137,9 +1149,11 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
         prohibited = env->cp15.c9_pmcr & PMCRDP;
     }
 
-    /* TODO Remove assert, set filter to correct PMEVTYPER */
-    assert(counter == 31);
-    filter = env->cp15.pmccfiltr_el0;
+    if (counter == 31) {
+        filter = env->cp15.pmccfiltr_el0;
+    } else {
+        filter = env->cp15.c14_pmevtyper[counter];
+    }
 
     p   = filter & PMXEVTYPER_P;
     u   = filter & PMXEVTYPER_U;
@@ -1159,6 +1173,17 @@ static inline bool pmu_counter_enabled(CPUARMState *env, uint8_t counter)
         filtered = m != p;
     }
 
+    if (counter != 31) {
+        /*
+         * If not checking PMCCNTR, ensure the counter is setup to an event we
+         * support
+         */
+        uint16_t event = filter & PMXEVTYPER_EVTCOUNT;
+        if (!event_supported(event)) {
+            return false;
+        }
+    }
+
     return enabled && !prohibited && !filtered;
 }
 
@@ -1205,14 +1230,47 @@ void pmccntr_op_finish(CPUARMState *env)
     }
 }
 
+static void pmevcntr_op_start(CPUARMState *env, uint8_t counter)
+{
+
+    uint16_t event = env->cp15.c14_pmevtyper[counter] & PMXEVTYPER_EVTCOUNT;
+    uint64_t count = 0;
+    if (event_supported(event)) {
+        uint16_t event_idx = supported_event_map[event];
+        count = pm_events[event_idx].get_count(env);
+    }
+
+    if (pmu_counter_enabled(env, counter)) {
+        env->cp15.c14_pmevcntr[counter] =
+            count - env->cp15.c14_pmevcntr_delta[counter];
+    }
+    env->cp15.c14_pmevcntr_delta[counter] = count;
+}
+
+static void pmevcntr_op_finish(CPUARMState *env, uint8_t counter)
+{
+    if (pmu_counter_enabled(env, counter)) {
+        env->cp15.c14_pmevcntr_delta[counter] -=
+            env->cp15.c14_pmevcntr[counter];
+    }
+}
+
 void pmu_op_start(CPUARMState *env)
 {
+    unsigned int i;
     pmccntr_op_start(env);
+    for (i = 0; i < pmu_num_counters(env); i++) {
+        pmevcntr_op_start(env, i);
+    }
 }
 
 void pmu_op_finish(CPUARMState *env)
 {
+    unsigned int i;
     pmccntr_op_finish(env);
+    for (i = 0; i < pmu_num_counters(env); i++) {
+        pmevcntr_op_finish(env, i);
+    }
 }
 
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored)
@@ -1235,6 +1293,13 @@ static void pmcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
         env->cp15.c15_ccnt = 0;
     }
 
+    if (value & PMCRP) {
+        unsigned int i;
+        for (i = 0; i < pmu_num_counters(env); i++) {
+            env->cp15.c14_pmevcntr[i] = 0;
+        }
+    }
+
     /* only the DP, X, D and E bits are writable */
     env->cp15.c9_pmcr &= ~0x39;
     env->cp15.c9_pmcr |= (value & 0x39);
@@ -1288,6 +1353,14 @@ void pmccntr_op_finish(CPUARMState *env)
 {
 }
 
+void pmevcntr_op_start(CPUARMState *env, uint8_t i)
+{
+}
+
+void pmevcntr_op_finish(CPUARMState *env, uint8_t i)
+{
+}
+
 void pmu_op_start(CPUARMState *env)
 {
 }
@@ -1358,30 +1431,174 @@ static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->cp15.c9_pmovsr |= value;
 }
 
-static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
-                             uint64_t value)
+static void pmevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value, const uint8_t counter)
 {
+    if (counter == 31) {
+        pmccfiltr_write(env, ri, value);
+    } else if (counter < pmu_num_counters(env)) {
+        pmevcntr_op_start(env, counter);
+
+        /*
+         * If this counter's event type is changing, store the current
+         * underlying count for the new type in c14_pmevcntr_delta[counter] so
+         * pmevcntr_op_finish has the correct baseline when it converts back to
+         * a delta.
+         */
+        uint16_t old_event = env->cp15.c14_pmevtyper[counter] &
+            PMXEVTYPER_EVTCOUNT;
+        uint16_t new_event = value & PMXEVTYPER_EVTCOUNT;
+        if (old_event != new_event) {
+            uint64_t count = 0;
+            if (event_supported(new_event)) {
+                uint16_t event_idx = supported_event_map[new_event];
+                count = pm_events[event_idx].get_count(env);
+            }
+            env->cp15.c14_pmevcntr_delta[counter] = count;
+        }
+
+        env->cp15.c14_pmevtyper[counter] = value & PMXEVTYPER_MASK;
+        pmevcntr_op_finish(env, counter);
+    }
     /* Attempts to access PMXEVTYPER are CONSTRAINED UNPREDICTABLE when
      * PMSELR value is equal to or greater than the number of implemented
      * counters, but not equal to 0x1f. We opt to behave as a RAZ/WI.
      */
-    if (env->cp15.c9_pmselr == 0x1f) {
-        pmccfiltr_write(env, ri, value);
+}
+
+static uint64_t pmevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri,
+                               const uint8_t counter)
+{
+    if (counter == 31) {
+        return env->cp15.pmccfiltr_el0;
+    } else if (counter < pmu_num_counters(env)) {
+        return env->cp15.c14_pmevtyper[counter];
+    } else {
+      /*
+       * We opt to behave as a RAZ/WI when attempts to access PMXEVTYPER
+       * are CONSTRAINED UNPREDICTABLE. See comments in pmevtyper_write().
+       */
+        return 0;
     }
 }
 
+static void pmevtyper_writefn(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint64_t value)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    pmevtyper_write(env, ri, value, counter);
+}
+
+static void pmevtyper_rawwrite(CPUARMState *env, const ARMCPRegInfo *ri,
+                               uint64_t value)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    env->cp15.c14_pmevtyper[counter] = value;
+
+    /*
+     * pmevtyper_rawwrite is called between a pair of pmu_op_start and
+     * pmu_op_finish calls when loading saved state for a migration. Because
+     * we're potentially updating the type of event here, the value written to
+     * c14_pmevcntr_delta by the preceeding pmu_op_start call may be for a
+     * different counter type. Therefore, we need to set this value to the
+     * current count for the counter type we're writing so that pmu_op_finish
+     * has the correct count for its calculation.
+     */
+    uint16_t event = value & PMXEVTYPER_EVTCOUNT;
+    if (event_supported(event)) {
+        uint16_t event_idx = supported_event_map[event];
+        env->cp15.c14_pmevcntr_delta[counter] =
+            pm_events[event_idx].get_count(env);
+    }
+}
+
+static uint64_t pmevtyper_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    return pmevtyper_read(env, ri, counter);
+}
+
+static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    pmevtyper_write(env, ri, value, env->cp15.c9_pmselr & 31);
+}
+
 static uint64_t pmxevtyper_read(CPUARMState *env, const ARMCPRegInfo *ri)
 {
-    /* We opt to behave as a RAZ/WI when attempts to access PMXEVTYPER
-     * are CONSTRAINED UNPREDICTABLE. See comments in pmxevtyper_write().
+    return pmevtyper_read(env, ri, env->cp15.c9_pmselr & 31);
+}
+
+static void pmevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value, uint8_t counter)
+{
+    if (counter < pmu_num_counters(env)) {
+        pmevcntr_op_start(env, counter);
+        env->cp15.c14_pmevcntr[counter] = value;
+        pmevcntr_op_finish(env, counter);
+    }
+    /*
+     * We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
+     * are CONSTRAINED UNPREDICTABLE.
      */
-    if (env->cp15.c9_pmselr == 0x1f) {
-        return env->cp15.pmccfiltr_el0;
+}
+
+static uint64_t pmevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri,
+                              uint8_t counter)
+{
+    if (counter < pmu_num_counters(env)) {
+        uint64_t ret;
+        pmevcntr_op_start(env, counter);
+        ret = env->cp15.c14_pmevcntr[counter];
+        pmevcntr_op_finish(env, counter);
+        return ret;
     } else {
+      /* We opt to behave as a RAZ/WI when attempts to access PM[X]EVCNTR
+       * are CONSTRAINED UNPREDICTABLE. */
         return 0;
     }
 }
 
+static void pmevcntr_writefn(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    pmevcntr_write(env, ri, value, counter);
+}
+
+static uint64_t pmevcntr_readfn(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    return pmevcntr_read(env, ri, counter);
+}
+
+static void pmevcntr_rawwrite(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    assert(counter < pmu_num_counters(env));
+    env->cp15.c14_pmevcntr[counter] = value;
+    pmevcntr_write(env, ri, value, counter);
+}
+
+static uint64_t pmevcntr_rawread(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    uint8_t counter = ((ri->crm & 3) << 3) | (ri->opc2 & 7);
+    assert(counter < pmu_num_counters(env));
+    return env->cp15.c14_pmevcntr[counter];
+}
+
+static void pmxevcntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                             uint64_t value)
+{
+    pmevcntr_write(env, ri, value, env->cp15.c9_pmselr & 31);
+}
+
+static uint64_t pmxevcntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
+{
+    return pmevcntr_read(env, ri, env->cp15.c9_pmselr & 31);
+}
+
 static void pmuserenr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                             uint64_t value)
 {
@@ -1571,16 +1788,23 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
       .resetvalue = 0, },
     { .name = "PMXEVTYPER", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 1,
-      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access,
       .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
     { .name = "PMXEVTYPER_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 1,
-      .access = PL0_RW, .type = ARM_CP_NO_RAW, .accessfn = pmreg_access,
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access,
       .writefn = pmxevtyper_write, .readfn = pmxevtyper_read },
-    /* Unimplemented, RAZ/WI. */
     { .name = "PMXEVCNTR", .cp = 15, .crn = 9, .crm = 13, .opc1 = 0, .opc2 = 2,
-      .access = PL0_RW, .type = ARM_CP_CONST, .resetvalue = 0,
-      .accessfn = pmreg_access_xevcntr },
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access_xevcntr,
+      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
+    { .name = "PMXEVCNTR_EL0", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 2,
+      .access = PL0_RW, .type = ARM_CP_NO_RAW | ARM_CP_IO,
+      .accessfn = pmreg_access_xevcntr,
+      .writefn = pmxevcntr_write, .readfn = pmxevcntr_read },
     { .name = "PMUSERENR", .cp = 15, .crn = 9, .crm = 14, .opc1 = 0, .opc2 = 0,
       .access = PL0_R | PL1_RW, .accessfn = access_tpm,
       .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmuserenr),
@@ -4339,7 +4563,7 @@ static const ARMCPRegInfo el2_cp_reginfo[] = {
 #endif
     /* The only field of MDCR_EL2 that has a defined architectural reset value
      * is MDCR_EL2.HPMN which should reset to the value of PMCR_EL0.N; but we
-     * don't impelment any PMU event counters, so using zero as a reset
+     * don't implement any PMU event counters, so using zero as a reset
      * value for MDCR_EL2 is okay
      */
     { .name = "MDCR_EL2", .state = ARM_CP_STATE_BOTH,
@@ -5191,6 +5415,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
          * field as main ID register, and we implement only the cycle
          * count register.
          */
+        unsigned int i, pmcrn = 4;
 #ifndef CONFIG_USER_ONLY
         ARMCPRegInfo pmcr = {
             .name = "PMCR", .cp = 15, .crn = 9, .crm = 12, .opc1 = 0, .opc2 = 0,
@@ -5211,6 +5436,43 @@ void register_cp_regs_for_features(ARMCPU *cpu)
         };
         define_one_arm_cp_reg(cpu, &pmcr);
         define_one_arm_cp_reg(cpu, &pmcr64);
+        for (i = 0; i < pmcrn; i++) {
+            char *pmevcntr_name = g_strdup_printf("PMEVCNTR%d", i);
+            char *pmevcntr_el0_name = g_strdup_printf("PMEVCNTR%d_EL0", i);
+            char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
+            char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
+            ARMCPRegInfo pmev_regs[] = {
+                { .name = pmevcntr_name, .cp = 15, .crn = 15,
+                  .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
+                  .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
+                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
+                  .accessfn = pmreg_access },
+                { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
+                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 8 | (3 & (i >> 3)),
+                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+                  .type = ARM_CP_IO,
+                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
+                  .raw_readfn = pmevcntr_rawread,
+                  .raw_writefn = pmevcntr_rawwrite },
+                { .name = pmevtyper_name, .cp = 15, .crn = 15,
+                  .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
+                  .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
+                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
+                  .accessfn = pmreg_access },
+                { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
+                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 12 | (3 & (i >> 3)),
+                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
+                  .type = ARM_CP_IO,
+                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
+                  .raw_writefn = pmevtyper_rawwrite },
+                REGINFO_SENTINEL
+            };
+            define_arm_cp_regs(cpu, pmev_regs);
+            g_free(pmevcntr_name);
+            g_free(pmevcntr_el0_name);
+            g_free(pmevtyper_name);
+            g_free(pmevtyper_el0_name);
+        }
 #endif
         ARMCPRegInfo clidr = {
             .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
-- 
2.19.1

