Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp249025ejc;
        Mon, 25 Sep 2023 02:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbAsiFgkrB8iw2D8I/cFKB3gjWIWYxA9StPt/NGsk3Dr3Ygwxx5XEY/1AQkHOps+OvZtz6
X-Received: by 2002:ad4:470e:0:b0:63d:2567:f255 with SMTP id qb14-20020ad4470e000000b0063d2567f255mr6197055qvb.24.1695633661639;
        Mon, 25 Sep 2023 02:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695633661; cv=none;
        d=google.com; s=arc-20160816;
        b=NAKFxDv3WGcImQYhGRAybJ0PI1l/jXtt5VHklqAjULM+Dh7RjlRJX2Bd6A1lGyLDtz
         StV+kwd6bfFoSnBbwo2hWU36ZRsIbMPxCNitRl5n71JIsq0lnAFlm+hY8PWWKvvWtooy
         WEX2siKFieGFLi1XKPy30JfPl2FAakOYRzClW7NzIdgzkDbuBdO6uUg+OKREFVgg4B8P
         Uwnl/RVp0M1wpP4hAOj9eW7mK+UyHbUiaQMw7/xHretkWTeTzg8k3+3MVwQohcgwO9uU
         l+JP52EvNYECz/oSV4fKZNO4kpDhgj7q/kxhuCx6DPobZ7N5MlldeN9lZstlJ4LcOwmq
         P3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=rOQx37QOir+bGRSSz1847Je7TkdsCD8kfixdmo5HKwI=;
        fh=WI87t2OkKvYspRwWlvIRR/WJbyJPQotDI2Ms2GxuXaQ=;
        b=ksl9dpxSAqUxKR2JpCjpHPzXEq/42MEJfdEDbCScyCOJGiX5A8Akw/6XJ7W0J6e2MV
         sCmv9GhQjdWLNq40YPn3sUdbjRc5cmETQeUemB6+I/rVg8IURgWsjZanR+RIbDH21I20
         r6buRra+mCIrnwOszngcxocedNjOuNP3ASTnQ5GJESU9FnuIz3o93hzvU18T7eMIaauk
         vcbVrPC+bOHK0P7WBP6aZocTIMHF+UQUgAxN9mhXSBNk3BZOGXfkm+5X9G8AMGDGpsXC
         6jWvK+P33jR1Lr/sjbmrLluPRVAu4opofzlw5WcbE9X9TjuDmbAn9ygY6i1ABKYdY/XB
         Oa6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8-20020a0ccb88000000b006582469f16csi2019340qvk.505.2023.09.25.02.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 02:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkhln-0006Jl-Cx; Mon, 25 Sep 2023 05:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=n5Cv=FJ=kaod.org=clg@ozlabs.org>)
 id 1qkhlj-0006Im-0D; Mon, 25 Sep 2023 05:20:45 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=n5Cv=FJ=kaod.org=clg@ozlabs.org>)
 id 1qkhld-0005t3-MU; Mon, 25 Sep 2023 05:20:42 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RvHR35p2Yz4xPR;
 Mon, 25 Sep 2023 19:20:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RvHR20Hsrz4xPQ;
 Mon, 25 Sep 2023 19:20:29 +1000 (AEST)
Message-ID: <c23dd1d8-a037-ed8e-30bf-6824ca3649c4@kaod.org>
Date: Mon, 25 Sep 2023 11:20:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Qemu-devel] [PATCH 08/19] aspeed/timer: Fix behaviour running
 Linux
Content-Language: en-US
To: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9_via?= <qemu-arm@nongnu.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-9-clg@kaod.org>
 <a4a62040-0127-4f39-4fc3-a1795e4daad8@kaod.org>
 <d383d716-2c9a-4d37-a35d-6f62bff9bf1e@app.fastmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <d383d716-2c9a-4d37-a35d-6f62bff9bf1e@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=n5Cv=FJ=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-TUID: yhiQSXoU5Bme

On 9/25/23 09:54, Andrew Jeffery wrote:
> 
> 
> On Fri, 22 Sep 2023, at 22:51, Cédric Le Goater wrote:
>> Joel, Andrew,
>>
>> On 5/25/19 17:12, Cédric Le Goater wrote:
>>> From: Joel Stanley <joel@jms.id.au>
>>>
>>> The Linux kernel driver was updated in commit 4451d3f59f2a
>>> ("clocksource/drivers/fttmr010: Fix set_next_event handler) to fix an
>>> issue observed on hardware:
>>>
>>>    > RELOAD register is loaded into COUNT register when the aspeed timer
>>>    > is enabled, which means the next event may be delayed because timer
>>>    > interrupt won't be generated until <0xFFFFFFFF - current_count +
>>>    > cycles>.
>>>
>>> When running under Qemu, the system appeared "laggy". The guest is now
>>> scheduling timer events too regularly, starving the host of CPU time.
>>>
>>> This patch modifies the timer model to attempt to schedule the timer
>>> expiry as the guest requests, but if we have missed the deadline we
>>> re interrupt and try again, which allows the guest to catch up.
>>>
>>> Provides expected behaviour with old and new guest code.
>>>
>>> Fixes: c04bd47db6b9 ("hw/timer: Add ASPEED timer device model")
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> [clg: - merged a fix from Andrew Jeffery <andrew@aj.id.au>
>>>           "Fire interrupt on failure to meet deadline"
>>>           https://lists.ozlabs.org/pipermail/openbmc/2019-January/014641.html
>>>         - adapted commit log
>>>         - checkpatch fixes ]
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>    hw/timer/aspeed_timer.c | 59 ++++++++++++++++++++++-------------------
>>>    1 file changed, 31 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/hw/timer/aspeed_timer.c b/hw/timer/aspeed_timer.c
>>> index 5c786e512815..9ffd8e09f670 100644
>>> --- a/hw/timer/aspeed_timer.c
>>> +++ b/hw/timer/aspeed_timer.c
>>> @@ -109,37 +109,40 @@ static inline uint64_t calculate_time(struct AspeedTimer *t, uint32_t ticks)
>>>    
>>>    static uint64_t calculate_next(struct AspeedTimer *t)
>>>    {
>>> -    uint64_t next = 0;
>>> -    uint32_t rate = calculate_rate(t);
>>> +    uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>> +    uint64_t next;
>>>    
>>> -    while (!next) {
>>> -        /* We don't know the relationship between the values in the match
>>> -         * registers, so sort using MAX/MIN/zero. We sort in that order as the
>>> -         * timer counts down to zero. */
>>> -        uint64_t seq[] = {
>>> -            calculate_time(t, MAX(t->match[0], t->match[1])),
>>> -            calculate_time(t, MIN(t->match[0], t->match[1])),
>>> -            calculate_time(t, 0),
>>> -        };
>>> -        uint64_t reload_ns;
>>> -        uint64_t now = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>> -
>>> -        if (now < seq[0]) {
>>> -            next = seq[0];
>>> -        } else if (now < seq[1]) {
>>> -            next = seq[1];
>>> -        } else if (now < seq[2]) {
>>> -            next = seq[2];
>>> -        } else if (t->reload) {
>>> -            reload_ns = muldiv64(t->reload, NANOSECONDS_PER_SECOND, rate);
>>> -            t->start = now - ((now - t->start) % reload_ns);
>>> -        } else {
>>> -            /* no reload value, return 0 */
>>> -            break;
>>> -        }
>>> +    /*
>>> +     * We don't know the relationship between the values in the match
>>> +     * registers, so sort using MAX/MIN/zero. We sort in that order as
>>> +     * the timer counts down to zero.
>>> +     */
>>> +
>>> +    next = calculate_time(t, MAX(t->match[0], t->match[1]));
>>> +    if (now < next) {
>>> +        return next;
>>> +    }
>>> +
>>> +    next = calculate_time(t, MIN(t->match[0], t->match[1]));
>>> +    if (now < next) {
>>> +        return next;
>>> +    }
>>> +
>>> +    next = calculate_time(t, 0);
>>> +    if (now < next) {
>>> +        return next;
>>> +    }
>>> +
>>> +    /* We've missed all deadlines, fire interrupt and try again */
>>> +    timer_del(&t->timer);
>>> +
>>> +    if (timer_overflow_interrupt(t)) {
>>> +        t->level = !t->level;
>>> +        qemu_set_irq(t->irq, t->level);
>>>        }
>>>    
>>> -    return next;
>>> +    t->start = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>>> +    return calculate_time(t, MAX(MAX(t->match[0], t->match[1]), 0));
>>
>> This MAX(MAX(x, y), 0) looks strange to me. Would you remember where it comes
>> from ? Thanks,
> 
> The inner MAX() deals with the lack of ordering constraints between the match values. I think the outer MAX() is redundant. We should probably remove it. The match member is type uint32_t so it can't be negative. You did steal that from an RFC patch :D

I did ! Fixed there :

   https://patchwork.ozlabs.org/project/qemu-devel/patch/20230922155924.1172019-5-clg@kaod.org/

Cheers,

C.

