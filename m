Received: by 10.25.21.156 with SMTP id 28csp90233lfv;
        Mon, 11 Jul 2016 16:22:27 -0700 (PDT)
X-Received: by 10.55.46.130 with SMTP id u124mr27476383qkh.35.1468279346954;
        Mon, 11 Jul 2016 16:22:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x142si2454934qka.115.2016.07.11.16.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 16:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36584 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMkWw-0003fi-En
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 19:22:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkVI-0001kY-Sd
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 19:20:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkVD-0006oG-Pt
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 19:20:43 -0400
Received: from mail-sn1nam02on0083.outbound.protection.outlook.com
	([104.47.36.83]:45501
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkVD-0006o3-I1; Mon, 11 Jul 2016 19:20:39 -0400
Received: from SN1NAM02FT009.eop-nam02.prod.protection.outlook.com
	(10.152.72.59) by SN1NAM02HT176.eop-nam02.prod.protection.outlook.com
	(10.152.72.72) with Microsoft SMTP Server (TLS) id 15.1.523.9;
	Mon, 11 Jul 2016 23:20:37 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT009.mail.protection.outlook.com (10.152.73.32) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.534.7
	via Frontend Transport; Mon, 11 Jul 2016 23:20:35 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:43737
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV8-0002yi-Fc; Mon, 11 Jul 2016 16:20:34 -0700
Received: from [127.0.0.1] (port=49024 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV8-00016I-Cl; Mon, 11 Jul 2016 16:20:34 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6BNDtlM020898; Mon, 11 Jul 2016 16:13:55 -0700
Received: from [172.19.74.182] (port=39660 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV7-00016F-Jz; Mon, 11 Jul 2016 16:20:33 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 11 Jul 2016 16:20:13 -0700
Message-ID: <0e07a2d1e31e51a9f9be6ecb7b3a8a5b5108c6c3.1468279072.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1468279072.git.alistair.francis@xilinx.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22444.005
X-TM-AS-Result: No--4.924-7.0-31-10
X-imss-scan-details: No--4.924-7.0-31-10
X-TMASE-MatchedRID: 0O+A46e6hRq2jsN8aguKvAPZZctd3P4B9DuzN5Up01vfc2Xd6VJ+yhjZ
	CZ/yvP7n2aE5ctzxluB7/ppjELPtsh8TzIzimOwP0C1sQRfQzEHEQdG7H66TyHEqm8QYBtMOZ41
	JYSF6md4tZc2PO8yjg7X4EB50PUpXMn85qTDA7zpoW+GRVXcvF+egcwwlavTi6u7fnCSZmgLKQQ
	4bbbQOvO+Cdsdfsv0ygr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(199003)(189002)(19580405001)(9786002)(19580395003)(5003940100001)(50466002)(48376002)(87936001)(4326007)(2950100001)(64026002)(8936002)(33646002)(86362001)(47776003)(77096005)(92566002)(5001770100001)(71366001)(305945005)(85426001)(50226002)(356003)(76176999)(81156014)(36756003)(50986999)(81166006)(8676002)(106466001)(7696003)(189998001)(586003)(118296001)(11100500001)(7846002)(105606002)(2906002)(229853001)(5003600100003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT176; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1;
	CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e213671-6737-4a6b-0882-08d3a9e1f71a
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:SN1NAM02HT176;
X-Microsoft-Antispam-PRVS: <3e97a27e7e1340ddb83ead82bacd57c6@SN1NAM02HT176.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13017025)(13018025)(13015025)(8121501046)(13023025)(5005006)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT176; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT176; 
X-Forefront-PRVS: 00003DBFE7
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2016 23:20:35.2629 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT176
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.83
Subject: [Qemu-arm] [PATCH v1 5/5] xlnx-zynqmp: Set the number of priority
 queues
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
X-TUID: s59Vhh2BL7f9

Set the ZynqMP number of priority queues to 2.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 hw/arm/xlnx-zynqmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 23c7199..0d86ba3 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -332,6 +332,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
             qemu_check_nic_model(nd, TYPE_CADENCE_GEM);
             qdev_set_nic_properties(DEVICE(&s->gem[i]), nd);
         }
+        object_property_set_int(OBJECT(&s->gem[i]), 2, "num-priority-queues",
+                                  &error_abort);
         object_property_set_bool(OBJECT(&s->gem[i]), true, "realized", &err);
         if (err) {
             error_propagate(errp, err);
-- 
2.7.4

