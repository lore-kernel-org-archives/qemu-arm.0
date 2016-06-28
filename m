Received: by 10.25.21.96 with SMTP id l93csp1650581lfi;
        Tue, 28 Jun 2016 06:59:09 -0700 (PDT)
X-Received: by 10.55.16.27 with SMTP id a27mr2148770qkh.34.1467122349518;
        Tue, 28 Jun 2016 06:59:09 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3si4207302qkc.219.2016.06.28.06.59.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Jun 2016 06:59:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36938 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bHtXh-0004wF-0L
	for alex.bennee@linaro.org; Tue, 28 Jun 2016 09:59:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHtWn-00045N-A4
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 09:58:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHtWm-0008G0-BW
	for qemu-arm@nongnu.org; Tue, 28 Jun 2016 09:58:13 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58004)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHtWm-0008Fu-4P; Tue, 28 Jun 2016 09:58:12 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHtWj-00063N-N8; Tue, 28 Jun 2016 14:58:09 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 28 Jun 2016 14:58:07 +0100
Message-Id: <1467122287-24974-4-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
References: <1467122287-24974-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-2.7 3/3] memory: Assert that
 memory_region_init_rom_device() ops aren't NULL
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Jean-Christophe DUBOIS <jcd@tribudubois.net>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /6ouJGJXvR5S

It doesn't make sense to pass a NULL ops argument to
memory_region_init_rom_device(), because the effect will
be that if the guest tries to write to the memory region
then QEMU will segfault. Catch the bug earlier by sanity
checking the arguments to this function, and remove the
misleading documentation that suggests that passing NULL
might be sensible.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/exec/memory.h | 5 +----
 memory.c              | 1 +
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/exec/memory.h b/include/exec/memory.h
index 742c52f..0435e79 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -463,12 +463,9 @@ void memory_region_init_rom(MemoryRegion *mr,
  * memory_region_init_rom_device:  Initialize a ROM memory region.  Writes are
  *                                 handled via callbacks.
  *
- * If NULL callbacks pointer is given, then I/O space is not supposed to be
- * handled by QEMU itself. Any access via the memory API will cause an abort().
- *
  * @mr: the #MemoryRegion to be initialized.
  * @owner: the object that tracks the region's reference count
- * @ops: callbacks for write access handling.
+ * @ops: callbacks for write access handling (must not be NULL).
  * @name: the name of the region.
  * @size: size of the region.
  * @errp: pointer to Error*, to store an error if it happens.
diff --git a/memory.c b/memory.c
index c18ccc8..de0d4b5 100644
--- a/memory.c
+++ b/memory.c
@@ -1399,6 +1399,7 @@ void memory_region_init_rom_device(MemoryRegion *mr,
                                    uint64_t size,
                                    Error **errp)
 {
+    assert(ops);
     memory_region_init(mr, owner, name, size);
     mr->ops = ops;
     mr->opaque = opaque;
-- 
1.9.1

