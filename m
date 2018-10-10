Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1478821wrt;
        Wed, 10 Oct 2018 13:38:56 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60SnbVTAcqIN8CDD60GOpuOlDSWLx3QiVdg5qc19Ow7nJuVCXFLfw+u6l9mLnoaOz1R4HZ4
X-Received: by 2002:ac8:43c8:: with SMTP id w8-v6mr5968647qtn.370.1539203936044;
        Wed, 10 Oct 2018 13:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539203936; cv=none;
        d=google.com; s=arc-20160816;
        b=0C0U5AkFvhQ2Y0WjqFjxH80ZpdtRBhFhfI2UR23GW5LICMiitTR4H0T0d+ALesuSQY
         vXUB79L2tyHYq/OBMPb0Wn0OUsiz+4dpGZMjoCn0eBJwgYEnRHWeBRINSt2oEYwZyF2V
         FxBjEOAoXN44STq4AB/UogUMmmmM9pD0eVacwU6qjE75X2IAm39cwuSWwNXjbxlXezX5
         dKoJZ/b3LTQKy075i2/uEBp2onwHe35jC2OxJYLPCYEvJHS7LQuAP6wBO7QED8sX9SRi
         748n7qvEnJEHALnFMLQ3TiFpUx8/jCHEohWMTDBKXAQFGeTC1kmEklEDg4+Hcc5pPKFa
         yc+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=9LgMESnU90CXq7QaCFmtET89r/Lwth2hK4KRVmXI3YQ=;
        b=JJFr5AbNEySdr21HhsLZC3df3VCtN69p5roGTgGi9LHG/9neYSSCYywzHw+sqhH3+z
         Iq78+uQBJw8dK/Kp3KRM6YsapzjNeaQrkUsKd2T8KlfXS+YOOL42G88AbROeT/277QL8
         wKaJevo+XGKJlT/VNPgn0KFgnBWS8UOVe4GA5Nc9jaSeCopjxHcJcGIjyxbxZq2RfSOO
         j3Uk2oBxlqbO4vUMMwXMnbUgBzbtlkyHC8Wd/JqPF7ZJw4pXHPmnDDq7SL0574cNdrBE
         AGRTX8qBTHP4WUE++89iY5h/bRvECeT71HAhhgLTVTA1L4InoQeL7UbfkHpHrXvepdUT
         fItw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Ju6/xA8C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j18-v6si7244090qth.332.2018.10.10.13.38.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 10 Oct 2018 13:38:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="Ju6/xA8C";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gALFv-0002r2-G6
	for alex.bennee@linaro.org; Wed, 10 Oct 2018 16:38:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39502)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFZ-0002ot-5i
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gALFV-0002Ph-Vg
	for qemu-arm@nongnu.org; Wed, 10 Oct 2018 16:38:33 -0400
Received: from mail-yw1-xc33.google.com ([2607:f8b0:4864:20::c33]:45351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gALFV-0002O7-Oo; Wed, 10 Oct 2018 16:38:29 -0400
Received: by mail-yw1-xc33.google.com with SMTP id v198-v6so2715262ywg.12;
	Wed, 10 Oct 2018 13:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9LgMESnU90CXq7QaCFmtET89r/Lwth2hK4KRVmXI3YQ=;
	b=Ju6/xA8C9yJyiCZuTmnLcJ4OZKtdNDzE9YRLLA+rXYkI3wdOd/hz2qcOxIXrnT6POg
	8kGxyJLYnhJS6SrNbwEbQa5Un+SU/GQr/SylwfgARXU/Ow99ewpmwrJqyQ4DLgJkSNQ/
	tViL+wfFAdGey6++jC/IkeQaXYg0sFJh4p5t95K5306ETE2MA+HOtu8WFt/8MqJK9le0
	EqL6mgmt6mICogDd7lQrqshOyi4AnW5VoorlHPRuthdXNkAm00dCeJkYOwvEjdUczPPT
	dHxeLg6nnHfaMGgJ/jKQpMUpljws9GrdUz7whcJ8nw55Gkt9YuhAL1BmLY7IuTWh3Jgg
	YOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9LgMESnU90CXq7QaCFmtET89r/Lwth2hK4KRVmXI3YQ=;
	b=lmcp+jEbX0FR8MpQ5DGPtiH/DHi/ksD4i0x6ksHlT7Pe4LjxBQy7hpjQdF7D7ZrMox
	yA+Uizt2vW/OAqeaLT7VBf5iSPjM9YzS+bxiDic8SZ3//RyLNAFEfv4D7gOmNq5BRkwW
	o4iZkQUngmnNNWw4wNJD2ARzuA1tydlEQ2y/1Y9s+q5FhCWC8kHjToJIMcMALGmOrwtw
	FHCGTNqPiMKz1dlRZxrOmRRgj/CMiMfJR63hvMEll5035KOOmFc0I576/ZOoCRC9ahwz
	wX32dEN+VednbEbWLqaZwkwzVsi0DDBHDyxWHMH1ImylzUArMU++X2sbRp5KqRqXp4K/
	gKVw==
X-Gm-Message-State: ABuFfogWtDWvgyRTjMLOBeBCeoGp7YWuvR5+goX91A47bWl6ZOZeWtil
	DckAuCEgfnXvlouy80SriBdMoil4
X-Received: by 2002:a81:af0d:: with SMTP id
	n13-v6mr19874371ywh.243.1539203906871; 
	Wed, 10 Oct 2018 13:38:26 -0700 (PDT)
Received: from quinoa.localdomain ([216.85.170.153])
	by smtp.gmail.com with ESMTPSA id
	u131-v6sm15170728ywf.13.2018.10.10.13.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 13:38:26 -0700 (PDT)
From: Aaron Lindsay <aclindsa@gmail.com>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Wed, 10 Oct 2018 16:37:25 -0400
Message-Id: <20181010203735.27918-5-aclindsa@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::c33
Subject: [Qemu-arm] [PATCH v6 04/14] target/arm: Swap PMU values
 before/after migrations
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
Cc: Aaron Lindsay <aclindsa@gmail.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gkrepDuN8dMh

Because of the PMU's design, many register accesses have side effects
which are inter-related, meaning that the normal method of saving CP
registers can result in inconsistent state. These side-effects are
largely handled in *op_start and *op_finish functions which can be
called globally once before and after the state is saved/restored. By
doing this and adding raw read/write functions for the affected
registers, we avoid such inconsistencies.

Signed-off-by: Aaron Lindsay <aclindsa@gmail.com>
---
 target/arm/helper.c  |  6 ++++--
 target/arm/machine.c | 19 +++++++++++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8ca4d30797..12c53e54e9 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1379,11 +1379,13 @@ static const ARMCPRegInfo v7_cp_reginfo[] = {
       .opc0 = 3, .opc1 = 3, .crn = 9, .crm = 13, .opc2 = 0,
       .access = PL0_RW, .accessfn = pmreg_access_ccntr,
       .type = ARM_CP_IO,
-      .readfn = pmccntr_read, .writefn = pmccntr_write, },
+      .fieldoffset = offsetof(CPUARMState, cp15.c15_ccnt),
+      .readfn = pmccntr_read, .writefn = pmccntr_write,
+      .raw_readfn = raw_read, .raw_writefn = raw_write, },
 #endif
     { .name = "PMCCFILTR_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 14, .crm = 15, .opc2 = 7,
-      .writefn = pmccfiltr_write,
+      .writefn = pmccfiltr_write, .raw_writefn = raw_write,
       .access = PL0_RW, .accessfn = pmreg_access,
       .type = ARM_CP_IO,
       .fieldoffset = offsetof(CPUARMState, cp15.pmccfiltr_el0),
diff --git a/target/arm/machine.c b/target/arm/machine.c
index ff4ec22bf7..8139b25be5 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -584,6 +584,8 @@ static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
 
+    pmccntr_sync(&cpu->env);
+
     if (kvm_enabled()) {
         if (!write_kvmstate_to_list(cpu)) {
             /* This should never fail */
@@ -605,6 +607,19 @@ static int cpu_pre_save(void *opaque)
     return 0;
 }
 
+static void cpu_post_save(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    pmccntr_sync(&cpu->env);
+}
+
+static int cpu_pre_load(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    pmccntr_sync(&cpu->env);
+    return 0;
+}
+
 static int cpu_post_load(void *opaque, int version_id)
 {
     ARMCPU *cpu = opaque;
@@ -652,6 +667,8 @@ static int cpu_post_load(void *opaque, int version_id)
     hw_breakpoint_update_all(cpu);
     hw_watchpoint_update_all(cpu);
 
+    pmccntr_sync(&cpu->env);
+
     return 0;
 }
 
@@ -660,6 +677,8 @@ const VMStateDescription vmstate_arm_cpu = {
     .version_id = 22,
     .minimum_version_id = 22,
     .pre_save = cpu_pre_save,
+    .post_save = cpu_post_save,
+    .pre_load = cpu_pre_load,
     .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32_ARRAY(env.regs, ARMCPU, 16),
-- 
2.19.1

