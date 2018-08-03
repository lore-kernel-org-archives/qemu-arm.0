Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp269349wru;
        Fri, 3 Aug 2018 09:37:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeyHUCJLB6ScbYqQiHjq4hGezxRGeUC9tlYR+m6HxP4HGxSF9KziZdfbSxblNJua3YdYTH1
X-Received: by 2002:ac8:f2c:: with SMTP id e41-v6mr4718907qtk.260.1533314264477;
        Fri, 03 Aug 2018 09:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533314264; cv=none;
        d=google.com; s=arc-20160816;
        b=mQIWiFsE1zacSPjeOLY/FdrGsxECXt6+nA1N6DUfwvz9Got/HOANuXH888ryuNPON4
         zG3sFtlJTq0RHJ9E+QRABokBrgJ1U5Xs6c+HmazM2Ju36UzKTQYGU5ZCeE241Ryy1cp6
         qbCCkNhtS0YIgRm6BlqLIErT2rPeC4BFIFzrODgRK0GvkKfTupd8zZN8sCacYTl8+5i9
         Qt5oEsdJHCie5SsC2zF9KyHalku4AoJSbXW9QtangeXbDfVfw88ql4wULw18GhRyHYkO
         15XyDva1VhWwTxitUGszHNVHoyBQzIIHkR+Y0uAIM9DUl1DBJckWtCNRhRZJqbtSCgpy
         8uHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=6x5YMUy+lOuSMbGgcSbFtKTMufRMOLv90gY4wV//u2Q=;
        b=TSg5JJJewAtDhg5vR7upH78r1qpbM9SyYddJoxMjPZGvUfGQN7Y/SBMwLWSwymME+k
         7SMhDtCIY6bVAZbCTLzyZAw1F0u+RfqPCAQxrH4I1H6AOaTrwIfbaO1ADHoR1GjiRcTo
         Bia57QVruzEVDV2LkxPyHc6zr9uAk3NWWCHzgCEzM2JjwrmNb22uE+J40JokCD6exVGR
         nLJFULMoQwtvl3AKRRfzS6Y0R4PNT/lmoLGsKc0f/nU7C4r4PXSvmzbs3fKuoDvhcCJd
         hxBHLVYFPjH9m1Dk/AiLLAceYEcUHPPsT4ZkiXoledu2DlZpIQAaGl5wu4B+EpOmMShl
         BFrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q19-v6si1291377qkh.271.2018.08.03.09.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Aug 2018 09:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fld5D-0004lc-Vg
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 12:37:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48976)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fld4Y-0004Of-F1
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 12:37:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fld4X-0006YD-Gj
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 12:37:02 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fld4X-0006RQ-9J; Fri, 03 Aug 2018 12:37:01 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fld4M-00075u-Mk; Fri, 03 Aug 2018 17:36:50 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  3 Aug 2018 17:36:44 +0100
Message-Id: <20180803163646.31068-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803163646.31068-1-peter.maydell@linaro.org>
References: <20180803163646.31068-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/3] hw/intc/arm_gicv3_common: Give
 no-migration-shift-bug subsection a needed function
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
Cc: Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 24NFElvlhjX/

Currently the migration code incorrectly treats a subsection with
no .needed function pointer as if it was the subsection list
terminator -- it is ignored and so is everything after it.
Work around this by giving vmstate_gicv3_gicd_no_migration_shift_bug
a 'needed' function that always returns true.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This should go into 3.0 to avoid awkward migration compat problems:
the no-migration-shift-bug subsection is new in 3.0.
---
 hw/intc/arm_gicv3_common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
index ff326b374ad..e58bc8b8105 100644
--- a/hw/intc/arm_gicv3_common.c
+++ b/hw/intc/arm_gicv3_common.c
@@ -203,10 +203,16 @@ static int gicv3_gicd_no_migration_shift_bug_post_load(void *opaque,
     return 0;
 }
 
+static bool needed_always(void *opaque)
+{
+    return true;
+}
+
 const VMStateDescription vmstate_gicv3_gicd_no_migration_shift_bug = {
     .name = "arm_gicv3/gicd_no_migration_shift_bug",
     .version_id = 1,
     .minimum_version_id = 1,
+    .needed = needed_always,
     .pre_load = gicv3_gicd_no_migration_shift_bug_pre_load,
     .post_load = gicv3_gicd_no_migration_shift_bug_post_load,
     .fields = (VMStateField[]) {
-- 
2.17.1

