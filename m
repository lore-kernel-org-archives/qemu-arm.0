Received: by 10.25.21.156 with SMTP id 28csp90207lfv;
        Mon, 11 Jul 2016 16:22:19 -0700 (PDT)
X-Received: by 10.55.97.18 with SMTP id v18mr27813755qkb.102.1468279339812;
        Mon, 11 Jul 2016 16:22:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m189si2362791qkc.169.2016.07.11.16.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 16:22:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36581 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMkWp-0003Yo-6z
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 19:22:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkV8-00011S-RW
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 19:20:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkV3-0006l1-LY
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 19:20:33 -0400
Received: from mail-cys01nam02on0085.outbound.protection.outlook.com
	([104.47.37.85]:58796
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV3-0006ko-D7; Mon, 11 Jul 2016 19:20:29 -0400
Received: from SN1NAM02FT013.eop-nam02.prod.protection.outlook.com
	(10.152.72.56) by SN1NAM02HT029.eop-nam02.prod.protection.outlook.com
	(10.152.73.104) with Microsoft SMTP Server (TLS) id 15.1.523.9;
	Mon, 11 Jul 2016 23:20:27 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT013.mail.protection.outlook.com (10.152.72.98) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.534.7
	via Frontend Transport; Mon, 11 Jul 2016 23:20:25 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:43709
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkUy-0002yW-9f; Mon, 11 Jul 2016 16:20:24 -0700
Received: from [127.0.0.1] (port=48996 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkUy-00015f-6c; Mon, 11 Jul 2016 16:20:24 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6BNDjnw020877; Mon, 11 Jul 2016 16:13:45 -0700
Received: from [172.19.74.182] (port=39652 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkUx-00015c-F0; Mon, 11 Jul 2016 16:20:23 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 11 Jul 2016 16:20:03 -0700
Message-ID: <c60215f02b1383e81daa7ac9264decf8abcc69cb.1468279072.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468279072.git.alistair.francis@xilinx.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22444.005
X-TM-AS-Result: No--5.818-7.0-31-10
X-imss-scan-details: No--5.818-7.0-31-10
X-TMASE-MatchedRID: eM0YmPWGC84pKLOC9nYDvgPZZctd3P4B7f6JAS2hKPgS+jFO7d+PW9Iv
	zYZ0hRlpktefzIgwKug68nP4dnWCEdUMAwTDOBnsNNHZMWDTEbdo3Yq5PCwLAjedlpL1W1muo8W
	MkQWv6iXBcIE78YqRWo6HM5rqDwqtyWk/+Szz516eGQyI+J4JiRBxgXmEY+KqUquqyo9Cd5p/N/
	8t3VXX5g==
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(7846002)(50226002)(7696003)(356003)(50986999)(76176999)(5003940100001)(4326007)(48376002)(11100500001)(71366001)(305945005)(5001770100001)(2950100001)(9786002)(47776003)(2906002)(586003)(64026002)(87936001)(50466002)(19580405001)(86362001)(33646002)(92566002)(106466001)(189998001)(36756003)(118296001)(229853001)(81156014)(105606002)(5003600100003)(77096005)(85426001)(8936002)(19580395003)(8676002)(81166006)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT029; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1;
	CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ad84108f-695e-4b49-b554-08d3a9e1f115
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT029;
X-Microsoft-Antispam-PRVS: <bf05e16aa55444749e7448d3f8411bcd@SN1NAM02HT029.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(8121501046)(5005006)(13023025)(13015025)(13024025)(13017025)(3002001)(10201501046)(6055026);
	SRVR:SN1NAM02HT029; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT029; 
X-Forefront-PRVS: 00003DBFE7
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2016 23:20:25.1669 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT029
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.85
Subject: [Qemu-arm] [PATCH v1 1/5] cadence_gem: QOMify Cadence GEM
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
X-TUID: hjEfEmV03jDh

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/net/cadence_gem.c | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 8a4be1e..9d64644 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1214,24 +1214,29 @@ static NetClientInfo net_gem_info = {
     .link_status_changed = gem_set_link,
 };
 
-static int gem_init(SysBusDevice *sbd)
+static void gem_realize(DeviceState *dev, Error **errp)
 {
-    DeviceState *dev = DEVICE(sbd);
     CadenceGEMState *s = CADENCE_GEM(dev);
 
-    DB_PRINT("\n");
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
 
-    gem_init_register_masks(s);
-    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
-                          "enet", sizeof(s->regs));
-    sysbus_init_mmio(sbd, &s->iomem);
-    sysbus_init_irq(sbd, &s->irq);
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
 
     s->nic = qemu_new_nic(&net_gem_info, &s->conf,
             object_get_typename(OBJECT(dev)), dev->id, s);
+}
+
+static void gem_init(Object *obj)
+{
+    CadenceGEMState *s = CADENCE_GEM(obj);
+    DeviceState *dev = DEVICE(obj);
+
+    DB_PRINT("\n");
 
-    return 0;
+    gem_init_register_masks(s);
+    memory_region_init_io(&s->iomem, OBJECT(s), &gem_ops, s,
+                          "enet", sizeof(s->regs));
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &s->iomem);
 }
 
 static const VMStateDescription vmstate_cadence_gem = {
@@ -1257,9 +1262,8 @@ static Property gem_properties[] = {
 static void gem_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SysBusDeviceClass *sdc = SYS_BUS_DEVICE_CLASS(klass);
 
-    sdc->init = gem_init;
+    dc->realize = gem_realize;
     dc->props = gem_properties;
     dc->vmsd = &vmstate_cadence_gem;
     dc->reset = gem_reset;
@@ -1269,6 +1273,7 @@ static const TypeInfo gem_info = {
     .name  = TYPE_CADENCE_GEM,
     .parent = TYPE_SYS_BUS_DEVICE,
     .instance_size  = sizeof(CadenceGEMState),
+    .instance_init = gem_init,
     .class_init = gem_class_init,
 };
 
-- 
2.7.4

