Received: by 10.103.98.197 with SMTP id w188csp563084vsb;
        Tue, 21 Feb 2017 13:09:36 -0800 (PST)
X-Received: by 10.55.124.7 with SMTP id x7mr27432701qkc.149.1487711375960;
        Tue, 21 Feb 2017 13:09:35 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c4si8503799qtb.33.2017.02.21.13.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 13:09:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48589 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgHgj-0003B4-FJ
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 16:09:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgHcP-0007Ot-KT
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 16:05:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1cgHcL-0007Rh-9d
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 16:05:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45426)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1cgHcL-0007RU-27; Tue, 21 Feb 2017 16:05:01 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 26D7E83F3E;
	Tue, 21 Feb 2017 21:05:01 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1LL4uG6002603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 21 Feb 2017 16:04:58 -0500
To: Sinan Kaya <okaya@codeaurora.org>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, alex.williamson@redhat.com,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1487683100-16013-1-git-send-email-eric.auger@redhat.com>
	<1487683100-16013-2-git-send-email-eric.auger@redhat.com>
	<98d4d9e8-761c-76f9-ecb0-c5a4a658dfab@codeaurora.org>
	<2dcc9002-ec06-c55e-c0a2-75d05fe05762@redhat.com>
	<970561bf-0adc-4f60-bf2b-57bbafabb0aa@codeaurora.org>
	<8d790f60-6ee6-9b48-6dfc-524532db112b@redhat.com>
	<a9ed1831-5a1c-5c27-25b0-71d06c7dee2e@codeaurora.org>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <b248aa6f-2cb7-05ba-54f2-ba1be0fa6775@redhat.com>
Date: Tue, 21 Feb 2017 22:04:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a9ed1831-5a1c-5c27-25b0-71d06c7dee2e@codeaurora.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 21 Feb 2017 21:05:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: TRW36aEVHsW+

Hi Sinan,

On 21/02/2017 16:34, Sinan Kaya wrote:
> On 2/21/2017 10:23 AM, Auger Eric wrote:
>>> Note that the goal is to be able to instantiate any platform device by just
>>> passing a compatible string and the object from the host. We don't want
>>> to make changes to QEMU every time somebody comes up with a new platform device.
>>> This step is unnecessary.
>> Well we need to generate a device tree node for your device. We have not
>> proven yet the function that creates this latter can be generic. There
>> are some helpers that can read the host dt node, copy some properties
>> from the host to the guest. But still at the moment we can't make things
>> as generic as PCIe and this is why the platform passthrough still is
>> controversial. So this patch aims at lowering the integration efforts
>> but minimal specialization needs to be done in sysbus-fdt. Same on
>> kernel side with the reset module.
> 
> Understood. You need to bring in the entire device tree parameters for a full-blown
> solution. We can always treat this as a TODO.
> 
> I was more interested in simple devices like XHCI, AHCI, HIDMA where there
> is no platform device attribute besides the interrupt number and memory
> resources. QEMU already has access to these.
> 
> I was hoping to cover this at least. More complex objects need their own
> implementation like the AMD driver in your example.
> 
> I'm pasting my comment from the archives here. 
> 
> https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03267.html
With respect to the compatible string we have 2 strategies: either
1) the user passes it along the -device option line or
2) qemu retrieves it in the host dt and applies the same on guest side.

I currently implemented 1)

Then assuming the above mentioned devices have very basic dt nodes
(compatible, reg, interrupts) we could imagine to copy the host property
into the guest device tree. But looking at

http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/usb/usb-xhci.txt

there can be optional properties which are much more complex to handle
(clocks for instance).

We could potentially have a minimalist node creation function that
examines the host dt node and in case it only contains compat, reg,
interrupts (and maybe dma_coherent) copies those on guest side. In case
other properties exist and no specialized node creation function exists
qemu would abort.

Same for AHCI:

http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/ata/ahci-platform.txt

HIDMA (https://patchwork.kernel.org/patch/8168281/) also seem to have
non trivial properties which would require a custom node creation function.

So I think this definitively deserves more discussions and agreements
upstream before starting more time consuming developments. This is not
for 2.9 anyway so I will move the series into an RFC.

Thanks

Eric
> 
> "Why submit a new SATA AHCI driver for QEMU just to set the compat string?"
> 
> 
>>
>> Thanks
>>
>> Eric
>>
>>
> 
> 
