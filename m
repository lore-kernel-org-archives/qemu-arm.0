Received: by 10.25.21.156 with SMTP id 28csp91582lfv;
        Mon, 11 Jul 2016 16:27:42 -0700 (PDT)
X-Received: by 10.55.159.87 with SMTP id i84mr30318898qke.115.1468279662629;
        Mon, 11 Jul 2016 16:27:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f65si276613qkj.271.2016.07.11.16.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 16:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMkc2-0001TZ-4y
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 19:27:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38305)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkVG-0001Yj-4g
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 19:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkVA-0006n7-Ph
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 19:20:40 -0400
Received: from mail-cys01nam02on0068.outbound.protection.outlook.com
	([104.47.37.68]:46832
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkVA-0006ma-I5; Mon, 11 Jul 2016 19:20:36 -0400
Received: from CY1NAM02FT047.eop-nam02.prod.protection.outlook.com
	(10.152.74.53) by CY1NAM02HT122.eop-nam02.prod.protection.outlook.com
	(10.152.75.195) with Microsoft SMTP Server (TLS) id 15.1.523.9;
	Mon, 11 Jul 2016 23:20:34 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT047.mail.protection.outlook.com (10.152.74.177) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.534.7
	via Frontend Transport; Mon, 11 Jul 2016 23:20:32 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:43730
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV5-0002yf-TX; Mon, 11 Jul 2016 16:20:31 -0700
Received: from [127.0.0.1] (port=49017 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV5-000168-Rs; Mon, 11 Jul 2016 16:20:31 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6BNDqWG020894; Mon, 11 Jul 2016 16:13:52 -0700
Received: from [172.19.74.182] (port=39658 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV5-000165-2u; Mon, 11 Jul 2016 16:20:31 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 11 Jul 2016 16:20:10 -0700
Message-ID: <8bf7719a88e0b2fcb12fd230b00df01f1b70f192.1468279072.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468279072.git.alistair.francis@xilinx.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22444.005
X-TM-AS-Result: No--8.227-7.0-31-10
X-imss-scan-details: No--8.227-7.0-31-10
X-TMASE-MatchedRID: dc0zmQEEFZkpKLOC9nYDvgPZZctd3P4B7f6JAS2hKPhFNyTs3OcE/xWM
	l8ih/tVGDYcG/hG0fL/dBuX0iSdhuCam27PEIBC/DB+ErBr0bAPSde/CNbaZJXDwxJWw/hfyXVC
	mjmk3KwwOfMZt/azrVWmteiwCVYwcvhWGVncXOJGeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8h+IC
	quNi0WJLidHKOQUSXkIKVlBjacP8dr8fHC3B8nVPJduh/36jSaftwZ3X11IV0=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(586003)(5001770100001)(2950100001)(33646002)(4326007)(118296001)(48376002)(105606002)(77096005)(36756003)(92566002)(76176999)(189998001)(71366001)(86362001)(85426001)(2906002)(11100500001)(7846002)(87936001)(5003600100003)(8676002)(229853001)(19580395003)(81156014)(64026002)(106466001)(81166006)(8936002)(9786002)(50226002)(305945005)(50466002)(7696003)(5003940100001)(50986999)(47776003)(356003)(19580405001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT122; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1;
	CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: acb2a0c7-89cc-4870-36c6-08d3a9e1f581
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT122;
X-Microsoft-Antispam-PRVS: <2cffc6613fba47c4aa22bcc2c647724d@CY1NAM02HT122.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13018025)(13023025)(13024025)(13017025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT122; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT122; 
X-Forefront-PRVS: 00003DBFE7
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2016 23:20:32.5368 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT122
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.68
Subject: [Qemu-arm] [PATCH v1 4/5] cadence_gem: Correct indentation
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
Cc: peter.maydell@linaro.org, crosthwaitepeter@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: doKcVpe5RFxc

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/net/cadence_gem.c | 182 +++++++++++++++++++++++++--------------------------
 1 file changed, 91 insertions(+), 91 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index c80e833..1c09756 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -894,111 +894,111 @@ static void gem_transmit(CadenceGEMState *s)
     total_bytes = 0;
 
     for (q = s->num_priority_queues - 1; q >= 0; q--) {
-    /* read current descriptor */
-    packet_desc_addr = s->tx_desc_addr[q];
-
-    DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
-    cpu_physical_memory_read(packet_desc_addr,
-                             (uint8_t *)desc, sizeof(desc));
-    /* Handle all descriptors owned by hardware */
-    while (tx_desc_get_used(desc) == 0) {
+        /* read current descriptor */
+        packet_desc_addr = s->tx_desc_addr[q];
 
-        /* Do nothing if transmit is not enabled. */
-        if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
-            return;
-        }
-        print_gem_tx_desc(desc, q);
-
-        /* The real hardware would eat this (and possibly crash).
-         * For QEMU let's lend a helping hand.
-         */
-        if ((tx_desc_get_buffer(desc) == 0) ||
-            (tx_desc_get_length(desc) == 0)) {
-            DB_PRINT("Invalid TX descriptor @ 0x%x\n",
-                     (unsigned)packet_desc_addr);
-            break;
-        }
-
-        if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_packet)) {
-            DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space 0x%x\n",
-                     (unsigned)packet_desc_addr,
-                     (unsigned)tx_desc_get_length(desc),
-                     sizeof(tx_packet) - (p - tx_packet));
-            break;
-        }
-
-        /* Gather this fragment of the packet from "dma memory" to our contig.
-         * buffer.
-         */
-        cpu_physical_memory_read(tx_desc_get_buffer(desc), p,
-                                 tx_desc_get_length(desc));
-        p += tx_desc_get_length(desc);
-        total_bytes += tx_desc_get_length(desc);
+        DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
+        cpu_physical_memory_read(packet_desc_addr,
+                                 (uint8_t *)desc, sizeof(desc));
+        /* Handle all descriptors owned by hardware */
+        while (tx_desc_get_used(desc) == 0) {
 
-        /* Last descriptor for this packet; hand the whole thing off */
-        if (tx_desc_get_last(desc)) {
-            unsigned    desc_first[2];
+            /* Do nothing if transmit is not enabled. */
+            if (!(s->regs[GEM_NWCTRL] & GEM_NWCTRL_TXENA)) {
+                return;
+            }
+            print_gem_tx_desc(desc, q);
 
-            /* Modify the 1st descriptor of this packet to be owned by
-             * the processor.
+            /* The real hardware would eat this (and possibly crash).
+             * For QEMU let's lend a helping hand.
              */
-            cpu_physical_memory_read(s->tx_desc_addr[q], (uint8_t *)desc_first,
-                                     sizeof(desc_first));
-            tx_desc_set_used(desc_first);
-            cpu_physical_memory_write(s->tx_desc_addr[q], (uint8_t *)desc_first,
-                                      sizeof(desc_first));
-            /* Advance the hardware current descriptor past this packet */
-            if (tx_desc_get_wrap(desc)) {
-                s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
-            } else {
-                s->tx_desc_addr[q] = packet_desc_addr + 8;
+            if ((tx_desc_get_buffer(desc) == 0) ||
+                (tx_desc_get_length(desc) == 0)) {
+                DB_PRINT("Invalid TX descriptor @ 0x%x\n",
+                         (unsigned)packet_desc_addr);
+                break;
             }
-            DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
-
-            s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
-            s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
 
-            /* Handle interrupt consequences */
-            gem_update_int_status(s);
-
-            /* Is checksum offload enabled? */
-            if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
-                net_checksum_calculate(tx_packet, total_bytes);
+            if (tx_desc_get_length(desc) > sizeof(tx_packet) - (p - tx_packet)) {
+                DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space 0x%x\n",
+                         (unsigned)packet_desc_addr,
+                         (unsigned)tx_desc_get_length(desc),
+                         sizeof(tx_packet) - (p - tx_packet));
+                break;
             }
 
-            /* Update MAC statistics */
-            gem_transmit_updatestats(s, tx_packet, total_bytes);
+            /* Gather this fragment of the packet from "dma memory" to our contig.
+             * buffer.
+             */
+            cpu_physical_memory_read(tx_desc_get_buffer(desc), p,
+                                     tx_desc_get_length(desc));
+            p += tx_desc_get_length(desc);
+            total_bytes += tx_desc_get_length(desc);
+
+            /* Last descriptor for this packet; hand the whole thing off */
+            if (tx_desc_get_last(desc)) {
+                unsigned    desc_first[2];
+
+                /* Modify the 1st descriptor of this packet to be owned by
+                 * the processor.
+                 */
+                cpu_physical_memory_read(s->tx_desc_addr[q], (uint8_t *)desc_first,
+                                         sizeof(desc_first));
+                tx_desc_set_used(desc_first);
+                cpu_physical_memory_write(s->tx_desc_addr[q], (uint8_t *)desc_first,
+                                          sizeof(desc_first));
+                /* Advance the hardware current descriptor past this packet */
+                if (tx_desc_get_wrap(desc)) {
+                    s->tx_desc_addr[q] = s->regs[GEM_TXQBASE];
+                } else {
+                    s->tx_desc_addr[q] = packet_desc_addr + 8;
+                }
+                DB_PRINT("TX descriptor next: 0x%08x\n", s->tx_desc_addr[q]);
+
+                s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_TXCMPL;
+                s->regs[GEM_ISR] |= GEM_INT_TXCMPL & ~(s->regs[GEM_IMR]);
+
+                /* Handle interrupt consequences */
+                gem_update_int_status(s);
+
+                /* Is checksum offload enabled? */
+                if (s->regs[GEM_DMACFG] & GEM_DMACFG_TXCSUM_OFFL) {
+                    net_checksum_calculate(tx_packet, total_bytes);
+                }
+
+                /* Update MAC statistics */
+                gem_transmit_updatestats(s, tx_packet, total_bytes);
+
+                /* Send the packet somewhere */
+                if (s->phy_loop || (s->regs[GEM_NWCTRL] & GEM_NWCTRL_LOCALLOOP)) {
+                    gem_receive(qemu_get_queue(s->nic), tx_packet, total_bytes);
+                } else {
+                    qemu_send_packet(qemu_get_queue(s->nic), tx_packet,
+                                     total_bytes);
+                }
+
+                /* Prepare for next packet */
+                p = tx_packet;
+                total_bytes = 0;
+            }
 
-            /* Send the packet somewhere */
-            if (s->phy_loop || (s->regs[GEM_NWCTRL] & GEM_NWCTRL_LOCALLOOP)) {
-                gem_receive(qemu_get_queue(s->nic), tx_packet, total_bytes);
+            /* read next descriptor */
+            if (tx_desc_get_wrap(desc)) {
+                tx_desc_set_last(desc);
+                packet_desc_addr = s->regs[GEM_TXQBASE];
             } else {
-                qemu_send_packet(qemu_get_queue(s->nic), tx_packet,
-                                 total_bytes);
+                packet_desc_addr += 8;
             }
-
-            /* Prepare for next packet */
-            p = tx_packet;
-            total_bytes = 0;
+            DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
+            cpu_physical_memory_read(packet_desc_addr,
+                                     (uint8_t *)desc, sizeof(desc));
         }
 
-        /* read next descriptor */
-        if (tx_desc_get_wrap(desc)) {
-            tx_desc_set_last(desc);
-            packet_desc_addr = s->regs[GEM_TXQBASE];
-        } else {
-            packet_desc_addr += 8;
+        if (tx_desc_get_used(desc)) {
+            s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_USED;
+            s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
+            gem_update_int_status(s);
         }
-        DB_PRINT("read descriptor 0x%" HWADDR_PRIx "\n", packet_desc_addr);
-        cpu_physical_memory_read(packet_desc_addr,
-                                 (uint8_t *)desc, sizeof(desc));
-    }
-
-    if (tx_desc_get_used(desc)) {
-        s->regs[GEM_TXSTATUS] |= GEM_TXSTATUS_USED;
-        s->regs[GEM_ISR] |= GEM_INT_TXUSED & ~(s->regs[GEM_IMR]);
-        gem_update_int_status(s);
-    }
     }
 }
 
-- 
2.7.4

