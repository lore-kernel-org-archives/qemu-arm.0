Received: by 10.28.71.27 with SMTP id u27csp1384216wma;
        Tue, 20 Feb 2018 10:14:08 -0800 (PST)
X-Google-Smtp-Source: AH8x225vpKo6BmdMhrPOEcIbpQcFiPx1pa4DrhStZTNrkknyV1HuMp/jHRrSWSfH1Rt+JejrKJQE
X-Received: by 10.129.134.197 with SMTP id w188mr451188ywf.293.1519150448563;
        Tue, 20 Feb 2018 10:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519150448; cv=none;
        d=google.com; s=arc-20160816;
        b=zd05svXnAFXiAZgfKrzql9JEqyVzL6iUwZC5Z4BKl9fUWQ3ZBZ825qiB0cWZ+1r5F0
         F8S5YriG1uKsr0HT3eJv0uWBEHzyiwXPDlgrGtKNHEw6ll1u1t4gpeZ1AUVa6elv95oz
         nl3HHd0ngF8MY13egoXyqPbbixUpgSMtAiOJS6q0BI98EKY0EQcAEkzJhBIriTMq7zVa
         j7NT8lw2xFqrWLGqx50JgZlSwYNP0ALvAW9Y7z4k7gDzTsZ5aC7q9eh38JKSKErCXkx3
         +NwkV5VS3UXhsjxY65I3CBrzuFoQr4vLJ6QcvHuERKwodwzTE8aGc0c04500H6p/aJ4B
         /d0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=gs+3cy9o14tWB2fh+L5DvULNYay+gHGxMu+JbcnZnz8=;
        b=jRD1kPt7dgc9kdcc06JUVaTXNPOUTW7VxskOGAIfG1BN1HW6SGpM8X3+wSQXCIK2KL
         UIQM8kLEAWI0IOsxPRDGu9SOjLi+ijrdMhe61UShoiR5yCVxl2i58uQLXBWBcSSEeGfC
         KuRsdoz1K4quXLz1zvLgkWT6JlSWMTSPDYmsQcI0SxKlW6sbgOcnKQVNHq35Gw/KKFzj
         8ZNK2V4Vd5gn/UNmkNxP5DviQ+73d5nOm3mJPPOZBqAZmoaGj/6NuXj1RABTqidnT3xo
         XUParuHq1JtvB+R/Ze+x2eaPxvONugLz8jitQ/BlSK+eCmfAKwKXJ2fxBXtBd/kX/+/H
         oL+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z128si1887907ywe.717.2018.02.20.10.14.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Feb 2018 10:14:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoCQZ-0001YX-Ve
	for alex.bennee@linaro.org; Tue, 20 Feb 2018 13:14:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGX-0008Az-HP
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eoCGV-0001gX-Ok
	for qemu-arm@nongnu.org; Tue, 20 Feb 2018 13:03:45 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46560)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eoCGV-0001br-Dl; Tue, 20 Feb 2018 13:03:43 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eoCGG-0008Qh-Jh; Tue, 20 Feb 2018 18:03:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 20 Feb 2018 18:03:09 +0000
Message-Id: <20180220180325.29818-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180220180325.29818-1-peter.maydell@linaro.org>
References: <20180220180325.29818-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 03/19] hw/arm/armv7m: Honour CPU's address space
 for image loads
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HsFepkYLCsiB

Instead of loading guest images to the system address space, use the
CPU's address space.  This is important if we're trying to load the
file to memory or via an alias memory region that is provided by an
SoC object and thus not mapped into the system address space.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/armv7m.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 56770a7048..facc536b07 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -270,6 +270,9 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
     uint64_t entry;
     uint64_t lowaddr;
     int big_endian;
+    AddressSpace *as;
+    int asidx;
+    CPUState *cs = CPU(cpu);
 
 #ifdef TARGET_WORDS_BIGENDIAN
     big_endian = 1;
@@ -282,11 +285,19 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
         exit(1);
     }
 
+    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
+        asidx = ARMASIdx_S;
+    } else {
+        asidx = ARMASIdx_NS;
+    }
+    as = cpu_get_address_space(cs, asidx);
+
     if (kernel_filename) {
-        image_size = load_elf(kernel_filename, NULL, NULL, &entry, &lowaddr,
-                              NULL, big_endian, EM_ARM, 1, 0);
+        image_size = load_elf_as(kernel_filename, NULL, NULL, &entry, &lowaddr,
+                                 NULL, big_endian, EM_ARM, 1, 0, as);
         if (image_size < 0) {
-            image_size = load_image_targphys(kernel_filename, 0, mem_size);
+            image_size = load_image_targphys_as(kernel_filename, 0,
+                                                mem_size, as);
             lowaddr = 0;
         }
         if (image_size < 0) {
-- 
2.16.1

