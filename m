Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp808240wrt;
        Thu, 4 Oct 2018 05:08:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60Wgk5Z4lZFElFC1MbGFAvj20+Lu6/OBwE7d5ifm0gAqwDwx556qTNBCqH0yPUVjKGQ3/Lv
X-Received: by 2002:a37:5d84:: with SMTP id r126-v6mr4790520qkb.155.1538654897908;
        Thu, 04 Oct 2018 05:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538654897; cv=none;
        d=google.com; s=arc-20160816;
        b=nD0UlXZqxSH9KojrvBRuUE4jq9ewu15I9P3M/pcCOFUkPgg9lJJr9UaQlISeyH4m+M
         2kQKvSJ/gfFD4QTKvAUfcFbe+6LzjcelFOlXProwLVFv7Ri0WAD9aa6/FBKC4W1oixyx
         d9v0yICsG+cQLDlumRxRJO8RKf+teB4BaZdS1DXubPlKFyuy7h49Ibt2vLeMZ8s/YERj
         g8mP639KGhQVN20eyfRYZaK/+orBHh3f0NptUz/UgrL/Rtr5UIPMAq+3ZhvTSA0wGTA3
         iXnPe3aJPf+j9nDsAHUJaDwq397pH7aJ9Fl9j2carKH6wMFXYVxuHmqyOV89IsUYQ+9q
         2RRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=9Ye0qsyRlCWndnA3o47RYbiwTC49poFO1lzXF+8K7cs=;
        b=bPt49fT/HYR+xp7g52PYdeZRxW2+dvg4D6Jd2ccRohRJV9lOy+X0oykP6xNLw/fPvH
         FmPPsX3UEsM/ya55ZrPkKOQsnBA66VHwmDyMMnJILsqIQA7yPIrit4RhxnfLYk1YfR9d
         lnUW5+g482hNK0KbMzFHUHAVwhVaoPHwRI+x9GQBkkCWHbRCzh2pU0CtWw3X4fD2gmQe
         UEEcW+Mkht8m/ziNAhq1Wsjjp0s4bKiBN2vR9cv16mkhwlYT/dWK6M+tRfnCzAvc3Cj0
         MfKKKjcPJr3G9IO7PIiZEakrg+4siIAzY0T0Fe8f0xg6ksItqB9qBtYKegiB2D2Fv/Sf
         uAWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i17-v6si36522qvj.89.2018.10.04.05.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 05:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g82QT-0001Cw-BE
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 08:08:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g82QL-0001Cc-Ve
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 08:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1g82QF-0004U5-MQ
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 08:08:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43462)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1g82QF-0004RP-Fn; Thu, 04 Oct 2018 08:08:03 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5EFD7300271A;
	Thu,  4 Oct 2018 12:08:02 +0000 (UTC)
Received: from [10.36.116.105] (ovpn-116-105.ams2.redhat.com [10.36.116.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 985CF690F8;
	Thu,  4 Oct 2018 12:07:53 +0000 (UTC)
To: David Hildenbrand <david@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<43a03645-fa17-3274-9a66-502acc27b2ee@redhat.com>
	<20181004131150.3de8174a@redhat.com>
	<b673ca5c-f38e-b4a5-7abd-debfa8382e22@redhat.com>
	<3ee4a49b-77fa-da05-262a-ab75ef1ade84@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c31b2bee-457f-b262-7173-9fe262f0a332@redhat.com>
Date: Thu, 4 Oct 2018 14:07:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <3ee4a49b-77fa-da05-262a-ab75ef1ade84@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 04 Oct 2018 12:08:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 00/15] ARM virt: PCDIMM/NVDIMM
 at 2TB
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, agraf@suse.de,
	qemu-arm@nongnu.org, david@gibson.dropbear.id.au,
	Laszlo Ersek <lersek@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EK1km1MRNrik

Hi David,

On 10/4/18 2:02 PM, David Hildenbrand wrote:
>>>> Alternative to have a split model is having a floating RAM base for a
>>>> contiguous initial + device memory (contiguity actually depends on
>>>> initial RAM size alignment too). This requires significant changes in FW
>>>> and also potentially impacts the legacy virt address map as we need to
>>>> pass the RAM floating base address in some way (using an SRAM at 1GB) or
>>>> using fw_cfg. Is it worth the effort? Also, Peter/Laszlo mentioned their
>>>> reluctance to move the RAM earlier
>>> Drew is working on it, lets see outcome first.
>>>
>>> We actually may try implement single region that uses pc-dimm for
>>> all memory (including initial) and be still compatible with legacy layout
>>> as far as legacy mode sticks to the current RAM limit and device memory
>>> region is put at the current RAM base.
>>> When flexible RAM base is available, we will move that region to
>>> non legacy layout at 2TB (or wherever).
>>
>> Oh I did not understand you wanted to also replace the initial memory by
>> device memory. So we would switch from a pure static initial RAM setup
>> to a pure dynamic device memory setup. Looks quite drastic a change to
>> me. As mentionned I am concerned about complexifying the qemu cmd line
>> and I asked livirt guys about the induced pain.
> 
> One idea was to create internal memory devices (e.g. "memory chip") that
> get created and placed automatically in guest physical address space.
> These devices would not require a change on the cmdline, they would be
> created automatically from the existing parameters.
> 
> The machine device memory region would than be one big region for both,
> internal memory devices and external ("plugged") memory devices a.k.a.
> dimms.
> 
> I guess that will require more work to be done.

OK interesting. Yes this adds some more work on the pile ...

Thanks

Eric
> 
>>
>> Thank you for your feedbacks
>>
>> Eric
> 
> 
