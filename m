Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp924071wrs;
        Wed, 21 Aug 2019 08:13:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGaTMXBWBFOCh5bl0Mou0yu1wNBWE1MHsb/CoRxJsluMcX2ydMVq/4Gm1D6Gi8G33s9MEa
X-Received: by 2002:a17:906:f187:: with SMTP id gs7mr31432518ejb.130.1566400403301;
        Wed, 21 Aug 2019 08:13:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566400403; cv=none;
        d=google.com; s=arc-20160816;
        b=BDpfA0WmAGhWYvOmNufkI1f9yTE+EgTJBwdx72X+Y1zCYL2gU39N/WulZWhuSH4GxK
         fLDG7wZZ020DOHeZJ3DNGYp89DzgxmIRWh2q9xy5IlRdIU3h7J3l0xCx8A0SYuyUBIWX
         gsEFCqMlnTZ0UC12N/SpWls4gVeLTWQMRcTXu2mxNUrS0U3w25G+EV9yvG1SflP84Bl/
         UcYwd77oapvQAhgKTsM61LnujfMUyD5XKHCE0Yo+lh+39pyJqcCkbLvUmfYdZzltRC+j
         tLLOofpTNzwXvzxB3BnqqZyhOgnyJcleAnr77dXbPsPc104w3D3mvH1bemuOqYbQEuzO
         jlew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=/2kcX3vntX5/cxws0OYeICfLeOq4JTTwSz2UmwBIlYA=;
        b=EiAX5Th7t4OAeCSDfALmGsPXtNpI1hSdpa+B9t/Y412XXhV3h5QhQKXqAUaeS81Nhl
         FfmmSpp2SDuoJg4NLDZbuLJ2uBfAuc4EqJWQoKQJB1ZF+uiy8qozHe9BwmpjU4ltMrQ2
         iK9nojwGqjxpj8WN4iyl8ajT2i3NZRbdjJ9SwIWQS8e4VAo2cNxw6qPKO+nXZxgubZKr
         sVhRFUILr16qIOH7to316+tg+3cccVWLWNgg5a/Z/kfApvMmBwVRmaFaQE/oMB9Msl81
         GsPe31M+Dn8bZGPFi3TRnBTiM+P6vKOuz3+5XS8ayC8+Z90WKvxYLjCol+bsNNXexFGW
         7cEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="oaF/DoJM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x42si12242599edm.308.2019.08.21.08.13.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Aug 2019 08:13:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="oaF/DoJM";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49337 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i0SIb-00061W-TW
	for alex.bennee@linaro.org; Wed, 21 Aug 2019 11:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44951)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tony.nguyen.git@gmail.com>) id 1i0SFN-0001us-Qk
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:10:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen.git@gmail.com>) id 1i0SFM-0002T5-Ju
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 11:10:01 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <tony.nguyen.git@gmail.com>)
 id 1i0SFM-0002SD-EZ; Wed, 21 Aug 2019 11:10:00 -0400
Received: by mail-pl1-x644.google.com with SMTP id z3so1490834pln.6;
 Wed, 21 Aug 2019 08:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/2kcX3vntX5/cxws0OYeICfLeOq4JTTwSz2UmwBIlYA=;
 b=oaF/DoJMNMaaa2iM5pZZVUOMNnvDV0irrBuFDtEkdrMaHlEKD31AaF/7t3Im9MfoDg
 Qbd+f5GD4dq2kyUgCmaWgJSt7sgB7p37w/jw4muDAMESPJrvsAqNitntEZsjeMiyo/rF
 cN/Psgsx5U1csmTzRUM/CibvuUEf+NWEKQvoZ8Pt+mxdi2GY/zAZOiY55pPHh7oP5vLr
 rg8Vm4mA/23f+NgcboO1DRLr0yzXH4BDvB8oy0rdo0hfDFjtksF5jcEgWld8ABWdD44i
 MZa5MaHl3rGLpARU99hbnhLhq5R+LSJ1rqIRtS3R5z4KxmdifaUv1BWT72raPShUV/Ne
 3C2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/2kcX3vntX5/cxws0OYeICfLeOq4JTTwSz2UmwBIlYA=;
 b=tMyy23RSK07I2UU5DOcpHJ6JYV6RpKPSjUoyRphMXUUkL/qQ629JgTJjLnbCfOOLQI
 JT1fXrG3HV6FET30kyb8f8wpiXSttMYSCf06wV9RlAjv9GMefFw7TwpAr5Wr+/jAmrsJ
 tKcrd65gFMYD0obh0b27zMDTpaKOkb0HZAbJSpQDsnnLzVcrSdnnraGb1hySp9nlPt6v
 XK4N5UYnOz1zE+iqP2ucJYFfsh5WO3P7UyymULX2j+sP0q7Z2Z93W74l7Pd3oBTp5UAj
 MT2913+TaSZp6uRryUJNZqnti1W7d40K37yntrgaXZuUstoAyr2qKuIK97rtvKGngN2y
 CDXg==
X-Gm-Message-State: APjAAAWg4dJoBBnYpF79lLmzOCbe0NLWlq83WT+RI7JBV+iw6XLogaA0
 zpU19lW4FLlBJWz0vfAIBprirGwE3D8=
X-Received: by 2002:a17:902:2bc5:: with SMTP id
 l63mr31956117plb.239.1566400199398; 
 Wed, 21 Aug 2019 08:09:59 -0700 (PDT)
Received: from localhost.localdomain ([58.173.98.68])
 by smtp.gmail.com with ESMTPSA id e19sm5887633pfh.114.2019.08.21.08.09.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 21 Aug 2019 08:09:59 -0700 (PDT)
From: Tony Nguyen <tony.nguyen.git@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Aug 2019 01:09:00 +1000
Message-Id: <9754e5803feae88a4cfbc507b9da83c0b502e901.1566397711.git.tony.nguyen.git@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1566397711.git.tony.nguyen.git@gmail.com>
References: <cover.1566397711.git.tony.nguyen.git@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
Subject: [Qemu-devel] [PATCH v8 06/21] hw/intc/armv7m_nic: Access
 MemoryRegion with MemOp
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tony Nguyen <tony.nguyen@bt.com>, Peter Maydell <peter.maydell@linaro.org>,
 Tony Nguyen <tony.nguyen.git@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EHJEcyGKzztd

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

