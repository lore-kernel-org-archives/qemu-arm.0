Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3797287wrq;
        Mon, 25 Jun 2018 06:13:33 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKwRBVyveSEV7pP3AsyrxaAThzbe+jXF/ELrik+PEuZ4qkuWV53kvRZWmX26heSgVqFbOWZ
X-Received: by 2002:ac8:2cf1:: with SMTP id 46-v6mr10959078qtx.63.1529932413837;
        Mon, 25 Jun 2018 06:13:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529932413; cv=none;
        d=google.com; s=arc-20160816;
        b=iFPq19i+GVSTTOKOFKMKMOEt7+WPfFsgunNuQUe0L7xdkhQQdne99pYNuzm3QJpYOz
         ++YABjy4jwkOasOJb9C1IWjcbxDw+Zt4R3/FpsKARvjY/r4i/kGR/Osxu2ufdyDSzHaV
         ZVseo9p/R9ihNBqRVEQsp/EAh0BgjhlIxevF0+hnKCWP6id1OjCFnnxKUOExTzh5xMje
         daGkCsynneRpe4MUBrRy2BuIS0RVTwDTE5zWFPUYpCQxf0fkqD+8xOA6y4STybemu1N/
         hcE2zlRbNsLuBVrcpCNfEakPoRUNpyUDWTOgMz/WufjCHpW6o7Oi2M+N6apFjyHvC+M8
         h6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nl2wVyf/XTBmtPMPKkI5KWvauM3qwdoQuOM0UX7Duls=;
        b=RcbJKh7lvUuI+u1Dvc1wMF3nRPDpI1QtnDEZCOfPBxL21Y2mWp63/S/jwxDtpsfpMp
         QYL3W2Qnr7FG1r/VevGsPqtf4HOfGvyNWjmnFhw9XsQ9HnS6yFMtilwC+Am2q9b+tPaw
         iXa5HWJ9C5MF6U/j2rpboCqC4TaAgWz+1U+KuRYkpjsIIeha45hALAB6JljYeyT8kVAw
         ZWj5cg+qJ6zPCaEk97x7Yt0NlBibbNlqrAs1BSkgQDzFlGJ+xoV4ynEE9yHkxYzGhKnU
         jf9swdNT2G72RZBdsfVQjCJyoIqobhrP3HRk5DP1Gpd35iGN3rEqu0xqgxc0xbAgzKPu
         WXlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=URoj+HCV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n184-v6si7982918qkb.269.2018.06.25.06.13.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 06:13:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=URoj+HCV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXRJF-0008PE-0H
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 09:13:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrS-0002Mb-Mj
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 08:44:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrR-0008Cj-Jx
	for qemu-devel@nongnu.org; Mon, 25 Jun 2018 08:44:50 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrR-0008Cd-GC; Mon, 25 Jun 2018 08:44:49 -0400
Received: by mail-qt0-x243.google.com with SMTP id b20-v6so2518514qtp.1;
	Mon, 25 Jun 2018 05:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=nl2wVyf/XTBmtPMPKkI5KWvauM3qwdoQuOM0UX7Duls=;
	b=URoj+HCV/GcUi4DYr6pQk0+HAshKJdvcdO/TwhNxMo9dgdkegMbfMbGxlbZm0lpEwW
	2k1MNzmqZYY48i9QEIpq3r/oGImVwnpbgZjqLIzk9Z2N8NIgy3mECvBcu2hrxcUAZX0E
	IVni7rz5b/zUx84GPCV8mCtNsFAWBJFthmB2/WxppBH+nINvjZHoXf78z6zynft3duTT
	7kg7XUit4/FRswohAIVGdVYkxWNxSdvNTiwxEAw7XZUwcSnOjiHnzNunIZGKxOawQnXO
	Tb1iU5mhI99r7ufEb6frQcwCrJeMNFLZwJqUWnJgQ3JchFl9PqsyD7HkPR4JZb5zDI0Z
	usiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=nl2wVyf/XTBmtPMPKkI5KWvauM3qwdoQuOM0UX7Duls=;
	b=ArtK2jo5Ic2WOlejkjROFtAszz96uHrv1i4BKYxH3bti9OfuU4tiD6wcpkXq4SN2Dr
	ioM5ZSDkjoSfxIcFCy5TW9Z0ZF8lrCmU26a4bZ+bzdBGIz2VZCyQn/HeE1//woNFUVkF
	12424itu2pEIVOIMxsWOaaN6/1jJlQYSIQJVxaOsvW0hgxqWvQT6TubTPvHJz7LpNkN3
	NiWTGd3rcfkXe7N70s3piT/+RPdmwxljg1onA4wn8ZOnJplA17jx6W5g/pBu1lD6JFf9
	jqlwGDkU9maHPa5GI0kPPvW3EJdTbjmEaosGHB4bjMTfF0JoXrB/eQOUJ1NYdCoo8ht0
	EvTg==
X-Gm-Message-State: APt69E1E9LRVoF9ppI6S8hxYbu9X14p1ICUevu1R0mdbayedda8SzKQR
	LwlvzWpXVWjKKPQxjVoVWrU=
X-Received: by 2002:a0c:a063:: with SMTP id
	b90-v6mr10714537qva.115.1529930688984; 
	Mon, 25 Jun 2018 05:44:48 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Mon, 25 Jun 2018 09:42:26 -0300
Message-Id: <20180625124238.25339-35-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-devel] [PATCH v5 34/46] hw/net: Use the IEC binary prefix
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
X-TUID: R3WqYChM5Lqn

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
2.18.0

