Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp304520lfp;
        Mon, 20 Jan 2020 07:04:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqz2KibOSWIEa9CEFLJRF7J71DucBL2v59s/cjvHCZ0/Gkh1S02SyN0XbbOcFhA6apG+7jGV
X-Received: by 2002:ae9:f003:: with SMTP id l3mr47073991qkg.457.1579532696165;
        Mon, 20 Jan 2020 07:04:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579532696; cv=none;
        d=google.com; s=arc-20160816;
        b=Thld7yBJFSGGuCb0mZXfkv8ca6kcVLk8du8mwOPu4V7YkzSv/xewAz7tvo7HgXCfki
         6GicWxLmuCchIFs/oJrx9DGowBRFB+WiLydr8Ic+mL6fEx9MdOoj3mV9VpKtzSwUnBGZ
         15waN+8uK2Wssl6uE7XL2ZFjwZ5X5FpA4Ix3prutaRQNgm/lZWf9SxzSrl2CCtIhJaqK
         UMRy7d5mSdRSNkdcubGZzvimZbx+OD8oiQ18Nkg+hSRIk3/WalVYbwaWc2K7JRckWdcy
         r7tiX5dT2064S/G9SfMvoJbFDE/sZ/70cQINXNoDCBeBULHcEX/Kh+UINdtAcjpfwQLh
         G68A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cYUk/Z+LI4FyIdL08VbriZzU+9iNDeTdDsGeICvgo90=;
        b=FkTY2J59ka0wiAn9UoegsIm2mnYRrLhVwVEYUC7LjYV9tbNMtivC2UaAH2zeP4qzoM
         0gjQAKOyj4uqZqXqVeoQHY5vZL8NItVkfVSy12hmlxS9oMWZnI0Dkk8w4YJm/CjmssYl
         IrpOI3QjENF6JRFEQUKbWPdaovoPCR2kz/jTvAB5Ur4TYCgzq1gZJJz/Z5g1qVPaP8SI
         OdrvVe9CYV1MiXkMp12kcQ5CA+G2YQ5M3RYN62G8UGIqeH53+JvWWjVIWHaiVVaiWbD4
         hoSZ+3LhmK19GOFrO5seAA/YcKmS2ws1vwj14peiS+p/j1K6kuo0afaX+yAYVsYqRoCn
         XuuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V01x6T8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e12si21735139qtg.186.2020.01.20.07.04.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 07:04:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=V01x6T8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itYbn-0004T2-Fp
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 10:04:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46510)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1itYbP-0004R0-DH
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 10:04:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1itYbO-0005ZF-3h
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 10:04:31 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35875)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1itYbK-0005Wq-Ke; Mon, 20 Jan 2020 10:04:26 -0500
Received: by mail-pl1-x643.google.com with SMTP id a6so13307755plm.3;
 Mon, 20 Jan 2020 07:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cYUk/Z+LI4FyIdL08VbriZzU+9iNDeTdDsGeICvgo90=;
 b=V01x6T8r57HynFK1kZrKhycbc0ey8uC8+YsOJeMC8E+cizfNzEdJYLSDYOTvMdBg9o
 4qIdopyrg/SFeI7VcAIHgsAYxe3gC+mlj+UaDwl0H+T6Ge11JROgeZLNFHgfCPXULSCj
 HEEZIoZQdkTnpy5MoVcugA4ylPE9FVz4O5ABC9EDXy8/AWYqw8HEYVFBsH08+J00c4nH
 v9jk7FrrL8iKu15hHos9NonyM/YE3RG0weqxycmJlcna5AOvD9K4jFucpSCgwp7o2zSC
 LuwXWsRpKP3UkVnqSfHVG77PsucHrSmwso53MJXjRrBiHLjm3HcRbjd9DDxsrO4Na0bt
 5m4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cYUk/Z+LI4FyIdL08VbriZzU+9iNDeTdDsGeICvgo90=;
 b=WmuS1qcDDhV7Q1yxOh8u8eSpdLwm3xM2f5wGv3G3Hm0nXG9hQ2zuCofvADWVcgcSdN
 klFwmHwrCtxyy861Xo7aEbnBIZPp65t3Bij1XWPngUMU5iZdHUIFVvggn98qNufNHxBc
 ldinmGo2n7a5jOydpDM4i4X2o8Y5oi9zziXAq8d0z/gqL4wxYJz5vt+MQEvMfWk2LwQ+
 6FwIcOOR4JAw8Al3nFRIGbAyzUqVT/rPtNLyvvEYRzbfXvcHhGawLQPl6cnHpM2dmtng
 BSVsZbYOa2S9tZ5W2oC8GLYCTyQp6rxXbYRhWSxkMZl6dK4FiyB+IefcSWC/GXWILAdp
 +HnA==
X-Gm-Message-State: APjAAAXicL/SygBptg+dPd0iuy6OynQu30ncX7iqNOCDe7e/gxQCImCH
 SWVT2/FcBYb6x2aEDHptfK9zM/uU
X-Received: by 2002:a17:90a:7f01:: with SMTP id
 k1mr23694091pjl.81.1579532665263; 
 Mon, 20 Jan 2020 07:04:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 q15sm37952828pgi.55.2020.01.20.07.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2020 07:04:23 -0800 (PST)
Subject: Re: [PATCH v2 5/7] hw/char/exynos4210_uart: Implement Rx FIFO level
 triggers and timeouts
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-6-linux@roeck-us.net>
 <CAFEAcA9kK7mK=FQRKc0sDL8rZzibYov9Xm__+-MA06ERCotZ1Q@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <23f499e3-aaf3-c079-b850-04cb4c7e3b5e@roeck-us.net>
Date: Mon, 20 Jan 2020 07:04:22 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9kK7mK=FQRKc0sDL8rZzibYov9Xm__+-MA06ERCotZ1Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: obhDdYlAsav9

On 1/20/20 5:58 AM, Peter Maydell wrote:
> On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> The driver already implements a receive FIFO, but it does not
>> handle receive FIFO trigger levels and timeout. Implement the
>> missing functionality.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Call exynos4210_uart_rx_timeout_set() from new post_load function
>>      to set the receive timeout timer.
>>      Add timer to vmstate_exynos4210_uart.
>>
>>   hw/char/exynos4210_uart.c | 122 ++++++++++++++++++++++++++++++--------
>>   hw/char/trace-events      |   3 +-
>>   2 files changed, 99 insertions(+), 26 deletions(-)
> 
> Since the timeout value depends on s->wordtime, and
> exynos4210_uart_update_parameters() can change s->wordtime,
> do you need to recalculate the timeout at that point?
> This would correspond to if the guest wrote to the
> UBRDIV/UFRACVAL/ULCON registers, I think. Maybe this comes
> under the heading of "undefined behaviour if the guest does
> this odd thing" ? (The exact behaviour of the h/w is probably
> undocumented and mildly painful to emulate exactly, so it's
> hard to see why QEMU should care about getting it exactly right.)
> 
> I did also wonder whether writing the same value to the UCON
> timeout-interval field repeatedly really does restart the timer
> counting down from 8*(N+1) frames again, but again maybe that's
> just weird for a guest to do.
> 

The datasheet only talks about the number of word times that is set
with the UCON register. It doesn't say what the hardware does
if the word time (baud rate) is changed while data is in the receive
queue. But then data in the receive queue suggests that the remote
end is actively transmitting, and changing the baud rate in that
situation would result in a mess. With that in mind, I don't think
we need to be concerned about an inaccurate word time for a few
milliseconds after a baud-rate change.

I agree that changing the UCON value might not have an impact
on data already in the queue. I'll drop that call - I would guess
that HW doesn't bother recalculating anything when UCON is set
(changed or not), and it doesn't really matter, so why bother
with the extra code.

>> @@ -553,6 +620,7 @@ static const VMStateDescription vmstate_exynos4210_uart = {
>>                          vmstate_exynos4210_uart_fifo, Exynos4210UartFIFO),
>>           VMSTATE_UINT32_ARRAY(reg, Exynos4210UartState,
>>                                EXYNOS4210_UART_REGS_MEM_SIZE / sizeof(uint32_t)),
>> +        VMSTATE_TIMER_PTR(fifo_timeout_timer, Exynos4210UartState),
>>           VMSTATE_END_OF_LIST()
>>       }
>>   };
> 
> Unfortunately you can't simply add entries to a VMStateDescription:
> it breaks migration compatibility.
> 
> The choices here are:
>   * the nicest approach if it works is that in the post_load
> function you just recalculate the timer timeout. Then there's
> no need to migrate the current state of the timer. (In fact
> it looks like your code does do this in post_load.)


Correct, and that was the idea. The rest is just a lack of
understanding, so I'll drop VMSTATE_TIMER_PTR.

Thanks,
Guenter
