Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1237027lfe;
        Tue, 17 Mar 2020 01:26:00 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vumm/vZWisrql9twoYFfMbezWIzTcbrYMsEv2PyIPNP1pSo6b6TlJtZJBPSkrknAMo83QCW
X-Received: by 2002:a05:6214:164d:: with SMTP id f13mr526453qvw.214.1584433559892;
        Tue, 17 Mar 2020 01:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584433559; cv=none;
        d=google.com; s=arc-20160816;
        b=AnzYLtxsLx/wGFY7plrnYTT65ovGhEpgFtUHrIDGdJ815D2V81T3gxUQ1kGYnUGUK6
         Uw1Ha8X1DcogoXJeRCyrysUwZcxGZM9w6GJOpoYo0oecmLmy/yMoUdPkPB3cTk/XTcMK
         niuxR2buBxwrBmUYRsJrHMbTeFhOW38OoQ5VZt1wMluPfAn4O62oGOU13InJ+HcRYvRH
         /BEukKqmvaFMpHELpPqLGEc36nPbVl6pkRqMXJl3pW2nVuzzN/SEDekRicEM3wONR+99
         EVlM8q69NkIEXN0+cYw5T/3UxiSqbVY0VRDPf5t+mSuAOB5b2BAd/7GXWmXiJjL4sQ8i
         HCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=TJSd+63TJ8aEq9ZHZQxhNfzyBpLvjNbYkZUKwPFfe+o=;
        b=aW+BiAKY530u+Hhg8+SfIiBPUXEUWD7heeJSNusfxLUZvepBeJ+1G154E5MbTlyNTy
         G+fdOZPWVTfY7GQ/Vpp5wag83zLn5fz/THRo6yp7wCh6xVvi4W0ozjuNIEWxDKIfRnSF
         115WqZR1jOTZgusNmsV1tlBjMXxty+mNyqdlWeVGNNTinnkaMNtv9KG7wdpBiTaKmjCL
         Xn6pzOFWiVM0Fw5We+ZluyJe6+i0JRYnZi2JLw7E/0Jhx08RaCNMXynsbFxVsXBvOwhq
         fLVB0Y4dml6fpp0vgwtzJsFqjUEKi3K3owP0v4DjI4HbtR7TMW2rBYL48U4MwYqciabn
         zRSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GyGDpCZO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p202si1556499qke.256.2020.03.17.01.25.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 01:25:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GyGDpCZO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jE7Xz-0000Ks-2c
	for alex.bennee@linaro.org; Tue, 17 Mar 2020 04:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1jE7Xm-0000EZ-Fi
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 04:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1jE7Xk-0003P3-Ac
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 04:25:45 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:23043)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1jE7Xk-0003I4-0s
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 04:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584433542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TJSd+63TJ8aEq9ZHZQxhNfzyBpLvjNbYkZUKwPFfe+o=;
 b=GyGDpCZORPdjiqQoFiJMD6YOkvJTCOSItYgMWTL35ia+/vtziGFlU4G7fuhS9CagxRoc1z
 x0iKqgqIiiqmiaoxTEiBaVNvIJBbc/OWsP6Gk3MF6x3MdtHQX0omvEl4bxkL93ci2FTqGV
 MLW/hKif/iJYdRsluw8ciDhzk96pFNw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-0B06ioJRPJ2r9x2YMHuCiA-1; Tue, 17 Mar 2020 04:25:41 -0400
X-MC-Unique: 0B06ioJRPJ2r9x2YMHuCiA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F03E800D5A;
 Tue, 17 Mar 2020 08:25:39 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6C531001B3F;
 Tue, 17 Mar 2020 08:25:26 +0000 (UTC)
Subject: Re: [PATCH v7 3/5] virtio-iommu: Call iommu notifier for attach/detach
To: Bharat Bhushan <bharatb.linux@gmail.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20200313074811.27175-1-bbhushan2@marvell.com>
 <20200313074811.27175-4-bbhushan2@marvell.com>
 <da0a4d7b-c27d-839d-56b6-da67c94adeb7@redhat.com>
 <CAAeCc_m=PKV0T8DmaE06F9NMYfU792f9TDdoyKkaPaEN3597ag@mail.gmail.com>
 <9b4ab5e8-8848-50ba-17c8-652567483126@redhat.com>
 <CAAeCc_ksAdoNJcFWkoB4YcySAb5Hw7D+kLyHx-Nt0hZJY17AXA@mail.gmail.com>
 <CAAeCc_nnM-DGCyXjFJuk-6L8F+Oetq076SEjeV8kUAGxfJVQTw@mail.gmail.com>
 <cc447790-d1c5-784b-9706-fbcd76f0c94b@redhat.com>
 <CAAeCc_mSobL4oGcK-J3WJJq8BCS6M_oyPTrzJ9bk8yFgsUDBUw@mail.gmail.com>
 <20200316101124.GA304669@myrica>
 <CAAeCc_kJq_TjbZxf3Un5rpwBrNrz-8gdL_SMS-gP_0=rARf0WQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <fdcdfbb0-9cf5-c487-48f3-5dfc7229e4bf@redhat.com>
Date: Tue, 17 Mar 2020 09:25:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAAeCc_kJq_TjbZxf3Un5rpwBrNrz-8gdL_SMS-gP_0=rARf0WQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: peter.maydell@linaro.org, kevin.tian@intel.com, tnowicki@marvell.com,
 mst@redhat.com, drjones@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, qemu-arm@nongnu.org,
 Bharat Bhushan <bbhushan2@marvell.com>, linuc.decode@gmail.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: etA6dipG/EGq

Hi Bharat,

On 3/17/20 8:10 AM, Bharat Bhushan wrote:
> Hi Jean,
> 
> On Mon, Mar 16, 2020 at 3:41 PM Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
>>
>> Hi Bharat,
>>
>> Could you Cc me on your next posting?  Unfortunately I don't have much
>> hardware for testing this at the moment, but I might be able to help a
>> little on the review.
>>
>> On Mon, Mar 16, 2020 at 02:40:00PM +0530, Bharat Bhushan wrote:
>>>>>>> First issue is: your guest can use 4K page and your host can use 64KB
>>>>>>> pages. In that case VFIO_DMA_MAP will fail with -EINVAL. We must devise
>>>>>>> a way to pass the host settings to the VIRTIO-IOMMU device.
>>>>>>>
>>>>>>> Even with 64KB pages, it did not work for me. I have obviously not the
>>>>>>> storm of VFIO_DMA_MAP failures but I have some, most probably due to
>>>>>>> some wrong notifications somewhere. I will try to investigate on my side.
>>>>>>>
>>>>>>> Did you test with VFIO on your side?
>>>>>>
>>>>>> I did not tried with different page sizes, only tested with 4K page size.
>>>>>>
>>>>>> Yes it works, I tested with two n/w device assigned to VM, both interfaces works
>>>>>>
>>>>>> First I will try with 64k page size.
>>>>>
>>>>> 64K page size does not work for me as well,
>>>>>
>>>>> I think we are not passing correct page_size_mask here
>>>>> (config.page_size_mask is set to TARGET_PAGE_MASK ( which is
>>>>> 0xfffffffffffff000))
>>>> I guess you mean with guest using 4K and host using 64K.
>>>>>
>>>>> We need to set this correctly as per host page size, correct?
>>>> Yes that's correct. We need to put in place a control path to retrieve
>>>> the page settings on host through VFIO to inform the virtio-iommu device.
>>>>
>>>> Besides this issue, did you try with 64kB on host and guest?
>>>
>>> I tried Followings
>>>   - 4k host and 4k guest  - it works with v7 version
>>>   - 64k host and 64k guest - it does not work with v7
>>>     hard-coded config.page_size_mask to 0xffffffffffff0000 and it works
>>
>> You might get this from the iova_pgsize bitmap returned by
>> VFIO_IOMMU_GET_INFO. The virtio config.page_size_mask is global so there
>> is the usual problem of aggregating consistent properties, but I'm
>> guessing using the host page size as a granule here is safe enough.
>>
>> If it is a problem, we can add a PROBE property for page size mask,
>> allowing to define per-endpoint page masks. I have kernel patches
>> somewhere to do just that.
> 
> I do not see we need page size mask per endpoint.
the physical devices can be protected with different physical IOMMUs and
they may have different page size support
> 
> While I am trying to understand what "page-size-mask" guest will work with
> 
> - 4K page size host and 4k page size guest
>   config.page_size_mask = 0xffffffffffff000 will work
> 
> - 64K page size host and 64k page size guest
>   config.page_size_mask = 0xfffffffffff0000 will work
I guess not all the pages sizes should be exposed by the virtio-iommu
device, only 4K and 64K

If host supports 4K we should expose 4K and bigger
If host supports 64K we should expose page sizes of 64KB and bigger

The guest will be forced to use what is exposed and that should work.

What is missing is a way to retrieve the host supported page size
bitmask. I can try to help you on that if you want to.

Maybe we should first try to upstream vhost support and then VFIO?

Thanks

Eric
> 
> - 64K page size host and 4k page size guest
>    1) config.page_size_mask = 0xffffffffffff000 will also not work as
> VFIO in host expect iova and size to be aligned to 64k (PAGE_SIZE in
> host)
>    2) config.page_size_mask = 0xfffffffffff0000 will not work, iova
> initialization (in guest) expect minimum page-size supported by h/w to
> be equal to 4k (PAGE_SIZE in guest)
>        Should we look to relax this in iova allocation code?
> 
> Thanks
> -Bharat
> 
> 
>>
>> Thanks,
>> Jean
> 

