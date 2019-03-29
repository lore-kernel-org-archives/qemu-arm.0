Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1850632wrx;
        Fri, 29 Mar 2019 06:13:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtuSPQfe/YXjybXuKNly4sz+YKdrhPfSA/xbYSH0ZtpIoQzVVxLXwpvPfuQqhAgqeRQc0/
X-Received: by 2002:a6b:e706:: with SMTP id b6mr35898147ioh.78.1553865183642;
        Fri, 29 Mar 2019 06:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553865183; cv=none;
        d=google.com; s=arc-20160816;
        b=ARl1gYO9O30p7ZGLSsnaI5IBjS1aqP9yJf56enVEQ1O/iGMednIQZD3mzBw2JB0SWl
         sQ7flprX7Cy6+wK0+gPgmH+w55deLC5Q8cTRq+/1Cy+ALUkBL5dkDTpgS5kMKVRE3wym
         WHSy0ahe3H1zXLXdR4SYvBRIva0SbRWJPLuIH6UKfDu4khkc1Dig8MrbhXpKhB5weq4U
         PFnUu8fVQqsUceA99lhbRAl7TePogqIKr10FFEmcVpICZX9t437tbqy9LCNNioOEkIPk
         gVI87bvvZMToklrpcX81kI+97JXTY9Gx7MrrPxm3b1PPf1XwpP9J6XdNm6sz7lqOzsmC
         BhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=I/POHep5wXtdDmsCloNei20bFs4f9cDlAwhah+jeSCA=;
        b=ysn65EGMWSqB+FJ6HTLdEJG+FwwJn3V1ejIPmTSxy8BnSxb3NIs5vB05SnGGXX2lzI
         2ZxZ+Jn9e+TUflwJAZv9sqzdhzSfN25YhtJAjrRPogfdNC3lNSnS5odCTchumRRodbXK
         oSKecf5KIHvai586Gktg2YmQyCEovOBJ/d74qH6O6uFPMGqiw3spd5HvOP+aU3YgBqG7
         rMjmhPYCzeuE8c2nAGso4r7zsM56RGovxOm/UWFw8Fo4hVz3zPiIizl/BIOAOv8HBsrI
         wdnj3LCF3RmfrLBh9jtqByx7vOsW89Xfemo39++pJeDFUJtERhfUI7m/9C6bXnZ63H5A
         vJAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o81si1024762ito.100.2019.03.29.06.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 06:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52774 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9rJe-0001yO-Qv
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 09:13:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9rJT-0001yD-RH
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:12:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9rJS-0007lD-GW
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:12:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:61801)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h9rJS-0007ks-4Z; Fri, 29 Mar 2019 09:12:50 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A09A30820DD;
	Fri, 29 Mar 2019 13:12:49 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 211F5282EE;
	Fri, 29 Mar 2019 13:12:45 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
Date: Fri, 29 Mar 2019 14:12:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 29 Mar 2019 13:12:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
 feature "fdt"
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
Cc: Leif Lindholm <Leif.Lindholm@arm.com>, Laszlo Ersek <lersek@redhat.com>,
	Linuxarm <linuxarm@huawei.com>, "xuwei \(O\)" <xuwei5@huawei.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pb8rtrWkPGMb

Hi Shameer,

On 3/29/19 10:59 AM, Shameerali Kolothum Thodi wrote:
> 
> 
>> -----Original Message-----
>> From: Auger Eric [mailto:eric.auger@redhat.com]
>> Sent: 29 March 2019 09:32
>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>> qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com;
>> peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
>> sameo@linux.intel.com; sebastien.boeuf@intel.com
>> Cc: Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>;
>> Laszlo Ersek <lersek@redhat.com>; Ard Biesheuvel
>> <ard.biesheuvel@linaro.org>; Leif Lindholm <Leif.Lindholm@arm.com>
>> Subject: Re: [PATCH v3 07/10] hw/arm/virt: Introduce opt-in feature "fdt"
>>
>> Hi Shameer,
>>
>> [ + Laszlo, Ard, Leif ]
>>
>> On 3/21/19 11:47 AM, Shameer Kolothum wrote:
>>> This is to disable/enable populating DT nodes in case
>>> any conflict with acpi tables. The default is "off".
>> The name of the option sounds misleading to me. Also we don't really
>> know the scope of the disablement. At the moment this just aims to
>> prevent the hotpluggable dt nodes from being added if we boot in ACPI mode.
>>
>>>
>>> This will be used in subsequent patch where cold plug
>>> device-memory support is added for DT boot.
>> I am concerned about the fact that in dt mode, by default, you won't see
>> any PCDIMM nodes.
>>>
>>> If DT memory node support is added for cold-plugged device
>>> memory, those memory will be visible to Guest kernel via
>>> UEFI GetMemoryMap() and gets treated as early boot memory.
>> Don't we have an issue in UEFI then. Normally the SRAT indicates whether
>> the slots are hotpluggable or not. Shouldn't the UEFI code look at this
>> info.
> 
> Sorry I missed this part. Yes, that will be a more cleaner solution.
> 
> Also, to be more clear on what happens,
> 
> Guest ACPI boot with "fdt=on" ,
> 
> From kernel log,
> 
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bbf5ffff]
> [    0.000000]   node   0: [mem 0x00000000bbf60000-0x00000000bbffffff]
> [    0.000000]   node   0: [mem 0x00000000bc000000-0x00000000bc02ffff]
> [    0.000000]   node   0: [mem 0x00000000bc030000-0x00000000bc36ffff]
> [    0.000000]   node   0: [mem 0x00000000bc370000-0x00000000bf64ffff]
> [    0.000000]   node   0: [mem 0x00000000bf650000-0x00000000bf6dffff]
> [    0.000000]   node   0: [mem 0x00000000bf6e0000-0x00000000bf6effff]
> [    0.000000]   node   0: [mem 0x00000000bf6f0000-0x00000000bf80ffff]
> [    0.000000]   node   0: [mem 0x00000000bf810000-0x00000000bfffffff]
> [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000ffffffff]  --> This is the hotpluggable memory node from DT.
> [    0.000000] Zeroed struct page in unavailable ranges: 1040 pages
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000ffffffff]
> 
> 
> Guest ACPI boot with "fdt=off" ,
> 
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bbf5ffff]
> [    0.000000]   node   0: [mem 0x00000000bbf60000-0x00000000bbffffff]
> [    0.000000]   node   0: [mem 0x00000000bc000000-0x00000000bc02ffff]
> [    0.000000]   node   0: [mem 0x00000000bc030000-0x00000000bc36ffff]
> [    0.000000]   node   0: [mem 0x00000000bc370000-0x00000000bf64ffff]
> [    0.000000]   node   0: [mem 0x00000000bf650000-0x00000000bf6dffff]
> [    0.000000]   node   0: [mem 0x00000000bf6e0000-0x00000000bf6effff]
> [    0.000000]   node   0: [mem 0x00000000bf6f0000-0x00000000bf80ffff]
> [    0.000000]   node   0: [mem 0x00000000bf810000-0x00000000bfffffff]
> [    0.000000] Zeroed struct page in unavailable ranges: 1040 pages
> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfffffff
> 
> The hotpluggable memory node is absent from early memory nodes here.

OK thank you for the example illustrating the concern.
> 
> As you said, it could be possible to detect this node using SRAT in UEFI.

Let's wait for EDK2 experts on this.

Thanks

Eric
> 
> Cheers,
> Shameer
> 
>>> Hence memory becomes non hot-un-unpluggable even if Guest
>>> is booted in ACPI mode.
>>
>>
>>
>>>
>>> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
>>> ---
>>>  hw/arm/virt.c         | 23 +++++++++++++++++++++++
>>>  include/hw/arm/virt.h |  1 +
>>>  2 files changed, 24 insertions(+)
>>>
>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>> index 13db0e9..b602151 100644
>>> --- a/hw/arm/virt.c
>>> +++ b/hw/arm/virt.c
>>> @@ -1717,6 +1717,20 @@ static void virt_set_highmem(Object *obj, bool
>> value, Error **errp)
>>>      vms->highmem = value;
>>>  }
>>>
>>> +static bool virt_get_fdt(Object *obj, Error **errp)
>>> +{
>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>> +
>>> +    return vms->use_fdt;
>>> +}
>>> +
>>> +static void virt_set_fdt(Object *obj, bool value, Error **errp)
>>> +{
>>> +    VirtMachineState *vms = VIRT_MACHINE(obj);
>>> +
>>> +    vms->use_fdt = value;
>>> +}
>>> +
>>>  static bool virt_get_its(Object *obj, Error **errp)
>>>  {
>>>      VirtMachineState *vms = VIRT_MACHINE(obj);
>>> @@ -2005,6 +2019,15 @@ static void virt_instance_init(Object *obj)
>>>      object_property_set_description(obj, "gic-version",
>>>                                      "Set GIC version. "
>>>                                      "Valid values are 2, 3 and host",
>> NULL);
>>> +    /* fdt is disabled by default */
>>> +    vms->use_fdt = false;
>>> +    object_property_add_bool(obj, "fdt", virt_get_fdt,
>>> +                             virt_set_fdt, NULL);
>>> +    object_property_set_description(obj, "fdt",
>>> +                                    "Set on/off to enable/disable
>> device tree "
>>> +                                    "nodes in case any conflict with
>> ACPI"
>> in case of
>>
>> Thanks
>>
>> Eric
>>> +                                    "(eg: device memory node)",
>>> +                                    NULL);
>>>
>>>      vms->highmem_ecam = !vmc->no_highmem_ecam;
>>>
>>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>>> index c5e4c96..14b2e0a 100644
>>> --- a/include/hw/arm/virt.h
>>> +++ b/include/hw/arm/virt.h
>>> @@ -119,6 +119,7 @@ typedef struct {
>>>      bool highmem_ecam;
>>>      bool its;
>>>      bool virt;
>>> +    bool use_fdt;
>>>      int32_t gic_version;
>>>      VirtIOMMUType iommu;
>>>      struct arm_boot_info bootinfo;
>>>
