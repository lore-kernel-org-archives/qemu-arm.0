Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp1894367lfi;
        Wed, 4 Mar 2020 10:02:23 -0800 (PST)
X-Google-Smtp-Source: ADFU+vtSvxiSoCTGDBbz/V83SBTnsHwnxPlnp6zjImeIeAFOOitVj4EpPc97aldIOl+EheogjpTM
X-Received: by 2002:a05:6808:25a:: with SMTP id m26mr1600875oie.152.1583344943728;
        Wed, 04 Mar 2020 10:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583344943; cv=none;
        d=google.com; s=arc-20160816;
        b=N93ccQXKLPgBpEfSRUmi5vO132o6Z/RMySAooZApZzl3mIdqq+kQ4yNeeIt0bm5iGt
         eRo1trIinNEzaGTxmAOx4/YI6FETUpueM4/2dFoSwx7FM86Eg80Kisy+eEvcWj8Wqxd8
         aV9ELn1Ek8pZaRAQ/kHC/3IrzLKlmfkmq8+IWTKLY1Ky5x77rBP4GgNc1k5Jj/A8GKCR
         CTL5Em0Y6X9U9EZgkyZkaqFkYHa0FxUJ6AqzzC+I9ZJGhPiIrAhToPY2pY3HpeoW2qBz
         Nbp/iZcyrQfDS6CxtVmpNs9oUWlFd0CTW+ofHxLc1XJXOWF+1xkYKRFfXE39TUBqtqne
         ALig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :organization:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=aDOv3I80lh81Qa9riENmOR7QfkoxVrz5Vhz41nXvKYQ=;
        b=s1LGu1c//gu8vHLLNRUWOufx3b83gmNPa88ht4Vf/y5TcDLE5vQ5cJS/6LPBztQ1I1
         Oy6VtHkjKxu756Yv4KfNhFCNNnSCq8Ro874k2ql0GfevzJqgexLbpFrHf6rVfvK1n2W1
         vPN63QGN0i8L2hxwSETlKjQDeAFutzYQz4fPnZCakXitUNWOeSrdDFWlQgYTWIJCZy8T
         vUnpTpO7/XA5QATF1PBr6tOYcwnrVkGaXwrzjaZW8RLAsX+nWqcV1ynQD9Jey3oN/kkC
         6P6EWu1QMdiuDVIgPwRFXjOxS0E6s1js4QVPwaElT7kELNfxc3Qt2TcPGvmAzrAvamE2
         38Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id e24si1596778otq.14.2020.03.04.10.02.23;
        Wed, 04 Mar 2020 10:02:23 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729954AbgCDSCW (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 4 Mar 2020 13:02:22 -0500
Received: from foss.arm.com ([217.140.110.172]:38042 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727084AbgCDSCW (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 4 Mar 2020 13:02:22 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B521C31B;
        Wed,  4 Mar 2020 10:02:21 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 604163F6C4;
        Wed,  4 Mar 2020 10:02:20 -0800 (PST)
Date:   Wed, 4 Mar 2020 18:02:15 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, drjones@redhat.com,
        andrew.murray@arm.com, peter.maydell@linaro.org,
        alexandru.elisei@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 3/9] arm: pmu: Add a pmu struct
Message-ID: <20200304180158.4d9e3b8c@donnerap.cambridge.arm.com>
In-Reply-To: <20200130112510.15154-4-eric.auger@redhat.com>
References: <20200130112510.15154-1-eric.auger@redhat.com>
        <20200130112510.15154-4-eric.auger@redhat.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: O8xp6CQ7wHqz

On Thu, 30 Jan 2020 12:25:04 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> This struct aims at storing information potentially used by
> all tests such as the pmu version, the read-only part of the
> PMCR, the number of implemented event counters, ...
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

As I stated already in v1:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arm/pmu.c | 30 +++++++++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/arm/pmu.c b/arm/pmu.c
> index e5e012d..d24857e 100644
> --- a/arm/pmu.c
> +++ b/arm/pmu.c
> @@ -33,7 +33,14 @@
>  
>  #define NR_SAMPLES 10
>  
> -static unsigned int pmu_version;
> +struct pmu {
> +	unsigned int version;
> +	unsigned int nb_implemented_counters;
> +	uint32_t pmcr_ro;
> +};
> +
> +static struct pmu pmu;
> +
>  #if defined(__arm__)
>  #define ID_DFR0_PERFMON_SHIFT 24
>  #define ID_DFR0_PERFMON_MASK  0xf
> @@ -265,7 +272,7 @@ static bool check_cpi(int cpi)
>  static void pmccntr64_test(void)
>  {
>  #ifdef __arm__
> -	if (pmu_version == 0x3) {
> +	if (pmu.version == 0x3) {
>  		if (ERRATA(9e3f7a296940)) {
>  			write_sysreg(0xdead, PMCCNTR64);
>  			report(read_sysreg(PMCCNTR64) == 0xdead, "pmccntr64");
> @@ -278,9 +285,22 @@ static void pmccntr64_test(void)
>  /* Return FALSE if no PMU found, otherwise return TRUE */
>  static bool pmu_probe(void)
>  {
> -	pmu_version = get_pmu_version();
> -	report_info("PMU version: %d", pmu_version);
> -	return pmu_version != 0 && pmu_version != 0xf;
> +	uint32_t pmcr;
> +
> +	pmu.version = get_pmu_version();
> +	report_info("PMU version: %d", pmu.version);
> +
> +	if (pmu.version == 0 || pmu.version == 0xF)
> +		return false;
> +
> +	pmcr = get_pmcr();
> +	pmu.pmcr_ro = pmcr & 0xFFFFFF80;
> +	pmu.nb_implemented_counters =
> +		(pmcr >> PMU_PMCR_N_SHIFT) & PMU_PMCR_N_MASK;
> +	report_info("Implements %d event counters",
> +		    pmu.nb_implemented_counters);
> +
> +	return true;
>  }
>  
>  int main(int argc, char *argv[])
