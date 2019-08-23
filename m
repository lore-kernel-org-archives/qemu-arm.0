Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp918903wrs;
        Fri, 23 Aug 2019 11:34:13 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxYtzdrHSF1yxOiQMXWc3UhjPPh5LrtsVzdxVxgo4frYK4f4sezGKDkNbSmyRMpKKMY7vaa
X-Received: by 2002:ac8:1488:: with SMTP id l8mr6372696qtj.50.1566585253215;
        Fri, 23 Aug 2019 11:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566585253; cv=none;
        d=google.com; s=arc-20160816;
        b=WAPqIIXbK89Pk32+FOLTuRMBxtDIEaOwvRP+WJCSBQzsHO1t5IQTAyZoDOE4lmLS3O
         lIsQWGJOIF+AYxrxJ4HCjhhwI3+eLxIOV6ybqHD2H54Trea+KverCaig+i8WibWQaL3Q
         SwmHzbDTtJ9NzQ74rZE6c4qgfNBOJFN/JGTBK72kWn//z8M+ZcQ2g/hmaxwejCIVAYOI
         qlALZBjaah9diQJ1869hUaIV6Edkzu3Lb1I/vStWXx4njyhTQyM1BtZVHXoGFXANfxX2
         MQJlp943ZNzsT5EY0Qd9m3jKOtdUI6OLgJigUjluV+Lordeg6yrAiEXCv/EIiq607Eqp
         sIBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=/2kcX3vntX5/cxws0OYeICfLeOq4JTTwSz2UmwBIlYA=;
        b=aEW2oRSadUfq8GwPQQUG6WgDnqzvl1+nc544KWxzDPlm4Nrf8Lcq/d/zTY+2HhcyZi
         GMCPvyJZ6wJsAfuR9MQjatToAdfaiSj7iLu6vYMit0sUywUz+5pmYAig98oOIMSD+4b8
         OSZ+rew+7t6TYtnr9GJtoLSdzq7AXvdUHQyEPDI20OOvybn2o4khe6GfGnmYb9+EItaj
         U/+6WVZswcwCBLktcBVl4TxSFdIFhv4Hkslylmx32z4BXBXI4LavIXggCP/SFdymcEBZ
         B9ukLgcZYNsRRvwWMkHX9m0L9k65coc2NIwa0/2VQMUaO2Yk4nm0fJLPjICnTFgOaKOV
         eu2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si2618495qte.53.2019.08.23.11.34.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 11:34:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:60842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1EO3-00084V-Vu
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 14:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen@bt.com>) id 1i1ENp-000814-Pg
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:33:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1i1ENo-0007lX-F9
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 14:33:57 -0400
Received: from nsstlmta36p.bpe.bigpond.com ([203.38.21.36]:44410)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1i1ENl-0007gy-85; Fri, 23 Aug 2019 14:33:53 -0400
Received: from smtp.telstra.com ([10.10.24.4])
 by nsstlfep36p-svc.bpe.nexus.telstra.com.au with ESMTP id
 <20190823183348.DNCX18913.nsstlfep36p-svc.bpe.nexus.telstra.com.au@smtp.telstra.com>;
 Sat, 24 Aug 2019 04:33:48 +1000
X-RG-Spam: Unknown
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduvddrudegkedguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfupfevtfgpvffgnffuvffttedpqfgfvfenuceurghilhhouhhtmecugedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepvfhonhihucfpghhuhigvnhcuoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuffhomhgrihhnpegrthhtrhhsrdhsvggtuhhrvgenucfkphepheekrddujeefrdelkedrieeknecurfgrrhgrmhephhgvlhhopegusgiirdhtvghlshhtrhgrrdgtohhmrdgruhdpihhnvghtpeehkedrudejfedrleekrdeikedpmhgrihhlfhhrohhmpeeothhonhihrdhnghhuhigvnhessghtrdgtohhmqedprhgtphhtthhopeeophgvthgvrhdrmhgrhiguvghllheslhhinhgrrhhordhorhhgqedprhgtphhtthhopeeophhhihhlmhgusehrvgguhhgrthdrtghomheqpdhrtghpthhtohepoehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhgqedprhgtphhtthhopeeoqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgheqpdhrtghpthhtohepoehrihgthhgrrhgurdhhvghnuggvrhhsohhnsehlihhnrghrohdrohhrgheqpdhrtghpthhtohepoehtohhnhidrnhhguhihvghnsegsthdrtghomheqnecuvehluhhsthgvrhfuihiivgeptd
X-RazorGate-Vade-Verdict: clean 0
X-RazorGate-Vade-Classification: clean
X-RG-VS-CLASS: clean
X-Authentication-Info: Submitted using ID tony.nguyen.git@bigpond.com
Received: from dbz.telstra.com.au (58.173.98.68) by smtp.telstra.com (5.8.335)
 (authenticated as tony.nguyen.git@bigpond.com)
 id 5D3581440CDB182C; Sat, 24 Aug 2019 04:33:48 +1000
From: Tony Nguyen <tony.nguyen@bt.com>
To: qemu-devel@nongnu.org
Date: Sat, 24 Aug 2019 04:36:43 +1000
Message-Id: <21113bae2f54b45176701e0bf595937031368ae6.1566466906.git.tony.nguyen@bt.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566466906.git.tony.nguyen@bt.com>
References: <cover.1566466906.git.tony.nguyen@bt.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 203.38.21.36
Subject: [Qemu-arm] [Qemu-devel] [PATCH v9 05/20] hw/intc/armv7m_nic: Access
 MemoryRegion with MemOp
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Tony Nguyen <tony.nguyen@bt.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TffqKXe5Qrs/

The memory_region_dispatch_{read|write} operand "unsigned size" is
being converted into a "MemOp op".

Convert interfaces by using no-op size_memop.

After all interfaces are converted, size_memop will be implemented
and the memory_region_dispatch_{read|write} operand "unsigned size"
will be converted into a "MemOp op".

As size_memop is a no-op, this patch does not change any behaviour.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/armv7m_nvic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 62ab8b7273..7220940133 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -21,6 +21,7 @@
 #include "hw/qdev-properties.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
+#include "exec/memop.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "trace.h"
@@ -2348,7 +2349,8 @@ static MemTxResult nvic_sysreg_ns_write(void *opaque, hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
-        return memory_region_dispatch_write(mr, addr, value, size, attrs);
+        return memory_region_dispatch_write(mr, addr, value, size_memop(size),
+                                            attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2367,7 +2369,8 @@ static MemTxResult nvic_sysreg_ns_read(void *opaque, hwaddr addr,
     if (attrs.secure) {
         /* S accesses to the alias act like NS accesses to the real region */
         attrs.secure = 0;
-        return memory_region_dispatch_read(mr, addr, data, size, attrs);
+        return memory_region_dispatch_read(mr, addr, data, size_memop(size),
+                                           attrs);
     } else {
         /* NS attrs are RAZ/WI for privileged, and BusFault for user */
         if (attrs.user) {
@@ -2393,7 +2396,8 @@ static MemTxResult nvic_systick_write(void *opaque, hwaddr addr,
 
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_write(mr, addr, value, size, attrs);
+    return memory_region_dispatch_write(mr, addr, value, size_memop(size),
+                                        attrs);
 }
 
 static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
@@ -2405,7 +2409,7 @@ static MemTxResult nvic_systick_read(void *opaque, hwaddr addr,
 
     /* Direct the access to the correct systick */
     mr = sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->systick[attrs.secure]), 0);
-    return memory_region_dispatch_read(mr, addr, data, size, attrs);
+    return memory_region_dispatch_read(mr, addr, data, size_memop(size), attrs);
 }
 
 static const MemoryRegionOps nvic_systick_ops = {
-- 
2.23.0

