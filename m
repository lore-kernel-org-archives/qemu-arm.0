Received: by 2002:a17:906:70a:b0:9d0:bf65:29fa with SMTP id y10csp117144ejb;
        Tue, 31 Oct 2023 01:16:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9D6gcmLLF+R/B4yMj2sdgBFHPkQYVmdnOzPYt8AxBG2mkNuvQvDJvqMFXQLR+2OUdhhOQ
X-Received: by 2002:a25:50d5:0:b0:d9a:be04:7fae with SMTP id e204-20020a2550d5000000b00d9abe047faemr11914616ybb.17.1698740201353;
        Tue, 31 Oct 2023 01:16:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698740201; cv=none;
        d=google.com; s=arc-20160816;
        b=XwLImnNDX8L48Ovcs8EiQKSS7O5Ct7injUdrkyOvGkp6m9cahK7dIFFKg/OoHREgZN
         iys4Yr8R8QSRutauJLISShuQCkFT/dqKEWl0hHq4ckRCkN6igSezvpo24z9Lj9N7BcLj
         zSU7VS3eZ6ri01GnT3RfSqoY4ZnmP966Q/euGgu4Nbr18aeYbrJW5vbB80HECvf0AtKZ
         ATcM0OzeFxoNa9ROFT3IGDVdlgn0iO+yqb+uuTTnXaCu5b73XPh+8JK6LkGOgUJwq0nk
         mLoA8u9g5dDPZ9RUgjHdmdrnlX9Bs3DDVEFIL54nSWW4bPtdGvW+CHvsr7u5G1KpmBfH
         LIpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Mv3GVk43stYjLxFoQSJTrPzcOwtPp/8rPocpPFC8JVM=;
        fh=jDzeAr3Vebo3N6VyEQjGmeJwxTwTFeg1bFrq7ia85EM=;
        b=b+B2ND5MAAm3jDhFg43Oy23BhqS8xAvsr6i5TkNhBjVDX80EiZlqY5+x8PrEhUQ9ck
         bANG4bMgGfrlHAWA4n3P4zBkMXS5DLIWOwGvidScQ7GROB8CTYKrPz0AfAicez0kKjrx
         b7uaFHZ/K1e+gjfzpBQy/mkbXbBRl9lY9woi2z2abc/V0fKh2sNIbF4i9GzHIHZM/sOJ
         tPW4P+CH6AnosAjI9VtpPJL/ev+IeoPCS/Dkok/Wi4s6WT1pw7WctNXTV09zc+QAMxC3
         l+8WCXkdhb2rxXrKrXMgfSSvDYM8xOXKz5YYhBldtN/Pp80NAIc4cP38IViIeVDPGnCZ
         6x3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dAW/j8/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gm12-20020a056214268c00b0066cee1c3e95si663793qvb.76.2023.10.31.01.16.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Oct 2023 01:16:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dAW/j8/2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qxjvO-0004mX-Sy; Tue, 31 Oct 2023 04:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxjvI-0004kA-05
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 04:16:30 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qxjvC-0006oX-CM
 for qemu-arm@nongnu.org; Tue, 31 Oct 2023 04:16:27 -0400
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-507b9408c61so7441368e87.0
 for <qemu-arm@nongnu.org>; Tue, 31 Oct 2023 01:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698740179; x=1699344979; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mv3GVk43stYjLxFoQSJTrPzcOwtPp/8rPocpPFC8JVM=;
 b=dAW/j8/2jLusdBZvJTygNFhp3wEOyVLmMouq+LmqVjyg8L8mXFRKPM3Xrbu4mSFHM7
 F7kAIt1k+3xHX2+Tx8Ct5lpgrJoG8FrAOZUsvppMJh6NWTAcbRRphNOLb+8EZa6LcoNO
 D7q0KiH+y5cqiWCuCpIiD0DWlpkyPAyDvifVVXTcyuyWrM/B+RrHBwx3WODZqfKymI7/
 LaxN8uYFG4I+/MySiwwpV+lXbOw9Eku3lBhofkckJKCqpKOND2L3YKAxmY2I0d22cpyQ
 D6H2TfiEMO+0Mixw+K3v6vWrUmplanyHq3J0tZaplBsHnPlqAXMZNostIFfNYfKZ5HXe
 9pTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698740179; x=1699344979;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mv3GVk43stYjLxFoQSJTrPzcOwtPp/8rPocpPFC8JVM=;
 b=FVrvqcCXdYqIoG/UId6debPNS/MmPPDoqp7KpsEVkCFE+ncS5l8NV3rV1e4JmIjOxw
 JlXNLWlBdWuUiZdoNOwP0ilo98XMKjc+434ftwGYA33JJmxZQ7SRDle7AbA4KrAG0gO0
 A0iPtawQwp1p0M/xh9aq0xgKLpuN4QlTYlKTdfvsCM0c65yfMI5jIIJ6n9dUkqp0aC/R
 V2/pMNyRxhG9ar8ch9WNLrysecF6lfRactyDWiJS1e9Pm8nMOhmS7oZE2EwkixQLrSs1
 Bl4B/C1MZOKtYVI/TVhK9wiGwNm73GbkUF6K3eUzzse08KjfduFi/9a1K82BEtZHrd8L
 Z2hw==
X-Gm-Message-State: AOJu0Yx52DTna7MAgpxqYGOPGmzgFLT9SWqpdr3hDThGpkyag+ioPSQa
 61xX5+1sHZFc8XaKIpwY1T85KQ==
X-Received: by 2002:a2e:860b:0:b0:2c5:2445:36af with SMTP id
 a11-20020a2e860b000000b002c5244536afmr9279166lji.50.1698740178600; 
 Tue, 31 Oct 2023 01:16:18 -0700 (PDT)
Received: from [192.168.69.115] (gjh33-h01-176-171-208-14.dsl.sta.abo.bbox.fr.
 [176.171.208.14]) by smtp.gmail.com with ESMTPSA id
 w2-20020a05600c098200b004063d8b43e7sm995876wmp.48.2023.10.31.01.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Oct 2023 01:16:18 -0700 (PDT)
Message-ID: <9a82b139-cfd7-ca1c-a651-8626775702b7@linaro.org>
Date: Tue, 31 Oct 2023 09:16:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 5/6] hw/input/stellaris_input: Convert to qdev
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231030114802.3671871-1-peter.maydell@linaro.org>
 <20231030114802.3671871-6-peter.maydell@linaro.org>
 <edf24aec-59cf-d594-7bda-cef3c268a835@linaro.org>
 <87jzr4p4qp.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87jzr4p4qp.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.441,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: sYraxamLgeEU

On 30/10/23 15:25, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> Hi Peter,
>>
>> Cc'ing Markus for QObject.
>>
>> On 30/10/23 12:48, Peter Maydell wrote:
>>> Convert the hw/input/stellaris_input device to qdev.
>>> The interface uses an array property for the board to specify the
>>> keycodes to use, so the s->keycodes memory is now allocated by the
>>> array-property machinery.
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
>>>      #define GPIO_A 0
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
>>             g_autoptr(QList) gpad_keycode_list = qlist_new();
> 
> QObject and its subtypes QDict, QList, QString, ... are reference
> counted.  qFOO_new() ist to be paired with qFOO_unref() or
> qobject_unref().
> 
> Your use of g_autoptr(QList) should work.

Peter figured qdev_prop_set_array() takes the ownership, so using
g_autoptr triggers a double-free:

https://lore.kernel.org/qemu-devel/CAFEAcA_GC8ypM2Y94KCU9Q_dntF6Na+igu-+0JZJ+MvPFE_HcA@mail.gmail.com/
