Received: by 10.25.21.96 with SMTP id l93csp2120587lfi;
        Tue, 21 Jun 2016 13:04:21 -0700 (PDT)
X-Received: by 10.55.221.138 with SMTP id u10mr31732554qku.59.1466539461601;
        Tue, 21 Jun 2016 13:04:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si1512906qkw.88.2016.06.21.13.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 13:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54011 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFRuG-0007xB-RN
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 16:04:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bFRu9-0007rW-MD
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 16:04:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bFRu3-0005Nh-IZ
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 16:04:12 -0400
Received: from mail-cys01nam02on0049.outbound.protection.outlook.com
	([104.47.37.49]:61360
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRu3-0005Nc-8q; Tue, 21 Jun 2016 16:04:07 -0400
Received: from BL2NAM02FT042.eop-nam02.prod.protection.outlook.com
	(10.152.76.51) by BL2NAM02HT186.eop-nam02.prod.protection.outlook.com
	(10.152.76.244) with Microsoft SMTP Server (TLS) id 15.1.517.7;
	Tue, 21 Jun 2016 20:04:04 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; 360.cn; dkim=none (message not signed)
	header.d=none;360.cn; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	BL2NAM02FT042.mail.protection.outlook.com (10.152.76.193) with
	Microsoft SMTP Server (TLS) id 15.1.523.9 via Frontend Transport;
	Tue, 21 Jun 2016 20:04:03 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:57092
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRtz-0004dC-Bn; Tue, 21 Jun 2016 13:04:03 -0700
Received: from [127.0.0.1] (port=37700 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRtz-0000jo-8V; Tue, 21 Jun 2016 13:04:03 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u5LJvWHM005123; Tue, 21 Jun 2016 12:57:32 -0700
Received: from [172.19.74.182] (port=56022 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRty-0000jk-Ez; Tue, 21 Jun 2016 13:04:02 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 21 Jun 2016 13:03:50 -0700
Message-ID: <84bb1c391b833275da3f573d4972920cea34c188.1466539342.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1466539342.git.alistair.francis@xilinx.com>
References: <cover.1466539342.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22404.005
X-TM-AS-Result: No-0.458-7.0-31-10
X-imss-scan-details: No-0.458-7.0-31-10
X-TMASE-MatchedRID: zs/B+fsn51OxURPfQYc8OOKLvlSV0+r2/8CuA+b/YYSCsBeCv8CM/ZyZ
	alSnLCVIGmYwXo3KOtcPIrP5pxoKxYD90fgFpkgrv1vPAPz22FlflOpBqBHTt/lunrRp4sec+Vi
	hXqn9xLGfhPf52nZsXqUCtVxRLNS4PRPlAEQGtsWQTsyupo9izUm+FQxW/ZhgmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1GhJp3Lk3TlTxv/gOP7vwTV/IQZdCeis+kTrNepbrp56o73I9zVu9ogWfP
	Eitj7T0tW5upbQ1wFmzp/QBl4Mi8s7ftvtF5mZLYltngPZ0gyBTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hQeOEhlNe5ED+90JQgW5qyr
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(87936001)(36756003)(19580395003)(33646002)(229853001)(5003940100001)(92566002)(19580405001)(50466002)(48376002)(64026002)(118296001)(86362001)(85426001)(47776003)(2351001)(110136002)(105606002)(189998001)(106466001)(71366001)(50986999)(4326007)(9786002)(77096005)(586003)(2906002)(8936002)(7846002)(11100500001)(50226002)(356003)(81166006)(76176999)(2950100001)(81156014)(8676002)(6806005)(5003600100003)(7696003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT186; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1;
	CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7fd70fdf-b617-49a2-6e68-08d39a0f31e9
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2NAM02HT186;
X-Microsoft-Antispam-PRVS: <c44a383ab0194c62b02bb7c51193ec57@BL2NAM02HT186.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13023025)(13017025)(13024025)(13015025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:BL2NAM02HT186; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT186; 
X-Forefront-PRVS: 098076C36C
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2016 20:04:03.9909 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT186
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.49
Subject: [Qemu-arm] [PATCH v1 1/2] cadence_gem: Avoid infinite loops with a
 misconfigured buffer
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
Cc: ppandit@redhat.com, qemu-arm@nongnu.org, liqiang6-s@360.cn,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /oRPcesugDWV

A guest can write zero to the DMACFG resulting in an infinite loop when
it reaches the while(bytes_to_copy) loop.

To avoid this issue enforce a minimum size for the RX buffer. Hardware
does not have this enforcement and relies on the guest to set a non-zero
value.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reported-by: Li Qiang <liqiang6-s@360.cn>
Reported-by: P J P <ppandit@redhat.com>
---

 hw/net/cadence_gem.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 0346f3e..e5f3c98 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -664,6 +664,13 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
                  GEM_DMACFG_RBUFSZ_S) * GEM_DMACFG_RBUFSZ_MUL;
     bytes_to_copy = size;
 
+    /* Hardware allows a zero value here but warns against it. To avoid QEMU
+     * indefinite loops we enforce a minimum value here
+     */
+    if (rxbufsize < GEM_DMACFG_RBUFSZ_MUL) {
+        rxbufsize = GEM_DMACFG_RBUFSZ_MUL;
+    }
+
     /* Pad to minimum length. Assume FCS field is stripped, logic
      * below will increment it to the real minimum of 64 when
      * not FCS stripping
-- 
2.7.4

