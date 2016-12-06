Received: by 10.25.159.131 with SMTP id i125csp1994792lfe;
        Tue, 6 Dec 2016 02:04:56 -0800 (PST)
X-Received: by 10.200.50.53 with SMTP id x50mr54322728qta.207.1481018696219;
        Tue, 06 Dec 2016 02:04:56 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t14si11273136qkt.296.2016.12.06.02.04.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Dec 2016 02:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=eric.auger@redhat.com
Received: from int-mx14.intmail.prod.int.phx2.redhat.com (int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56539C05AA41;
	Tue,  6 Dec 2016 10:04:53 +0000 (UTC)
Received: from localhost.localdomain (vpn1-7-217.ams2.redhat.com [10.36.7.217])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB6A4nJi006673
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 6 Dec 2016 05:04:50 -0500
Subject: Re: [Qemu-devel] [kvm-unit-tests RFC 05/15] arm/arm64: GICv3: add cpu
 count
To: Andre Przywara <andre.przywara@arm.com>, Andrew Jones <drjones@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
 <1480974406-29345-6-git-send-email-eric.auger@redhat.com>
 <20161206092925.mk4gwx7jbomzxsfz@kamzik.brq.redhat.com>
 <b7ba4a79-0a8d-3520-ba19-1afd6f2de4c1@arm.com>
Cc: eric.auger.pro@gmail.com, kvm@vger.kernel.org,
        kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
        qemu-arm@nongnu.org, marc.zyngier@arm.com, christoffer.dall@linaro.org,
        pbonzini@redhat.com, alex.bennee@linaro.org, peter.maydell@linaro.org
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <aed4d5a3-a423-0e0f-654f-5969378efd9a@redhat.com>
Date: Tue, 6 Dec 2016 11:04:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <b7ba4a79-0a8d-3520-ba19-1afd6f2de4c1@arm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 06 Dec 2016 10:04:53 +0000 (UTC)
X-TUID: mKADrKZAXjI8

Hi Andre, Drew,

On 06/12/2016 10:32, Andre Przywara wrote:
> Hi,
> 
> On 06/12/16 09:29, Andrew Jones wrote:
>> On Mon, Dec 05, 2016 at 10:46:36PM +0100, Eric Auger wrote:
>>> Add a new cpu_count field in gicv3_data indicating the
>>> number of redistributors. This will be useful for enumeration
>>> of their resources such as LPI pending tables.
>>
>> I'm fine with the additional state, but just curious, will it
>> ever be possible for gicv3.cpu_count != nr_cpus?
> 
> If not you are in trouble, so that should in fact be one test.
> 
> Which brings me to my comment ...
> 
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>  lib/arm/asm/gic-v3.h | 1 +
>>>  lib/arm/gic-v3.c     | 2 ++
>>>  2 files changed, 3 insertions(+)
>>>
>>> diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
>>> index ed330af..039b7c2 100644
>>> --- a/lib/arm/asm/gic-v3.h
>>> +++ b/lib/arm/asm/gic-v3.h
>>> @@ -58,6 +58,7 @@ struct gicv3_data {
>>>  	void *dist_base;
>>>  	void *redist_base[NR_CPUS];
>>>  	unsigned int irq_nr;
>>> +	unsigned int cpu_count;
> 
> Should that be called "nr_redists" or the like?
> Since this is what it counts in the code below.
> Later we can then compare this with nr_cpus to check for a match.

I fully agree with you suggestion.

Thanks

Eric
> 
> Cheers,
> Andre.
> 
>>>  };
>>>  extern struct gicv3_data gicv3_data;
>>>  
>>> diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
>>> index 6246221..9921f4d 100644
>>> --- a/lib/arm/gic-v3.c
>>> +++ b/lib/arm/gic-v3.c
>>> @@ -12,12 +12,14 @@ void gicv3_set_redist_base(size_t stride)
>>>  	void *ptr = gicv3_data.redist_base[0];
>>>  	u64 typer;
>>>  
>>> +	gicv3_data.cpu_count = 0;
>>>  	do {
>>>  		typer = gicv3_read_typer(ptr + GICR_TYPER);
>>>  		if ((typer >> 32) == aff) {
>>>  			gicv3_redist_base() = ptr;
>>>  			return;
>>>  		}
>>> +		gicv3_data.cpu_count++;
>>>  		ptr += stride; /* skip RD_base, SGI_base, etc. */
>>>  	} while (!(typer & GICR_TYPER_LAST));
>>>  
>>> -- 
>>> 2.5.5
>>>
>>>
> --
> To unsubscribe from this list: send the line "unsubscribe kvm" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
