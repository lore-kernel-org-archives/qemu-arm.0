Received: by 10.25.208.211 with SMTP id h202csp1246288lfg;
        Fri, 19 Feb 2016 08:31:29 -0800 (PST)
X-Received: by 10.55.80.131 with SMTP id e125mr16867580qkb.62.1455899489841;
        Fri, 19 Feb 2016 08:31:29 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p62si15048030qkl.67.2016.02.19.08.31.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 08:31:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53576 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWnxo-0003by-Ur
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 11:31:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWnxm-0003bb-2z
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:31:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1aWnxh-0001Za-V5
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 11:31:26 -0500
Received: from mail-lb0-x22d.google.com ([2a00:1450:4010:c04::22d]:35717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1aWnxh-0001ZQ-Hy; Fri, 19 Feb 2016 11:31:21 -0500
Received: by mail-lb0-x22d.google.com with SMTP id bc4so50197002lbc.2;
	Fri, 19 Feb 2016 08:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=wdAo17a3iC8wbXNolfZ6aWNzTQQ++0nzPkDt8Ixrw/A=;
	b=ulu3qWVMb1QGRmZUpIOFdB3JAtBwfvcxpsK23O0h2mJaMAEAtUbRgpXKlEonqsLiWg
	nKDmq4uX+c5ohA1f/WL44ts5RTpto0YSjjflD4U+eiYnNIipz9C2tdicIVAs1OtBfWxR
	wfN+wVYFJsvTq4FFCXwlYA6G4cs1rrg/vK3ZQxiqS0xbm/5qguoIyRDpt5FNVudShK28
	j+4a4Fc2RHDPHT69exw9bxJz4irawsI/65JBMIKXb0Xap/ghzpgt+fME05AZuiHaA88q
	n8Z+c7/oECqRmzhCXDN3NoDAhucshtJNd8cutM5QxkK0cHXnoKyj5+ifA3KRQMgcSZFf
	0mUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=wdAo17a3iC8wbXNolfZ6aWNzTQQ++0nzPkDt8Ixrw/A=;
	b=kBxahyFKGbWgDqe1Ryr2SNsAiVxsmUok+L2E6N+N6+0eBFqM1+ez/VUuW2+22cmlac
	OsKlKo/wwx0msMrmqjyR469WgJyVWzPtg2ngqiiUk05OkBXOEDPorKTRzMsywBPedQ9r
	Is1KIomMnf/C+in3wHRpNdU/6qDvjre+zUU7VYvXQx5G+KRG27pTK40FGM/wr+cZML2o
	62QfguC9ROKGeAcSQJXrcOM26UUmQqO0A3GchUwNTa3E24Cn5HdWJhwP4m058VTZ6HOY
	a2dv5yIVp1953Ewgd0t6aXin0TsXjhyIKzreD+RlpEG6u7TzmdSpAr/9FpC7NF342did
	lGlQ==
X-Gm-Message-State: AG10YOQOPEvQ+efaQI+QzjKtOdMrf/VDavZ+1gKKkZarLDFSIFAJ8EW6bE+L5ufNyxocxg==
X-Received: by 10.112.139.104 with SMTP id qx8mr5676521lbb.88.1455899480686;
	Fri, 19 Feb 2016 08:31:20 -0800 (PST)
Received: from [10.30.10.50] ([213.243.91.10])
	by smtp.googlemail.com with ESMTPSA id
	k65sm1619240lfe.41.2016.02.19.08.31.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Feb 2016 08:31:19 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1455892784-11328-1-git-send-email-peter.maydell@linaro.org>
	<1455892784-11328-2-git-send-email-peter.maydell@linaro.org>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <56C74356.7040604@gmail.com>
Date: Fri, 19 Feb 2016 19:31:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455892784-11328-2-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c04::22d
Cc: qemu-arm@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH v2 1/2] target-arm: Fix handling of SDCR for
	32-bit code
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
X-TUID: LPpGnW+D4mPB

On 19.02.2016 17:39, Peter Maydell wrote:
> Fix two issues with our implementation of the SDCR:
>  * it is only present from ARMv8 onwards
>  * it does not contain several of the trap bits present in its 64-bit
>    counterpart the MDCR_EL3
>
> Put the register description in the right place so that it does not
> get enabled for ARMv7 and earlier, and give it a write function so that
> we can mask out the bits which should not be allowed to have an effect
> if EL3 is 32-bit.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/cpu.h    |  4 ++++
>  target-arm/helper.c | 23 +++++++++++++++--------
>  2 files changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/target-arm/cpu.h b/target-arm/cpu.h
> index e72e33b..a729ae0 100644
> --- a/target-arm/cpu.h
> +++ b/target-arm/cpu.h
> @@ -599,6 +599,7 @@ void pmccntr_sync(CPUARMState *env);
>  #define MDCR_EDAD     (1U << 20)
>  #define MDCR_SPME     (1U << 17)
>  #define MDCR_SDD      (1U << 16)
> +#define MDCR_SPD      (3U << 14)
>  #define MDCR_TDRA     (1U << 11)
>  #define MDCR_TDOSA    (1U << 10)
>  #define MDCR_TDA      (1U << 9)
> @@ -607,6 +608,9 @@ void pmccntr_sync(CPUARMState *env);
>  #define MDCR_TPM      (1U << 6)
>  #define MDCR_TPMCR    (1U << 5)
>  
> +/* Not all of the MDCR_EL3 bits are present in the 32-bit SDCR */
> +#define SDCR_VALID_MASK (MDCR_EPMAD | MDCR_EDAD | MDCR_SPME | MDCR_SPD)
> +
>  #define CPSR_M (0x1fU)
>  #define CPSR_T (1U << 5)
>  #define CPSR_F (1U << 6)
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 3d7fda1..e9b89e6 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3037,6 +3037,12 @@ static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri,
>      return CP_ACCESS_OK;
>  }
>  
> +static void sdcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                       uint64_t value)
> +{
> +    env->cp15.mdcr_el3 = value & SDCR_VALID_MASK;
> +}
> +

Just one comment. As soon as we cannot have both of MDCR_EL3 in SDCR in
a specific CPU configuration (EL3 is either AArch64 or AArch32), the
RES0 bitfields of SDCR are "RES0 in all contexts". Thus we can choose
"The bit is hardwired to 0" behaviour as we do here. We could also
choose another behaviour "The bit can be written" and check for "EL3 is
AArch64" case before trying to interpret those bits. Anyway:

Reviewed-by: Sergey Fedorov <serge.fdrv@gmai.com>

>  static const ARMCPRegInfo v8_cp_reginfo[] = {
>      /* Minimal set of EL0-visible registers. This will need to be expanded
>       * significantly for system emulation of AArch64 CPUs.
> @@ -3331,6 +3337,15 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
>        .opc0 = 3, .opc1 = 4, .crn = 4, .crm = 3, .opc2 = 3,
>        .access = PL2_RW,
>        .fieldoffset = offsetof(CPUARMState, banked_spsr[BANK_FIQ]) },
> +    { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
> +      .resetvalue = 0,
> +      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
> +    { .name = "SDCR", .type = ARM_CP_ALIAS,
> +      .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
> +      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> +      .writefn = sdcr_write,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
>      REGINFO_SENTINEL
>  };
>  
> @@ -3688,14 +3703,6 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
>        .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
>        .writefn = scr_write },
> -    { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
> -      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
> -      .resetvalue = 0,
> -      .access = PL3_RW, .fieldoffset = offsetof(CPUARMState, cp15.mdcr_el3) },
> -    { .name = "SDCR", .type = ARM_CP_ALIAS,
> -      .cp = 15, .opc1 = 0, .crn = 1, .crm = 3, .opc2 = 1,
> -      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> -      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdcr_el3) },
>      { .name = "SDER32_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 1, .opc2 = 1,
>        .access = PL3_RW, .resetvalue = 0,

