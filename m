Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1293817ejj;
        Tue, 26 Mar 2024 05:05:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVn8jiwsUi+Ye9J2K9Hug+Bb0EI/H0LijplJQVi1XVJ2UOEpWVt0UEFxB7Pb4uwYX+30QGRFrUHcOpxJEhEYqhsj78dCZrp
X-Google-Smtp-Source: AGHT+IEjklrYxpqNYQwXMUEK8bxo0XeKGrjAzp0aFna3Q3axNOz5Kl6KivkH8/dTV9WJtIgVfEk5
X-Received: by 2002:ae9:f405:0:b0:78a:4755:b790 with SMTP id y5-20020ae9f405000000b0078a4755b790mr9477161qkl.2.1711454747283;
        Tue, 26 Mar 2024 05:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711454747; cv=none;
        d=google.com; s=arc-20160816;
        b=0oCYJAuiYTbUG52hRFyU3fh1sg/2oxNt3WKXTUYJb0J9JLLKfdX2Ko8yTlwJ0dFpRH
         Sj+yWvFhzS2hFRHm8g7R8lMwYhj/U6gUIFnchzSM8GImNEJ71X9fNjD3I3TzFm2MKLHu
         mGbaRu6cFqPavHKADOTXU6UW0PBlq9OGNpdUFgJNwX6IYCrtRRxlT0dI8SBK0mywAlye
         xPQEgYiZ/dexQIPPyWH8UUMUhRh1iBhO6oVbKEAanF9UI9azHB5VuaMyZf+aXDPDUB6q
         AJD1tXHg9iImljN5dVKGWigTNoXW3IEyOeiXGRWsk9mPqcPzSeCht1bZcGX3C+zVLtKP
         k8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UOBnM2pnR6oPF9CjLZcZAdfJODqH22UCVW8p0wDKXk0=;
        fh=+MBrmFeJE5OrehAxAodMeVNTqC7tsyYWFTrCoQixbPU=;
        b=DEUNwT/de3FNuBas+jmbxNUTsbJQCBGT2M4GIstW8DRIaN2K1Ls9xXWI2MuLLlnuBP
         o59wGelNJG1fVYbnpBc3ZK7wOQQY5h4lhAvGT0V5WzkHZ88eUoCuB9HTm2mnCWzLcl6c
         hhnb3Zi9RnxGpedliRKA9t/AndZ31hkPZsDstnG27QcD8GByNM0BtWlw+tyXFa9OmcDK
         5xiBxNmb+4WGYHQXDHeZe6dCszH5gZQhlAIjnbFZm19/kQh6ENmjZnFxax4zSajBiujp
         qLYPPqPSqAMgGXU4FgJX1IhiPAiZFgJYj14NGM56YwsWFUz7taH3LYNL9sbgg+gj5P/Y
         g/Sg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TS8/jfQA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o7-20020ae9f507000000b0078a0daa66e0si7439073qkg.580.2024.03.26.05.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 05:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="TS8/jfQA";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rp5YY-0000rI-Qo; Tue, 26 Mar 2024 08:05:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp5YX-0000qI-1C
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 08:05:29 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp5YS-0001V1-GF
 for qemu-devel@nongnu.org; Tue, 26 Mar 2024 08:05:28 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56899d9bf52so6858440a12.2
 for <qemu-devel@nongnu.org>; Tue, 26 Mar 2024 05:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711454721; x=1712059521; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UOBnM2pnR6oPF9CjLZcZAdfJODqH22UCVW8p0wDKXk0=;
 b=TS8/jfQAuOzfVWDI96xqQUkSTp5+aRvHcnFjwf7aXUAi23eBfV6Hw/fE3G4yoj+rpn
 +Q/b5zKhDGJ9yOel+ZIoPXvEsAlNQNV45cDlwud88JSN/VveGKp9Ui2HG9gthNGQXBXn
 //rtYxWeytL1Up4ShyAQEfKJv3NDE0ahmS+Tm29lkUZG7MfbVELwI29xNDcsOf3MPg5F
 NTn1j1ULa5XbzmKz36RQVXN/Z8IAM2K0G2FqtXzNsdyLqXFG5NXB5INuMKUqEBRtWciL
 y7w+x4gNv+XaU+BREbve1LCnBOV5vhd/YT7je0O6WNZYWYgjAnH5R6K0H29gJ4Dqx0lt
 tyig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711454721; x=1712059521;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UOBnM2pnR6oPF9CjLZcZAdfJODqH22UCVW8p0wDKXk0=;
 b=LiksvoXbot+GW14FGYrWpVuqinCVRnUslv2p/aeLlNcIzwwIjAUwXviUZ9ODwD/h+r
 eVsvCC1khZQer3OcztHwVIHyeY7295mp7S6/ByVwd0FiO2PhkdZWr4B8yYAYHyioUBdA
 NV4Z+2HIZEshpXfRoEd3EEec07PsrOW1iFw5jhXTlY0XCLxE+aQDvsSi8ZgdpLEKD7BE
 yYohORjYF+MQvMRNq80UaAk1sf+aXmiAwNemwSFGah+KFzyPCdM2JNJouNjh11OOkOJh
 xikdd/bpjWpYIyz9ugBbdYQ7DQ6ABFGEra2lQPkYdR0mnOKtQ/a0q5m4H+4NgJY9Syzb
 Gd1w==
X-Gm-Message-State: AOJu0YzlZH3/fpPsZK8ykhuzZgQZ2YMt7SbKETdJ4AlAhkisdp4Ro4w/
 Lk2At9HM+oBB8MXnoH/7g46u4GoYWvQeTiAjypndOoSqbGlITHyAZcWaZeGpciU=
X-Received: by 2002:a50:d707:0:b0:56c:295e:2c01 with SMTP id
 t7-20020a50d707000000b0056c295e2c01mr1598521edi.15.1711454721455; 
 Tue, 26 Mar 2024 05:05:21 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 cx10-20020a05640222aa00b0056bb1b017besm4065490edb.23.2024.03.26.05.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 05:05:21 -0700 (PDT)
Message-ID: <a7dd18be-61dd-42d7-8bf1-dba47e1234c6@linaro.org>
Date: Tue, 26 Mar 2024 13:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc/pca955*: Move models under hw/gpio
Content-Language: en-US
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Glenn Miles <milesg@linux.vnet.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?=
 <fbarrat@linux.ibm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org
References: <20240325134833.1484265-1-clg@redhat.com>
 <10713c68-27d8-49b8-b50f-6648eef8d277@linaro.org>
 <f6f6e771-0820-4de5-b9cc-1e64b9729712@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <f6f6e771-0820-4de5-b9cc-1e64b9729712@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iq1QNICaq1QT

On 26/3/24 11:16, Cédric Le Goater wrote:
> On 3/26/24 10:55, Philippe Mathieu-Daudé wrote:
>> On 25/3/24 14:48, Cédric Le Goater wrote:
>>> The PCA9552 and PCA9554 devices are both I2C GPIO controllers and the
>>> PCA9552 also can drive LEDs. Do all the necessary adjustments to move
>>> the models under hw/gpio.
>>>
>>> Cc: Glenn Miles <milesg@linux.vnet.ibm.com>
>>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>>> ---
>>>   MAINTAINERS                              | 4 ++--
>>>   include/hw/{misc => gpio}/pca9552.h      | 0
>>>   include/hw/{misc => gpio}/pca9552_regs.h | 0
>>>   include/hw/{misc => gpio}/pca9554.h      | 0
>>>   include/hw/{misc => gpio}/pca9554_regs.h | 0
>>>   hw/arm/aspeed.c                          | 2 +-
>>>   hw/{misc => gpio}/pca9552.c              | 4 ++--
>>>   hw/{misc => gpio}/pca9554.c              | 4 ++--
>>>   tests/qtest/pca9552-test.c               | 2 +-
>>>   tests/qtest/pnv-host-i2c-test.c          | 4 ++--
>>>   hw/gpio/meson.build                      | 2 ++
>>>   hw/gpio/trace-events                     | 4 ++++
>>>   hw/misc/meson.build                      | 2 --
>>>   hw/misc/trace-events                     | 4 ----
>>>   14 files changed, 16 insertions(+), 16 deletions(-)
>>>   rename include/hw/{misc => gpio}/pca9552.h (100%)
>>>   rename include/hw/{misc => gpio}/pca9552_regs.h (100%)
>>>   rename include/hw/{misc => gpio}/pca9554.h (100%)
>>>   rename include/hw/{misc => gpio}/pca9554_regs.h (100%)
>>>   rename hw/{misc => gpio}/pca9552.c (99%)
>>>   rename hw/{misc => gpio}/pca9554.c (99%)
>>
>> Thanks, patch queued.
> 
> This one is merged,
> 
> https://gitlab.com/qemu-project/qemu/-/commit/6328d8ffa6cb9d750e4bfcfd73ac25d3a39ceb63

Yes I just realized when updating my tree that Thomas sent a PR with
your patches. Sorry for the noise.

> 
> Thanks,
> 
> C.
> 
> 

