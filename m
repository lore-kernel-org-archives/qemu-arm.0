Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp971410njh;
        Mon, 12 Aug 2024 17:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4lyEKCIfeUu1C2vj8kyWsg6ZlGUhJVkgnRzlTzwKU+OfndQClNsX0HjhQ8GmdvswqlTeHSNOocVnkeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG/x6zHJuj/imKJ5WIygh0cSil3bAgtzuewKhipo2SU5ukEmQE0xPB1/Be/W7ryIPCuUNNP
X-Received: by 2002:ac8:4253:0:b0:44c:2c6b:9a5b with SMTP id d75a77b69052e-4534cb67b21mr22687291cf.25.1723509082627;
        Mon, 12 Aug 2024 17:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723509082; cv=none;
        d=google.com; s=arc-20160816;
        b=KmsMIf6EEu+b6z/4pbZJW0ud/9WvcgWAncK+NLOnfy7V3iTdJ8nJp58Ns4CTNr0dhl
         bRous5HgQ2HsfvKxofVURSceZuU6F6veFfhCmkjKX6KOtp6a+gc+iaG5WyW58jK8GObp
         XvEZ5yf/IEyT3JuIFf/R8RexWe/aOIyrtyDHZw4xdSpXFeRN5JSFCVIJQOvhlBH0txs1
         snnPgwXx4xGzmMEAUkNXX3QKShUlvdoeGNiV+4XNXmzaFJ/eP+P2RYie7sdlM/TZGsea
         JSBPNbKBzw48B0dO4Rk2wZ2nd6g51h3DrkqzITkD99z8kgcPh4UI9wd0lzMe7J+hT5Pk
         AdFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QuHRyeLF1of60wxUQaWaVOHKJpi4cOmk6lj5+EoHmcc=;
        fh=Ifyg7bOx+HqW/Q1mB1EgU4PFvwyE5ViU0Tt+0D0yAN0=;
        b=rz0zdqrkXdeU1MfgNSWVOmhKep7L+9d/115s5xadHGi/9sCqqUI6UG56E+/o8OVuwX
         2VWdID6lPkUJ5HXlzT8LvxniqQEC95A7f+68i+TqtXpe6lEbfKSeQy2i5/ukEk8U6f9E
         5gEUeuhiLxRG7VtdGSnS7HF2eJ8a0oWwZfUT1jreVQ597FBu+wVOrbR52D1Ig/iLn3N+
         GJTF1qpwNphgUWBB8tEboqAg2LH+ScKQMPQ+EyiFLOPUWFF+cSRXjwQWbz4/WGVpFIPH
         FVR5zLzIzwfeldSGvC+tvGSTkGcQLmTihnHc+kREkFO0xNue5+E1Adg5igwKhNkPOcNB
         aRiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JGVdW0zA;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c2c65f7si70852021cf.722.2024.08.12.17.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 17:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JGVdW0zA;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723509082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QuHRyeLF1of60wxUQaWaVOHKJpi4cOmk6lj5+EoHmcc=;
	b=JGVdW0zA/kHwyhJy5kzjQEqcwVCCvA3LGo4sZK5iiNmZoh4PcgERE5jrz/y3+cWkhGJeci
	RlKpIMBtFshuiljTwm0t6JLgHrFV5mX0Ml4uX6jh8cjCZs3cqUktdBF2W4twEI5R+Xr4hT
	MC+P1XddhSs6ZIl10usXplmPQgs4cqw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-WlWair3nOx6W516AOhzuIg-1; Mon, 12 Aug 2024 20:31:20 -0400
X-MC-Unique: WlWair3nOx6W516AOhzuIg-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2cb4bcdd996so4409345a91.1
        for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 17:31:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723509080; x=1724113880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QuHRyeLF1of60wxUQaWaVOHKJpi4cOmk6lj5+EoHmcc=;
        b=XXmYTO3KLtIMh6PbbK88DJG4TdNRDzUUm1YDHmVhcaHtMpuuE0AQSzzgY42I5CsjnC
         WI2oY6RZVwF2NKVdWYJnJGu1wWn40BbKHpCSPSI/mgBUJN+F9kLyj69M5tHuvUoQSB63
         TSwcKi0JXZXqTuDgJfAImYytJmM1L/bQtzxHQIZQ5UCNrC2pfg42WybAF8b410+VkKo6
         QCwGi5/23D94OBLrN3vwQD2RIU7/CdwbwUiRU6ViVvwfbVmNV6DW0PzJLTsyO5HBL7Lj
         zxvoUAQ7YcKMTGr2H357IqkXiKkHazWinfQ88Bd+YHDnQY774nGWEkAjjThvnx147+I/
         GzGw==
X-Forwarded-Encrypted: i=1; AJvYcCWUA4nAFJAM6AcsqziJzNQfLPwjk3eRgSjsypbpVQMLpyAusi8x8L68mbvFuEgU+lEwfzBLeAlfXNtbBQ==@linaro.org
X-Gm-Message-State: AOJu0YxlSd4ntgilpN9i272+pw50n9DeH4EeZM/SNHW1Z0m5KDz5IGFD
	BVC6v0mGclA0IxWb/J6QLTZ0XR9eKLRuURapE/miDqjVGZi7+vhRLAQ5b5/W4V5XLXumOJ1BZ2j
	F1GedoPFG01ILCu+1NYYw6WOZLwkiNl9nGm9wsTlWPhBXNM8h0LIOFA==
X-Received: by 2002:a17:90a:1109:b0:2c9:6d45:8187 with SMTP id 98e67ed59e1d1-2d3943115d4mr1806649a91.21.1723509079785;
        Mon, 12 Aug 2024 17:31:19 -0700 (PDT)
X-Received: by 2002:a17:90a:1109:b0:2c9:6d45:8187 with SMTP id 98e67ed59e1d1-2d3943115d4mr1806611a91.21.1723509079239;
        Mon, 12 Aug 2024 17:31:19 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([103.210.27.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d1c9daf76dsm9029092a91.36.2024.08.12.17.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 17:31:18 -0700 (PDT)
Message-ID: <2f6408e2-c273-42a3-ad9f-035e4adc1260@redhat.com>
Date: Tue, 13 Aug 2024 10:31:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 01/29] arm/virt,target/arm: Add new ARMCPU
 {socket,cluster,core,thread}-id property
To: Igor Mammedov <imammedo@redhat.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, maz@kernel.org,
 jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, andrew.jones@linux.dev, david@redhat.com,
 philmd@linaro.org, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, rafael@kernel.org,
 borntraeger@linux.ibm.com, alex.bennee@linaro.org, npiggin@gmail.com,
 harshpb@linux.ibm.com, linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, linuxarm@huawei.com
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-2-salil.mehta@huawei.com>
 <11e627ef-d75e-4114-9b93-14d80ec0526b@redhat.com>
 <20240812101556.1a395712@imammedo.users.ipa.redhat.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20240812101556.1a395712@imammedo.users.ipa.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Aiu0hhfYXFmP

On 8/12/24 6:15 PM, Igor Mammedov wrote:
> On Mon, 12 Aug 2024 14:35:56 +1000
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> On 6/14/24 9:36 AM, Salil Mehta wrote:
>>> This shall be used to store user specified topology{socket,cluster,core,thread}
>>> and shall be converted to a unique 'vcpu-id' which is used as slot-index during
>>> hot(un)plug of vCPU.
>>>
>>> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
>>> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
>>> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>> ---
>>>    hw/arm/virt.c         | 10 ++++++++++
>>>    include/hw/arm/virt.h | 28 ++++++++++++++++++++++++++++
>>>    target/arm/cpu.c      |  4 ++++
>>>    target/arm/cpu.h      |  4 ++++
>>>    4 files changed, 46 insertions(+)
>>>    
>>
>> Those 4 properties are introduced to determine the vCPU's slot, which is the index
>> to MachineState::possible_cpus::cpus[]. From there, the CPU object or instance is
>> referenced and then the CPU's state can be further determined. It sounds reasonable
>> to use the CPU's topology to determine the index. However, I'm wandering if this can
>> be simplified to use 'cpu-index' or 'index' for a couple of facts: (1) 'cpu-index'
> 
> Please, don't. We've spent a bunch of time to get rid of cpu-index in user
> visible interface (well, old NUMA CLI is still there along with 'new' topology
> based one, but that's the last one).
> 

Ok, thanks for the hints. It's a question I had from the beginning. I didn't dig into
the historic background. From the vCPU hotplug document (cpu-hotplug.rst), the CPU
topology is used to identify hot-added vCPU on x86 and it's reasonable for ARM to
follow this mechanism.

>> or 'index' is simplified. Users have to provide 4 parameters in order to determine
>> its index in the extreme case, for example "device_add host-arm-cpu, id=cpu7,socket-id=1,
>> cluster-id=1,core-id=1,thread-id=1". With 'cpu-index' or 'index', it can be simplified
>> to 'index=7'. (2) The cold-booted and hotpluggable CPUs are determined by their index
>> instead of their topology. For example, CPU0/1/2/3 are cold-booted CPUs while CPU4/5/6/7
>> are hotpluggable CPUs with command lines '-smp maxcpus=8,cpus=4'. So 'index' makes
>> more sense to identify a vCPU's slot.
> cpu-index have been used for hotplug with x86 machines as a starting point
> to implement hotplug as it was easy to hack and it has already existed in QEMU.
> 
> But that didn't scale as was desired and had its own issues.
> Hence the current interface that majority agreed upon.
> I don't remember exact arguments anymore (they could be found qemu-devel if needed)
> Here is a link to the talk that tried to explain why topo based was introduced.
>    http://events17.linuxfoundation.org/sites/events/files/slides/CPU%20Hot-plug%20support%20in%20QEMU.pdf
> 

Right, I overlooked the migration case where the source and destination vCPU have
to be strictly correlation. This strict correlation can become broken with 'index'
or 'cpu-index', but it's ensured with the CPU topology as stated on page-19.

Thanks,
Gavin
