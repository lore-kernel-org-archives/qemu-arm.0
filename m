Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1812970wrt;
        Wed, 28 Nov 2018 18:25:10 -0800 (PST)
X-Google-Smtp-Source: AJdET5dhWTgcBhpwpI1MosLULcLL4sVlFDwsQhrWLA/W7XATDXkFN9KrFe7wG95wxZa5tGJOHJvC
X-Received: by 2002:a81:8412:: with SMTP id u18mr40913882ywf.289.1543458309929;
        Wed, 28 Nov 2018 18:25:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543458309; cv=none;
        d=google.com; s=arc-20160816;
        b=RVWSD6jvHjmV9/ZgVZJMM3TkFvKPJSgwmZBIJ4ZKptbRWEMDDvs2kJ75pwXfAjYIx0
         2+aJsqeanb+BZtg+gfztEl7WfD/Nq+8oxDazrFUqqwe5ozx5u+z1+3PdwiOdunqA6alO
         LD+T1BGci66kpgHnjKiPmIyPC/+SvgwC8xNil2PuyVLGTjtetgLD+4EGiORrc5NlkBO4
         gXkyMJKoHg3/tXQvicTLnIVEfRA1aiY1HMEwdJ7LHff9OVB0I1obHAh82nct4CUvpJal
         cKxIIMfrbltzlBRjecw6JUUlvU3VTYCjR5V7zd0s9Jvk3ENx+A3gl4KcDm0XUpDDgr3R
         Jqnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=ZzimebbKApz7gujmtn1NE2Icpos/CMAsW+IxoUaN3kU=;
        b=DQGktI6pFVlTYH0hVqFguYax1nqsJPMWvy0cWww+/rx8uVbAbFzfPKeLbgC8QXTWru
         O6cxVLZ7M6zljeFGZBhTiw31jBQ7nApf4wUDeM418RrWiSbv+YMkitVlJr7kxDz0gJzi
         ijfzf14fx6jq17dmVIAm/sae382lq7ASR7aSCzh0I/K9KvMzm4euuCsFbSUYuEvQ6j4c
         FQYwGRadhTuE7CPA72kcchMvzliWMN+fg9zKxBoh4IllxNMZrD9bFa3ZIG0t+cYKVFsu
         2CBzu/M+E20cNmAYHUdrFkaN1Vo0xSPsWJJpDH6apKclC6X9IGNLyOjzQaLRw9C3iZDc
         aVPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UQ2kUKGc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k128-v6si250009yba.363.2018.11.28.18.25.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 18:25:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UQ2kUKGc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSC0r-0007d7-DH
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 21:25:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gSC0i-0007bz-Up
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 21:25:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhaosl@gmail.com>) id 1gSC0e-0006dh-Q6
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 21:25:00 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37652)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <shannon.zhaosl@gmail.com>)
	id 1gSC0e-0006cD-EE; Wed, 28 Nov 2018 21:24:56 -0500
Received: by mail-ot1-x343.google.com with SMTP id 40so366753oth.4;
	Wed, 28 Nov 2018 18:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ZzimebbKApz7gujmtn1NE2Icpos/CMAsW+IxoUaN3kU=;
	b=UQ2kUKGc5tr/7dYs/maFXMlFfUkjEiLWjKjglU+xbxyvaGBXyGkkU4yzQpLZ6pd3jc
	WcPjJH0CcYdV4vtcXNaL+x5Mzmit2OEJJ8TkF+7gP+4aDXaxokkVDjFySjM3XIflogwn
	uaSjOmv0xoi7SkNWjRBTsIOteGJ661DcfkdHiDYsACtOGrevKhR2TDDVneLDOMFZAst8
	oZ3lYJk1l1r/ii0kp50aWVVs8/qfLV2nmGI/5jVksXQnORtfzRdbbKIKHfNThYvdRodB
	EPX7JOThwIgNKCTFoztnkklorOieQboB59UDvuqbgxXt1k9chGR1im1thD/Jeqqj6HtE
	fy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZzimebbKApz7gujmtn1NE2Icpos/CMAsW+IxoUaN3kU=;
	b=WorE3qPKFDauZJ/v0/GIAx0RzLU6GcPVOvOrNY/JzyS2g87MZOedhWy7OaXrV7to6N
	fS2oNsvmM3VuZadieVY5WK6VCRKZrlKCjs7PJWU5Zr754RJj8HdpLONVa+axpN6IJOx6
	pRRNeJxXGv57FGFS1JUrGjzDvg0ubT1eC6GfdGhcBkfil5BmTMSdGdVolpOZpwpH5e0Q
	CDU3FtjGtgFExvEnSl12I4Uft4iR3MjkVMlV0RoWn4Bk93TZ0OmKRNqHymb1DSt+rbOn
	sfCawKb4zq+7V+D1rVbLO7sPylctkVwexq8rF4zJ0C0nlHWA+/m2rjSLGZiXgKeSn8pM
	DnRQ==
X-Gm-Message-State: AA+aEWbCAHGq9tjrGXYcI2ZjXom9oElx55jPMVPGvwnMRyVEmK6OVS1b
	nY1W76c6LIfZ+vPxHsCwm9E=
X-Received: by 2002:a9d:ac3:: with SMTP id 61mr21914565otq.272.1543458295556; 
	Wed, 28 Nov 2018 18:24:55 -0800 (PST)
Received: from [30.43.80.46] ([47.89.83.32])
	by smtp.gmail.com with ESMTPSA id a21sm170339otr.3.2018.11.28.18.24.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Nov 2018 18:24:54 -0800 (PST)
To: Auger Eric <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20181126154616.18173-1-eric.auger@redhat.com>
	<b3c22264-2a95-b851-025c-b8ff0f38f269@redhat.com>
	<65b68704-2c0b-e9b9-2cde-fea5c32161b3@gmail.com>
	<a6e27638-1695-9608-366a-83bbbe873e55@redhat.com>
From: Shannon Zhao <shannon.zhaosl@gmail.com>
Message-ID: <2c6469e1-4da1-7f9d-4525-892287c4c5c1@gmail.com>
Date: Thu, 29 Nov 2018 10:24:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <a6e27638-1695-9608-366a-83bbbe873e55@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1] hw/arm/virt-acpi-build:
 Fix SMMUv3 ACPI integration
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
Cc: shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: R2+qVLxZ8ZBU



On 2018/11/29 1:26, Auger Eric wrote:
>>>>    struct AcpiIortSmmu3 {
>>>>        ACPI_IORT_NODE_HEADER_DEF
>>>>        uint64_t base_address;
>>>> @@ -639,6 +645,8 @@ struct AcpiIortSmmu3 {
>>>>        uint32_t pri_gsiv;
>>>>        uint32_t gerr_gsiv;
>>>>        uint32_t sync_gsiv;
>>>> +    uint32_t pxm;
>> So if we use this field ,we need to set the flags with
>> ACPI_IORT_SMMU_V3_PXM_VALID
>>>> +    uint32_t id_mapping_index;
>> And if we use this field, it needs to set the revision to at least 1.
> But is it harmful to add those fields in the struct as this patch does?
> 
> - in our case ACPI_IORT_SMMU_V3_PXM_VALID flag is not set so the field
> value is ignored according to the spec and arm_smmu_v3_set_proximity()
> will not do anything.
> 
> - SMMU control interrupts are all GSIV based so spec says that deviceID
> index is ignored.
> 
> So eventually the fact the struct size is changing over the revisions
> does not look a problem because the node length is part of the struct
> and the offset to the ID array also is part of the structure.
> 
> So I could have left the structure as before (because we don't use the
> functionalities associated to those fields). But on the other hand it's
> good to upgrade the struct according to Rev D now.
> 
> So I think the patch is correct, isn't?
Yes, I think it's not harmful but it would be better to add some 
comments to explain why we don't increase the revision number ATM.

Thanks,
Shannon
