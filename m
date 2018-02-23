Received: by 10.28.71.27 with SMTP id u27csp852504wma;
        Fri, 23 Feb 2018 09:29:47 -0800 (PST)
X-Google-Smtp-Source: AG47ELtJzMF3Tw3z+bVUdZOMVsuZu7EYwZm4d251HZcAYZVGnkw4f7d3CL045b9CGQXerc9uTu2b
X-Received: by 2002:a25:f409:: with SMTP id q9-v6mr1657374ybd.95.1519406987461;
        Fri, 23 Feb 2018 09:29:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519406987; cv=none;
        d=google.com; s=arc-20160816;
        b=R7i+EgN5NcEwETO1B4/Nsnqne4qmLc6kzKlwVlwLWGjMjxD32IeUVx4Bf4A++WOM42
         ZlnjcLqYih/MIxMfeI6yJJXfeVodz4qVu6sQZC/uQmF7A+lydwQ9m5HYPwC5VNh/VAMR
         BYOJ9/FNhCH9FUqIm4HDW7GR5hLkMB1dnQ4tKYTl7jfJxuD5D5blZx/cChzEVbjeJc86
         l9bE/mVk2btjlllRrKEa9CIPYZGhWKl3Com4yWaeoVUK+BMkIiRkWlFw/egoYfImfju0
         cDxg0iLJ899R8tnyXgvsgmNp1JQvarO/E3qcfNsbnk0i8FeKhe+SjKzpIdF0xlhJAn/B
         jjaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=96XH7xDqYmlSkio/RX/aZXoyG2YDUHnNn2RVs5Znnc0=;
        b=g+nDVkZ4DZnlzEG3WXFQT/d1wtVrabNzKUWoLe7qhIoJNOoeho1YhTt7h0Y87HHZlN
         Iucox8Bnt35RifURKg3s8QxLuheZcijrF/F6thN9fBqYzEWQyFW5UT82j6crcIdAwS97
         ObKc1YJk1+8LKf/xngqCS24e7ZwXJBRn3/c99YLv77/eABjai4DDjS1WVo7JD3veTFnL
         6rJN0zyP0GTQva+hGyuROMxI8n828/ql7sraQSxwl17ZPYUIHraFwOnFbDNKnC3ivUWm
         vximXZ299ch6yyfJxFsKUSRRF0m/Sd8I6a4EKZ+vxsUTZSWjNX2Cu9RzRP7YQw1Fct/f
         EpTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I8n34q8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l15si480812ywk.47.2018.02.23.09.29.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 09:29:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I8n34q8t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epHAI-00036R-Rm
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 12:29:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epHA7-00034U-1u
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:29:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1epHA2-00006J-Dg
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:29:35 -0500
Received: from mail-pf0-x22e.google.com ([2607:f8b0:400e:c00::22e]:33271)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1epHA2-00005j-7h
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 12:29:30 -0500
Received: by mail-pf0-x22e.google.com with SMTP id q13so3787149pff.0
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 09:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=96XH7xDqYmlSkio/RX/aZXoyG2YDUHnNn2RVs5Znnc0=;
	b=I8n34q8tXGbCEsVzXm6noGz3ix197wNVQDVauXQX70EGNVsuLCEgJoDqc/Z3NglABS
	rsWn0CzGsceZJNJmB3k6OUxMNDslMT+4JdZsVjR1X3MbmfdLUdBIR0KxEXwuOOAfY3v0
	ra+7juMeor4loE08AEM9mxUb7zAISKy7UUo8c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=96XH7xDqYmlSkio/RX/aZXoyG2YDUHnNn2RVs5Znnc0=;
	b=V4JowVrJX55zSDO1Z++wlPtajtginYA0Xfmy2Z5JGCCJaKGaYO+hUhvSJ5Hz6qvUno
	L8Dk0en9HMl4ILvvJNmSibM2lcwwljJnbcO/EK+wdJg+px7Yd2I7FuuxqpCAMDTHQYOu
	WTu2EbmpKW0Z1El3g70LvJkg0SDtcYWbHKAIvrrCyHksWCT6NiFxofeRGRzMGm69xeFP
	gKSqrcmJDUocBLnnmM3vb/yBf8bQXGno3xwdRfCdlUW6QAf4qtKx4txnMr/0TtennBx7
	fnrI/Wik+P8SPhJfAtriEZS8bAPu6KHfKOYB5NkUYjxN580iZKp8KwhSdu4E+qUj+o6j
	hsIw==
X-Gm-Message-State: APf1xPD0X+8OavSn1ycsd7d7guR4LFz9hqhCxzLZ6SAnzszhIq1vnlhV
	M3X6LtmvFxQiSnY9lFsOA0VWWrs4Zbk=
X-Received: by 10.98.74.67 with SMTP id x64mr2476958pfa.135.1519406968830;
	Fri, 23 Feb 2018 09:29:28 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	p123sm5696774pfb.6.2018.02.23.09.29.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Feb 2018 09:29:27 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-22-richard.henderson@linaro.org>
	<CAFEAcA_sKYmMijPzaYaBzuNkJ3po7oMoV+JYwJ9OE9xRsr_Gvw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0d7c838f-822c-8ee5-9097-8ca2e0c9ab49@linaro.org>
Date: Fri, 23 Feb 2018 09:29:25 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_sKYmMijPzaYaBzuNkJ3po7oMoV+JYwJ9OE9xRsr_Gvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22e
Subject: Re: [Qemu-arm] [PATCH v2 21/67] target/arm: Implement SVE
 floating-point exponential accelerator
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3Pc+tUt4L/9z

On 02/23/2018 05:48 AM, Peter Maydell wrote:
>> +void HELPER(sve_fexpa_d)(void *vd, void *vn, uint32_t desc)
>> +{
>> +    static const uint64_t coeff[] = {
>> +        0x0000000000000, 0x02C9A3E778061, 0x059B0D3158574, 0x0874518759BC8,
>> +        0x0B5586CF9890F, 0x0E3EC32D3D1A2, 0x11301D0125B51, 0x1429AAEA92DE0,
>> +        0x172B83C7D517B, 0x1A35BEB6FCB75, 0x1D4873168B9AA, 0x2063B88628CD6,
>> +        0x2387A6E756238, 0x26B4565E27CDD, 0x29E9DF51FDEE1, 0x2D285A6E4030B,
>> +        0x306FE0A31B715, 0x33C08B26416FF, 0x371A7373AA9CB, 0x3A7DB34E59FF7,
>> +        0x3DEA64C123422, 0x4160A21F72E2A, 0x44E086061892D, 0x486A2B5C13CD0,
>> +        0x4BFDAD5362A27, 0x4F9B2769D2CA7, 0x5342B569D4F82, 0x56F4736B527DA,
>> +        0x5AB07DD485429, 0x5E76F15AD2148, 0x6247EB03A5585, 0x6623882552225,
>> +        0x6A09E667F3BCD, 0x6DFB23C651A2F, 0x71F75E8EC5F74, 0x75FEB564267C9,
>> +        0x7A11473EB0187, 0x7E2F336CF4E62, 0x82589994CCE13, 0x868D99B4492ED,
>> +        0x8ACE5422AA0DB, 0x8F1AE99157736, 0x93737B0CDC5E5, 0x97D829FDE4E50,
>> +        0x9C49182A3F090, 0xA0C667B5DE565, 0xA5503B23E255D, 0xA9E6B5579FDBF,
>> +        0xAE89F995AD3AD, 0xB33A2B84F15FB, 0xB7F76F2FB5E47, 0xBCC1E904BC1D2,
>> +        0xC199BDD85529C, 0xC67F12E57D14B, 0xCB720DCEF9069, 0xD072D4A07897C,
>> +        0xD5818DCFBA487, 0xDA9E603DB3285, 0xDFC97337B9B5F, 0xE502EE78B3FF6,
>> +        0xEA4AFA2A490DA, 0xEFA1BEE615A27, 0xF50765B6E4540, 0xFA7C1819E90D8,
> 
> This confused me at first because it looks like these are 64-bit numbers
> but they are only 52 bits. Maybe comment? (or add the leading '000'?)

Interesting... I didn't even notice.  This was pure cut-and-paste from the
pseudocode.  As such, with the comment, I wouldn't modify them.


r~
