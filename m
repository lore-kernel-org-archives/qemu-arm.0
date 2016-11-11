Received: by 10.25.150.194 with SMTP id y185csp1281809lfd;
        Fri, 11 Nov 2016 03:13:13 -0800 (PST)
X-Received: by 10.28.148.6 with SMTP id w6mr10373190wmd.43.1478862792964;
        Fri, 11 Nov 2016 03:13:12 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id p188si3330926wmp.142.2016.11.11.03.13.12;
        Fri, 11 Nov 2016 03:13:12 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id uABBDBWr029569;
	Fri, 11 Nov 2016 11:13:11 GMT
Subject: Re: [kvm-unit-tests PATCH v5 07/11] arm/arm64: gicv2: add an IPI test
To: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
   kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <1478798481-25030-1-git-send-email-drjones@redhat.com>
 <1478798481-25030-8-git-send-email-drjones@redhat.com>
Cc: pbonzini@redhat.com, peter.maydell@linaro.org, alex.bennee@linaro.org,
   marc.zyngier@arm.com, eric.auger@redhat.com, christoffer.dall@linaro.org
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <53d2bd86-61c6-5717-7bfd-1c6594e3dd43@arm.com>
Date: Fri, 11 Nov 2016 11:13:46 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478798481-25030-8-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: TY0sTj9sn6ja

Hi,

more a comment loosely related to this patch ...

> diff --git a/arm/unittests.cfg b/arm/unittests.cfg
> index 3f6fa45c587e..68bf5cd6008f 100644
> --- a/arm/unittests.cfg
> +++ b/arm/unittests.cfg
> @@ -54,3 +54,10 @@ file = selftest.flat
>  smp = $MAX_SMP
>  extra_params = -append 'smp'
>  groups = selftest
> +
> +# Test GIC emulation
> +[gicv2-ipi]
> +file = gic.flat
> +smp = $((($MAX_SMP < 8)?$MAX_SMP:8))

So here we always go with the maximum number of VCPUs in the guest.
However (as you also noted in your cover-letter) running with a
different number of CPUs might be interesting, for instance with less
than 8 CPUs on a GICv2 (the ITARGETSR register must be masked) or in
general with an odd number (both literally and in the broader sense). I
have a test case with passes with 8 VCPUs but fails with less.

Is there any good way to run some tests multiple times with different
numbers of VCPUS?
Shall we add some "set" functionality to the smp parameter, so that we
can specify a list of desired test points?

Cheers,
Andre.
