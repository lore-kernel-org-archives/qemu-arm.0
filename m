Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp20534826lff;
        Fri, 3 Jan 2020 10:12:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqyZBtnjTSQ+poSsRAIBMdxLOEHP2MgFsfq35BcoiaBpFwaU6uoxTeqbXj3iVrR4Vq9cE5YN
X-Received: by 2002:a9d:6a5a:: with SMTP id h26mr102435321otn.103.1578075145845;
        Fri, 03 Jan 2020 10:12:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578075145; cv=none;
        d=google.com; s=arc-20160816;
        b=grtmA3c7XXWRW9DOMAf5BIsJZyBBTgPOq65zAaFDWOo3FzYkjHjTqlVuSSMSQ7Bu69
         T+ozxXwBir+gm3RQtwCYKlSw3WM3XudiyEJghSQm+MagOkEDIb/0DW6/a7CnORvIU7bV
         hotB17WP+TFLEPCd8hoyHRUXKmfW4rq4Oob+uVA+VWqfpWE2o+WDY1fEczI0227RdHlx
         cEE4K+sQAdp/NqeTDQ+55J3VOCyoE7W+ifUBj7/0eX1bFi02AXfKJEzkzhEBr0RWwR/B
         Hw2Diu8TpZVHRRH2+zQAXw1FKONxcXdgA/mV32E2wlFPfQiulD4k7e2uLBoQ3OFDLyxV
         vF6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :organization:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=lycl7/WsdrVXVY6IC+YLfQXXSI7aGDWkH5zx35u+kWw=;
        b=lhA2nYTNye3FYP6B4hZgQON13PsNtRbVLhEERTbhcGZNcQvjjfpwaNv1Mt19hggzm6
         Ci703ADLb/vlifAOlG1eWWs3Hxi5qHELFxD5xNzOFp5OlSno3DCxymtZau+5ekHwo7F5
         7zfKMdNhFrg7iC6TcVSTvbVrfO2G8pWX6J+hCuh/Pyz4Ydi+m/fHxv/WdxxmuIiGer5y
         h8/2nfqXGsJSQZkq+nArhwWUQ7GB5vt3EbVBhVA/r1GdC7bk+GJEj98plU7vSk+o50Zr
         MGTgOQ3y04pVpaHVz4257Vq36piKjgLfBzIn5f0muf+as/v/hgzJ6r7lpRivbJXJAAqn
         7/xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g5si33016252otn.232.2020.01.03.10.12.25;
        Fri, 03 Jan 2020 10:12:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgACSMY (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 3 Jan 2020 13:12:24 -0500
Received: from foss.arm.com ([217.140.110.172]:57524 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728281AbgACSMX (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Jan 2020 13:12:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74A2F1FB;
        Fri,  3 Jan 2020 10:12:22 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 20C783F703;
        Fri,  3 Jan 2020 10:12:21 -0800 (PST)
Date:   Fri, 3 Jan 2020 18:12:18 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, drjones@redhat.com,
        andrew.murray@arm.com, peter.maydell@linaro.org,
        alexandru.elisei@arm.com
Subject: Re: [kvm-unit-tests PATCH 03/10] arm: pmu: Add a pmu struct
Message-ID: <20200103181218.09681724@donnerap.cambridge.arm.com>
In-Reply-To: <20191216204757.4020-4-eric.auger@redhat.com>
References: <20191216204757.4020-1-eric.auger@redhat.com>
        <20191216204757.4020-4-eric.auger@redhat.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 4gzqA3xeM4+p

On Mon, 16 Dec 2019 21:47:50 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> This struct aims at storing information potentially used by
> all tests such as the pmu version, the read-only part of the
> PMCR, the number of implemented event counters, ...
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

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
