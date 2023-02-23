Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp878322ejc;
        Thu, 23 Feb 2023 08:20:59 -0800 (PST)
X-Google-Smtp-Source: AK7set8OZGGMurS6hZLECGJdJ87T3u0Oo1ynzJ2Ob+8RpllQJGZUQYfQdl7w+wrzYVX8pkZRRrMm
X-Received: by 2002:a05:622a:20c:b0:3bf:b75a:d7a7 with SMTP id b12-20020a05622a020c00b003bfb75ad7a7mr1186304qtx.7.1677169259568;
        Thu, 23 Feb 2023 08:20:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677169259; cv=none;
        d=google.com; s=arc-20160816;
        b=DeaYIioK1eQVDKjTA48l/NQw59arzIK/rrKS7Z9EeViz48phvAV7e8TN0KOZTkEV4m
         0uckM8TqjgtfNqgtVJhcQHZso7WwJwD3sXMDLGKGyQ69dke/53TJvg066PZOJrycx8Ab
         Z9eUSbeRWkZMklj25Bg2/V0QNDXJxNPLH58UA0INCA83PihIqMxj1E8OG6OeavO7UkOk
         GcPgaXznQj24iVzSVZxJ++uUG/TSG3wLEoWXvaLyynPtWJfFHDAsoZ+8nUZOjPTQjiUh
         fkdSyjyum2g0mfMoqrzUIfKEpDjL4zHFXbqppocDHgs75wjFHo8QJF5XVL0SBQ7vYKY1
         f8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0N5/W6qgvMoVVcxzs8tB9yIJh7BwUfPEU4dj5oWBadw=;
        b=QzzmjCmRV21kd2nhCXclD6l8NaocmpMT3ZKRx58h6gme+UzfoiNiN0zGqzlBDiJ+e1
         9GXdfPm1qfuYHir4vDnPBcXOX1OBkWUpgfzXUYR/X8TnaBWuvMxnoFyja38BIJ81qC3H
         Vn4VE2AIQyCwtFf5fHgX7yZiNH6j8xS+ppAPyOjsJVdCfEt+G8A9HZbiDikzA0EFWy1b
         9QjQeOryZlsinoYT/Lzrq/zV22X7xVnGbmSPu0e0NRdIKF84HKrJ4TLPw1I+GMs8cJSt
         +SHzdhjIkJssF4B+p78j/m/FIVxdAvvZQkYe++7l0fx2ushmlk02mErpbC5HqGGaq6/X
         Lk5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DwWWbTpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n19-20020a374013000000b0071ba5585985si1450059qka.571.2023.02.23.08.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:20:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DwWWbTpY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEKQ-0007eP-VV; Thu, 23 Feb 2023 11:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEKP-0007e0-EW
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:20:17 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVEKN-0002Pi-Ot
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:20:17 -0500
Received: by mail-pl1-x62b.google.com with SMTP id s5so13480853plg.0
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0N5/W6qgvMoVVcxzs8tB9yIJh7BwUfPEU4dj5oWBadw=;
 b=DwWWbTpYX1G0SlJMqvby8SNZchNdzF/+9kjp70Ris5tcBl69MWdpoagEDqWVdvcIdf
 qBZIbrBhwoS/6KrD0R2gNKZZ6B0dYoOti62AFY7AWwitvdHd3UO0kxm0BBhgBTyr+CbR
 e6IybjxrNJbP+heBClCupDAqnBHfrrsMC88JJvX7qpkgiHaff5F1czDXLTa5MsY6zzNl
 NeejVoUBVUafDG++8CQZMzruOHqOja85O4cenJlLckGLXn8ru6vmC6DE7AIi1slCNC9B
 kAZxf6XZx7LXtZZTZtkoYZU5nGen9c40hJ+NEjJ4iZJMb18Xs45QbLyWmTP1cdErfkeI
 ykrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0N5/W6qgvMoVVcxzs8tB9yIJh7BwUfPEU4dj5oWBadw=;
 b=rVNv3PnbB1wxXJ5IPz9lQIOAUm0W3W83fHPI3onBGvHXOWGdHbPRdh6Tht+PrFI9w+
 Q4wKVbWp9OLoEr3zPxdlHHP7lC6P/kLnfYfKtsbCzh+H10/sgCsV7PJcc0gpdy7ClOth
 EJ4LxHwEo2aylZorVMMp5xPq+AesJvxJIsaFqQrNvBaoto3AbVrzo/zcFmIwq7xwTuCr
 9OQYNFbsziS6Cn19pbBRNXXhoubwh1UzUMxtYp5HZRBUxEmz0YOD1/9QOTJ7gt1TvFOW
 5V9oRNm3CZA7eu/RvWm8Mlnlos7aJTJqhSAJTcQz0wSSpnGzt0BcLfV8APXg5h8baXa5
 FQuQ==
X-Gm-Message-State: AO0yUKWL7qSZNMHOPncFc0Epcl7oeNMIppYNRTIanE1kwk9Ptlv3HrFU
 pzZNU38O7xErztbhrq1l9ftGig==
X-Received: by 2002:a17:902:f644:b0:19a:b588:6fe2 with SMTP id
 m4-20020a170902f64400b0019ab5886fe2mr12599955plg.13.1677169213693; 
 Thu, 23 Feb 2023 08:20:13 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a7-20020a170902b58700b0019abd4ddbf2sm5381629pls.179.2023.02.23.08.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 08:20:13 -0800 (PST)
Message-ID: <d08b115f-ecf3-c71f-ab10-d7b221a262e2@linaro.org>
Date: Thu, 23 Feb 2023 06:20:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 04/19] target/arm: Use tcg_gen_qemu_st_i128 for STZG,
 STZ2G
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-5-richard.henderson@linaro.org>
 <CAFEAcA9RGYhU3wryevfPQcn1xKSQk6MVaCgfhGpPUXq=L5=_LA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9RGYhU3wryevfPQcn1xKSQk6MVaCgfhGpPUXq=L5=_LA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: L+HBW8BePOJY

On 2/23/23 05:24, Peter Maydell wrote:
> On Thu, 16 Feb 2023 at 03:10, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This fixes a bug in that these two insns should have been using atomic
>> 16-byte stores, since MTE is ARMv8.5 and LSE2 is mandatory from ARMv8.4.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> diff --git a/tests/tcg/aarch64/mte-7.c b/tests/tcg/aarch64/mte-7.c
>> index a981de62d4..04974f9ebb 100644
>> --- a/tests/tcg/aarch64/mte-7.c
>> +++ b/tests/tcg/aarch64/mte-7.c
>> @@ -19,8 +19,7 @@ int main(int ac, char **av)
>>       p = (void *)((unsigned long)p | (1ul << 56));
>>
>>       /* Store tag in sequential granules. */
>> -    asm("stg %0, [%0]" : : "r"(p + 0x0ff0));
>> -    asm("stg %0, [%0]" : : "r"(p + 0x1000));
>> +    asm("stz2g %0, [%0]" : : "r"(p + 0x0ff0));
> 
> Why did we need to change the test program ?

It gives us a test of the stz2g insn.  We still have other instances of stg in the testsuite.


r~

