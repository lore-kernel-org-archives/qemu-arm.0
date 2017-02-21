Received: by 10.25.0.147 with SMTP id 141csp571591lfa;
        Tue, 21 Feb 2017 08:19:07 -0800 (PST)
X-Received: by 10.237.44.7 with SMTP id f7mr19243415qtd.214.1487693946983;
        Tue, 21 Feb 2017 08:19:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x38si1646994qtx.134.2017.02.21.08.19.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Feb 2017 08:19:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org;
       dkim=fail header.i=@codeaurora.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgD9c-0000Uj-3U
	for alex.bennee@linaro.org; Tue, 21 Feb 2017 11:19:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47289)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1cgC5D-0001m9-S8
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 10:10:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <okaya@codeaurora.org>) id 1cgC59-0003oF-S1
	for qemu-arm@nongnu.org; Tue, 21 Feb 2017 10:10:27 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:49980)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <okaya@codeaurora.org>)
	id 1cgC59-0003np-GS; Tue, 21 Feb 2017 10:10:23 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id 3B83860CF4; Tue, 21 Feb 2017 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487689822;
	bh=OPtFb3xeJUDFt/4bKuuSN+zzi/RJWiqzD/tAtA8cj+Y=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=SRlZQLoWTy+oHNj9g+IOhVZXW9uL24w5Berfsu6Ve3Bt1PvwOfXybAaehOB9YiDsD
	oBYq+1wCPAPBUsKFWLVhwwn2sbXGpmVjpy+cp7xnY0m8tiO6/RetHREeIwe4fNYkb3
	V3oSXolX2onXN5/9kmNYweXPoukt41WiexaxNOjk=
Received: from [10.228.68.95] (global_nat1_iad_fw.qualcomm.com [129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: okaya@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6ED3A607E9;
	Tue, 21 Feb 2017 15:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1487689821;
	bh=OPtFb3xeJUDFt/4bKuuSN+zzi/RJWiqzD/tAtA8cj+Y=;
	h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
	b=JeiTi/AmObpsIQAF+YRnWBS3T8J1y1IcXlXehI3EbSQz3pdcI/ggd1pgsopTDVyS0
	2WeV5iHoXekNEd4/UvUA1nsObOTYNDSa1J4F/rpUi6P3EWbZpmkxyjamJezf4eqc0E
	uGUZSIuZUYu/TBUvfy8dBMMouWP3lG3eGH8pjugQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6ED3A607E9
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
From: Sinan Kaya <okaya@codeaurora.org>
Message-ID: <970561bf-0adc-4f60-bf2b-57bbafabb0aa@codeaurora.org>
Date: Tue, 21 Feb 2017 10:10:19 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <2dcc9002-ec06-c55e-c0a2-75d05fe05762@redhat.com>
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
X-TUID: 22OO0xtjALo1

On 2/21/2017 9:59 AM, Auger Eric wrote:
> Hi Sinan,
> On 21/02/2017 15:45, Sinan Kaya wrote:
>> Hi Eric,
>> Thanks for the long anticipated patch.
>>
>> On 2/21/2017 8:18 AM, Eric Auger wrote:
>>> +    DEFINE_PROP_STRING("manufacturer", VFIOPlatformDevice, manufacturer),
>>> +    DEFINE_PROP_STRING("model", VFIOPlatformDevice, model),
>>
>> The OF string is not always of the format "manufacturer, model".
>>
>> HIDMA for instance uses a syntax of "qcom, hidma-1.0" and "qcom, hidma-2.0".
>> This syntax is used for cases where an IP gets used in multiple SOCs. 
>>
>> Maybe, we should call it just compatible-string and try not to make meaning
>> out of it.
>>
>> Sinan
>>
> 
> in  http://www.devicetree.org/specifications-pdf I found the description
> at the bottom.
> 
> I your case what would prevent from creating 2 entries in the table and
> then use either in qemu cmd line?
> 

I see your point. You are saying that hidma-1.0 would be the model and qcom
would be the manufacturer. 

This should work.

However, I have more concerns below.

> VFIO_PLATFORM_BINDING("qcom", "hidma-1.0", add_amd_hidma_fdt_node),
> VFIO_PLATFORM_BINDING("qcom", "hidma-2.0", add_amd_hidma_fdt_node),
> 
> The issue is the comma in the property is interpreted as a separator for
> options, hence that choice of having 2 separate options.

Note that the goal is to be able to instantiate any platform device by just
passing a compatible string and the object from the host. We don't want
to make changes to QEMU every time somebody comes up with a new platform device.
This step is unnecessary. 

A general purpose solution should be able to passthrough any platform device.

I have AHCI compatible SATA drive and HIDMA use cases for this purposes. The
code should be able to probe the given device with the compatible string without
requiring any changes to QEMU.

I didn't see this in the code. Maybe, it is just because I'm QEMU code
illiterate.

I shouldn't need to submit a patch to QEMU to add these two lines.

VFIO_PLATFORM_BINDING("qcom", "hidma-1.0", add_qcom_hidma_fdt_node),
VFIO_PLATFORM_BINDING("qcom", "hidma-2.0", add_qcom_hidma_fdt_node),


> 
> Besides I will fix the CONFIG_LINUX compilation issue asap.
> 
> Thanks
> 
> Eric
> 
> "
> The recommended format is "manufacturer,model", where manufacturer is a
> string describing the name of the manufacturer (such as a stock ticker
> symbol), and model specifies the model number.
> 
> Example:
> compatible = "fsl,mpc8641-uart", "ns16550";
> In this example, an operating system would first try to locate a device
> driver that supported
> fsl,mpc8641-uart. If a driver was not found, it would then try to locate
> a driver that supported the more general ns16550 device type.
> "
> 


-- 
Sinan Kaya
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project.
