Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2975051ejc;
        Mon, 23 Jan 2023 06:43:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsMbS8ZZZou3/kwKRJ+MBRIy9ICFYQ0VuyYfGB/gGiOQBtPttAC+wihGlzvYk1uD+9IGSBM
X-Received: by 2002:ac8:478c:0:b0:3a9:8353:aeeb with SMTP id k12-20020ac8478c000000b003a98353aeebmr33808348qtq.5.1674485026440;
        Mon, 23 Jan 2023 06:43:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674485026; cv=none;
        d=google.com; s=arc-20160816;
        b=edjIL5BGQscsEh0bohguZEv95lq/opDYS8q5B9Zy2oAeYEWNsvwoEHQi2wa7nJmJqr
         8wyUUgJc304YNw0xLoH2GiZ7HeknIXsAKgCmArXHBmliKK3Iaf02QnDUyjWloERvjfiS
         CL918kYpCJX/5n2GQjop7aR8po385x1kdACL4TNcG4pExp6ipk636VY0mnERNw0S7a42
         B02tBYAeSt1mDuYHMoqzhrn1WNau8aI+xITb9/21IMmjFF89e8DkDPrrb1HljmTQnCAU
         tl7Tcq5k2WZTHsch3aTXSL20XGzJZRGSpcO8hSl5upqPouSLL9mcJM3WDIhhwU79nFz+
         ylXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature:dkim-filter;
        bh=2GWLY1N1oXzoQM3H+Mu71nQ/nLi1bQVm99dloDvq4bI=;
        b=Stwj6ENaE7Lnw0ndCGb75dgBNFfMx0BRLV05CbSPJKUV1gUZ7TFqrJeIRpDDUib81K
         Uc3Mll9CphxgRyKbvOm5aypDhUoS0eeskN9HrfbDmPsXFJEbRjmVeT36lH5tnceegcBt
         cgpLdzOFrC1MoDt2HIzo3GGF7klKtZJNNpfDblWYZCELIDsf9Anv/ypd887v8VE+iZEJ
         zXKx7j1XMaQp3vg80lZzf+iBRpmPRF0XFgA+iuEdoFMF/IFsXzPUeg3J+DERgDYrFBAU
         F/ALreOhat52kG+Un3tCNWMZTeaOnxjrNurjB/6ydZ+2Mcw5ZSn+HZ+hFu0CxL1Z1Pal
         mcrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b="hwl5sS/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c10-20020ac87d8a000000b003a4fdddf5d2si15185427qtd.685.2023.01.23.06.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 06:43:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.microsoft.com header.s=default header.b="hwl5sS/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.microsoft.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJy2R-0000s4-4x; Mon, 23 Jan 2023 09:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJy2N-0000rK-4L; Mon, 23 Jan 2023 09:43:07 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pJy2L-0000eE-Mg; Mon, 23 Jan 2023 09:43:06 -0500
Received: from [192.168.0.20] (unknown [77.64.253.114])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3922E20E2D07;
 Mon, 23 Jan 2023 06:43:02 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3922E20E2D07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674484983;
 bh=2GWLY1N1oXzoQM3H+Mu71nQ/nLi1bQVm99dloDvq4bI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hwl5sS/zyKRxSi7CxOG8yD73Me2IIfuODtRuaeRJ+cuNuE2vZdwDcbd2WdxDVkB1w
 r4S7fBmrKj9ejJ3z0y0aHGJiARivA9dmaT8jSl2/nZkW0Q7aLaPHYQRikA6uWf4yCp
 vmn76vZebMc9tJbjYcfVEd38XqdPZLVGjQmp0JwI=
Message-ID: <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
Date: Mon, 23 Jan 2023 15:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
 <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
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
X-TUID: A1XnSPvC3FVl


On 1/23/2023 09:14, Philippe Mathieu-Daudé wrote:
> On 20/1/23 16:54, Evgeny Iakovlev wrote:
>> UART should be enabled in general and have RX enabled specifically to be
>> able to receive data from peripheral device. Same goes for transmitting
>> data to peripheral device and a TXE flag.
>>
>> Check if UART CR register has EN and RXE or TXE bits enabled before
>> trying to receive or transmit data.
>>
>> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>   hw/char/pl011.c | 22 +++++++++++++++++++---
>>   1 file changed, 19 insertions(+), 3 deletions(-)
>
>> +static inline bool pl011_can_transmit(PL011State *s)
>> +{
>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>> +}
>> +
>>   static void pl011_write(void *opaque, hwaddr offset,
>>                           uint64_t value, unsigned size)
>>   {
>> @@ -221,7 +231,9 @@ static void pl011_write(void *opaque, hwaddr offset,
>>         switch (offset >> 2) {
>>       case 0: /* UARTDR */
>> -        /* ??? Check if transmitter is enabled.  */
>> +        if (!pl011_can_transmit(s)) {
>> +            break;
>> +        }
>>           ch = value;
>>           /* XXX this blocks entire thread. Rewrite to use
>>            * qemu_chr_fe_write and background I/O callbacks */
>> @@ -292,7 +304,11 @@ static int pl011_can_receive(void *opaque)
>>       PL011State *s = (PL011State *)opaque;
>>       int r;
>>   -    r = s->read_count < pl011_get_fifo_depth(s);
>> +    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>
> Maybe add pl011_can_receive() similarly to pl011_can_transmit().
>
> Otherwise:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Thanks! There's already a pl011_can_receive though, its the 
pl011_can_transmit that's new :)


>
>> +        r = 0;
>> +    } else {
>> +        r = s->read_count < pl011_get_fifo_depth(s);
>> +    }
>>       trace_pl011_can_receive(s->lcr, s->read_count, r);
>>       return r;
>>   }
