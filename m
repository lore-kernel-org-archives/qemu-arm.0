Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp284146lfd;
        Wed, 27 Jan 2021 13:53:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwEmFA2a4FzP9aCfKzjMeaDmAYmMirdQXhN97qAa0DcTxFrAlAjILW5KFV5TsddnPBUNRe+
X-Received: by 2002:a25:aba4:: with SMTP id v33mr21251320ybi.388.1611784417378;
        Wed, 27 Jan 2021 13:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611784417; cv=none;
        d=google.com; s=arc-20160816;
        b=YVZ7cevAUhWjZ1n/layAeqNflarND68TQOoVtiUsf5EJIcCAe8u0YCDHZSNU8ZX/r1
         D9GCD3sYc+U57uLbnucRFEYQYPCzR3KupyU37d83gA+86cQsAtSNe52MiWx3acikegEL
         C+lPP+0tk6w3UXYYz4yAnfASflj8+FLU+izcGgvN9E8nVnkOp5hQxTbDdTBjcf+hE1U+
         95IZbLUFCvhebF+XW+Bovz5Kg1HMSoL+wBCxy/H+RbuGYB1VoUQzm3KfPkHl9thPfPy9
         YPmoIDIZgV/QfbJAG2ylZpOur16lQ9m4NHA9ap6akxjhCMtsUAs3VEnGa2e4z6pnFqAR
         x0aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:dkim-signature
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=3fB8raZFnOV40ct2MT96BSTKTS97g8mPuG6zACe83OI=;
        b=0jdyAykZr5tH2Si2FZ6rtDI8HvkGAiEddnToo75W3v3GU5kBjo74voeSiU3xovozlo
         +86H8yBlsMwteHAYNB9vDtzeafTBe3LzoGsh5+n1gyqu7Zgof05/3H3Ow9VUKWiYFFqG
         iAzQq6h+b00O304ChXQFzibzuT0ddsn7Y+bUQ0jCmfkaWa2eQ2NOeSuA/2JnEMdflvDi
         96PQLlPScSkFxpSy5Rd6bqIq1MpuD/+hcrFi2ABZSxTSWf+I61UN7b/F50AHkCyKEU3e
         yVYLQj52MMuOXjMFV2KJU+L/sADDSNKsRJdXeNePkzG8uEb4q0wW7+d4uqhL1Dhi7iY0
         47Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=bJQ9y4em;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si3242738ybl.169.2021.01.27.13.53.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 13:53:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nvidia.com header.s=n1 header.b=bJQ9y4em;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=nvidia.com
Received: from localhost ([::1]:35360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4skq-00012d-Ol
	for alex.bennee@linaro.org; Wed, 27 Jan 2021 16:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1l4skO-0000zt-G2; Wed, 27 Jan 2021 16:53:08 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:6821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwankhede@nvidia.com>)
 id 1l4skM-0004K3-6f; Wed, 27 Jan 2021 16:53:07 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6011e0bf0004>; Wed, 27 Jan 2021 13:53:03 -0800
Received: from [10.40.102.156] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 21:52:50 +0000
Subject: Re: [RFC PATCH v2 1/3] vfio: Move the saving of the config space to
 the right place in VFIO migration
To: Alex Williamson <alex.williamson@redhat.com>, Shenming Lu
 <lushenming@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-2-lushenming@huawei.com>
 <20201209132947.3177f130.cohuck@redhat.com>
 <20201209113431.5b252e93@omen.home>
 <3f7db9e7-3c98-5022-e907-e6214815fae9@huawei.com>
 <20210126143602.0dac239f@omen.home.shazbot.org>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <f11ef511-b0ef-807c-763a-e092684be00e@nvidia.com>
Date: Thu, 28 Jan 2021 03:22:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20210126143602.0dac239f@omen.home.shazbot.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1611784383; bh=3fB8raZFnOV40ct2MT96BSTKTS97g8mPuG6zACe83OI=;
 h=Subject:To:CC:References:X-Nvconfidentiality:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=bJQ9y4em+YLwADcav8HG7l05fmna51NfccQ0L4x7cbspCnz881ufv2NqMNsUR7gfN
 EnMYhvsKjUxLsKAXYdkF5pB9oT8O0CyoXBPwOHahHgD65X8ls8XS8A4+kGv4n3KE1U
 DgDUHwkNFUYZ4/q6cd99sIquaKobTMuKTeXeOrBDaTI2AKkqfp54v4MnOq1tVWJL57
 38FL48w36xKxYmIwZn9OVNA1NTLGOkN97rHsZxuJNDX8dgDsIUnAempn0yTEcLdr49
 p0EA7tqvgy5Yi2BFNgOjP/uROwR5dco8jAG4a8+i24i5oIQLG8rQoiXwz3SGNzb6Sb
 iuNA7b/sQe0eA==
Received-SPF: pass client-ip=216.228.121.143;
 envelope-from=kwankhede@nvidia.com; helo=hqnvemgate24.nvidia.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PWRQ3hvymLnT



On 1/27/2021 3:06 AM, Alex Williamson wrote:
> On Thu, 10 Dec 2020 10:21:21 +0800
> Shenming Lu <lushenming@huawei.com> wrote:
> 
>> On 2020/12/10 2:34, Alex Williamson wrote:
>>> On Wed, 9 Dec 2020 13:29:47 +0100
>>> Cornelia Huck <cohuck@redhat.com> wrote:
>>>    
>>>> On Wed, 9 Dec 2020 16:09:17 +0800
>>>> Shenming Lu <lushenming@huawei.com> wrote:
>>>>   
>>>>> On ARM64 the VFIO SET_IRQS ioctl is dependent on the VM interrupt
>>>>> setup, if the restoring of the VFIO PCI device config space is
>>>>> before the VGIC, an error might occur in the kernel.
>>>>>
>>>>> So we move the saving of the config space to the non-iterable
>>>>> process, so that it will be called after the VGIC according to
>>>>> their priorities.
>>>>>
>>>>> As for the possible dependence of the device specific migration
>>>>> data on it's config space, we can let the vendor driver to
>>>>> include any config info it needs in its own data stream.
>>>>> (Should we note this in the header file linux-headers/linux/vfio.h?)
>>>>
>>>> Given that the header is our primary source about how this interface
>>>> should act, we need to properly document expectations about what will
>>>> be saved/restored when there (well, in the source file in the kernel.)
>>>> That goes in both directions: what a userspace must implement, and what
>>>> a vendor driver can rely on.
>>
>> Yeah, in order to make the vendor driver and QEMU cooperate better, we might
>> need to document some expectations about the data section in the migration
>> region...
>>>>
>>>> [Related, but not a todo for you: I think we're still missing proper
>>>> documentation of the whole migration feature.]
>>>
>>> Yes, we never saw anything past v1 of the documentation patch.  Thanks,
>>>    
>>
>> By the way, is there anything unproper with this patch? Wish your suggestion. :-)
> 
> I'm really hoping for some feedback from Kirti, I understand the NVIDIA
> vGPU driver to have some dependency on this.  Thanks,
> 

I need to verify this patch. Spare me a day to verify this.

Thanks,
Kirti


> Alex
> 
>>>>> Signed-off-by: Shenming Lu <lushenming@huawei.com>
>>>>> ---
>>>>>   hw/vfio/migration.c | 25 +++++++++++++++----------
>>>>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>>
>>> .
>>>    
>>
> 
