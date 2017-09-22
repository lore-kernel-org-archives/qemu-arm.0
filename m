Received: by 10.223.172.38 with SMTP id v35csp3340048wrc;
        Fri, 22 Sep 2017 10:16:02 -0700 (PDT)
X-Received: by 10.55.49.9 with SMTP id x9mr8785501qkx.89.1506100562589;
        Fri, 22 Sep 2017 10:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506100562; cv=none;
        d=google.com; s=arc-20160816;
        b=iLP08Gzzh0GRZbwtOplzPr/tzSqCW0/z8s5GPhtaeFhteUBOGtA6FfTtmwmOA98UA3
         PXFZznKxQivp9hZsC8WUSCeV0AgwGmcYb9N4yArNzRegjzFD1oEN7/0L96ghSg+FI6ju
         vkRSEC/ZinC+y8E1jAcB/VuGYX67+JGWkj2RErDXtWWNRgZgO4T1vIK1/26OX/fOnCT7
         dUDJTjJgjb7xljz+BlmeOvn1pgzqMb5UuzGl0Om+c7GscIdGSKfPcxb5yxJyj68DqrqS
         RFy8RirRBpBIWpORqp2+53tNLZst0XU/SUWFxJlk70oa8Y7AaXz4W7OGlLjxwkfxvgbF
         HSNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=RPD+p856r9FrgIw/HzA1lMN1CFwjzzKKKeXga43uDfc=;
        b=Lbs3dHtIsMPMCfP8K+k3O522fYvtkMDE/8GUfyF09YevBwLi4jQJ7qDC125DpKzdrM
         BRDpZJJW+6bc8Ct8uKcvE6KjvIU1wjXez594+B/GRrgZTD61EOChDGeFdLk5v0s/0DBI
         k8wujbt8oul+d2clPMgzK66cns4vtVkTFQzMbK7RSC+A7lB4h5yB8nwyaTSQQZmTdUuT
         nfFKQbypj+6lXp/WFx62KEGpTJJArJUVn7hjy8IV/d7NP3LuHMirU0VM0i79ODO8zyFH
         ZOY9MbEMu5GHoFxi9WalIWyuftwZ6i+bMnDkfWL2HzmCiHCZecmpcwOkC5QEeSDM5Rwj
         4oTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bRnO4inG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l40si253676qta.160.2017.09.22.10.16.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 10:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bRnO4inG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60293 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvRYV-0004rw-00
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 13:15:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvRWM-00039t-RB
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 13:13:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvRWJ-0003OR-Pu
	for qemu-devel@nongnu.org; Fri, 22 Sep 2017 13:13:46 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:38068)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvRWJ-0003Nd-JZ; Fri, 22 Sep 2017 13:13:43 -0400
Received: by mail-qk0-x244.google.com with SMTP id c69so1021237qke.5;
	Fri, 22 Sep 2017 10:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=RPD+p856r9FrgIw/HzA1lMN1CFwjzzKKKeXga43uDfc=;
	b=bRnO4inGgMhmZDK69n6m47NfkU8vsHJBMVJf//OxoRKpPe3b0Xk8vq7Wqp9z7tg5JV
	po9Y/Jcn34yMdJIp4ntzI3qdqrvgfVpHyg3jZNu4cxCk2KVvSyo2Lw6zJKgRC7MmKFmu
	qjtayG5fZVAT6lL8IG4iGBjzcQSPmayYWZjqL2hIgkPNbChC9fpuof9kODnI6hgaS1Us
	7HLhDd1eF3nmJeWoMazdVccUiKwa5TiyTNbQtqwnOMDwo8Krm7OTA1LgZH9NyKHBXeOd
	wUf5JHRjjgIu/LDV5sRzLDYhjXBm1lCP4yQFGUPVjcPsNbs/mjJSCeigNpAMBzH0lqRG
	4IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=RPD+p856r9FrgIw/HzA1lMN1CFwjzzKKKeXga43uDfc=;
	b=GA9PfsNbse2sONyANE/0AI3+iWw72h+k31DV8s0VMyJOS/exPOrJn6Nvrjk6uoFy0N
	So9/o5WzNmk4cCJeBGbum7DK2W4WUgPoAh8LE2DJ442JbalWtM8GroUmQeHuQ6E2spKT
	TcTx2gGY++XtFDYzGLkgPjtP3dd67ctWJGLK++3tO5tKZwhXKObzIYhIDIuFOWFaOKsR
	I4U9WQYZOJOelFoups+3WzDIHLZ+ulZwe0CP5QUi+qKQcwKPPHRIc2VX4uvRemkX6ZgB
	afQhnPnR3Id1CrVJiKEelSoGqt7eH9jCtgm8EU/Fec0ymTrUile5D3XD56N0J1/rcUkR
	0/TQ==
X-Gm-Message-State: AHPjjUhgRJ9YVfW4hNrIJJqNQZ+2JI7qB5NqZ39Gh3VkBNY6wYwluw/P
	YAnht7gjxEPYoHonRbelw20=
X-Google-Smtp-Source: AOwi7QDt2loxLlKVKmj3KnkrxySrxbdR2VN5MgX3AElj7g4h6BBndf6cs1P4icXv/KluauQZkKZhdw==
X-Received: by 10.55.156.147 with SMTP id f141mr9147481qke.72.1506100422656;
	Fri, 22 Sep 2017 10:13:42 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f69sm238468qke.27.2017.09.22.10.13.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 10:13:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Grant Likely <grant.likely@arm.com>, Jason Wang <jasowang@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Fam Zheng <famz@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Date: Fri, 22 Sep 2017 14:13:17 -0300
Message-Id: <20170922171323.10348-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922171323.10348-1-f4bug@amsat.org>
References: <20170922171323.10348-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [PATCH v5 1/7] hw/mdio: Generalize etraxfs MDIO
 bitbanging emulation
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MMlNo5ZcuAi9

From: Grant Likely <grant.likely@arm.com>

The etraxfs and Xilinx axienet Ethernet models implement quite a nice
MDIO core that supports both bitbanging and direct register access. This
change factors the common code out into a separate file. There are no
functional changes here, just movement of code.

The etraxfs and axienet are slightly different. The etraxfs version
includes the bitbang state processing, but the axienet version has a
minor enhancement for read/write of phy registers without using bitbang
state variables.  This patch generalizes the etraxfs version, with the
axienet change backported in.

Signed-off-by: Grant Likely <grant.likely@arm.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: rebased with a minor checkpatch fix]
---
 include/hw/net/mdio.h   |  76 +++++++++++++
 hw/net/etraxfs_eth.c    | 278 +-----------------------------------------------
 hw/net/mdio.c           | 262 +++++++++++++++++++++++++++++++++++++++++++++
 hw/net/xilinx_axienet.c | 187 +-------------------------------
 hw/net/Makefile.objs    |   2 +
 5 files changed, 344 insertions(+), 461 deletions(-)
 create mode 100644 include/hw/net/mdio.h
 create mode 100644 hw/net/mdio.c

diff --git a/include/hw/net/mdio.h b/include/hw/net/mdio.h
new file mode 100644
index 0000000000..ac36aed3c3
--- /dev/null
+++ b/include/hw/net/mdio.h
@@ -0,0 +1,76 @@
+#ifndef BITBANG_MDIO_H
+#define BITBANG_MDIO_H
+
+/*
+ * QEMU Bitbang Ethernet MDIO bus & PHY controllers.
+ *
+ * Copyright (c) 2008 Edgar E. Iglesias, Axis Communications AB.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+/* PHY Advertisement control register */
+#define PHY_ADVERTISE_10HALF    0x0020  /* Try for 10mbps half-duplex  */
+#define PHY_ADVERTISE_10FULL    0x0040  /* Try for 10mbps full-duplex  */
+#define PHY_ADVERTISE_100HALF   0x0080  /* Try for 100mbps half-duplex */
+#define PHY_ADVERTISE_100FULL   0x0100  /* Try for 100mbps full-duplex */
+
+struct qemu_phy {
+    uint32_t regs[32];
+
+    int link;
+
+    unsigned int (*read)(struct qemu_phy *phy, unsigned int req);
+    void (*write)(struct qemu_phy *phy, unsigned int req, unsigned int data);
+};
+
+struct qemu_mdio {
+    /* bus. */
+    int mdc;
+    int mdio;
+
+    /* decoder.  */
+    enum {
+        PREAMBLE,
+        SOF,
+        OPC,
+        ADDR,
+        REQ,
+        TURNAROUND,
+        DATA
+    } state;
+    unsigned int drive;
+
+    unsigned int cnt;
+    unsigned int addr;
+    unsigned int opc;
+    unsigned int req;
+    unsigned int data;
+
+    struct qemu_phy *devs[32];
+};
+
+void tdk_init(struct qemu_phy *phy);
+void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy,
+                 unsigned int addr);
+uint16_t mdio_read_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req);
+void mdio_write_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req, uint16_t data);
+void mdio_cycle(struct qemu_mdio *bus);
+
+#endif
diff --git a/hw/net/etraxfs_eth.c b/hw/net/etraxfs_eth.c
index 013c8d0a41..f8d8f8441d 100644
--- a/hw/net/etraxfs_eth.c
+++ b/hw/net/etraxfs_eth.c
@@ -26,287 +26,11 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/cris/etraxfs.h"
+#include "hw/net/mdio.h"
 #include "qemu/error-report.h"
 
 #define D(x)
 
-/* Advertisement control register. */
-#define ADVERTISE_10HALF        0x0020  /* Try for 10mbps half-duplex  */
-#define ADVERTISE_10FULL        0x0040  /* Try for 10mbps full-duplex  */
-#define ADVERTISE_100HALF       0x0080  /* Try for 100mbps half-duplex */
-#define ADVERTISE_100FULL       0x0100  /* Try for 100mbps full-duplex */
-
-/*
- * The MDIO extensions in the TDK PHY model were reversed engineered from the
- * linux driver (PHYID and Diagnostics reg).
- * TODO: Add friendly names for the register nums.
- */
-struct qemu_phy
-{
-    uint32_t regs[32];
-
-    int link;
-
-    unsigned int (*read)(struct qemu_phy *phy, unsigned int req);
-    void (*write)(struct qemu_phy *phy, unsigned int req, unsigned int data);
-};
-
-static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
-{
-    int regnum;
-    unsigned r = 0;
-
-    regnum = req & 0x1f;
-
-    switch (regnum) {
-    case 1:
-        if (!phy->link) {
-            break;
-        }
-        /* MR1.     */
-        /* Speeds and modes.  */
-        r |= (1 << 13) | (1 << 14);
-        r |= (1 << 11) | (1 << 12);
-        r |= (1 << 5); /* Autoneg complete.  */
-        r |= (1 << 3); /* Autoneg able.     */
-        r |= (1 << 2); /* link.     */
-        break;
-    case 5:
-        /* Link partner ability.
-           We are kind; always agree with whatever best mode
-           the guest advertises.  */
-        r = 1 << 14; /* Success.  */
-        /* Copy advertised modes.  */
-        r |= phy->regs[4] & (15 << 5);
-        /* Autoneg support.  */
-        r |= 1;
-        break;
-    case 18:
-    {
-        /* Diagnostics reg.  */
-        int duplex = 0;
-        int speed_100 = 0;
-
-        if (!phy->link) {
-            break;
-        }
-
-        /* Are we advertising 100 half or 100 duplex ? */
-        speed_100 = !!(phy->regs[4] & ADVERTISE_100HALF);
-        speed_100 |= !!(phy->regs[4] & ADVERTISE_100FULL);
-
-        /* Are we advertising 10 duplex or 100 duplex ? */
-        duplex = !!(phy->regs[4] & ADVERTISE_100FULL);
-        duplex |= !!(phy->regs[4] & ADVERTISE_10FULL);
-        r = (speed_100 << 10) | (duplex << 11);
-    }
-    break;
-
-    default:
-        r = phy->regs[regnum];
-        break;
-    }
-    D(printf("\n%s %x = reg[%d]\n", __func__, r, regnum));
-    return r;
-}
-
-static void
-tdk_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
-{
-    int regnum;
-
-    regnum = req & 0x1f;
-    D(printf("%s reg[%d] = %x\n", __func__, regnum, data));
-    switch (regnum) {
-    default:
-        phy->regs[regnum] = data;
-        break;
-    }
-}
-
-static void
-tdk_init(struct qemu_phy *phy)
-{
-    phy->regs[0] = 0x3100;
-    /* PHY Id.  */
-    phy->regs[2] = 0x0300;
-    phy->regs[3] = 0xe400;
-    /* Autonegotiation advertisement reg.  */
-    phy->regs[4] = 0x01E1;
-    phy->link = 1;
-
-    phy->read = tdk_read;
-    phy->write = tdk_write;
-}
-
-struct qemu_mdio
-{
-    /* bus.     */
-    int mdc;
-    int mdio;
-
-    /* decoder.  */
-    enum {
-        PREAMBLE,
-        SOF,
-        OPC,
-        ADDR,
-        REQ,
-        TURNAROUND,
-        DATA
-    } state;
-    unsigned int drive;
-
-    unsigned int cnt;
-    unsigned int addr;
-    unsigned int opc;
-    unsigned int req;
-    unsigned int data;
-
-    struct qemu_phy *devs[32];
-};
-
-static void
-mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy, unsigned int addr)
-{
-    bus->devs[addr & 0x1f] = phy;
-}
-
-#ifdef USE_THIS_DEAD_CODE
-static void
-mdio_detach(struct qemu_mdio *bus, struct qemu_phy *phy, unsigned int addr)
-{
-    bus->devs[addr & 0x1f] = NULL;
-}
-#endif
-
-static void mdio_read_req(struct qemu_mdio *bus)
-{
-    struct qemu_phy *phy;
-
-    phy = bus->devs[bus->addr];
-    if (phy && phy->read) {
-        bus->data = phy->read(phy, bus->req);
-    } else {
-        bus->data = 0xffff;
-    }
-}
-
-static void mdio_write_req(struct qemu_mdio *bus)
-{
-    struct qemu_phy *phy;
-
-    phy = bus->devs[bus->addr];
-    if (phy && phy->write) {
-        phy->write(phy, bus->req, bus->data);
-    }
-}
-
-static void mdio_cycle(struct qemu_mdio *bus)
-{
-    bus->cnt++;
-
-    D(printf("mdc=%d mdio=%d state=%d cnt=%d drv=%d\n",
-        bus->mdc, bus->mdio, bus->state, bus->cnt, bus->drive));
-#if 0
-    if (bus->mdc) {
-        printf("%d", bus->mdio);
-    }
-#endif
-    switch (bus->state) {
-    case PREAMBLE:
-        if (bus->mdc) {
-            if (bus->cnt >= (32 * 2) && !bus->mdio) {
-                bus->cnt = 0;
-                bus->state = SOF;
-                bus->data = 0;
-            }
-        }
-        break;
-    case SOF:
-        if (bus->mdc) {
-            if (bus->mdio != 1) {
-                printf("WARNING: no SOF\n");
-            }
-            if (bus->cnt == 1*2) {
-                bus->cnt = 0;
-                bus->opc = 0;
-                bus->state = OPC;
-            }
-        }
-        break;
-    case OPC:
-        if (bus->mdc) {
-            bus->opc <<= 1;
-            bus->opc |= bus->mdio & 1;
-            if (bus->cnt == 2*2) {
-                bus->cnt = 0;
-                bus->addr = 0;
-                bus->state = ADDR;
-            }
-        }
-        break;
-    case ADDR:
-        if (bus->mdc) {
-            bus->addr <<= 1;
-            bus->addr |= bus->mdio & 1;
-
-            if (bus->cnt == 5*2) {
-                bus->cnt = 0;
-                bus->req = 0;
-                bus->state = REQ;
-            }
-        }
-        break;
-    case REQ:
-        if (bus->mdc) {
-            bus->req <<= 1;
-            bus->req |= bus->mdio & 1;
-            if (bus->cnt == 5*2) {
-                bus->cnt = 0;
-                bus->state = TURNAROUND;
-            }
-        }
-        break;
-    case TURNAROUND:
-        if (bus->mdc && bus->cnt == 2*2) {
-            bus->mdio = 0;
-            bus->cnt = 0;
-
-            if (bus->opc == 2) {
-                bus->drive = 1;
-                mdio_read_req(bus);
-                bus->mdio = bus->data & 1;
-            }
-            bus->state = DATA;
-        }
-        break;
-    case DATA:
-        if (!bus->mdc) {
-            if (bus->drive) {
-                bus->mdio = !!(bus->data & (1 << 15));
-                bus->data <<= 1;
-            }
-        } else {
-            if (!bus->drive) {
-                bus->data <<= 1;
-                bus->data |= bus->mdio;
-            }
-            if (bus->cnt == 16 * 2) {
-                bus->cnt = 0;
-                bus->state = PREAMBLE;
-                if (!bus->drive) {
-                    mdio_write_req(bus);
-                }
-                bus->drive = 0;
-            }
-        }
-        break;
-    default:
-        break;
-    }
-}
-
 /* ETRAX-FS Ethernet MAC block starts here.  */
 
 #define RW_MA0_LO      0x00
diff --git a/hw/net/mdio.c b/hw/net/mdio.c
new file mode 100644
index 0000000000..3763fcc8af
--- /dev/null
+++ b/hw/net/mdio.c
@@ -0,0 +1,262 @@
+/*
+ * QEMU Ethernet MDIO bus & PHY models
+ *
+ * Copyright (c) 2008 Edgar E. Iglesias, Axis Communications AB.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ *
+ * This is a generic MDIO implementation.
+ *
+ * TODO:
+ * - Split PHYs out as separate device models so they can be defined and
+ *   instantiated separately from the MDIO bus.
+ * - Split out bitbang state machine into a separate model. Mostly this consists
+ *   of the mdio_cycle() routine and the bitbang state data in struct qemu_mdio
+ * - Use the GPIO interface for driving bitbang
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/log.h"
+#include "hw/net/mdio.h"
+
+#define D(x)
+
+/*
+ * The MDIO extensions in the TDK PHY model were reversed engineered from the
+ * linux driver (PHYID and Diagnostics reg).
+ * TODO: Add friendly names for the register nums.
+ */
+static unsigned int tdk_read(struct qemu_phy *phy, unsigned int req)
+{
+    int regnum;
+    unsigned r = 0;
+
+    regnum = req & 0x1f;
+
+    switch (regnum) {
+    case 1:
+        if (!phy->link) {
+            break;
+        }
+        /* MR1.     */
+        /* Speeds and modes.  */
+        r |= (1 << 13) | (1 << 14);
+        r |= (1 << 11) | (1 << 12);
+        r |= (1 << 5); /* Autoneg complete.  */
+        r |= (1 << 3); /* Autoneg able.     */
+        r |= (1 << 2); /* link.     */
+        r |= (1 << 1); /* link.     */
+        break;
+    case 5:
+        /* Link partner ability.
+           We are kind; always agree with whatever best mode
+           the guest advertises.  */
+        r = 1 << 14; /* Success.  */
+        /* Copy advertised modes.  */
+        r |= phy->regs[4] & (15 << 5);
+        /* Autoneg support.  */
+        r |= 1;
+        break;
+    case 17:
+        /* Marvel PHY on many xilinx boards. */
+        r = 0x8000; /* 1000Mb */
+        break;
+    case 18:
+    {
+        /* Diagnostics reg.  */
+        int duplex = 0;
+        int speed_100 = 0;
+
+        if (!phy->link) {
+            break;
+        }
+
+        /* Are we advertising 100 half or 100 duplex ? */
+        speed_100 = !!(phy->regs[4] & PHY_ADVERTISE_100HALF);
+        speed_100 |= !!(phy->regs[4] & PHY_ADVERTISE_100FULL);
+
+        /* Are we advertising 10 duplex or 100 duplex ? */
+        duplex = !!(phy->regs[4] & PHY_ADVERTISE_100FULL);
+        duplex |= !!(phy->regs[4] & PHY_ADVERTISE_10FULL);
+        r = (speed_100 << 10) | (duplex << 11);
+    }
+    break;
+
+    default:
+        r = phy->regs[regnum];
+        break;
+    }
+    D(printf("\n%s %x = reg[%d]\n", __func__, r, regnum));
+    return r;
+}
+
+static void tdk_write(struct qemu_phy *phy, unsigned int req, unsigned int data)
+{
+    int regnum;
+
+    regnum = req & 0x1f;
+    D(printf("%s reg[%d] = %x\n", __func__, regnum, data));
+    switch (regnum) {
+    default:
+        phy->regs[regnum] = data;
+        break;
+    }
+}
+
+void tdk_init(struct qemu_phy *phy)
+{
+    phy->regs[0] = 0x3100;
+    /* PHY Id. */
+    phy->regs[2] = 0x0300;
+    phy->regs[3] = 0xe400;
+    /* Autonegotiation advertisement reg. */
+    phy->regs[4] = 0x01e1;
+    phy->link = 1;
+
+    phy->read = tdk_read;
+    phy->write = tdk_write;
+}
+
+void mdio_attach(struct qemu_mdio *bus, struct qemu_phy *phy, unsigned int addr)
+{
+    bus->devs[addr & 0x1f] = phy;
+}
+
+uint16_t mdio_read_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req)
+{
+    struct qemu_phy *phy;
+
+    phy = bus->devs[bus->addr];
+    if (phy && phy->read) {
+        return phy->read(phy, req);
+    }
+    return 0xffff;
+}
+
+void mdio_write_req(struct qemu_mdio *bus, uint8_t addr, uint8_t req,
+                    uint16_t data)
+{
+    struct qemu_phy *phy;
+
+    phy = bus->devs[bus->addr];
+    if (phy && phy->write) {
+        phy->write(phy, req, data);
+    }
+}
+
+void mdio_cycle(struct qemu_mdio *bus)
+{
+    bus->cnt++;
+
+    D(printf("mdc=%d mdio=%d state=%d cnt=%d drv=%d\n",
+             bus->mdc, bus->mdio, bus->state, bus->cnt, bus->drive));
+    switch (bus->state) {
+    case PREAMBLE:
+        if (bus->mdc) {
+            if (bus->cnt >= (32 * 2) && !bus->mdio) {
+                bus->cnt = 0;
+                bus->state = SOF;
+                bus->data = 0;
+            }
+        }
+        break;
+    case SOF:
+        if (bus->mdc) {
+            if (bus->mdio != 1) {
+                printf("WARNING: no SOF\n");
+            }
+            if (bus->cnt == 1 * 2) {
+                bus->cnt = 0;
+                bus->opc = 0;
+                bus->state = OPC;
+            }
+        }
+        break;
+    case OPC:
+        if (bus->mdc) {
+            bus->opc <<= 1;
+            bus->opc |= bus->mdio & 1;
+            if (bus->cnt == 2 * 2) {
+                bus->cnt = 0;
+                bus->addr = 0;
+                bus->state = ADDR;
+            }
+        }
+        break;
+    case ADDR:
+        if (bus->mdc) {
+            bus->addr <<= 1;
+            bus->addr |= bus->mdio & 1;
+
+            if (bus->cnt == 5 * 2) {
+                bus->cnt = 0;
+                bus->req = 0;
+                bus->state = REQ;
+            }
+        }
+        break;
+    case REQ:
+        if (bus->mdc) {
+            bus->req <<= 1;
+            bus->req |= bus->mdio & 1;
+            if (bus->cnt == 5 * 2) {
+                bus->cnt = 0;
+                bus->state = TURNAROUND;
+            }
+        }
+        break;
+    case TURNAROUND:
+        if (bus->mdc && bus->cnt == 2 * 2) {
+            bus->mdio = 0;
+            bus->cnt = 0;
+
+            if (bus->opc == 2) {
+                bus->drive = 1;
+                bus->data = mdio_read_req(bus, bus->addr, bus->req);
+                bus->mdio = bus->data & 1;
+            }
+            bus->state = DATA;
+        }
+        break;
+    case DATA:
+        if (!bus->mdc) {
+            if (bus->drive) {
+                bus->mdio = !!(bus->data & (1 << 15));
+                bus->data <<= 1;
+            }
+        } else {
+            if (!bus->drive) {
+                bus->data <<= 1;
+                bus->data |= bus->mdio;
+            }
+            if (bus->cnt == 16 * 2) {
+                bus->cnt = 0;
+                bus->state = PREAMBLE;
+                if (!bus->drive) {
+                    mdio_write_req(bus, bus->addr, bus->req, bus->data);
+                }
+                bus->drive = 0;
+            }
+        }
+        break;
+    default:
+        break;
+    }
+}
diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index d4c2c89dc1..1e859fdaae 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -26,13 +26,12 @@
 #include "hw/sysbus.h"
 #include "qapi/error.h"
 #include "qemu/log.h"
+#include "hw/net/mdio.h"
 #include "net/net.h"
 #include "net/checksum.h"
 
 #include "hw/stream.h"
 
-#define DPHY(x)
-
 #define TYPE_XILINX_AXI_ENET "xlnx.axi-ethernet"
 #define TYPE_XILINX_AXI_ENET_DATA_STREAM "xilinx-axienet-data-stream"
 #define TYPE_XILINX_AXI_ENET_CONTROL_STREAM "xilinx-axienet-control-stream"
@@ -48,189 +47,9 @@
      OBJECT_CHECK(XilinxAXIEnetStreamSlave, (obj),\
      TYPE_XILINX_AXI_ENET_CONTROL_STREAM)
 
-/* Advertisement control register. */
-#define ADVERTISE_10HALF        0x0020  /* Try for 10mbps half-duplex  */
-#define ADVERTISE_10FULL        0x0040  /* Try for 10mbps full-duplex  */
-#define ADVERTISE_100HALF       0x0080  /* Try for 100mbps half-duplex */
-#define ADVERTISE_100FULL       0x0100  /* Try for 100mbps full-duplex */
-
 #define CONTROL_PAYLOAD_WORDS 5
 #define CONTROL_PAYLOAD_SIZE (CONTROL_PAYLOAD_WORDS * (sizeof(uint32_t)))
 
-struct PHY {
-    uint32_t regs[32];
-
-    int link;
-
-    unsigned int (*read)(struct PHY *phy, unsigned int req);
-    void (*write)(struct PHY *phy, unsigned int req,
-                  unsigned int data);
-};
-
-static unsigned int tdk_read(struct PHY *phy, unsigned int req)
-{
-    int regnum;
-    unsigned r = 0;
-
-    regnum = req & 0x1f;
-
-    switch (regnum) {
-        case 1:
-            if (!phy->link) {
-                break;
-            }
-            /* MR1.  */
-            /* Speeds and modes.  */
-            r |= (1 << 13) | (1 << 14);
-            r |= (1 << 11) | (1 << 12);
-            r |= (1 << 5); /* Autoneg complete.  */
-            r |= (1 << 3); /* Autoneg able.  */
-            r |= (1 << 2); /* link.  */
-            r |= (1 << 1); /* link.  */
-            break;
-        case 5:
-            /* Link partner ability.
-               We are kind; always agree with whatever best mode
-               the guest advertises.  */
-            r = 1 << 14; /* Success.  */
-            /* Copy advertised modes.  */
-            r |= phy->regs[4] & (15 << 5);
-            /* Autoneg support.  */
-            r |= 1;
-            break;
-        case 17:
-            /* Marvell PHY on many xilinx boards.  */
-            r = 0x8000; /* 1000Mb  */
-            break;
-        case 18:
-            {
-                /* Diagnostics reg.  */
-                int duplex = 0;
-                int speed_100 = 0;
-
-                if (!phy->link) {
-                    break;
-                }
-
-                /* Are we advertising 100 half or 100 duplex ? */
-                speed_100 = !!(phy->regs[4] & ADVERTISE_100HALF);
-                speed_100 |= !!(phy->regs[4] & ADVERTISE_100FULL);
-
-                /* Are we advertising 10 duplex or 100 duplex ? */
-                duplex = !!(phy->regs[4] & ADVERTISE_100FULL);
-                duplex |= !!(phy->regs[4] & ADVERTISE_10FULL);
-                r = (speed_100 << 10) | (duplex << 11);
-            }
-            break;
-
-        default:
-            r = phy->regs[regnum];
-            break;
-    }
-    DPHY(qemu_log("\n%s %x = reg[%d]\n", __func__, r, regnum));
-    return r;
-}
-
-static void
-tdk_write(struct PHY *phy, unsigned int req, unsigned int data)
-{
-    int regnum;
-
-    regnum = req & 0x1f;
-    DPHY(qemu_log("%s reg[%d] = %x\n", __func__, regnum, data));
-    switch (regnum) {
-        default:
-            phy->regs[regnum] = data;
-            break;
-    }
-
-    /* Unconditionally clear regs[BMCR][BMCR_RESET] */
-    phy->regs[0] &= ~0x8000;
-}
-
-static void
-tdk_init(struct PHY *phy)
-{
-    phy->regs[0] = 0x3100;
-    /* PHY Id.  */
-    phy->regs[2] = 0x0300;
-    phy->regs[3] = 0xe400;
-    /* Autonegotiation advertisement reg.  */
-    phy->regs[4] = 0x01E1;
-    phy->link = 1;
-
-    phy->read = tdk_read;
-    phy->write = tdk_write;
-}
-
-struct MDIOBus {
-    /* bus.  */
-    int mdc;
-    int mdio;
-
-    /* decoder.  */
-    enum {
-        PREAMBLE,
-        SOF,
-        OPC,
-        ADDR,
-        REQ,
-        TURNAROUND,
-        DATA
-    } state;
-    unsigned int drive;
-
-    unsigned int cnt;
-    unsigned int addr;
-    unsigned int opc;
-    unsigned int req;
-    unsigned int data;
-
-    struct PHY *devs[32];
-};
-
-static void
-mdio_attach(struct MDIOBus *bus, struct PHY *phy, unsigned int addr)
-{
-    bus->devs[addr & 0x1f] = phy;
-}
-
-#ifdef USE_THIS_DEAD_CODE
-static void
-mdio_detach(struct MDIOBus *bus, struct PHY *phy, unsigned int addr)
-{
-    bus->devs[addr & 0x1f] = NULL;
-}
-#endif
-
-static uint16_t mdio_read_req(struct MDIOBus *bus, unsigned int addr,
-                  unsigned int reg)
-{
-    struct PHY *phy;
-    uint16_t data;
-
-    phy = bus->devs[addr];
-    if (phy && phy->read) {
-        data = phy->read(phy, reg);
-    } else {
-        data = 0xffff;
-    }
-    DPHY(qemu_log("%s addr=%d reg=%d data=%x\n", __func__, addr, reg, data));
-    return data;
-}
-
-static void mdio_write_req(struct MDIOBus *bus, unsigned int addr,
-               unsigned int reg, uint16_t data)
-{
-    struct PHY *phy;
-
-    DPHY(qemu_log("%s addr=%d reg=%d data=%x\n", __func__, addr, reg, data));
-    phy = bus->devs[addr];
-    if (phy && phy->write) {
-        phy->write(phy, reg, data);
-    }
-}
-
 #define DENET(x)
 
 #define R_RAF      (0x000 / 4)
@@ -322,8 +141,8 @@ enum {
 
 /* Indirect registers.  */
 struct TEMAC  {
-    struct MDIOBus mdio_bus;
-    struct PHY phy;
+    struct qemu_mdio mdio_bus;
+    struct qemu_phy phy;
 
     void *parent;
 };
diff --git a/hw/net/Makefile.objs b/hw/net/Makefile.objs
index 4171af0b5d..a020963d10 100644
--- a/hw/net/Makefile.objs
+++ b/hw/net/Makefile.objs
@@ -30,6 +30,8 @@ common-obj-$(CONFIG_SUNHME) += sunhme.o
 common-obj-$(CONFIG_FTGMAC100) += ftgmac100.o
 common-obj-$(CONFIG_SUNGEM) += sungem.o
 
+common-obj-y += mdio.o
+
 obj-$(CONFIG_ETRAXFS) += etraxfs_eth.o
 obj-$(CONFIG_COLDFIRE) += mcf_fec.o
 obj-$(CONFIG_MILKYMIST) += milkymist-minimac2.o
-- 
2.14.1

