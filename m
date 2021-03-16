Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4431324lfg;
        Tue, 16 Mar 2021 03:27:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1nXiXCunwJ9N6gRs5bsAgfIt+uZEo/AcuMAtFaD/AlxLcA4f3RGcAOtJ0g0+IZVATuJkp
X-Received: by 2002:a5b:782:: with SMTP id b2mr5878475ybq.28.1615890428305;
        Tue, 16 Mar 2021 03:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615890428; cv=none;
        d=google.com; s=arc-20160816;
        b=eWfWqzLz4IAsgxLbMB0Z9/2tGVOFC1yNY3czGEN3RJrIx6W1yYhKyuKFuAsnUEhV/k
         ymMUpTtsvK58hSt0IEoXWlfIKYNmXGBAyuyCM480X4WRxdheX2XhZk/OA4GgK3oENxKX
         QON96FEXGHGwbE3K4Eeq/iRP8znQ8Z7I2GapWyDOm3KnbtGnYMpxewAWZa+nRrC1Hvy4
         HsVKyRW6C5NtTWvZ7m6KhGGL3vvWtQZKdSkkPl8lkqXpUoZbJEtF+hERQLm9jz9pKn/g
         a9P5PJTwawRQIzsDw7yTxLsTQdzBI3m3hGAuvq16aSAgSr4YfE4XJZ5irT6Vn3apd3Yh
         HaQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=5nVooUw+GVf0LKgNaCgMvtdnoEoKjFSwloyu3jzwSxE=;
        b=XTjy0NNmSMP36xKhiCWmr0+EteMTKalHJuQER7oOcaN2zab9rj5GKFxqikznR0sg/c
         JcdYIuXyHT6MgwBlG4lI2G2KomPbul/X7FJgR0xhriXV6SwMEPgk6Jhv/cpjwqjkt0Xr
         65SjlW+JTU9UBhCCUI5w1JiWkBxrgb89kAeQXip33CV0HOLuTRTQ1ay6XKiaCrzZTvSD
         AmPaUhCucFAjI1QjNDvwY+l0NIBWeE+c/ted9+nYqi46+rjQFS9LkTPtw6aMKhWHM7Wa
         WUZCPABdJvLm7ETKqJDleT2/k+sZALO6DxM5TxsOjy9m3ISXt+BaQyWg8/mKCac94cDp
         OlVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jT5a04Lb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si14694506ybs.461.2021.03.16.03.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 03:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jT5a04Lb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lM6up-0000te-KL
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 06:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM6ug-0000sp-8m
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 06:26:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lM6uW-0004BP-2l
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 06:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615890401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5nVooUw+GVf0LKgNaCgMvtdnoEoKjFSwloyu3jzwSxE=;
 b=jT5a04LbE8Nu1sByTb/2mfM333ZCdgFw/0gKla0zouPKP4pTF1ygsKd/ZFsCs1WBibo68d
 gVPf+OwG61R26xsGwcTVJaWruJNz1l9JHNVLw1wyeqrQUe1LU5wRRCr93SXKxKiY3PHufV
 SZhu2Lv90E5r8j5e/0eHKgbY9oo2NGo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-2fU79EXqMxu69KSXiyFqKQ-1; Tue, 16 Mar 2021 06:26:40 -0400
X-MC-Unique: 2fU79EXqMxu69KSXiyFqKQ-1
Received: by mail-wm1-f69.google.com with SMTP id r18so9360664wmq.5
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 03:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5nVooUw+GVf0LKgNaCgMvtdnoEoKjFSwloyu3jzwSxE=;
 b=AC37IJWVX0nDNOb1QInFt4ym31rWb+e6h/gg8VEs9ol68PMinTjQJatfMyVGe4rhv4
 +DMLDhAjuygslaU5Gsj8c+rk0rVS4qn0GTnzupKJTCpY6BvZxKzaLs6j8pX2mau41/1w
 cGLV36eC8ml+6+AtnkezziFoV/8mqpI84l4h+z0KHmFb2CNrpZTpOpFfRdXsrbhSWchv
 TQei8ezwoRiBdeW1/StLYIs3QiekSg9ZWRa+6YervFr5gPcmf4zjLsicgcOfLXP6URCH
 oKZLABNje8ZQrTceEbKHq+K/08xLNzkdWW2IuPLQ8ob74oVbF1QVEcliMI7rU01SlfLs
 zfwg==
X-Gm-Message-State: AOAM533lnsqKcAb0dDymG+zm8PKK1lilN9fn58rvsS6P3AT2j/qWsEKB
 l4f1BVM9HuVXcFSlK9XpeW1lMHNXONtA2sfMGPOkqU3/REuAiRyLv56VqhI60SOWc2p5+PZR8t2
 sBLJuN4HtJmW0
X-Received: by 2002:a1c:498b:: with SMTP id w133mr4134672wma.134.1615890399210; 
 Tue, 16 Mar 2021 03:26:39 -0700 (PDT)
X-Received: by 2002:a1c:498b:: with SMTP id w133mr4134646wma.134.1615890399039; 
 Tue, 16 Mar 2021 03:26:39 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y205sm3089792wmc.18.2021.03.16.03.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 03:26:38 -0700 (PDT)
Subject: Re: [PATCH 1/6] accel: Introduce 'query-accels' QMP command
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210311231202.1536040-1-philmd@redhat.com>
 <20210311231202.1536040-2-philmd@redhat.com>
 <b71367e7-eade-e7fb-d612-8bc18fba35c3@redhat.com>
 <87ft0va8wp.fsf@dusky.pond.sub.org>
 <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
Message-ID: <0b5efc04-817d-6e17-075c-86eab1b7ab1f@redhat.com>
Date: Tue, 16 Mar 2021 11:26:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <04e9cbd3-1773-c953-10a5-ad6299c35354@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CFwUm/eoEV80

On 3/16/21 10:02 AM, Philippe Mathieu-Daudé wrote:
> On 3/16/21 7:51 AM, Markus Armbruster wrote:
>> Eric Blake <eblake@redhat.com> writes:
>>
>>> On 3/11/21 5:11 PM, Philippe Mathieu-Daudé wrote:
>> [...]
>>>> diff --git a/accel/accel-qmp.c b/accel/accel-qmp.c
>>>> new file mode 100644
>>>> index 00000000000..f16e49b8956
>>>> --- /dev/null
>>>> +++ b/accel/accel-qmp.c
>>>> @@ -0,0 +1,47 @@
>>>> +/*
>>>> + * QEMU accelerators, QMP commands
>>>> + *
>>>> + * Copyright (c) 2021 Red Hat Inc.
>>>> + *
>>>> + * SPDX-License-Identifier: GPL-2.0-or-later
>>>> + */
>>>> +
>>>> +#include "qemu/osdep.h"
>>>> +#include "qapi/qapi-commands-machine.h"
>>>> +
>>>> +static const Accelerator accel_list[] = {
>>>> +    ACCELERATOR_QTEST,
>>>> +#ifdef CONFIG_TCG
>>>> +    ACCELERATOR_TCG,
>>>> +#endif
>>>> +#ifdef CONFIG_KVM
>>>> +    ACCELERATOR_KVM,
>>>> +#endif
>>>
>>> ...would it be worth compiling the enum to only list enum values that
>>> were actually compiled in?  That would change it to:
>>>
>>> { 'enum': 'Accelerator',
>>>   'data': [ 'qtest',
>>>             { 'name': 'tcg', 'if': 'defined(CONFIG_TCG)' },
>>> ...
> 
> These accelerator definitions are supposed to be poisoned in generic
> code... But I like the simplicity of your suggestion, so I'll give it
> a try and see what happens with removing the poisoned definitions.

This is actually quite interesting :) Accelerator definitions are
declared in config-target.h, but acceleration is host specific...

We certainly don't want to make qapi target-specific.

