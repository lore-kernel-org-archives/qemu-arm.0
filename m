Received: by 10.25.21.156 with SMTP id 28csp91094lfv;
        Mon, 11 Jul 2016 16:25:40 -0700 (PDT)
X-Received: by 10.55.170.141 with SMTP id t135mr25481568qke.112.1468279540174;
        Mon, 11 Jul 2016 16:25:40 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q187si1915143qkd.89.2016.07.11.16.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 16:25:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMka3-0005rs-HM
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 19:25:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkVA-0001BC-SX
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 19:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkV6-0006lQ-NR
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 19:20:36 -0400
Received: from mail-bl2nam02on0068.outbound.protection.outlook.com
	([104.47.38.68]:63584
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkV6-0006lM-Gx
	for qemu-devel@nongnu.org; Mon, 11 Jul 2016 19:20:32 -0400
Received: from SN1NAM02FT035.eop-nam02.prod.protection.outlook.com
	(10.152.72.56) by SN1NAM02HT230.eop-nam02.prod.protection.outlook.com
	(10.152.73.155) with Microsoft SMTP Server (TLS) id 15.1.523.9;
	Mon, 11 Jul 2016 23:20:29 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT035.mail.protection.outlook.com (10.152.72.145) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.534.7
	via Frontend Transport; Mon, 11 Jul 2016 23:20:27 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:43716
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV0-0002yZ-RU; Mon, 11 Jul 2016 16:20:26 -0700
Received: from [127.0.0.1] (port=49003 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV0-00015n-Oq; Mon, 11 Jul 2016 16:20:26 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6BNDlqi020886; Mon, 11 Jul 2016 16:13:47 -0700
Received: from [172.19.74.182] (port=39654 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkUz-00015k-UR; Mon, 11 Jul 2016 16:20:25 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 11 Jul 2016 16:20:05 -0700
Message-ID: <4f9d6af885632f6fed07d88e43a870b32f782122.1468279072.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468279072.git.alistair.francis@xilinx.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22444.005
X-TM-AS-Result: No--7.560-7.0-31-10
X-imss-scan-details: No--7.560-7.0-31-10
X-TMASE-MatchedRID: g6wNTJUevQv0D0R+G5TTHKMVgdN9w+TCbnWMzHijq6SDmK2TdU2k3B/X
	WBLkU7fukhHH+Hg9sq6+daZEFcM/u5Coy9iDotiwR/j040fRFpJXLUapz6y7gWPK/53RnQ7FMCm
	LSFOvZt3pQ+VHa7WMQQL75N0/Med0rlxQ2awfmesdxBAG5/hkW+WLMMbI1EWuMBVcbaPpizCGW/
	nbo6obw9esPOSWdh/KhR3zLeiPlm9EmVS4M9Gn30tzk37SzX4NaN2KuTwsCwKCsBeCv8CM/cppN
	a9SPqmihPnb+rxsbZMBGkG3JT2QIabPJCj86mr/ngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIfiAq
	rjYtFiTBg7/kf6nHRlG4F2+rfN+cYw5fn7aj9L9gan1vdu5bcn7cGd19dSFd
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(118296001)(106466001)(50466002)(19580395003)(8936002)(92566002)(105606002)(19580405001)(76176999)(50986999)(5003600100003)(50226002)(33646002)(86362001)(4326007)(586003)(7846002)(8676002)(11100500001)(2950100001)(85426001)(305945005)(64026002)(47776003)(77096005)(87936001)(81166006)(9786002)(5001770100001)(189998001)(356003)(71366001)(48376002)(7696003)(5003940100001)(36756003)(81156014)(229853001)(2906002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT230; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1;
	CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a36c9ce0-8cb4-4152-0cf2-08d3a9e1f2a2
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT230;
X-Microsoft-Antispam-PRVS: <1263d7b28e764f4db3d63182c002ced9@SN1NAM02HT230.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(8121501046)(13017025)(5005006)(13024025)(13023025)(13015025)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT230; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT230; 
X-Forefront-PRVS: 00003DBFE7
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2016 23:20:27.6557 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT230
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.68
Subject: [Qemu-devel] [PATCH v1 2/5] cadence_gem: Arrayify
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q4YR/7ILyQi9

Arrayify the Cadence GEM device to prepare for adding priority queue support.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

This patch has no real effect, I used it to help debug some issues so I
figured I would leave it in.

 hw/net/cadence_gem.c         | 78 +++++++++++++++++++++++---------------------
 include/hw/net/cadence_gem.h | 13 +++++---
 2 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 9d64644..2dabad5 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -428,18 +428,18 @@ static int gem_can_receive(NetClientState *nc)
         return 0;
     }
 
-    if (rx_desc_get_ownership(s->rx_desc) == 1) {
+    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
         if (s->can_rx_state != 2) {
             s->can_rx_state = 2;
             DB_PRINT("can't receive - busy buffer descriptor 0x%x\n",
-                     s->rx_desc_addr);
+                     s->rx_desc_addr[0]);
         }
         return 0;
     }
 
     if (s->can_rx_state != 0) {
         s->can_rx_state = 0;
-        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr);
+        DB_PRINT("can receive 0x%x\n", s->rx_desc_addr[0]);
     }
     return 1;
 }
@@ -452,7 +452,7 @@ static void gem_update_int_status(CadenceGEMState *s)
 {
     if (s->regs[GEM_ISR]) {
         DB_PRINT("asserting int. (0x%08x)\n", s->regs[GEM_ISR]);
-        qemu_set_irq(s->irq, 1);
+        qemu_set_irq(s->irq[0], 1);
     }
 }
 
@@ -603,15 +603,15 @@ static int gem_mac_address_filter(CadenceGEMState *s, const uint8_t *packet)
 
 static void gem_get_rx_desc(CadenceGEMState *s)
 {
-    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr);
+    DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[0]);
     /* read current descriptor */
-    cpu_physical_memory_read(s->rx_desc_addr,
-                             (uint8_t *)s->rx_desc, sizeof(s->rx_desc));
+    cpu_physical_memory_read(s->rx_desc_addr[0],
+                             (uint8_t *)s->rx_desc[0], sizeof(s->rx_desc[0]));
 
     /* Descriptor owned by software ? */
-    if (rx_desc_get_ownership(s->rx_desc) == 1) {
+    if (rx_desc_get_ownership(s->rx_desc[0]) == 1) {
         DB_PRINT("descriptor 0x%x owned by sw.\n",
-                 (unsigned)s->rx_desc_addr);
+                 (unsigned)s->rx_desc_addr[0]);
         s->regs[GEM_RXSTATUS] |= GEM_RXSTATUS_NOBUF;
         s->regs[GEM_ISR] |= GEM_INT_RXUSED & ~(s->regs[GEM_IMR]);
         /* Handle interrupt consequences */
@@ -718,54 +718,56 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         }
 
         DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc));
+                rx_desc_get_buffer(s->rx_desc[0]));
 
         /* Copy packet data to emulated DMA buffer */
-        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc) + rxbuf_offset,
+        cpu_physical_memory_write(rx_desc_get_buffer(s->rx_desc[0]) +
+                                                                 rxbuf_offset,
                                   rxbuf_ptr, MIN(bytes_to_copy, rxbufsize));
         rxbuf_ptr += MIN(bytes_to_copy, rxbufsize);
         bytes_to_copy -= MIN(bytes_to_copy, rxbufsize);
 
         /* Update the descriptor.  */
         if (first_desc) {
-            rx_desc_set_sof(s->rx_desc);
+            rx_desc_set_sof(s->rx_desc[0]);
             first_desc = false;
         }
         if (bytes_to_copy == 0) {
-            rx_desc_set_eof(s->rx_desc);
-            rx_desc_set_length(s->rx_desc, size);
+            rx_desc_set_eof(s->rx_desc[0]);
+            rx_desc_set_length(s->rx_desc[0], size);
         }
-        rx_desc_set_ownership(s->rx_desc);
+        rx_desc_set_ownership(s->rx_desc[0]);
 
         switch (maf) {
         case GEM_RX_PROMISCUOUS_ACCEPT:
             break;
         case GEM_RX_BROADCAST_ACCEPT:
-            rx_desc_set_broadcast(s->rx_desc);
+            rx_desc_set_broadcast(s->rx_desc[0]);
             break;
         case GEM_RX_UNICAST_HASH_ACCEPT:
-            rx_desc_set_unicast_hash(s->rx_desc);
+            rx_desc_set_unicast_hash(s->rx_desc[0]);
             break;
         case GEM_RX_MULTICAST_HASH_ACCEPT:
-            rx_desc_set_multicast_hash(s->rx_desc);
+            rx_desc_set_multicast_hash(s->rx_desc[0]);
             break;
         case GEM_RX_REJECT:
             abort();
         default: /* SAR */
-            rx_desc_set_sar(s->rx_desc, maf);
+            rx_desc_set_sar(s->rx_desc[0], maf);
         }
 
         /* Descriptor write-back.  */
-        cpu_physical_memory_write(s->rx_desc_addr,
-                                  (uint8_t *)s->rx_desc, sizeof(s->rx_desc));
+        cpu_physical_memory_write(s->rx_desc_addr[0],
+                                  (uint8_t *)s->rx_desc[0],
+                                  sizeof(s->rx_desc[0]));
 
         /* Next descriptor */
-        if (rx_desc_get_wrap(s->rx_desc)) {
+        if (rx_desc_get_wrap(s->rx_desc[0])) {
             DB_PRINT("wrapping RX descriptor list\n");
-            s->rx_desc_addr = s->regs[GEM_RXQBASE];
+            s->rx_desc_addr[0] = s->regs[GEM_RXQBASE];
         } else {
             DB_PRINT("incrementing RX descriptor list\n");
-            s->rx_desc_addr += 8;
+            s->rx_desc_addr[0] += 8;
         }
         gem_get_rx_desc(s);
     }
@@ -855,7 +857,7 @@ static void gem_transmit(CadenceGEMState *s)
     total_bytes = 0;
 
     /* read current descriptor */
-    packet_desc_addr = s->tx_desc_addr;
+    packet_desc_addr = s->tx_desc_addr[0];
 
     DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
     cpu_physical_memory_read(packet_desc_addr,
@@ -902,18 +904,18 @@ static void gem_transmit(CadenceGEMState *s)
             /* Modify the 1st descriptor of this packet to be owned by
              * the processor.
              */
-            cpu_physical_memory_read(s->tx_desc_addr, (uint8_t *)desc_first,
+            cpu_physical_memory_read(s->tx_desc_addr[0], (uint8_t *)desc_first,
                                      sizeof(desc_first));
             tx_desc_set_used(desc_first);
-            cpu_physical_memory_write(s->tx_desc_addr, (uint8_t *)desc_first,
+            cpu_physical_memory_write(s->tx_desc_addr[0], (uint8_t *)desc_first,
                                       sizeof(desc_first));
             /* Advance the hardware current descriptor past this packet */
             if (tx_desc_get_wrap(desc)) {
-                s->tx_desc_addr = s->regs[GEM_TXQBASE];
+                s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
             } else {
-                s->tx_desc_addr = packet_desc_addr + 8;
+                s->tx_desc_addr[0] = packet_desc_addr + 8;
             }
-            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr);
+            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[0]);
 
             s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
             s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
@@ -1076,7 +1078,7 @@ static uint64_t gem_read(void *opaque, hwaddr offset, unsigned size)
     switch (offset) {
     case GEM_ISR:
         DB_PRINT("lowering irq on ISR read\n");
-        qemu_set_irq(s->irq, 0);
+        qemu_set_irq(s->irq[0], 0);
         break;
     case GEM_PHYMNTNC:
         if (retval & GEM_PHYMNTNC_OP_R) {
@@ -1139,7 +1141,7 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         }
         if (!(val & GEM_NWCTRL_TXENA)) {
             /* Reset to start of Q when transmit disabled. */
-            s->tx_desc_addr = s->regs[GEM_TXQBASE];
+            s->tx_desc_addr[0] = s->regs[GEM_TXQBASE];
         }
         if (gem_can_receive(qemu_get_queue(s->nic))) {
             qemu_flush_queued_packets(qemu_get_queue(s->nic));
@@ -1150,10 +1152,10 @@ static void gem_write(void *opaque, hwaddr offset, uint64_t val,
         gem_update_int_status(s);
         break;
     case GEM_RXQBASE:
-        s->rx_desc_addr = val;
+        s->rx_desc_addr[0] = val;
         break;
     case GEM_TXQBASE:
-        s->tx_desc_addr = val;
+        s->tx_desc_addr[0] = val;
         break;
     case GEM_RXSTATUS:
         gem_update_int_status(s);
@@ -1218,7 +1220,7 @@ static void gem_realize(DeviceState *dev, Error **errp)
 {
     CadenceGEMState *s = CADENCE_GEM(dev);
 
-    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
 
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
@@ -1247,8 +1249,10 @@ static const VMStateDescription vmstate_cadence_gem = {
         VMSTATE_UINT32_ARRAY(regs, CadenceGEMState, CADENCE_GEM_MAXREG),
         VMSTATE_UINT16_ARRAY(phy_regs, CadenceGEMState, 32),
         VMSTATE_UINT8(phy_loop, CadenceGEMState),
-        VMSTATE_UINT32(rx_desc_addr, CadenceGEMState),
-        VMSTATE_UINT32(tx_desc_addr, CadenceGEMState),
+        VMSTATE_UINT32_ARRAY(rx_desc_addr, CadenceGEMState,
+                             MAX_PRIORITY_QUEUES),
+        VMSTATE_UINT32_ARRAY(tx_desc_addr, CadenceGEMState,
+                             MAX_PRIORITY_QUEUES),
         VMSTATE_BOOL_ARRAY(sar_active, CadenceGEMState, 4),
         VMSTATE_END_OF_LIST(),
     }
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index f2e08e3..77e0582 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -32,6 +32,8 @@
 
 #define CADENCE_GEM_MAXREG        (0x00000640/4) /* Last valid GEM address */
 
+#define MAX_PRIORITY_QUEUES             8
+
 typedef struct CadenceGEMState {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -40,7 +42,10 @@ typedef struct CadenceGEMState {
     MemoryRegion iomem;
     NICState *nic;
     NICConf conf;
-    qemu_irq irq;
+    qemu_irq irq[MAX_PRIORITY_QUEUES];
+
+    /* Static properties */
+    uint8_t num_priority_queues;
 
     /* GEM registers backing store */
     uint32_t regs[CADENCE_GEM_MAXREG];
@@ -59,12 +64,12 @@ typedef struct CadenceGEMState {
     uint8_t phy_loop; /* Are we in phy loopback? */
 
     /* The current DMA descriptor pointers */
-    uint32_t rx_desc_addr;
-    uint32_t tx_desc_addr;
+    uint32_t rx_desc_addr[MAX_PRIORITY_QUEUES];
+    uint32_t tx_desc_addr[MAX_PRIORITY_QUEUES];
 
     uint8_t can_rx_state; /* Debug only */
 
-    unsigned rx_desc[2];
+    unsigned rx_desc[MAX_PRIORITY_QUEUES][2];
 
     bool sar_active[4];
 } CadenceGEMState;
-- 
2.7.4

