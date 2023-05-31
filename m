Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2681925ejb;
        Wed, 31 May 2023 00:48:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6/eW3dhHDKt+kY140d72CViPXjkQnjGb6+Hl2uE5SiX1lY4zmORGGWfSVAP442S8eMLS4w
X-Received: by 2002:a05:6214:21e6:b0:627:3d57:b3ae with SMTP id p6-20020a05621421e600b006273d57b3aemr2396022qvj.55.1685519282360;
        Wed, 31 May 2023 00:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685519282; cv=none;
        d=google.com; s=arc-20160816;
        b=QWPPP/LcEry9DbALICifU8vbx/Qx8uOeC8PRPbwE7bcdKAo809kk8QFSFFv9PdbYJP
         Rz1aRuKUgkR1+htbW0EGu8WTONThD7ydEBoyg5jkyrxzx9m3iufExgbsKOQYpl2eLzBS
         hrH96wgtNru/qH05AsvTTPFfRhFyV1L63niVAG5/20/oLCCAML6ENq1SLLZSrmCIZTuk
         USlnEBNQUy5soFzVOYaZzgqBnk4clrokVVZUX3QOUzXXkOZ8+T5ZedLdBaF0hYbLgFjD
         hNmiguVE3Bt4Xcbeyc95gDXOY8Rz81fzteAmPoEtweRtXc+3ppGIdt14qV6G6L1PyI7X
         e6Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=vhp1eH68oQGsqdwowJaDRJJqZ0y6oVu12E49kh7J3pY=;
        b=oDAOg6RUxbdCgFwi8G2AgXLSCRBzYjuDHeH6/Y64/pD/D7fDeUBapM+v1q2L3qMSO2
         CFgsJGtTppCkjTqqNlClFAR/d5GuTlBdLpG5l0Nr5DiLhz2iIUjXJHArM7vivyoCzQmL
         UfhzPhwydDSa35izQEoo7dNTdvMGvsSRLh9tfQPTO4MJdp37k0+u0TmrjNWUJ+3FaYlv
         CABHvbJa4UNuleqBRQpcj8rBHJ1DPSQWOgbIHAfzfd2gEcyFaxWxpSQlQsNpNmO0jTsf
         fIPlHHoWKwdv1ghfepjvu0ajVJll6Xub0LcKZ5/DwTnb4gw82qwcpZbqu9rpldaZw+it
         iOGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbdZPB9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gu5-20020a056214260500b0062377b26dddsi8017678qvb.572.2023.05.31.00.48.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 00:48:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GbdZPB9P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4GYl-0000jn-Al; Wed, 31 May 2023 03:47:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4GYj-0000jC-3H
 for qemu-arm@nongnu.org; Wed, 31 May 2023 03:47:53 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q4GYh-0001ii-F6
 for qemu-arm@nongnu.org; Wed, 31 May 2023 03:47:52 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-30aeee7c8a0so498719f8f.1
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 00:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685519270; x=1688111270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vhp1eH68oQGsqdwowJaDRJJqZ0y6oVu12E49kh7J3pY=;
 b=GbdZPB9P4I35lBa4K4cMz7jZk8jakR3wwymwzWthhstDs+zcojrouVs5zGaThCwwPe
 k6BFlGRKQoXtQWNn2Av+W9o+wzR2lD5LcR9xPKQ2hVDg+MPXHvWa3fpjBNe8do6+0Rfj
 9n6J7CmAlMCFZ6AghZisQtm33sehls+XfaPvbg0ukDONLn9aL7Ssy/UTdO0Boerq9Urs
 L/5nywCPkv5n/w5/JbKgRQ7LVs0i/4i73ddBMJfkd1euQJ8kpM8XMaWVKD6/jsJXYiJL
 4yf1/lnlL9p2z++B+82D+JhCZyb54ONjM9lMKl1Qj16R06ugbtkY5938G5AVOmHmrPNA
 yCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685519270; x=1688111270;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vhp1eH68oQGsqdwowJaDRJJqZ0y6oVu12E49kh7J3pY=;
 b=Dww8mCiO/LlzP8P5uFlX0ZJ1r/JWOrU96xZ/3U+2z/ZrqIiFhZK5qQL9VyAazj8M/h
 +p/IMoK0RhTfe0faTxmbFxXHWrns/aXXccPpEEmp4zGH8Z9gz8Ehfr5H+YkaqtW/DoDG
 rkjeNxDSuyHtvR7ntWYH3n4UZtYXVLWBuEW3Zp+LaUwjtcu1pLeeGDLh/ouAgibZkClU
 TuzJZT3n09MzdnIcOb6WmfhiPSK7nXx2gf9+H+YVzVTre2XwEGHrKU/L0mTUZ0t6EiOk
 kiKoD0o/VHKlFCgbH4rJwyHw3a22bA8EHJHT4s8czneSJO3PmGz9GGbhJGY7pkjnzRlC
 AxlQ==
X-Gm-Message-State: AC+VfDyS0gNP6C9opgMk5IelgsXzV9ueQQutTpP5gS3s90a/avALmrWH
 l5cSpn0imkFIvl8cngrUu8PZZw==
X-Received: by 2002:a05:6000:11ce:b0:307:869c:99ce with SMTP id
 i14-20020a05600011ce00b00307869c99cemr4056530wrx.21.1685519269817; 
 Wed, 31 May 2023 00:47:49 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.146.12])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a5d638d000000b0030ae3a6be5bsm5766684wru.78.2023.05.31.00.47.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 00:47:49 -0700 (PDT)
Message-ID: <f29df320-5392-b6c0-9bb4-c5f0330fe91c@linaro.org>
Date: Wed, 31 May 2023 09:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 09/12] m25p80: Introduce an helper to retrieve the
 BlockBackend of a device
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Alistair Francis <alistair@alistair23.me>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-10-clg@kaod.org>
 <5587a39e-1c17-2997-f679-d43a023149c6@linaro.org>
 <516d4f95-a070-a03c-317c-2276cd42e871@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <516d4f95-a070-a03c-317c-2276cd42e871@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: c6Rs92Ag3O1G

On 31/5/23 08:48, Cédric Le Goater wrote:
> On 5/30/23 23:14, Philippe Mathieu-Daudé wrote:
>> On 8/5/23 09:58, Cédric Le Goater wrote:
>>> It will help in getting rid of some drive_get(IF_MTD) calls by
>>> retrieving the BlockBackend directly from the m25p80 device.
>>>
>>> Cc: Alistair Francis <alistair@alistair23.me>
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   include/hw/block/flash.h | 4 ++++
>>>   hw/block/m25p80.c        | 6 ++++++
>>>   2 files changed, 10 insertions(+)
>>>
>>> diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
>>> index 7198953702..de93756cbe 100644
>>> --- a/include/hw/block/flash.h
>>> +++ b/include/hw/block/flash.h
>>> @@ -76,4 +76,8 @@ uint8_t ecc_digest(ECCState *s, uint8_t sample);
>>>   void ecc_reset(ECCState *s);
>>>   extern const VMStateDescription vmstate_ecc_state;
>>> +/* m25p80.c */
>>> +
>>> +BlockBackend *m25p80_get_blk(DeviceState *dev);
>>
>> - Option 1, declare QOM typedef and use proper type:
>>
>>    #define TYPE_M25P80 "m25p80-generic"
>>    OBJECT_DECLARE_TYPE(Flash, M25P80Class, M25P80)
>>
>>    BlockBackend *m25p80_get_blk(Flash *dev);
>>
>> - Option 2, preliminary patch renaming 'Flash' type to
>> 'M25P80' then option 1 again
> 
> That's a large change

Yes, it can be done later if you rather.

> and we would need to introduce a m25p80.h with
> these definitions.

FlashPartInfo is used as pointer so can be forward-declared.
Then we only need to move M25P80_INTERNAL_DATA_BUFFER_SZ.
For 5 lines, "hw/block/flash.h" is good enough IMO, keeping
all the rest to m25p80.c.

> Given that the caller needs a DeviceState in the
> end, may be not worth the extra hassle.
> 
> How would you rename 'Flash' ? 'SpiFlash' ?

Since you ask, my preference is SpiNorFlash :)

But again, this can be done later on top.

Thanks,

Phil.

