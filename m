Received: by 10.25.159.131 with SMTP id i125csp1982250lfe;
        Tue, 6 Dec 2016 01:32:07 -0800 (PST)
X-Received: by 10.98.15.206 with SMTP id 75mr62640896pfp.105.1481016727489;
        Tue, 06 Dec 2016 01:32:07 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id d4si18748003pfb.185.2016.12.06.01.32.07;
        Tue, 06 Dec 2016 01:32:07 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95371154D;
	Tue,  6 Dec 2016 01:32:06 -0800 (PST)
Received: from [192.168.67.35] (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAB573F445;
	Tue,  6 Dec 2016 01:32:04 -0800 (PST)
Subject: Re: [Qemu-devel] [kvm-unit-tests RFC 05/15] arm/arm64: GICv3: add cpu
 count
To: Andrew Jones <drjones@redhat.com>, Eric Auger <eric.auger@redhat.com>
References: <1480974406-29345-1-git-send-email-eric.auger@redhat.com>
 <1480974406-29345-6-git-send-email-eric.auger@redhat.com>
 <20161206092925.mk4gwx7jbomzxsfz@kamzik.brq.redhat.com>
Cc: eric.auger.pro@gmail.com, kvm@vger.kernel.org,
 kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 marc.zyngier@arm.com, christoffer.dall@linaro.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, peter.maydell@linaro.org
From: Andre Przywara <andre.przywara@arm.com>
Message-ID: <b7ba4a79-0a8d-3520-ba19-1afd6f2de4c1@arm.com>
Date: Tue, 6 Dec 2016 09:32:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161206092925.mk4gwx7jbomzxsfz@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: mhkb/zqsaoYW

Hi,

On 06/12/16 09:29, Andrew Jones wrote:
> On Mon, Dec 05, 2016 at 10:46:36PM +0100, Eric Auger wrote:
>> Add a new cpu_count field in gicv3_data indicating the
>> number of redistributors. This will be useful for enumeration
>> of their resources such as LPI pending tables.
> 
> I'm fine with the additional state, but just curious, will it
> ever be possible for gicv3.cpu_count != nr_cpus?

If not you are in trouble, so that should in fact be one test.

Which brings me to my comment ...

>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  lib/arm/asm/gic-v3.h | 1 +
>>  lib/arm/gic-v3.c     | 2 ++
>>  2 files changed, 3 insertions(+)
>>
>> diff --git a/lib/arm/asm/gic-v3.h b/lib/arm/asm/gic-v3.h
>> index ed330af..039b7c2 100644
>> --- a/lib/arm/asm/gic-v3.h
>> +++ b/lib/arm/asm/gic-v3.h
>> @@ -58,6 +58,7 @@ struct gicv3_data {
>>  	void *dist_base;
>>  	void *redist_base[NR_CPUS];
>>  	unsigned int irq_nr;
>> +	unsigned int cpu_count;

Should that be called "nr_redists" or the like?
Since this is what it counts in the code below.
Later we can then compare this with nr_cpus to check for a match.

Cheers,
Andre.

>>  };
>>  extern struct gicv3_data gicv3_data;
>>  
>> diff --git a/lib/arm/gic-v3.c b/lib/arm/gic-v3.c
>> index 6246221..9921f4d 100644
>> --- a/lib/arm/gic-v3.c
>> +++ b/lib/arm/gic-v3.c
>> @@ -12,12 +12,14 @@ void gicv3_set_redist_base(size_t stride)
>>  	void *ptr = gicv3_data.redist_base[0];
>>  	u64 typer;
>>  
>> +	gicv3_data.cpu_count = 0;
>>  	do {
>>  		typer = gicv3_read_typer(ptr + GICR_TYPER);
>>  		if ((typer >> 32) == aff) {
>>  			gicv3_redist_base() = ptr;
>>  			return;
>>  		}
>> +		gicv3_data.cpu_count++;
>>  		ptr += stride; /* skip RD_base, SGI_base, etc. */
>>  	} while (!(typer & GICR_TYPER_LAST));
>>  
>> -- 
>> 2.5.5
>>
>>
