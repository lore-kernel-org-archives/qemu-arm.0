Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3488659wrq;
        Sun, 10 Jun 2018 18:38:09 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJwrbBS1KO01C2RKB/jQFju+/AKQ/4MJIl7iJoeJdYYeY0lPF084sXbFstKEJ+mznNeWxjo
X-Received: by 2002:a37:6fc5:: with SMTP id k188-v6mr12987038qkc.204.1528681088944;
        Sun, 10 Jun 2018 18:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528681088; cv=none;
        d=google.com; s=arc-20160816;
        b=JJhXWrnoxznz/Rx9X3t+UcfGAAB+Ipx3UAEWpTLJEElIe//ZQpH5YbZ7Vjxn6MbOP5
         pc9zmFHjGSKDkOBWieYs5uwB9zf7vJqzR8YfgKQfUa60NeeeTul470JrEbjljZpySzQz
         +AJmSlR+SojLpawty8nS/DdatyADwkLalQnDCnf18TRkrs3Mo6zTk/ejNKCSIReWuRhj
         a1BlwM9C/qUJAo5m0mJ7Uc5js74Sc0CsliDOyx/RaQa/E+onp+TCf0Ey1BIISpYPz4v+
         fcMTf8iAZYA/eIgvHiwqszE2+5YGxaUXAeAlqWpjQjDateOBhW0hMQuJUjatlBcqCMYF
         czMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=+u7eVmCMl/jsq5lX+7UxkK/JlRcPLjDytDNK/TKLkMI=;
        b=N2ZneUEzJBhgLTn0Omlhz5qzuPoPxjVyNTuwamN6rpfrh12esLtHR8BYjxNLpkXwhF
         NBQiqGgtKRvYm1Gt+ATea1TUNNOPa5Q0Ze42dZuFh/ZamgKlwCRC3nRwtHwPn2hj9GbK
         Ao0wbZUT2hMDtEMwIgR4N8dNeAZCRDU7TNufN/RcPVvhPxIBaS5QXu1v30sQmJIRpqs3
         Y8ALqyHjPD33oLpAWLe4MXvrcd/vCrjmZqgtwKKDYzsZmPL451BowCAMQXEOW0cCoiVT
         ItkL6R2qbFNTHoLbUnOBwOFmOyneEKW4SnRy1NDhZogYbs7jiyJxplRTtGbaID0JtTpb
         /WzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tgJ0OY23;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6-v6si3789202qkm.170.2018.06.10.18.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Jun 2018 18:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tgJ0OY23;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45817 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSBma-00063U-Di
	for alex.bennee@linaro.org; Sun, 10 Jun 2018 21:38:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSa-00069B-8g
	for qemu-devel@nongnu.org; Sun, 10 Jun 2018 21:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSZ-0003dS-2P
	for qemu-devel@nongnu.org; Sun, 10 Jun 2018 21:17:28 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:37948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSY-0003dF-UH; Sun, 10 Jun 2018 21:17:26 -0400
Received: by mail-qt0-x242.google.com with SMTP id x34-v6so18853109qtk.5;
	Sun, 10 Jun 2018 18:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+u7eVmCMl/jsq5lX+7UxkK/JlRcPLjDytDNK/TKLkMI=;
	b=tgJ0OY23sdXG/EV4/RCLhNhQPgkwR4UFH65rFasljy66b1ox0AOkS1a9oLIT+4sjp5
	Ik5xvXmyX9T63gfNlR4HCstPozotZvbcIIgXTBtkKsA2VIPnEYOgtDI2MqwTUHT3FmUG
	hYw86z1e8b+85DD3JijmMJhY7ElyyFVioQuK9WbdabSUOoK6c/OiDIRQ+DNCPkky/MNa
	iR27i/fOek9xlBylnsb2PUy167B3XyZF5I1W5hq6HUhRoxpheeCwU9OavhzsmLQ9l4uU
	gWtZVq/za8kuP37JSNr2jvBXcD0YMLSLUQVcivVo0+4gNLlWBgM3qKiadBIVQ7VTxd9B
	QOuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=+u7eVmCMl/jsq5lX+7UxkK/JlRcPLjDytDNK/TKLkMI=;
	b=OVzWgKT26DIxk6GtTbV49seE5AOZVFoBGt90dKXDmGfZcUAx0CTyb9FEwWBrYq9OVQ
	lNkHTLW4iSmPauG32+RO6BhEyPcGxatAdlunNclTgwmkKAWs2Gb0AcG6p5HE3TNV9NVb
	oZUMDKv13K5xqgIt96nukj0kbhElVc3aHFWKGk0JZsI8aHaSgTuDrhnaHyp6126v/RFO
	je35+5qrHWJPy82o6Vrmj7Um7IRctb8nOncOBbrupRF6U9x4ZrQMkQW61fEpyHg10PzJ
	IdJMoRm+f8Z2kq0nA2EYG/BTLCQahwOBLYynGDkXcnM/JNZIMarQ/dWY7ZK6LSzonlXE
	lUWw==
X-Gm-Message-State: APt69E0JceyE6Fj3AJcWlbHjRKSZt5cVokG1QCONQ/lUTrwT+/a+GSxN
	g0q+YSdKdc4AAqq9p6Ohxfs=
X-Received: by 2002:ac8:2737:: with SMTP id
	g52-v6mr13874030qtg.168.1528679846284; 
	Sun, 10 Jun 2018 18:17:26 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.17.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Sun, 10 Jun 2018 22:14:55 -0300
Message-Id: <20180611011501.10235-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-devel] [PATCH v4 34/40] hw/net: Use the IEC binary prefix
 definitions
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-trivial@nongnu.org,
	Jason Wang <jasowang@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
	"open list:Allwinner-a10" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: irBOK8CZffW7

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/hw/

and modified manually.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
---
 hw/net/ne2000.h                 | 5 +++--
 include/hw/net/allwinner_emac.h | 5 +++--
 hw/net/e1000e.c                 | 7 ++++---
 hw/net/e1000x_common.c          | 3 ++-
 hw/net/eepro100.c               | 3 +--
 5 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/hw/net/ne2000.h b/hw/net/ne2000.h
index adb8021bd1..2cd193e4c6 100644
--- a/hw/net/ne2000.h
+++ b/hw/net/ne2000.h
@@ -1,11 +1,12 @@
 #ifndef HW_NE2000_H
 #define HW_NE2000_H
 
+#include "qemu/units.h"
 #include "hw/hw.h"
 #include "net/net.h"
 
-#define NE2000_PMEM_SIZE    (32*1024)
-#define NE2000_PMEM_START   (16*1024)
+#define NE2000_PMEM_SIZE    (32 * KiB)
+#define NE2000_PMEM_START   (16 * KiB)
 #define NE2000_PMEM_END     (NE2000_PMEM_SIZE+NE2000_PMEM_START)
 #define NE2000_MEM_SIZE     NE2000_PMEM_END
 
diff --git a/include/hw/net/allwinner_emac.h b/include/hw/net/allwinner_emac.h
index 4cc8aab7ec..905a43deb4 100644
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
+#define TX_FIFO_SIZE        (4 * KiB)
+#define RX_FIFO_SIZE        (32 * KiB)
 
 #define NUM_TX_FIFOS        2
 #define RX_HDR_SIZE         8
diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index cda8d48333..510ddb3897 100644
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
+#define E1000E_MMIO_SIZE    (128 * KiB)
+#define E1000E_FLASH_SIZE   (128 * KiB)
 #define E1000E_IO_SIZE      (32)
-#define E1000E_MSIX_SIZE    (16 * 1024)
+#define E1000E_MSIX_SIZE    (16 * KiB)
 
 #define E1000E_MSIX_TABLE   (0x0000)
 #define E1000E_MSIX_PBA     (0x2000)
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index eb0e097137..09047806f2 100644
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
+    static const int maximum_ethernet_lpe_size = 16 * KiB;
 
     if ((size > maximum_ethernet_lpe_size ||
         (size > maximum_ethernet_vlan_size
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index a07a63247e..e761daf551 100644
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
-- 
2.17.1

