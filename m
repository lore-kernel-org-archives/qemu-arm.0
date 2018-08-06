Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3009372wru;
        Mon, 6 Aug 2018 05:35:35 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdHggynW7lFlqcOLW83jt/TyA9v+YIFyqYy1UOdBvlVs93bFc77vHrGOJj+bAlRE5CF5uPu
X-Received: by 2002:a0c:9493:: with SMTP id j19-v6mr12811767qvj.79.1533558935365;
        Mon, 06 Aug 2018 05:35:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533558935; cv=none;
        d=google.com; s=arc-20160816;
        b=t/IzWduKCQVXLikEijIbQaLGnaRAEWseQPDkC0INK2EEt+dUHHmfyMFipcviS0kGe3
         yl74LnvDvFq3XPRVPQ9aUf2L3YkW6nNTb80sNUA1/oH/Z0DbnGQhuH4CEjV8NJZggR0e
         38hy/PL7b8rl18aTaiIQHhkWNbWDvH6i82EgBH7FpEuHuzeNUxGtB0DZII+DFxmqnWtn
         bCaG5+6G0LDHzx9a51f4JXPKnX8UGAl7zO9fT9XoYTZay+o7wgFSEGfCXWZwyteFojxI
         S6BJOzewvkpSLVKw5+2/OaHIrAuma/sxaTIGFrmHqXUKWxYzs5SVMquya5TJthEUPmvT
         IBfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=iDIgoxLx8qpv8kf4cMIhdj8rajnXr3weIf5BzV+u04I=;
        b=wECgYUmW3qnYrWHEyLRRl39y8FvatAcox4mAR0U55nfhdo9DK7tqy+vEr7gXn256zB
         bpTEULUSODspYU15rF4WfpCjaCGC1YMEJp1mKnKVAFvaZFRDfo14yRIHR22OF5EBrab+
         U42t0AnSWHGMrAFX8hPPj/juYfBoP2lQ3bVSih/8fF+n66japD1U3pbkDdYRn/i1Tsn3
         Di/P38t134XUyZadzeGa85qo4OHbMLdQM81lH1be2A4n5z40k3YQbT+jaoDqCk50j3NT
         qs53sbM3+/nNPyTaT3gSFSqM43TeJyMle2iWOqksg6Mwv+CWw0j7ghmNnQUWiThvHggq
         cNAA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c8-v6si4890782qth.157.2018.08.06.05.35.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 05:35:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmejW-0003JJ-TP
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 08:35:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmej0-00032F-HM
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmeiz-0006dU-GT
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fmeiz-0006ZZ-75; Mon, 06 Aug 2018 08:35:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fmeis-0000xh-Ad; Mon, 06 Aug 2018 13:34:54 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  6 Aug 2018 13:34:44 +0100
Message-Id: <20180806123445.1459-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180806123445.1459-1-peter.maydell@linaro.org>
References: <20180806123445.1459-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 v2 4/5] hw/intc/arm_gicv3_common: Move
 post_load hooks to top-level VMSD
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HKaAdFaWrf6z

Contrary to the the impression given in docs/devel/migration.rst,
the migration code does not run the pre_load hook for a
subsection unless the subsection appears on the wire, and so
this is not a place where you can set the default value for
state for the "subsection not present" case. Instead this needs
to be done in a pre_load hook for whatever is the parent VMSD
of the subsection.

We got this wrong in two of the subsection definitions in
the GICv3 migration structs; fix this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_common.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index e1a8999cf5b..8175889f1e7 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -73,7 +73,7 @@ static const VMStateDescription vmstate_gicv3_cpu_virt = {
     }
 };
 
-static int icc_sre_el1_reg_pre_load(void *opaque)
+static int vmstate_gicv3_cpu_pre_load(void *opaque)
 {
     GICv3CPUState *cs = opaque;
 
@@ -97,7 +97,6 @@ const VMStateDescription vmstate_gicv3_cpu_sre_el1 = {
     .name = "arm_gicv3_cpu/sre_el1",
     .version_id = 1,
     .minimum_version_id = 1,
-    .pre_load = icc_sre_el1_reg_pre_load,
     .needed = icc_sre_el1_reg_needed,
     .fields = (VMStateField[]) {
         VMSTATE_UINT64(icc_sre_el1, GICv3CPUState),
@@ -109,6 +108,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     .name = "arm_gicv3_cpu",
     .version_id = 1,
     .minimum_version_id = 1,
+    .pre_load = vmstate_gicv3_cpu_pre_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(level, GICv3CPUState),
         VMSTATE_UINT32(gicr_ctlr, GICv3CPUState),
@@ -139,7 +139,7 @@ static const VMStateDescription vmstate_gicv3_cpu = {
     }
 };
 
-static int gicv3_gicd_no_migration_shift_bug_pre_load(void *opaque)
+static int gicv3_pre_load(void *opaque)
 {
     GICv3State *cs = opaque;
 
@@ -210,7 +210,6 @@ const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = needed_always,
-    .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
     .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_BOOL(gicd_no_migration_shift_bug, GICv3State),
@@ -222,6 +221,7 @@ static const VMStateDescription vmstate_gicv3 = {
     .name = "arm_gicv3",
     .version_id = 1,
     .minimum_version_id = 1,
+    .pre_load = gicv3_pre_load,
     .pre_save = gicv3_pre_save,
     .post_load = gicv3_post_load,
     .priority = MIG_PRI_GICV3,
-- 
2.17.1

