Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp208803eje;
        Tue, 13 Feb 2024 07:40:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWX2Q9KjdyvabCX+/IamhyCJECiZFxkYrSSc5MQ5doV0AiLxKu4HwiGjZIOnRphJKSBCcjwJ3te17G6wblbTbnHFNgX1A4w
X-Google-Smtp-Source: AGHT+IGc9nHv3fMH8mfnGwFAmQgQvKXnGZazz17A3sMdgPYEWDzavWoMwlL6anZPbo+K4O+lPnUc
X-Received: by 2002:a05:622a:64c:b0:42c:2763:29dd with SMTP id a12-20020a05622a064c00b0042c276329ddmr12355917qtb.31.1707838823819;
        Tue, 13 Feb 2024 07:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707838823; cv=none;
        d=google.com; s=arc-20160816;
        b=H54bD10WWz/gj+NGhKYQvCx4sTrkuAWefqCO5a3SC/CKdY4Uz+2bGhGZg6jzlWEAHF
         B9IUzWB6KN/0laqE0BscrPZlx30ryY7F+x/Vj6poxQLLkIYtysMbEDHdLUEL/0ANAFt4
         lWKzio3vB59qVjFv41oDvYtw6uPtJ0yLgiPHmk7Q8rpmg1D4/mS1jxbPkQcYEK2JwsqH
         q3nSKo5KHlj97rj9ql6d5FcIqLeWsYmagiXcM41HCRrwfY9TPeKPEjByr6OBmEEUckWq
         qupUblxZMBvke2q2JKYgVftNarAkfP3+icYh16UhPW2dPZ510phFI+HpLnQZEiqSkDis
         m+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=SmrZJw4bKV//wO3UnInKA+bacSwXMbHyerzi/lTez/c=;
        fh=e+dqK/xlxZhHBQKRoY0plPxIqsA4HWfVbkPZ39H7e/M=;
        b=g1STLlvLpNvJ+4Zd5iINmwhlJMU150yI2AbV/2NXYU/ec7uJl4XGMBd1ww4SMLPn6F
         iZ2XZ2Yn1Dmviy1dsfIqIJ1vhJDDKiKph+BsKNLrEQOYJkIr0WpeQn3G+uOJInYILk64
         dfonoyZJLiITfBotaJepQ8bY7UcsJ8zQ3UPPIW2CXbGFjddkb3FSuq+UNCP6/Q5CMUqL
         tpxbTzf0RVOYbUBTjUpatBFAY6y8GwclJ8UgIprw/qzW40C3Wbwl9DR0ypzvIlXOLUn7
         oBkP8sbELcf9k9a3rT+wTAQ/B65qW4ftR6rMbdhAhpYrKi7Df6azBqVguEBozs8WZFby
         vEKA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YMzGU5tY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=1; AJvYcCW6Cb4rW+nub5ZCNYEEw1ltKh3ozIEKAYanGev9CARrasYzCGqyFGcferOWI6BlNSUq7dFmngLlt8OkOkHfkuvKIi4o1zVw
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15-20020a05622a180f00b0042aad1f71bdsi3258183qtc.618.2024.02.13.07.40.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 07:40:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YMzGU5tY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZutO-0004mY-KL; Tue, 13 Feb 2024 10:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZutK-0004ly-3U
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:40:14 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZutE-0003P7-IY
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 10:40:10 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d094bc2244so57626371fa.1
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 07:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707838807; x=1708443607; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SmrZJw4bKV//wO3UnInKA+bacSwXMbHyerzi/lTez/c=;
 b=YMzGU5tY5w1DKGHg7g0O0tyGLOQ/dKe2IOS3zCHc8p7qT4oqdc0ytgURU7GbzocwN0
 8qnb+N8Lq4RuSFfQjqD8rOIO4FagwxbJhxQiOdCGdEBlCxWYgidzs1UjiHpuW1Sjp9I6
 R9k4BZvaurFx3uLitsk9/lTkishJbK3r/vYGFMvOmHTFzFk4ZneLFEHYLSBSZfCgoWIh
 PJcrXbUs0liLKWAB5Mu7jZIRdsZyoRLE2UdLlLkpld8itjwVCawUaWBLBxlPzIm0r4y0
 OBw0yztGngpWWbyRuNQKrLU2JberPJjtla5RqgOpKzse8zJ1dhEqwXvPA06Mr08iMSqJ
 wt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707838807; x=1708443607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SmrZJw4bKV//wO3UnInKA+bacSwXMbHyerzi/lTez/c=;
 b=OObECXew6S7/u+o5Yj4A0NDu17Ny4eSphUjf6mVPReCvVRTA+HzoLokWysf08WhoAi
 Knpfiniu5l6LsGLaqkZLjxjm/BAQ4I5KovHnlY33AtGrOhS4s7T5bHBe5/O5aWWwG7d1
 ESR8CA/urr647BOXHloSaNwrfMvdF/ncusRGdgyRq2S7t9vUkBHb5higj925eqnLy6kn
 L0zY/Riu+ZL7MQNYF6vr01VoSzsgGdfNhOVYNHrTrBHUUi5utg+UCqx30U/WZij/Eh6r
 eknAiAmBVPPUxRYDxrRbA0Nx07IPfqIxJid69TyhXIT/J6MUibWDOUqE1Kfegq29VsCT
 6Dsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU34RF2meJdr6ArgzeOnqtDyFAVRrUO3bCzBBVHhTMfpyZWK7kitaCDt9JGnpT1SM0aSInUMqYcNoJk+FWjdcAFPUD3
X-Gm-Message-State: AOJu0YyqNwChcVCsOY1P4fDkFQS6tqazGAS+9dbTdOJtxBuMK8wZPg+N
 C18NYjhKiki65Kr4agtEdJoYIPi0jhoAbF4uJRU50PRWeeo9OTGTJvpvDDJL2Mg=
X-Received: by 2002:a2e:bb85:0:b0:2d0:d451:f795 with SMTP id
 y5-20020a2ebb85000000b002d0d451f795mr25625lje.6.1707838806776; 
 Tue, 13 Feb 2024 07:40:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU5MEh0HdP9x8Azlz6kIRfOruaIGY1Z1vmtmOYkSC8GNf0iFbHKexsCLOX2tVGYQAQuzNeNe+SvS3EmsdiBpu+Vi2fud455m+gTngy223Rf6OwBDeEphxVHtOUpQhgqxlrq0+0N1xIbUFqIFFAhiDGFDpdE9DqZ5sJIhJJbWYzptx1wOhI+ZoQLi0AyxtXYS1n/
Received: from [192.168.69.100] ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a05600c0ad800b004107dfa6aebsm11822809wmr.28.2024.02.13.07.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 07:40:06 -0800 (PST)
Message-ID: <58e53c46-6a76-4bcd-93d9-329ddd41bbda@linaro.org>
Date: Tue, 13 Feb 2024 16:40:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/arm/stellaris: Add missing QOM 'machine' parent
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org
References: <20240130190317.25692-1-philmd@linaro.org>
 <20240130190317.25692-4-philmd@linaro.org>
 <CAFEAcA-w+=dy3_oiz63eg2AcS-vu93ZFrV1ZKF7iTC3eSYRHTQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-w+=dy3_oiz63eg2AcS-vu93ZFrV1ZKF7iTC3eSYRHTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Pl6ko0XhuvDG

On 1/2/24 17:28, Peter Maydell wrote:
> On Tue, 30 Jan 2024 at 19:03, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> QDev objects created with qdev_new() need to manually add
>> their parent relationship with object_property_add_child().
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/arm/stellaris.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
>> index 284b95005f..bb88b3ebde 100644
>> --- a/hw/arm/stellaris.c
>> +++ b/hw/arm/stellaris.c
>> @@ -1247,10 +1247,13 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>>                                      &error_fatal);
>>
>>               ssddev = qdev_new("ssd0323");
>> +            object_property_add_child(OBJECT(ms), "oled", OBJECT(ssddev));
>>               qdev_prop_set_uint8(ssddev, "cs", 1);
>>               qdev_realize_and_unref(ssddev, bus, &error_fatal);
>>
>>               gpio_d_splitter = qdev_new(TYPE_SPLIT_IRQ);
>> +            object_property_add_child(OBJECT(ms), "splitter",
>> +                                      OBJECT(gpio_d_splitter));
>>               qdev_prop_set_uint32(gpio_d_splitter, "num-lines", 2);
>>               qdev_realize_and_unref(gpio_d_splitter, NULL, &error_fatal);
>>               qdev_connect_gpio_out(
>> @@ -1287,6 +1290,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>>           DeviceState *gpad;
>>
>>           gpad = qdev_new(TYPE_STELLARIS_GAMEPAD);
>> +        object_property_add_child(OBJECT(ms), "gamepad", OBJECT(gpad));
>>           for (i = 0; i < ARRAY_SIZE(gpad_keycode); i++) {
>>               qlist_append_int(gpad_keycode_list, gpad_keycode[i]);
>>           }
>> --
> 
> We create almost all the devices in this board with
> qdev_new(), and we don't use object_property_add_child()
> on any of them. What is it about these three devices in
> particular that means we need to call that function?

In v2 I added to the description:

     This commit plug the devices which aren't part of the SoC;
     they will be plugged into a SoC container in the next one.
