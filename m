Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9373380wrv;
        Fri, 9 Aug 2019 08:58:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqza/6XwsOg6kOry9+0meRWsbuA8AVxZgPnJKsSKVk0tNr0i2HKwO/wmsb2KJ4atppxlskHc
X-Received: by 2002:a37:5445:: with SMTP id i66mr19578357qkb.369.1565366280451;
        Fri, 09 Aug 2019 08:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565366280; cv=none;
        d=google.com; s=arc-20160816;
        b=BMJnUP2sQxpeccupW4dgJYkfHYyvGEasLmuNmUuBzutrzieFcL5oyE4h7JDZ4VGrVj
         RGI+WsNfvFeshT+jZk/LP/4Bro4p29jtWmoERD56+x1vyps8WI7Rq0pTwCiZ1HKZ/ESr
         7KJ8P+7Yw6WNAgOpYfON/sQdQI04n7JgEqvnGl0AJwMJE5FwfpWIHV8MmlE3FkSGcpcS
         BYW5aJSW96MDxTmCYcq5yynqRCKrUhbsMTKhliIwxj1ba0ThonqMAzJfDSm8s3QskAyh
         uu5Qvq4bbc86ztyJXVM6inFw6FcrdiUKSv9GJsdbv8uqyzXXjUwIff8c2Zi6BQvVuG+N
         Sj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=KvAh0kj7MJYjB42/ASlKSiUOycmdDr5QG3FtOZH9hMQ=;
        b=Y9gfWJMNjGbA5DggC24jAPQmqjahlgOHg8jeGoCqODQVwtK5tL2ehM2uXB4KOBGBgb
         ss/RihITY8dzTfVJkezBR2z/55Zy5AqahZm5o5uIxiq6+9OB0owYhpOc5PuQqUhBfRUx
         cYBm66oQytsBPndlpzS3gwNq9j6tyQ/oDXjfsOIYEkH3LLUuMDMhOfggmLMuoy/kCb9m
         ZJSMsgOurVTsQFQiltH79lxvvf6/8nnJMMLdgPek4XphrQZlDpDcizSdZik7BZIEu9h6
         AbaFzRtWDEvSYM2HGhSrcSeSw7zKCyMTdRUGjyMYNww/2f6TNp04a2irKh78BpsA8nsK
         n1tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lp5zxZLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m30si891779qtc.307.2019.08.09.08.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 08:58:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Lp5zxZLi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw7HE-0008FK-0x
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 11:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53497)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hw7H7-0008Ct-N3
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hw7H6-0001Qg-N8
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:57:53 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:34201)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hw7H6-0001OT-FL
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 11:57:52 -0400
Received: by mail-pg1-x541.google.com with SMTP id n9so39848220pgc.1
 for <qemu-arm@nongnu.org>; Fri, 09 Aug 2019 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KvAh0kj7MJYjB42/ASlKSiUOycmdDr5QG3FtOZH9hMQ=;
 b=Lp5zxZLi/lClKwWSiaorzYrdEOyt4ksDRCzqeNRYaTv3NC2L8aSsd8a1r+dIRKGdbO
 kdB6yj9DkMU09auxqM6P9opMzpDYvvDeD5U/WDQHDnOiiQVQgYqcBUAfDdEx0frYGBNw
 0JzIZfDTrkMrx0OYXvCYwJMC56i08s2JAc8Qm5XvLO1efZNx6hUMBbE0NK5bvDicSxUz
 FWF62NNyPKmxH4Ie4DbAnBUgqHaej2nYBAfQ7g9SdyaEL/fwBZTMqFfCVEz/NdashtBW
 zNpioDtrgr4c87R5WbarjVrww0Y3jsFg91Smqm+THT7olDQnaJSRQU7qjQYFNTL08k1D
 5nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KvAh0kj7MJYjB42/ASlKSiUOycmdDr5QG3FtOZH9hMQ=;
 b=EIq+x3i95f2ppp9Zhx9smNXgpYY4bYjA4VGJz2/PWGxttYHNOnLL9zyVuArphW3Ghx
 aRvGthRwqRuWWoFhyvpkt2pK3aNrULolDI2tLGajuAd+ARqx3fhQvSjGwel/uepucl/n
 Doq1oe5NTHE6ULkqZZxwOG70b8b839qscttO2uvY9UiovUHxxmaFCUAUimZZvKhGMNpG
 /obelTbvLffFHFClln24uSL3mmmkgJuXGeptXe5vk7e5vf3sYsqXoco9PvIKbvRLQhVN
 mHUqfVqU7gF7rjaRJDwPNNwAE9kyJNw0Q1X/6zlYOE5U8aQinCWHK1mtKRcGXnOY5BXB
 aoVg==
X-Gm-Message-State: APjAAAWDNHQutCcCEex181JQpTOjfUV29g4MvOzy9UNBiBKQ5J/Qpej9
 8RccyEJdDGEfK9b5j0Hr0RMtgA==
X-Received: by 2002:a17:90a:c58e:: with SMTP id
 l14mr10075608pjt.104.1565366270313; 
 Fri, 09 Aug 2019 08:57:50 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id i17sm2930603pfo.28.2019.08.09.08.57.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 08:57:49 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190809154153.31763-1-richard.henderson@linaro.org>
 <20190809154153.31763-2-richard.henderson@linaro.org>
 <CAFEAcA_4jCdh94MUbmA9wAxQ7UajC_8TxEeD0tLpZRfn7jMiiw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <935866af-9a2f-1d35-c583-6f26ee00087a@linaro.org>
Date: Fri, 9 Aug 2019 08:57:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_4jCdh94MUbmA9wAxQ7UajC_8TxEeD0tLpZRfn7jMiiw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [PATCH 1/3] decodetree: Allow !function with no
 input bits
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4s0yRgnMkUyw

On 8/9/19 8:52 AM, Peter Maydell wrote:
>> @@ -195,7 +195,10 @@ class MultiField:
>>      """Class representing a compound instruction field"""
>>      def __init__(self, subs, mask):
>>          self.subs = subs
>> -        self.sign = subs[0].sign
>> +        if len(subs):
>> +            self.sign = subs[0].sign
>> +        else:
>> +            self.sign = 0
>>          self.mask = mask
>>
>>      def __str__(self):
> Is this change to MultiField left over from the previous
> implementation ? I was expecting a zero-length MultiField
> to now be a bug in this python script (ie we should never
> try to create one).
> 

Oops, yes.

The error is emitted here:

> +    if len(subs) == 0:
> +        if func:
> +            f = ParameterField(func)
> +        else:
> +            error(lineno, 'field with no value')

and tested:

> +++ b/tests/decode/err_field6.decode
> @@ -0,0 +1,5 @@
> +# This work is licensed under the terms of the GNU LGPL, version 2 or later.
> +# See the COPYING.LIB file in the top-level directory.
> +
> +# Diagnose no bits in field
> +%field

