Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp1893752lfi;
        Wed, 4 Mar 2020 10:01:57 -0800 (PST)
X-Google-Smtp-Source: ADFU+vufgytFqPNHDYkBEIwBjCKqp2jplYBpUrmxPL3hAjjFTVkX6kE0c2+UgS+CxeB/pnYlQrqk
X-Received: by 2002:ac8:1846:: with SMTP id n6mr3525152qtk.257.1583344917470;
        Wed, 04 Mar 2020 10:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583344917; cv=none;
        d=google.com; s=arc-20160816;
        b=BkLuiJ5WECC00V8xCFfFCEbXagpMGqnEYyseC4z7PT6u+3O3yL2mHedzrF4WzMZbYL
         +t4QTnQDSnNpiSwM8uXy8RvWwZQLcMByweITpcrryG7F0kuQUXgboLovZ5cY7LaEjSUm
         P0lz3IGy+XNg67BmXH3oyTd+y9M3XThhjxuMqjZ5QlX68LPp49VzD3PGi+KcgGMphcNS
         vDvX3sZnyIGFdhYTN7MOD9/4NIjtpQAlKvHnM8ky7dc3BdDDuilN50MCbokKZ6NkFHPQ
         gZ4yqdL/BDmEsIyJxyNZCF834VpLoRto4e+C3ptPk0XZEKHciwCZi0dpkcfxcZ397k5y
         jQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date;
        bh=bCya9j35IAbEVmswaUzV0OgL5raB5j99GqlYk2mLC0I=;
        b=LZMLyYHTcotNFMj3Stitkp42o5rmpFiHz4gX/w/8N8R0KMQUs0ovz5Nu9aHkrBxlgF
         rCz79L29mJgSlVFjV5H22yLsNt6G4UDGcgmgl2vhg4ZTKDI3fVkkZD32gQG+IM0r/VvF
         13XwI6X+g+TVJAXTv+DsBo/Q8yus4mOfijpoBiTK9gCaHt8mgz1M87z6F4G+7vkmorsU
         4lt72JVOgLUAbGX743z8e/DLZm1U/Qk9dQ14m14nZgmkFRlm+55sV1cYk9Ht7jjIUHl+
         HZLfqhU83PJ/MshDNHsg12gaEGqMB0RC0ER85t3a4yJuPnd1yHNNF9163DbQ2qpUT8ON
         ZPIw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id n70si1390482qka.134.2020.03.04.10.01.57;
        Wed, 04 Mar 2020 10:01:57 -0800 (PST)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 010B14AEE6;
	Wed,  4 Mar 2020 13:01:57 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -1.501
X-Spam-Level: 
X-Spam-Status: No, score=-1.501 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_MED=-2.3] autolearn=no
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7uLcYDyVBYo; Wed,  4 Mar 2020 13:01:55 -0500 (EST)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id CD8BD4AE9D;
	Wed,  4 Mar 2020 13:01:55 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id F36A04AEBB
 for <kvmarm@lists.cs.columbia.edu>; Wed,  4 Mar 2020 13:01:53 -0500 (EST)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KTVB8hujpTkJ for <kvmarm@lists.cs.columbia.edu>;
 Wed,  4 Mar 2020 13:01:52 -0500 (EST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id BC2E64ACE9
 for <kvmarm@lists.cs.columbia.edu>; Wed,  4 Mar 2020 13:01:52 -0500 (EST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4703931B;
 Wed,  4 Mar 2020 10:01:52 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0A7E3F6C4;
 Wed,  4 Mar 2020 10:01:50 -0800 (PST)
Date: Wed, 4 Mar 2020 18:01:44 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v2 2/9] arm: pmu: Let pmu tests take a
 sub-test parameter
Message-ID: <20200304180144.51fe2852@donnerap.cambridge.arm.com>
In-Reply-To: <20200130112510.15154-3-eric.auger@redhat.com>
References: <20200130112510.15154-1-eric.auger@redhat.com>
 <20200130112510.15154-3-eric.auger@redhat.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, maz@kernel.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, andrew.murray@arm.com, kvmarm@lists.cs.columbia.edu,
 eric.auger.pro@gmail.com
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: Omgk0pWE6bot

On Thu, 30 Jan 2020 12:25:03 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> As we intend to introduce more PMU tests, let's add
> a sub-test parameter that will allow to categorize
> them. Existing tests are in the cycle-counter category.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Did you change anything? Or just forgot to add my previous R-b?

Anyway,

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  arm/pmu.c         | 24 +++++++++++++++---------
>  arm/unittests.cfg |  7 ++++---
>  2 files changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/arm/pmu.c b/arm/pmu.c
> index d5a03a6..e5e012d 100644
> --- a/arm/pmu.c
> +++ b/arm/pmu.c
> @@ -287,22 +287,28 @@ int main(int argc, char *argv[])
>  {
>  	int cpi = 0;
>  
> -	if (argc > 1)
> -		cpi = atol(argv[1]);
> -
>  	if (!pmu_probe()) {
>  		printf("No PMU found, test skipped...\n");
>  		return report_summary();
>  	}
>  
> +	if (argc < 2)
> +		report_abort("no test specified");
> +
>  	report_prefix_push("pmu");
>  
> -	report(check_pmcr(), "Control register");
> -	report(check_cycles_increase(),
> -	       "Monotonically increasing cycle count");
> -	report(check_cpi(cpi), "Cycle/instruction ratio");
> -
> -	pmccntr64_test();
> +	if (strcmp(argv[1], "cycle-counter") == 0) {
> +		report_prefix_push(argv[1]);
> +		if (argc > 2)
> +			cpi = atol(argv[2]);
> +		report(check_pmcr(), "Control register");
> +		report(check_cycles_increase(),
> +		       "Monotonically increasing cycle count");
> +		report(check_cpi(cpi), "Cycle/instruction ratio");
> +		pmccntr64_test();
> +	} else {
> +		report_abort("Unknown sub-test '%s'", argv[1]);
> +	}
>  
>  	return report_summary();
>  }
> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index daeb5a0..79f0d7a 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -61,21 +61,22 @@ file = pci-test.flat
>  groups = pci
>  
>  # Test PMU support
> -[pmu]
> +[pmu-cycle-counter]
>  file = pmu.flat
>  groups = pmu
> +extra_params = -append 'cycle-counter 0'
>  
>  # Test PMU support (TCG) with -icount IPC=1
>  #[pmu-tcg-icount-1]
>  #file = pmu.flat
> -#extra_params = -icount 0 -append '1'
> +#extra_params = -icount 0 -append 'cycle-counter 1'
>  #groups = pmu
>  #accel = tcg
>  
>  # Test PMU support (TCG) with -icount IPC=256
>  #[pmu-tcg-icount-256]
>  #file = pmu.flat
> -#extra_params = -icount 8 -append '256'
> +#extra_params = -icount 8 -append 'cycle-counter 256'
>  #groups = pmu
>  #accel = tcg
>  

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
