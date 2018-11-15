Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7082528wrw;
        Thu, 15 Nov 2018 06:39:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5cQmad5vqQwTnK8/+AnkAe9LUx2BuPtFyg8bbtPsvVAP1Cey2rw65RYXZNFXcs7ddsSMkiu
X-Received: by 2002:a37:5002:: with SMTP id e2mr6355603qkb.169.1542292752401;
        Thu, 15 Nov 2018 06:39:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542292752; cv=none;
        d=google.com; s=arc-20160816;
        b=sRlb17tzuFZdl+3CTqkxdBKnb0bZkgafOzyyHrBA4iqq/zs9bLh4BVAFj/aTkCsK9E
         BQ1zAsB53CktkvrLq65MDFUloAMVwzyZdZ8CH0TwZUtK68QpewJmBeoEmyt8XSqUWPRo
         XAdO4pw5UXeIhEuS1yBX9UoJIzki4VLnumxcwQrY6RNKUPQAQEf1Gwx1cOc0rg+672AE
         eiYQLvHbMCE+jVle6CoWn7EALsbqvnmkQVIxxnHEwqcpHZR17K6yXqIt4/hk6VLk8K13
         AHoSCLHtFH0+MhhY++TYSMVXTchyngOJtUN6bQ3ceq0jz7CitP3D9/MYo9UWAE3Wv0Pk
         zgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=3tC8hJrceHVQhA/F3T0oiZIn7KukXlswJIvnabIYYA8=;
        b=GP6fpxTdjHVp7rdNZLnfMXIryA9l3TVyhU6kovpXoZ63Mc/PURhtie3yXaqr/q9Swf
         1SBCjQsU8FKJJ1qygtv1QJqUN/uRq6N2CWPtyTsMaEcI6gS7PyyIpOIGGdfntgBsDl91
         n3qffEFlkP9MI5k5OihC7ZhnC7zuG04KvKbeMhVyOCsX18eYb1KxeL/4kllUhUMi9FyI
         tkL6sIowmWVe5MFfARZbuLj3NcWhFO6EH9wzh8rv+qU6M8F1v4IsMlrMSuboe6VEfqdN
         O34SvAmmbKeRzV4ktSorxq75IPzI0iGSXwFJuZ4iViIDYHbXfa8+O8MmcUxAsRBg2OrP
         +zBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x24si4961741qtp.214.2018.11.15.06.39.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 06:39:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39225 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNInX-0007xZ-RB
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 09:39:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gNIkM-0005UF-25
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:35:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gNIkL-0005vj-6q
	for qemu-arm@nongnu.org; Thu, 15 Nov 2018 09:35:54 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:52634)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gNIkK-0005m2-WA; Thu, 15 Nov 2018 09:35:53 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gNIk8-0001X8-FQ; Thu, 15 Nov 2018 14:35:40 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 15 Nov 2018 14:35:35 +0000
Message-Id: <20181115143535.5885-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181115143535.5885-1-peter.maydell@linaro.org>
References: <20181115143535.5885-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.1 2/2] hw/block/onenand: use
 qemu_log_mask() for reporting
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
Cc: Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d5Cc07I9A4I4

Update the onenand device to use qemu_log_mask() for reporting
guest errors and unimplemented features, rather than plain
fprintf() and hw_error().

(We leave the hw_error() in onenand_reset(), as that is
triggered by a failure to read the underlying block device
for the bootRAM, not by guest action.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/block/onenand.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index 49ef68c9b14..2b48609776d 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -28,6 +28,7 @@
 #include "exec/memory.h"
 #include "hw/sysbus.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 
 /* 11 for 2kB-page OneNAND ("2nd generation") and 10 for 1kB-page chips */
 #define PAGE_SHIFT	11
@@ -594,8 +595,8 @@ static void onenand_command(OneNANDState *s)
     default:
         s->status |= ONEN_ERR_CMD;
         s->intstatus |= ONEN_INT;
-        fprintf(stderr, "%s: unknown OneNAND command %x\n",
-                        __func__, s->command);
+        qemu_log_mask(LOG_GUEST_ERROR, "unknown OneNAND command %x\n",
+                      s->command);
     }
 
     onenand_intr_update(s);
@@ -657,12 +658,13 @@ static uint64_t onenand_read(void *opaque, hwaddr addr,
     case 0xff02:	/* ECC Result of spare area data */
     case 0xff03:	/* ECC Result of main area data */
     case 0xff04:	/* ECC Result of spare area data */
-        hw_error("%s: implement ECC\n", __func__);
+        qemu_log_mask(LOG_UNIMP,
+                      "onenand: ECC result registers unimplemented\n");
         return 0x0000;
     }
 
-    fprintf(stderr, "%s: unknown OneNAND register %x\n",
-                    __func__, offset);
+    qemu_log_mask(LOG_GUEST_ERROR, "read of unknown OneNAND register 0x%x\n",
+                  offset);
     return 0;
 }
 
@@ -706,8 +708,9 @@ static void onenand_write(void *opaque, hwaddr addr,
             break;
 
         default:
-            fprintf(stderr, "%s: unknown OneNAND boot command %"PRIx64"\n",
-                            __func__, value);
+            qemu_log_mask(LOG_GUEST_ERROR,
+                          "unknown OneNAND boot command %" PRIx64 "\n",
+                          value);
         }
         break;
 
@@ -757,8 +760,9 @@ static void onenand_write(void *opaque, hwaddr addr,
         break;
 
     default:
-        fprintf(stderr, "%s: unknown OneNAND register %x\n",
-                        __func__, offset);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "write to unknown OneNAND register 0x%x\n",
+                      offset);
     }
 }
 
-- 
2.19.1

