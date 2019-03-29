Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1884051wrx;
        Fri, 29 Mar 2019 06:42:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6XA7+loEK2cnZmfYr+hQ055IBZZDjd3NMptgNpIDPiDEJ1anUcoSoKKFJQunxYcVpxWFb
X-Received: by 2002:a02:b5f3:: with SMTP id y48mr21948492jaj.122.1553866934583;
        Fri, 29 Mar 2019 06:42:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553866934; cv=none;
        d=google.com; s=arc-20160816;
        b=eigtZEVxNWDTtX5EnC8rosW3aiiDv14F6ontzfO4bhvfQqL/7j5VhcSyttQ4vYKtAr
         bnKp57+KgV69+koX2r5ujGUBFf9rMFaRD6Zfw3FEcmsLe1hmOV5pX/zh3g+lQ5+09I4d
         OkfEj9ASxuj0GitUAWOjKMdmd1kcLbjmHXeeHpr0z7UWtBmlsB2UsbmTY9FZUehR4ru0
         U5+t7xUNeXSrmhWq+lOpVk6WBMgw3/juiOqAmU/SmSeaJ2Ny4lo9EXY3vJSSveDz2XVg
         u8DbC7qTs8Thy28zoRUCCERsuoUBF+OqCwd3m9UIuLiEpr2LfDxH9CTEiueB3lMDwbep
         QbcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=rWozuLDneKyM7+pviN7x/dhDeSvaNH3+6eroudi30vc=;
        b=h29er4e7YcRsRTw58+4UJhs1AQ56FWH6ttPOmpezUeJN0DMZQUQbi6VDHId2BwqdfG
         gQVC6Mf8MvTa0MglMjrABNwrJphlRBDunVw+S4YvG3pbWiudWvnH4AnsUxy+naJokhET
         gUUx01eDjnkXPGxIU+EYBcTE5D+IktTqkKhdCFH6+IGIpYB/xHcGb0dEt/b+vDTTCIoL
         Zp5u1JGDK/vBI2D16l2VLVq3ArwcOnTDNnSfXJfLWfSYJmo38O4CSAtJ0qrGBgTTGl1q
         Vw8xrURJk5/cdgYqiIngyatw33FhBwmiLq37DbjHGxZWnfiWoHqsO+0pL/a98RP3VWix
         +ebg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si1056680itb.118.2019.03.29.06.42.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 06:42:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53112 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9rlt-0007Jz-Qs
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 09:42:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9rll-0007Jh-Px
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:42:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9rlk-0002xP-Ho
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:42:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38844)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h9rlk-0002x4-62; Fri, 29 Mar 2019 09:42:04 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D972B31524E3;
	Fri, 29 Mar 2019 13:42:02 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4395283190;
	Fri, 29 Mar 2019 13:41:57 +0000 (UTC)
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839338308@lhreml524-mbs.china.huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <3f0a5793-dd35-a497-2248-8eb0cd3c3a16@redhat.com>
Date: Fri, 29 Mar 2019 14:41:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA839338308@lhreml524-mbs.china.huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 29 Mar 2019 13:42:03 +0000 (UTC)
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
X-TUID: lOOYC5GAC8ZC

Hi Shameer,
On 3/29/19 10:41 AM, Shameerali Kolothum Thodi wrote:
> Hi Eric,
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
> 
> Yes, I was not very happy with the name "fdt". If this is not useful other than
> this device memory conflict case, then we can be more specific. But I am not sure
> we might need this for any other future conflicts, hence a more generic name. 
> 
> May be "force_fdt" or "dimm_fdt"? I am open to suggestions.
mask_spurious_dt_nodes. But I am unsure this is the way we should go.
> 
>>>
>>> This will be used in subsequent patch where cold plug
>>> device-memory support is added for DT boot.
>> I am concerned about the fact that in dt mode, by default, you won't see
>> any PCDIMM nodes.
> 
> True. But is there any other way to detect that the Guest is using DT?
I don't know any

in machvirt_init, there is firmware_loaded that tells you whether you
have a FW image. If this one is not set, you can induce dt. But if there
is a FW it can be either DT or ACPI booted. You also have the
acpi_enabled knob.

Thanks

Eric
> 
> Thanks,
> Shameer
> 
>>> If DT memory node support is added for cold-plugged device
>>> memory, those memory will be visible to Guest kernel via
>>> UEFI GetMemoryMap() and gets treated as early boot memory.
>> Don't we have an issue in UEFI then. Normally the SRAT indicates whether
>> the slots are hotpluggable or not. Shouldn't the UEFI code look at this
>> info.
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
