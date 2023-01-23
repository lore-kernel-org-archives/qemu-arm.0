Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3035946ejc;
        Mon, 23 Jan 2023 08:09:52 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtv1xAf0pnUFGPlhWb1/cZ2Fek0Hw3E7gBHalyRtdEnsmNDa9k2+zW7wC6t9RXuCx6jgxBO
X-Received: by 2002:ad4:518c:0:b0:534:d47c:1eb5 with SMTP id b12-20020ad4518c000000b00534d47c1eb5mr36061936qvp.2.1674490191859;
        Mon, 23 Jan 2023 08:09:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674490191; cv=none;
        d=google.com; s=arc-20160816;
        b=kif3jVMyGTH8PFoY/66+W6ImbCUG/8OK2FOIcTRSOZKFTRVGCPaA50dHJULIl43can
         pNzlExrSmlLmnQ16Cblgd+iQHK/b0u7lRzzjvXqfgzHYhZhzKbw9dZHd/9w7GBkcoWWR
         /Ju5kGFIdPjjMucMeey9T8mye8waAkGFFpiDjKXg82/whYvNFffC1Of22CjPQL4VWMX0
         diWAn1iCGBj48kqgqpDg258YvHq/UWRkM0hGG2Xru/06zBHyJbQsBwktimIuJAr3xxt5
         KP7EhcTgvgbO4h2b0jZZw5tcUJYw2eTT0bSuRtIsUHYVYf1tZiawVNevgz1jn2D3kwbT
         1qBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:references:cc:to:from:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature:dkim-filter;
        bh=lFPXkY3wKR5bj8jU13cXZhYwE7I8rrcePUJ9m+XuA/g=;
        b=ojzGMqAGGXc8u+XY3rqK3/NTybRC7fwTWWZESfJstdnoWthSgelIDWmec1tbsOXlHN
         3TYCe5DbFJIRPvwhKWCZuY2l2x1l/A3/+y7WVNXDdeqdPcc7Usuq9GSzpbl2NvBYNkxa
         wQ5UHrEYa0ZTIOZei1P0R7EV8AjcYsVN5jdDWsry73Fw0f+h/V/eUuB5rXr/XjpjUbco
         Z5+yuCjZ3ZEwoLZXgRsVGcTyL4kaIOWqPuW94ii3v6rTeosVgizsWzpgFusHs+Z1dy0E
         RTOnu8VLerNTQCati/d6qp9EovLC9SvY2cEAOfzw3uAFM5q/LaaSakv4uLbIAD/BHBvv
         rXUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=oGQV7CCh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a0562140d0e00b00534d7d39754si15997675qvh.441.2023.01.23.08.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 08:09:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b=oGQV7CCh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJzNj-00054s-89; Mon, 23 Jan 2023 11:09:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzNe-00053K-Sd; Mon, 23 Jan 2023 11:09:11 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJzNc-0000tr-MB; Mon, 23 Jan 2023 11:09:10 -0500
Received: from [192.168.0.20] (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id 4A26D20E1ABA;
 Mon, 23 Jan 2023 08:09:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4A26D20E1ABA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674490147;
 bh=lFPXkY3wKR5bj8jU13cXZhYwE7I8rrcePUJ9m+XuA/g=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=oGQV7CCh6uKwftAknNo2X1LE7HWVDq/ZEeMZjBYzYebUQuQar49faqKLS/4ZGbCH2
 RLCsdajuAsjqq/FltSf8SKeQR0hqxw/gWGHBh0YGGji8hcY75J/YODMGjOAXmot0hd
 HhHF9DBk3E8rLJytcU6VJG0PvTdtDshYUA+883QQ=
Message-ID: <767e54ca-53f4-7092-6171-2689e46709b8@linux.microsoft.com>
Date: Mon, 23 Jan 2023 17:09:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
Content-Language: en-US
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
 <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
 <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
 <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
 <be7dae6f-30d6-a6c6-af3c-4d826b39de07@linux.microsoft.com>
In-Reply-To: <be7dae6f-30d6-a6c6-af3c-4d826b39de07@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -208
X-Spam_score: -20.9
X-Spam_bar: --------------------
X-Spam_report: (-20.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: 1iBKjrKwRGCX


On 1/23/2023 16:59, Evgeny Iakovlev wrote:
>
> On 1/23/2023 16:21, Philippe Mathieu-Daudé wrote:
>> On 23/1/23 15:43, Evgeny Iakovlev wrote:
>>>
>>> On 1/23/2023 09:14, Philippe Mathieu-Daudé wrote:
>>>> On 20/1/23 16:54, Evgeny Iakovlev wrote:
>>>>> UART should be enabled in general and have RX enabled specifically 
>>>>> to be
>>>>> able to receive data from peripheral device. Same goes for 
>>>>> transmitting
>>>>> data to peripheral device and a TXE flag.
>>>>>
>>>>> Check if UART CR register has EN and RXE or TXE bits enabled before
>>>>> trying to receive or transmit data.
>>>>>
>>>>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>>>>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>>>> ---
>>>>>   hw/char/pl011.c | 22 +++++++++++++++++++---
>>>>>   1 file changed, 19 insertions(+), 3 deletions(-)
>>>>
>>>>> +static inline bool pl011_can_transmit(PL011State *s)
>>>>> +{
>>>>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>>>>> +}
>>>>> +
>>>>>   static void pl011_write(void *opaque, hwaddr offset,
>>>>>                           uint64_t value, unsigned size)
>>>>>   {
>>>>> @@ -221,7 +231,9 @@ static void pl011_write(void *opaque, hwaddr 
>>>>> offset,
>>>>>         switch (offset >> 2) {
>>>>>       case 0: /* UARTDR */
>>>>> -        /* ??? Check if transmitter is enabled.  */
>>>>> +        if (!pl011_can_transmit(s)) {
>>>>> +            break;
>>>>> +        }
>>>>>           ch = value;
>>>>>           /* XXX this blocks entire thread. Rewrite to use
>>>>>            * qemu_chr_fe_write and background I/O callbacks */
>>>>> @@ -292,7 +304,11 @@ static int pl011_can_receive(void *opaque)
>>>>>       PL011State *s = (PL011State *)opaque;
>>>>>       int r;
>>>>>   -    r = s->read_count < pl011_get_fifo_depth(s);
>>>>> +    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>>>>
>>>> Maybe add pl011_can_receive() similarly to pl011_can_transmit().
>>>>
>>>> Otherwise:
>>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>
>>>
>>> Thanks! There's already a pl011_can_receive though, its the 
>>> pl011_can_transmit that's new :)
>>
>> pl011_can_receive() returns the number of bytes that pl011_receive() 
>> can accept, pl011_can_transmit() returns a boolean.
>
>
> Hm, no, pl011_can_receive never actually returned the number of bytes. 
> It's a boolean value as an int. Which is a bug, because 
> qemu_chr_fe_set_handlers expects it to return the byte count, not a 
> 0/1 value.
>
> I'll fix it then.


Actually, no, i spoke too soon. qemu_chr_fe_set_handlers indeed expects 
a number of bytes from pl011_can_receive, but pl011_can_receive also 
deliberately gives it 1 and not how many bytes are there in queue 
really, because everything else on the receive code path is written with 
an assumption to only accept 1 element at a time (see pl011_put_fifo).

If we want to optimize this part, we would need to change that 
assumption. That should better be done as a separate change though, 
which i can send later.


>
>
>>
>> I was thinking of:
>>
>> -- >8 --
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index dd20b76609..ea5769a31c 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -221,6 +221,11 @@ static inline bool pl011_can_transmit(PL011State 
>> *s)
>>      return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>>  }
>>
>> +static inline bool pl011_can_receive(PL011State *s)
>> +{
>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_RXE;
>> +}
>> +
>>  static void pl011_write(void *opaque, hwaddr offset,
>>                          uint64_t value, unsigned size)
>>  {
>> @@ -299,12 +304,12 @@ static void pl011_write(void *opaque, hwaddr 
>> offset,
>>      }
>>  }
>>
>> -static int pl011_can_receive(void *opaque)
>> +static int pl011_receivable_bytes(void *opaque)
>>  {
>>      PL011State *s = (PL011State *)opaque;
>>      int r;
>>
>> -    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>> +    if (!pl011_can_receive(s)) {
>>          r = 0;
>>      } else {
>>          r = s->read_count < pl011_get_fifo_depth(s);
>> @@ -459,7 +464,7 @@ static void pl011_realize(DeviceState *dev, Error 
>> **errp)
>>  {
>>      PL011State *s = PL011(dev);
>>
>> -    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
>> +    qemu_chr_fe_set_handlers(&s->chr, pl011_receivable_bytes, 
>> pl011_receive,
>>                               pl011_event, NULL, s, NULL, true);
>>  }
>>
>> ---
>>
>> with maybe a better name for pl011_receivable_bytes().
>>
