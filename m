Received: by 10.25.21.96 with SMTP id l93csp2120598lfi;
        Tue, 21 Jun 2016 13:04:23 -0700 (PDT)
X-Received: by 10.55.20.32 with SMTP id e32mr33112241qkh.210.1466539462014;
        Tue, 21 Jun 2016 13:04:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l143si1491062qke.164.2016.06.21.13.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 13:04:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54009 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFRuH-0007vS-Bk
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 16:04:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bFRuB-0007ts-0S
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 16:04:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bFRu5-0005O5-MP
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 16:04:14 -0400
Received: from mail-sn1nam02on0084.outbound.protection.outlook.com
	([104.47.36.84]:35840
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRu5-0005Nw-Dj; Tue, 21 Jun 2016 16:04:09 -0400
Received: from CY1NAM02FT013.eop-nam02.prod.protection.outlook.com
	(10.152.74.58) by CY1NAM02HT004.eop-nam02.prod.protection.outlook.com
	(10.152.75.71) with Microsoft SMTP Server (TLS) id 15.1.523.9;
	Tue, 21 Jun 2016 20:04:07 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; 360.cn; dkim=none (message not signed)
	header.d=none;360.cn; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT013.mail.protection.outlook.com (10.152.75.162) with
	Microsoft SMTP Server (TLS) id 15.1.523.9 via Frontend Transport;
	Tue, 21 Jun 2016 20:04:06 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:57099
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRu1-0004dF-RD; Tue, 21 Jun 2016 13:04:05 -0700
Received: from [127.0.0.1] (port=37706 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRu1-0000jv-OF; Tue, 21 Jun 2016 13:04:05 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u5LJvYhq005127; Tue, 21 Jun 2016 12:57:34 -0700
Received: from [172.19.74.182] (port=56024 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRu0-0000js-Uf; Tue, 21 Jun 2016 13:04:04 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 21 Jun 2016 13:03:53 -0700
Message-ID: <eb23f15c67989ea6a53609dc66568399dadf52a7.1466539342.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1466539342.git.alistair.francis@xilinx.com>
References: <cover.1466539342.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22404.005
X-TM-AS-Result: No--4.118-7.0-31-10
X-imss-scan-details: No--4.118-7.0-31-10
X-TMASE-MatchedRID: 9iphTy/NMyjK/aYi+nzkSeLdprnA5EQRjiWciALpTNMNht78/JfyBPRm
	0kmqtH+DCnyzgpyXj45zG+TD5qY6+Eu13DUpbG24A9lly13c/gH0O7M3lSnTW5soi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNU1dl19RiQr/jmzMDCxfK9OYnVSJmWvpDLAb3Hg+CLA6puYUHXyNI7HsxA
	LPRhSRLnk/tab5N9TP4DmmdEVWLr3NwE0XieLem1LvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMz
	ICazP4UKnrQ9LhGzFxDDKa3G4nrLQ==
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(92566002)(36756003)(5003600100003)(50466002)(7846002)(118296001)(33646002)(64026002)(6806005)(586003)(85426001)(2906002)(8936002)(356003)(50226002)(4326007)(50986999)(76176999)(7696003)(11100500001)(47776003)(2950100001)(2351001)(81156014)(229853001)(86362001)(105606002)(81166006)(106466001)(9786002)(110136002)(71366001)(48376002)(87936001)(8676002)(77096005)(19580405001)(189998001)(5003940100001)(19580395003)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT004; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1;
	CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 04f7ee86-ee9a-44b4-c75b-08d39a0f335e
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT004;
X-Microsoft-Antispam-PRVS: <c7dede1214c04fed9bd35aba9e05d9fb@CY1NAM02HT004.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13017025)(13015025)(13024025)(13023025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT004; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT004; 
X-Forefront-PRVS: 098076C36C
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2016 20:04:06.3126 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT004
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.84
Subject: [Qemu-arm] [PATCH v1 2/2] cadence_gem: Set the last bit when wrap
 is set
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
X-TUID: mOL9Jz+HbCb5

The Cadence GEM data sheet says:
"Wrap - marks last descriptor in transmit buffer descriptor list. This
can be set for any buffer within the frame."
which seems to imply that when the wrap bit is set so is the last bit.

Previously if the wrap bit is set, but the last is not then QEMU will
enter an infinite loop.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reported-by: Li Qiang <liqiang6-s@360.cn>
Reported-by: P J P <ppandit@redhat.com>
---

 hw/net/cadence_gem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index e5f3c98..8a4be1e 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -274,6 +274,11 @@ static inline unsigned tx_desc_get_last(unsigned *desc)
     return (desc[1] & DESC_1_TX_LAST) ? 1 : 0;
 }
 
+static inline void tx_desc_set_last(unsigned *desc)
+{
+    desc[1] |= DESC_1_TX_LAST;
+}
+
 static inline unsigned tx_desc_get_length(unsigned *desc)
 {
     return desc[1] & DESC_1_LENGTH;
@@ -939,6 +944,7 @@ static void gem_transmit(CadenceGEMState *s)
 
         /* read next descriptor */
         if (tx_desc_get_wrap(desc)) {
+            tx_desc_set_last(desc);
             packet_desc_addr = s->regs[GEM_TXQBASE];
         } else {
             packet_desc_addr += 8;
-- 
2.7.4

