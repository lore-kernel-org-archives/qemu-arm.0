Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp427812wrx;
        Fri, 1 Mar 2019 01:46:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqyK248dNTeABaDiaUupqts2F4LcgGcyp9kgnfEjYyjLz3EKKO3/7I0xuonrbijg1L4N5yHa
X-Received: by 2002:a81:3b96:: with SMTP id i144mr2766381ywa.155.1551433573126;
        Fri, 01 Mar 2019 01:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551433573; cv=none;
        d=google.com; s=arc-20160816;
        b=rT6sPu9EKfHeE6bojaAiz+kb3qT1T2q5nbR8aaTJR4s6QPd6VPvJvsbUsPbePEgqp9
         rAJqiQvwKE7xsxWuhH9qMR+2mPo7/vvAbjK0bGzqz/5i1tjoCG+wM5UFXoiQnEg+ruXD
         6imChfXMct0uooNsREtJY9fzQffPEVU9QKFwXYiE4GPcXFj3ceud10zJNoP51/2pZa1k
         dWgUAp8FCgqYAlZqQRji2FuvKHO5YorB2PmVXamEvLnZpWsA8Un+gTQEtlbffRgC+Pvc
         NBqU2hNYADRMsSz7+jx6sYVBBtofzCBY+uEZ1zUb4zY37n/s8+LtV7I37MIqF2BQ7J9y
         5wkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=2mV/q2ncI8bgRrgL7EYLlqFLBD6kdnn6qjVdzQ2wKe4=;
        b=U0hQkBSJf4XPeMn3h1Oyf20ALD7dCCZZ/of4AkVUckzk6qcJTPpkDmZ+NEzAfFBD1/
         t6fvLpvVi+bxvhJfVd1VocvC/3J6xgxC+oLFr9f/5YcHnqqpMyIT14SVddc/uwI7OCQY
         m7ri/p3FVS1d69hcaGBzIhuXV/lxq/DinUyIZU819rGPBy6YipdIO4Reg1x2Cas+xvkP
         kEOyYyOkl3Wa3WAPAv7QtoVDaK2V9LPPXxgwzoE7gspJttGsd3U6t/tn7BxGYCaLLbOu
         RX/iwZ47XwVAccsg1dbKtM9zodzYs3K9e43wgP0vLMAKn7kz1wHhDhYVwaIA6LBqNCzI
         nFrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o6si12084605ybp.451.2019.03.01.01.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 01:46:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzek8-0007Mj-H4
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 04:46:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzeja-0007KU-L9
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 04:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gzejZ-0008AL-M1
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 04:45:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34403)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gzejW-00088q-Ut; Fri, 01 Mar 2019 04:45:35 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5CF94310FB92;
	Fri,  1 Mar 2019 09:45:33 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 750371948B;
	Fri,  1 Mar 2019 09:45:28 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
	<20190228150324.25973-9-eric.auger@redhat.com>
	<20190228171942.28f2f953@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <19619943-cc2c-da93-fffc-8156a4eee069@redhat.com>
Date: Fri, 1 Mar 2019 10:45:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190228171942.28f2f953@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 01 Mar 2019 09:45:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v10 08/10] hw/arm/virt: Implement kvm_type
 function for 4.0 machine
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O4tfxRDIz24R

Hi Igor,

On 2/28/19 5:19 PM, Igor Mammedov wrote:
> On Thu, 28 Feb 2019 16:03:22 +0100
> Eric Auger <eric.auger@redhat.com> wrote:
> 
>> This patch implements the machine class kvm_type() callback.
>> It returns the number of bits requested to implement the whole GPA
>> range including the RAM and IO regions located beyond.
>> The returned value in passed though the KVM_CREATE_VM ioctl and
>> this allows KVM to set the stage2 tables dynamically.
>>
>> To compute the highest GPA used in the memory map, kvm_type()
>> must freeze the memory map by calling virt_set_memmap().
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>> v7 -> v8:
>> - remove vmc->no_extended_memmap and vms->extended_memmap
>>
>> v6 -> v7:
>> - Introduce RAMBASE and rename add LEGACY_ prefix in that patch
>> - use local variables with explicit names in virt_set_memmap:
>>   device_memory_base, device_memory_size
>> - add an extended_memmap field in the class
>>
>> v5 -> v6:
>> - add some comments
>> - high IO region cannot start before 256GiB
>> ---
>>  hw/arm/virt.c | 39 ++++++++++++++++++++++++++++++++++++++-
>>  1 file changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index d7aa7d3f9d..7a158571b7 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1439,7 +1439,13 @@ static void machvirt_init(MachineState *machine)
>>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>>      bool aarch64 = true;
>>  
>> -    virt_set_memmap(vms);
>> +    /*
>> +     * In accelerated mode, the memory map is computed in kvm_type()
> s/in/earlier in/
> 
>> +     * to create a VM with the right number of IPA bits.
>> +     */
>> +    if (!kvm_enabled()) {
> maybe check not for KVM but for vms->memmap == NULL
> so it would match with comment and be clear that we initializing memmap
> because nobody else did it yet.
> 
>> +        virt_set_memmap(vms);
>> +    }
>>  
>>      /* We can probe only here because during property set
>>       * KVM is not available yet
>> @@ -1828,6 +1834,36 @@ static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *machine,
>>      return NULL;
>>  }
>>  
>> +/*
>> + * for arm64 kvm_type [7-0] encodes the requested number of bits
>> + * in the IPA address space
>> + */
>> +static int virt_kvm_type(MachineState *ms, const char *type_str)
>> +{
>> +    VirtMachineState *vms = VIRT_MACHINE(ms);
>> +    int max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms);
>> +    int requested_pa_size;
>> +
>> +    /* we freeze the memory map to compute the highest gpa */
>> +    virt_set_memmap(vms);
>> +
> 
>> +    requested_pa_size = 64 - clz64(vms->highest_gpa);
>> +
>> +    if (requested_pa_size > max_vm_pa_size) {
>> +        error_report("-m and ,maxmem option values "
>> +                     "require an IPA range (%d bits) larger than "
>> +                     "the one supported by the host (%d bits)",
>> +                     requested_pa_size, max_vm_pa_size);
>> +       exit(1);
>> +    }
> this part is recurring pattern, is it worth using a helper function?
in TCG mode the message is different because this issue stems from the
fact the VCPU does not support a large enough PA range whereas here the
host kernel does not support large enough IPA. So I tend to keep the
code as is.

Thanks

Eric
> 
>> +    /*
>> +     * By default we return 0 which corresponds to an implicit legacy
>> +     * 40b IPA setting. Otherwise we return the actual requested PA
>> +     * logsize
>> +     */
>> +    return requested_pa_size > 40 ? requested_pa_size : 0;
>> +}
>> +
>>  static void virt_machine_class_init(ObjectClass *oc, void *data)
>>  {
>>      MachineClass *mc = MACHINE_CLASS(oc);
>> @@ -1852,6 +1888,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>>      mc->cpu_index_to_instance_props = virt_cpu_index_to_props;
>>      mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
>>      mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
>> +    mc->kvm_type = virt_kvm_type;
>>      assert(!mc->get_hotplug_handler);
>>      mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
>>      hc->plug = virt_machine_device_plug_cb;
> 
