Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp737908lfk;
        Fri, 3 Dec 2021 15:34:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6vMUCbyCgumdjrJlvL0tw2YiHyFkfMmXGCmcgEpUpiL6kMMCk3cfDoMf5gGZYjiUNyWMm
X-Received: by 2002:a1f:cd83:: with SMTP id d125mr26681863vkg.17.1638574485281;
        Fri, 03 Dec 2021 15:34:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638574485; cv=none;
        d=google.com; s=arc-20160816;
        b=puKQwmb/WhtnafD5lQuNXp6sZrllMj+YprllJXPoM86+IeFtUHr0AJl1r1AXnQDBJa
         8VIMofyeeVctcU+v13LI47Pq4nTvoB0jouBUaiANB1gz1DG6sHOZolWtmtnF0f92N6M+
         Cycr/dePatRgtirS6q6WEhHi/5ubQifsnwaFs1mf0qaQ7EG/+4qm0SPb7HHLZNyKN08C
         bS1OCZmdiQui9B7CzhWXY5NAKJ6vYfxtNvufdmqz3TNZjcbqn1Lg0RknnRprtsq+h641
         fu89CTWj0w74aLIqUUUByktNFQGeiveOtLRG3w6SpOUzweASxNSJ+tPXUlwcDF4r7WV3
         lnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=41tCSKwDDA9LyS9WdyvNz09tKz/OJIdMlzMLsp14Jgc=;
        b=BmWTps08SHKbMQv0gJ6ojBOKjWTQ993QNDxa/BDmKh4m9CnyJfq/g5lk6ItIoZrdOn
         kOPbFJcCjwGd03o6uZ2heG2T2F7Nai2je/AEe7rXOY/SLi7tACBRU5DNbUdgpvj1ADyL
         3HTCN/iKANat4dUsH4gpA6+vAS5ONFITbQCiG+rloQsJ/I5wxIe7ZSk8fhy0ixZI9L5f
         quc7tSIHGdEGILjRTLiguSjAfOyZtjOQrZ4RO4PfWME0dI633QmEQ3wb8iFy1p0cWXvs
         wjmGxucuap6UTz2Kn+nRCKgXL9OgATw5nwykoB4TUElDCTb1guTnvdb1D78Jwp5HzYyQ
         G2Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hnLCAjFD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si4338410ual.226.2021.12.03.15.34.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Dec 2021 15:34:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hnLCAjFD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mtI4i-0005pZ-LX
	for alex.bennee@linaro.org; Fri, 03 Dec 2021 18:34:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtHtr-0004XQ-GA
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 18:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mtHto-0005dD-Mr
 for qemu-arm@nongnu.org; Fri, 03 Dec 2021 18:23:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638573807;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41tCSKwDDA9LyS9WdyvNz09tKz/OJIdMlzMLsp14Jgc=;
 b=hnLCAjFDghYsQ+9UmcjI5xgojdcbuyYbG+huf1hu6QptjI1T8OtCaKUen+f4Mum9LSbeIm
 Ui26qTVFvfocge1lYf/IKmMuJktlw6Jgyxhk7QG+RQRg9IeQ+bXWqWWBamwrADulT7lyKp
 BPY9imyf5GGA0I3hZ9xKKMR+pfm6GFY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98-wErlxduhOrWyfb47epXY1w-1; Fri, 03 Dec 2021 18:23:26 -0500
X-MC-Unique: wErlxduhOrWyfb47epXY1w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFBE319253C0;
 Fri,  3 Dec 2021 23:23:24 +0000 (UTC)
Received: from [10.64.54.43] (vpn2-54-43.bne.redhat.com [10.64.54.43])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DCC2260843;
 Fri,  3 Dec 2021 23:23:14 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] hw/arm/virt: Support for virtio-mem-pci
To: David Hildenbrand <david@redhat.com>, qemu-arm@nongnu.org
References: <20211203033522.27580-1-gshan@redhat.com>
 <20211203033522.27580-2-gshan@redhat.com>
 <e9a7760e-33bf-478f-50b2-830eaf35d1de@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <d6ce755e-e3f3-ddf0-fdab-90819ca9ba55@redhat.com>
Date: Sat, 4 Dec 2021 10:23:08 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <e9a7760e-33bf-478f-50b2-830eaf35d1de@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.938, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 Jonathan.Cameron@huawei.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KVyrhzURK8fu

On 12/4/21 5:18 AM, David Hildenbrand wrote:
> On 03.12.21 04:35, Gavin Shan wrote:
>> This supports virtio-mem-pci device on "virt" platform, by simply
>> following the implementation on x86.
>>
>>     * This implements the hotplug handlers to support virtio-mem-pci
>>       device hot-add, while the hot-remove isn't supported as we have
>>       on x86.
>>
>>     * The block size is 512MB on ARM64 instead of 128MB on x86.
>>
>>     * It has been passing the tests with various combinations like 64KB
>>       and 4KB page sizes on host and guest, different memory device
>>       backends like normal, transparent huge page and HugeTLB, plus
>>       migration.
>>
> 
> I would turn this patch into 2/2, reshuffling both patches.
> 
>> Co-developed-by: David Hildenbrand <david@redhat.com>
>> Co-developed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 
> Thanks Gavin!
> 

Yup, I thought of it. The fixed issue doesn't exist if virtio-mem
isn't enabled on ARM64 with PATCH[1/2]. That's why I have this
patch as PATCH[2/2]. However, It's also sensible to me to reshuffle
the patches: to eliminate potential issues before enabling virtio-mem
on ARM64. v3 will have the changes :)

Thanks,
Gavin

