Received: by 10.25.208.137 with SMTP id h131csp1780006lfg;
        Tue, 17 May 2016 05:52:12 -0700 (PDT)
X-Received: by 10.141.3.66 with SMTP id f63mr1174708qhd.55.1463489532502;
        Tue, 17 May 2016 05:52:12 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si2063436qhc.122.2016.05.17.05.52.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 May 2016 05:52:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50113 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b2eTs-0006Gm-2n
	for alex.bennee@linaro.org; Tue, 17 May 2016 08:52:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b2eTG-0005IV-Eo
	for qemu-devel@nongnu.org; Tue, 17 May 2016 08:51:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b2eTD-0004C2-56
	for qemu-devel@nongnu.org; Tue, 17 May 2016 08:51:34 -0400
Received: from mail-bl2nam02on0076.outbound.protection.outlook.com
	([104.47.38.76]:32407
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@xilinx.com>) id 1b2eTD-0004Bt-11
	for qemu-devel@nongnu.org; Tue, 17 May 2016 08:51:31 -0400
Received: from BL2NAM02FT021.eop-nam02.prod.protection.outlook.com
	(10.152.76.51) by BL2NAM02HT092.eop-nam02.prod.protection.outlook.com
	(10.152.76.174) with Microsoft SMTP Server (TLS) id 15.1.492.8;
	Tue, 17 May 2016 12:51:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT021.mail.protection.outlook.com (10.152.77.158) with
	Microsoft SMTP Server (TLS) id 15.1.492.8 via Frontend Transport;
	Tue, 17 May 2016 12:51:29 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2eTA-0008NF-9p; Tue, 17 May 2016 05:51:28 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2eTA-0002Q5-N8; Tue, 17 May 2016 05:51:28 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u4HCpSqZ020674; Tue, 17 May 2016 05:51:28 -0700
Received: from [172.19.5.101] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <edgar.iglesias@xilinx.com>)
	id 1b2eT9-0002Ou-Mm; Tue, 17 May 2016 05:51:28 -0700
Date: Tue, 17 May 2016 14:51:27 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160517125126.GV3731@toto>
References: <1463487258-27468-1-git-send-email-peter.maydell@linaro.org>
	<1463487258-27468-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1463487258-27468-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22326.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(2980300002)(438002)(24454002)(189002)(199003)(9170700003)(46406003)(11100500001)(76506005)(63266004)(2950100001)(19580395003)(23726003)(57986006)(54356999)(83506001)(76176999)(450100001)(8936002)(9686002)(2906002)(19580405001)(1220700001)(4001450100002)(586003)(1076002)(81166006)(97756001)(9786002)(4001350100001)(47776003)(107886002)(106466001)(86362001)(33656002)(8676002)(189998001)(6806005)(87936001)(5008740100001)(33716001)(50986999)(92566002)(4326007)(77096005)(110136002)(50466002)(4001430100002)(15760500001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2NAM02HT092; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; MLV:sfv; MX:1; A:1; LANG:en; 
X-MS-Office365-Filtering-Correlation-Id: 1c8a9f9a-4611-4fa1-3251-08d37e51f754
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BL2NAM02HT092; 
X-Microsoft-Antispam-PRVS: <24ce5c7c75b94cafa95249fdaece4e2a@BL2NAM02HT092.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(13024025)(5005006)(8121501046)(13018025)(13017025)(13015025)(13023025)(3002001)(10201501046)(6055026);
	SRVR:BL2NAM02HT092; BCL:0; PCL:0; RULEID:; SRVR:BL2NAM02HT092; 
X-Forefront-PRVS: 0945B0CC72
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2016 12:51:29.4594 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2NAM02HT092
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.76
Subject: Re: [Qemu-devel] [PATCH 2/2] target-arm: Don't try to set ESR IL
 bit in arm_cpu_do_interrupt_aarch64()
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
X-TUID: mDUq2vQmQFRw

On Tue, May 17, 2016 at 01:14:18PM +0100, Peter Maydell wrote:
> Remove some incorrect code from arm_cpu_do_interrupt_aarch64()
> which attempts to set the IL bit in the syndrome register based
> on the value of env->thumb. This is wrong in several ways:
>  * IL doesn't indicate Thumb-vs-ARM, it indicates instruction
>    length (which may be 16 or 32 for Thumb and is always 32 for ARM)
>  * not every syndrome format uses IL like this -- for some IL is
>    always set, and for some it is always clear
>  * the code is changing esr_el[new_el] even for interrupt entry,
>    which is not supposed to modify ESR_ELx at all
> 
> Delete the code, and instead rely on the syndrome value in
> env->exception.syndrome having already been set up with the
> correct value of IL.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index d652c01..df65e68 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -6349,9 +6349,6 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>          env->elr_el[new_el] = env->pc;
>      } else {
>          env->banked_spsr[aarch64_banked_spsr_index(new_el)] = cpsr_read(env);
> -        if (!env->thumb) {
> -            env->cp15.esr_el[new_el] |= 1 << 25;
> -        }
>          env->elr_el[new_el] = env->regs[15];
>  
>          aarch64_sync_32_to_64(env);
> -- 
> 1.9.1
> 
