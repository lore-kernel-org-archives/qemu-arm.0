Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3057167ejc;
        Mon, 23 Jan 2023 08:41:54 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuv0NC3/in+KcJy/2m4Mjk9emeAXdhuC2fmEpeitH/PkFzR0S2PIVP+HMQsD85cUC63C+cw
X-Received: by 2002:ac8:5a95:0:b0:3b6:2f0d:1924 with SMTP id c21-20020ac85a95000000b003b62f0d1924mr48225837qtc.32.1674492114029;
        Mon, 23 Jan 2023 08:41:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674492114; cv=none;
        d=google.com; s=arc-20160816;
        b=pwF8yezKZRSniZ/W5rXUuHW+E8sLfTIoHv1ps22th+GDbVCO4TBqchpBpD2pr4KBqt
         oxvxAXEA0WYHDDSOLKqEAbKDk4MhRSbBOrFvY35esCPEr9CGmsYeUIIQKiNZcfzKmRf/
         gIploRdpn2bsO0G5Zt1fxBETcpF3tfTX8A9ORekkqgdPXx5+aSdR7WNR6/MuBzv8qr4u
         5APvgVfJaW8+p38W+7bnnctY7RPziwldY3RNx8YKU0XmxqW4egeat9qFoc2TPJvFv9JG
         QR6I4MpsvOISL5pHq4pQrar/X5AlUOgPYAEYraWbBCw4G8ntPfnKQI5oYPkPosQ1SMdi
         9ZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=tWXOu7UZkYprU7FVvJ1dHULN2R/hsHttRxH9fu/yWgc=;
        b=MBeSqzO15Uwqz2rPYTFe8XJ1Wmo/r3x1p4Neql02QGuOUCVuK3A3ke45/4/l4GLcLQ
         Dp4erbr0zrKKjby0HHxLH3uCT3iVJQsKcVhe6AIdNOknu3MqZMIEwM9kAC9KiQ6VrJKe
         6zosVJ3uoir43GsVqFga5VyTpAnLwTJXWtXfiqKLpiQ0d9KdCAB4JoyZs7dGObYXoz2D
         rPWoIO4BhVj2gBpfiV6xIWTImsyTZ9z/17kB0wyE8mJMlWVzsiJrsNQZUg3ixKevg1Co
         AxbDJcIqXxeBmxYt5B2EYWSHbcW38+MzvyQBbbkld4mHkjhPk6OvZ1PJLfU6JY6hQ2NK
         DDng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FJNz9jJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fa11-20020a05622a4ccb00b003b655d0dacfsi12362613qtb.221.2023.01.23.08.41.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Jan 2023 08:41:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FJNz9jJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pJzsy-0000IE-Is; Mon, 23 Jan 2023 11:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJzsv-0000HX-TV
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 11:41:29 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJzsu-0006KJ-5i
 for qemu-arm@nongnu.org; Mon, 23 Jan 2023 11:41:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id d14so7698960wrr.9
 for <qemu-arm@nongnu.org>; Mon, 23 Jan 2023 08:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tWXOu7UZkYprU7FVvJ1dHULN2R/hsHttRxH9fu/yWgc=;
 b=FJNz9jJJmmOG/gyUSWYfLet252KVxdDLzI6qtfqns4h7EYSP6nb8sV988xwHZY5ML2
 giXoqPrHlvq8ZvkWATUSPd/ek+5lYYIrnccWs+uVbsqzVp0bSsBlEwrOe4cPwzXVbtvH
 NY3WH8LWPq5jHf6T8tXdhepW6m4i/oh5WeCI+5hMzC0QocHn+VbmrR6WTycJoc+uI6Ig
 I88uU5OwnVLmJCWqF5puAWBzosu0yxAYvGzRGAPZDuWh/fOnX2ZXNeN9ZVSdlfU4sYVM
 D8mEnUh+hrzF/IM5FKtxL5T/qjuMUxI9MXyaYMaSYOtuvlld2wgvYYw9qAZn6My4Rxlg
 RCTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tWXOu7UZkYprU7FVvJ1dHULN2R/hsHttRxH9fu/yWgc=;
 b=7y7lxJwySxMIMnGalEPtEOAUkbiBgxks4E818VicWzb6SrCDkLGh/4Q+EAT+bDZQRp
 x27fbZ75ImxGNNf36uVjhVPejgdf18BoEAHt80iadAtt1pQte4JzsRpyHEmStsXQkeHz
 iiqfP50w4353Jl7cmHvZv4/agf4MxaBokedOnAQBv6G+gujDG0UipcoJcMqk8qChEJTY
 6nGONRkWQA63OYjXwk6uUZzDgJuRqIDwhZFfwd+sWfSqz3yRcFYAyuAqQqk1hCj4kFgT
 o4zny6+MVAseazPCCo7AcBI1rsqu7+AMU/5bQprsemAbQEbqZqYveSSYA2RUPlhMPdOM
 KwJQ==
X-Gm-Message-State: AFqh2ko1j4BcMZD/agMZALlUtjOz7KNzeUTo9V9X29ZrBYWZQjJUFzun
 EwT/4ijnI3CKeye0oznbf+6ZJw==
X-Received: by 2002:adf:b604:0:b0:242:1809:7e17 with SMTP id
 f4-20020adfb604000000b0024218097e17mr21318159wre.6.1674492086526; 
 Mon, 23 Jan 2023 08:41:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j10-20020adfea4a000000b002bbdcd15e44sm2606151wrn.37.2023.01.23.08.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 08:41:26 -0800 (PST)
Message-ID: <484f5d72-2186-c60c-112a-1ae76b7b7e45@linaro.org>
Date: Mon, 23 Jan 2023 17:41:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 5/5] hw/char/pl011: check if UART is enabled before RX
 or TX operation
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-6-eiakovlev@linux.microsoft.com>
 <fc01ef6d-73d7-af1a-3e59-bd4f1e3e83ba@linaro.org>
 <1937dbbf-579d-e236-4669-afdc633995a1@linux.microsoft.com>
 <04d950dc-bd01-d9ca-cbec-25b52ccd70e8@linaro.org>
 <CAFEAcA_93iF+oiYAs_tymHGSkFAZx3-1Rh=z22ggBggz+3KnKA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_93iF+oiYAs_tymHGSkFAZx3-1Rh=z22ggBggz+3KnKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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
X-TUID: hZ5K7t8iyUlE

On 23/1/23 17:23, Peter Maydell wrote:
> On Mon, 23 Jan 2023 at 15:21, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> pl011_can_receive() returns the number of bytes that pl011_receive() can
>> accept, pl011_can_transmit() returns a boolean.
>>
>> I was thinking of:
>>
>> -- >8 --
>> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
>> index dd20b76609..ea5769a31c 100644
>> --- a/hw/char/pl011.c
>> +++ b/hw/char/pl011.c
>> @@ -221,6 +221,11 @@ static inline bool pl011_can_transmit(PL011State *s)
>>        return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_TXE;
>>    }
>>
>> +static inline bool pl011_can_receive(PL011State *s)
>> +{
>> +    return s->cr & PL011_CR_UARTEN && s->cr & PL011_CR_RXE;
>> +}
>> +
>>    static void pl011_write(void *opaque, hwaddr offset,
>>                            uint64_t value, unsigned size)
>>    {
>> @@ -299,12 +304,12 @@ static void pl011_write(void *opaque, hwaddr offset,
>>        }
>>    }
>>
>> -static int pl011_can_receive(void *opaque)
>> +static int pl011_receivable_bytes(void *opaque)
>>    {
>>        PL011State *s = (PL011State *)opaque;
>>        int r;
>>
>> -    if (!(s->cr & PL011_CR_UARTEN) || !(s->cr & PL011_CR_RXE)) {
>> +    if (!pl011_can_receive(s)) {
>>            r = 0;
>>        } else {
>>            r = s->read_count < pl011_get_fifo_depth(s);
>> @@ -459,7 +464,7 @@ static void pl011_realize(DeviceState *dev, Error
>> **errp)
>>    {
>>        PL011State *s = PL011(dev);
>>
>> -    qemu_chr_fe_set_handlers(&s->chr, pl011_can_receive, pl011_receive,
>> +    qemu_chr_fe_set_handlers(&s->chr, pl011_receivable_bytes,
>> pl011_receive,
>>                                 pl011_event, NULL, s, NULL, true);
>>    }
>>
>> ---
>>
>> with maybe a better name for pl011_receivable_bytes().
> 
> Our standard-ish name for the function you pass to
> qemu_chr_fe_set_handlers() is either foo_can_receive
> or foo_can_read, though. That is followed through in
> the name of the function argument (fd_can_read),
> its type (IOCanReadHandler), and the field it gets stored
> in (CharBackend::chr_can_read). It's not a great convention
> but at least it is a convention...

I agree this deserves a better name; maybe this is not a
convention but I'd expect functions starting with is_* / can_*
to return a boolean value, not a number:

/**
  * IOCanReadHandler: Return the number of bytes that #IOReadHandler can 
accept
  *
  * This function reports how many bytes #IOReadHandler is prepared to 
accept.
  * #IOReadHandler may be invoked with up to this number of bytes.  If this
  * function returns 0 then #IOReadHandler is not invoked.
  *
  * This function is typically called from an event loop.  If the number of
  * bytes changes outside the event loop (e.g. because a vcpu thread 
drained the
  * buffer), then it is necessary to kick the event loop so that this 
function
  * is called again.  aio_notify() or qemu_notify_event() can be used to 
kick
  * the event loop.
  */
typedef int IOCanReadHandler(void *opaque);

Also, maybe using unsigned or size_t type for the return value would
better fit. Anyhow, not really a priority :)
