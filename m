Received: by 10.28.71.155 with SMTP id m27csp125701wmi;
        Tue, 27 Mar 2018 23:54:06 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+HDXbxv76vWTs9SlFZEWZ3DezVM6UWQg3UOHw5U7OswFVlWtMS541tq0//NZzJc/4c+xYm
X-Received: by 10.55.33.37 with SMTP id h37mr3545774qkh.208.1522220046608;
        Tue, 27 Mar 2018 23:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522220046; cv=none;
        d=google.com; s=arc-20160816;
        b=g144tvrEDd/of1wIHwZvKJKsjVnaclJOJuTAqhpN2r62HCxUMu2qmcPkUazAjDShiw
         itkm3AxbEpCuH4pZHgcMpeffNtt1/FXwK5KZ004eX0jDtkXzP6sIVNnUnTLS90GHZpuQ
         nSwEnoXST6KgOHna7hwWCcbeyJKzrmpeQOQ7a8UiMz/vVopOtXJO13ifAL21jBCaKvcO
         6ZzuUBJbW6wXKKqkYkdH46YlAgJn99LgtesEwEjnkSEGzMPYjKJ4I40G1U1bUDLDvaU/
         O6znQe88NQLgtyTUKKaP+PXMuQJzMUkqsxspdSHpydb7gm0bSgSDvtuog9Wagy3oiXet
         fmlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=J9KTlO3sJuOxMQZ2H8nox4Lb07Y/uzKZVhUoKavnYe8=;
        b=RXiLRv1CG74lqtMKjmgHNufF0OKvDRrd0xCRMfe8bZFLM2unDyemaR8SfQY3wNOJKB
         XxBgvDG0Yp4mZj3tEQGchKrhi8i6lSuxFDAs+hGwLB8kh4eq54R/C/iAUF4fC5WlpWFe
         qvjX4qZIAhB9Mvmi8bZraOgw8BDm/D0iAbWBvaS+YjLOhBBjBwgansfTgsLPccDiakZQ
         JlKWGi1FCcG4VoPqDu5QSPZFi/ZoxsvWW+5Jd217brpucEzNznYBPvCs+FXQKDqt62TO
         SCkYAn6twWQ/cf6pASPisMFrEncdcQmW2Hbvc5mWJCRn3rF9qjW4ulemxIvDLqXrmv8R
         Q5Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o29si3304076qtl.366.2018.03.27.23.54.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Mar 2018 23:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37680 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f14yE-0001S4-3g
	for alex.bennee@linaro.org; Wed, 28 Mar 2018 02:54:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f14sI-0005DZ-7m
	for qemu-devel@nongnu.org; Wed, 28 Mar 2018 02:47:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1f14sH-0004jx-9i
	for qemu-devel@nongnu.org; Wed, 28 Mar 2018 02:47:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52318 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1f14s9-0004fq-OS; Wed, 28 Mar 2018 02:47:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5236740704B6;
	Wed, 28 Mar 2018 06:47:43 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89CDE2026DFD;
	Wed, 28 Mar 2018 06:47:37 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1522160122-10744-1-git-send-email-eric.auger@redhat.com>
	<1522160122-10744-9-git-send-email-eric.auger@redhat.com>
	<5ABB13BC.8060809@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <578156db-afbd-a4d7-3899-ec96e2cfd8fb@redhat.com>
Date: Wed, 28 Mar 2018 08:47:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5ABB13BC.8060809@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Wed, 28 Mar 2018 06:47:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Wed, 28 Mar 2018 06:47:44 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-devel] [RFC 8/8] hw/arm/virt: Allow up to 512 vcpus along
 with KVM VGICv3
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: wei@redhat.com, marc.zyngier@arm.com, drjones@redhat.com, cdall@kernel.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8zqbL73SNv3G

Hi Shannon,

On 28/03/18 06:02, Shannon Zhao wrote:
> 
> 
> On 2018/3/27 22:15, Eric Auger wrote:
>> With KVM acceleration and if KVM VGICV3 supports to set multiple
>> redistributor regions, we now allow up to 512 vcpus.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c         | 17 ++++++++++++++++-
>>  include/hw/arm/virt.h |  1 +
>>  2 files changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 8258f6f..cdb1a75 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -149,8 +149,10 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_PCIE_PIO] =           { 0x3eff0000, 0x00010000 },
>>      [VIRT_PCIE_ECAM] =          { 0x3f000000, 0x01000000 },
>>      [VIRT_MEM] =                { 0x40000000, RAMLIMIT_BYTES },
>> +    /* Allows 512 - 123 additional vcpus (each 2x64kB) */
>> +    [VIRT_GIC_REDIST2] =        { 0x4000000000ULL, 0x30A0000LL },
> One concern that this will limit the guest ram size to RAMLIMIT_BYTES.
> If we want to support larger ram size in the future, this may be a problem.
There is comment before  #define RAMLIMIT_GB 255
saying that RAM extension should rather happen at 2TB base.
"../.. We don't want to fill all the way up to 512GB with RAM because
 * we might want it for non-RAM purposes later"

This REDIST2 region could also be allocated at the top of the [256GB -
512GB] region.

I will start working on extending the RAM as suggested by this comment.

Thanks

Eric

> 
>>      /* Second PCIe window, 512GB wide at the 512GB boundary */
>> -    [VIRT_PCIE_MMIO_HIGH] =   { 0x8000000000ULL, 0x8000000000ULL },
>> +    [VIRT_PCIE_MMIO_HIGH] =     { 0x8000000000ULL, 0x8000000000ULL },
>>  };
>>  
>>  static const int a15irqmap[] = {
>> @@ -553,6 +555,11 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>>          agcc->register_redist_region((GICv3State *)gicdev,
>>                                   vms->memmap[VIRT_GIC_REDIST].base,
>>                                   vms->memmap[VIRT_GIC_REDIST].size >> 17);
>> +        if (vms->smp_cpus > 123) {
>> +            agcc->register_redist_region((GICv3State *)gicdev,
>> +                     vms->memmap[VIRT_GIC_REDIST2].base,
>> +                                 vms->memmap[VIRT_GIC_REDIST2].size >> 17);
>> +        }
>>      } else {
>>          sysbus_mmio_map(gicbusdev, 1, vms->memmap[VIRT_GIC_CPU].base);
>>      }
>> @@ -1284,6 +1291,14 @@ static void machvirt_init(MachineState *machine)
>>       */
>>      if (vms->gic_version == 3) {
>>          virt_max_cpus = vms->memmap[VIRT_GIC_REDIST].size / 0x20000;
>> +        if (kvm_max_vcpus(kvm_state) > 255) {
>> +            /*
>> +             * VGICv3 KVM device capability to set multiple redistributor
>> +             * was introduced at the same time KVM_MAX_VCPUS was bumped
>> +             * from 255 to 512
>> +             */
>> +            virt_max_cpus += vms->memmap[VIRT_GIC_REDIST2].size / 0x20000;
>> +        }
>>      } else {
>>          virt_max_cpus = GIC_NCPU;
>>      }
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index d168291..801a4ad 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -60,6 +60,7 @@ enum {
>>      VIRT_GIC_V2M,
>>      VIRT_GIC_ITS,
>>      VIRT_GIC_REDIST,
>> +    VIRT_GIC_REDIST2,
>>      VIRT_UART,
>>      VIRT_MMIO,
>>      VIRT_RTC,
>>
> 
