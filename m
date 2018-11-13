Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4619249wrw;
        Tue, 13 Nov 2018 09:10:49 -0800 (PST)
X-Google-Smtp-Source: AJdET5cgiuzupEw4eR/ff3MZSKkn7e0KeGOa7oidOrCHIE5ETBSq0NARH9NGmyPE4WnRAuT4qKgJ
X-Received: by 2002:a0c:f403:: with SMTP id h3mr3165662qvl.137.1542129049537;
        Tue, 13 Nov 2018 09:10:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129049; cv=none;
        d=google.com; s=arc-20160816;
        b=y8HsQMshtGDEcvVFI0+MK0d6E2e8G4vXslHOaIOiLWeJQvui0ETh1XV0Ut7uO9fh0n
         lo+t886nEMSaIp6RQys+A0iMqSOJ7bZji29BrBUdEpjC+SL5cpc2rgjdfq08Vb2hZibG
         +XK1PJ4mVJeiF6AbOf28iUC4H6deqELrVmLXkJ2CzxuUdCnaUL9WOre707v1FFnc0t6H
         ccJMJ+iZPTriBD+RFrFFXYLldORlWZwDkIr8ZA4EelLBJyyP7Ji2RapG0cFD10LVN4ut
         IgbihktRzscaLUcWKBSty0YdwJKA56csLJ783TpPAYsmOfjrI+XHV62FT5T5jAPT/EN1
         kmsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=U1v1kkYa2l4Xo6AYZCE1I4oWEEdT/BPkY+tltdP4j3U=;
        b=AHP8wld89Ez/nH24Gtb6jQBLNrawkGWF+HSx0d28Mu2vVYwZlatq813HJGV4oKQSe1
         1K0jnqHQTQV7cEvPvKeTDYNFGC73f7yh+HLrgU+WrRruovF8KfMLc76dhCvIQnSSTUS2
         UEZ50NRI47EWX0lkt6jt7iONg4quTtRsjraC+j4JiRhENx2nXdyO1CiiqH9msee2j+CP
         4qhOKvC5YveFmlnT4eF4YZHGY5F5LY8ijivc0hQ3DOX5Svap3OPKChZIGM0OgHsimlf1
         uhpXGnZV/zybif+VOQ79QtFbUUlVhIna1rNsK6ypvn6Ae4vEKRnzXMrc4RigUHkUIv0G
         d8uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u4si5891028qkc.197.2018.11.13.09.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:10:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcDA-0002fY-T2
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:10:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMcAJ-0007vY-D0
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:07:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMbxW-0004S6-6J
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 11:54:43 -0500
Received: from mga06.intel.com ([134.134.136.31]:62852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMbx5-0003pH-Tz; Tue, 13 Nov 2018 11:54:16 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 08:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,228,1539673200"; d="scan'208";a="107922127"
Received: from qingbai-mobl.ger.corp.intel.com (HELO
	caravaggio.ger.corp.intel.com) ([10.249.41.239])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2018 08:53:48 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 17:52:46 +0100
Message-Id: <20181113165247.4806-13-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113165247.4806-1-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH 12/13] target: arm: Makefile cleanup
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	richard.henderson@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hm3f/8QlWbS/

Group objects with the same build dependencies together.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
---
 target/arm/Makefile.objs | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index 6e880df727..8e513748e3 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -1,15 +1,13 @@
-obj-y += arm-semi.o
-obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o monitor.o
+obj-y += arm-semi.o crypto_helper.o gdbstub.o helper.o cpu.o
+obj-y += translate.o op_helper.o neon_helper.o
+obj-y += iwmmxt_helper.o vec_helper.o m_helper.o
+obj-y += excp_helper.o vfp_helper.o
+
+obj-$(CONFIG_SOFTMMU) += machine.o psci.o arch_dump.o monitor.o arm-powerctl.o
 obj-$(CONFIG_KVM) += kvm.o
 obj-$(call land,$(CONFIG_KVM),$(call lnot,$(TARGET_AARCH64))) += kvm32.o
 obj-$(call land,$(CONFIG_KVM),$(TARGET_AARCH64)) += kvm64.o
 obj-$(call lnot,$(CONFIG_KVM)) += kvm-stub.o
-obj-y += translate.o op_helper.o helper.o cpu.o
-obj-y += neon_helper.o iwmmxt_helper.o vec_helper.o
-obj-y += gdbstub.o m_helper.o excp_helper.o vfp_helper.o
-obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
-obj-y += crypto_helper.o
-obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
 
 DECODETREE = $(SRC_PATH)/scripts/decodetree.py
 
@@ -20,3 +18,4 @@ target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.decode $(DECODETREE)
 
 target/arm/translate-sve.o: target/arm/decode-sve.inc.c
 obj-$(TARGET_AARCH64) += translate-sve.o sve_helper.o
+obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
-- 
2.19.1

