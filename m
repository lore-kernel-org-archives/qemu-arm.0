Received: by 10.25.21.156 with SMTP id 28csp89888lfv;
        Mon, 11 Jul 2016 16:21:04 -0700 (PDT)
X-Received: by 10.55.10.147 with SMTP id 141mr27896354qkk.42.1468279264792;
        Mon, 11 Jul 2016 16:21:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 4si248055qkh.245.2016.07.11.16.21.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 16:21:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36573 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMkVc-0002c7-67
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 19:21:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkV8-000114-GT
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 19:20:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bMkV3-0006ks-65
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 19:20:33 -0400
Received: from mail-cys01nam02on0045.outbound.protection.outlook.com
	([104.47.37.45]:3900
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkV3-0006kl-0h; Mon, 11 Jul 2016 19:20:29 -0400
Received: from CY1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(10.152.74.58) by CY1NAM02HT217.eop-nam02.prod.protection.outlook.com
	(10.152.74.99) with Microsoft SMTP Server (TLS) id 15.1.523.9;
	Mon, 11 Jul 2016 23:20:26 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; linaro.org; dkim=none (message not signed)
	header.d=none; linaro.org; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT021.mail.protection.outlook.com (10.152.75.187) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.534.7
	via Frontend Transport; Mon, 11 Jul 2016 23:20:24 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:43702
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkUv-0002yT-Jn; Mon, 11 Jul 2016 16:20:21 -0700
Received: from [127.0.0.1] (port=48989 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkUv-00015V-Gc; Mon, 11 Jul 2016 16:20:21 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u6BNDg3C020871; Mon, 11 Jul 2016 16:13:42 -0700
Received: from [172.19.74.182] (port=39650 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bMkUu-00015S-P7; Mon, 11 Jul 2016 16:20:20 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Date: Mon, 11 Jul 2016 16:20:00 -0700
Message-ID: <cover.1468279072.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22444.005
X-TM-AS-Result: No--10.492-7.0-31-10
X-imss-scan-details: No--10.492-7.0-31-10
X-TMASE-MatchedRID: Z1QZA8e62gGXFGyE5q3nYBWCVBr+Ay98P5UPxV4E5mlYYjdv4zyROxEa
	gYlxo94PxBVPBDt9NWB8sUuIOYP8u//ekXjAat/IiBA/0bBQLmvomPrNi98UBGnf+v+Bv9Dldhe
	NPERaTAAefueWQFuoLkllAccZWZVHSTlIxL09Kvv1RUeLAvHT8jduVyA0C7d2myiLZetSf8mz3y
	f11ick01BIVsvVu9ABIAcCikR3vq869EdXe7TpV32yiC1hC7rh4uDoZxaDJJ2luEhcosW3A0z5N
	d/mXdOM
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(7696003)(189998001)(64026002)(4326007)(47776003)(586003)(77096005)(305945005)(36756003)(85426001)(7846002)(81156014)(50466002)(106466001)(5003940100001)(86362001)(92566002)(8936002)(8676002)(48376002)(356003)(81166006)(5003600100003)(11100500001)(5001770100001)(229853001)(9786002)(71366001)(50986999)(105606002)(87936001)(33646002)(2906002)(50226002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT217; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; A:1; MX:1;
	CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7184d237-7291-429f-f5dc-08d3a9e1f0e0
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT217;
X-Microsoft-Antispam-PRVS: <69533e3a313d476484ddf1a8abdb1726@CY1NAM02HT217.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(5005006)(13023025)(13018025)(13015025)(8121501046)(13017025)(10201501046)(3002001)(6055026);
	SRVR:CY1NAM02HT217; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT217; 
X-Forefront-PRVS: 00003DBFE7
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2016 23:20:24.8382 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT217
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.45
Subject: [Qemu-arm] [PATCH v1 0/5] Add support for Cadence GEM priority
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
X-TUID: PIc7prq1ymJZ

This patch series adds initial priority queue support to the Cadence GEM
device. This is based on original work by Peter C, that has been ported
to the latest version of QEMU.

There is more GEM work that I'd like to upstream after this, but I
figured this a good place to start. I have done limited testing on the
Xilinx machine, including running some of our GEM regressions, although
they don't cover everything. I can't really think of too many other test
cases that I can run at the moment.

Alistair Francis (5):
  cadence_gem: QOMify Cadence GEM
  cadence_gem: Arrayify
  cadence_gem: Add queue support
  cadence_gem: Correct indentation
  xlnx-zynqmp: Set the number of priority queues

 hw/arm/xlnx-zynqmp.c         |   2 +
 hw/net/cadence_gem.c         | 376 ++++++++++++++++++++++++++-----------------
 include/hw/net/cadence_gem.h |  15 +-
 3 files changed, 243 insertions(+), 150 deletions(-)

-- 
2.7.4

