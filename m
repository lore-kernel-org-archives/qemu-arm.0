Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp445980wrx;
        Fri, 1 Mar 2019 02:08:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDVLhkLGjvMmrW3/q9lb/1KK8z52WUOPCBpaaeUKah0W6z5VLRNslRtWLi1v7RnyWvEkfA
X-Received: by 2002:a25:1381:: with SMTP id 123mr3269140ybt.438.1551434926602;
        Fri, 01 Mar 2019 02:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551434926; cv=none;
        d=google.com; s=arc-20160816;
        b=wy/zH0/knm5vkeYjRnOM9FsL+rSGXI8h4B5uFpy6m3AwR3vUOAMKbuO3iBKl5NZAV9
         Ny8pKqBn++2cyIKS9n0syebhh9raQD9izt+C3c7MyIGjzEF0G4PiDs26xx8W58/NYkwO
         c2acV8ADCGev/dMkWS+va8S/fUBhGh3LJ6N4i+Iuc3hKaJFxumBNwn2thSinqJ9ktGhB
         NzKRSfudOHxw6cjwdn9ySs+ERYpOyX6kb5AdNK/E9+VTvcUAzraDmfURqMlhGFa4jsYS
         9gFfLDdzEZwY5agPklPm7z+7Y1xxkdAGYC3bTGy59n0aVkwSUcYh3pL8hwT9nKKakZ3j
         0TDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=h/iH5apftHCj/XFbHC1e83dsev9vZSnOaVjx1JypG+M=;
        b=uEuoiF5NJwGKy/lW/0lh/0b8XFIjvn+WrEgQTlUfDF30m05GywuJ8Z/zXxUEwovnBV
         cAW4/l9MLdNAYBktXu3BgSkI9BF6MIBtr37eg9/InQ7jS2E11IPIXaaqlhknQSpswY8z
         4/Kbna6/Y4ki5KeGxGUwziGw11z2EdX04OyTcVmmK1BAK1k9wf6M0fX4LjRVocRkFxsx
         wlxRsjBJiDw5fe8SvIPMnJUffgFXgsEacEEmwHf4YSRtUAxwB3Y5iHE0sZ90jbhuBfjk
         svqvqvD1z1U0QslXB2lZCx9R1zZjnGuWhA/Mhg9o7WYf86f/+qnXENHK3ju+lqMs7tyD
         Opdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si12761522ybj.155.2019.03.01.02.08.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 02:08:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:34215 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzf5y-0006k1-25
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 05:08:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzf5f-0006gg-4Q
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:08:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzf5e-0004dZ-4n
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:08:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55974)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzf5d-0004cl-RD; Fri, 01 Mar 2019 05:08:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4797A7B582;
	Fri,  1 Mar 2019 10:08:24 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D9CF619EA;
	Fri,  1 Mar 2019 10:08:19 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
	<20190228150324.25973-11-eric.auger@redhat.com>
	<20190228172938.1993ed57@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b27b4a41-6967-9535-2a3f-467a5d54c491@redhat.com>
Date: Fri, 1 Mar 2019 11:08:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190228172938.1993ed57@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 01 Mar 2019 10:08:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v10 10/10] hw/arm/virt: Bump the 255GB
 initial RAM limit
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4OOHpdDpJBhA

Hi Igor,

On 2/28/19 5:29 PM, Igor Mammedov wrote:
> On Thu, 28 Feb 2019 16:03:24 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> Now we have the extended memory map (high IO regions beyond the
>> scalable RAM) and dynamic IPA range support at KVM/ARM level
>> we can bump the legacy 255GB initial RAM limit. The actual maximum
>> RAM size now depends on the physical CPU and host kernel, in
>> accelerated mode. In TCG mode, it depends on the VCPU
>> AA64MMFR0.PARANGE.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v7 -> v8:
>> - TCG PAMAX check moved in a separate patch
>>
>> v6 -> v7
>> - handle TCG case
>> - set_memmap modifications moved to previous patches
>> ---
>>  hw/arm/virt.c | 21 +--------------------
>>  1 file changed, 1 insertion(+), 20 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index a3da75a5ae..a45f0fcf79 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -95,21 +95,8 @@
>>  
>>  #define PLATFORM_BUS_NUM_IRQS 64
>>  
>> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
>> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
>> - * address space unallocated and free for future use between 256G and 512G.
>> - * If we need to provide more RAM to VMs in the future then we need to:
>> - *  * allocate a second bank of RAM starting at 2TB and working up
>> - *  * fix the DT and ACPI table generation code in QEMU to correctly
>> - *    report two split lumps of RAM to the guest
>> - *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
>> - * (We don't want to fill all the way up to 512GB with RAM because
>> - * we might want it for non-RAM purposes later. Conversely it seems
>> - * reasonable to assume that anybody configuring a VM with a quarter
>> - * of a terabyte of RAM will be doing it on a host with more than a
>> - * terabyte of physical address space.)
>> - */
>>  #define RAMBASE GiB
>> +/* Legacy RAM limit in GB (< version 4.0) */
>>  #define LEGACY_RAMLIMIT_GB 255
>>  #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)
> do we need to keep these couple around?
> 
> it's used only in
>  [VIRT_MEM] = { RAMBASE, LEGACY_RAMLIMIT_BYTES },
> and doesn't have any effect whatsoever.
> I'd set initial  VIRT_MEM.size to 0 and drop LEGACY_RAMLIMIT_*
> maybe add comment above entry that size is defined by ram_size

in virt_set_memmap I was checking if (high_io_base < 256 GiB) then
high_io_base = 256GiB. Maybe this 256GiB value comes out of the blue and
I should also replace it with vms->memmap[VIRT_MEM].base +
LEGACY_RAMLIMIT_BYTES.
We maintain some kind of compatibility with the old memmap so I prefer
to keep this info somewhere.

I added a comment though:
/* Actual RAM size depends on initial RAM and device memory options */

Thanks

Eric


> 
>>  
>> @@ -1515,12 +1502,6 @@ static void machvirt_init(MachineState *machine)
>>  
>>      vms->smp_cpus = smp_cpus;
>>  
>> -    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
>> -        error_report("mach-virt: cannot model more than %dGB RAM",
>> -                     LEGACY_RAMLIMIT_GB);
>> -        exit(1);
>> -    }
>> -
>>      if (vms->virt && kvm_enabled()) {
>>          error_report("mach-virt: KVM does not support providing "
>>                       "Virtualization extensions to the guest CPU");
> 
