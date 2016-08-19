Received: by 10.25.21.156 with SMTP id 28csp439922lfv;
        Fri, 19 Aug 2016 09:57:20 -0700 (PDT)
X-Received: by 10.55.46.130 with SMTP id u124mr10398933qkh.130.1471625838525;
        Fri, 19 Aug 2016 09:57:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o59si3260285qtd.146.2016.08.19.09.57.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Aug 2016 09:57:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58185 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ban6b-0007Q7-Sh
	for alex.bennee@linaro.org; Fri, 19 Aug 2016 12:57:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shankerd@codeaurora.org>) id 1ban2M-0003Yn-J8
	for qemu-devel@nongnu.org; Fri, 19 Aug 2016 12:52:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shankerd@codeaurora.org>) id 1ban2K-0006ag-G7
	for qemu-devel@nongnu.org; Fri, 19 Aug 2016 12:52:53 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58954)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shankerd@codeaurora.org>)
	id 1ban2C-0006Ym-In; Fri, 19 Aug 2016 12:52:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id C51C961C65; Fri, 19 Aug 2016 16:52:42 +0000 (UTC)
Received: from [10.222.141.31] (i-global254.qualcomm.com [199.106.103.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: shankerd@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 5959661C41;
	Fri, 19 Aug 2016 16:52:41 +0000 (UTC)
References: <1471189341-21103-1-git-send-email-shankerd@codeaurora.org>
	<f928f18f-22c5-4d8f-33c9-2701a66ab2bd@redhat.com>
	<68663F72-90AF-4F78-AD29-E182E3670D03@suse.de>
	<0e6787de-e1f8-5c58-5e4e-9a93a98893f1@redhat.com>
To: Auger Eric <eric.auger@redhat.com>, Alexander Graf <agraf@suse.de>
From: Shanker Donthineni <shankerd@codeaurora.org>
Message-ID: <04969b6b-8de2-a6c8-3de4-e07003e94d6b@codeaurora.org>
Date: Fri, 19 Aug 2016 11:52:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <0e6787de-e1f8-5c58-5e4e-9a93a98893f1@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 198.145.29.96
Subject: Re: [Qemu-devel] [PATCH v2] hw/vfio/platform: Add Qualcomm
 Technologies, Inc HIDMA device support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: shankerd@codeaurora.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Philip Elcan <pelcan@codeaurora.org>,
	Vikram Sethi <vikrams@codeaurora.org>, Eric Auger <eric.auger@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>, Kaya Sinan <okaya@codeaurora.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A3Ujo4PmZ2W/

Eric/Alex,

Seems everyone was agreed, and add support for a generic vfio platform=20
device class. I'm going to drop this HIDMA patch since the new generic=20
vfio platform device class will cover.

Shanker

On 08/19/2016 06:43 AM, Auger Eric wrote:
> Hi Alex,
>
> On 19/08/2016 00:35, Alexander Graf wrote:
>>> On 18 Aug 2016, at 05:37, Auger Eric <eric.auger@redhat.com> wrote:
>>>
>>> Hi Shanker,
>>>
>>> Adding Alex in CC for (*)
>>>
>>> On 14/08/2016 17:42, Shanker Donthineni wrote:
>>>> This patch introduces the Qualcomm Technologies, Inc HIDMA device an=
d
>>>> allows passthrough the host HIDMA device to a guest machine using th=
e
>>>> vfio-platform framework.
>>>>
>>>> A platform device tree node is created for the guest machine which
>>>> contains the compat string 'qcom,hidma-1.0', mmio regions, active hi=
gh
>>>> SPIs, and an optional property dma-coherent.
>>>>
>>>> Signed-off-by: Vikram Sethi <vikrams@codeaurora.org>
>>>> Signed-off-by: Shanker Donthineni <shankerd@codeaurora.org>
>>>> ---
>>>> Changes sicnce v1:
>>>>   combined patches [v1 1/2] and [v1 2/2].
>>> Some general comments:
>>> - I preferred the previous series organization where we had the
> creation
>>> of the VFIO device first and its sysbus-fdt dynamic instantiation in =
a
>>> separate patch.
>>>
>>> Peter requested sysbus-fdt stops growing and advised to split the fin=
e
>>> into generic helpers and specific dt creation functions in separate
>>> files. This sounds the right moment to do it with looming new VFIO
> devices.
>>> (*) Also I am now reconsidering the relevance of creating specific VF=
IO
>>> devices per compat string. At the begining of VFIO QEMU integration
>>> history we made that choice, advised by Alex (Graf), considering the
>>> QEMU VFIO device could not be generic. With a little more experience
> now
>>> we could see the specialization is currently done in the dt creation
>>> function (sysbus-fdt) and in the kernel reset module. So I would now
>>> advocate using a non abstract base VFIO device that could be
>>> instantiated passing its compat string as property. Creating
>>> hw/vfio/qcom-hidma.c and include/hw/vfio/vfio-qcom-hidma.h then would
>>> become useless. Alex, what is your feeling now?
>> Back when we set up the rule we were concerned with a few things that =
a
> generic sysbus devices can=92t implement properly:
>>    * generic reset
>>    * power control
>>    * clock control
>>
>> I guess the first two are mostly a matter of the in-kernel driver, not
> the user space one. Clock control hopefully isn=92t much of a thing wit=
h
> real hardware ;).
>> So yes, if you can make a generic driver work, I=92m not opposed.
> Thank you for the confirmation!
>
> Best Regards
>
> Eric
>>
>> Alex
>>

--=20
Shanker Donthineni
Qualcomm Datacenter Technologies, Inc. as an affiliate of Qualcomm Techno=
logies, Inc.
Qualcomm Technologies, Inc. is a member of the Code Aurora Forum, a Linux=
 Foundation Collaborative Project.

