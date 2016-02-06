Received: by 10.25.159.19 with SMTP id i19csp420539lfe;
        Sat, 6 Feb 2016 04:24:16 -0800 (PST)
X-Received: by 10.140.98.116 with SMTP id n107mr23518440qge.9.1454761456741;
        Sat, 06 Feb 2016 04:24:16 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si20853651qho.50.2016.02.06.04.24.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 04:24:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS1uS-0008O6-9Z
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 07:24:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44276)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS1u7-00087O-8j
	for qemu-devel@nongnu.org; Sat, 06 Feb 2016 07:23:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aS1u4-0008Re-Hi
	for qemu-devel@nongnu.org; Sat, 06 Feb 2016 07:23:55 -0500
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:33949)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aS1u4-0008Ra-9o; Sat, 06 Feb 2016 07:23:52 -0500
Received: by mail-pf0-x242.google.com with SMTP id 71so1418313pfv.1;
	Sat, 06 Feb 2016 04:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=napGvezseuBBeccHlgh1ZRrZailsr+wx8Msxe+Bq8cs=;
	b=B1o6+EeQFIXyZNSP47wdvB9hrCM/N075ph4C+n1uBC7R5sbxo/k9c6ksrTQci5oImz
	R38A4jHCXVjf4DeGFpeUwyrpIcSknmTeuUqwAZoX3dUEdttA8RBNKe9Gyr9ZwU4HiUza
	hFUBMzIo8YRPGwxV4zegViwlvhlsMzLiNS6yGkQKUYphV+4hEuyWjEur3b7idliVq41a
	CxitVMAbZ7LsPa3Dumv+lPtBhG/GhsAlnF186FXHRE7yahLsXEtDHFb8cBmaOOK9C9qg
	dEE54QiC59jiMwRT3TNdf+Z/TBBCJ+NAs/J1j0vwslC0kZjQQNY2seAzIs1WkBvgqNve
	9NVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=napGvezseuBBeccHlgh1ZRrZailsr+wx8Msxe+Bq8cs=;
	b=aAoo/RWkXIDYm/zZfsS9mPUdjX4pGW8Dkws1wztdhcngeOd3bE099Cq0b6H3wRAtOp
	O7Tg3Dswst3SdOv2uMtgr14s/+/fTY4/894wKjoTbdNdDFhx7JdDFpCJxvXu6jf+mRHV
	etRwfJV91djHaOvu2dim/UnkrT+eoTrujW1j3UtVc6h0FPb6K2gKwJMy3m8eDzFscHm9
	CdUh4CGyoIHgzSrTC01G6dbTJL1pyhbMCSNzkI59cp5v+L4BMxZ9R6MqS87x6zMSac5e
	1eBstKQgJWc+NEz3F9vHjVHwc9B58HMuuykfPA5T0DUocErA5GRV9FgXKLrFdXQeqtd8
	ZGDQ==
X-Gm-Message-State: AG10YOSWpaoDUrAT6FRSWHKRkVT4UG5PwboU4JcM41xHs6+wBbTsWGf3M1dS6pjoHi6x2A==
X-Received: by 10.98.72.202 with SMTP id q71mr27297712pfi.69.1454761431422;
	Sat, 06 Feb 2016 04:23:51 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	x10sm30991939pas.37.2016.02.06.04.23.49
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Sat, 06 Feb 2016 04:23:50 -0800 (PST)
Date: Sat, 6 Feb 2016 13:17:56 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160206121756.GC3913@toto>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454506721-11843-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-devel] [PATCH 3/7] target-arm: Use
 access_trap_aa32s_el1() for SCR and MVBAR
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JoGA4rC/yXol

On Wed, Feb 03, 2016 at 01:38:37PM +0000, Peter Maydell wrote:
> The registers MVBAR and SCR should have the behaviour of trapping to
> EL3 if accessed from Secure EL1, but we were incorrectly implementing
> them to UNDEF (which would trap to EL1).  Fix this by using the new
> access_trap_aa32s_el1() access function.

Hi,

It seems to me like if EL3 is running in AArch32, then we shouldn't
trap accesses from Secure EL1 but I can't find that logic. Am I missing
something?

Cheers,
Edgar


> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 8b96b80..d85b04f 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -3547,7 +3547,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .resetvalue = 0, .writefn = scr_write },
>      { .name = "SCR",  .type = ARM_CP_ALIAS,
>        .cp = 15, .opc1 = 0, .crn = 1, .crm = 1, .opc2 = 0,
> -      .access = PL3_RW, .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
> +      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> +      .fieldoffset = offsetoflow32(CPUARMState, cp15.scr_el3),
>        .writefn = scr_write },
>      { .name = "MDCR_EL3", .state = ARM_CP_STATE_AA64,
>        .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 3, .opc2 = 1,
> @@ -3569,7 +3570,8 @@ static const ARMCPRegInfo el3_cp_reginfo[] = {
>        .access = PL3_W | PL1_R, .resetvalue = 0,
>        .fieldoffset = offsetof(CPUARMState, cp15.nsacr) },
>      { .name = "MVBAR", .cp = 15, .opc1 = 0, .crn = 12, .crm = 0, .opc2 = 1,
> -      .access = PL3_RW, .writefn = vbar_write, .resetvalue = 0,
> +      .access = PL1_RW, .accessfn = access_trap_aa32s_el1,
> +      .writefn = vbar_write, .resetvalue = 0,
>        .fieldoffset = offsetof(CPUARMState, cp15.mvbar) },
>      { .name = "SCTLR_EL3", .state = ARM_CP_STATE_AA64,
>        .type = ARM_CP_ALIAS, /* reset handled by AArch32 view */
> -- 
> 1.9.1
> 
