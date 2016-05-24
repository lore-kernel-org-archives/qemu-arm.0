Received: by 10.25.30.65 with SMTP id e62csp842865lfe;
        Tue, 24 May 2016 10:08:18 -0700 (PDT)
X-Received: by 10.55.31.65 with SMTP id f62mr4511890qkf.36.1464109697966;
        Tue, 24 May 2016 10:08:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12si3398938qtw.33.2016.05.24.10.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 10:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54424 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5FoX-0005p4-9h
	for alex.bennee@linaro.org; Tue, 24 May 2016 13:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b5FoU-0005ow-6C
	for qemu-arm@nongnu.org; Tue, 24 May 2016 13:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b5FoQ-0005GU-Bc
	for qemu-arm@nongnu.org; Tue, 24 May 2016 13:08:13 -0400
Received: from mail-sn1nam02on0040.outbound.protection.outlook.com
	([104.47.36.40]:22959
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b5FoQ-0005G9-5f; Tue, 24 May 2016 13:08:10 -0400
Received: from SN1NAM02FT001.eop-nam02.prod.protection.outlook.com
	(10.152.72.54) by SN1NAM02HT044.eop-nam02.prod.protection.outlook.com
	(10.152.72.107) with Microsoft SMTP Server (TLS) id 15.1.497.8;
	Tue, 24 May 2016 16:52:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT001.mail.protection.outlook.com (10.152.72.158) with
	Microsoft SMTP Server (TLS) id 15.1.497.8 via Frontend Transport;
	Tue, 24 May 2016 16:52:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b5FZD-0000Ip-GI; Tue, 24 May 2016 09:52:27 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b5FZE-0008IW-8b; Tue, 24 May 2016 09:52:28 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u4OGqIs8026262; Tue, 24 May 2016 09:52:18 -0700
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b5FZ3-0008Fk-Nt; Tue, 24 May 2016 09:52:18 -0700
Date: Tue, 24 May 2016 18:52:17 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160524165216.GQ3731@toto>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
	<1463698459-31312-4-git-send-email-edgar.iglesias@gmail.com>
	<CAFEAcA9+ow6BAhqk5hUeoR50gUhX0TJy75r1ViUZJ-vEbLawJw@mail.gmail.com>
	<20160524163204.GV16305@toto>
	<CAFEAcA8dKJbZ6-uC4_MQEWPpL_-NAgwft36aLiou2hMGCN3zRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8dKJbZ6-uC4_MQEWPpL_-NAgwft36aLiou2hMGCN3zRA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22342.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(199003)(189002)(24454002)(9170700003)(11100500001)(110136002)(83506001)(87936001)(77096005)(47776003)(189998001)(2950100001)(19580395003)(50466002)(46406003)(19580405001)(5008740100001)(6806005)(50986999)(54356999)(76176999)(8676002)(93886004)(81166006)(76506005)(8936002)(106466001)(63266004)(57986006)(86362001)(9786002)(9686002)(92566002)(4326007)(4001350100001)(23726003)(2906002)(586003)(1220700001)(1076002)(36386004)(33656002)(97756001)(33716001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT044; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en; 
X-MS-Office365-Filtering-Correlation-Id: 62a7d92f-de73-40b0-165e-08d383f3caf2
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1NAM02HT044; 
X-Microsoft-Antispam-PRVS: <a21f144d582149d1b0c28ee9c1805053@SN1NAM02HT044.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(13023025)(13017025)(13015025)(13018025)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:SN1NAM02HT044; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT044; 
X-Forefront-PRVS: 09525C61DB
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2016 16:52:29.2495 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT044
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.40
Subject: Re: [Qemu-arm] [PATCH v1 3/5] xlnx-zynqmp: Make the RPU subsystem
 optional
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4iVgvI7+Yg49

On Tue, May 24, 2016 at 05:37:14PM +0100, Peter Maydell wrote:
> On 24 May 2016 at 17:32, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > On Tue, May 24, 2016 at 05:26:54PM +0100, Peter Maydell wrote:
> >> Do we have to create them in the set function so we can
> >> set properties before realize, or could this be deferred
> >> to realize time?
> >
> > Yes, I thought it was recommended to avoid object creation
> > in realize. But creating the PRU in realize works too.
> 
> Well, it is recommended, but only in the sense of "prefer to
> do it in instance init" :-) I think we prefer not to have
> complicated behaviours happening on property-set because it's
> a bit unexpected (but sometimes it's necessary if later
> property-sets wouldn't work otherwise).

Allright, I'm happy to change it. It definitely simplifies the code.

Cheers,
Edgar
