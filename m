Received: by 2002:a05:7022:fa01:b0:6e:5a56:ff6c with SMTP id sy1csp21811dlb;
        Wed, 18 Oct 2023 11:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY2dmTmMm+ybJVKe6kewcdRTFPy/UbXPEiWzuMoI5eNnyoZVAHKE+svr03odagVM9ZVKPi
X-Received: by 2002:a0d:cc97:0:b0:5a7:c906:14f with SMTP id o145-20020a0dcc97000000b005a7c906014fmr95068ywd.11.1697653664545;
        Wed, 18 Oct 2023 11:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697653664; cv=none;
        d=google.com; s=arc-20160816;
        b=pTykNw6DuSMHDR3QTtJm1dKzFcP4dCIcFwtFWhWcaI5HrlSRP0znDBv2pT/nOaHfSJ
         gTlEdVsuL3H6niLB1sYHZ8HuhFWP0lsMiB2K4n4vHpWZHS4nAQXkx5rM8qgR6Ex3t8ci
         v6OZe4zyFJ+99nErt+jKvTbAdlIC8oIWNby5yWsjN1uRQIPg1PPiqmtWTac3SzfEUCBr
         hzesoCXzDIewRkNfQvYD332qhmDPfKr2a3ZXJUs581kHLujYqNvo7+lKgVP15nwDQOGX
         bdx0kyvJsuNSS0cDe6Y5cvWD8VfOO1V+CXipFi4dxXu/0kDADltOd86xQqgSVRl0l8h8
         7Jew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=J/aJnUer9JoXuSRF4qWJ0uKCMgAvC0REJ0j6S3rh7wA=;
        fh=eFDoKNrJE3v3BqwczSGYBHnIg7T/J/oamfU2KtoPZMA=;
        b=cZ0safpvbIE4WUq9v/mpd7hcIjuCrHnXbYC+hoAIl8km5TajOVXOVlTGj/pLFd9H5W
         K8sBRRL85EC7zAU0iZmR7MSEAcd1WdNpE+8XAZxNTT6fKGASvTautcn7NjP94XzgdVhW
         3h/c6ZRAC+omVaaTwhoeAEqnVg8oUuhw4UOuIpScZgWDYYo82a3eqkRgeJtUQlKrZO98
         RoO8bG0h5olaozylm65C+E3roNNB140c/RMPYTRzvZZpVX/wUx9X5+EUYSYMXNfrUmn5
         BJ8j2PUZId3YI98y3LZXEXpZWzTV0T0iHw8kgeOIKDRyIVqC8QQLYF/a/h8ABTppuBii
         atGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RooYbhYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm35-20020a05620a19a300b00774374a31c2si382792qkb.374.2023.10.18.11.27.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 11:27:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RooYbhYB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtBGc-0000BA-Nj; Wed, 18 Oct 2023 14:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtBGa-00007E-EH
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:27:36 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtBGX-0003Kd-Fl
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 14:27:36 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9adb9fa7200so1494839866b.0
 for <qemu-arm@nongnu.org>; Wed, 18 Oct 2023 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697653651; x=1698258451; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J/aJnUer9JoXuSRF4qWJ0uKCMgAvC0REJ0j6S3rh7wA=;
 b=RooYbhYBjYsrWZhgUjEknMc4bd1+qkimEmpWkNrZKy7MSfKKGRi9mZRGul4NT4CLM0
 +dxZaKV+MIoXbl7uXm2r7pb1ulD2xzL/z5NyUKjYVQ0dWLLHzoDxLPDQJxiRZRzgbV4F
 COJi7j1S4phHi5vJ7SP6o61Gi1c8zF9Loruee6SkMbDEjjvi8fYGcmSDAhoVdz7i6tJ2
 plHz0pTuQtoShVlZGl2cyzpMA/TjzHIGdTPY9SdJCcmAmTHy2oUYKllnfO0dcEXQqshl
 X6/or74OT6urIVKh+wenbhvV3taXuMMpVD3yhdXmMSuhwIq2XDH87v57+1f8SKAFydhI
 iYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697653651; x=1698258451;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J/aJnUer9JoXuSRF4qWJ0uKCMgAvC0REJ0j6S3rh7wA=;
 b=eTC8Na6xf4Ye1Iiyia4Is31URfrEwgsKWiGyFzDSsk0tegr69XSDvMjQsdfiezU9ls
 PJYN11ubOet7yTeB/VNw4mqjLzupEYR2BLGC2q4QCevZfwqh1gNmYeWdKIHmgwgPSHJB
 I7F/ZUcyRTrP0CTmynjyrKqYF65oydgDr9jBbAvkl4dUgJk+2BwLmykeAJJR4AtTec4p
 25fbrDW7OuezvMcu9a3ICMVHhOIX5o3rrCZVBa38w308GaDpJ7nHNuYksF3063oKPAl/
 ux8zWbLyH3T5Jn0T6L7WdpV/1FFjdchFz+IZu4d/4lgdsTL1Gu/sFofKG3880vBraL5U
 ubTg==
X-Gm-Message-State: AOJu0YxMDMza2efuUzYJvMqBpuk721STzx/FQZdHlWXW8gDPT4pT7Y6B
 LaF2NPL3VZWVFw/8e7KrxFevpw==
X-Received: by 2002:a17:907:2da5:b0:9bf:c00f:654a with SMTP id
 gt37-20020a1709072da500b009bfc00f654amr190882ejc.24.1697653650821; 
 Wed, 18 Oct 2023 11:27:30 -0700 (PDT)
Received: from [192.168.69.115]
 (gyl59-h01-176-171-218-149.dsl.sta.abo.bbox.fr. [176.171.218.149])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a17090651cf00b009a168ab6ee2sm2118955ejk.164.2023.10.18.11.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 11:27:30 -0700 (PDT)
Message-ID: <ff33d529-fe47-bd89-c445-55afc1651848@linaro.org>
Date: Wed, 18 Oct 2023 20:27:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 09/12] hw/s390x/css-bridge: Realize sysbus device before
 accessing it
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, Sergio Lopez <slp@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>,
 Song Gao <gaosong@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20231018141151.87466-1-philmd@linaro.org>
 <20231018141151.87466-10-philmd@linaro.org>
 <869ec507-0a64-4275-895d-dea04a79a1fc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <869ec507-0a64-4275-895d-dea04a79a1fc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fVvGhgGsGGK4

On 18/10/23 17:06, Thomas Huth wrote:
> On 18/10/2023 16.11, Philippe Mathieu-Daudé wrote:
>> sysbus_mmio_map() should not be called on unrealized device.
> 
> Can you elaborate? I don't see a sysbus_mmio_map() in this code here...?

I meant 's/sysbus_mmio_map/qbus_new'. Sorry, long day.

> 
>   Thomas
> 
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/s390x/css-bridge.c | 7 +++----
>>   1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/s390x/css-bridge.c b/hw/s390x/css-bridge.c
>> index 4017081d49..15d26efc95 100644
>> --- a/hw/s390x/css-bridge.c
>> +++ b/hw/s390x/css-bridge.c
>> @@ -95,7 +95,6 @@ static const TypeInfo virtual_css_bus_info = {
>>   VirtualCssBus *virtual_css_bus_init(void)
>>   {
>> -    VirtualCssBus *cbus;
>>       BusState *bus;
>>       DeviceState *dev;
>> @@ -103,19 +102,19 @@ VirtualCssBus *virtual_css_bus_init(void)
>>       dev = qdev_new(TYPE_VIRTUAL_CSS_BRIDGE);
>>       object_property_add_child(qdev_get_machine(), 
>> TYPE_VIRTUAL_CSS_BRIDGE,
>>                                 OBJECT(dev));
>> -    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>>       /* Create bus on bridge device */
>>       bus = qbus_new(TYPE_VIRTUAL_CSS_BUS, dev, "virtual-css");
>> -    cbus = VIRTUAL_CSS_BUS(bus);
>>       /* Enable hotplugging */
>>       qbus_set_hotplug_handler(bus, OBJECT(dev));
>> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>> +
>>       css_register_io_adapters(CSS_IO_ADAPTER_VIRTIO, true, false,
>>                                0, &error_abort);
>> -    return cbus;
>> +    return VIRTUAL_CSS_BUS(bus);
>>    }
>>   /***************** Virtual-css Bus Bridge Device ********************/
> 

