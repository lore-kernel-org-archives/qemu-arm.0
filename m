Received: by 10.223.172.38 with SMTP id v35csp594724wrc;
        Thu, 7 Sep 2017 12:02:32 -0700 (PDT)
X-Received: by 10.98.138.88 with SMTP id y85mr377864pfd.224.1504810952483;
        Thu, 07 Sep 2017 12:02:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504810952; cv=none;
        d=google.com; s=arc-20160816;
        b=iz5PyeaW2UvTrWeYpA3I7bE5mco8+YOdbGPyCwhSS5j0I3SQm2S1PNNp1TgENlY8I8
         7ObD22b+YvUWmQNfvFFTfZMkRRtFYBBAPYmnzp0krvRKtBu2zy2Hvv4OMuqOebg6SEKq
         QOTSimvWWJryq4gnBtpUqjnKzaC0V73MZ9mLslFX0pK5bVfsb7jUca77RxGcd0CLovIc
         ZRQSWWAuBL3Wg2TJqNV9Kzck2rE9287aIpgsfIs8RH2rPVJi8OI4LaeoPP3mHvx83E1m
         wF3H+5vELYRXgr4ChAfH447WO4Dm0DVGaGQd5828EJc89UWCJZfHsq5PNWRp1MsxVyp7
         /dXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=808xraoG/OUSXO8o07sI2OIk69MRKaBMTKSc7TXCHfM=;
        b=OLeC5JmXcB1lBbMMNNo82zUoFn4g+ch9s45jIe8L2A5Z28XKsOR8wd6BYUu7VKiThZ
         i4xLf0c8KNpNIRWddHs27N4NcXyxw+oCtvmdTTw4eMhCuDbmUvpWE8hTrbHUzbf05Csn
         C+9Hni3VwZXh3bGMH9NbfUP2o1aJFwSjzOs72Hn6olAXuV5Zabcn76OX7sz4bcQcevz4
         /Oy6xTyhT6UhShEUEp7wEbZ656I9VHoSY6ZFSAq4SHg+OiYn2zaWk8EupMfo+EhAspvt
         fQOzOE45y7zXpn+nHODfDv+xLICUDk6BnvIiI9CyTNUct25Iov0bDxF/vRhMa+fqb2HB
         X2ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PrZgfGMz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 23sor195926pge.306.2017.09.07.12.02.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 07 Sep 2017 12:02:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PrZgfGMz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=808xraoG/OUSXO8o07sI2OIk69MRKaBMTKSc7TXCHfM=;
        b=PrZgfGMz0mXpb0DjJQ/oE91LkW1h5Mnd8AcSn8vnufxXyIPNR3awhPYqplWnLauBEL
         LosS09Newti2bvHAbhjTINQDE86nGczQZ4WsI/go9mmrJx1xyVWZdR7MT2YDe85Twjhq
         nbo78ZFWqc0f+zYH8Zz5c39i+a0niF2aeP20U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=808xraoG/OUSXO8o07sI2OIk69MRKaBMTKSc7TXCHfM=;
        b=kTnT7rbucmhDid2VNatFxBEOLv7rmIN/vmc8KZc5g2YUQLRKLmGfWeZeyVAWNl4k4E
         YJGesgulU9i7HgEoYq4DCf9W/+HUjTsfkG9iJ5JqMDFMZOmVGXsfzF3nbNFATq4lAhxs
         WE9ikA8UpyB7+kxnqz6Et65BirnEhbfFaDdj0yZLcQAKFEaZGHADMKon97u4K00IBHzX
         PdjPwPiHXHaQgT9Fbf3u++1AjvoAQy8cMm2pZhjK1lUwBCbyHefrM9JZBr9jwWf0pMbh
         z8J+y8f74PL1vXYnVJ1LhRUz2w0xNH4tLAwS5NVgox+ieRG6yAiHuXjoPXxkZVfcQlOV
         wMuQ==
X-Gm-Message-State: AHPjjUjKm9lOu0ZEgAWQdvJ8Ai8PJ1pepc25tH/wikIRJmrfz6rkDysw
	eyp1s4hsJivzaaDpBtsttgvI
X-Google-Smtp-Source: ADKCNb7IDUsckIBljpV6gpvQ5CGZ2MRUVODGHnXoHgH+fzK7NxpUJhPkxKMZMbIo9tTMkLPVdF3KVA==
X-Received: by 10.99.117.81 with SMTP id f17mr377613pgn.314.1504810951994;
        Thu, 07 Sep 2017 12:02:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net (97-126-108-236.tukw.qwest.net. [97.126.108.236])
        by smtp.gmail.com with ESMTPSA id 5sm443228pfr.151.2017.09.07.12.02.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Sep 2017 12:02:31 -0700 (PDT)
Subject: Re: [PATCH 4/8] tcg: Add operations for host vectors
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-5-richard.henderson@linaro.org>
 <874lsemj0d.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f18d9635-1ae5-08f0-3856-c2d445e62b99@linaro.org>
Date: Thu, 7 Sep 2017 12:02:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <874lsemj0d.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RURm1i0UhI0q

On 09/07/2017 12:00 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Nothing uses or implements them yet.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  tcg/tcg-opc.h | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>>  tcg/tcg.h     | 24 ++++++++++++++++
>>  2 files changed, 113 insertions(+)
>>
>> diff --git a/tcg/tcg-opc.h b/tcg/tcg-opc.h
>> index 956fb1e9f3..9162125fac 100644
>> --- a/tcg/tcg-opc.h
>> +++ b/tcg/tcg-opc.h
>> @@ -206,6 +206,95 @@ DEF(qemu_st_i64, 0, TLADDR_ARGS + DATA64_ARGS, 1,
>>
>>  #undef TLADDR_ARGS
>>  #undef DATA64_ARGS
>> +
>> +/* Host integer vector operations.  */
>> +/* These opcodes are required whenever the base vector size is enabled.  */
>> +
>> +DEF(mov_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(mov_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(mov_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_v256))
>> +
>> +DEF(movi_v64, 1, 0, 1, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(movi_v128, 1, 0, 1, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(movi_v256, 1, 0, 1, IMPL(TCG_TARGET_HAS_v256))
>> +
>> +DEF(ld_v64, 1, 1, 1, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(ld_v128, 1, 1, 1, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(ld_v256, 1, 1, 1, IMPL(TCG_TARGET_HAS_v256))
>> +
>> +DEF(st_v64, 0, 2, 1, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(st_v128, 0, 2, 1, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(st_v256, 0, 2, 1, IMPL(TCG_TARGET_HAS_v256))
>> +
>> +DEF(and_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(and_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(and_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +
>> +DEF(or_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(or_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(or_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +
>> +DEF(xor_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(xor_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(xor_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +
>> +DEF(add8_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(add16_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(add32_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>> +
>> +DEF(add8_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(add16_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(add32_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(add64_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +
>> +DEF(add8_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +DEF(add16_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +DEF(add32_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +DEF(add64_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +
>> +DEF(sub8_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(sub16_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>> +DEF(sub32_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_v64))
>> +
>> +DEF(sub8_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(sub16_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(sub32_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +DEF(sub64_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_v128))
>> +
>> +DEF(sub8_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +DEF(sub16_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +DEF(sub32_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +DEF(sub64_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_v256))
>> +
>> +/* These opcodes are optional.
>> +   All element counts must be supported if any are.  */
>> +
>> +DEF(not_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v64))
>> +DEF(not_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v128))
>> +DEF(not_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_not_v256))
>> +
>> +DEF(andc_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v64))
>> +DEF(andc_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v128))
>> +DEF(andc_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_andc_v256))
>> +
>> +DEF(orc_v64, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v64))
>> +DEF(orc_v128, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v128))
>> +DEF(orc_v256, 1, 2, 0, IMPL(TCG_TARGET_HAS_orc_v256))
>> +
>> +DEF(neg8_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
>> +DEF(neg16_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
>> +DEF(neg32_v64, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v64))
>> +
>> +DEF(neg8_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
>> +DEF(neg16_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
>> +DEF(neg32_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
>> +DEF(neg64_v128, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v128))
>> +
>> +DEF(neg8_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
>> +DEF(neg16_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
>> +DEF(neg32_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
>> +DEF(neg64_v256, 1, 1, 0, IMPL(TCG_TARGET_HAS_neg_v256))
>> +
>>  #undef IMPL
>>  #undef IMPL64
>>  #undef DEF
>> diff --git a/tcg/tcg.h b/tcg/tcg.h
>> index 1277caed3d..b9e15da13b 100644
>> --- a/tcg/tcg.h
>> +++ b/tcg/tcg.h
>> @@ -166,6 +166,30 @@ typedef uint64_t TCGRegSet;
>>  #define TCG_TARGET_HAS_rem_i64          0
>>  #endif
>>
>> +#ifndef TCG_TARGET_HAS_v64
>> +#define TCG_TARGET_HAS_v64              0
>> +#define TCG_TARGET_HAS_andc_v64         0
>> +#define TCG_TARGET_HAS_orc_v64          0
>> +#define TCG_TARGET_HAS_not_v64          0
>> +#define TCG_TARGET_HAS_neg_v64          0
>> +#endif
>> +
>> +#ifndef TCG_TARGET_HAS_v128
>> +#define TCG_TARGET_HAS_v128             0
>> +#define TCG_TARGET_HAS_andc_v128        0
>> +#define TCG_TARGET_HAS_orc_v128         0
>> +#define TCG_TARGET_HAS_not_v128         0
>> +#define TCG_TARGET_HAS_neg_v128         0
>> +#endif
>> +
>> +#ifndef TCG_TARGET_HAS_v256
>> +#define TCG_TARGET_HAS_v256             0
>> +#define TCG_TARGET_HAS_andc_v256        0
>> +#define TCG_TARGET_HAS_orc_v256         0
>> +#define TCG_TARGET_HAS_not_v256         0
>> +#define TCG_TARGET_HAS_neg_v256         0
>> +#endif
> 
> Is it possible to use the DEF expanders to avoid manually defining all
> the TCG_TARGET_HAS_op for each vector size?

No.  The preprocessor doesn't work that way.


r~
