Received: by 10.25.0.147 with SMTP id 141csp697391lfa;
        Tue, 21 Feb 2017 13:57:57 -0800 (PST)
X-Received: by 10.55.81.194 with SMTP id f185mr26725804qkb.153.1487714277679;
        Tue, 21 Feb 2017 13:57:57 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s58si4643508qtb.238.2017.02.21.13.57.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 13:57:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48758 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgIRX-0005jb-3Y
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 16:57:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1cgIRS-0005jS-4P
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 16:57:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1cgIRO-0007Y9-8S
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 16:57:50 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47292)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <okaya@codeaurora.org>)
	id 1cgIRN-0007Xh-UT; Tue, 21 Feb 2017 16:57:46 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 4542260BDF; Tue, 21 Feb 2017 21:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487714264;
	bh=2Q+iohgQmvt4o9ao22LcxP0darzzgQPl8tvMS/Y0ue8=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=DGdBW7jgFCKhsnnQPVjAkHWD+Nshi2S9yVMZ1vFHnoLUIR29TvGWng4wRk0GEjQAL
	J0Z4QRbmYxjlhlI9T1/vbBY3xezeEwnEFQVeI86TfDes2lCC9kTKjrOd+FyP9c7waR
	GFhlG6ki65SAC3YzlC1m9EZ8Fob9CBSQ4Iu7Y4A0=
Received: from [10.228.68.95] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: okaya@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 2EC8A60BDF;
	Tue, 21 Feb 2017 21:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487714263;
	bh=2Q+iohgQmvt4o9ao22LcxP0darzzgQPl8tvMS/Y0ue8=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=Xs6+Aq9KPjWQNI8Hg3MVCcOXGPvCn8CgCY1an/vSrU8TcjJKNGqyyqlFajNzEeuxJ
	LNeQIw2iMF4yHymxIN53sEN11m5DHqencdiy6E/mBuGKv//J7OIFpVYkAskUnxPQPI
	B114gRDU8D8xXC+ZgHNpGYa5kRkQf53QH03UychA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2EC8A60BDF
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=okaya@codeaurora.org
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com, qemu-arm@nongnu.org, 
	qemu-devel@nongnu.org
References: <1487683100-16013-1-git-send-email-eric.auger@redhat.com>
	<1487683100-16013-2-git-send-email-eric.auger@redhat.com>
	<98d4d9e8-761c-76f9-ecb0-c5a4a658dfab@codeaurora.org>
	<2dcc9002-ec06-c55e-c0a2-75d05fe05762@redhat.com>
	<970561bf-0adc-4f60-bf2b-57bbafabb0aa@codeaurora.org>
	<8d790f60-6ee6-9b48-6dfc-524532db112b@redhat.com>
	<a9ed1831-5a1c-5c27-25b0-71d06c7dee2e@codeaurora.org>
	<b248aa6f-2cb7-05ba-54f2-ba1be0fa6775@redhat.com>
From: Sinan Kaya <okaya@codeaurora.org>
Message-ID: <f7bc2429-fc6a-8444-3c1b-6a1f896a0756@codeaurora.org>
Date: Tue, 21 Feb 2017 16:57:41 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <b248aa6f-2cb7-05ba-54f2-ba1be0fa6775@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-arm] [PATCH 1/2] vfio/platform: make the vfio-platform
 device non abstract
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
Cc: pelcan@codeaurora.org, vikrams@codeaurora.org, shankerd@codeaurora.org,
	agraf@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YRhCbS0oD8z7

Hi Eric,

On 2/21/2017 4:04 PM, Auger Eric wrote:
> Hi Sinan,
> 
> On 21/02/2017 16:34, Sinan Kaya wrote:
>> On 2/21/2017 10:23 AM, Auger Eric wrote:
>>>> Note that the goal is to be able to instantiate any platform device by just
>>>> passing a compatible string and the object from the host. We don't want
>>>> to make changes to QEMU every time somebody comes up with a new platform device.
>>>> This step is unnecessary.
>>> Well we need to generate a device tree node for your device. We have not
>>> proven yet the function that creates this latter can be generic. There
>>> are some helpers that can read the host dt node, copy some properties
>>> from the host to the guest. But still at the moment we can't make things
>>> as generic as PCIe and this is why the platform passthrough still is
>>> controversial. So this patch aims at lowering the integration efforts
>>> but minimal specialization needs to be done in sysbus-fdt. Same on
>>> kernel side with the reset module.
>>
>> Understood. You need to bring in the entire device tree parameters for a full-blown
>> solution. We can always treat this as a TODO.
>>
>> I was more interested in simple devices like XHCI, AHCI, HIDMA where there
>> is no platform device attribute besides the interrupt number and memory
>> resources. QEMU already has access to these.
>>
>> I was hoping to cover this at least. More complex objects need their own
>> implementation like the AMD driver in your example.
>>
>> I'm pasting my comment from the archives here. 
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03267.html
> With respect to the compatible string we have 2 strategies: either
> 1) the user passes it along the -device option line or
> 2) qemu retrieves it in the host dt and applies the same on guest side.
> 
> I currently implemented 1)

That works.

> 
> Then assuming the above mentioned devices have very basic dt nodes
> (compatible, reg, interrupts) we could imagine to copy the host property
> into the guest device tree. But looking at

I like that idea. Just copy compatible, reg and interrupts. Don't take
anything else.

> 
> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/usb/usb-xhci.txt
> 
> there can be optional properties which are much more complex to handle
> (clocks for instance).

This is really what is needed to make USB working on a server. 

usb@f0931000 {
	compatible = "generic-xhci";
	reg = <0xf0931000 0x8c8>;
	interrupts = <0x0 0x4e 0x0>;
};

If an implementation needs clocks or anything else, then it is not supported
by what I'm proposing. That HW implementation needs their own driver.

> 
> We could potentially have a minimalist node creation function that
> examines the host dt node and in case it only contains compat, reg,
> interrupts (and maybe dma_coherent) copies those on guest side. In case
> other properties exist and no specialized node creation function exists
> qemu would abort.

Yes, this is also what I was suggesting.

> 
> Same for AHCI:
> 
> http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/ata/ahci-platform.txt
> 

This is all we need for SATA on a server. 

	I0_SATA: sata@0xFF88000000 {
		compatible ="generic-ahci";
		reg = <0xFF 0x88000000 0x0 0x200>;
		interrupts = <0 (745-32) 0>;
		dma-coherent;
	}; 


> HIDMA (https://patchwork.kernel.org/patch/8168281/) also seem to have
> non trivial properties which would require a custom node creation function.
> 

HIDMA documentation is confusing due to multiple drivers (Management and the DMA
channel). We are only doing virtualization on a DMA channel. 

http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/dma/qcom_hidma_mgmt.txt

This is all guest machine needs for HIDMA. The other parameters are optional
and can be passed via kernel command line.

 hidma_24: dma-controller@0x5c050000 {
	compatible = "qcom,hidma-1.0";
	reg = <0 0x5c050000 0x0 0x1000>,
		<0 0x5c0b0000 0x0 0x1000>;
	interrupts = <0 389 0>;
 };

> So I think this definitively deserves more discussions and agreements
> upstream before starting more time consuming developments. This is not
> for 2.9 anyway so I will move the series into an RFC.

Sure, I don't mind discussions. I'm focused on my server use cases where most
of the clocks/phys etc. are managed by the platform firmware. The platform 
devices are as simple as describing the name, interrupt and register base
addresses.

If somebody needs more than compatible, reg and interrupts; then they
definitely need their own driver. 

Sinan

-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
