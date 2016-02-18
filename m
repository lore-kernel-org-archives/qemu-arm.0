Received: by 10.25.208.211 with SMTP id h202csp764384lfg;
        Thu, 18 Feb 2016 10:49:23 -0800 (PST)
X-Received: by 10.140.96.245 with SMTP id k108mr11105220qge.31.1455821363015;
        Thu, 18 Feb 2016 10:49:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 83si9317617qhz.40.2016.02.18.10.49.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 10:49:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:44418 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWTdi-0005EC-IS
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 13:49:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aWTde-0005BH-Ov
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 13:49:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aWTdc-0002oH-Ga
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 13:49:18 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:38603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aWTdb-0002mw-3k
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 13:49:16 -0500
Received: by mail-wm0-x22e.google.com with SMTP id a4so39028954wme.1
	for <qemu-arm@nongnu.org>; Thu, 18 Feb 2016 10:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=ilwRA+YcRt6/bzpjVQmVJURmpNtpp7ADDIph0vArpoQ=;
	b=aKrQV9nY6rE/98zCrS4/j2tF5h7/s1QTTGafzyaSzZrpEnyzxnseJmx764QMYf7bue
	PEWTodeLZehANp4kg87ja4lhLReaAJR8B8/pzjSg8LXCrP+eOnhBC6/8CNKHhF8QkZvW
	wfE9PY/tISGmLaHM0DmS9XSd2ofRTPnpl1JGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ilwRA+YcRt6/bzpjVQmVJURmpNtpp7ADDIph0vArpoQ=;
	b=KPP5XaOiasp4BKnL3skIm8vl7JNG8QRRlgpvmNziNzC9VRizWDpGW87glK9qgDwY6k
	y/81nKyAmCbYNERchN8LhhC10zog1OxLSrGMTn2TDaF5eiCpY7yaDFhdg+56z2C/jzK+
	xtAx/UY47EWXM4oeR9Vu239Gtm8B6nTgD0YpFN9uNjUi9RU46UrdbjwtDRuGdk1CumnM
	wONIgUQH/UEg0/O294LeavuY6ywGJeevovvSBSfSGxUgF4COGR5SNYHEXbvmC201sCwN
	MsdNYNDHvYbkWp+tJLCf53HNZfWnjDy4Bqd7rfB5I1bx7qvil4dECgi3Q9ym+iqBPqjt
	3tBA==
X-Gm-Message-State: AG10YOQOfQL8QD6jno2loIzufsrMGISDsBxIJFWSHDlYto0uQEo1keTqlLbBVDuU4duRNUS3
X-Received: by 10.28.0.86 with SMTP id 83mr5185205wma.63.1455821354390;
	Thu, 18 Feb 2016 10:49:14 -0800 (PST)
Received: from [192.168.2.25] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90]) by smtp.googlemail.com with ESMTPSA id
	i2sm7807382wje.22.2016.02.18.10.49.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Feb 2016 10:49:12 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1454086429-4373-1-git-send-email-eric.auger@linaro.org>
	<1454086429-4373-8-git-send-email-eric.auger@linaro.org>
	<CAFEAcA87ZXSHDE4v5udfWGH15xGGAFNQGBCzm2TcnFEP0LLutg@mail.gmail.com>
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56C6120B.3040005@linaro.org>
Date: Thu, 18 Feb 2016 19:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA87ZXSHDE4v5udfWGH15xGGAFNQGBCzm2TcnFEP0LLutg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Cc: eric.auger@st.com, Pranav Sawargaonkar <pranav.sawargaonkar@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>,
	Bharat Bhushan <Bharat.Bhushan@freescale.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [RFC v2 7/8] hw: arm: virt: register reserved IOVA
	region
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Wf004YWcEdmw

Hi Peter,
On 02/16/2016 07:21 PM, Peter Maydell wrote:
> On 29 January 2016 at 16:53, Eric Auger <eric.auger@linaro.org> wrote:
>> Registers a 16x64kB reserved iova region. Currently this iova
>> region is used by the host kernel to map host MSI controller frames
>> (GICv2m, GITS_TRANSLATER). The host kernel needs this iova window
>> since it cannot program the PCIe device with MSI frame physical
>> address (as opposed to x86) since the MSI write transactions go
>> through the IOMMU.
>>
>> The reserved region is mapped on the platform bus.
> 
> I guess that keeps it neatly out of the way of everybody else :-)
Yes hopefully. The platform bus has its own MMIO allocation scheme.
> 
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>>
>> ---
>>
>> RFC v1 -> RFC v2:
>> - use the platform bus to map the reserved iova region
>> ---
>>  hw/arm/virt.c | 19 ++++++++++++++-----
>>  1 file changed, 14 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 3839c68..4b2a891 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -805,7 +805,7 @@ static void create_pcie_irq_map(const VirtBoardInfo *vbi, uint32_t gic_phandle,
>>  }
>>
>>  static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
>> -                        bool use_highmem)
>> +                        bool use_highmem, MemoryRegion **reserved_reg)
>>  {
>>      hwaddr base_mmio = vbi->memmap[VIRT_PCIE_MMIO].base;
>>      hwaddr size_mmio = vbi->memmap[VIRT_PCIE_MMIO].size;
>> @@ -920,10 +920,16 @@ static void create_pcie(const VirtBoardInfo *vbi, qemu_irq *pic,
>>      qemu_fdt_setprop_cell(vbi->fdt, nodename, "#interrupt-cells", 1);
>>      create_pcie_irq_map(vbi, vbi->gic_phandle, irq, nodename);
>>
>> +    /* initialize the reserved iova region for MSI binding (16 x 64kb) */
>> +    *reserved_reg = g_new0(MemoryRegion, 1);
>> +    memory_region_init_reserved_iova(*reserved_reg, OBJECT(dev),
>> +                                     "reserved-iova",
>> +                                     0x100000, &error_fatal);
> 
> So the only reason this is here is because we need to have a pointer to
> the PCIe controller DeviceState, right?
yes that's correct. currently the PCIe controller is the object that
tracks the reserved region's ref count. I proceeded that way because the
reserved IOVA provision currently is related to PCIe/MSI functionality.

 I think it would be better to
> make create_pcie() return the DeviceState* instead of NULL. Then you
> can either (a) pass the pcie controller pointer into create_platform_bus()
> and have that create and map the reserved iova region, or (b) have a
> separate function to create the reserved iova region. In any case I
> think it fits more naturally with the rest of the platform bus code
> rather than in the PCIe controller creation function.
OK

Another issue is that we currently book an arbitrary 1MB IOVA window
whatever the needs. We are also thinking about extending the VFIO user
API to return the number of reserved iova pages that are requested and
possibly some alignment constraints. Then it becomes more complex since
VFIO devices are instantiated after the machine creation, all the needs
must be collected and consolidated and eventually the reserved iova
region can be created. So I think that code will end up somewhere in a
machine init done notifier ...

Thanks for the review!

Best Regards

Eric
> 
> thanks
> -- PMM
> 

