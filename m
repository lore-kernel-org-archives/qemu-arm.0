Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp720018wre;
        Fri, 1 Jun 2018 07:56:40 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIO1i1fea2XJZgllWBAn57nf9wgA3vvDrY6YsVAIRFfdyHEWu9V6CsCKJDzgzQikoBaGWQB
X-Received: by 2002:a37:5e46:: with SMTP id s67-v6mr10112136qkb.202.1527864999988;
        Fri, 01 Jun 2018 07:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527864999; cv=none;
        d=google.com; s=arc-20160816;
        b=wTYIR46/HDoOsTizSIN8gff8iUIrsyxK7Z3rKouF2zQFO3i60UrN8ojuvgim0Cs+mC
         aQVPRyfH6MrSzpqg2eBxk9Kgu06+QAkLVv0rnupjH1x46jffZMclTEqVly2WT0zAtOUN
         EosvuEaOSf8wBgrGD819csncJ2ugd446d+TU8Dberw14kMoIibZizC9VsPX/yq5cm9KL
         UWYjYf2rf4F7NpXbc8oSMLKDq16Kc6vx1Iibv2g5BAMBm6PG7DM4v9/WPLg5F57pcx2S
         UX2X930j+6XRw1v1h8Jw8350Lx++DZkmQx6OEBVMyrUvkIsQlwQPJqA1X22cBu926bR9
         b4xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tef9yASfaw1tuJGp0C2tQd2LaM1VGDcFzft1usNsHtQ=;
        b=jkIMg3Hb2rwiFe1JV8qcR3jTJajPEryLZmcVw/vOOdx+JSLZ3+Lh9SRrKORUq/Uj/j
         kjTD1w/dZ42lUKVFZZdoVa3aCY4s0UoHtYp13oKkYWtR3euGNXq4qxHjyFNXSEuzzccI
         NncFL04gzTsfJn+kBv3t5/CshJUCSDQ1+J4kcEl7nFJWZMMkDojWFg9gFfHl3ux0ed5G
         yAK2pslqoOssPAbzrFsZzddQLM0pCteFRFyCTVnTlY6WMMiLjTTofru4l0wKo21xP3Sy
         DxdKEO7ooHc0y6y2oiZxHvMYCc8reJOofG7r3SHSQL4GaT1dC9rEWQ6bVpUmCMKGsONt
         1TQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l100-v6si17379057qkh.157.2018.06.01.07.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 07:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOlTr-0006CH-Hm
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 10:56:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fOlTc-00068F-E1
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 10:56:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fOlTY-0006Q4-V5
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 10:56:24 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fOlTY-0006Nu-NP; Fri, 01 Jun 2018 10:56:20 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fOlH8-00047j-Sw; Fri, 01 Jun 2018 15:43:30 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  1 Jun 2018 15:43:28 +0100
Message-Id: <20180601144328.23817-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180601144328.23817-1-peter.maydell@linaro.org>
References: <20180601144328.23817-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 2/2] hw/arm/armv7m: Remove unused armv7m_init()
 function
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <mail@steffen-goertz.de>,
	patches@linaro.org, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J+iCE6k0aTea

Remove the now-unused armv7m_init() function. This was a legacy from
before we properly QOMified ARMv7M, and it has some flaws:

 * it combines work that needs to be done by an SoC object (creating
   and initializing the TYPE_ARMV7M object) with work that needs to
   be done by the board model (setting the system up to load the ELF
   file specified with -kernel)
 * TYPE_ARMV7M creation failure is fatal, but an SoC object wants to
   arrange to propagate the failure outward
 * it uses allocate-and-create via qdev_create() whereas the current
   preferred style for SoC objects is to do creation in-place

Board and SoC models can instead do the two jobs this function
was doing themselves, in the right places and with whatever their
preferred style/error handling is.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/arm.h |  8 ++------
 hw/arm/armv7m.c      | 21 ---------------------
 2 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index 70fa2287e2..ffed39252d 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -23,9 +23,6 @@ typedef enum {
     ARM_ENDIANNESS_BE32,
 } arm_endianness;
 
-/* armv7m.c */
-DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
-                         const char *kernel_filename, const char *cpu_type);
 /**
  * armv7m_load_kernel:
  * @cpu: CPU
@@ -33,9 +30,8 @@ DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
  * @mem_size: mem_size: maximum image size to load
  *
  * Load the guest image for an ARMv7M system. This must be called by
- * any ARMv7M board, either directly or via armv7m_init(). (This is
- * necessary to ensure that the CPU resets correctly on system reset,
- * as well as for kernel loading.)
+ * any ARMv7M board. (This is necessary to ensure that the CPU resets
+ * correctly on system reset, as well as for kernel loading.)
  */
 void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size);
 
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index f123cc7d3d..a4ab7d2069 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -261,27 +261,6 @@ static void armv7m_reset(void *opaque)
     cpu_reset(CPU(cpu));
 }
 
-/* Init CPU and memory for a v7-M based board.
-   mem_size is in bytes.
-   Returns the ARMv7M device.  */
-
-DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
-                         const char *kernel_filename, const char *cpu_type)
-{
-    DeviceState *armv7m;
-
-    armv7m = qdev_create(NULL, TYPE_ARMV7M);
-    qdev_prop_set_uint32(armv7m, "num-irq", num_irq);
-    qdev_prop_set_string(armv7m, "cpu-type", cpu_type);
-    object_property_set_link(OBJECT(armv7m), OBJECT(get_system_memory()),
-                                     "memory", &error_abort);
-    /* This will exit with an error if the user passed us a bad cpu_type */
-    qdev_init_nofail(armv7m);
-
-    armv7m_load_kernel(ARM_CPU(first_cpu), kernel_filename, mem_size);
-    return armv7m;
-}
-
 void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
 {
     int image_size;
-- 
2.17.1

