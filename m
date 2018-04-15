Received: by 10.28.4.212 with SMTP id 203csp2084636wme;
        Sun, 15 Apr 2018 16:55:40 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/1LM0WBA/cX4JC996o7LPgD3MokhSlX4W/qSfu+hxfjncCZ8ZsTncFbA9yTGmFgeJcYciF
X-Received: by 10.55.176.193 with SMTP id z184mr14251020qke.120.1523836540438;
        Sun, 15 Apr 2018 16:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523836540; cv=none;
        d=google.com; s=arc-20160816;
        b=afUo3G/Is3CssGSerfqTgKdpaVCTtD7SQo5dQtJlSMksrb5RHg/e49f1HsaVZ2AJc0
         Jc7JBDSYsNPid1auOwQxhqzf0y2BROTrNqPRkBsz0MPkCHLfJMNzFekBpfr+qPtNscWo
         6f0/SVvlbGtNCbXHRF9KaqQoUbyIzEEL3pIBSH3uvVzxWdeVZ1fkE/nVSKn+97DqcNT3
         tXNYSx2ojtWn727aZh0wD78o6GRUHGVsLkP1JursOhuXbCfOpgyqX+AtBKV/Hke5adQR
         HgHw76lpFSQVdeZbIAjxJWwTrAYdUSB/TzYFgdfmODZQptxY+bNG2HU+f/of3LmBDOkL
         E/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=86o8dKC93x01hL9xCcRHnNJazGc4w4JtLIf3gq6jfbs=;
        b=R8aTfgTyuK8TO8/GCoFJUprEEVYFod41qPHUNR3QA77+57FIBfVNb/iNaFGB+ExrMx
         IHnQibf5yp4ZwPMMEF2gd+ECSPZiLhMTJT43y2yx6S3jiLvzrbWKoterEr8dwsddzKVW
         44PdxJJ4yBqc+EHbqebIBcj+PbfvKxWEw7L1IIMOeWCHi0nsvZsVwF6QqMTBrBENmIy/
         zcJDMkMbIQ1jVJ0purJtidQsDYRzJppdxY6JeTcCgZB02jNR+G5Xx8mxBIniS6OsCXR9
         H5GAY0wGc9AEzq84kUFrB4srynTQvruS4WwGe+2BVH9VRzftLxs3YmT/YBNe5ciPiYf2
         H3bQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kU5mZHGy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q30si432718qtg.61.2018.04.15.16.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 15 Apr 2018 16:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kU5mZHGy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52764 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f7rUh-0005YN-SS
	for alex.bennee@linaro.org; Sun, 15 Apr 2018 19:55:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKc-00067p-SO
	for qemu-devel@nongnu.org; Sun, 15 Apr 2018 19:45:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKb-0001Wg-Ry
	for qemu-devel@nongnu.org; Sun, 15 Apr 2018 19:45:14 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:39893)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rKY-0001Tc-Qd; Sun, 15 Apr 2018 19:45:10 -0400
Received: by mail-qk0-x243.google.com with SMTP id j73so14799144qke.6;
	Sun, 15 Apr 2018 16:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=86o8dKC93x01hL9xCcRHnNJazGc4w4JtLIf3gq6jfbs=;
	b=kU5mZHGyhsIGeqpHAszZ64Y5Lz57g4t9CG4wwPV7gPpOWJI6VfWTSyqn1JOiwyRMun
	85ppD4/R2XURtQMT7eCfLjlvUi91NZwW8LIBduujLGwDjd3n25+rTSPoOV4GZRazcF7T
	NxcbhUa4xYuTHLXB7jmQfwcMhiQW4pF6+RR5tP6My+bX+fLfUKXTo8+D32bm/2Vy8nH4
	mkMX24VM1FRAKc8+wr4munlYj6rAhASOupgTk4MXYb4PZsQ4k6Ux+rTvQhwi96T30JxI
	NExKlSis3ydfusIevqKssR71J9+Fp+VzPds/EeSTWXeUrUj2O4yEnqfR/Vm+QHOJRE1+
	Io5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=86o8dKC93x01hL9xCcRHnNJazGc4w4JtLIf3gq6jfbs=;
	b=SCtENUfZRM+5FUrBwsXlxHmSiX+Sbf5Vnhj+q2C6birv+RiwWhluulmghP1Paphp+K
	kCJbGgvOB5nkEPmeYgu1jQzdKmqnErEM4XDH929QsM97Y6KWvAQEokQcOLXN+a0y1c2n
	Nbi4vo436RgDgEqaFi71Wam5QnCyKnASKv940k2Cd66FFzn7Rus7SiDv98Myw3o7Y8fF
	Hv0lAAT5EE+e6e9KRtNdU3pU41U6Ogxz8GR/B+V1y5QKyquRiAEwtVqtmuvo+NzXuAmM
	dZNAJDYfLQltrFU24tEulM6N+/4erjT7aE5FB4EYyR62DrVYfeABDG5Iyyu7uD82y7Xx
	IuAw==
X-Gm-Message-State: ALQs6tCrXCH/0Gd8QROTsyyx9FeL2bsF3uCnxa0z/T0c37x8uVQmsgSU
	wz/XllBNpeSzq/v4VwbeBR4m6lZfWYU=
X-Received: by 10.55.195.217 with SMTP id r86mr7514017qkl.267.1523835909939;
	Sun, 15 Apr 2018 16:45:09 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.45.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:45:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 15 Apr 2018 20:42:59 -0300
Message-Id: <20180415234307.28132-34-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-devel] [PATCH v3 33/41] hw/net: Use the BYTE-based definitions
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, Stefan Weil <sw@weilnetz.de>,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
	"open list:Allwinner-a10" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sweMwJaVfnhO

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/net/allwinner_emac.h | 5 +++--
 hw/net/e1000e.c                 | 7 ++++---
 hw/net/e1000x_common.c          | 3 ++-
 hw/net/eepro100.c               | 7 +++----
 4 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
index 4cc8aab7ec..4b53b6485c 100644
--- a/include/hw/net/allwinner_emac.h
+++ b/include/hw/net/allwinner_emac.h
@@ -23,6 +23,7 @@
 #ifndef ALLWINNER_EMAC_H
 #define ALLWINNER_EMAC_H
 
+#include "qemu/units.h"
 #include "net/net.h"
 #include "qemu/fifo8.h"
 #include "hw/net/mii.h"
@@ -125,8 +126,8 @@
 #define EMAC_INT_RX         (1 << 8)
 
 /* Due to lack of specifications, size of fifos is chosen arbitrarily */
-#define TX_FIFO_SIZE        (4 * 1024)
-#define RX_FIFO_SIZE        (32 * 1024)
+#define TX_FIFO_SIZE        (4 * K_BYTE)
+#define RX_FIFO_SIZE        (32 * K_BYTE)
 
 #define NUM_TX_FIFOS        2
 #define RX_HDR_SIZE         8
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index 16a9417a85..101efe7c83 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -34,6 +34,7 @@
 */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "net/net.h"
 #include "net/tap.h"
 #include "qemu/range.h"
@@ -81,10 +82,10 @@ typedef struct E1000EState {
 #define E1000E_IO_IDX       2
 #define E1000E_MSIX_IDX     3
 
-#define E1000E_MMIO_SIZE    (128 * 1024)
-#define E1000E_FLASH_SIZE   (128 * 1024)
+#define E1000E_MMIO_SIZE    (128 * K_BYTE)
+#define E1000E_FLASH_SIZE   (128 * K_BYTE)
 #define E1000E_IO_SIZE      (32)
-#define E1000E_MSIX_SIZE    (16 * 1024)
+#define E1000E_MSIX_SIZE    (16 * K_BYTE)
 
 #define E1000E_MSIX_TABLE   (0x0000)
 #define E1000E_MSIX_PBA     (0x2000)
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index eb0e097137..58c8db77e9 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -23,6 +23,7 @@
 */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "net/net.h"
@@ -111,7 +112,7 @@ bool e1000x_is_oversized(uint32_t *mac, size_t size)
     static const int maximum_ethernet_vlan_size = 1522;
     /* this is the size past which hardware will
        drop packets when setting LPE=1 */
-    static const int maximum_ethernet_lpe_size = 16384;
+    static const int maximum_ethernet_lpe_size = 16 * K_BYTE;
 
     if ((size > maximum_ethernet_lpe_size ||
         (size > maximum_ethernet_vlan_size
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index a07a63247e..a02e2b55e8 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -41,6 +41,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "hw/pci/pci.h"
 #include "net/net.h"
@@ -60,8 +61,6 @@
  * changed to pad short packets itself. */
 #define CONFIG_PAD_RECEIVED_FRAMES
 
-#define KiB 1024
-
 /* Debug EEPRO100 card. */
 #if 0
 # define DEBUG_EEPRO100
@@ -104,9 +103,9 @@
 /* Use 64 word EEPROM. TODO: could be a runtime option. */
 #define EEPROM_SIZE     64
 
-#define PCI_MEM_SIZE            (4 * KiB)
+#define PCI_MEM_SIZE            (4 * K_BYTE)
 #define PCI_IO_SIZE             64
-#define PCI_FLASH_SIZE          (128 * KiB)
+#define PCI_FLASH_SIZE          (128 * K_BYTE)
 
 #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
 
-- 
2.17.0

