Received: by 10.223.172.38 with SMTP id v35csp1610119wrc;
        Tue, 5 Sep 2017 09:21:10 -0700 (PDT)
X-Received: by 10.200.8.107 with SMTP id x40mr3203197qth.320.1504628470799;
        Tue, 05 Sep 2017 09:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504628470; cv=none;
        d=google.com; s=arc-20160816;
        b=yifG6LwHLJkBhk6cFRGu1iZZzvi/t68TzMCejV93gOG3L2GFh9NEOx+q+v8v71C9k7
         P5sGTJtRnhYmSgty8QntoZ4uRuHvoHAcymZp7EQ2RBngWijhYDEZpYJPC6XxFd0JjyMV
         ps1CwCO9RgxNh+tBpX1cZW+nTDDnDmTVxzHkNYVf1q1GU1W0yfAx6Rrb8gPdglV8qgE3
         WTaM7f8YOFJ2ZV0uZGtPp5RCBzOpYzREewtXZlCMpLSiVYkGPAZv5xNfnTFOqG+gquSr
         h/cRmXQ9wPfgdWBS+oW+IPF28w5QA/mVggFNG8tIDA0ZVgYRL30SLPa4bRX6Nug6lCL+
         xCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=XUJzDRd9Ewz25+/ljtukv3P5vHz9ddKYhAtG1YtMQ8c=;
        b=dkOyfV1zZZls0xUihtmGHQNXEkNXL8Ub5T4X5s6NFlDQ/uoguGN3viSZB7zNpvxtVo
         ZVqHpQTe/CvhqKjZ15KeYEU2nHtclwj7SzD0XsD2ywmJh7+RBbNf+6YlttqHo0dTmJJq
         ub2QErix1jx92Jgaegxpx6prSBCSaJ99x0vh22YjJzcJlOlboE3gv4oyZ/pVegDwNs/1
         rS2w2cshMhjUVH9yYFWzdnrcUY2aB8Ia5X5tg5t77bC4HUIM9P21AfBOmyqaMn0uNpLQ
         skRHquRc/SFqY4PEoAr+gh0sMS0nCefJ1Bk8R7hHTxH9WqbtcaRbjEj83N63Lq01K9SN
         Z3Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f0OaXzwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g4si534964qti.519.2017.09.05.09.21.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Sep 2017 09:21:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=f0OaXzwk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dpGb6-0000MY-Hd
	for alex.bennee@linaro.org; Tue, 05 Sep 2017 12:21:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpGaq-0000FD-9H
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:21:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpGal-0000ff-HC
	for qemu-arm@nongnu.org; Tue, 05 Sep 2017 12:20:52 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37305)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dpGal-0000fG-A2; Tue, 05 Sep 2017 12:20:47 -0400
Received: by mail-qk0-x241.google.com with SMTP id n64so2388721qki.4;
	Tue, 05 Sep 2017 09:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XUJzDRd9Ewz25+/ljtukv3P5vHz9ddKYhAtG1YtMQ8c=;
	b=f0OaXzwkb4jHQld0lWoRsQqvdM9aiVIG4pm4v2ZzuEKfN6M/lCW1Z68xAZk27nApmr
	QvkLxhoQzgA+4pMqwPiQpd9rj/h5gxK59XaEG3ql2CHcDYUg/0zhzprXfyPiTsYxL3nq
	sRPvMPiWgAx6t5sP2G+OVWyW57Q8/+V87zlJXWEPXdEeqCNfxTdUnICVywTqYj35bTyM
	EesnMSY4Ms20h9WBvDcYBWYbaQiVXqCzTX+4l3Uoydsy0IAS5LjZNYCaRFM1D1eDUNI/
	0QyIsaQyclN/KoFQbvFArYZpbuuGdPGqfOkEvW46jYagy7AXYXPNBY9E9X3cVU0kfjie
	V6gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XUJzDRd9Ewz25+/ljtukv3P5vHz9ddKYhAtG1YtMQ8c=;
	b=E6NdbCO2CuHGhA0oh5q594kZWrGdCSGf6zS9ZujmIWA+0+LiMN04rqXZLPOIPomegv
	dY61Fa/K5w9jnJrWynDCPO9hQmhUwkQ6rakTHR58RJSxZd22jCpu2f5aeKUX3IMnF0yt
	CRWtCDtX9J7GtX1XJb+1L9brAzAj/41lEss/MblaiA+3PSlFbDSchQxXMhSkDMcC4Fjn
	XxexBlUTMDi67T1Kyv/Dafb0GrFac3octYkhq7fC4hJ8iy9/YQJOpEedbPeghjWGyq9c
	CwY3ATyEhab8106x5y69uVFAU5vXguFaBxD7COO8o7wy+R+JZ0GvbHnVKI95vBd70QMz
	4C8g==
X-Gm-Message-State: AHPjjUgs3XhQHJ1UoZXAHcfWt4m6I/VM42WNfNmtu1lexJXc5rGtCA4M
	DeOfUZIwJoyQ67YJrZ8xlg==
X-Google-Smtp-Source: ADKCNb6BlJQBZ4wU0bUbgnr5HdAxuX6XQwUR8EdWVpSKyyiFx4zuwO0Iob8Whe+FDYR5TMdEzx7t9g==
X-Received: by 10.233.235.66 with SMTP id b63mr6150682qkg.41.1504628446447;
	Tue, 05 Sep 2017 09:20:46 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f20sm376745qta.86.2017.09.05.09.20.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 09:20:45 -0700 (PDT)
To: Fam Zheng <famz@redhat.com>
References: <20170905131149.10669-1-famz@redhat.com>
	<20170905131149.10669-4-famz@redhat.com>
	<a628d888-f1e8-2d7f-034c-095c29818ae4@amsat.org>
	<20170905153507.GA31389@lemon.lan>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c6a0e1f5-eb6d-c8c5-bc74-cd66bceff673@amsat.org>
Date: Tue, 5 Sep 2017 13:20:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170905153507.GA31389@lemon.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 3/6] gicv3: Convert to
 DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7T5leKbyugeq

On 09/05/2017 12:35 PM, Fam Zheng wrote:
> On Tue, 09/05 10:44, Philippe Mathieu-Daudé wrote:
>> Hi Fam,
>>
>> On 09/05/2017 10:11 AM, Fam Zheng wrote:
>>> Signed-off-by: Fam Zheng <famz@redhat.com>
>>> ---
>>>    hw/intc/arm_gicv3_its_kvm.c | 19 +++++++------------
>>>    1 file changed, 7 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
>>> index 1f8991b8a6..39903d5eab 100644
>>> --- a/hw/intc/arm_gicv3_its_kvm.c
>>> +++ b/hw/intc/arm_gicv3_its_kvm.c
>>> @@ -120,17 +120,6 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>>>        qemu_add_vm_change_state_handler(vm_change_state_handler, s);
>>>    }
>>> -static void kvm_arm_its_init(Object *obj)
>>> -{
>>> -    GICv3ITSState *s = KVM_ARM_ITS(obj);
>>> -
>>> -    object_property_add_link(obj, "parent-gicv3",
>>> -                             "kvm-arm-gicv3", (Object **)&s->gicv3,
>>> -                             object_property_allow_set_link,
>>> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
>>> -                             &error_abort);
>>> -}
>>> -
>>>    /**
>>>     * kvm_arm_its_pre_save - handles the saving of ITS registers.
>>>     * ITS tables are flushed into guest RAM separately and earlier,
>>> @@ -205,12 +194,19 @@ static void kvm_arm_its_post_load(GICv3ITSState *s)
>>>                          GITS_CTLR, &s->ctlr, true, &error_abort);
>>>    }
>>> +static Property kvm_arm_its_props[] = {
>>> +    DEFINE_PROP_LINK("parent-gicv3", GICv3ITSState, gicv3, "kvm-arm-gicv3",
>>
>> moving TYPE_KVM_ARM_GICV3 to kvm_arm.h and using it here:
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> This file is only compiled natively on arm, so I'm not comfortable to make a
> more complex change than this patch which may break build due to the #ifdef's in
> the headers, or add your rev-by without a compile test.  :(

Fine, no problem :)

> 
> The open coded type name has already been used here so the change you requested
> can be done separately, I think.
> 
> Fam
> 
