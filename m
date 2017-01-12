Received: by 10.25.205.13 with SMTP id d13csp1432158lfg;
        Thu, 12 Jan 2017 12:48:58 -0800 (PST)
X-Received: by 10.55.114.70 with SMTP id n67mr16442960qkc.185.1484254138029;
        Thu, 12 Jan 2017 12:48:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k23si6915608qtb.147.2017.01.12.12.48.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jan 2017 12:48:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cRmIr-0001o7-JA
	for alex.bennee@linaro.org; Thu, 12 Jan 2017 15:48:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cRmGx-0007Rh-Ha
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 15:47:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cRmGt-00013X-IN
	for qemu-arm@nongnu.org; Thu, 12 Jan 2017 15:46:59 -0500
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:35441)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cRmGt-00013M-B5; Thu, 12 Jan 2017 15:46:55 -0500
Received: by mail-lf0-x244.google.com with SMTP id v186so3436975lfa.2;
	Thu, 12 Jan 2017 12:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vtGmQE/0U4HxxVYdiXd2Tt7Fr6894jD0u1eRWrr8csw=;
	b=Xy4fahpFEF0hYkB4ivjZsOL//KM7hxMP5OHtyHe3cX33jlkCQ/bckIwukKciBju2kz
	MqWW/XHjMKX6n4DhGHXF48Zfh2Ab/pHVefpGBdIe4TI2qgBQmX+5a+O59VrEG42VcHBi
	+dvCU5GO8ahMHuL+Z9OnH8XcPUZZQ89y9NcW5aIhkRV/mmiG5l1b0GZ4HwSCvI5LYHGs
	J1UFCtmdp3YljeIQW3WQzsT2ENG1PZIWFlAtiqk9IvOvsq0hbJ1v5IRZQXmV39zIWfI5
	7ae5L4vfn2NOsLvRvqx6+h7TZUCTkHEMR3hzwyjLMXwLo7Mg25EXGfMIIM50R8V35uyW
	gqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vtGmQE/0U4HxxVYdiXd2Tt7Fr6894jD0u1eRWrr8csw=;
	b=rs+jUXjGfdqnq/3UvDs9A+U1Hn+gbImsCntV2otb3BGuu3dSMISl2ZCe8zhdlM3Jas
	ArH3RUmnyOLdjk4up2M7nnpe3upnBgmykQcKBD+JCZo7zJEt/W8Fv9i+RSB3XixNh5s+
	+jllJ6p9QAUWEJQA5stFN8HORq0+D2mLSPp1Ye3PpEaTa5fDXz9ycc9Ns6FBfPgzEj0D
	OtdCCtdrYJExDpW5g5qcAvlaZbriBRIyyIIcYRa5x0Op771/z6TH3x+cK82BF1xPddnP
	WfwvPxxZbJCW2YIqyRz88Vs2VpHOdC5szefMo++ujeVEH0TMNQfLgHypMXQgjZL0CcMZ
	mVjg==
X-Gm-Message-State: AIkVDXKecN+p06Z03ZE3K9PSPIkb6u/UhI8XHGBXk2/TJHFVtY8PCYFwWGiWg+tPdc8wRg==
X-Received: by 10.46.15.26 with SMTP id 26mr6333659ljp.52.1484254013878;
	Thu, 12 Jan 2017 12:46:53 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id d2sm2914453lfe.13.2017.01.12.12.46.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Jan 2017 12:46:53 -0800 (PST)
Date: Thu, 12 Jan 2017 21:46:52 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170112204652.GA9606@toto>
References: <1484073849-32666-1-git-send-email-peter.maydell@linaro.org>
	<1484073849-32666-4-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1484073849-32666-4-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH 3/3] target/arm: Implement DBGVCR32_EL2
 system register
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ArjwZdNDQvfU

On Tue, Jan 10, 2017 at 06:44:09PM +0000, Peter Maydell wrote:
> The DBGVCR_EL2 system register is needed to run a 32-bit
> EL1 guest under a Linux EL2 64-bit hypervisor. Its only
> purpose is to provide AArch64 with access to the state of
> the DBGVCR AArch32 register. Since we only have a dummy
> DBGVCR, implement a corresponding dummy DBGVCR32_EL2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/helper.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index dc90986..bda562d 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4066,6 +4066,13 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
>        .cp = 14, .opc1 = 0, .crn = 0, .crm = 7, .opc2 = 0,
>        .access = PL1_RW, .accessfn = access_tda,
>        .type = ARM_CP_NOP },
> +    /* Dummy DBGVCR32_EL2 (which is only for a 64-bit hypervisor
> +     * to save and restore a 32-bit guest's DBGVCR)
> +     */
> +    { .name = "DBGVCR32_EL2", .state = ARM_CP_STATE_AA64,
> +      .opc0 = 2, .opc1 = 4, .crn = 0, .crm = 7, .opc2 = 0,
> +      .access = PL2_RW, .accessfn = access_tda,
> +      .type = ARM_CP_NOP },
>      /* Dummy MDCCINT_EL1, since we don't implement the Debug Communications
>       * Channel but Linux may try to access this register. The 32-bit
>       * alias is DBGDCCINT.
> -- 
> 2.7.4
> 
