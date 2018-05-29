Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3586883wre;
        Tue, 29 May 2018 06:43:28 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLZZw3k0LLhWWXi23NHIZ22HkI2OT+WmkHmVN3Whbm3oUu1Owk639TCrtQFjMnILN/N1efa
X-Received: by 2002:a37:2801:: with SMTP id o1-v6mr14855790qkh.319.1527601408370;
        Tue, 29 May 2018 06:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527601408; cv=none;
        d=google.com; s=arc-20160816;
        b=YSPggrdBWs2GZxVrWuwPYGWs92GWvK8coytnVUoBOQ8GzoDbo9PeOgrRSzXNnx4uLF
         Zvcbl+WybLxQFryUAerWAw6KyfusTm8ep8QHyEjRkffTU36DVkjYHpGBIqLyOzYdvbTe
         CB8zjGwO2IlHJX1VIpOt6yqN/7o/SshwqC4iuJyNyCKYewci1sc0wLVlAKpbWXHfsXZ9
         NGDEmuN6F/BNd/zFsrglf8ViYwR/9C4y+0D+RCo4StJ0VZ/vcldSa5k9jZ3zMIOMfG82
         TRFHYpezVAh29KgaRHF+zV/s9cJuTuVL5BABjVJST4mBPooZZ8DKeSERuApZGf5oxG9H
         bEow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=BPcXNAG5iTvgN1vW5+3tKVojculzE5GF9kxhBbQDcnE=;
        b=oPKr9DlQnuJbCZJ7IAZPSlUT37gRWE7w4cbayifvcXyMv55pH98y5qckeAUFGCkQ2v
         0ugllImxPqygArxLM5q5hFC5PrnEpHW7pjT/O7ktVDfTh71vRdfh5ne0jPc9m523UlAA
         3Ms5ze+s1jRvawaavfHPp1He0gQquEQNqKHRODO7bPs2ii/idHyeEw7We0F+9sYM+MXQ
         KM8tAyA6XOJdm5jSuyg2lxXs90yP4Bo1sT66vFI5GQ1P3c9TbYrZpIT28zBDP66l8lzH
         L7Ix8bImNCdHq/G/En7BaBznDFP0cddn23JnycSBx81+eqzw/+0mLclvKvsDAFKH/Cax
         Fm+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s11-v6si8272628qtn.23.2018.05.29.06.43.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 06:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNeuN-0005lm-Se
	for alex.bennee@linaro.org; Tue, 29 May 2018 09:43:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNeuE-0005lS-0X
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:43:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fNeuA-00081R-Tl
	for qemu-arm@nongnu.org; Tue, 29 May 2018 09:43:18 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38572 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fNeuA-00080P-OW; Tue, 29 May 2018 09:43:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D13A0401EF08;
	Tue, 29 May 2018 13:43:13 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4651B64020;
	Tue, 29 May 2018 13:43:10 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-8-git-send-email-eric.auger@redhat.com>
	<CAFEAcA9772Q3OG-YfzLwGWcZ_L5evC7qP_PXqSi8bVr-p-PhJA@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9f0bcfee-31ee-1f2d-1949-6cf986f22ac6@redhat.com>
Date: Tue, 29 May 2018 15:43:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9772Q3OG-YfzLwGWcZ_L5evC7qP_PXqSi8bVr-p-PhJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 13:43:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 13:43:13 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [RFC v2 7/7] hw/arm/virt: Register two redistributor
 regions when necessary
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: McPhqGc8POTM

Hi,

On 05/22/2018 02:43 PM, Peter Maydell wrote:
> On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
>> With a VGICv3 KVM device, if the number of vcpus exceeds the
>> capacity of the legacy redistributor region (123 redistributors),
>> we now attempt to register the second redistributor region. This
>> extends the number of vcpus to 512 assuming the host kernel supports:
>> - up to 512 vcpus

I just noticed virt_machine_class_init still clamps the max_cpus to 255.
This is checked in vl.c

Do we want the 3.0 machine expose more than 255 vcpus, 512 for instance?
I understand this mc->max_cpus is something rather static, that is
refined afterwards.

Note the comment in virt_machine_class_init suggest 255 is the max QEMU
supports but I can see that pc_q35.c sets the max_cpus to 288 already.

Thanks

Eric

>> - VGICv3 KVM device group/attribute:
>>   KVM_DEV_ARM_VGIC_GRP_ADDR/KVM_VGIC_V3_ADDR_TYPE_REDIST_REGION
>>
>> In case the host kernel does not support the registration of several
>> redistributor regions, the GICv3 device initialization fails
>> with a proper error message and qemu exits.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c | 15 ++++++++++++++-
>>  1 file changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index f35962a..8d43c51 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -531,6 +531,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>      SysBusDevice *gicbusdev;
>>      const char *gictype;
>>      int type = vms->gic_version, i;
>> +    uint32_t nb_redist_regions = 0;
>>
>>      gictype = (type == 3) ? gicv3_class_name() : gic_class_name();
>>
>> @@ -546,15 +547,26 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>      }
>>
>>      if (type == 3) {
>> -        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
>> +        nb_redist_regions = virt_gicv3_redist_region_count(vms);
>> +
>> +        qdev_prop_set_uint32(gicdev, "len-redist-region-count",
>> +                             nb_redist_regions);
>>          qdev_prop_set_uint32(gicdev , "redist-region-count[0]",
>>                               vms->memmap[VIRT_GIC_REDIST].size / 0x20000);
>> +
>> +        if (nb_redist_regions == 2) {
>> +            qdev_prop_set_uint32(gicdev , "redist-region-count[1]",
> 
> Stray extra space before comma.
> 
>> +                                 vms->memmap[VIRT_GIC_REDIST2].size / 0x20000);
> 
> This is going to ask for more redistributors than we want (cf
> earlier review comment).
> 
>> +        }
>>      }
>>      qdev_init_nofail(gicdev);
>>      gicbusdev = SYS_BUS_DEVICE(gicdev);
>>      sysbus_mmio_map(gicbusdev, 0, vms->memmap[VIRT_GIC_DIST].base);
>>      if (type == 3) {
>>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_REDIST].base);
>> +        if (nb_redist_regions == 2) {
>> +            sysbus_mmio_map(gicbusdev, 2, vms->memmap[VIRT_GIC_REDIST2].base);
>> +        }
>>      } else {
>>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>>      }
>> @@ -1346,6 +1358,7 @@ static void machvirt_init(MachineState *machine)
>>       */
>>      if (vms->gic_version == 3) {
>>          virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
>> +        virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / 0x20000;
> 
> Slight pity that we can't determine whether we can support multiple
> redistributor regions here, but I guess it's not a big deal.
> 
>>      } else {
>>          virt_max_cpus = GIC_NCPU;
>>      }
>> --
>> 2.5.5
> 
> thanks
> -- PMM
> 
