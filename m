Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp385683wrx;
        Mon, 1 Apr 2019 06:17:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEWj/DAeRE8JC3prMXqZqQ+rR0FKsjcbLar61s6PWMVyJmFbPwqiXpMPpwennM21Lmr0b2
X-Received: by 2002:a81:1a48:: with SMTP id a69mr53208942ywa.507.1554124654606;
        Mon, 01 Apr 2019 06:17:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554124654; cv=none;
        d=google.com; s=arc-20160816;
        b=YNHdQrU8gANglwpBjMQHxHinLBc7SnfntlELO2Va+bHZkXJ5CXws4ddE3Zia00fqCG
         Qkw+DqhOXyCKLgjID34qsZsCSfSLt4U9f2OPgZL9ckA9/jw8wcQ32j0V3Vo+2+wW0lGX
         O8taJuKRZAhhsOwFeWhUW5kGW+Yir6pa8qAV/Emw1LvAxhkRHPqPbWW0nyI2hSfZkClt
         qLOAzUdjgy3uvec9EV+dLf2EVhhc99SJC0cJ6BMzzjbpmfH90x59ijTRpskfC/w2x9po
         jSGToiZH2nYPwcjvYfc8+T96d6HG0caBdqZKe9CfSbqFpacrFZdv6hoDv6DhjVleq9Fe
         E3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=79DIgPrHQmt45H7u4/eYC1GRbR2HLumpRB6sqD+ugdo=;
        b=cBxhiQVIQfGDd/T9j1mm8c6KEhPRmI+Vs23ITS7Js2WomdsQEZ/CYSvdrNLoKHQaDm
         n/tAM4fmoors+eUQGBWQMeGiMJSq9ly02m8rNY5C39bkUH7t3NUIKV4yEAzdH2cO3zo1
         28Yu3Qtr6Aze7raPNwmdujbvZWYVMQHzt2MUntB9/9M71XzDjZcnj5V2p+eBMiTWR8LA
         BEI1kg2Q671dhTSoTq8660hwz1ErBpCb5a5HBOq+Ma0v0e0Y4YDLUauc3Ls5B7U72Me8
         yyA65k9eDLYXdJEb7lR0hF6JZ3Ygdy8hKBDANAT8TOMGjLXb+SQ0e90EpO1HZFRnif0e
         sk7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m188si6117582ywm.159.2019.04.01.06.17.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Apr 2019 06:17:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hAwog-000594-0d
	for alex.bennee@linaro.org; Mon, 01 Apr 2019 09:17:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hAwoL-00056j-Vn
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 09:17:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1hAwoK-0003IP-3t
	for qemu-arm@nongnu.org; Mon, 01 Apr 2019 09:17:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41544)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1hAwoJ-0003HS-MH; Mon, 01 Apr 2019 09:17:12 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6470B5944D;
	Mon,  1 Apr 2019 13:07:21 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-149.rdu2.redhat.com
	[10.10.120.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AAD760BE5;
	Mon,  1 Apr 2019 13:07:08 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
	<CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
	<a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <459862f9-18f7-0a37-dfb9-b8ca9aa6a2d2@redhat.com>
Date: Mon, 1 Apr 2019 15:07:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 01 Apr 2019 13:07:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 07/10] hw/arm/virt: Introduce
 opt-in feature "fdt"
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	Linuxarm <linuxarm@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Y+bQGmp01GBe

On 03/29/19 14:56, Auger Eric wrote:
> Hi Ard,
> 
> On 3/29/19 2:14 PM, Ard Biesheuvel wrote:
>> On Fri, 29 Mar 2019 at 14:12, Auger Eric <eric.auger@redhat.com> wrote:
>>>
>>> Hi Shameer,
>>>
>>> On 3/29/19 10:59 AM, Shameerali Kolothum Thodi wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Auger Eric [mailto:eric.auger@redhat.com]
>>>>> Sent: 29 March 2019 09:32
>>>>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>>>>> qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com;
>>>>> peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
>>>>> sameo@linux.intel.com; sebastien.boeuf@intel.com
>>>>> Cc: Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>;
>>>>> Laszlo Ersek <lersek@redhat.com>; Ard Biesheuvel
>>>>> <ard.biesheuvel@linaro.org>; Leif Lindholm <Leif.Lindholm@arm.com>
>>>>> Subject: Re: [PATCH v3 07/10] hw/arm/virt: Introduce opt-in feature "fdt"
>>>>>
>>>>> Hi Shameer,
>>>>>
>>>>> [ + Laszlo, Ard, Leif ]
>>>>>
>>>>> On 3/21/19 11:47 AM, Shameer Kolothum wrote:
>>>>>> This is to disable/enable populating DT nodes in case
>>>>>> any conflict with acpi tables. The default is "off".
>>>>> The name of the option sounds misleading to me. Also we don't really
>>>>> know the scope of the disablement. At the moment this just aims to
>>>>> prevent the hotpluggable dt nodes from being added if we boot in ACPI mode.
>>>>>
>>>>>>
>>>>>> This will be used in subsequent patch where cold plug
>>>>>> device-memory support is added for DT boot.
>>>>> I am concerned about the fact that in dt mode, by default, you won't see
>>>>> any PCDIMM nodes.
>>>>>>
>>>>>> If DT memory node support is added for cold-plugged device
>>>>>> memory, those memory will be visible to Guest kernel via
>>>>>> UEFI GetMemoryMap() and gets treated as early boot memory.
>>>>> Don't we have an issue in UEFI then. Normally the SRAT indicates whether
>>>>> the slots are hotpluggable or not. Shouldn't the UEFI code look at this
>>>>> info.
>>>>
>>>> Sorry I missed this part. Yes, that will be a more cleaner solution.
>>>>
>>>> Also, to be more clear on what happens,
>>>>
>>>> Guest ACPI boot with "fdt=on" ,
>>>>
>>>> From kernel log,
>>>>
>>>> [    0.000000] Early memory node ranges
>>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bbf5ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bbf60000-0x00000000bbffffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bc000000-0x00000000bc02ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bc030000-0x00000000bc36ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bc370000-0x00000000bf64ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bf650000-0x00000000bf6dffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bf6e0000-0x00000000bf6effff]
>>>> [    0.000000]   node   0: [mem 0x00000000bf6f0000-0x00000000bf80ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bf810000-0x00000000bfffffff]
>>>> [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000ffffffff]  --> This is the hotpluggable memory node from DT.
>>>> [    0.000000] Zeroed struct page in unavailable ranges: 1040 pages
>>>> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000ffffffff]
>>>>
>>>>
>>>> Guest ACPI boot with "fdt=off" ,
>>>>
>>>> [    0.000000] Movable zone start for each node
>>>> [    0.000000] Early memory node ranges
>>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bbf5ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bbf60000-0x00000000bbffffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bc000000-0x00000000bc02ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bc030000-0x00000000bc36ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bc370000-0x00000000bf64ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bf650000-0x00000000bf6dffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bf6e0000-0x00000000bf6effff]
>>>> [    0.000000]   node   0: [mem 0x00000000bf6f0000-0x00000000bf80ffff]
>>>> [    0.000000]   node   0: [mem 0x00000000bf810000-0x00000000bfffffff]
>>>> [    0.000000] Zeroed struct page in unavailable ranges: 1040 pages
>>>> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfffffff
>>>>
>>>> The hotpluggable memory node is absent from early memory nodes here.
>>>
>>> OK thank you for the example illustrating the concern.
>>>>
>>>> As you said, it could be possible to detect this node using SRAT in UEFI.
>>>
>>> Let's wait for EDK2 experts on this.
>>>
>>
>> Happy to chime in, but I need a bit more context here.
>>
>> What is the problem, how does this path try to solve it, and why is
>> that a bad idea?
>>
> Sure, sorry.
> 
> This series:
> - [PATCH v3 00/10] ARM virt: ACPI memory hotplug support,
> https://patchwork.kernel.org/cover/10863301/
> 
> aims to introduce PCDIMM support in qemu. In ACPI mode, it builds the
> SRAT and DSDT parts and relies on GED to trigger the hotplug.
> 
> We noticed that if we build the hotpluggable memory dt nodes on top of
> the above ACPI tables, the DIMM slots are interpreted as not
> hotpluggable memory slots (at least we think so).
> 
> We think the EDK2 GetMemoryMap() uses the dt node info and ignores the
> fact that those slots are exposed as hotpluggable in the SRAT for example.
> 
> So in this series, we are forced to not generate the hotpluggable memory
> dt nodes if we want the DIMM slots to be effectively recognized as
> hotpluggable.
> 
> Could you confirm we have a correct understanding of the EDK2 behaviour
> and if so, would there be any solution for EDK2 to absorb both the DT
> nodes and the relevant SRAT/DSDT tables and make the slots hotpluggable.
> 
> At qemu level, detecting we are booting in ACPI mode and purposely
> removing the above mentioned DT nodes does not look straightforward.

The firmware is not enlightened about the ACPI content that comes from
QEMU / fw_cfg. That ACPI content is *blindly* processed by the firmware,
as instructed through the ACPI linker/loader script, in order to install
the ACPI content for the OS. No actual information is consumed by the
firmware from the ACPI payload -- and that's a feature.

The firmware does consume DT:

- If you start QEMU *with* "-no-acpi", then the DT is both consumed by
the firmware (for its own information needs), and passed on to the OS.

- If you start QEMU *without* "-no-acpi" (the default), then the DT is
consumed only by the firmware (for its own information needs), and the
DT is hidden from the OS. The OS gets only the ACPI content
(processed/prepared as described above).


In the firmware, the "ArmVirtPkg/HighMemDxe" driver iterates over the
base/size pairs in all the memory nodes in the DT. For each such base
address that is currently tracked as "nonexistent" in the GCD memory
space map, the driver currently adds the base/size range as "system
memory". This in turn is reflected by the UEFI memmap that the OS gets
to see as "conventional memory".

If you need some memory ranges to show up as "special" in the UEFI
memmap, then you need to distinguish them somehow from the "regular"
memory areas, in the DT. And then extend "ArmVirtPkg/HighMemDxe" in the
firmware, so that it act upon the discriminator that you set in the DT.


Now... from a brief look at the Platform Init and UEFI specs, my
impression is that the hotpluggable (but presently not plugged) DIMM
ranges should simply be *absent* from the UEFI memmap; is that correct?
(I didn't check the ACPI spec, maybe it specifies the expected behavior
in full.) If my impression is correct, then two options (alternatives)
exist:

(1) Hide the affected memory nodes -- or at least the affected base/size
pairs -- from the DT, in case you boot without "-no-acpi" but with an
external firmware loaded. Then the firmware will not expose those ranges
as "conventional memory" in the UEFI memmap. This approach requires no
changes to edk2.

This option is precisely what Eric described up-thread, at
<http://mid.mail-archive.com/3f0a5793-dd35-a497-2248-8eb0cd3c3a16@redhat.com>:

> in machvirt_init, there is firmware_loaded that tells you whether you
> have a FW image. If this one is not set, you can induce dt. But if
> there is a FW it can be either DT or ACPI booted. You also have the
> acpi_enabled knob.

(The "-no-acpi" cmdline option clears the "acpi_enabled" variable in
"vl.c").

So, the condition for hiding the hotpluggable memory nodes in question
from the DT is:

  (aarch64 && firmware_loaded && acpi_enabled)


(2) Invent and set an "ignore me, firmware" property for the
hotpluggable memory nodes in the DT, and update the firmware to honor
that property.

Thanks
Laszlo
