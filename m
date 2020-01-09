Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2006859lff;
        Thu, 9 Jan 2020 03:33:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzUoI8sBR/HDQ/561qo+6X3L9luPTQBW00vz/st6iao/e8t0sxSG0UQIlspXpZf1lJJ+v2h
X-Received: by 2002:a05:620a:1415:: with SMTP id d21mr8723257qkj.17.1578569581040;
        Thu, 09 Jan 2020 03:33:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578569581; cv=none;
        d=google.com; s=arc-20160816;
        b=Qn+gq5rmBNlxdTDunx78s+zWXMGXnlhD7cSWLmOoJW7eMD5vMqw0IufHHP69N726r/
         w2pF9jOBoa4Vv7BoycAJ7pmsOSRik/Kzx4KNXCUBVrnVeU0r0fAfd1n+okcuNA25fWy0
         /7KX5DK4cJaOdYJUsaQHvicJNAtrqCkbSb0niu/xV7SSJJByFcOX6UUUz0cxKww97h0g
         YkoCYLsZOEM+HyhDlms3oJ2QUso6tdyNCs65QYzNxWtQxu93xtzwuCG2rLkcKWaqt3m4
         Q5FCoMUJiBNLMpF/Ab0pVCLRw4+v5i9y4xC0WAIX4pPQgGz+p0DREy+3F3COXY97v8q+
         QCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=XtOcObfMKoSc9b16rZIoUyo1FfWaVfJeRURfHjh3bvY=;
        b=qHaBqU59hlr7//2a89AE7+jKUQ21FYipHzgMG1oH8m3TyvvfogrICQwLEgVI+Xshe+
         jORS1BTW8yUf4KsFebCMpk7w2FRf+ytp+tnqMam933bdPPhzCk9ea2fiQ8eGx8GEyT6z
         qSscEo97LaN2dr5mehCOCneX1T6zkjoWo0FWZsiNBKZCLTG/KvgV64mya6pPEcfn8hPK
         OsuFxO35dv4WPvgqlPDTuYTS932pQj+qtz1uV0X0cvf1s79JNTWHLOMVNzcyFbrRBcnk
         R5bpgVsnpz46NgXTfBQPjso4BhecL46fxy1bIdtZMDJzhfY7EO9t+eAzkoP0wp6rwsFY
         eV5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMFMAHKH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a41si3047833qtk.150.2020.01.09.03.33.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2020 03:33:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OMFMAHKH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipW3g-0004ql-Fk
	for alex.bennee@linaro.org; Thu, 09 Jan 2020 06:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46173)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1ipW3Y-0004qW-4H
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 06:32:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1ipW3W-0003qz-7q
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 06:32:51 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37765
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1ipW3U-0003nT-Dz
 for qemu-arm@nongnu.org; Thu, 09 Jan 2020 06:32:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578569567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtOcObfMKoSc9b16rZIoUyo1FfWaVfJeRURfHjh3bvY=;
 b=OMFMAHKHJc/7p/ShDaXy2upkPXrCOgErdEfPQvhHGCf2hlq9fUsItw4pgKfs1Ok3U+CZZJ
 ABkWI+V6IhEsePctJnTm9bGZSgP1DuJGR7/zkdWlmxrAEpESYq1bEzCo1bhLIGP2p+37xr
 NsVznIBmiQVmP7VkWAigpovGx7771WY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-0Zd6EqyIOgCzeSguV0Q55w-1; Thu, 09 Jan 2020 06:32:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E392A800D5B;
 Thu,  9 Jan 2020 11:32:41 +0000 (UTC)
Received: from [10.36.117.108] (ovpn-117-108.ams2.redhat.com [10.36.117.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6B9986C54;
 Thu,  9 Jan 2020 11:32:33 +0000 (UTC)
Subject: Re: [PATCH for-5.0 v11 08/20] virtio-iommu: Implement translate
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20191220162642.GA2626852@myrica> <20191220165100.GA3780@xz-x1>
 <20200106170634.GF2062@myrica> <20200106175850.GC219677@xz-x1>
 <20200107101024.GB832497@myrica>
 <aa5fa9e6-6efd-e1a3-96c6-d02ba8eab4c8@redhat.com>
 <20200109084700.GA934975@myrica>
 <0beb9d61-05b8-3152-e967-64413def6ab7@redhat.com>
 <20200109104032.GA937123@myrica>
 <bcb585ef-f617-e870-72a2-f4028682547b@redhat.com>
 <20200109111544.GA940335@myrica>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <97e245bc-21f6-74c8-c147-65bbed7ef906@redhat.com>
Date: Thu, 9 Jan 2020 12:32:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200109111544.GA940335@myrica>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0Zd6EqyIOgCzeSguV0Q55w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, kevin.tian@intel.com,
 tnowicki@marvell.com, mst@redhat.com, jean-philippe.brucker@arm.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 armbru@redhat.com, bharatb.linux@gmail.com, qemu-arm@nongnu.org,
 dgilbert@redhat.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8wYrJlAekbb5

Hi Jean,

On 1/9/20 12:15 PM, Jean-Philippe Brucker wrote:
> On Thu, Jan 09, 2020 at 12:01:26PM +0100, Auger Eric wrote:
>> Hi,
>>
>> On 1/9/20 11:40 AM, Jean-Philippe Brucker wrote:
>>> On Thu, Jan 09, 2020 at 09:58:49AM +0100, Auger Eric wrote:
>>>>>> I share Peter's concern about having a different default policy than x86.
>>>>>
>>>>> Yes I'd say just align with whatever policy is already in place. Do you
>>>>> think we could add a command-line option to let people disable
>>>>> default-bypass, though?  That would be a convenient way to make the IOMMU
>>>>> protection airtight for those who need it.
>>>> Yes I could easily add a device option to disable the default bypass.
>>>>
>>>> Shall we change the meaning of the F_BYPASS feature then? If exposed by
>>>> the device, the device does bypass by default, otherwise it doesn't.
>>>> This would be controlled by the device option.
>>>
>>> For a device that doesn't do bypass by default, the driver wouldn't have
>>> the ability to enable bypass (feature bit not offered, not negotiable).
>>>
>>>> The driver then could have means to overwrite this behavior once loaded?
>>>
>>> Let's keep the bypass feature bit for this. If the bit is offered, the
>>> driver chooses to enable or disable it. If the bit is not offered or not
>>> negotiated, then the behavior is deny. If the bit is offered and
>>> negotiated then the behavior is allow.
>>>
>>> We can say that before features negotiation (latched at features register
>>> write, I think, in practice?) the behavior is platform dependent. The
>>> current wording about bypass intends to discourage unsafe choices but
>>> makes a strong statement only about the device behavior after features
>>> negotiation. 
>> OK. May be worth adding in the spec later.
>>
>> By the way what is the plan for the vote?
> 
> The ballot closed and the spec is accepted for virtio-v1.2-cs01, with the
> condition that the stale statement about padding is removed
> (https://lists.oasis-open.org/archives/virtio-dev/201911/msg00083.html)

Ah OK. Sorry I missed the outcome. Congratulations!

Eric
> 
> Thanks,
> Jean
> 

