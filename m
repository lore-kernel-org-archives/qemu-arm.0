Received: by 10.223.150.237 with SMTP id u100csp94122wrb;
        Fri, 3 Nov 2017 10:37:01 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SZocJqjI9pHzcZWKFIenViY5+ZxxD0cWS4cPPeAOn7iR2NKs2TosOkpao0zgxBWBRF4VYM
X-Received: by 10.129.130.69 with SMTP id s66mr5011157ywf.315.1509730620925;
        Fri, 03 Nov 2017 10:37:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509730620; cv=none;
        d=google.com; s=arc-20160816;
        b=Jo+BZAEUE3FXOBojNg8Jd6YnBzzKOhV/jgE2VUWreyUeLsdeWwtsS0ltlBmGMATvGM
         SorSzBrIfr8WOa1EIbmvPn6Nnj+JN8KAzi5BOtRM6zIPP1LTGl6ZbhTB0f3nWXHEg2em
         CfJTU0usDNqk6wpOWzAD9bwXndtZmhG98fHRLKU7vDzrqNpc3H7TYohrJNE4DU1qyfSG
         /EFmmlkWxGMQBCZVwNgGTDConKt1rvMmfe0QhQJmJHZICWXV6QcVDRQOOz5I651ZSu/R
         djFaKsUg40iFOShqFNz6gsFQ7iS98xlxMwwC0bZfr53ULx22SeJUidS54gxQXHn5q0k6
         xYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=dr4qQw3FjttUY1C6UfpTtHO9OEixHCMYa2/y21BDqpM=;
        b=UH3j52ng07EZMHecWRtPusFM/crO12UkX+rRc6697ML2DGbhxGOfKUvMlRJYzN3fFk
         OgrtT2Lni8JHsIH36Xlwq1sD44w9oxjyNsm2SJU0YgAEp/LHvA6VfL1qgYdoQF6hSQBi
         TkeObcea1dvZ4BI9kcj4hj5NEabG6gZ2VITQzT2CLDQYyoRF+Fyv1U1MJ0+S2b5u5t1o
         1epB7W5sOUjxAk3SNAslIZzE5VFG6msvqQqDtp2tQkOlYWvobQqCejTefPLHuiUk0LdO
         +WrUN/Cns77SWND3rnsZ2DYL3zxZ0dZQC6sxCMAg+YiyIG+vXvhXhW199VGC+jvZAY72
         t3Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 188si1528013ywf.237.2017.11.03.10.37.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Nov 2017 10:37:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37814 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eAfts-0002va-BN
	for alex.bennee@linaro.org; Fri, 03 Nov 2017 13:37:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43319)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eAfte-0002rc-Mi
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 13:36:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1eAftb-0000F7-Iy
	for qemu-arm@nongnu.org; Fri, 03 Nov 2017 13:36:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:46936)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1eAftb-0000Dl-D7; Fri, 03 Nov 2017 13:36:43 -0400
Received: from [10.149.184.130] (162-198-228-35.lightspeed.wlfrct.sbcglobal.net
	[162.198.228.35])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D5A2C218B5;
	Fri,  3 Nov 2017 17:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5A2C218B5
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Fri, 3 Nov 2017 10:36:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <1509719814-6191-1-git-send-email-peter.maydell@linaro.org>
Message-ID: <alpine.DEB.2.10.1711031035500.8975@sstabellini-ThinkPad-X260>
References: <1509719814-6191-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] arm: check regime,
 not current state, for ATS write PAR format
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, patches@linaro.org,
	Julien Grall <julien.grall@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tD3EuRLc0/qy

On Fri, 3 Nov 2017, Peter Maydell wrote:
> In do_ats_write(), rather than using extended_addresses_enabled() to
> decide whether the value we get back from get_phys_addr() is a 64-bit
> format PAR or a 32-bit one, use arm_s1_regime_using_lpae_format().
> 
> This is not really the correct answer, because the PAR format
> depends on the AT instruction being used, not just on the
> translation regime. However getting this correct requires a
> significant refactoring, so that get_phys_addr() returns raw
> information about the fault which the caller can then assemble
> into a suitable FSR/PAR/syndrome for its purposes, rather than
> get_phys_addr() returning a pre-formatted FSR.
> 
> However this change at least improves the situation by making
> the PAR work correctly for address translation operations done
> at AArch64 EL2 on the EL2 translation regime. In particular,
> this is necessary for Xen to be able to run in our emulation,
> so this seems like a safer interim fix given that we are in freeze.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> I guess I should have a go at the "correct answer" I sketch
> above, but no promises about when I'll get time for that :-(
> 
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 96113fe..37af750 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2162,7 +2162,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>  
>      ret = get_phys_addr(env, value, access_type, mmu_idx,
>                          &phys_addr, &attrs, &prot, &page_size, &fsr, &fi);
> -    if (extended_addresses_enabled(env)) {
> +    if (arm_s1_regime_using_lpae_format(env, mmu_idx)) {
>          /* fsr is a DFSR/IFSR value for the long descriptor
>           * translation table format, but with WnR always clear.
>           * Convert it to a 64-bit PAR.
> -- 
> 2.7.4
> 
> 
