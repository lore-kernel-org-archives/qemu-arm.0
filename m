Received: by 10.25.21.96 with SMTP id l93csp2120556lfi;
        Tue, 21 Jun 2016 13:04:17 -0700 (PDT)
X-Received: by 10.55.25.155 with SMTP id 27mr33495939qkz.61.1466539457334;
        Tue, 21 Jun 2016 13:04:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si1512604qkw.88.2016.06.21.13.04.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 13:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54007 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFRuC-0007tr-Ky
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 16:04:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bFRu8-0007oe-1e
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 16:04:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1bFRu1-0005NO-V5
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 16:04:10 -0400
Received: from mail-cys01nam02on0041.outbound.protection.outlook.com
	([104.47.37.41]:60358
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRu1-0005NF-PT; Tue, 21 Jun 2016 16:04:05 -0400
Received: from CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
	(10.152.74.58) by CY1NAM02HT183.eop-nam02.prod.protection.outlook.com
	(10.152.74.139) with Microsoft SMTP Server (TLS) id 15.1.523.9;
	Tue, 21 Jun 2016 20:04:02 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; 360.cn; dkim=none (message not signed)
	header.d=none;360.cn; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	CY1NAM02FT033.mail.protection.outlook.com (10.152.75.179) with
	Microsoft SMTP Server (TLS) id 15.1.523.9 via Frontend Transport;
	Tue, 21 Jun 2016 20:04:01 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:57084
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRtw-0004d4-Rz; Tue, 21 Jun 2016 13:04:00 -0700
Received: from [127.0.0.1] (port=37691 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRtw-0000jX-OF; Tue, 21 Jun 2016 13:04:00 -0700
Received: from xsj-tvapsmtp02 (smtptest.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u5LJvTeD005119; Tue, 21 Jun 2016 12:57:29 -0700
Received: from [172.19.74.182] (port=56020 helo=xsjalistai50.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1bFRtv-0000jU-VK; Tue, 21 Jun 2016 13:04:00 -0700
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 21 Jun 2016 13:03:48 -0700
Message-ID: <cover.1466539342.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22404.005
X-TM-AS-Result: No--0.471-7.0-31-10
X-imss-scan-details: No--0.471-7.0-31-10
X-TMASE-MatchedRID: CrMxdxCndKlMXCgpVX01PcWPKvU7MHJYKx5ICGp/WtEbmkjxvrJB4aPF
	jJEFr+olq+TyQ7O4buz9VAfQOqUygt0H8LFZNFG7hqz53n/yPno9svppi4ny+uKQ0JbnBH9gvNI
	ZLiVFMv5P4KXZPlWn+VLvHqPi046FU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYtaVdyxm8=
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(2906002)(8936002)(71366001)(106466001)(9786002)(50986999)(4326007)(586003)(189998001)(110136002)(105606002)(356003)(64026002)(558084003)(86362001)(50226002)(2351001)(85426001)(6806005)(87936001)(33646002)(229853001)(36756003)(47776003)(11100500001)(50466002)(81166006)(5003940100001)(48376002)(77096005)(92566002)(5003600100003)(8676002)(81156014)(7696003)(7846002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1NAM02HT183; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1;
	CAT:NONE; LANG:en; CAT:NONE; 
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2ed79030-7ca4-47e4-20a4-08d39a0f3057
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:CY1NAM02HT183;
X-Microsoft-Antispam-PRVS: <312575b752e248948f62f75b76d04e42@CY1NAM02HT183.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13015025)(13017025)(13023025)(13018025)(13024025)(8121501046)(5005006)(3002001)(10201501046)(6055026);
	SRVR:CY1NAM02HT183; BCL:0; PCL:0; RULEID:; SRVR:CY1NAM02HT183; 
X-Forefront-PRVS: 098076C36C
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2016 20:04:01.2450 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1NAM02HT183
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.41
Subject: [Qemu-arm] [PATCH v1 0/2]  Cadence GEM bug fixes
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
X-TUID: BFSBRIj8Dlk5



Alistair Francis (2):
  cadence_gem: Avoid infinite loops with a misconfigured buffer
  cadence_gem: Set the last bit when wrap is set

 hw/net/cadence_gem.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
2.7.4

