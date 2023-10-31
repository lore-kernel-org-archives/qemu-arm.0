Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp340394ejb;
        Tue, 31 Oct 2023 07:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGf4PPq+/dboBEH/seFim7pHQ2D06+bjE8NBrGedvKnaIqHygRdXPBmoVe62oxuAW+hRJkO
X-Received: by 2002:ac8:5708:0:b0:403:b33f:5d21 with SMTP id 8-20020ac85708000000b00403b33f5d21mr14427708qtw.12.1698764139273;
        Tue, 31 Oct 2023 07:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698764139; cv=none;
        d=google.com; s=arc-20160816;
        b=Ka+S5fii5Edwf7aHJinppCl6xrv1/ecVv7LGmsPXCdaQeP6U4bbZcG4H7Pg9oAj6ym
         GJdBsnWncW1L/BPEzQel35tTi5PhaWkZCHIMcd/NkB1i/+QihIgtaZoJrdgshSail6kK
         dwby+CAp1bgO9/f23JOitnBQe04YpipIX0RpGQh2+hF43GOylXngT4RmxoHAj3CTd/xm
         5z2yef/IFiFRmzyFEmmSopOF12yBylFs2/3mp5tjK3U5U0iVJClzoUtIBfZzpaAA8xca
         8w5sVla6ZdmIQ3pWd2YJgytKcKfV5VdEit5ULO9to4ozxDyMnC29uBIOUAZ6mONQi1GO
         nf7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EPzPxgh4+vgatR/kHX2mvS74B1bEtBc65368Obyyd2o=;
        fh=0rN+8F8YaTg0EFJCd1+PnMSgEdEkZgwxyGIqjTFvGlk=;
        b=ZRD43ringTUopEI8Oyd0l1kDrETCDwLH9gPy8wL5JacCHEY2M0CNHNtgYUoVfbheOL
         iYDfv+STfvecgG8u6FBFbo/Dud7j/zeTS1R9JS90vCwMxCV0kb99beRUcP882oo6UiPK
         2ciKWoVbGhW/Y/JpZ/yGuGeWSznPNiCCHOWOQdWQ7Cj0cfXvUx5CaptAgfbHBgkBDs/f
         vitHRHNp5ONRhAKmooFvEr5Wtr7P3IOkHpBQyvNvYBi1dohTXBw8dqxqC5aiJKcKfmpS
         QhU1SL+68zgXgVVSp7d3M0llLcwRziUdQX5MpfZ/HEVl8s9DjwYqTN8P/Qh6Ugr/ny0d
         GtkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v+rzdIOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05622a130500b004195ff58a62si1257566qtk.53.2023.10.31.07.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 07:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v+rzdIOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxq9M-0006Sh-Kx; Tue, 31 Oct 2023 10:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxq9J-0006S5-LM
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:55:22 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxq9H-0004KH-Jd
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 10:55:21 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-542d654d03cso5241149a12.1
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 07:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698764116; x=1699368916; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EPzPxgh4+vgatR/kHX2mvS74B1bEtBc65368Obyyd2o=;
 b=v+rzdIOtrn0KR3tK7GCHnHvwAoiXTgr4ofnNVciMv7m9wMneXd8I16fTx6fQ0JPnJE
 GbLtU06bjvaL7/PflsLH+y/NbIy8NU4xczjHTeKc0xWQgZ7uGMLv5VjvOwV7SkN4vnAJ
 9GqN6xlmx7OTRtCJNQI8M5TTPVvzyEo0E7YBS4PTJhUrag8UNhMjjt7MNBAgOuZ2Y3mn
 MbfOmjn03C/YK3d3iU1Q031U6ttp4+BbhNXwfXJkZSHKDwRB5jiTg0pHhQjnDqCEKIQ7
 Z9s9lp3ILJsYcugDaQdrVWAoRsSbbhUZ4SF4tkKOk93LPTIxlfIp6f5uTTaY+EoJCuGB
 KLpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698764116; x=1699368916;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EPzPxgh4+vgatR/kHX2mvS74B1bEtBc65368Obyyd2o=;
 b=rjsJtbdGa2lSY1jNwfA81hoGONfGMTcs2kHRy879cHi2DBBMc9G0pewctsCAv6dllW
 TLNw/lA/5lfsRi96/W5PfseFLgOdFvrc82U9ibdkkpXrIv8uCb2sleQGnntwzRfrM/Yo
 MzBmVJKea4sQUPC7HjHQWeDc9bs/6xHWz4hHYInkcFwckiFvDpTfs+4QkUlUmPmO6sdc
 LEZjErYEokCWKINxlCZgkSTHKSFTftNjZZb9QEot3Hh+hO7QGrWmySfq3Vu7I9mvPkqz
 JoOVlq4lHvjUGGx456oTQsn19h4x7R3T2Ay0uw6wAP+wI3ZNZbgyDms7GdugYjmrYHcO
 FoDg==
X-Gm-Message-State: AOJu0Yz4eRJnILaB0JyTwnNfGiqEgauJcdCGut8dmDqROcMpOqyyaEyn
 h4vMVicn8wgomUV0YAdc8HjWbZH3O/txAAGM6Y0=
X-Received: by 2002:a50:d7dd:0:b0:543:72cd:e14c with SMTP id
 m29-20020a50d7dd000000b0054372cde14cmr1615142edj.36.1698764116289; 
 Tue, 31 Oct 2023 07:55:16 -0700 (PDT)
Received: from [192.168.69.115] (gjh33-h01-176-171-208-14.dsl.sta.abo.bbox.fr.
 [176.171.208.14]) by smtp.gmail.com with ESMTPSA id
 u9-20020aa7db89000000b005401a4184ddsm1254099edt.27.2023.10.31.07.55.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 07:55:15 -0700 (PDT)
Message-ID: <59d6df3c-95ee-4ac4-9ac4-3f4ed49708fa@linaro.org>
Date: Tue, 31 Oct 2023 15:55:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 5/6] hw/input/stellaris_input: Convert to qdev
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20231030114802.3671871-1-peter.maydell@linaro.org>
 <20231030114802.3671871-6-peter.maydell@linaro.org>
 <9ea5c9b8-d740-4cec-9896-568babeca9aa@ilande.co.uk>
 <CAFEAcA9dJnp0CVOzVWV+Q-U4ji9c8=14ggztKGktCSsDDp_F0g@mail.gmail.com>
 <CAFEAcA_4wqP7G+gXnunJx85OTvUr-3kx6HGABGb6Kt3y=b_Nvw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_4wqP7G+gXnunJx85OTvUr-3kx6HGABGb6Kt3y=b_Nvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.053,
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
X-TUID: s7MIrioEUcD7

On 31/10/23 15:05, Peter Maydell wrote:
> On Tue, 31 Oct 2023 at 13:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Mon, 30 Oct 2023 at 20:38, Mark Cave-Ayland
>> <mark.cave-ayland@ilande.co.uk> wrote:
>>>
>>> On 30/10/2023 11:48, Peter Maydell wrote:
>>> Is it worth converting this to use DEFINE_TYPES() during the conversion? I know Phil
>>> has considered some automation to remove the type_init() boilerplate for the majority
>>> of cases.
>>
>> I could, I guess. It seems a bit awkward that DEFINE_TYPES()
>> wants you to pass it an array even when you only have one type,
>> though, which is going to be a very common use case.

For single type, there is no point beside enforcing a QOM style.

I'll update docs/devel/qom.rst...

> I'm going to squash this into this patch:
> diff --git a/hw/input/stellaris_gamepad.c b/hw/input/stellaris_gamepad.c
> index 6ccf0e80adc..d42ba4f0582 100644
> --- a/hw/input/stellaris_gamepad.c
> +++ b/hw/input/stellaris_gamepad.c
> @@ -90,16 +90,13 @@ static void
> stellaris_gamepad_class_init(ObjectClass *klass, void *data)
>       device_class_set_props(dc, stellaris_gamepad_properties);
>   }
> 
> -static const TypeInfo stellaris_gamepad_info = {
> -    .name = TYPE_STELLARIS_GAMEPAD,
> -    .parent = TYPE_SYS_BUS_DEVICE,
> -    .instance_size = sizeof(StellarisGamepad),
> -    .class_init = stellaris_gamepad_class_init,
> +static const TypeInfo stellaris_gamepad_info[] = {
> +    {
> +        .name = TYPE_STELLARIS_GAMEPAD,
> +        .parent = TYPE_SYS_BUS_DEVICE,
> +        .instance_size = sizeof(StellarisGamepad),
> +        .class_init = stellaris_gamepad_class_init,
> +    },
>   };
> 
> -static void stellaris_gamepad_register_types(void)
> -{
> -    type_register_static(&stellaris_gamepad_info);
> -}
> -
> -type_init(stellaris_gamepad_register_types);
> +DEFINE_TYPES(stellaris_gamepad_info);
> 
> 
> The array is a bit awkward, but it's overall better than having
> to define the register-types function.

Thank you!
