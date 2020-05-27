Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp981491lfc;
        Wed, 27 May 2020 04:24:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsnXWuxSbsWZrnehhykBVV5t+ppGuCv+IT8jVSAOJPLdIQfxwq13vY1I7aNadx5jM2nFvO
X-Received: by 2002:a25:bc81:: with SMTP id e1mr8754541ybk.311.1590578674752;
        Wed, 27 May 2020 04:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590578674; cv=none;
        d=google.com; s=arc-20160816;
        b=tKdXYtdx6GKHOYt4wxBZab9X36+D7s2tBXUmwKFonA9RTL+khxxwX2C/nHpPYCa50D
         Xrk55aBCqLkyUgT+aYHmFM0NlGtl06MOdBrzTPKK2cMM4HoMBeINRZVbCRmYxRS2frXJ
         DOjJheToL66DxRrtZLyiX33eFRiGmgVUXh8ecoQIUqqU9iqrpdjY4eiDNFVhKmRdUpBh
         jM88FUaUjAvuG6NyoVsU3dSEBxpGXVkF4iv39spqoGbMniUdlHleISldLMrNBFVHnLez
         S9WlYi8aPePtioFGmw8AEHTw7X27nUZs1GXNfW1m1xcduBLUHVLi9ZyJWzJ81xDsQpqB
         27Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=wXK5keqVzLVKsV98Q1CIzeEZ1VY8hzdxiB1xh8Y7CJk=;
        b=TBca6naAgRNzOoCq6708nEzRwOI/JhzjO1m7Bcqg4g2xsjKIzAak+j9mlSd3q1NdfH
         WWj6t98OKeRAtRkrQkMrcn+H/CFknk+qShq6+C78HdUBMkAZXgbgzfgdDnNPtGVar6Bd
         pfjvx6LaQk8+PgzWU2pnjm4GZJZoI1d2yNdpKSCoUmwPN/6bSIfPQ2ht9XQvQyb66tTR
         +gJ7bMZSvSFSaLcb04K4s41vBNxuoY8zM5nH65ngVjO0/szvBpP1nUmKiLKhFlVDNJv5
         ylxHlEBXIxZVqffhg06CPhWf4VeqgSi+dI7W1grYT4hDwpZl+YPsvh3wG0mtWERgUPrQ
         fxCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QMPgCDht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d34si2638107yba.462.2020.05.27.04.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 04:24:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QMPgCDht;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jduAk-0007lk-5j
	for alex.bennee@linaro.org; Wed, 27 May 2020 07:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jduAa-0007ks-Di
 for qemu-arm@nongnu.org; Wed, 27 May 2020 07:24:24 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31913
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jduAY-0006PH-Au
 for qemu-arm@nongnu.org; Wed, 27 May 2020 07:24:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590578660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wXK5keqVzLVKsV98Q1CIzeEZ1VY8hzdxiB1xh8Y7CJk=;
 b=QMPgCDhtvZMgVQds91c7PTjeMERtde+nql1IK/3QEQCyOjdH0wTwwl+fFskvTAdx35Ddk8
 lbsnbhLWgkHnfbBqct1J8W5MjFkRjff9J5uVCgZwRZpwoZ4yFXMEW0/7i3P35awzsULCYf
 lRaRk0eqTgM2icw2opB35fbkmuHC86Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-9hPxb9yrPoOC2PKSjGTREQ-1; Wed, 27 May 2020 07:24:19 -0400
X-MC-Unique: 9hPxb9yrPoOC2PKSjGTREQ-1
Received: by mail-ej1-f72.google.com with SMTP id f17so8762064ejc.7
 for <qemu-arm@nongnu.org>; Wed, 27 May 2020 04:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=wXK5keqVzLVKsV98Q1CIzeEZ1VY8hzdxiB1xh8Y7CJk=;
 b=efHvK9pn8mIDE7Oe4cFYhBxxVp+retumLHAQTqZb0PdVMtgh5N4Vxw+Th9iDnQ7jeQ
 YYCSc3ts9c/yUEXv/LCgHAbnhPtDeqNrT3SGQH/nSgchb31qvgk1Om0sD4jOtPQBbFZ9
 roGBcqJ7aK8gNipjXLU75GiSVbqHEDKS5Mc5flgWSJDuZpZsx6lVB1tcfpmITAfBEeQ3
 Sy3QTHHxytlBAtsIWO6Hbr2cMu2WJXcOArrKGgxaSrSHfgYboum3HSL5ylw/3phQ0I8E
 hnMryIgotuJ0GVLTwoN8xNMrvjJoxv6czXG5sU2GsyDmfg2XxKcIr912KoFDvHxOTRNH
 ZPtw==
X-Gm-Message-State: AOAM533h7s8qZGg+CO4Hr3OucnhATUspd7kaIK/u0WvZo6ql/X6wlxy6
 +YRqk3NIf1pgpaZeKImKGd7+5DRQjdFs4phqmUAFQo6+MbTZMNCpl1C1cA/qvkfYtsP0tHdkYUB
 yboY1Aos75CfK
X-Received: by 2002:a50:fb1a:: with SMTP id d26mr23569705edq.83.1590578657811; 
 Wed, 27 May 2020 04:24:17 -0700 (PDT)
X-Received: by 2002:a50:fb1a:: with SMTP id d26mr23569688edq.83.1590578657522; 
 Wed, 27 May 2020 04:24:17 -0700 (PDT)
Received: from [192.168.1.36] (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id o21sm2487237ejb.31.2020.05.27.04.24.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2020 04:24:17 -0700 (PDT)
Subject: Re: [PATCH 01/24] arm/stm32f405: Fix realization of "stm32f2xx-adc"
 devices
To: Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair23@gmail.com>
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-2-armbru@redhat.com>
 <CAKmqyKOun2FyT+JR8cyrP9eQn9xFDAppFb4W12ym-TPGt9h7Hg@mail.gmail.com>
 <87d0707bri.fsf@dusky.pond.sub.org>
 <CAKmqyKM3oOLfAxupqfabrj_epQCCE_YbwnkU4cRd5mtg8+7_yg@mail.gmail.com>
 <87blm9ralp.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <4d5649f0-df3c-d075-5c82-c80ecde08f95@redhat.com>
Date: Wed, 27 May 2020 13:24:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <87blm9ralp.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 00:49:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4HVoty7J3s9p

On 5/27/20 11:27 AM, Markus Armbruster wrote:
> Alistair Francis <alistair23@gmail.com> writes:
> 
>> On Mon, May 18, 2020 at 10:08 PM Markus Armbruster <armbru@redhat.com> wrote:
>>>
>>> Alistair Francis <alistair23@gmail.com> writes:
>>>
>>>> On Sun, May 17, 2020 at 10:06 PM Markus Armbruster <armbru@redhat.com> wrote:
>>>>>
>>>>> stm32f405_soc_initfn() creates six such devices, but
>>>>> stm32f405_soc_realize() realizes only one.  Affects machine
>>>>> netduinoplus2.
>>>>>
>>>>> I wonder how this ever worked.  If the "device becomes real only on
>>>>> realize" thing actually works, then we've always been missing five of
>>>>> six such devices, yet nobody noticed.
>>>>
>>>> I must have just been testing the first ADC.
>>>>
>>>>>
>>>>> Fix stm32f405_soc_realize() to realize all six.  Visible in "info
>>>>> qtree":
>>>>>
>>>>>      bus: main-system-bus
>>>>>        type System
>>>>>        dev: stm32f405-soc, id ""
>>>>>          cpu-type = "cortex-m4-arm-cpu"
>>>>>        dev: stm32f2xx-adc, id ""
>>>>>          gpio-out "sysbus-irq" 1
>>>>>     -    mmio ffffffffffffffff/00000000000000ff
>>>>>     +    mmio 0000000040012000/00000000000000ff
>>>>>        dev: stm32f2xx-adc, id ""
>>>>>          gpio-out "sysbus-irq" 1
>>>>>     -    mmio ffffffffffffffff/00000000000000ff
>>>>>     +    mmio 0000000040012000/00000000000000ff
>>>>>        dev: stm32f2xx-adc, id ""
>>>>>          gpio-out "sysbus-irq" 1
>>>>>     -    mmio ffffffffffffffff/00000000000000ff
>>>>>     +    mmio 0000000040012000/00000000000000ff
>>>>>        dev: stm32f2xx-adc, id ""
>>>>>          gpio-out "sysbus-irq" 1
>>>>>     -    mmio ffffffffffffffff/00000000000000ff
>>>>>     +    mmio 0000000040012000/00000000000000ff
>>>>>        dev: stm32f2xx-adc, id ""
>>>>>          gpio-out "sysbus-irq" 1
>>>>>          mmio 0000000040012000/00000000000000ff
>>>>>        dev: stm32f2xx-adc, id ""
>>>>>          gpio-out "sysbus-irq" 1
>>>>>     -    mmio ffffffffffffffff/00000000000000ff
>>>>>     +    mmio 0000000040012000/00000000000000ff
>>>>>        dev: armv7m, id ""
>>>>>
>>>>> The mmio addresses look suspicious.
>>>>
>>>> Good catch, thanks :)
>>>
>>> I'd love to squash in corrections, but I don't know the correct
>>> addresses.  Can you help?
>>
>> Yep, thanks for squashing it in.
>>
>> The three addresses are:
>>
>> 0x40012000
>> 0x40012100
>> 0x40012200
>>
>> and they all share interrupt number 18.
> 
> An the other three?  There are six devices in total...

Alistair looked at the stm32f205, which has 3 ADCs (and seems correct).

> 
>> Let me know if you want me to do it.

Alistair, the problem is the stm32f405. I guess the bug come from
copy/pasting then modifying for the shared IRQ.

    /* Timer 2 to 5 */
    for (i = 0; i < STM_NUM_TIMERS; i++) {
       ...
    }
    ...
    /* ADC device, the IRQs are ORed together */
    ...
    dev = DEVICE(&(s->adc[i])); <=== i = STM_NUM_TIMERS = 4
    object_property_set_bool(OBJECT(&s->adc[i]),
                             true, "realized", &err);

Only ADC#3 is realized, then mapped at 0x40012000.

You need to unparent the others anyway, so it is easier to realize
adc[0] and unparent the rest:

    for (i = 1; i < STM_NUM_ADCS; i++) {
       ...
    }

