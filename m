Received: by 10.28.71.27 with SMTP id u27csp2333562wma;
        Thu, 22 Feb 2018 11:29:08 -0800 (PST)
X-Google-Smtp-Source: AH8x227Qm9SjBlcBBKucQdH6G+qbHZlGmpxEzaAy3j2tMdCWpl/JzIIt6VG5vILVWNSAxIgSUVI7
X-Received: by 10.129.228.4 with SMTP id r4mr5806659ywl.301.1519327748199;
        Thu, 22 Feb 2018 11:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519327748; cv=none;
        d=google.com; s=arc-20160816;
        b=UH+5RUjoRV7PSyCKrqakf5n+W14xLnSk3xmnmj8yw3LBX0DO0+MdflRjVwBsYYDSpA
         nw96I8eqUAQBu6tcpN13anRuYEHUOlhTzgRYBmjHP5bgMt1ubwq74aeHm4kXjkGyNA0/
         RMddrp1OFeQ+Gx89JvxOT103djJcP5SWvr2iBfXWA00O4YMifOJkbHl9MkJ8DMOaFfeL
         Jw+rz0Bm4cV1ufC0OgQ+XeiTwrLRTgdQS9E2E4uRe19l4AydQ+63Hh+xKkYUpMxAonLd
         Nd70LzSzuTJoAxgV2N6Pdzvw8sNeMZjXTI5ron2Eupa/DpQ11rTWlO7Lo9/WR5szLb5m
         x8gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=D9S+TH31TBN4h5cIHHcOy2xYBi75HxftdrT0ahPbePw=;
        b=tiKqHckr90pLvpFk0LHOvSTDDFH6JmHTju3BnyiwPj0hjGVYQKu21F4o5Jd52hgorv
         t0WVlcdMp9JE+cVcffiQhowkI7jAqmTqblriVl+AAWVJ20vKu1H3wKNHRgSVjKe9eNDV
         u/RKrRGTCDZ9bsEQQowfex76yrYPBbGDBATbhqCDGI/gDLa7PkXAoi9270lP/MZOInSu
         X3sEJCTkagDnE+LwS7LXq1T57OsFLbtjlvAfgAkd1JWrMRzMMZnBCATGbSm0CRWIPd9i
         YsT1cCqrTdcyrS+FHgsKPPQ9ax/A9E5nxJIn7eI5mMPzVtcLv4mvMM1RMU0zMbCZqVAj
         qUIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rjc7Ghnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 73-v6si123117ybe.47.2018.02.22.11.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 11:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Rjc7Ghnl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eowYF-0005LO-La
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 14:29:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eowY6-0005J0-2E
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:28:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eowY5-0008Fm-6I
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:28:58 -0500
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:39056)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eowY5-0008FL-1A
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 14:28:57 -0500
Received: by mail-pl0-x243.google.com with SMTP id s13so3439896plq.6
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 11:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=D9S+TH31TBN4h5cIHHcOy2xYBi75HxftdrT0ahPbePw=;
	b=Rjc7GhnllRL6i3wzj5wH6rrUxuFNPt67D2v1Z+bp6fimICQ84BS3WuaObJko4Ja7bZ
	flEbe2mZXiRGNci1hkKHf04Sw0loApwMupOJkRMTnAtxjWg7d5mGYYm9gq1fXrLjHZuR
	pbbZqI5VthwofqhhnLlK79iaBC6gOx7BtNi+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=D9S+TH31TBN4h5cIHHcOy2xYBi75HxftdrT0ahPbePw=;
	b=CnFozsxC2rEKUnVYFLbOGdj6GlPDRIuIOggQexRTxb1iFC/k1fX94p82VuEG5dsDgN
	R4T3gE7x1q8sspKtlLGiwyQo+Ov+I+1xPwh8ukC/R70K6kkiMFoZJCU+z4nWoJ6n8J8t
	q8lNUd0nyreBt8HCSViWqlvAvh6nGVBvF2re4aSKxk6K7ON8tXd7qQcFkkuhHQlExphn
	Setfj5uJ76jegDHbTvT1D39RAB3TyMwSc0vjpLIfxNUdFpkxmHQ3d5Ul/a2AM4U6BvVF
	cvzvRMhBYroIkBYMzdj/2wOaDxO+PMKXV9wFVB4mgxeFJAqRu69Akied820BO0+SNiGp
	c5sA==
X-Gm-Message-State: APf1xPDGsJJlKGxel8ZQi7zyDBE2nHzR7E7GZyx7uFpPt+0PQRF1oCN9
	B/QlAX1RKXmaEbwb+/Vbli0s6DXcLJc=
X-Received: by 2002:a17:902:4545:: with SMTP id
	m63-v6mr7394096pld.15.1519327735645; 
	Thu, 22 Feb 2018 11:28:55 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	q65sm1418203pfd.140.2018.02.22.11.28.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Feb 2018 11:28:54 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-5-richard.henderson@linaro.org>
	<CAFEAcA9Xy8z85KRuVUFLJtEwpUgu+cHGYe_A6ymxurWZL-N+RQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <374e47e7-4d6d-0c77-0cbd-b2b665b41157@linaro.org>
Date: Thu, 22 Feb 2018 11:28:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Xy8z85KRuVUFLJtEwpUgu+cHGYe_A6ymxurWZL-N+RQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-arm] [PATCH v2 04/67] target/arm: Implement SVE Bitwise
 Logical - Unpredicated Group
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
X-TUID: xaXPfbYjkayw

On 02/22/2018 10:04 AM, Peter Maydell wrote:
> On 17 February 2018 at 18:22, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> These were the instructions that were stubbed out when
>> introducing the decode skeleton.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate-sve.c | 50 +++++++++++++++++++++++++++++++++++++++-------
>>  1 file changed, 43 insertions(+), 7 deletions(-)
>>
>> diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
>> index 2c9e4733cb..50cf2a1fdd 100644
>> --- a/target/arm/translate-sve.c
>> +++ b/target/arm/translate-sve.c
>> @@ -32,6 +32,10 @@
>>  #include "trace-tcg.h"
>>  #include "translate-a64.h"
>>
>> +typedef void GVecGen2Fn(unsigned, uint32_t, uint32_t, uint32_t, uint32_t);
>> +typedef void GVecGen3Fn(unsigned, uint32_t, uint32_t,
>> +                        uint32_t, uint32_t, uint32_t);
> 
> I see we already have these in translate-a64.c -- put them in
> translate-a64.h ?

Good plan, thanks.


r~
