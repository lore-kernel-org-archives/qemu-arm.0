Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1038067lfg;
        Fri, 20 Aug 2021 00:17:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4o6UiLdVT7j+XR72TEnGopV5IK2sRQ2Ojvu2jbkjLA2Zoyj4mfxriWC3JUPKU7K1xBKe5
X-Received: by 2002:ae9:f814:: with SMTP id x20mr7552795qkh.266.1629443866611;
        Fri, 20 Aug 2021 00:17:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629443866; cv=none;
        d=google.com; s=arc-20160816;
        b=CE8QRxu5PaF+iR7xkldV+X9pCldCXGjTmIh0O1Qpo+YF/99dVUvzRWgTNkeNaE/VIc
         RsY1tPqEc7Z2it+UUBonWp5QYbAweu1WtSwEEci4mtGKvz7phuCTezDynXv/Gwj+NKyQ
         CI8CkqKhEvuNqSBKcbK34da13kQoER5260XmYWSdu3cnKV/ZdmvDcylpex1IdhVUc25d
         Yx3s/RbSMVYjrwb+pSfcIO+/4z7JEbSraAW3L3BHJmEYU9jUvwpfpIPMLyMP7vmbwDcK
         HXcQlX0tyMH03ksmomMeNvdJz8xui1m2TiIRYbwlTX19Jo5AJb1uuwPz5eWH5OXyGn6g
         WH9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GAMEqdq8B6pmYdjgqp0YvXF+7ChCTa9KkwfN9YjcrZ4=;
        b=muFhwGo7bOwthqeOQJNKxJy2jvOqYinNHHTlqmVcKO9IIAwc+fk4lAc4lzQhc0jtik
         G7od2kc+Uc/NkdHSA229D/tnQVgOHPPnQpei0nTuBWCOKAGs/tWRK15djgYLyX2wq1IY
         v1M90c109Yr3kiEqhrpJuHOmHUIIeeSFsk0YbzUKqsrwWZ9tS2ls/7ys+NuVtxIvjC8r
         C8xwmvwXRmW3XBfX6hyJYCI5SJcLZAHcwklDkNqx+qgMSS95IR92LxO1Q609KuYyAgaX
         /IQF6Iwx7yVO9mkOnQ9+EuvF/XTlRZvgZj9XY1UydXXH+tnRnuDwo9oHoPyZ0/mlTIo7
         oKhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gKGcvrPP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i4si1448509qko.279.2021.08.20.00.17.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 00:17:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gKGcvrPP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGymf-0001Pa-VD
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 03:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGymS-0001N7-ON
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 03:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGymP-0000BI-Lm
 for qemu-arm@nongnu.org; Fri, 20 Aug 2021 03:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629443848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GAMEqdq8B6pmYdjgqp0YvXF+7ChCTa9KkwfN9YjcrZ4=;
 b=gKGcvrPPpYvtSmV92lsrn0Zagtlq0OUoGIQTdxB8Fcty9hkRJdw0cOm0zNQ9h6HtU5RMsZ
 aI+KWa1KeqMHY7dcxSUK+1xPJcx9JVXkrzn6hS+rBRYK8mjCF+JvRLtBtVZLfUyA6fMm8y
 jZuw+Vni7FIhw/YvrBmFbts5VHJAEUk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-ycDRPrT-PtKp6JTSUEAvvw-1; Fri, 20 Aug 2021 03:17:25 -0400
X-MC-Unique: ycDRPrT-PtKp6JTSUEAvvw-1
Received: by mail-wm1-f71.google.com with SMTP id
 g70-20020a1c20490000b02902e6753bf473so4471788wmg.0
 for <qemu-arm@nongnu.org>; Fri, 20 Aug 2021 00:17:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GAMEqdq8B6pmYdjgqp0YvXF+7ChCTa9KkwfN9YjcrZ4=;
 b=aBokWRw/8qtBvCz0v4q7+XLDYjVtGJa6HbedLT2M2DvcB/pRJWHO18ZsJT8xdgbArJ
 5Rx4fFR3Bz2++rT0cnEkEYzDeJpqfzE1Md+1jWRTTjmYMC3fidSKeoK7cvuU9b5cJ652
 pOqSV4f4SoLnfk2U+HMRWVt23HscjSqhAO01gAwAPlJ3XVYwfjSJzC55azyhXL/76G4U
 Bqxc/Iyvy3jNnOewByZ0l4aPMDhd0nYRSMiqLtF9Fo4CkeltoQ4kDJzM49jNGoaxOCNL
 q5ffU0x8cxOqyyS2+DjzvkflYt8tGkqjuTi1xq47Y3lYeWH/vvb9lvQUJHDhOTHEjWHa
 9bxg==
X-Gm-Message-State: AOAM532rX5sz5pq5IjME5tUM1HF5Dh8YCcriGP7+l2LZajDvFcBydF56
 oxez1dcQT8d8QCd5O92qq38em995raMwoIkJOdWrH4v8M5LO3A4GMsFzzvtnyxfoh4h5JqXFhzy
 QPJLiyLMuJneW
X-Received: by 2002:adf:feca:: with SMTP id q10mr8156424wrs.420.1629443844010; 
 Fri, 20 Aug 2021 00:17:24 -0700 (PDT)
X-Received: by 2002:adf:feca:: with SMTP id q10mr8156402wrs.420.1629443843828; 
 Fri, 20 Aug 2021 00:17:23 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id p5sm5560295wrd.25.2021.08.20.00.17.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Aug 2021 00:17:23 -0700 (PDT)
Subject: Re: [RFC PATCH 6/6] memory: Have address_space_create() re-use global
 &address_space_memory
To: Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210819142039.2825366-1-philmd@redhat.com>
 <20210819142039.2825366-7-philmd@redhat.com>
 <CAFEAcA_7t-9TpamdbAsyzYT7CFuQSjQt9YFj-1xG9fX_iMv5xA@mail.gmail.com>
 <20210820060703.njdj5pfa3lz66zjb@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ccdaacfb-4c3c-33c9-77b7-782a0be4fa58@redhat.com>
Date: Fri, 20 Aug 2021 09:17:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210820060703.njdj5pfa3lz66zjb@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Jianxian Wen <jianxian.wen@verisilicon.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CrvlVSmlghvw

On 8/20/21 8:07 AM, Gerd Hoffmann wrote:
>   Hi,
> 
>> This also seems to me to be the tail wagging the dog. If we think
>> 'info mtree' has too much duplicate information (which it certainly
>> does) then we should make mtree_info() smarter about reducing that
>> duplication. Off the top of my head, we could change the code that
>> prints ASes to do something like:
> 
>>            qemu_printf("...same as address-space %s\n", name);
> 
> Neat idea.
> 
> Having 'info mtree' accept an (optional) 'name' parameter to pick an
> address space to be printed would be useful too.

Yeah, for now I am thinking of a match string (for my use cases):

  (qemu) info mtree -a dma # all address spaces matching *dma*

