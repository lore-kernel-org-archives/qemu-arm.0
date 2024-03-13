Received: by 2002:a17:907:991a:b0:a45:b507:d90a with SMTP id ka26csp2576947ejc;
        Wed, 13 Mar 2024 09:32:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWh/hShi391SzQE61+8U5U/WrnSkYSs5FfF34644B1VoeRUfafdiwLcn4cI3NB2oppFGg8Vx9ivXPnE8SzyaTTU+jx+zhKR
X-Google-Smtp-Source: AGHT+IHAddmMlQ04Ntgh6VKx/xRnlRef606z3G2h2n9AvbN3RZeCyvwBTjRfDCNUJ/7sKuc0aKl4
X-Received: by 2002:a05:6214:5591:b0:690:b40b:8088 with SMTP id mi17-20020a056214559100b00690b40b8088mr364997qvb.54.1710347572991;
        Wed, 13 Mar 2024 09:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710347572; cv=none;
        d=google.com; s=arc-20160816;
        b=AbDYgwUE0sSjvSCYwr/DEElbyek4YIH/25un+dSzVSCRFDPYyFLmXG6/IMb/nBoAI0
         rwCNMWMonx2N0iQgOxmvhKdmqnK5fj+yg/nz0r7jv7mk+UDyzIIIu2xfOqtf6yug2Enc
         GWvjChKhIpVcKR0nGkv85MCya7Lfwyw4L3naWeL5WROyHSDN7GKv+9mFrZcjblcxFTM6
         Ek4zA3n9sfRgjInYWm4FvDxLLFF19ndOnNQR/JtJZoP5Bv06QHFAZZYvHczmEsmSIrps
         nkR68kpx3XYAneezPpLphMFKIf78S6OxdR/J1vtE1Opj0e95fsi4FT4MZnPbak+tWBzO
         Ev+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uLdp+4a29Jj1iGtXidLzisuCYYorO5rJNzr9LgiJdHA=;
        fh=50f+6rXAA6AommGrbOpOxF7sA7e/0nrEk6hQqLTxH48=;
        b=oHql5/vJ4kRyJhC2T3Y4A12OwnYt0vXSHSRRcKLf5P3qBnLajfdbBuVJv1OA0oZN5K
         o+A8BbqUjEEg2Hy79YyoUIPaE58cYmXB22G7yKdkcFDph0OYfe2ECmgfFBmRM4869EnJ
         h0sgGZ1K2gBOhlbIIVa5nzd+z5I8D8AkPfSRzKUix7Pwm0zY9dn4sWZCdd2WRhfUudSW
         ukxidy4rjiwan9fvH/dgyn8PtxC6TQIHu9YUGrsgAqzWR4GhyIcgDRULFEhO8acvW7jk
         5FTc6OcGMqxv0YT7RllWSgaiBlKSNCwDssVVugnZXthjAy0FnjczLeO+wDLAQ9azOxk6
         MdIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bs2X2+GL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke12-20020a056214300c00b0068f6db785fcsi9962802qvb.468.2024.03.13.09.32.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Mar 2024 09:32:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bs2X2+GL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rkRWw-0007qE-Rh; Wed, 13 Mar 2024 12:32:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkRWu-0007oO-Hc
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 12:32:36 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rkRWr-0002Yl-SF
 for qemu-arm@nongnu.org; Wed, 13 Mar 2024 12:32:36 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-33e570ef661so670658f8f.1
 for <qemu-arm@nongnu.org>; Wed, 13 Mar 2024 09:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710347552; x=1710952352; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uLdp+4a29Jj1iGtXidLzisuCYYorO5rJNzr9LgiJdHA=;
 b=Bs2X2+GLz3OgFLbbT5OPS/bJkd7yhYncsyrITCX1nJhdXEtdyOTl3AE4z16GQr26N7
 Z9erL4JG8f07GPNlL6gHhpjSYdR2KaEXiWoYhg0bh4Ug0ynxm92OzmZMDwfoRUZPqnKN
 c3mQjNXe41MiXmxrfijSAfQb9PpvJ7IqaB1zrNLkdqtTgZ1sA6zvLrlFoFs+fkaeMXJV
 E4LuNH7agnMCF4RyX55/rttXl3fXQx8p6vAs+qnLESmf7e7HX8JWEWFMBxTWmQxsNxhp
 3BKsC7hlns079wCAccst/GhoJz58EXQhKFOgbFAp153MEnI5OkUdDA+ruOs7fczQ6WTI
 bcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710347552; x=1710952352;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uLdp+4a29Jj1iGtXidLzisuCYYorO5rJNzr9LgiJdHA=;
 b=ast+gsrsvuotVuTZwTHVSyetPihs6gQc4HJgdwrJNlo3yRDtBRBtV+OuQN9Bjhku/B
 iS8Uq2Um+4Log1XHF41aJfYrf/nvBGA4gSiEU1blgZJla0LZy3Bk2P5UtpRPVOqe1GqP
 myZpQVUuv7N6aQGxH3XhcR6cJdUqBJTcOWwSZ5a9AUorU80uRA9pmXpE9tjAG2V2zhqw
 bnyQDZgu1N4AxNqz9c5tP8wqNp2H+9E4zPJO3r//M+vUbtttEUvFHoLcIRPRRu492JDr
 ef1qIHdHYjJk7BKR6vJxpTs4n23Ap8qzXLhEDDH+uIkXWe+rgkEKI/r/pqjp1R2UqoaY
 uT4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/1Sk/E3dYcRcgpCITsFURvqUwNyRSTkvrJBpLOCLSxyGfKknuYPVb+xvnf2ZSkfpjWFl8WP328rBrrbehzL5XcxcN
X-Gm-Message-State: AOJu0Yw1GdLcKPNaFmKgbBEQ63AvBvaYL3lypM7hz9ocFMQKIu/Y5e5n
 oXJyypKisPCbqZsBZI+5hu2vKK7Nq0Lg68KKizkX86rNWzfgM9EsiBzcEohR6oA=
X-Received: by 2002:a05:6000:192:b0:33e:77b5:746d with SMTP id
 p18-20020a056000019200b0033e77b5746dmr1992530wrx.18.1710347551939; 
 Wed, 13 Mar 2024 09:32:31 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.182.179])
 by smtp.gmail.com with ESMTPSA id
 bv10-20020a0560001f0a00b0033e033898c5sm12127389wrb.20.2024.03.13.09.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Mar 2024 09:32:31 -0700 (PDT)
Message-ID: <3f99efda-7ceb-4632-9701-739a1955614f@linaro.org>
Date: Wed, 13 Mar 2024 17:32:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] tests/avocado: use OpenBSD 7.4 for sbsa-ref
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-arm@nongnu.org
References: <20240313-sbsa-ref-firmware-update-v1-0-e166703c5424@linaro.org>
 <20240313-sbsa-ref-firmware-update-v1-3-e166703c5424@linaro.org>
 <8c197bfe-0cab-47dd-beec-c9752d434a47@linaro.org>
 <fe2abd47-be73-496d-94a4-0b6d95f31bd1@linaro.org>
 <06fb4fce-fd61-4813-9bbe-aeffdd5fd429@linaro.org>
In-Reply-To: <06fb4fce-fd61-4813-9bbe-aeffdd5fd429@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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
X-TUID: XMOT78LHi65T

On 13/3/24 16:06, Philippe Mathieu-Daudé wrote:
> On 13/3/24 14:39, Marcin Juszkiewicz wrote:
>> W dniu 13.03.2024 o 12:44, Philippe Mathieu-Daudé pisze:
>>>> -        :avocado: tags=cpu:cortex-a57
>>>> +        :avocado: tags=cpu:cortex-a57,os:openbsd
>>>
>>> IIRC for some reason we must use one tag per line... Even if
>>> named 'tags', this is handled as a single tag, so we couldn't
>>> filter on "os:openbsd". We need:
>>>
>>>    :avocado: tags=cpu:cortex-a57
>>>    :avocado: tags=os:openbsd
>>
>> OK. It worked when I tested this way:
>>
>> $ make check-avocado AVOCADO_TAGS='machine:sbsa-ref,os:openbsd'
>> [..]
>>   (1/3) 
>> tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_cortex_a57: PASS (16.18 s)
>>   (2/3) 
>> tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_openbsd_neoverse_n1: PASS (16.06 s)
>>
>> $ make check-avocado AVOCADO_TAGS='os:openbsd'
> 
> Oh great news, TIL!

Still thinking a bit about it, using one line for one tag
reduce patch churn when adding/removing tags, and eases
rebasing / cherry-picking.
