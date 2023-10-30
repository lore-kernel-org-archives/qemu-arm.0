Received: by 2002:a17:906:7e1a:b0:9d0:bf65:29fa with SMTP id e26csp54656ejr;
        Mon, 30 Oct 2023 11:28:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxIp6sLryt0CJr7G95gXLQzC2fyAHcfBADF6hahTIEvJ/sNb18rSn4nA1LsrbGMB0uN8tp
X-Received: by 2002:a67:e08b:0:b0:457:bbd5:23fd with SMTP id f11-20020a67e08b000000b00457bbd523fdmr9293853vsl.9.1698690531577;
        Mon, 30 Oct 2023 11:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698690531; cv=none;
        d=google.com; s=arc-20160816;
        b=YUXH5qHxlHFthg66qrrLomw3ALnhPBtw6SMPSlHj0jEtYQvGAbWJuEiXi9CBhE8bfF
         vCPVrrbUQ6VhKz1v/BiswtwtZx4LSAMAsY19fPxqtMZNO5EUTgtUcUtCCHBk+FGcUQva
         P+1534RYkgDfe/vj2DvVd9aFTisKhdRGukaSBcQIGeRZBWKwVXXeQEu8NpjnMrd4/YVq
         UbOWRPaoa9ygKwSTV2pcdddBPZ9nPCvxsL6xfhGMQsaqarYAChnx04Qd2u9n5JbV0kNB
         /Vys1PuwVlrkkRF2d6SmsObRPz2vc1RNxc48jEEXZCkkL8wyJqMS4s2GPHdSwfUNXwz+
         8oHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ZbVJptA73rinQ3TnnRVHH3B/3kz/6nIhTodR+OpCe/8=;
        fh=n9wfMgfFYrnTOYMfJiFGlwAOcCy+GjHLyH3goIv5Sb4=;
        b=lLefsBbMRKZXtO0NYz7UDf3zJag3bcz4fHzCBLQtNN9b1YNUiX071GB4pkOXh3f9Cx
         3gZ0uMORFB+qWWr0y8swGBJcnEKjQ20drMG5pKmkAU3tbTXgzAsMbUghoPZVSlnMa0DQ
         585BjE/4PollMcJXCqqlhlwIB9cAEh9jM8G7nN7iiEPAibS9KfqTLkO1IpF2FH6cVOWp
         +ud+6M7m8BgUR3W6eLDqwzTBTq+GnUnjdn1m0lzdaAaI6Mt9r24Pnu6xranl7MOyKxHy
         N33CYIDt7jYiKeyJC0vuDjEg0sU66C5foH8BR00EjX7l0iEVz/NSn4QakVF6JrZMtfAg
         XIkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sYNhYAfH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ow47-20020a05620a822f00b00767f3ee54a3si5755890qkn.80.2023.10.30.11.28.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 11:28:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sYNhYAfH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxWzr-0006hS-4C; Mon, 30 Oct 2023 14:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxWzl-0006g1-2I
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 14:28:13 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxWzj-0001NW-0q
 for qemu-arm@nongnu.org; Mon, 30 Oct 2023 14:28:12 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5401bab7525so8146976a12.2
 for <qemu-arm@nongnu.org>; Mon, 30 Oct 2023 11:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698690487; x=1699295287; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZbVJptA73rinQ3TnnRVHH3B/3kz/6nIhTodR+OpCe/8=;
 b=sYNhYAfHasO9r0bdTvHvD+lU2uPWr4SOCmmafwfbq5A1CvFy7fGiZf84w78mTUdV6s
 A4THaRiSkEdAiHR7DRZLtL4mUbvjqr0P08fhDGenBgbSRb6PK29AIx7NKrss6f0eEh2/
 1f4AOP8gzzs340vn6ZYDctMkNX6ZCruf+C50xvwuyzqqa+VWkA7GnqeW0qjWCCT+BGXs
 bHQ2dz6fq6jvbxa64Fu4yU7V7+U2a0L6yjyNcF5VW2eyB6qcbuOtS/T3G1lO873yg3Ct
 QRx/+Nojq3joo28vDvl3POTPzgnB0h+dtmVH/xXyUiu8UJiw0pKz5hEhFqeCJgKMW7rB
 +POw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698690487; x=1699295287;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZbVJptA73rinQ3TnnRVHH3B/3kz/6nIhTodR+OpCe/8=;
 b=NksoE1imln6xDzqlthgmPqXMgS6KNGtW5aD32e3oCsCVX7I755HvKl7htiV8Al5tXl
 XROCiP57E3WMnZ4DHGgOq5lY9EsxWtLxubsSkgVBXVTwp/cQTvu4OXjdnGwRSofAoztO
 9KXI/i+teXyt7F5r8VZ5jvG1ha8+aWjuOnGIR9r2LN+TeHQ/MD+N3mFkhJAi1ehSzoM2
 cTYd67XfDmtEa8ndmrrb8GA7r7NIpS/+kXHC7yDeqocvhsLuVqBU2V95NAI0bsFZ+/ri
 FmnqIM0Bb6epiBCOpc1ZAa5aboIpRtz2n7pBb37WYkIiqM8gDzJM8fl+J5pQoY9+8vKm
 YPNg==
X-Gm-Message-State: AOJu0Yzj7UqZx357gwb5tU7SGDSexB2bRrQiv+rRC/tUQDxvoPr5ZErV
 mSIY1g4ss5niC0CMdlDWjbWMLw==
X-Received: by 2002:a50:cdc2:0:b0:543:57a8:a470 with SMTP id
 h2-20020a50cdc2000000b0054357a8a470mr992428edj.19.1698690487231; 
 Mon, 30 Oct 2023 11:28:07 -0700 (PDT)
Received: from [192.168.69.115] ([176.170.212.50])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a50d719000000b0052ffc2e82f1sm6666910edi.4.2023.10.30.11.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Oct 2023 11:28:06 -0700 (PDT)
Message-ID: <6b8b7608-208e-722b-97a3-8ee346fe7c76@linaro.org>
Date: Mon, 30 Oct 2023 19:28:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 5/6] hw/input/stellaris_input: Convert to qdev
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231030114802.3671871-1-peter.maydell@linaro.org>
 <20231030114802.3671871-6-peter.maydell@linaro.org>
 <edf24aec-59cf-d594-7bda-cef3c268a835@linaro.org>
 <CAFEAcA_GC8ypM2Y94KCU9Q_dntF6Na+igu-+0JZJ+MvPFE_HcA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_GC8ypM2Y94KCU9Q_dntF6Na+igu-+0JZJ+MvPFE_HcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.441,
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
X-TUID: aVPE0fISKVK/

On 30/10/23 15:41, Peter Maydell wrote:
> On Mon, 30 Oct 2023 at 13:52, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Hi Peter,
>>
>> Cc'ing Markus for QObject.
>>
>> On 30/10/23 12:48, Peter Maydell wrote:
>>> Convert the hw/input/stellaris_input device to qdev.
>>>
>>> The interface uses an array property for the board to specify the
>>> keycodes to use, so the s->keycodes memory is now allocated by the
>>> array-property machinery.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>> v1->v2: drop private/public comment lines
>>> ---
>>>    include/hw/input/stellaris_gamepad.h | 22 ++++++++-
>>>    hw/arm/stellaris.c                   | 26 +++++++---
>>>    hw/input/stellaris_gamepad.c         | 73 +++++++++++++++++++---------
>>>    3 files changed, 89 insertions(+), 32 deletions(-)
>>
>>
>>> diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
>>> index 96585dd7106..707b0dae375 100644
>>> --- a/hw/arm/stellaris.c
>>> +++ b/hw/arm/stellaris.c
>>> @@ -31,6 +31,7 @@
>>>    #include "hw/timer/stellaris-gptm.h"
>>>    #include "hw/qdev-clock.h"
>>>    #include "qom/object.h"
>>> +#include "qapi/qmp/qlist.h"
>>>
>>>    #define GPIO_A 0
>>>    #define GPIO_B 1
>>> @@ -1274,16 +1275,27 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
>>>            sysbus_connect_irq(SYS_BUS_DEVICE(enet), 0, qdev_get_gpio_in(nvic, 42));
>>>        }
>>>        if (board->peripherals & BP_GAMEPAD) {
>>> -        qemu_irq gpad_irq[5];
>>> +        QList *gpad_keycode_list = qlist_new();
>>
>> I'm trying to understand better qlist_new(), but unfortunately there
>> is not much documentation. Looking at how the allocated list was
>> released, I found use of g_autoptr in tests/unit/check-qobject.c,
>> so I tried:
>>
>>              g_autoptr(QList) gpad_keycode_list = qlist_new();
> 
> The API for qdev_prop_set_array() documents that it takes ownership
> of the list you pass it (and it ends up calling qobject_unref() on it).
> So I think adding g_autoptr() here will result in the memory being
> double-freed (once inside qobject_unref() when the refcount
> goes to 0, and once when g_autoptr frees it as it goes out of scope)...

Ah, I missed how qdev_prop_set_array() is involved.

>> * thread #2, stop reason = signal SIGABRT
>>     * frame #0: 0x8b1eb11c libsystem_kernel.dylib`__pthread_kill + 8
>>       frame #1: 0x8b222cc0 libsystem_pthread.dylib`pthread_kill + 288
>>       frame #2: 0x8b132a50 libsystem_c.dylib`abort + 180
>>       frame #3: 0x8b049b08 libsystem_malloc.dylib`malloc_vreport + 908
>>       frame #4: 0x8b06924c libsystem_malloc.dylib`malloc_zone_error + 104
>>       frame #5: 0x8b05b094
>> libsystem_malloc.dylib`nanov2_guard_corruption_detected + 44
>>       frame #6: 0x8b05a2a8
>> libsystem_malloc.dylib`nanov2_allocate_outlined + 404
>>       frame #7: 0x0201fdc0 libglib-2.0.0.dylib`g_malloc0 + 36
>>       frame #8: 0x02007718 libglib-2.0.0.dylib`g_hash_table_setup_storage
>> + 76
>>       frame #9: 0x020076b0 libglib-2.0.0.dylib`g_hash_table_new_full + 96
> 
> ...which is probably why a later memory operation runs into a
> malloc data corruption assertion.

Yes, this is certainly the reason. Thanks for the explanation!

Phil.

