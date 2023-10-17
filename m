Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3907695ejc;
        Tue, 17 Oct 2023 06:09:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhFehUIeH/q8sP6JhqugNrUZkO7mr3xgycfpxfLxTMXB/NvZ8e9TaZZ2v5B3gGVVBOSrf9
X-Received: by 2002:a05:6808:2209:b0:3ae:156f:d31e with SMTP id bd9-20020a056808220900b003ae156fd31emr2936238oib.1.1697548163616;
        Tue, 17 Oct 2023 06:09:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697548163; cv=none;
        d=google.com; s=arc-20160816;
        b=xCtSdzqjU2z8TJAXFOcyDgvggzNmVwGhPG0caRBe7W6jGejNvY0fRs12p42kl1Uer4
         jvsJH1aMG7bjduiBKrKkznZonKvpU75itNM2VEchd+HRbdmY8Kufqv/yqaQ1QO21z11F
         nFTRY9JhH9EUT+UYqdukrWaRQy7zyf+ukyaBXh4Aot8V7+HVA7QKJmFwgVVBQ4kHcL3f
         u4CgdM2sx8qxcSO96U7hjaYg9aF7cCjW1wAxkW1evMtv1plm5Z6siJaY0A2aoLrAHSbo
         vYZD0KG6EzlvvIi6AJSWAEfuBV8KU46KfZj5940PJ5Jj0Y8JkJXwTO4hmkV21CoCyJhr
         HoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=OdHpVOBGqtyjj6N6slLJ8VS4WGBxvZvhkhBf9bBth5c=;
        fh=PpZ1CCXoZMh/DRvZh+FxXhmYvb7cgaexUeWdx5nsuRU=;
        b=gE3JUgqgs8c9lHg7WFTRXLBQdXK5RPYfXLqjOSnmf5zuuAb9jIfrFymhJshfE+JO1j
         WMqrGHk2gohcOG4zQ5hmkbR4IOB7Xqt1TnhTctwUAkddsxOLH09c09Tcc1k+2aPv3SSf
         Pn4ogsAA6juBm5SB26EUXWv3/2QCS2WjbRWQZtHUyDdIcqQd26JByO8wtW3C+6xeuMZw
         Lh+S+d0xUpoAm8IMguRkgjl1zuYz18/ioGNbHx3Ge2+E3S8inQqM3Afm0cwEj0/GMV0h
         Ii1EVUNnl8tMr29+SGyAM7O7SB2g4zmSXBfD3Bofn96/oDYS1NTojCBVqR6f5rmmr4NL
         aHoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eb1GMh6n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d133-20020a1f9b8b000000b00496d0a5cba8si130146vke.0.2023.10.17.06.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 06:09:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eb1GMh6n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qsjov-000754-Mz; Tue, 17 Oct 2023 09:09:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjot-00071O-4F
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:09:11 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qsjor-0005bw-Fs
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 09:09:10 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4065dea9a33so53150265e9.3
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 06:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697548147; x=1698152947; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OdHpVOBGqtyjj6N6slLJ8VS4WGBxvZvhkhBf9bBth5c=;
 b=eb1GMh6nrHAvugzrUT7hVQVrfOPuiJc767FD7BQKdUwOazyclj3S7rg2bcCr5tyUg+
 xxCzNukjsP0sFr+XiB4rcgO3r4rYBLKd7bKZefHUMGwoNEQi8IilUqLgDeBVwLhqbV5M
 6x/CvleLEPKMWFhMFwX5H3+gHVU2w/y3+gZJgRPMnRjNP0WvI2ZrxNZwG5WYEQpK+Jir
 EbK/WeGxh1B+I1In1WK3N2aocpN5srlE9Qh+YYLWDbiKm11oAkeCriSFjCZ1TryxmLVk
 CVKiLIudbmnjGc0eTjQeE+BPtH0TandAmyXn4aOAwUM4ffiYGScztbT2j2Btw0Q4UEhi
 E4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548147; x=1698152947;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OdHpVOBGqtyjj6N6slLJ8VS4WGBxvZvhkhBf9bBth5c=;
 b=kUK7730zsA+3wGRZvS7i77FB/V8WGzHXLMHlji3De3k2+/WXln7aVWvV5uBaLi8W/3
 AHnfTIcaxq6RCkEKQoe+9VNxNsJ5FxNIOZJKR8anOQIfpaBAVdSHQGi3cgHP03i7otye
 TXKQoP6AGOIwEgZf2ockQ5kDKUUE8agkaE6CwvIyxxVn0+3cjAxP2ObgRGHdSbbBd/ln
 g+v+4RNPfTOjvIKQ5g8w5zy33S/z9irjyEukp9Z4xy/zB+h5Hu2g+2l751j2sZfnpFVk
 St08goJXaZh6urYUrt/SXh7yP88QLw8WJbUV9mlfZvWGmrj0NrCb2vab2f9S5wV/BczQ
 tBzg==
X-Gm-Message-State: AOJu0YxXF4LIIKb/CxOVjUyKaI+NnJKEl10xtNJwcE1ng8ThZhK6Tk5L
 eK2FHcDk/uMh83aUo2vcPNABww==
X-Received: by 2002:a5d:4e45:0:b0:32d:b411:4667 with SMTP id
 r5-20020a5d4e45000000b0032db4114667mr1761638wrt.30.1697548147408; 
 Tue, 17 Oct 2023 06:09:07 -0700 (PDT)
Received: from [192.168.69.115] ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a5d4a86000000b003271be8440csm1645124wrq.101.2023.10.17.06.09.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Oct 2023 06:09:07 -0700 (PDT)
Message-ID: <ae8c8832-4d67-a0dc-5dc9-2a7da560f2c9@linaro.org>
Date: Tue, 17 Oct 2023 15:09:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 4/6] hw/input/stellaris_gamepad: Remove
 StellarisGamepadButton struct
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231017122302.1692902-1-peter.maydell@linaro.org>
 <20231017122302.1692902-5-peter.maydell@linaro.org>
 <c61b98d3-cafd-862b-09ad-818a5e2f051d@linaro.org>
 <CAFEAcA8OfRyVnP-tdMWz0g9HvYJtQb6xDha1zO05Dp855_SMfw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8OfRyVnP-tdMWz0g9HvYJtQb6xDha1zO05Dp855_SMfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.339,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: p7Hu22AFtCyl

On 17/10/23 14:52, Peter Maydell wrote:
> On Tue, 17 Oct 2023 at 13:44, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Peter,
>>
>> On 17/10/23 14:23, Peter Maydell wrote:
>>> Currently for each button on the device we have a
>>> StellarisGamepadButton struct which has the irq, keycode and pressed
>>> state for it.  When we convert to qdev, the qdev property and GPIO
>>> APIs are going to require that we have separate arrays for the irqs
>>> and keycodes.  Convert from array-of-structs to three separate arrays
>>> in preparation.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> ---
>>>    hw/input/stellaris_gamepad.c | 43 ++++++++++++------------------------
>>>    1 file changed, 14 insertions(+), 29 deletions(-)
>>
>>
>>> -static const VMStateDescription vmstate_stellaris_button = {
>>> -    .name = "stellaris_button",
>>> -    .version_id = 0,
>>> -    .minimum_version_id = 0,
>>> -    .fields = (VMStateField[]) {
>>> -        VMSTATE_UINT8(pressed, StellarisGamepadButton),
>>> -        VMSTATE_END_OF_LIST()
>>> -    }
>>> -};
>>> -
>>>    static const VMStateDescription vmstate_stellaris_gamepad = {
>>>        .name = "stellaris_gamepad",
>>>        .version_id = 2,
>>>        .minimum_version_id = 2,
>>>        .fields = (VMStateField[]) {
>>>            VMSTATE_INT32(extension, StellarisGamepad),
>>> -        VMSTATE_STRUCT_VARRAY_POINTER_INT32(buttons, StellarisGamepad,
>>> -                                            num_buttons,
>>> -                                            vmstate_stellaris_button,
>>> -                                            StellarisGamepadButton),
>>> +        VMSTATE_VARRAY_UINT32(pressed, StellarisGamepad, num_buttons,
>>> +                              0, vmstate_info_uint8, uint8_t),
>>
>> Don't this break the migration stream?
> 
> Yes; this is OK because we don't care about migration compat
> for this board. But I forgot to mention it in the commit
> message, and we should bump the version_id fields too.

OK, this is what I thought (I'm still trying to correctly understand
that myself). With that updated:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


