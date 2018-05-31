Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5586481wre;
        Wed, 30 May 2018 23:52:50 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLFvjWPt+LQ3+sjc/0Sgs9ZB+lNqNJak/xvqzUCvz22t2J5Czu6aQV0sEklB30NJNRq37M5
X-Received: by 2002:a0c:8b4b:: with SMTP id d11-v6mr1375742qvc.241.1527749570345;
        Wed, 30 May 2018 23:52:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527749570; cv=none;
        d=google.com; s=arc-20160816;
        b=ELURD4401HVxEM3JtkC/9+/RMmRQwxX9kIcOPkr67Ro7PkIrlt/b+77P/siB91jBjs
         2nwdL09G0TtiVbO5lCfWB39Vq5Hs9a/aY7VrIWwZaDPkc9KKoB7rHCILeL5kaeYCVzvO
         cDK2ZjMu2YBAEbKAust+VxvhbGFDJJj7qlPdLM17JCph3ffOLPhcbe4dhI29ToW2Iycw
         L2Ra5dRlapavxVdg1y/i8j4yU9P9E11sRMU/MaXmBAAuZdph+1zn6y6iaUi/WbylEHwF
         wdFRvy8bmtrHR+x/bKPieWR5mb+ecQkUvly9FmBCVgLslhA3WEqrfEJgdfwnsm5OFJQN
         C6zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=QnpNVInu2wdvkJTQizqYtKeCGmYd4eD0D9tQm1PgtN4=;
        b=osEgKL3ltht10ZzLF4NWWfDBirjNjZyQCmSP2/SwpiquAnXuk7RLn+lxq0q1qlx3eW
         l8qzxJDXP9gAlx7nP375d37jK3l2iOtgTeEUx210WwjkYZNjZ0Oq6T2SPttL9qdNW0Fh
         VsZ8cAOT/CK3birt4z6ePfVWbeHrrmu5/pdGXx3INgOieS9d0b3gRjGiXomlHYYsQNoh
         UYPaQdeipWBs6MBm/GxZlAQHDCg+sG1sfhUnd/OxaEpjfGr8vnyjd/RyjShjN4fuKbev
         dUZ3vS3iIP5bsVQ72gjUlP25mlmxfyxAKLoZC77sk387ZTK+t9kMniC45qABWCfrOQmX
         ek6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y17-v6si1554948qkb.70.2018.05.30.23.52.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 23:52:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42233 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOHS5-0006JX-UR
	for alex.bennee@linaro.org; Thu, 31 May 2018 02:52:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOHRv-0006J6-20
	for qemu-arm@nongnu.org; Thu, 31 May 2018 02:52:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fOHRq-0003Pg-4t
	for qemu-arm@nongnu.org; Thu, 31 May 2018 02:52:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:44414 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fOHRp-0003PC-V0; Thu, 31 May 2018 02:52:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39CED406E8A1;
	Thu, 31 May 2018 06:52:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75FF3200A4B6;
	Thu, 31 May 2018 06:52:31 +0000 (UTC)
To: Laszlo Ersek <lersek@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <1527690380-9782-1-git-send-email-eric.auger@redhat.com>
	<1527690380-9782-3-git-send-email-eric.auger@redhat.com>
	<273bb69a-a463-7fbe-edb0-a87622556afb@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <4ae11498-ff5f-b018-62cc-1ab1dbf5b415@redhat.com>
Date: Thu, 31 May 2018 08:52:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <273bb69a-a463-7fbe-edb0-a87622556afb@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 31 May 2018 06:52:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 31 May 2018 06:52:33 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/arm/virt: Add virt-3.0
 machine type
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
Cc: drjones@redhat.com, zhaoshenglong@huawei.com, ard.biesheuvel@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xk4gJWo8V76/



On 05/30/2018 06:18 PM, Laszlo Ersek wrote:
> On 05/30/18 16:26, Eric Auger wrote:
>> Add virt-3.0 machine type.
>>
>> This machine type supports highmem 256MB ECAM by default.
>> This feature is disabled for earlier machine types and
>> if highmem is off.
>>
>> The high 256MB ECAM region is chosen instead of the legacy
>> 16MB one if the machine type allows it, if highmem is set
>> (LPAE supported by the guest) and (!firmware_loaded || aarch64).
>> Indeed aarch32 mode FW may not support this high ECAM region.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> RFC -> v1
>> - check firmware_loaded and aarch64 value
>> - do all the computation in machvirt_init
>> ---
>>  hw/arm/virt.c         | 31 ++++++++++++++++++++++++++++---
>>  include/hw/arm/virt.h |  1 +
>>  2 files changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d4247d0..83c2b5a 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1275,6 +1275,7 @@ static void machvirt_init(MachineState *machine)
>>      int n, virt_max_cpus;
>>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>> +    bool aarch64 = true;
>>  
>>      /* We can probe only here because during property set
>>       * KVM is not available yet
>> @@ -1389,6 +1390,8 @@ static void machvirt_init(MachineState *machine)
>>          numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
>>                            &error_fatal);
>>  
>> +        aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
>> +
>>          if (!vms->secure) {
>>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>>          }
>> @@ -1447,6 +1450,8 @@ static void machvirt_init(MachineState *machine)
>>          create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hd(1));
>>      }
>>  
>> +    vms->highmem_ecam &= vms->highmem && (!firmware_loaded || aarch64);
>> +
>>      create_rtc(vms, pic);
>>  
>>      create_pcie(vms, pic);
>> @@ -1697,7 +1702,7 @@ static void machvirt_machine_init(void)
>>  }
>>  type_init(machvirt_machine_init);
>>  
>> -static void virt_2_12_instance_init(Object *obj)
>> +static void virt_3_0_instance_init(Object *obj)
>>  {
>>      VirtMachineState *vms = VIRT_MACHINE(obj);
>>      VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>> @@ -1740,6 +1745,8 @@ static void virt_2_12_instance_init(Object *obj)
>>                                      "Set GIC version. "
>>                                      "Valid values are 2, 3 and host", NULL);
>>  
>> +    vms->highmem_ecam = vmc->no_highmem_ecam ? false : true;
>> +
> 
> I think this should be written as:
> 
>     vms->highmem_ecam = !vmc->no_highmem_ecam;
sure ;-)
> 
> With that change:
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Thank you for the early feedbacks.

Eric
> 
> Obviously the series has to be reviewed by others as well.
> 
> Thanks!
> Laszlo
> 
> 
>>      if (vmc->no_its) {
>>          vms->its = false;
>>      } else {
>> @@ -1765,10 +1772,28 @@ static void virt_2_12_instance_init(Object *obj)
>>      vms->irqmap = a15irqmap;
>>  }
>>  
>> -static void virt_machine_2_12_options(MachineClass *mc)
>> +static void virt_machine_3_0_options(MachineClass *mc)
>>  {
>>  }
>> -DEFINE_VIRT_MACHINE_AS_LATEST(2, 12)
>> +DEFINE_VIRT_MACHINE_AS_LATEST(3, 0)
>> +
>> +#define VIRT_COMPAT_2_12 \
>> +    HW_COMPAT_2_12
>> +
>> +static void virt_2_12_instance_init(Object *obj)
>> +{
>> +    virt_3_0_instance_init(obj);
>> +}
>> +
>> +static void virt_machine_2_12_options(MachineClass *mc)
>> +{
>> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
>> +
>> +    virt_machine_3_0_options(mc);
>> +    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_12);
>> +    vmc->no_highmem_ecam = true;
>> +}
>> +DEFINE_VIRT_MACHINE(2, 12)
>>  
>>  #define VIRT_COMPAT_2_11 \
>>      HW_COMPAT_2_11
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index e9423a7..10a5c71 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -95,6 +95,7 @@ typedef struct {
>>      bool no_pmu;
>>      bool claim_edge_triggered_timers;
>>      bool smbios_old_sys_ver;
>> +    bool no_highmem_ecam;
>>  } VirtMachineClass;
>>  
>>  typedef struct {
>>
> 
> 
