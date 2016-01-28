Received: by 10.55.129.195 with SMTP id c186csp300212qkd;
        Thu, 28 Jan 2016 02:20:59 -0800 (PST)
X-Received: by 10.55.74.141 with SMTP id x135mr2434579qka.20.1453976459612;
        Thu, 28 Jan 2016 02:20:59 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si11487502qgj.56.2016.01.28.02.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jan 2016 02:20:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:55107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aOjhD-00080k-5w
	for alex.bennee@linaro.org; Thu, 28 Jan 2016 05:20:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOjh8-0007z0-6b
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 05:20:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOjh2-0003WE-MA
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 05:20:54 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:35068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@linaro.org>) id 1aOjh1-0003Vw-Cj
	for qemu-arm@nongnu.org; Thu, 28 Jan 2016 05:20:48 -0500
Received: by mail-wm0-x22d.google.com with SMTP id r129so17651251wmr.0
	for <qemu-arm@nongnu.org>; Thu, 28 Jan 2016 02:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=IqoR5cdQUUGGUYSltJ8mwXYTznSedzwzFFIH8HFx4Gk=;
	b=Y5gIML9n8usvws7DONPS+5/ScCqSyzsp9SbivollEp25rqOZrFdfaCW9YIW3pbJUur
	kYCHR3SfHLDwbI2mVjDWXQhhL+9eNjTuxxQ+OE4ab7rpCmFO7bF1nFHft8IcnxmHU0Eb
	YSQdvXRvh6jIypOVK0kA8ObrpTsUV1Gv9DWIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=IqoR5cdQUUGGUYSltJ8mwXYTznSedzwzFFIH8HFx4Gk=;
	b=GxWnVdc0au6wm1fKb/CMNhs8t6zB8gsehCtp842V+0E0FReaIAQ+2PB+rUSLdfb7M/
	Daasm2PTuoWNKRU1gqJ/wYNtt4x8+4J7gvGnTP5KN036Jpxfb+APv9aGuh/EByZimn4s
	SYFS9qbJdOAEvPlRN+VcpaTikCDhsm6WSB/UQhoDFa/aNk5+SAEFz21Oh5icOUcLqoit
	3yw0daGlMRIVamzTkT5K9hfpj6tMSqh+WeH1JA+mUuD1B/2YAbaW3geIejBWm57VD79C
	aV7kNcK7QpTmkIMp6KsNkc4VQu3Ln6cPxPgTP/Vvig/Km601CIRwixGPqqsR1RvbiAYX
	3cZw==
X-Gm-Message-State: AG10YORjdZvC5UN++ek60Gxsw4eEjC99d/N4hUbU1suuvRvUEJSDUREQsnejsPEVpQi9gu4q
X-Received: by 10.28.23.73 with SMTP id 70mr2087038wmx.37.1453976446763;
	Thu, 28 Jan 2016 02:20:46 -0800 (PST)
Received: from [192.168.2.12] (LMontsouris-657-1-37-90.w80-11.abo.wanadoo.fr.
	[80.11.198.90]) by smtp.googlemail.com with ESMTPSA id
	qs1sm10296337wjc.2.2016.01.28.02.20.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jan 2016 02:20:45 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1453902715-25304-1-git-send-email-eric.auger@linaro.org>
	<1453902715-25304-7-git-send-email-eric.auger@linaro.org>
	<CAFEAcA9_wR=0+Mbq-7CiQAUSphRrLB70c4MeoDawpMUzbPHLQg@mail.gmail.com>
From: Eric Auger <eric.auger@linaro.org>
Message-ID: <56A9EB6B.4020905@linaro.org>
Date: Thu, 28 Jan 2016 11:20:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9_wR=0+Mbq-7CiQAUSphRrLB70c4MeoDawpMUzbPHLQg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Cc: eric.auger@st.com, pranav.sawargaonkar@gmail.com,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>,
	Bharat Bhushan <Bharat.Bhushan@freescale.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>
Subject: Re: [Qemu-arm] [RFC 6/7] hw: arm: virt: register reserved IOVA
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
X-TUID: 4rbVjXQQpPvD

On 01/28/2016 11:10 AM, Peter Maydell wrote:
> On 27 January 2016 at 13:51, Eric Auger <eric.auger@linaro.org> wrote:
>> Registers a 16x64kB reserved iova region. Currently this iova
>> region is used by the kernel to map host MSI controller frames
>> (GICv2m, GITS_TRANSLATER).
> 
> Do you mean the host kernel or the guest kernel? The host
> kernel should be keeping its paws out of the guest's
> address space, and the guest kernel can manage the memory
> and the address space any way it likes, I would have thought.
> It's not clear to me what this is for.
I meant the host kernel.

If we do not do anything, the host VFIO-PCI driver programs the PCI
device with host GICv2m MSI frame host physical address (as an example).
Since it goes through the sMMU and there is no mapping defined, this
faults. So the idea of this series is that the guest provides some
unused guest PA = IOVA. This window can be used by the host VFIO-PCI
driver to transparently create an IOVA/ host GICv2 MSI frame mapping.
That way the PCI device is programmed with this IOVA and this eventually
reaches the host GICv2m MSI frame physical page.

Hope it clarifies.

> 
>> Signed-off-by: Eric Auger <eric.auger@linaro.org>
>> ---
>>  hw/arm/virt.c         | 10 ++++++++++
>>  include/hw/arm/virt.h |  1 +
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 3839c68..7eaf8be 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -125,6 +125,7 @@ static const MemMapEntry a15memmap[] = {
>>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>> +    [VIRT_RESERVED] =           { 0x0be00000, 0x00100000 },
>>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
> 
> You've put the new entry between the VIRT_MMIO line and the comment that
> is associated with it.
sure thanks

Eric
> 
> thanks
> -- PMM
> 

