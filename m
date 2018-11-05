Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2982592wro;
        Mon, 5 Nov 2018 11:30:42 -0800 (PST)
X-Google-Smtp-Source: AJdET5fJ4zhh4XVvfX1Id/6nNYruEHOucvhthPN9/Z6MtTgdIhT5e0aveWSHUgQuaBZoEwUeYqNW
X-Received: by 2002:ac8:5411:: with SMTP id b17mr16598411qtq.259.1541446242820;
        Mon, 05 Nov 2018 11:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541446242; cv=none;
        d=google.com; s=arc-20160816;
        b=HHQDqxj/2z5YvQLQgFFg9PLKqbaDTp+7S6i3wPtlPi1NZPPWBVnqMOB4fRVXJ6cOtO
         cu13fh64X3WwMA7s3LIsz3AVBDGWrjg7VDtJRpC9oWz4zgV+z1ieH0yV15XZRDqTvf8c
         ul3kxnKoW0OHhmpUbr6HOzzZnmmFeBM735YCiw9TzwFw+qfqiRuxeKbyDv5u7UdWL7vd
         SgopalqXPLNQ3Mj1hmacZs9J6mNBEW5B4StXOAeeu75Ffi/vikEx2RvwmgPx1xxh2uRJ
         qAu/GiQULTmDoLTDL6N6GX+y/by44ZKM6lx86xiqrmezxvE6gknAgzam5LoiTu7y2Qf6
         AcXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=wn9xsUeKPIQ4CZgbLv3mRj/CQXh0g+AU6xqHa5f0nac=;
        b=LKMAm41N+WIrwdw5PcRh2fRXEMb/hYJiXmjsfDB6rwDDABCR9Hro0ZOL/L1k35APxa
         P6I9Gswd8jewrT0mHWl923iDJj1l5xm1BrElFCaJZSfkSnf4dhhF68hJSeH1AfJg78gL
         EloqXDYBdVkVX1MVMQhP0eyjg8a8FMhjCMtkqNFX768lZHDIcTgol1a5PbcOrQUkPi8V
         9KzAuq40TqwzBFpebQ+bZCl72dgjTe0HJUyIRmWfS70+dXKF6JOq4LGOIHetDs5CxdC8
         cXXUn9z4lbPfIlQYtcy0BNM5XYYcxojmBY3XVqmx8S8WfE+/BY1Rn7KGtZA8yynglRgx
         sM2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BxapVUdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j25-v6si2836442qtc.137.2018.11.05.11.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 11:30:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=BxapVUdJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37283 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJkaA-0003Av-Bm
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 14:30:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gJka2-0003Al-NV
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 14:30:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1gJkZs-00028l-VP
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 14:30:31 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:43230)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1gJkZp-0001uC-ET; Mon, 05 Nov 2018 14:30:23 -0500
Received: by mail-lj1-x241.google.com with SMTP id g26-v6so9135855lja.10;
	Mon, 05 Nov 2018 11:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wn9xsUeKPIQ4CZgbLv3mRj/CQXh0g+AU6xqHa5f0nac=;
	b=BxapVUdJ8QSLlNmK2UzTtnRmNPaRA0apkehYjUMNMUGRyLYRQzMxdmwOsULC7kMR17
	DBYuwVqxEqiIhI4bVAmZXLP/J7MtOmHOfEQQMGXdC568W6fq8xMUTJ/iTGORg0vJse5w
	ntD8nMukDB4rVl0KduBgJgQs9ev+AIKL1Fka1FxpQ1I3lYSSLqd3J72oml+LAsr061L3
	Z5BNYy8yktWxYUi/yh9oSkfok7ghGmtf+tmIKvH0QSNmtyyzOhXbYOY3Up0K3v3RxYbM
	CEYUS9ML6sDXqryyVtL3JwK4gIfEzjdSaedG+TmFBspwWF8gFmiBrqFMAYxMyicY+/XL
	6xKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wn9xsUeKPIQ4CZgbLv3mRj/CQXh0g+AU6xqHa5f0nac=;
	b=AZ5zzcxUAawHCDNfvNpAXAQ15XeKZFzzX2s560dT7/Xqbg0bgVCs3WhwC9RgR39PPu
	+ZXKIvjgYJ8xM6GDOfKjH7wYCdHNFtjL7BKnRY4O6vfH11CjcfY5dus+vWUKzweFoy4O
	uZtW+STkTLcRKy9r4pyyGjaWdj3p0BbgTbf96yzPNSk+9lHyYiFoL0JaLM5zJaQGLfqn
	ZDCJjCPHeZjrPt6F39o945V2BJmB038V7k45BNWXhJBgDQUT1qj06pnqPhEnpV66GqFw
	tj3UJ5pCnqO5GitV3/B0WopFbS8VV+Dln40thuUzGLSHYLFjrf35aIsRSDwEYkGrRG0F
	Q/xw==
X-Gm-Message-State: AGRZ1gIfL30qfnYbnIsHt7amv6lgKnUE2GuW9E57OoV+wwSp2FuGbtGI
	PMkQCZUzRJcce+eA4V78Ji0=
X-Received: by 2002:a2e:9e10:: with SMTP id
	e16-v6mr15210255ljk.169.1541446214987; 
	Mon, 05 Nov 2018 11:30:14 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
	by smtp.gmail.com with ESMTPSA id
	b22sm5840869lfg.32.2018.11.05.11.30.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 05 Nov 2018 11:30:12 -0800 (PST)
Date: Mon, 5 Nov 2018 20:30:12 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181105193012.GB1148@toto>
References: <20181016093703.10637-1-peter.maydell@linaro.org>
	<20181016093703.10637-3-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016093703.10637-3-peter.maydell@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Fix ATS1Hx instructions
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
X-TUID: rZmyRUtONu60

On Tue, Oct 16, 2018 at 10:37:03AM +0100, Peter Maydell wrote:
> ATS1HR and ATS1HW (which allow AArch32 EL2 to do address translations
> on the EL2 translation regime) were implemented in commit 14db7fe09a2c8.
> However, we got them wrong: these should do stage 1 address translations
> as defined for NS-EL2, which is ARMMMUIdx_S1E2. We were incorrectly
> making them perform stage 2 translations.
> 
> A few years later in commit 1313e2d7e2cd we forgot entirely that
> we'd implemented ATS1Hx, and added a comment that ATS1Hx were
> "not supported yet". Remove the comment; there is no extra code
> needed to handle these operations in do_ats_write(), because
> arm_s1_regime_using_lpae_format() returns true for ARMMMUIdx_S1E2,
> which forces 64-bit PAR format.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Oops, yes:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



> ---
>  target/arm/helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index dc849b09893..903a832f1fa 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -2316,7 +2316,7 @@ static uint64_t do_ats_write(CPUARMState *env, uint64_t value,
>           *
>           * (Note that HCR.DC makes HCR.VM behave as if it is 1.)
>           *
> -         * ATS1Hx always uses the 64bit format (not supported yet).
> +         * ATS1Hx always uses the 64bit format.
>           */
>          format64 = arm_s1_regime_using_lpae_format(env, mmu_idx);
>  
> @@ -2441,7 +2441,7 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
>      uint64_t par64;
>  
> -    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_S2NS);
> +    par64 = do_ats_write(env, value, access_type, ARMMMUIdx_S1E2);
>  
>      A32_BANKED_CURRENT_REG_SET(env, par, par64);
>  }
> -- 
> 2.19.0
> 
> 
