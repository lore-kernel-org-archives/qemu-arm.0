Received: by 10.25.208.211 with SMTP id h202csp402382lfg;
        Thu, 7 Apr 2016 02:58:56 -0700 (PDT)
X-Received: by 10.140.86.101 with SMTP id o92mr2312731qgd.49.1460023136547;
        Thu, 07 Apr 2016 02:58:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s10si5280321qks.93.2016.04.07.02.58.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 02:58:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao6iE-0004bq-F3
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 05:58:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1ao6iC-0004b3-LK
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 05:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>) id 1ao6i9-0000mc-F7
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 05:58:52 -0400
Received: from mail-by2on0091.outbound.protection.outlook.com
	([207.46.100.91]:16640
	helo=na01-by2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@caviumnetworks.com>)
	id 1ao6i9-0000mQ-2i; Thu, 07 Apr 2016 05:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-caviumnetworks-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Z6MIBcDhPz0//A2WNfs14SerXvVGiehKWR/QZe1qnNs=;
	b=Tpr+X9GOBA0A4Th6R79vwaNzQYbfTTIDPQtwn+4xw7eH2fzHq45rpAZ9N1u3PsCh9nmZ85E0sTKDNyWDfmXMBU4DMS8jg+vc/GU+9aSpqEIegPfc3FrsznrYA73ALUkxgOs0Uvxqv+PXxlpcuNNfxJOlgf0pD2WN9+ucD6CQ3B4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=none action=none
	header.from=caviumnetworks.com;
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	BN3PR0701MB1686.namprd07.prod.outlook.com (10.163.39.152) with
	Microsoft SMTP
	Server (TLS) id 15.1.447.15; Thu, 7 Apr 2016 09:58:42 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>
Date: Thu, 7 Apr 2016 15:28:04 +0530
Message-ID: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: MAXPR01CA0036.INDPRD01.PROD.OUTLOOK.COM (10.164.146.136) To
	BN3PR0701MB1686.namprd07.prod.outlook.com (10.163.39.152)
X-MS-Office365-Filtering-Correlation-Id: dff476c3-808b-4528-bbcc-08d35ecb351d
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	2:HhaEmSgsk2lAR1UeBmwF53xYAddin1pv8xUGBJ5o6xaTMJRW4rNnP9hRKZms4Z4cvb0v5MoBrPqfbEXNLuU7RlQanUnof0gnKGJGPhC1NHgUiO8AMLD8eWrDzwpO0n/ad2LS/DgJ7f6zVuhvPoLS0HMbGtudClhDHUXV33l8YNSepYrDIXofYXqXbpCE2TZK;
	3:pdC8Lwhff4SvHZdXr5LqQytU4L5IuyfycbvzZk1A+maQrUDP9Qqi0f47DYBYt59KT14fUGXgi2+ttNgnjIYDa3Uw/TFN1qll/9y3+i10L1zvdMm56O7N+eKtBhkf3dU4
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN3PR0701MB1686;
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	25:oKdju4kLKzYdePcBDDfTejcKNpxXh0ySB6Rjf4lKWtENPiTNwE2HiFftGzaDkQxid1c7laEVBQKYjU7hC6v0/1Jja/jt6iXtDxBkKwqmPDqXjSxnQK9AxzpH5ek0bHrlZGWy20c+rd11r79txWjow74MVGih1rdrSvNytmc1SMGAuZztPJBFO2ZbY4KfxE94RWUfDn2wd8zYvQath177WL+d5Wobi+eZ4YfpOEaWqXSyEEyukcZvJYXfPfl7lXy8Y6Xn3ixMRoRDHiCcB7pCKPwXMzGU+NfSF8n0w1NWr2Q1DLSedcf+r9cJzczaBp6UBNdXdsBLgS7OIYsJonC6+PJDdA3AoTNvlguBjDufXvwvXn8YNQBAbjDSS9IZkWILUmzIx/uGrkuYsYKZ5TjvyoU7cyz5/dfY82w4wHMOIzFSbten3nk5iFjRFeyU6THrORnwnUOo+suFxOWUQ2iCOXqJSHb41s5NLFLlBiwrPe83YH1MQ45pg3lZAbLHZRPD9zw/sKEgDK6b1m6FxzWwSAeSSyqlTQ2gjlRyymL0/fJ01K/TXVwv14UGZLQdvFBy+aAKaZqI2pg/y2QOFcr6lrWmavRPzwARtFu/mXv7B/3NJCckX+D5sKYhoIwxw5313NMGTXvn9vrplex5Erp4oHqBJO7lW5NUCIIs5TiPtDPEdXjyz9RT/4LFsD9O+tzFVb1SoV2KO8eBCi8KHQU6Iw==
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	20:PeM+KyYSVcCbHUGEvHFr+Fg1CeJBupbj8pEtrB5TOe0CvirH9mdmv9gpy7w1thcAvbZVHwsdBc4A3gDD4Gas6+9wJ3mL1ardg0uv9lOyPmg71EqnVTjBzvMDmOiicg59vMNhotU75Fwt6QvSsChL2V6wyZO+dRX+5y8Ie1ufMVRZ/Eo5wICccnSlOSDnPwCWr/f+zsu6GUT+kjKrI/6U000+2SeM37A7BU4FJJ5jTvOwogLz71ZJEy31w1oAlBcFHka42/R7HFIxbeRGNmrX1PZyvEki6rV3OjKFfpgsc5awLlivSyJ4xDeHHJcupADH32NtN/09uCnSjieYEIBumB6gNATZOBd6n/FbQ5Jr6N6CbSTYP+hQ2IiU2EuHn8Uowuq4HlGeulrxB/wqD9inxK9I75kWgQL69IkE6MPOHD5GzGz6uVHbLO2oUl7P8fP7gOeiuNIRNsok2+NX5JVANIM5mT4ZCVy5uC0o11VQCZYkJ+nTMz6vO5nO15m4+nO9erLRL+dwqF7b+UspiEyR7eXOwGZ8XgECxZiXWEtVxJfB+ZcojQbhQyhSB0m4G+x3t7VzUBmHMCcjakISaOouM/CxZr3tR0WuHzRflFVwm3o=
X-Microsoft-Antispam-PRVS: <BN3PR0701MB1686DB41BCB64DC72EDB6D77FF900@BN3PR0701MB1686.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046);
	SRVR:BN3PR0701MB1686; BCL:0; PCL:0; RULEID:;
	SRVR:BN3PR0701MB1686; 
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	4:P+W6CffUlIU2u5GAzboYnHBO4/A9L2I/3lD9+thIWW+1rE2NXIW+++G/Uk4Hy1fhOtwy4ESfxDWFR1PH7XpFuAnLXoeAfnlUfMKgKgKAHyzgvjNItP3BUg1dqJDuAC/9hNuP6oigPVnhT9gAkyIToIJSMP9ZIkKUCSp9Qw3sRSUfMASbZTK6Ul+gKnCjHPhT/R/FNyE1VQNsKsvq3GM3OAjpZn8zn+tU5OHdwGrM5p1+zAVIFk1ccuK/OJ5ROWkiSyhp8T1dVMuTjWRtfebhMJWfD4ZPHLqt/DOzHbDo4p41yb4lzotVRj4SmsG8/kvS3hSbEM4JFN4TJdfFRxvI0N1+sY+OtwAMVmrPAuAwa8w8/U4qztL7RasyanY+T1Y7
X-Forefront-PRVS: 0905A6B2C7
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(4001430100002)(53416004)(5009440100003)(5001770100001)(36756003)(2876002)(50986999)(1096002)(189998001)(3846002)(81166005)(5008740100001)(66066001)(6116002)(586003)(47776003)(42186005)(50226001)(48376002)(77096005)(5003940100001)(19580395003)(86152002)(2201001)(19580405001)(33646002)(2906002)(107886002)(15975445007)(50466002)(92566002)(229853001)(4326007)(7099028)(217873001)(4720700001)(2101003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN3PR0701MB1686;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN3PR0701MB1686;
	23:GGtFEkhUwvwpH8+M6LAlgWAlzR/klREQoIhEYOT?=
	=?us-ascii?Q?i3I0aLdUp0pOGEagbDlcjp2hjvA4diSJNwa76zWEMeuzc/SOKhdwoUvK7rDi?=
	=?us-ascii?Q?XVCCLgwORqY5YfWquYXxaO3QPLDBAgEg46xY7c1myziMF6Jm1tMijUxCR3Ur?=
	=?us-ascii?Q?uB+4f4l0z5Itw4XNwGfsKZpbqcxyZsW88MiRi4Dlg/s7B5nLO5b8P9wt4p7Z?=
	=?us-ascii?Q?j+z98VmIwW9V+Kp/PkjOPEuvnP7GikVhaXCkPWxlZLxYsnKwpjhgZBiQnA1u?=
	=?us-ascii?Q?GelAhaa38eMmtHPae+seC8HeaEeNoB1DHZjAvtqd5+FM7i58VLPTLw6l3aTq?=
	=?us-ascii?Q?7KQGEB2pDjYImR5nA7V4thvQgtnnKcyrBqqx+Pfy2BI5Mv/DfER6bujBH4G7?=
	=?us-ascii?Q?PAr/W1N1c4fY/RC+IYWIR9IQMc9ymbbwjoYouc4VCgg+ZowylhUbJ6Bbrw2r?=
	=?us-ascii?Q?4tNWQds3o/XtomECcnX+SYt2rQMZvBECHepPieflkK+F5cQfQ8eQFCnzbky5?=
	=?us-ascii?Q?uiAa+qGI7kZIjE2Aw4sVHibIZZAhSvnz+6QGgvfC8BNkDyJmH5CP0sCtisye?=
	=?us-ascii?Q?Q57c6BtDmbq2PwIL+mGfYgjPhaFTy1f1qzf62bL/4Rp2/rZqBAXHEUzJXqGS?=
	=?us-ascii?Q?a6/aN+QRIlIHZVB/cuoFTGCaeE9a2B2z4rQmN7PnemQRBZ719ofpLLtafC4w?=
	=?us-ascii?Q?BUTvcJnaK9Nz03BuendywtOO3RCfdJuB2F65Xk3qcxFJPi46Xa6jTQ8281u7?=
	=?us-ascii?Q?uW55+H2Zyzkg4Tgo5rjLc05quEpus+5TCigH6DySq4GkPKHcmPrMDCo7pFkI?=
	=?us-ascii?Q?XMPpdOzRT8bz9kPc3WL3LLbZ3DSQXygSs5JV/JhUKrHnFxOgyBLHpbjllu11?=
	=?us-ascii?Q?S6IM0/mXjeg/bouBGEFikhFdF7AnmgRJmkMQhgrp9yyYILvadSVIbgBry9d6?=
	=?us-ascii?Q?VaITFdoi52kPBGWACf9WWtUfsLNhegRg4WZcUf9KFlI+KHXZ2DWXy0i9u03U?=
	=?us-ascii?Q?1toi/FXShY8jIfxt0PFPlASdmdLVdf1FlBNUj+3rId44U+J1aAFLk3HxvDm5?=
	=?us-ascii?Q?+5D+r8KI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN3PR0701MB1686;
	5:lrjyGoEuiUrWMF0DCT5TeQwOolkrdd2O4/9p1SdXB56zw1/Xll9O+ogANgHEazgm7YpLLcTh6olKElTyts82GR+PR+K3cQjL7v6e3VEUuBS04NKLdD9sqOq2w8ltEQc71hEpeYrm+fZzXiWZAOhCJA==;
	24:nekGHiGnhxmt1b4LLKFpihnikR4XCIXki85fB9JihUaZAQjg94NecbrAQWwUK4vyMmb/b1igErYD9leOdwuIHS8d2OGx4/gf3+frsYuZKSs=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2016 09:58:42.3134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0701MB1686
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.100.91
Cc: Prasun.Kapoor@caviumnetworks.com, knv.suresh2009@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Subject: [Qemu-arm] [RFC PATCH v2 0/3] ARM64: Live migration optimization
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l2ou2yvTCKPp

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

To optimize Live migration time on ARM64 machine following
changes are made.
 - Neon instructions are used for Zero page checking.
 - Added prefetch for Thunderx platform

With these changes, total migration time comes down
from 10 seconds to 2.5 seconds.

These patches are tested on top of (GICv3 live migration support)
https://lists.gnu.org/archive/html/qemu-devel/2015-10/msg05284.html
However there is no direct dependency on these patches.

v1 -> v2 changes:
----------------
  - Dropped 'target-arm: Update page size for aarch64' patch.
  - Each loop in zero buffer check function is reduced to
    16 from 32.
  - Replaced vorrq_u64 with '|' in Neon macros
  - Renamed local variable to reflect 128 bit.
  - Introduced new file cpuinfo.c to parse /proc/cpuinfo
  - Added Thunderx specific patches to add prefetch in
    zero buffer check function.

Vijay (1):
  target-arm: Use Neon for zero checking

Vijaya Kumar K (2):
  utils: Add cpuinfo helper to fetch /proc/cpuinfo
  utils: Add prefetch for Thunderx platform

 include/qemu-common.h |   12 ++++++
 util/Makefile.objs    |    1 +
 util/cpuinfo.c        |  115 +++++++++++++++++++++++++++++++++++++++++++++++++
 util/cutils.c         |   87 +++++++++++++++++++++++++++++++++++++
 4 files changed, 215 insertions(+)
 create mode 100644 util/cpuinfo.c

-- 
1.7.9.5

