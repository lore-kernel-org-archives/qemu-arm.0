Received: by 10.25.208.137 with SMTP id h131csp1801726lfg;
        Tue, 17 May 2016 06:28:05 -0700 (PDT)
X-Received: by 10.13.225.207 with SMTP id k198mr631296ywe.52.1463491685620;
        Tue, 17 May 2016 06:28:05 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b191si1035969ywa.43.2016.05.17.06.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 May 2016 06:28:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2f2b-0007tR-4N
	for alex.bennee@linaro.org; Tue, 17 May 2016 09:28:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b2f2B-0007I3-4t
	for qemu-devel@nongnu.org; Tue, 17 May 2016 09:27:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b2f25-0003oQ-3s
	for qemu-devel@nongnu.org; Tue, 17 May 2016 09:27:39 -0400
Received: from mail-sn1nam02on0081.outbound.protection.outlook.com
	([104.47.36.81]:23585
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2f24-0003oK-SM; Tue, 17 May 2016 09:27:33 -0400
Received: from SN1NAM02FT038.eop-nam02.prod.protection.outlook.com
	(10.152.72.60) by SN1NAM02HT078.eop-nam02.prod.protection.outlook.com
	(10.152.72.64) with Microsoft SMTP Server (TLS) id 15.1.492.8;
	Tue, 17 May 2016 13:12:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT038.mail.protection.outlook.com (10.152.72.69) with Microsoft
	SMTP Server (TLS) id 15.1.492.8 via Frontend Transport;
	Tue, 17 May 2016 13:12:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2eni-0001SM-Hi; Tue, 17 May 2016 06:12:42 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2eni-0001dM-VA; Tue, 17 May 2016 06:12:43 -0700
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u4HDCgl4003088; Tue, 17 May 2016 06:12:42 -0700
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2eni-0001cz-17; Tue, 17 May 2016 06:12:42 -0700
Date: Tue, 17 May 2016 15:12:41 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160517131241.GW3731@toto>
References: <1463487258-27468-1-git-send-email-peter.maydell@linaro.org>
	<1463487258-27468-2-git-send-email-peter.maydell@linaro.org>
	<20160517125058.GU3731@toto>
	<CAFEAcA_9=rS_pG1ci41qCFXCfJ7rx4Muf3zVBfVFwUJ64WOtbQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_9=rS_pG1ci41qCFXCfJ7rx4Muf3zVBfVFwUJ64WOtbQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22326.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(189002)(24454002)(199003)(9170700003)(450100001)(50466002)(4001350100001)(9686002)(86362001)(8676002)(33656002)(33716001)(63266004)(19580405001)(77096005)(9786002)(4001430100002)(83506001)(6806005)(5008740100001)(2950100001)(92566002)(47776003)(87936001)(4001450100002)(106466001)(46406003)(76176999)(50986999)(54356999)(107886002)(586003)(1076002)(2906002)(81166006)(1220700001)(23726003)(4326007)(8936002)(19580395003)(57986006)(189998001)(97756001)(93886004)(11100500001)(76506005)(110136002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT078; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; MLV:sfv; MX:1; A:1; LANG:en; 
X-MS-Office365-Filtering-Correlation-Id: 2c9d81cd-9d51-4aba-5485-08d37e54eec2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1NAM02HT078; 
X-Microsoft-Antispam-PRVS: <94ba801baf4440ec8f02d950e2898d0b@SN1NAM02HT078.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13023025)(13017025)(13015025)(8121501046)(13018025)(5005006)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT078; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT078; 
X-Forefront-PRVS: 0945B0CC72
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2016 13:12:43.5718 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT078
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.81
Subject: Re: [Qemu-devel] [PATCH 1/2] target-arm: Set IL bit in syndromes
 for insn abort, watchpoint, swstep
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qqPnhuJYhpYA

On Tue, May 17, 2016 at 02:06:28PM +0100, Peter Maydell wrote:
> On 17 May 2016 at 13:50, Edgar E. Iglesias <edgar.iglesias@xilinx.com> wrote:
> > On Tue, May 17, 2016 at 01:14:17PM +0100, Peter Maydell wrote:
> >> For some exception syndrome types, the IL bit should always be set.
> >> This includes the instruction abort, watchpoint and software step
> >> syndrome types; add the missing ARM_EL_IL bit to the syndrome
> >> values returned by syn_insn_abort(), syn_swstep() and syn_watchpoint().
> 
> > Maybe we should have a reference in a comment to the table in
> > the pseudo code for AArch64.ExceptionClass?
> > It makes it a little easier to understand some of these settings...
> 
> I just used the text parts of the ARM ARM as reference for this one,
> not the pseudocode (specifically, D7.2.27, the ESR_ELx register description,

Aha, I hadn't seen that text. I always end up in D1.10.4 where the IL
description is quite brief.


> has the definition of the IL bit and says which exceptions have IL set).
> I think for pretty much any feature in the emulation you need to
> look it up in the ARM ARM to understand what it's doing, and we
> could end up with cross-references every other line...

Yeah, fair enough.

Cheers,
Edgar
