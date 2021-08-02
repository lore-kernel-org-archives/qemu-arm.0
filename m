Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp1627852lff;
        Mon, 2 Aug 2021 06:19:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGmnxPTRuBRyOqc9JSXYE8XUa/SXPUB9a96NQeIG1e8JCI3bbYE4DgnnzE2MMC+JD/Iqx4
X-Received: by 2002:aa7:c805:: with SMTP id a5mr19106584edt.23.1627910396966;
        Mon, 02 Aug 2021 06:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627910396; cv=none;
        d=google.com; s=arc-20160816;
        b=tomoFUJnVa6j3hhoRB22hqXmHTlEQroyMH+5rkScfT1bupK+mVJy/Wu+seiM6HPOB9
         SMKRrZ0lyuOya6u3UwMJUrF9V59rN/6iTR/0081yzQHtOeVDnbNwUkI8mGissBoH1j/s
         rGRxMo10o7seqDzVfkpqAsLi2sUPO3HHUx4FkNFbq5oZEHWnHyZKlCdBjN6StMkpX+lB
         0+Z5utHesD5OSBQCRxSDHuIiJDZ9/YtiWHcfji05n9u1BF1ZHtHlmKCFn1hOY31Yyfc8
         lKff9convU1C/zcQJU49GPvurB+aQwv0GSuXohzN8PkyPlu65yJVOGPDvLlsjAth2+HF
         trFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=zSVZ7+iqRM+5ym3b/VNQqC01d6H7a7kQ8lfbWH6uI9o=;
        b=R5peD3+4MVvEmzgid4ynWLNra2BnsClTfGFNHM/fJOlmxLfE+Sel7EYLr48LJAx9dC
         ZNnrF5uAZx3VJe2ZVc5QnJjfCRoP77H6gZzYdlvNaZaus6k6gvkH9AyJGSmX8afFO3Am
         fMqKwbwce5U03Ym3H3gJBhlSEB8I8pD3KPAfBM+GhplweXjsRVaAto/kPNuX8LHxP/8/
         +PEJlTas/Mpm83MK7pPbjSulg+UDwAyY4Gd0janVxSs+tBLpbLcX3sCdqLRNhyRGC30M
         yD5G4zJf3z1YeOi8eNG7vuDPLOUzqfZZibIqFOFvygYTEwJzDSpYj2pLBAzOTi0aeUQm
         kmzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="S/HZb14m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gq9si10002937ejb.654.2021.08.02.06.19.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Aug 2021 06:19:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="S/HZb14m";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mAXrI-0002gW-3M
	for alex.bennee@linaro.org; Mon, 02 Aug 2021 09:19:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAXqv-0002ea-DC; Mon, 02 Aug 2021 09:19:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mAXqt-0005zb-WE; Mon, 02 Aug 2021 09:19:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id n12so21474336wrr.2;
 Mon, 02 Aug 2021 06:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zSVZ7+iqRM+5ym3b/VNQqC01d6H7a7kQ8lfbWH6uI9o=;
 b=S/HZb14mui4ZUHDO8lsce/EV6y3bV2MCI+y6lGiRMTpw2/GmIDwhtxBJdENsR33IRR
 rOS0+qupmApZoBGtvgHeiXSWnp1ylmcW1YXe00vHuW23C5CQtLMTL9IOxnHxh3zOMlOt
 h1rrL0NFrNr0gpXYz9zEPo8WRmwmhO1kZlOGK3+pFYpptONAucQACOc+GR5OSlq2ct3D
 T29gvRe9kROsCEmOT4NDNW6x9PimHaBfHkv2GZ2nhxoN5CMup9cgGpH+Hn+jzjIp/VzQ
 PACq1i+ZO/dpjeDv0wVCbfph7ve4Mf9MX/BmOXQeXlclBykjqoRxixdqzT6/UwZ8fgyy
 pYdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zSVZ7+iqRM+5ym3b/VNQqC01d6H7a7kQ8lfbWH6uI9o=;
 b=cN7JxlV5QC70yvbjMwSbN5tv4SXvT+Twlgjzz0HRROKVoBanpJsiVXFd66ARzcKc0F
 KkbaputUHqAaoWRLHiSloi64hxaeOSxsE7gG3FvKKZPbyn11YPt6Ap2rVa/CS+D8R7h/
 JqVZtkKe4LNAFebEHwwJaMzZZ9mjukPcrkNIGyP8meg7AKo0r+1MqyCezsYDp8Pxrrin
 +1vQMJ3XDXuBNg+PDAfndgf0lhsQBqY02m5gszgEYnj6H89948Bxqv3JHYTAYh+EbCRE
 Fm+CV/kFQzNV8/P9asqMblddpYYxSi7SGy7PLu9L6Hfm1wxifQRtVXu+sak8wrbPbqjj
 FR3Q==
X-Gm-Message-State: AOAM531vQB4AydfGfh8cb6w2btYqkMj23H+e5oiQrOOXzkFDuzat2b8x
 Y4gs+4Lkgsj6+rkDl8kuAs9Ydfp3kqMswg==
X-Received: by 2002:adf:ff92:: with SMTP id j18mr17907860wrr.334.1627910369736; 
 Mon, 02 Aug 2021 06:19:29 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id k6sm11069684wrm.10.2021.08.02.06.19.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:19:29 -0700 (PDT)
Subject: Re: [PATCH-for-6.1 1/3] hw/sd/sdcard: Document out-of-range addresses
 for SEND_WRITE_PROT
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210728181728.2012952-1-f4bug@amsat.org>
 <20210728181728.2012952-2-f4bug@amsat.org>
 <CAFEAcA_FSR23eR5Z8ix3HyFmmoFVK7eQCRqwA-YEuSqEMA4TkA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <07b405e8-24d7-fa13-506b-3bd059b0db1a@amsat.org>
Date: Mon, 2 Aug 2021 15:19:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_FSR23eR5Z8ix3HyFmmoFVK7eQCRqwA-YEuSqEMA4TkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Bin Meng <bin.meng@windriver.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: x1UqjwH5j6er

On 8/2/21 2:00 PM, Peter Maydell wrote:
> On Wed, 28 Jul 2021 at 19:18, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Per the 'Physical Layer Simplified Specification Version 3.01',
>> Table 4-22: 'Block Oriented Write Protection Commands'
>>
>>   SEND_WRITE_PROT (CMD30)
>>
>>   If the card provides write protection features, this command asks
>>   the card to send the status of the write protection bits [1].
>>
>>   [1] 32 write protection bits (representing 32 write protect groups
>>   starting at the specified address) [...]
>>   The last (least significant) bit of the protection bits corresponds
>>   to the first addressed group. If the addresses of the last groups
>>   are outside the valid range, then the corresponding write protection
>>   bits shall be set to 0.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/sd/sd.c | 9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
>> index 1f964e022b1..707dcc12a14 100644
>> --- a/hw/sd/sd.c
>> +++ b/hw/sd/sd.c
>> @@ -822,7 +822,14 @@ static uint32_t sd_wpbits(SDState *sd, uint64_t addr)
>>
>>      for (i = 0; i < 32; i++, wpnum++, addr += WPGROUP_SIZE) {
>>          assert(wpnum < sd->wpgrps_size);
>> -        if (addr < sd->size && test_bit(wpnum, sd->wp_groups)) {
>> +        if (addr >= sd->size) {
>> +            /*
>> +             * If the addresses of the last groups are outside the valid range,
>> +             * then the corresponding write protection bits shall be set to 0.
>> +             */
>> +            continue;
>> +        }
>> +        if (test_bit(wpnum, sd->wp_groups)) {
> 
> Am I misreading it, or does this commit not actually change
> the behaviour of the code ?

Yes, I don't want to change the behaviour but document it
better.

> 
>>              ret |= (1 << i);
>>          }
>>      }
>> --
>> 2.31.1
> 
> -- PMM
> 
