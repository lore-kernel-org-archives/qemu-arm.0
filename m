Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1482459wrt;
        Wed, 10 Oct 2018 13:42:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60IDgKfVUcCcmGPZA8XK+dLU5FxyGwWxq0ACAr1jnI6jqQtKrgHWMohrKD12Wbjab3l7IyK
X-Received: by 2002:a05:6214:114e:: with SMTP id b14mr2861791qvt.234.1539204165773;
        Wed, 10 Oct 2018 13:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539204165; cv=none;
        d=google.com; s=arc-20160816;
        b=EmyXGMosnSl7zZqqx1KojoUZzf2NRlQHYm+sU8uL19hHFTGIH4e2a8it2ie1vVdcEw
         1F5XpGMDj3+BfNq+KMshrcPdcX9vfMyK7uSJ+l1l8bOp8KJja5CqIRGqNRyN3mfDC8fB
         j9gS/55Dpo8omou13CAPl7Coya7aOuutF1pyvXP3hFg+DQMi6wPMfR51albbeB08H6e8
         GN+dutbcttFovIj5XpbSGgpJSgJJIFYIt830DwUddbVre17ppDYyB/8oPaTvPnGFHpP3
         qZo10k2UEUhUIniCI+IPfe2utlqdpT1JxmVKNFyz1DJG3+HCC2v5r02EHJjpXfvLbO6J
         Nl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=OO5omZne/mpRB5n5xRTpKEr+jlwMxC9ACMNSJpaNgDo=;
        b=F8Un3HVAhDwf5frUSFwJZta/hiCoyBGMXPZW5j3nYXb+o0/9kxZyrxUhZO28vHvz+U
         5c1XwbG0YwqnmlT4WrPRL8zuzJKaYOglmg+wyyFtIsCwFsfToiOXjcr4fctvf+odFggu
         1oJtWxeAXNgULbLhNIHXomgjvw/LLtKyjkM8jI4L/S5p+Nm853Ohw3Cr3WH5bTPhzn7z
         ZC+4+1coAC00qlNMgJv2P7bPzFyFuitPtvfpntWcpIEbaRFdCeT/squxCiSpn5X6gJcn
         RQDQrTZUub9nIuSeAe0VLvoeY8H4pgDs/d32tJ6PxZga0lZ/g9vjeSE/tZ+O2h3QJV3g
         tdog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dUdyBBK9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m15-v6si4917986qtk.397.2018.10.10.13.42.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dUdyBBK9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59054 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALJd-0005lq-6j
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:42:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFe-0002uO-KF
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 16:38:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFd-0002Zv-2D
	for qemu-devel@nongnu.org; Wed, 10 Oct 2018 16:38:38 -0400
Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42]:41277)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFY-0002SI-OX; Wed, 10 Oct 2018 16:38:32 -0400
Received: by mail-yw1-xc42.google.com with SMTP id 135-v6so2716223ywo.8;
	Wed, 10 Oct 2018 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OO5omZne/mpRB5n5xRTpKEr+jlwMxC9ACMNSJpaNgDo=;
	b=dUdyBBK9XM+xY7mmR5WhrY43fUHl8hYxWZj83dB8aiEcPKHIhce3smHouFQSDZ/VjT
	V6SZtEvIdSe1R+nM49L25pAhe79tcrOQ8XUZNwFowsDZIAf9/CtWoikVOOYwn1wxShNm
	iRvijtDSLrkcbPY45YELY/89OYgP1u9VDDQytcAGhBgjUEC/dkcDeeZ56NXv3LL2V+rF
	Ilt7gtdlwZuxbip6oQYcd98O5ciK70yplEaRctwC5lRahaXWDBzlpGBkd5VQVFFIT10A
	4hktgNZcbh9I8tJDnrw44FsaDu5AjeQs4awoOv7zc0v6LIf2KFHC8RxnM9pzEGM3h+lK
	XyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OO5omZne/mpRB5n5xRTpKEr+jlwMxC9ACMNSJpaNgDo=;
	b=QRN3OJyJcInx9OpQw7EdxyDtzFjjg0wVdF0xbFMckDZ7SfRKHVIVQY2TxDr26C6x4/
	Toz0hUREawTr1u9Z9dEqX90Hdqp8P1UMASNrxc2AL6J2g6IJmjq62AzgakJhz/ETzJrT
	iWwBb6qopJQeKrHJTpmQEjr1SX1m8ndKnysnH8/83RF+DA9Rc9/Lt7E3Je9ATCYIOyvs
	infrb/a29vCIL1rDCYAlEvIls3j2Ctxc9iilWMHY9N8cfeYUqWW0pR3P6fA9DQHYeZT5
	n3mto05WxP/hThdjdQxe1GZ1Eq81bFdmdTOGMHajfq+tpCLCmn6/Al6pwscUidYn2g7/
	JpZg==
X-Gm-Message-State: ABuFfoiLt2wPzG3nZdmpNZpXRpPHEymWkljS7vY/N9FY4lLdL0kT0ha6
	8g4PoJpgB5CXFKrSJOmrmMLN9+mD
X-Received: by 2002:a0d:ec0e:: with SMTP id
	v14-v6mr19955778ywe.384.1539203912012; 
	Wed, 10 Oct 2018 13:38:32 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:31 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:30 -0400
Message-Id: <20181010203735.27918-10-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c42
Subject: [Qemu-devel] [PATCH v6 09/14] target/arm: Add array for supported
 PMU events, generate PMCEID[01]
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
X-TUID: XLOVdnx4C9Ni

This commit doesn't add any supported events, but provides the framework
for adding them. We store the pm_event structs in a simple array, and
provide the mapping from the event numbers to array indexes in the
supported_event_map array. Because the value of PMCEID[01] depends upon
which events are supported at runtime, generate it dynamically.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/cpu.c    | 20 +++++++++++++-------
 target/arm/cpu.h    | 10 ++++++++++
 target/arm/cpu64.c  |  2 --
 target/arm/helper.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index f69addb961..7f39f25f51 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -948,9 +948,19 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     if (!cpu->has_pmu) {
         unset_feature(env, ARM_FEATURE_PMU);
         cpu->id_aa64dfr0 &= ~0xf00;
-    } else if (!kvm_enabled()) {
-        arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
-        arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
+    }
+    if (arm_feature(env, ARM_FEATURE_PMU)) {
+        uint64_t pmceid = get_pmceid(&cpu->env);
+        cpu->pmceid0 = pmceid & 0xffffffff;
+        cpu->pmceid1 = (pmceid >> 32) & 0xffffffff;
+
+        if (!kvm_enabled()) {
+            arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
+            arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
+        }
+    } else {
+        cpu->pmceid0 = 0x00000000;
+        cpu->pmceid1 = 0x00000000;
     }
 
     if (!arm_feature(env, ARM_FEATURE_EL2)) {
@@ -1583,8 +1593,6 @@ static void cortex_a7_initfn(Object *obj)
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
     cpu->id_dfr0 = 0x02010555;
-    cpu->pmceid0 = 0x00000000;
-    cpu->pmceid1 = 0x00000000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10101105;
     cpu->id_mmfr1 = 0x40000000;
@@ -1626,8 +1634,6 @@ static void cortex_a15_initfn(Object *obj)
     cpu->id_pfr0 = 0x00001131;
     cpu->id_pfr1 = 0x00011011;
     cpu->id_dfr0 = 0x02010555;
-    cpu->pmceid0 = 0x0000000;
-    cpu->pmceid1 = 0x00000000;
     cpu->id_afr0 = 0x00000000;
     cpu->id_mmfr0 = 0x10201105;
     cpu->id_mmfr1 = 0x20000000;
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d9cd8dd92c..cc026f0b75 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -975,6 +975,16 @@ void pmu_op_finish(CPUARMState *env);
 void pmu_pre_el_change(ARMCPU *cpu, void *ignored);
 void pmu_post_el_change(ARMCPU *cpu, void *ignored);
 
+/*
+ * get_pmceid
+ * @env: CPUARMState
+ *
+ * Return the PMCEID[01] register values corresponding to the counters which
+ * are supported given the current configuration (0 is low 32, 1 is high 32
+ * bits)
+ */
+uint64_t get_pmceid(CPUARMState *env);
+
 /* SCTLR bit meanings. Several bits have been reused in newer
  * versions of the architecture; in that case we define constants
  * for both old and new bit meanings. Code which tests against those
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index db71504cb5..440d874c17 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -143,8 +143,6 @@ static void aarch64_a57_initfn(Object *obj)
     cpu->id_isar6 = 0;
     cpu->id_aa64pfr0 = 0x00002222;
     cpu->id_aa64dfr0 = 0x10305106;
-    cpu->pmceid0 = 0x00000000;
-    cpu->pmceid1 = 0x00000000;
     cpu->id_aa64isar0 = 0x00011120;
     cpu->id_aa64mmfr0 = 0x00001124;
     cpu->dbgdidr = 0x3516d000;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f3c00c3db0..375b6dcda5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -976,6 +976,48 @@ static inline uint64_t pmu_counter_mask(CPUARMState *env)
   return (1 << 31) | ((1 << pmu_num_counters(env)) - 1);
 }
 
+typedef struct pm_event {
+    uint16_t number; /* PMEVTYPER.evtCount is 16 bits wide */
+    /* If the event is supported on this CPU (used to generate PMCEID[01]) */
+    bool (*supported)(CPUARMState *);
+    /*
+     * Retrieve the current count of the underlying event. The programmed
+     * counters hold a difference from the return value from this function
+     */
+    uint64_t (*get_count)(CPUARMState *);
+} pm_event;
+
+static const pm_event pm_events[] = {
+};
+#define MAX_EVENT_ID 0x0
+#define UNSUPPORTED_EVENT UINT16_MAX
+static uint16_t supported_event_map[MAX_EVENT_ID + 1];
+
+/*
+ * Called upon initialization to build PMCEID0 (low 32 bits) and PMCEID1 (high
+ * 32). We also use it to build a map of ARM event numbers to indices in
+ * our pm_events array.
+ */
+uint64_t get_pmceid(CPUARMState *env)
+{
+    uint64_t pmceid = 0;
+    unsigned int i;
+
+    for (i = 0; i <= MAX_EVENT_ID; i++) {
+        supported_event_map[i] = UNSUPPORTED_EVENT;
+    }
+
+    for (i = 0; i < ARRAY_SIZE(pm_events); i++) {
+        const pm_event *cnt = &pm_events[i];
+        assert(cnt->number <= MAX_EVENT_ID);
+        if (cnt->supported(env)) {
+            pmceid |= (1 << cnt->number);
+            supported_event_map[cnt->number] = i;
+        }
+    }
+    return pmceid;
+}
+
 static CPAccessResult pmreg_access(CPUARMState *env, const ARMCPRegInfo *ri,
                                    bool isread)
 {
-- 
2.19.1

