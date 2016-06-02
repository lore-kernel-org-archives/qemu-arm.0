Received: by 10.25.27.66 with SMTP id b63csp732501lfb;
        Thu, 2 Jun 2016 07:10:50 -0700 (PDT)
X-Received: by 10.200.56.240 with SMTP id g45mr8964065qtc.35.1464876649942;
        Thu, 02 Jun 2016 07:10:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u83si14896297qkl.118.2016.06.02.07.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Jun 2016 07:10:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47383 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8TKj-0002z5-3o
	for alex.bennee@linaro.org; Thu, 02 Jun 2016 10:10:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>) id 1b8SDj-0003P4-IZ
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 08:59:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>) id 1b8SDh-0004v2-FU
	for qemu-arm@nongnu.org; Thu, 02 Jun 2016 08:59:30 -0400
Received: from mail-by2on0079.outbound.protection.outlook.com
	([207.46.100.79]:52355
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bogdan.purcareata@nxp.com>)
	id 1b8SDZ-0004rs-Nu; Thu, 02 Jun 2016 08:59:22 -0400
Received: from BY2PR03CA047.namprd03.prod.outlook.com (10.141.249.20) by
	BLUPR03MB200.namprd03.prod.outlook.com (10.255.212.153) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Thu, 2 Jun 2016 12:26:31 +0000
Received: from BN1BFFO11FD014.protection.gbl (2a01:111:f400:7c10::1:126) by
	BY2PR03CA047.outlook.office365.com (2a01:111:e400:2c5d::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.511.8 via
	Frontend Transport; Thu, 2 Jun 2016 12:26:30 +0000
Authentication-Results: spf=fail (sender IP is 192.88.158.2)
	smtp.mailfrom=nxp.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=none action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.158.2 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.158.2; helo=az84smr01.freescale.net;
Received: from az84smr01.freescale.net (192.88.158.2) by
	BN1BFFO11FD014.mail.protection.outlook.com (10.58.144.77) with
	Microsoft SMTP Server (TLS) id 15.1.497.8 via Frontend Transport;
	Thu, 2 Jun 2016 12:26:29 +0000
Received: from localhost.localdomain (fsr-ub1464-106.ea.freescale.net
	[10.171.73.16])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id u52CQMYA027054;
	Thu, 2 Jun 2016 05:26:27 -0700
From: Bogdan Purcareata <bogdan.purcareata@nxp.com>
To: <eric.auger@linaro.org>, <crosthwaite.peter@gmail.com>, <agraf@suse.de>,
	<peter.maydell@linaro.org>
Date: Thu, 2 Jun 2016 12:26:22 +0000
Message-ID: <1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131093439900956772;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.158.2; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(36756003)(2950100001)(2201001)(47776003)(8936002)(85426001)(5008740100001)(92566002)(50226002)(5003940100001)(8676002)(81166006)(19580395003)(77096005)(104016004)(87936001)(50466002)(86362001)(586003)(48376002)(19580405001)(49486002)(189998001)(105606002)(106466001)(5001770100001)(50986999)(229853001)(6806005)(2906002)(76176999)(4326007)(33646002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB200;
	H:az84smr01.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD014;
	1:tlTBD2LSntcDVmOPfHEPe39IkF/uMbcjvZMpJkqRA6wf1IgTb5QENtw5isJSH7obC6tFTxQeoqoR+TPJPafMhTxjFnyq8RG2hexkRgtqlRK8uHXf7wO6myNceM25zw2G5tfXpRrZUrehDjXC2HGH9qV+H1vtQAo943/Mmud3Nati8LhwweYBm3sXPFcaJATyydiPJNO+4f8AfkOw8o4Wfv5VUm72CEUZevir+zbNb5YeuH6BoTazwjVQDDyMLGSBu8Wt+hTtqB7mxlctmdKBNpRIZYOYsDABXwGqv8BM2B1GePP0RgPCXaRhrZUdobUv2z7+M9tzJ3QEViEkppaJZefZ/PkzMJ2G9MdzUcNdcdsIjYw0BPZA2h+bEO50UYlYfrIKuyXvz5n4dV5o//P3F94LiH6nLGW6Ua8/3dczVN2Oe1pHAhjf8z+aqd/P59QvOF2etTQPc/IxHf95ByZVuYZDVMY4OQhcUQ1my4k2K/iHeK1p8mpqnjL6BouCAKXmlrThUIVoP1WQS+d9W7bkkQmRP6WR89+x+hI2V6XRZonohcXLu4mN23ffvvzh2j0FJo6Qr7D4syouJb5xZsnK7g==
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 748a1cd8-d9f7-44d0-2d5c-08d38ae12012
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB200;
	2:aRifXuQZO5UFnj+SqeEWnX4y5qHVxiaUtyyuJcUQJ1kIUbb7re2uDPHu4ofLMsTlXE4/XQrJYZ8Q/SGZsQWYda8UwhU3KomPEZUb2kNeqVjyU+YoF3baVU3iVP4JIGiEoAXDk/79zDMtrlMt7PYBBsLD3EJ6D0zWi2P+PaDg9tvVT2lDW6+y3E8UMX1AcPE4;
	3:dYPVBMKRDroGCGXdjRjsk/REBER2BkenKdUyYlPir3nwwPfwnzgjveyjMXIKfbstFviWXW2Ci+g+4DRNPTHajxd7StMtjC2Fp10Svxy4fW81epChyU1FUHpE4ZyaGu2VDP0ZDjssoEohqxbKw7uiBztbdFzgevELYFeEA095Yz3HuBlx6dyUhXkRmph/2/l1Ce3vcU+6G7jBtR61yxDNhd+Dy0GRjh9tb9lRBjDt+kE=
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BLUPR03MB200;
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB200;
	25:kYq5xEjvAJqiPUqsLW7T0xmVkPAXqtzg02Sv1U3kleIJyqhf+Yv+BSzcRhhxjUSvDhw1rKjEbm8lTj74rMuvlzFClJC3FtogvfiJeMYE6rD1wEYX4hwPJxleapoVrlN/q4dXev9heUDi3fGjk9091KPO7a1GNRwizC956DHPzczBeDVg1bQ4y1r0SbbSaNcy3bff6cf/G4CgvI7Z4Sz30fzp2R5FySyhdKPtoL870YiPr0WkO7LBkVPrUJGSFGbQlBoxANOfcY6SGIJMCWxG8+akf7IC9fqUUaore4mOBxKJt5/gboh7PBRIWdFpDGKP8nd7KI3+56lDGj7RucP++A9aC+uA6HtKrrgGuI7oAPJb5/xoUGTCC8/nh7B4rsgSxZzn2nEtGhdg1+LSFg9/Rlt6T5dElyaOoLMcq0OZjiV/0OBFElR4RSwIOeByaKPuPd/wyzNFXyHrWs+KZIRTXMNFYXNUgdf1M6BO7mx1CWZm3xgoq4lgVyBthv0GiwIccGF/pxQwU8f7jTWgHCL/S811wkD+CXuGzvtdqYTdPX4naGRvXhS4HvLZR/YcYTjKmw6CATVDFID4FabhX84rMCknGbOYB6c7413/dPuUHYe/qHAc/resep9THPDIuLEtvquLiSTXRc6kka/V0PPIP1mIbgyI3MTilvd16JodeBISA6imxSqS+aViSzrtRqWjx9wgCU1FUekRX+yPeEaoAqiPOlGKSh0alD7rcnAANEJ0+DEgnbPoqvy9+QxdzE6q
X-Microsoft-Antispam-PRVS: <BLUPR03MB200524562D4A484A9D8A561EA580@BLUPR03MB200.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13023025)(13017025)(13024025)(8121501046)(13018025)(13015025)(5005006)(10201501046)(3002001)(6055026);
	SRVR:BLUPR03MB200; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB200; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB200;
	4:TNPk3e5Qu01Sfz3GIly/5p8a19xHUp16RTnPwRr2UA8tTrHc1g0xfvdh4sK6OTK6v4muAnxYMZqQxAgI0Y4u0agb+pF24N2bIKd4oxQyfqEY0piGZcDgB4mbYzhBsxk+hYbvohxPm6TttNDVputTqyqYTi8MNi3NSCKH6ILeKFpYFircDEujz1wTW5g4Wih4UroUiLAo7l1mWGJm4TM28TqE4gjWZ6jGyBJJcFDSEbclbbeLdnCV8yuJSAUzc+M02aOIj2/TdmlRfzqdY6k750EfK003mwVhCIsAEEpLfj384U8yWftBnopuqaBLqy4Aby6ebECGKXCAZSC1yOlOkmQJCRlxJNm3L/FhcLrr+6wfJ/MuebDlP+wIF2gDQbslfNJbCBQ+LK/FMnyVLN77p9qt+HoTHVq5si9G9JnkGQlOOaOl5JYSA8myZQG+q2iEBxPEc9pgcV3YIB0iRIEq6isn9xRBki8tPtW8ZDmMJxjfBjWhSOPVK5RYijsdp0sc07zXbdpYou6+SDyFmfQTKQ==
X-Forefront-PRVS: 0961DF5286
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB200;
	23:dHbL+3aObMtRUTZM8YPMjtsrip92dv7GdjvzjHSJeM?=
	=?us-ascii?Q?WKZMezfnE49Dtdbd23ZyMMJB8oTE6g+73n+V3gqq0k13dZ7AXVMFtU33awLV?=
	=?us-ascii?Q?/M+VSVqDeufoW+u3h3DoItHubHmXA/CSGWAlg0QbBM5Jc1tMez+sLPOOHOp3?=
	=?us-ascii?Q?qVmAwiCUkO+C08IafzSW8hkTgTWM/TXtOASyPNVUU9el69tO478FDTx6DHGW?=
	=?us-ascii?Q?eWYJw8NsYwN/w1WgqQhaZZz+Jc04TXyi4CpRmTpnGiziOF2DgC/00WJ7mnEr?=
	=?us-ascii?Q?nv7MTCkcFaIgHU6vZ1v2UTi5uuMJuBnwTi5QjW3pxWUYIWY4M4BG0RY0I8U7?=
	=?us-ascii?Q?g8O1TFaTeaPVRyOpF+XTt592u2xxgxlBK/OKEVOAg7viWkAazTk6+go6uwPP?=
	=?us-ascii?Q?Dlb3Ss0ImHQiB8yUio74Idka1qGawbco8DThOI9BLi+rtJVPEP006sRcCDSv?=
	=?us-ascii?Q?LvFf/pjpMqKqRxf+/hzm5mXK6sWS+xplMdFhfYsA3DPGEF30JY29IznHgu+u?=
	=?us-ascii?Q?Lm+qtTKbaKJ0NgeR4txFYOyUATHJrif4DMuhA89f3XaaWZKDAK2S/r4c/3k3?=
	=?us-ascii?Q?OZXhcQAEjwXfGr8kDP2JUT2ilIgwsKJV880aBBggNhF/jgrnOsjZ5vJsxGg1?=
	=?us-ascii?Q?uGbxw6YOnbXISxocXRkmhJsNWkiSTbZZoPhhvgwVC39B0Iq5u9dczcCBZdt0?=
	=?us-ascii?Q?g1vC8XeIWr9hj0T0NQhgRPjEol+ybfHD/kRUDHZnCc2u2qpNuQselLsdLEm2?=
	=?us-ascii?Q?z4D2rrrmoIl/bQPv+IR1fL8l31Q2m8bqZjseykBSr2SjxEndROAG/Ga0JHXf?=
	=?us-ascii?Q?NnJwSrkAN63TmWqf4/8YhdSGhY9SISxCtGFm7cyKmwuIdXLUHfdQNSV46EA5?=
	=?us-ascii?Q?qDG+32P+uCwoUOYGgMZwDxZCklVihnj4oHjhBaRRGhWVKjeD0+1X+EbH1D7/?=
	=?us-ascii?Q?dPJR0RyPzWowhgaDoCz64AqKtDD73v5UjfHWwFdKSdmlr6b/WpU4WvYw6wKy?=
	=?us-ascii?Q?bsatPA5PUjPL1UJnvFkZ6otM1TRph3nCYt3UYuGDOk04EJtFWBY5EFD8jcbo?=
	=?us-ascii?Q?eXd4MHekOJkYu8gzIugK+5biKM?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB200;
	5:B8aqH1GxybmcC970E9Ggosj/Taj9wIhFk8tHVZ4L7OWRfy2yyVMV5TwC/XdBh90dZM7dxVGJC16sxPPkvrgMQEgEXVQgMBPMgy/BdyUzWiamskonoLu4s/dSWLFmFheBgIPKqn6IHoCFy8BFltmjQkSKUQNSkGgVvNrCIcOdX6s=;
	24:vZSW2z5Mt/xJW7zPFuMq2Y7bGOrt332yMwhSwai2l+ce91DhIoZXjLnlqPZzQTY3BF2x5ZaSq8Sxhv6GgRdOGPn/QgZgt3bMA1XF2i9GtKU=;
	7:Tv/7B4INWfpaUq19RBZm2121gix8bzQquvxNTy2hh3xNRLfARYMED0Rrw4s99/LIjWSjE/CfRODg/soRMG40sofFtV++cJFFoEe54Xt4MjeSsgOMfm5x4T+pDVZ+/WUSQLgu4yLmANxHd1BCSZp3t6HNSxA05I71ci3BL31BcSlBHOcGaXhAxzSIoqf4Vtj5
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2016 12:26:29.7056 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e; Ip=[192.88.158.2];
	Helo=[az84smr01.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB200
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.79
X-Mailman-Approved-At: Thu, 02 Jun 2016 10:10:02 -0400
Subject: [Qemu-arm] [PATCH 2/2] arm/virt: Mark pcie controller node as
 dma-coherent
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uI9X/hXOR7Ax

A PCI device is marked either as coherent or non-coherent based on the pcie
controller "dma-coherent" property. This is further used when configuring the
IOMMU ops for the device DMA resources (e.g. descriptor rings, for e1000e).

This dma-coherent property needs to be configured in the guest environment,
in case there's a directly assigned VFIO PCI device. Since the guest only
receives one emulated pcie controller bus - regardless of the host
configuration - add this property if there's at least one host pcie host
controller that is DMA coherent (this implies that the host interconnect
is coherent as well).

Signed-off-by: Bogdan Purcareata <bogdan.purcareata@nxp.com>
---
 hw/arm/virt.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 371e3a7..b640174 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -867,6 +867,32 @@ static void create_pcie_irq_map(const VirtBoardInfo *vbi, uint32_t gic_phandle,
                            0x7           /* PCI irq */);
 }
 
+static bool is_host_pcie_dma_coherent(void)
+{
+    void *host_fdt;
+    char **node_path;
+    bool ret = false;
+
+    host_fdt = load_device_tree_from_sysfs();
+
+    node_path = qemu_fdt_node_path_prop(host_fdt, "pcie", "dma-coherent",
+            NULL, 0, &error_fatal);
+
+    /* no pcie controllers found on host, therefore non dma-coherent */
+    if (!node_path || !node_path[0]) {
+        goto out;
+    }
+
+    /* for now, if at least one pcie node is dma-coherent,
+     * it is considered that the host is dma-coherent with respect to pcie */
+    ret = true;
+
+out:
+    g_strfreev(node_path);
+    g_free(host_fdt);
+    return ret;
+}
+
 static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
                         bool use_highmem)
 {
@@ -981,6 +1007,11 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
     }
 
     qemu_fdt_setprop_cell(vbi->fdt, nodename, "#interrupt-cells", 1);
+
+    if (is_host_pcie_dma_coherent()) {
+        qemu_fdt_setprop(vbi->fdt, nodename, "dma-coherent", NULL, 0);
+    }
+
     create_pcie_irq_map(vbi, vbi->gic_phandle, irq, nodename);
 
     g_free(nodename);
-- 
1.9.1

