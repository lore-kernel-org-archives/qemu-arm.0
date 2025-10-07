Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA824CCA476
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 14:48:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v68yy-0001p6-T4; Tue, 07 Oct 2025 10:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v68yx-0001oZ-Da
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:48:03 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v68yt-0006wM-4E
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 10:48:02 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3717780ea70so69254011fa.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 07:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759848471; x=1760453271; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BAsFBM0GpeFyw+RJe82sHa80SQfKdMwywvxBYVJ69mg=;
 b=dC/2/KlXtoK4CA4TWwsTG4Zl7+GoXsETCD9b3zgxRBlxg3Pv2zSw7zxKu3kYkMYqgF
 P9zluoqwXhOAQhU1HdD1prg6m7k642aB8E67e/7Jhd/IEYCu0Vp5Dr3jhcooVFy0Z5Ie
 YzlrazoRVv5cm/HZzeRmxG7Y5VItr2BWaJJZmzrCxdUQwJVzUTXsqCVoPQ/HTVlnDhIL
 nOfLk/OhK2L/o47R/43V29tkuxsXJmxMofZjdlGL4tN8o15igPnRQHJwl01mPaqOS7em
 6+4K7e/IE2xgTFJtOLcZdde3WWOIpFxiS94vbxREpang/KATYGjCp7xRGgF7sX8G6/ys
 gGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759848471; x=1760453271;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BAsFBM0GpeFyw+RJe82sHa80SQfKdMwywvxBYVJ69mg=;
 b=XhiOzPiolcwr/7WH+2RYQl0/3kukQmVw+P0IJScygV1hdsxibOwBpj7wcW8vQ8K1eF
 snRgZwAEzHLtykXujYt9v079ARzyvwFE2mGTC6n2s1jbajVOgTA4ahzD0uOOQnYfTCuY
 o16/p466Iy1IK+prvkBa7GlJBLvic5OwSyzFKPb3Gc1ytNGqNj8KqY6CJVTZc0bzCcuU
 2ptZN7lk+BqpWAwFW4nRyoPKh9Psz/kQFzdWo6mws+UB9ZSbXzKquUU1ir/qqGwFPLlw
 kha9YXTZpexk4pIB6L50CORiNKXxyZePA/hVr5f0ldj0iyCt5mf4DC8fe3soDJuvDb68
 WpaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYSFu6yyyhMg9OAWV01t86GwNZXD13KCeVjn/9ZHMQN/8kAUsExg+0YTFyiNRiwh3RVyzi+m4I7g==@nongnu.org
X-Gm-Message-State: AOJu0Yymxc3SLpwvzTF1Jh06+0N7xDJim6sg2U3cpZqY8Ps/B5wTt0Mu
 ggo6vXXnRwG254KGh+cu628sKWQyIDyCzj/tJaImiLi+yZKSB8N4nMNfHygoAMNLhhA=
X-Gm-Gg: ASbGncty4g2bbHYh0pdrKi+DaC/p/x3rDSKe08tuf4iQbyAgncaiN/deIBgvcVKxvVg
 waMIoV7OwDm8rwBpXEgnMUVy4+REchR9fKH1JaWJjZsVAH6c5Y5FsPo+fpuwyPgAoR3zBbORpOl
 AWCsc1Gl9EE+T0xXW1JwrE88j18xKLLlplfxqqjvxIoT70w9ubbQ5AwU084tH/Pz8PGEgFopjpa
 AP3ymj9dZzjsNE2x3zpESuM1aMGjs1nNNdAh6MF/urYdhe0PBG4xT39YTjQ/BbYGprZF64WU/2e
 xI7K9bi7JJgJLdi/2Sm2c3VrUG5X1vrDU0Gw6k0kZGeKJe26gJRUJryUPTmvXz4r97qYWef0JtX
 JQ0HwtHjt/o+f/UbDEE86PjmJbUi8z/tHhWmN7ZP/rpmkZXd2OOVhKil2jIe5fV+unr4jCbm1Zh
 PHD0N/7wAWzBYUnDMHjQ==
X-Google-Smtp-Source: AGHT+IGrWX3cax3BfRBxA1WGzIRfFhaHuEY3YmyZOw38GauZr+nXj6BEncYtMwMAMOuLDtmv0SiUdg==
X-Received: by 2002:a2e:a817:0:b0:332:1de5:c513 with SMTP id
 38308e7fff4ca-374c36633cdmr41770881fa.4.1759848471107; 
 Tue, 07 Oct 2025 07:47:51 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-375f39d509bsm10869701fa.12.2025.10.07.07.47.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 07:47:50 -0700 (PDT)
Message-ID: <a7e21714-e19f-4465-96f1-dc27bd484cdf@linaro.org>
Date: Tue, 7 Oct 2025 16:47:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/max78000_gcr: Do not ignore address_space_write()
 errors
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Jackson Donaldson <jcksn@duck.com>,
 Jackson Donaldson <jackson88044@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <20251007024006.43166-1-philmd@linaro.org>
 <CAFEAcA_ytH+AwTr9LAZBP2nbSTod0FkfuexbewW=T7Pbb3nkmw@mail.gmail.com>
 <66dbc389-4c83-4552-b447-87c0e1ada48a@linaro.org>
In-Reply-To: <66dbc389-4c83-4552-b447-87c0e1ada48a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 7/10/25 15:48, Philippe Mathieu-Daudé wrote:
> On 7/10/25 10:27, Peter Maydell wrote:
>> On Tue, 7 Oct 2025 at 03:40, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>>
>>> Convert max78000_gcr_ops[] to take MemTxAttrs and return MemTxResult,
>>> allowing the write() path to return error on failure.
>>
>> *Should* it return a MEMTX error on this failure, though?
>> This is a question of what the hardware behaviour is,
>> and there's no reference to the datasheet in this
>> commit message...
> 
> Right. Thanks!

Looking at "MAX78000 User Guide (UG7456; Rev 1; 3/2024)",
chapter "4.7.2 RAM Zeroization" and table "4-67: Memory
Zeroize Control Register", IIUC failure can not happen.

Would that change be OK?

-      address_space_write(&s->sram_as, SYSRAM0_START,
-                          MEMTXATTRS_UNSPECIFIED, zero, 0x8000);
+      /* RAM Zeroization can not fail */
+      (void)address_space_write(&s->sram_as, SYSRAM0_START,
+                                MEMTXATTRS_UNSPECIFIED, zero, 0x8000);

Otherwise, what would be the recommended way to express return value
has to be ignored? Assertion doesn't seem right, since this is not a
programming error.

Thanks,

Phil.

