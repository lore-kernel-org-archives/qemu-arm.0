Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1239766lff;
        Wed, 8 Jan 2020 12:56:16 -0800 (PST)
X-Received: by 2002:a17:902:7e4d:: with SMTP id a13mr7596121pln.281.1578516976263;
        Wed, 08 Jan 2020 12:56:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578516976; cv=none;
        d=google.com; s=arc-20160816;
        b=e4855ycxrCkpELJ1d6whX5Emq3i9rOfPXXT6yVJ2O1ulXDAyFEbKaxSVRB34nl8onl
         Cs2d/5HXszrz+EQ89WlKOq+wOwqtK82JA9tkna0A/pSebVFP0C17+kpnUB6Wacq1aWdn
         VQhbndWJZlwo8CMdYPaRnDdKbxsq5wwVz/aM7Z0dXrCZ6cTZ42BluOTs7IylkCsgnOjt
         r43eZ/rRcZ/+tKyYr3DD06MMNplHhLZuLR/Uf9LhwiJI/ednuKs4IN4Srvjrymp9CyLI
         Dxn5qGDP/jQgrddymeh/rqgePgnb6uemd6qnffr91BmnrcBke5z4+NXd9oTPnjQnjxGC
         swPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=6hfQ6QjSecE60n39hqzELtrIPfsof/FMBjfNf6LJx/Y=;
        b=g8Na3hwKfiiI3HgMKHJTMw7k3jsS4GKUjtcNdsNGbmm5j2SnhvFCISzSPVBxjiC3LN
         JKBfwS1AN4m3EsNkaUczc4DwXhyTQ+wEAnyaKnQQcgG8lGFInVFRoQTXp/gKzV13rY/F
         BbDXCe9flKoRAthc6kCH1X/rUcR5W+tOt3eb0xo+4hskj9EzWw0dfGHTG/xTPveDZbgy
         ZeReGi+brlWrtgHX8Wp740HaoauADskuGmEk5CYHig3ZeU2NmJ1xq3pR8tD8te8ibdaV
         UPV/4K8qIZnXPH8tCAS7nFpqd6GQLWbaUa/wEJiG6+sAIBW3adVwojNjNDEZd7k9rvqj
         y24w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RtVp6JXC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h3sor367783pjq.15.2020.01.08.12.56.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 08 Jan 2020 12:56:16 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RtVp6JXC;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6hfQ6QjSecE60n39hqzELtrIPfsof/FMBjfNf6LJx/Y=;
        b=RtVp6JXCKgXUnSH48Y6CStQFWfjL5CTsvKce4nUyHXMlHbw2WybNvnHnZbxAE/KrA8
         eUcCWR8ur+weyLNLpDetbQgJBmtc0Gk6aBOqzC3bsLc1INYdve5WcAHTYLws1FRbJ9Af
         FwNdjNcqhjOoHsR3gdTpdTDKb7oAkFNLTdJzWyQH4V+HD0IHi/UyP86wN1y3H2zDqkaW
         vm8SMjslaS+y7DJKiwKoSEJzsP3+F9UDovuQeRNYlpeDTkj1Y7HO+sSbU/PMyLxz0Ktt
         clQHDKeRQOsAaf0vlkbeuVe88JWSPmmm2Eswy0KPd7V5GDbZ7FhtpNllIPTi82W+Zanx
         a0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6hfQ6QjSecE60n39hqzELtrIPfsof/FMBjfNf6LJx/Y=;
        b=g62EkuuKE56Lf6TMaLH7ZUvZaXmMcOQqO+dNwaEzEMLScVBlACSxKUSEGsgpKaPEVQ
         zNlvAKKrUgKqA7ZS4jrdOan74RC7uQ/6z1/XetjXMtAOm99GAgd1MdSsyJP05nS/EGRF
         7NdOZnmtwZhRY7nbqNm+p00KtDSgWdkqQuoAaWOBZPRLKKMzQIILxA85f/XMNZCHbfrE
         vySkH/fmUVghxeYHWCnzRIypduLPkczeFDdjmtfYghr5actfdnYqiUMC/g02xbWOEvN4
         YnqWNBeQHPlKV7j4upKylDh4LRXcLXn42igohCM7BEQhNACdVmSU42zDYsX+PL9zTDFP
         3mKg==
X-Gm-Message-State: APjAAAV14Ti2hLUwaQQS6z7AB5QZyzoyHugeOUQtUwPBIq4CvNIjZJwS
	AxpHvlIvRtpw9L2E4+rKTKVysvVXwvJhzYdp
X-Google-Smtp-Source: APXvYqzmhb1PH6IuKw7NwlzbcOPM3EXIWfJ1044jxyUv2fRt+8hfDWkpmEpLHcaeGvACQMAhI0hoyQ==
X-Received: by 2002:a17:90a:fb87:: with SMTP id cp7mr668601pjb.56.1578516975796;
        Wed, 08 Jan 2020 12:56:15 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.12] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id d14sm180028pjz.12.2020.01.08.12.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 12:56:15 -0800 (PST)
Subject: Re: [PATCH v3 6/6] tests/tcg: add user version of dumb-as-bricks
 semiconsole test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, keithp@keithp.com,
 qemu-arm@nongnu.org
References: <20200108150252.6216-1-alex.bennee@linaro.org>
 <20200108150252.6216-7-alex.bennee@linaro.org> <87a76xk9ip.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c53d17c-d8a6-b356-e481-b34e4fbbcae8@linaro.org>
Date: Thu, 9 Jan 2020 07:56:10 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87a76xk9ip.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: YadISGy7XSRx

On 1/9/20 6:55 AM, Alex Bennée wrote:
> 
> Alex Bennée <alex.bennee@linaro.org> writes:
> 
>> There are linux-user users of semihosting so we'd better check things
>> work for them as well.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> ---
>> v3
>>   - include aarch64 version
>> v4
>>   - use common semicall.h, test thumb & arm
>> ---
>>  tests/tcg/arm/semiconsole.c       | 27 +++++++++++++++++++++++++++
>>  tests/tcg/aarch64/Makefile.target |  7 +++++++
>>  tests/tcg/arm/Makefile.target     | 19 +++++++++++++++++++
>>  3 files changed, 53 insertions(+)
>>  create mode 100644 tests/tcg/arm/semiconsole.c
>>
>> diff --git a/tests/tcg/arm/semiconsole.c b/tests/tcg/arm/semiconsole.c
>> new file mode 100644
>> index 00000000000..6ef0bd24500
>> --- /dev/null
>> +++ b/tests/tcg/arm/semiconsole.c
>> @@ -0,0 +1,27 @@
>> +/*
>> + * linux-user semihosting console
>> + *
>> + * Copyright (c) 2019
>> + * Written by Alex Bennée <alex.bennee@linaro.org>
>> + *
>> + * SPDX-License-Identifier: GPL-3.0-or-later
>> + */
>> +
>> +#include <stdio.h>
>> +#include <stdint.h>
>> +#include "semicall.h"
>> +
>> +int main(void)
>> +{
>> +    char c;
>> +
>> +    printf("Semihosting Console Test\n");
>> +    printf("hit X to exit:");
>> +
>> +    do {
>> +        c = __semi_call(SYS_READC, 0);
>> +        printf("got '%c'\n", c);
>> +    } while (c != 'X');
>> +
>> +    return 0;
>> +}
>> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
>> index 96d2321045a..4281c766419 100644
>> --- a/tests/tcg/aarch64/Makefile.target
>> +++ b/tests/tcg/aarch64/Makefile.target
>> @@ -32,4 +32,11 @@ run-plugin-semihosting-with-%:
>>  		 $(call strip-plugin,$<) 2> $<.err, \
>>  		"$< on $(TARGET_NAME) with $*")
>>  
>> +AARCH64_TESTS += semiconsole
>> +run-semiconsole: semiconsole
>> +	$(call skip-test, $<, "MANUAL ONLY")
>> +
>> +run-semiconsole-with-%:
> 
> this should be run-plugin-semiconsole-with-%
> 
> <snip>
>> +run-semiconsole-with-%:
> <snip>
>> +run-semiconsole-arm-with-%:
> 
> ditto for these

With these,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
