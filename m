Received: by 10.25.0.147 with SMTP id 141csp588188lfa;
        Tue, 21 Feb 2017 08:58:39 -0800 (PST)
X-Received: by 10.55.128.66 with SMTP id b63mr29476567qkd.297.1487696319827;
        Tue, 21 Feb 2017 08:58:39 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c27si15502646qta.35.2017.02.21.08.58.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 08:58:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46940 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgDlt-00048p-3c
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 11:58:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1cgCSy-000095-14
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 10:35:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1cgCSs-00029B-Vp
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 10:35:00 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:36372)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <okaya@codeaurora.org>)
	id 1cgCSs-00028v-Kq; Tue, 21 Feb 2017 10:34:54 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 4820860A9A; Tue, 21 Feb 2017 15:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487691293;
	bh=Mj5DAyOX/C66WB3wJvvF6m+482LPqhXUbPy/P0R9wEE=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=a9/pmsgI3PV0GazOihvGive2oQq9558nl6Cy3+0v3IRbcl9kgv8O5ow00AcVv7RU/
	+4SFz2G0cbIctO7ZkCs1zz1aYbUOOeZHtOIwmzA7Wkfwcp365CFCLGWKwEVq/M4sct
	uLlYWew6DoQpViwE9qg2miTerbYgADuBA8AAawts=
Received: from [10.228.68.95] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: okaya@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id DF9F3607C2;
	Tue, 21 Feb 2017 15:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487691291;
	bh=Mj5DAyOX/C66WB3wJvvF6m+482LPqhXUbPy/P0R9wEE=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=g9zSkDtIlT3cz+dR/1veB4orI3u8s7F9ZLkSMnSEAJUKOtWKMZHJNVCxm6ZYufnUc
	mxRagpXUhyif/0s8IcraXeiSSXmeoXP0/J3JYK7mCDT6Q1zmWkoGKwCcsZEAm9VzQp
	FVzIvg2JfHwS8AfZ4KSMyISyOPn7zF2TC3l4P62E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DF9F3607C2
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
From: Sinan Kaya <okaya@codeaurora.org>
Message-ID: <a9ed1831-5a1c-5c27-25b0-71d06c7dee2e@codeaurora.org>
Date: Tue, 21 Feb 2017 10:34:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <8d790f60-6ee6-9b48-6dfc-524532db112b@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
X-Mailman-Approved-At: Tue, 21 Feb 2017 10:46:13 -0500
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
X-TUID: doWl6HhCIlDx

On 2/21/2017 10:23 AM, Auger Eric wrote:
>> Note that the goal is to be able to instantiate any platform device by just
>> passing a compatible string and the object from the host. We don't want
>> to make changes to QEMU every time somebody comes up with a new platform device.
>> This step is unnecessary.
> Well we need to generate a device tree node for your device. We have not
> proven yet the function that creates this latter can be generic. There
> are some helpers that can read the host dt node, copy some properties
> from the host to the guest. But still at the moment we can't make things
> as generic as PCIe and this is why the platform passthrough still is
> controversial. So this patch aims at lowering the integration efforts
> but minimal specialization needs to be done in sysbus-fdt. Same on
> kernel side with the reset module.

Understood. You need to bring in the entire device tree parameters for a full-blown
solution. We can always treat this as a TODO.

I was more interested in simple devices like XHCI, AHCI, HIDMA where there
is no platform device attribute besides the interrupt number and memory
resources. QEMU already has access to these.

I was hoping to cover this at least. More complex objects need their own
implementation like the AMD driver in your example.

I'm pasting my comment from the archives here. 

https://lists.gnu.org/archive/html/qemu-devel/2016-08/msg03267.html

"Why submit a new SATA AHCI driver for QEMU just to set the compat string?"


> 
> Thanks
> 
> Eric
> 
> 


-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
