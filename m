Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp11336325wrx;
        Tue, 26 Feb 2019 09:54:10 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZExqSvqSt6lZyXFqa4VHuS442vJQUBKxlGb07Txft5x+iVDT98h8hBJEFQhNT4vxn85TRI
X-Received: by 2002:a81:a186:: with SMTP id y128mr19355013ywg.172.1551203650587;
        Tue, 26 Feb 2019 09:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551203650; cv=none;
        d=google.com; s=arc-20160816;
        b=E7slHK4CW23j2mZVm3bZiIwcA82XJXKWpT8A3G730OmjYdxHxHr0fpGRwlQxo5g2yY
         N25rM5ghJQz6vAiv5mxw15cLRMmER3TU3HMQjPJxh0XllG0Xd34rgTWwDbxyhETMJBEu
         ONq4ORMHduswsV+1oUMa3p8ipUMlErlg/5T9PEQ1eB2uFsF0ZZ3ysdJpYl0A16QB33YN
         Q/gZD+bZa91uryEF+0Tz6WYtxMgpVxeNGGH7UlwFDWzAYV5OuXI9KMg34E01nCNzUN+A
         vYeBCJrBLQTY9UBRbs7Ozw2WqKBOgOfFNvWnIx3FYjX0ftTXN9QCo/NVOXnvDsQHornZ
         tSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=hnvQuWJ0NJTTZLOJNDHTbsn+PsFtTj2JCuA7tBX/wek=;
        b=HnLoGiz71NGoBlsiU0U6vjdvBiInWyRHU4/X5OR7mBJuuL9bptytOSkL4dzs0HP1tB
         oHDeAw3w+gk496K1AUEiV+dUntCfX9mh7kTQ+K2B4TI/h6FCE6ru7ErZm4WdYSA4ag2M
         RsgtCTwnElc2jt5OYhfVI0DZuowP9q701dDEshybvjX8gHYeBzdA3GhICBKi4cmT07PC
         pjWJziPxF3X6qZ8/XFjeSWzADtsXg1PHhmZqF+2PSH8C0L6TLM9kag+PbDDn+u3RQKYn
         /8BPH29Bx0KAhGW67d5f5wbcVH9X2urWtvPF45nlzE+KyeK3XUbxUbb3KSHwAQ5mLbZZ
         GsQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18si7292936ywo.22.2019.02.26.09.54.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Feb 2019 09:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59118 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gygvi-0006uK-3U
	for alex.bennee@linaro.org; Tue, 26 Feb 2019 12:54:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gygvY-0006uF-28
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 12:54:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1gygvN-00035n-8f
	for qemu-arm@nongnu.org; Tue, 26 Feb 2019 12:53:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1gygvM-0002SF-RR; Tue, 26 Feb 2019 12:53:49 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 01B8B81F13;
	Tue, 26 Feb 2019 17:53:29 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EBEA5D9D1;
	Tue, 26 Feb 2019 17:53:25 +0000 (UTC)
To: Igor Mammedov <imammedo@redhat.com>
References: <20190220224003.4420-1-eric.auger@redhat.com>
	<20190222172742.18c3835a@redhat.com>
	<c016024e-9f4b-8953-f492-8802675f7e22@redhat.com>
	<20190225104212.7d40e65e@Igors-MacBook-Pro.local>
	<70249194-349e-37f6-0e8d-dc50b39082b7@redhat.com>
	<cd283485-49a9-ddd1-a020-26110ee093be@redhat.com>
	<20190226175653.6ca2b6c4@Igors-MacBook-Pro.local>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c68ba5a2-0d24-c1ad-c2af-c957768abf9f@redhat.com>
Date: Tue, 26 Feb 2019 18:53:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190226175653.6ca2b6c4@Igors-MacBook-Pro.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 26 Feb 2019 17:53:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 00/17] ARM virt: Initial RAM
 expansion and PCDIMM/NVDIMM support
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
	dgilbert@redhat.com, qemu-arm@nongnu.org,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PJck/56804mw

Hi Igor,

On 2/26/19 5:56 PM, Igor Mammedov wrote:
> On Tue, 26 Feb 2019 14:11:58 +0100
> Auger Eric <eric.auger@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> On 2/26/19 9:40 AM, Auger Eric wrote:
>>> Hi Igor,
>>>
>>> On 2/25/19 10:42 AM, Igor Mammedov wrote:
>>>> On Fri, 22 Feb 2019 18:35:26 +0100
>>>> Auger Eric <eric.auger@redhat.com> wrote:
>>>>
>>>>> Hi Igor,
>>>>>
>>>>> On 2/22/19 5:27 PM, Igor Mammedov wrote:
>>>>>> On Wed, 20 Feb 2019 23:39:46 +0100
>>>>>> Eric Auger <eric.auger@redhat.com> wrote:
>>>>>>
>>>>>>> This series aims to bump the 255GB RAM limit in machvirt and to
>>>>>>> support device memory in general, and especially PCDIMM/NVDIMM.
>>>>>>>
>>>>>>> In machvirt versions < 4.0, the initial RAM starts at 1GB and can
>>>>>>> grow up to 255GB. From 256GB onwards we find IO regions such as the
>>>>>>> additional GICv3 RDIST region, high PCIe ECAM region and high PCIe
>>>>>>> MMIO region. The address map was 1TB large. This corresponded to
>>>>>>> the max IPA capacity KVM was able to manage.
>>>>>>>
>>>>>>> Since 4.20, the host kernel is able to support a larger and dynamic
>>>>>>> IPA range. So the guest physical address can go beyond the 1TB. The
>>>>>>> max GPA size depends on the host kernel configuration and physical CPUs.
>>>>>>>
>>>>>>> In this series we use this feature and allow the RAM to grow without
>>>>>>> any other limit than the one put by the host kernel.
>>>>>>>
>>>>>>> The RAM still starts at 1GB. First comes the initial ram (-m) of size
>>>>>>> ram_size and then comes the device memory (,maxmem) of size
>>>>>>> maxram_size - ram_size. The device memory is potentially hotpluggable
>>>>>>> depending on the instantiated memory objects.
>>>>>>>
>>>>>>> IO regions previously located between 256GB and 1TB are moved after
>>>>>>> the RAM. Their offset is dynamically computed, depends on ram_size
>>>>>>> and maxram_size. Size alignment is enforced.
>>>>>>>
>>>>>>> In case maxmem value is inferior to 255GB, the legacy memory map
>>>>>>> still is used. The change of memory map becomes effective from 4.0
>>>>>>> onwards.
>>>>>>>
>>>>>>> As we keep the initial RAM at 1GB base address, we do not need to do
>>>>>>> invasive changes in the EDK2 FW. It seems nobody is eager to do
>>>>>>> that job at the moment.
>>>>>>>
>>>>>>> Device memory being put just after the initial RAM, it is possible
>>>>>>> to get access to this feature while keeping a 1TB address map.
>>>>>>>
>>>>>>> This series reuses/rebases patches initially submitted by Shameer
>>>>>>> in [1] and Kwangwoo in [2] for the PC-DIMM and NV-DIMM parts.
>>>>>>>
>>>>>>> Functionally, the series is split into 3 parts:
>>>>>>> 1) bump of the initial RAM limit [1 - 9] and change in
>>>>>>>    the memory map
>>>>>>
>>>>>>> 2) Support of PC-DIMM [10 - 13]
>>>>>> Is this part complete ACPI wise (for coldplug)? I haven't noticed
>>>>>> DSDT AML here no E820 changes, so ACPI wise pc-dimm shouldn't be
>>>>>> visible to the guest. It might be that DT is masking problem
>>>>>> but well, that won't work on ACPI only guests.
>>>>>
>>>>> guest /proc/meminfo or "lshw -class memory" reflects the amount of mem
>>>>> added with the DIMM slots.
>>>> Question is how does it get there? Does it come from DT or from firmware
>>>> via UEFI interfaces?
>>>>
>>>>> So it looks fine to me. Isn't E820 a pure x86 matter?
>>>> sorry for misleading, I've meant is UEFI GetMemoryMap().
>>>> On x86, I'm wary of adding PC-DIMMs to E802 which then gets exposed
>>>> via UEFI GetMemoryMap() as guest kernel might start using it as normal
>>>> memory early at boot and later put that memory into zone normal and hence
>>>> make it non-hot-un-pluggable. The same concerns apply to DT based means
>>>> of discovery.
>>>> (That's guest issue but it's easy to workaround it not putting hotpluggable
>>>> memory into UEFI GetMemoryMap() or DT and let DSDT describe it properly)
>>>> That way memory doesn't get (ab)used by firmware or early boot kernel stages
>>>> and doesn't get locked up.
>>>>
>>>>> What else would you expect in the dsdt?
>>>> Memory device descriptions, look for code that adds PNP0C80 with _CRS
>>>> describing memory ranges
>>>
>>> OK thank you for the explanations. I will work on PNP0C80 addition then.
>>> Does it mean that in ACPI mode we must not output DT hotplug memory
>>> nodes or assuming that PNP0C80 is properly described, it will "override"
>>> DT description?
>>
>> After further investigations, I think the pieces you pointed out are
>> added by Shameer's series, ie. through the build_memory_hotplug_aml()
>> call. So I suggest we separate the concerns: this series brings support
>> for DIMM coldplug. hotplug, including all the relevant ACPI structures
>> will be added later on by Shameer.
> 
> Maybe we should not put pc-dimms in DT for this series until it gets clear
> if it doesn't conflict with ACPI in some way.

I guess you mean removing the DT hotpluggable memory nodes only in ACPI
mode? Otherwise you simply remove the DIMM feature, right?

I double checked and if you remove the hotpluggable memory DT nodes in
ACPI mode:
- you do not see the PCDIMM slots in guest /proc/meminfo anymore. So I
guess you're right, if the DT nodes are available, that memory is
considered as not unpluggable by the guest.
- You can see the NVDIMM slots using ndctl list -u. You can mount a DAX
system.

Hotplug/unplug is clearly not supported by this series and any attempt
results in "memory hotplug is not supported". Is it really an issue if
the guest does not consider DIMM slots as not hot-unpluggable memory? I
am not even sure the guest kernel would support to unplug that memory.

In case we want all ACPI tables to be ready for making this memory seen
as hot-unpluggable we need some Shameer's patches on top of this series.

Also don't DIMM slots already make sense in DT mode. Usually we accept
to add one feature in DT and then in ACPI. For instance we can benefit
from nvdimm in dt mode right? So, considering an incremental approach I
would be in favour of keeping the DT nodes.

Thanks

Eric
> 
> 
> 
> 
