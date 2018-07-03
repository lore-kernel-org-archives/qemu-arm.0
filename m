Received: by 2002:a4f:9ad8:0:0:0:0:0 with SMTP id b85-v6csp1545276ivh;
        Tue, 3 Jul 2018 12:32:59 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdLBMvv7ycRtKUwQxvwYzhdPo0CLnGPt2/Q+6NB2vFXzX3KweI1uJ1lHz9JY0lwRd7HeMON
X-Received: by 2002:a0c:93dc:: with SMTP id g28-v6mr27350106qvg.153.1530646379708;
        Tue, 03 Jul 2018 12:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530646379; cv=none;
        d=google.com; s=arc-20160816;
        b=Ktw3bNqywR+BpOkWw0uzngXxVixJGXAus19S6YpN2Ap2lPtMmskFzh4874vjC7ii3y
         zriOggbQJ9pil+Dnj5wP1tU/X7hq4lQWIaqCfM8WmukF6kocxsDOnTKIKqd1bBSpC6hJ
         eNCM/dKFVX7LM/YkOj06sqBpISGg49vSxlJceovj4gZ0W2omX5OHV5bpCBqVwO2y9qHo
         fTyeTWVQa1oXDpoLYiLFq465vXz0tFjOLfW0g3hmpMWsgoBBI7ByGle+RJ8cPCBcZ2ON
         AH8yTpWSA7vN4+w8E4jSLN5Q9lG+g3Kn/UqTnZtrfr9sl5XsYAgiQL8vE8uZxHvbO2Xr
         9paw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=pPeozpbiSxBgSx3zsWB5+fEyR9uIRLqF3xc83W3dvOo=;
        b=t+LL9rR6bTuw57XP/DEgh83J3xDmNCqoWwfXRXqe+FEdnDCglKHpkgxsup+aLemG3a
         8bzfZtIDHn9fSaLlggzhfJ0T2MMtl+OAfxImfvi2FFwbrPLFEFUyFYTKIT0LMmFxw4jC
         wOy/61t8+a5OsatsFtPMvR51nrPPgB3u2f+LnWCQlgRDndwAGUCXVZSPeF6cgngdLymd
         t2YFpnhSIYQzQkZKXCTxo9/nDagyJpgH+0rxgRdFVBg+9X2XX5knZCdqdGvYZvd+Eevv
         xsbMBK9mCfq/FFTd9Fsof51qhIREW+RgqUEJuvuJs2cSeCneN7f41Ih9WymULtE2NIoU
         7yag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d23-v6si1691299qtp.373.2018.07.03.12.32.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 12:32:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faR2p-0008Jl-Bh
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 15:32:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faR2j-0008JA-Ue
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 15:32:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1faR2f-0003a5-14
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 15:32:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:42782 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1faR2e-0003a1-RT; Tue, 03 Jul 2018 15:32:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 233B140131BF;
	Tue,  3 Jul 2018 19:32:48 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E4BA8111AF3F;
	Tue,  3 Jul 2018 19:32:41 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, imammedo@redhat.com
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<1530602398-16127-6-git-send-email-eric.auger@redhat.com>
	<8495014b-5811-4f4f-5af3-d065cd6561b7@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <2513e4a9-8980-6274-b933-a5e107b32da5@redhat.com>
Date: Tue, 3 Jul 2018 21:32:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <8495014b-5811-4f4f-5af3-d065cd6561b7@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 03 Jul 2018 19:32:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 03 Jul 2018 19:32:48 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 05/15] hw/arm/virt: handle
 max_vm_phys_shift conflicts on migration
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
Cc: agraf@suse.de, drjones@redhat.com, dgilbert@redhat.com,
	david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6gu67vuQS3gF

Hi David,
On 07/03/2018 08:41 PM, David Hildenbrand wrote:
> On 03.07.2018 09:19, Eric Auger wrote:
>> When migrating a VM, we must make sure the destination host
>> supports as many IPA bits as the source. Otherwise the migration
>> must fail.
>>
>> We add a VMState infrastructure to machvirt. On pre_save(),
>> the current source max_vm_phys_shift is saved.
>>
>> On destination, we cannot use this information when creating the
>> VM. The VM is created using the max value reported by the
>> destination host - or the kvm_type inherited value -. However on
>> post_load() we can check that this value is compatible with the
>> source saved value.
> 
> Just wondering, how exactly is the guest able to detect the 42b (e.g. vs
> 42b) configuration?

the source IPA size is saved in the VMState. When restoring it on
post_load we check against the current IPA size (corresponding to the
max the destination KVM does support). The destination IPA size is
chosen before creating the destination VM. If the destination IPA size
is less than the source IPA size, we fail the migration.

Hope this helps

Thanks

Eric

> 
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/virt.c         | 37 +++++++++++++++++++++++++++++++++++++
>>  include/hw/arm/virt.h |  2 ++
>>  2 files changed, 39 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 04a32de..5a4d0bf 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1316,6 +1316,40 @@ static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>>      return arm_cpu_mp_affinity(idx, clustersz);
>>  }
>>  
>> +static int virt_post_load(void *opaque, int version_id)
>> +{
>> +    VirtMachineState *vms = (VirtMachineState *)opaque;
>> +
>> +    if (vms->max_vm_phys_shift < vms->source_max_vm_phys_shift) {
>> +        error_report("This host kernel only supports %d IPA bits whereas "
>> +                     "the guest requires %d GPA bits", vms->max_vm_phys_shift,
>> +                     vms->source_max_vm_phys_shift);
>> +        return -1;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int virt_pre_save(void *opaque)
>> +{
>> +    VirtMachineState *vms = (VirtMachineState *)opaque;
>> +
>> +    vms->source_max_vm_phys_shift = vms->max_vm_phys_shift;
>> +    return 0;
>> +}
>> +
>> +static const VMStateDescription vmstate_virt = {
>> +    .name = "virt",
>> +    .version_id = 1,
>> +    .minimum_version_id = 1,
>> +    .post_load = virt_post_load,
>> +    .pre_save = virt_pre_save,
>> +    .fields = (VMStateField[]) {
>> +        VMSTATE_INT32(source_max_vm_phys_shift, VirtMachineState),
>> +        VMSTATE_END_OF_LIST()
>> +    },
>> +};
>> +
>> +
>>  static void machvirt_init(MachineState *machine)
>>  {
>>      VirtMachineState *vms = VIRT_MACHINE(machine);
>> @@ -1537,6 +1571,7 @@ static void machvirt_init(MachineState *machine)
>>  
>>      vms->machine_done.notify = virt_machine_done;
>>      qemu_add_machine_init_done_notifier(&vms->machine_done);
>> +    vmstate_register(NULL, 0, &vmstate_virt, vms);
>>  }
>>  
>>  static bool virt_get_secure(Object *obj, Error **errp)
>> @@ -1727,6 +1762,7 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>>  
>>  static int virt_kvm_type(MachineState *ms, const char *type_str)
>>  {
>> +    VirtMachineState *vms = VIRT_MACHINE(ms);
>>      int max_vm_phys_shift, ret = 0;
>>      uint64_t type;
>>  
>> @@ -1747,6 +1783,7 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
>>      }
>>      ret = max_vm_phys_shift;
>>  out:
>> +    vms->max_vm_phys_shift = (max_vm_phys_shift > 0) ? ret : 40;
>>      return ret;
>>  }
>>  
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 1a90ffc..91f6de2 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -125,6 +125,8 @@ typedef struct {
>>      uint32_t iommu_phandle;
>>      int psci_conduit;
>>      char *kvm_type;
>> +    int32_t max_vm_phys_shift;
>> +    int32_t source_max_vm_phys_shift;
>>  } VirtMachineState;
>>  
>>  #define VIRT_ECAM_ID(high) (high ? VIRT_PCIE_ECAM_HIGH : VIRT_PCIE_ECAM)
>>
> 
> 
