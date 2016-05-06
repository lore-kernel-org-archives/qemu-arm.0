Received: by 10.25.208.137 with SMTP id h131csp420809lfg;
        Fri, 6 May 2016 11:20:32 -0700 (PDT)
X-Received: by 10.195.11.34 with SMTP id ef2mr21078383wjd.101.1462558832911;
        Fri, 06 May 2016 11:20:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7si12205025wmz.39.2016.05.06.11.20.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 May 2016 11:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aykMJ-0000rM-Cs
	for alex.bennee@linaro.org; Fri, 06 May 2016 14:20:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aykGx-0008EB-9k
	for qemu-devel@nongnu.org; Fri, 06 May 2016 14:14:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aykGl-0004om-Lz
	for qemu-devel@nongnu.org; Fri, 06 May 2016 14:14:37 -0400
Received: from mail-cys01nam02on0057.outbound.protection.outlook.com
	([104.47.37.57]:54880
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aykGl-0004mo-F6
	for qemu-devel@nongnu.org; Fri, 06 May 2016 14:14:31 -0400
Received: from BL2NAM02FT049.eop-nam02.prod.protection.outlook.com
	(10.152.76.60) by BL2NAM02HT149.eop-nam02.prod.protection.outlook.com
	(10.152.77.241) with Microsoft SMTP Server (TLS) id 15.1.485.4;
	Fri, 6 May 2016 18:14:20 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	BL2NAM02FT049.mail.protection.outlook.com (10.152.77.118) with
	Microsoft SMTP Server (TLS) id 15.1.485.4 via Frontend Transport;
	Fri, 6 May 2016 18:14:20 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:58456
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aykGZ-0002Gm-HI; Fri, 06 May 2016 11:14:19 -0700
Received: from [127.0.0.1] (port=39063 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aykGZ-0001YN-Ds; Fri, 06 May 2016 11:14:19 -0700
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u46I8673012891; Fri, 6 May 2016 11:08:06 -0700
Received: from [172.19.74.182] (port=48400 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aykGY-0001YK-Il; Fri, 06 May 2016 11:14:18 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>
Date: Fri, 6 May 2016 11:10:57 -0700
Message-ID: <cover.1462557987.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.5.0
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22304.005
X-TM-AS-Result: No--0.219-7.0-31-10
X-imss-scan-details: No--0.219-7.0-31-10
X-TMASE-MatchedRID: Ibqrew7XLXqE9zgVMk3pXoSvKOGqLLPKPgfiGiot4kkXXtcgAztb1Hi6
	6C6O7Zxsa888eHP8TjwA/1OfGloJ/w9FV6kNYiPHh2VzUlo4HVM3blcgNAu3dpsoi2XrUn/Js98
	n9dYnJNNQSFbL1bvQAXnN0DN7HnFmitLUOk5EjEI74408SCSlmlK2KhvzeFKFWH6anxNomVhIDy
	EaLBuivIgeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(189998001)(71366001)(5003600100002)(85426001)(50466002)(50986999)(9786002)(33646002)(5003940100001)(81166005)(2906002)(6806005)(64026002)(4326007)(5001770100001)(5008740100001)(2201001)(1220700001)(11100500001)(36756003)(48376002)(77096005)(86362001)(87936001)(47776003)(92566002)(586003)(8936002)(229853001)(105606002)(50226002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT149; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; MLV:sfv; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6170c368-c577-464c-d5fd-08d375da3eba
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BL2NAM02HT149;
X-Microsoft-Antispam-PRVS: <9413ddfeb51e49a5b81bab6b0835d804@BL2NAM02HT149.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13018025)(13024025)(13017025)(13015025)(13023025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:BL2NAM02HT149; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT149; 
X-Forefront-PRVS: 09347618C4
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2016 18:14:20.3249 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT149
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.57
Subject: [Qemu-devel] [PATCH v1 0/2]  target-arm: Add support for HSTR_EL2
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
Cc: edgar.iglesias@xilinx.com, edgar.iglesias@gmail.com,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8mhBST+jgvEL

Now that EL3 is enabled by default for the A53s and A57s I see this
error when booting Linux on the ZynqMP board:
"Synchronous Abort" handler, esr 0x02000000

By adding the HSTR_EL2 register (and EL2 support) the Linux boot
progresses much further.

Alistair Francis (2):
  target-arm: Add the HSTR_EL2 register
  target-arm: Enable EL2 for the A53s and A57s

 target-arm/cpu64.c  | 2 ++
 target-arm/helper.c | 7 +++++++
 2 files changed, 9 insertions(+)

-- 
2.5.0

