Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1001988lfc;
        Mon, 9 Mar 2020 03:57:51 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvkQQ/nKUvJDpsZFuWiiKQf9pJxmvAlKIvNwxpS1q35Q5A0FgyJuXXKHAygIet8otCiocXx
X-Received: by 2002:a05:620a:22ea:: with SMTP id p10mr14114083qki.75.1583751471643;
        Mon, 09 Mar 2020 03:57:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583751471; cv=none;
        d=google.com; s=arc-20160816;
        b=g6/TG2NzfnXxV0XmTa9ObIzgNXdku7gJNWCDrvWWHedAe0iONpTQbsj6MvkrPKTiR/
         ijVtnw5SSjo+1i0E5ihC5j9SPubu3l7edxXVabR6kksvCBEQ3sk12wBFQVCU1RnUMggF
         GAjdhRpRUNQTyCktLJpePQKQFI1xuT30DwrM9W7F+9XZUQic5zPXrFH6lS0ygAnUmdCs
         FVtc8KqR80h8LIV/yHMtu65wNeDghLwXCafJHBqEAKByGWiGAHa+BmjDoaGGdoC4tv4N
         TgjRmmQrHHs6T4ieXh7N7GgdnaGkI+7UTR66CqBjI6+eI1i02j9xso6Ys1CTbLX4sd8Y
         UqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=FyF79uDSNowMiBaGgFXRj7LyLnmpVBSm3VGRAE8Sw/I=;
        b=o4fUdVLIOgWx2wrAo2QgT2wP2/5NKIOL7gkWRghnsOOcvrlS7kDBtdWToVWjpfPk9x
         DMdKVzF2jAEbbl9eB3EVU3lqr0RrBo5JUhW4Bk4kPRfEbhytv2p2Iwum51JLUjM7zJo6
         2FYb0XJA9FAfnAfGc8Q37+BIsLd1pNacTf294Cs7KJWSw4dBYxXWbmHRjmpkmEBp7Z3r
         seyHA55Qf+mVMf7f2zEVo4wJOn4Ihs4NJFN0yG18TxvSL9NkehHTfPOfObLukSQVeKJy
         oudIiRFEcohjN5c1Mq4JZGF+raXuQ+harb+kINySAVR/4Syo8ZaJXqRt+AM9PtGyK5ah
         8c8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OsZkklko;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si5178063qvq.211.2020.03.09.03.57.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Mar 2020 03:57:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OsZkklko;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jBG6Z-0007wm-3B
	for alex.bennee@linaro.org; Mon, 09 Mar 2020 06:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43846)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jBG6Q-0007wV-QS
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 06:57:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jBG6P-0000Ki-KF
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 06:57:42 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:33036
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jBG6P-0000KI-Gd
 for qemu-arm@nongnu.org; Mon, 09 Mar 2020 06:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583751461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FyF79uDSNowMiBaGgFXRj7LyLnmpVBSm3VGRAE8Sw/I=;
 b=OsZkklko/JZWlkz1zQ++eelSJNnuP/Lb3lNKCmCDwS1s2wq+xz7ma8S4y/OHgF3EM0HvEz
 tuHsbDvmuAMKU9Vp0JU8kTYK/zQf3tTyHfQLnx1z76zF9lZNrZQw/6fk/qGk9YRe9sf1Jq
 syqljwBnJUYypO5+NzA7wQGZOcEnxEI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-96-I9u7XajlM52q9V1mrYka6Q-1; Mon, 09 Mar 2020 06:57:39 -0400
X-MC-Unique: I9u7XajlM52q9V1mrYka6Q-1
Received: by mail-ed1-f70.google.com with SMTP id d11so7662247eds.7
 for <qemu-arm@nongnu.org>; Mon, 09 Mar 2020 03:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1K5028EpyDpycuXB8fjyFJB5EeKvDdUsMI8EIJHMlMI=;
 b=jUjYNrTV8GyoZ+VAVWWFFJsCQERK2ZxcvUtdq+1qhWKVYG9tzrE2KmFry7bC1Awg8T
 GeuBVL9m33AmBKGkHjO0kVt4C2zcALz/eBu3R76jhZCRkRWDE9XrLj37eKnIvJ0Rj9rm
 sG+Svzb9OF0OjejKfQLRbpPrG64U4Y+4yji1UCcFCEUjaZItHjky7aNuDToWcuq2fr/o
 3E9Oupbe6b9+i24aFehxAkoWJmOFM1ljbJOwtaoWsFEM4GZDBiWqNsHdOBEd4J8r5MSA
 Tgincz0XX9bK/uyCIY5KvSpydvVZL/0dSG49Vi57CirELM2uEI/R/5FRxEnJk/8XKzgI
 QO2w==
X-Gm-Message-State: ANhLgQ0+QGOUveihI6TDrh/fJMriK24iWTdbZo2imG8mrQAstg/1GpR5
 ygScTz0vtVOb4rnurOFZ1iPSE1mqBNjUxxHy6Nl9o0eLQmmfASHrnZvlR0UPF2ydzJPkL5ZKMgs
 2zw1hqhOgB54Q
X-Received: by 2002:a17:906:37d5:: with SMTP id
 o21mr14585319ejc.366.1583751458110; 
 Mon, 09 Mar 2020 03:57:38 -0700 (PDT)
X-Received: by 2002:a17:906:37d5:: with SMTP id
 o21mr14585304ejc.366.1583751457862; 
 Mon, 09 Mar 2020 03:57:37 -0700 (PDT)
Received: from [192.168.1.35] (47.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.47])
 by smtp.gmail.com with ESMTPSA id b72sm844087edf.95.2020.03.09.03.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 03:57:37 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/arm/armv7m: Downgrade CPU reset handler priority
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Stephanos Ioannidis <root@stephanos.io>
References: <20200227112617.66044-1-root@stephanos.io>
 <20200227112617.66044-2-root@stephanos.io>
 <CAFEAcA9qbndHqoW1oaUAKMZY5hNYjP+mMt-K_WqoT9Z=Q=ct7g@mail.gmail.com>
 <e1813f57-57ac-e6ad-d119-dd6c2cdc90e1@redhat.com>
Message-ID: <34d14a57-812d-5898-9dfc-ac896f657c9b@redhat.com>
Date: Mon, 9 Mar 2020 11:57:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <e1813f57-57ac-e6ad-d119-dd6c2cdc90e1@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1EYfrdLsWp5S

Hi Peter,

On 2/27/20 2:35 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 2/27/20 1:13 PM, Peter Maydell wrote:
>> On Thu, 27 Feb 2020 at 11:27, Stephanos Ioannidis <root@stephanos.io>=20
>> wrote:
>>>
>>> The ARMv7-M CPU reset handler, which loads the initial SP and PC
>>> register values from the vector table, is currently executed before
>>> the ROM reset handler (rom_reset), and this causes the devices that
>>> alias low memory region (e.g. STM32F405 that aliases the flash memory
>>> located at 0x8000000 to 0x0) to load an invalid reset vector of 0 when
>>> the kernel image is linked to be loaded at the high memory address.
>>>
>>> For instance, it is norm for the STM32F405 firmware ELF image to have
>>> the text and rodata sections linked at 0x8000000, as this facilitates
>>> proper image loading by the firmware burning utility, and the processor
>>> can execute in place from the high flash memory address region as well.
>>>
>>> In order to resolve this issue, this commit downgrades the ARMCPU reset
>>> handler invocation priority level to -1 such that it is always executed
>>> after the ROM reset handler, which has a priority level of 0.
>>
>>
>> I think we should be able to do this with the new 3-phase
>> reset API : the rom loader reset should happen in phase 2,
>> and the Arm CPU should only load the new PC and SP in
>> phase 3. It's on my todo list to write some code for this
>> to see if this theory works out.
>>
>> I'd prefer it if we do it that way, or alternatively find
>> out for certain that that approach does not work, before
>> we add a reset-priority concept to the reset APIs.

FYI I hit the same problem testing the RX port which on reset loads $PC=20
at 0xfffffffc. Using Stephanos's previous patch and=20
qemu_register_reset_with_priority() in cpu_realize(), the issue is fixed.
I plan to carry the patch in the RX series until we find an alternative.

>=20
> Agreed.
>=20
>>
>> (In particular, this use of qemu_register_reset to arrange for
>> the CPU to be reset should ideally go away in favour of having
>> the CPU reset handled by the SoC which owns the CPU, so it's
>> not a good long-term way to look at trying to fix ordering issues.)

And your "cpu: Use DeviceClass reset instead of a special CPUClass=20
reset=E2=80=8B" patch goes into that direction :)

>=20
> It would be nice to get ride of qemu_register_reset with the reset API :)
>=20
>>
>> thanks
>> -- PMM
>>

