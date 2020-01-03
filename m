Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp20532187lff;
        Fri, 3 Jan 2020 10:10:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqxsriYtE1JlJglUVMafL6KryC/a/hWL26BSmJqKgSjfvkQ0gUHHpCzInbNDSka0Tlpb2c3w
X-Received: by 2002:a9d:5786:: with SMTP id q6mr79700598oth.164.1578074999956;
        Fri, 03 Jan 2020 10:09:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578074999; cv=none;
        d=google.com; s=arc-20160816;
        b=bHywU6cI4cAcWfgqnsvSrvEO55lxTAdOIhzza7pqHlobywwxQ+3VaIRrAXqV0QuhPB
         PpVMgfKQ0Ow5EHjxlT6/R9JrjQ6rrJBVwZu6PIuWKnsg7QAWV3tNhugpp9msA+xd7jLr
         agEf8AKNspJICZp0L/PsCfUZPNmTgZ665CRsA3yIqlFWPEIQQ1UD5aobhF5gqAy6Rpuf
         uRo08pkN03i0B4qf00u/j8YmjdksnGpdSOB1j/iGKG0DLncnXphFhwKFIdeOqNZBbMe9
         /n2j2uL0uXjq0699bQReEQTfV5GqoTRWuPYMdCRP6BnAeHss7TaFNrA95BOKT+DUrIrU
         ojog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :organization:references:in-reply-to:message-id:subject:cc:to:from
         :date;
        bh=rK6MmdqpOu/zk0/hHKO4vPP80AhtGpuCBISaLYVe3iM=;
        b=Ul/ANd78LwBHiJFKzSL4kjhzhPBDdFatuS0Do/RrUeJrrXE3OVz/ZQIFib52HMOEmZ
         A1m16hZfn60cv8/qKJkFazWmqV+TQ+EjrzGDNdtMAODZy5UxlrPQ1Ynz0RPlWyT0bAdj
         bt8N/T/3innXjd3dVpWEeTPLIXZF3y/1B/0LpcnM3mjo5ZogeeX6HnjPFSFrZZ6moz3r
         nbA/1EQL8kzJtzOifJbbcugBydcA0YQ8CyhtaVcmZoYRdlvf8g15Utmn1hRj3CGW3ihF
         In++TzWc6/XUNudyfpnBFzLSm6/idfjKwq7j1lVp/j9lt0kaA9rQjsOlwkHEFhmDRSFf
         sVmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z4si32308265oti.93.2020.01.03.10.09.59;
        Fri, 03 Jan 2020 10:09:59 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgACSJ6 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 3 Jan 2020 13:09:58 -0500
Received: from foss.arm.com ([217.140.110.172]:57502 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728201AbgACSJ6 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 3 Jan 2020 13:09:58 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D19F71FB;
        Fri,  3 Jan 2020 10:09:57 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C84B3F703;
        Fri,  3 Jan 2020 10:09:56 -0800 (PST)
Date:   Fri, 3 Jan 2020 18:09:46 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, drjones@redhat.com,
        andrew.murray@arm.com, peter.maydell@linaro.org,
        alexandru.elisei@arm.com
Subject: Re: [kvm-unit-tests PATCH 02/10] arm: pmu: Let pmu tests take a
 sub-test parameter
Message-ID: <20200103180946.06f3c1c3@donnerap.cambridge.arm.com>
In-Reply-To: <20191216204757.4020-3-eric.auger@redhat.com>
References: <20191216204757.4020-1-eric.auger@redhat.com>
        <20191216204757.4020-3-eric.auger@redhat.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: B922M2MxEcI0

On Mon, 16 Dec 2019 21:47:49 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> As we intend to introduce more PMU tests, let's add
> a sub-test parameter that will allow to categorize
> them. Existing tests are in the cycle-counter category.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

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
