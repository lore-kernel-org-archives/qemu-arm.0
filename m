Received: by 10.25.150.194 with SMTP id y185csp212957lfd;
        Wed, 9 Nov 2016 04:01:14 -0800 (PST)
X-Received: by 10.194.112.196 with SMTP id is4mr17308289wjb.92.1478692874284;
        Wed, 09 Nov 2016 04:01:14 -0800 (PST)
Return-Path: <andre.przywara@arm.com>
Received: from cam-admin0.cambridge.arm.com (cam-admin0.cambridge.arm.com. [217.140.96.50])
        by mx.google.com with ESMTP id ex18si38532069wjd.1.2016.11.09.04.01.14;
        Wed, 09 Nov 2016 04:01:14 -0800 (PST)
Received-SPF: pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) client-ip=217.140.96.50;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andre.przywara@arm.com designates 217.140.96.50 as permitted sender) smtp.mailfrom=andre.przywara@arm.com
Received: from [192.168.67.35] ([10.1.207.46])
	by cam-admin0.cambridge.arm.com (8.12.6/8.12.6) with ESMTP id uA9C18Wr012474;
	Wed, 9 Nov 2016 12:01:08 GMT
Subject: Re: [kvm-unit-tests PATCH v4 03/11] arm/arm64: smp: support more than
 8 cpus
To: Andrew Jones <drjones@redhat.com>
References: <1478636499-14339-1-git-send-email-drjones@redhat.com>
 <1478636499-14339-4-git-send-email-drjones@redhat.com>
 <f5509dd7-594b-04c8-20b0-2986fe1bcc41@arm.com>
 <20161109115732.hpiaiigtgfgnrybt@kamzik.brq.redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, qemu-devel@nongnu.org,
   qemu-arm@nongnu.org, pbonzini@redhat.com, peter.maydell@linaro.org,
   alex.bennee@linaro.org, marc.zyngier@arm.com, eric.auger@redhat.com,
   christoffer.dall@linaro.org
From: Andre Przywara <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <33e2c904-cea1-6d21-4be9-b3fbd037c563@arm.com>
Date: Wed, 9 Nov 2016 12:01:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161109115732.hpiaiigtgfgnrybt@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: Ia4nvErT1kcX

Hi,

On 09/11/16 11:57, Andrew Jones wrote:
> On Wed, Nov 09, 2016 at 11:12:03AM +0000, Andre Przywara wrote:
> [...]
>>> diff --git a/lib/arm/setup.c b/lib/arm/setup.c
>>> index 7e7b39f11dde..b6e2d5815e72 100644
>>> --- a/lib/arm/setup.c
>>> +++ b/lib/arm/setup.c
>>> @@ -24,12 +24,22 @@ extern unsigned long stacktop;
>>>  extern void io_init(void);
>>>  extern void setup_args_progname(const char *args);
>>>  
>>> -u32 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
>>> +u64 cpus[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
>>
>> This should be ~0UL.
> 
> Indeed. Thanks.
> 
>> Also I think the type should be unsigned long to match the types used
>> everywhere else.
> 
> I'll change mpidr_to_cpu to return u64 instead of unsigned long.

I am not sure this is the right direction. unsigned long is really the
natural type for MPIDR, since this is a system register with exactly the
native register size.
I think we use it this way in the kernel.

Cheers,
Andre

> Actually I think Alex suggested that. I'm not sure why I haven't
> done it...
> 
>>
>>>  int nr_cpus;
>>>  
>>>  struct mem_region mem_regions[NR_MEM_REGIONS];
>>>  phys_addr_t __phys_offset, __phys_end;
>>>  
>>> +int mpidr_to_cpu(unsigned long mpidr)
>>> +{
>>> +	int i;
>>> +
>>> +	for (i = 0; i < nr_cpus; ++i)
>>> +		if (cpus[i] == (mpidr & MPIDR_HWID_BITMASK))
>>> +			return i;
>>> +	return -1;
>>> +}
>>> +
>>>  static void cpu_set(int fdtnode __unused, u32 regval, void *info __unused)
>>
>> I guess this needs to be extended as well, including
>> dt_for_each_cpu_node() to cope with 64-bit reg properties in the CPU
>> node (where the upper word is not 0).
>> But this is not really crucial atm, so can be fixed in a follow-up patch.
> 
> Yeah, I'll do it as a followup series, because it'll affect powerpc too.
> 
> drew
> 
