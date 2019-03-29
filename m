Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1898785wrx;
        Fri, 29 Mar 2019 06:56:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyBKMWwfAIWsU1TEkxrVeYerFI6L49iMFBmC67XlN0INHgnTJ2mEzyFPnqkL3L+170J+Cll
X-Received: by 2002:a05:660c:38e:: with SMTP id x14mr4595429itj.146.1553867799734;
        Fri, 29 Mar 2019 06:56:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553867799; cv=none;
        d=google.com; s=arc-20160816;
        b=idGFc5J2XyWl7I5PgimHu+Wnyy6ZadPT7VYVEQ5etXiJxwJTMx6Zo00ybhKe0Sw1U/
         7SziZaHO/cgyBp0Vdbg0p3Lwgjvt9sCugh22nH8UX036uyvhHBM3mA7bYIWlv+8buCIu
         Xlb55+jLTMTZdzGA+4UbH4UCEeAu0DWrY91HX0VeSJFDyY6xUvWC6Z4nipSf5AGdivy0
         LOy11i9Ir2pbtmbDrA6h9VfGf2LuE+BYU0bYci93AZHPSI60cG+e6ifqv2LZvvVYWZmA
         qv+1worv7TXR5uqifMbDY6LAS6HR4DD3l3X/ajGWqbgfe2DBbMXq/4GVx8mt3Q4DzcA2
         JOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=3+Vq/1pxT4ZwN1E2BZel/LAdgg7tPG6x40zI2qFts5w=;
        b=tes2s6NGtBjebexRk1wYCTSe2uzWxhyDXdL/b0PF61naP/819SSaahxbyvpyoc5vLw
         iEibKoram+JG8lrDZuM54dUZ7ToeJI39F3OKz/AK9t63feHrWHwMZv0iFQNw2NDTomIa
         PJA2SyCAxGmEIeha0dpHHBzdDqYd4/Y4rdqwZ+HZQS6n2RsoElUwHzbvOcL0KebxHA/P
         Ip4G/7LZGrkz/HtTFOfNzpq2TQXmNbM1qp5O2/6YS849PzkZCWMKGYfpWL8gDp4gG0/L
         dENV5fcCq8nR1BS/ljUPW/CG4JzdQE5ooOg0gI2+T+UiozYiQ6bmWik2fyZeaq7VfvyY
         BJHg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15si1031778jaf.51.2019.03.29.06.56.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 06:56:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53288 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9rzq-0007TO-Vl
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 09:56:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9rze-0007Rq-BN
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:56:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9rzc-0001fF-Hb
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 09:56:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58507)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h9rzc-0001dC-3w; Fri, 29 Mar 2019 09:56:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 013FB6697A;
	Fri, 29 Mar 2019 13:56:20 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70D9F61B76;
	Fri, 29 Mar 2019 13:56:16 +0000 (UTC)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
	<98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA83933836A@lhreml524-mbs.china.huawei.com>
	<0dcd3f3c-15c4-318f-28bd-4b6706708c0d@redhat.com>
	<CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <a2c37d40-e2ee-e7aa-3f34-ab39a9a6449d@redhat.com>
Date: Fri, 29 Mar 2019 14:56:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu_-nRqeCT0s6ZwW+q3=sbGmtazFJ9R=19U5SJ=gSUmJLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 29 Mar 2019 13:56:20 +0000 (UTC)
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
	Laszlo Ersek <lersek@redhat.com>, Leif Lindholm <Leif.Lindholm@arm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t56wAz1qKP4/

Hi Ard,

On 3/29/19 2:14 PM, Ard Biesheuvel wrote:
> On Fri, 29 Mar 2019 at 14:12, Auger Eric <eric.auger@redhat.com> wrote:
>>
>> Hi Shameer,
>>
>> On 3/29/19 10:59 AM, Shameerali Kolothum Thodi wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Auger Eric [mailto:eric.auger@redhat.com]
>>>> Sent: 29 March 2019 09:32
>>>> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>;
>>>> qemu-devel@nongnu.org; qemu-arm@nongnu.org; imammedo@redhat.com;
>>>> peter.maydell@linaro.org; shannon.zhaosl@gmail.com;
>>>> sameo@linux.intel.com; sebastien.boeuf@intel.com
>>>> Cc: Linuxarm <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>;
>>>> Laszlo Ersek <lersek@redhat.com>; Ard Biesheuvel
>>>> <ard.biesheuvel@linaro.org>; Leif Lindholm <Leif.Lindholm@arm.com>
>>>> Subject: Re: [PATCH v3 07/10] hw/arm/virt: Introduce opt-in feature "fdt"
>>>>
>>>> Hi Shameer,
>>>>
>>>> [ + Laszlo, Ard, Leif ]
>>>>
>>>> On 3/21/19 11:47 AM, Shameer Kolothum wrote:
>>>>> This is to disable/enable populating DT nodes in case
>>>>> any conflict with acpi tables. The default is "off".
>>>> The name of the option sounds misleading to me. Also we don't really
>>>> know the scope of the disablement. At the moment this just aims to
>>>> prevent the hotpluggable dt nodes from being added if we boot in ACPI mode.
>>>>
>>>>>
>>>>> This will be used in subsequent patch where cold plug
>>>>> device-memory support is added for DT boot.
>>>> I am concerned about the fact that in dt mode, by default, you won't see
>>>> any PCDIMM nodes.
>>>>>
>>>>> If DT memory node support is added for cold-plugged device
>>>>> memory, those memory will be visible to Guest kernel via
>>>>> UEFI GetMemoryMap() and gets treated as early boot memory.
>>>> Don't we have an issue in UEFI then. Normally the SRAT indicates whether
>>>> the slots are hotpluggable or not. Shouldn't the UEFI code look at this
>>>> info.
>>>
>>> Sorry I missed this part. Yes, that will be a more cleaner solution.
>>>
>>> Also, to be more clear on what happens,
>>>
>>> Guest ACPI boot with "fdt=on" ,
>>>
>>> From kernel log,
>>>
>>> [    0.000000] Early memory node ranges
>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bbf5ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bbf60000-0x00000000bbffffff]
>>> [    0.000000]   node   0: [mem 0x00000000bc000000-0x00000000bc02ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bc030000-0x00000000bc36ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bc370000-0x00000000bf64ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bf650000-0x00000000bf6dffff]
>>> [    0.000000]   node   0: [mem 0x00000000bf6e0000-0x00000000bf6effff]
>>> [    0.000000]   node   0: [mem 0x00000000bf6f0000-0x00000000bf80ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bf810000-0x00000000bfffffff]
>>> [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000ffffffff]  --> This is the hotpluggable memory node from DT.
>>> [    0.000000] Zeroed struct page in unavailable ranges: 1040 pages
>>> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000ffffffff]
>>>
>>>
>>> Guest ACPI boot with "fdt=off" ,
>>>
>>> [    0.000000] Movable zone start for each node
>>> [    0.000000] Early memory node ranges
>>> [    0.000000]   node   0: [mem 0x0000000040000000-0x00000000bbf5ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bbf60000-0x00000000bbffffff]
>>> [    0.000000]   node   0: [mem 0x00000000bc000000-0x00000000bc02ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bc030000-0x00000000bc36ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bc370000-0x00000000bf64ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bf650000-0x00000000bf6dffff]
>>> [    0.000000]   node   0: [mem 0x00000000bf6e0000-0x00000000bf6effff]
>>> [    0.000000]   node   0: [mem 0x00000000bf6f0000-0x00000000bf80ffff]
>>> [    0.000000]   node   0: [mem 0x00000000bf810000-0x00000000bfffffff]
>>> [    0.000000] Zeroed struct page in unavailable ranges: 1040 pages
>>> [    0.000000] Initmem setup node 0 [mem 0x0000000040000000-0x00000000bfffffff
>>>
>>> The hotpluggable memory node is absent from early memory nodes here.
>>
>> OK thank you for the example illustrating the concern.
>>>
>>> As you said, it could be possible to detect this node using SRAT in UEFI.
>>
>> Let's wait for EDK2 experts on this.
>>
> 
> Happy to chime in, but I need a bit more context here.
> 
> What is the problem, how does this path try to solve it, and why is
> that a bad idea?
> 
Sure, sorry.

This series:
- [PATCH v3 00/10] ARM virt: ACPI memory hotplug support,
https://patchwork.kernel.org/cover/10863301/

aims to introduce PCDIMM support in qemu. In ACPI mode, it builds the
SRAT and DSDT parts and relies on GED to trigger the hotplug.

We noticed that if we build the hotpluggable memory dt nodes on top of
the above ACPI tables, the DIMM slots are interpreted as not
hotpluggable memory slots (at least we think so).

We think the EDK2 GetMemoryMap() uses the dt node info and ignores the
fact that those slots are exposed as hotpluggable in the SRAT for example.

So in this series, we are forced to not generate the hotpluggable memory
dt nodes if we want the DIMM slots to be effectively recognized as
hotpluggable.

Could you confirm we have a correct understanding of the EDK2 behaviour
and if so, would there be any solution for EDK2 to absorb both the DT
nodes and the relevant SRAT/DSDT tables and make the slots hotpluggable.

At qemu level, detecting we are booting in ACPI mode and purposely
removing the above mentioned DT nodes does not look straightforward.

Hope this clarifies

Thanks

Eric
