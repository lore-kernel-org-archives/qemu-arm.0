Received: by 10.25.208.137 with SMTP id h131csp1779721lfg;
        Tue, 17 May 2016 05:51:34 -0700 (PDT)
X-Received: by 10.55.77.12 with SMTP id a12mr1170398qkb.44.1463489494468;
        Tue, 17 May 2016 05:51:34 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q84si2057532qkc.225.2016.05.17.05.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 May 2016 05:51:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50109 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2eTG-000548-1r
	for alex.bennee@linaro.org; Tue, 17 May 2016 08:51:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b2eSo-0004UZ-WF
	for qemu-devel@nongnu.org; Tue, 17 May 2016 08:51:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b2eSk-00044Z-NJ
	for qemu-devel@nongnu.org; Tue, 17 May 2016 08:51:05 -0400
Received: from mail-bl2nam02on0077.outbound.protection.outlook.com
	([104.47.38.77]:40089
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b2eSk-00044B-Ic
	for qemu-devel@nongnu.org; Tue, 17 May 2016 08:51:02 -0400
Received: from SN1NAM02FT004.eop-nam02.prod.protection.outlook.com
	(10.152.72.54) by SN1NAM02HT094.eop-nam02.prod.protection.outlook.com
	(10.152.73.250) with Microsoft SMTP Server (TLS) id 15.1.492.8;
	Tue, 17 May 2016 12:51:00 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT004.mail.protection.outlook.com (10.152.72.175) with
	Microsoft SMTP Server (TLS) id 15.1.492.8 via Frontend Transport;
	Tue, 17 May 2016 12:51:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39763
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2eSh-000317-JT; Tue, 17 May 2016 05:50:59 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2eSh-00028q-PP; Tue, 17 May 2016 05:50:59 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u4HCoxka014650; Tue, 17 May 2016 05:50:59 -0700
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2eSg-00028h-QH; Tue, 17 May 2016 05:50:59 -0700
Date: Tue, 17 May 2016 14:50:58 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160517125058.GU3731@toto>
References: <1463487258-27468-1-git-send-email-peter.maydell@linaro.org>
	<1463487258-27468-2-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1463487258-27468-2-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22326.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(24454002)(199003)(189002)(9170700003)(54356999)(87936001)(86362001)(575784001)(5008740100001)(46406003)(2950100001)(81166006)(77096005)(92566002)(83506001)(9686002)(76506005)(33656002)(6806005)(4326007)(50986999)(97756001)(63266004)(11100500001)(110136002)(189998001)(50466002)(8676002)(2906002)(4001350100001)(33716001)(23726003)(47776003)(9786002)(1076002)(106466001)(586003)(57986006)(76176999)(19580405001)(1220700001)(8936002)(19580395003)(107986001)(473944003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT094; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; MLV:sfv; A:1; MX:1; LANG:en; 
X-MS-Office365-Filtering-Correlation-Id: b29e9b9c-3b8b-4b29-ba67-08d37e51e606
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:SN1NAM02HT094; 
X-Microsoft-Antispam-PRVS: <7147b79287574fe5b6be66129dee7a51@SN1NAM02HT094.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13017025)(13015025)(8121501046)(13023025)(5005006)(13024025)(13018025)(3002001)(10201501046)(6055026);
	SRVR:SN1NAM02HT094; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT094; 
X-Forefront-PRVS: 0945B0CC72
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2016 12:51:00.3366 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT094
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.77
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oMEMaz8H2XP7

On Tue, May 17, 2016 at 01:14:17PM +0100, Peter Maydell wrote:
> For some exception syndrome types, the IL bit should always be set.
> This includes the instruction abort, watchpoint and software step
> syndrome types; add the missing ARM_EL_IL bit to the syndrome
> values returned by syn_insn_abort(), syn_swstep() and syn_watchpoint().


Hi,

Maybe we should have a reference in a comment to the table in
the pseudo code for AArch64.ExceptionClass?
It makes it a little easier to understand some of these settings...

Either way:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Cheers,
Edgar


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/internals.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target-arm/internals.h b/target-arm/internals.h
> index 54a0fb1..7768a24 100644
> --- a/target-arm/internals.h
> +++ b/target-arm/internals.h
> @@ -382,7 +382,7 @@ static inline uint32_t syn_fp_access_trap(int cv, int cond, bool is_16bit)
>  static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
>  {
>      return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
> -        | (ea << 9) | (s1ptw << 7) | fsc;
> +        | ARM_EL_IL | (ea << 9) | (s1ptw << 7) | fsc;
>  }
>  
>  static inline uint32_t syn_data_abort_no_iss(int same_el,
> @@ -411,13 +411,13 @@ static inline uint32_t syn_data_abort_with_iss(int same_el,
>  static inline uint32_t syn_swstep(int same_el, int isv, int ex)
>  {
>      return (EC_SOFTWARESTEP << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
> -        | (isv << 24) | (ex << 6) | 0x22;
> +        | ARM_EL_IL | (isv << 24) | (ex << 6) | 0x22;
>  }
>  
>  static inline uint32_t syn_watchpoint(int same_el, int cm, int wnr)
>  {
>      return (EC_WATCHPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
> -        | (cm << 8) | (wnr << 6) | 0x22;
> +        | ARM_EL_IL | (cm << 8) | (wnr << 6) | 0x22;
>  }
>  
>  static inline uint32_t syn_breakpoint(int same_el)
> -- 
> 1.9.1
> 
