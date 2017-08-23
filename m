Received: by 10.223.188.70 with SMTP id a6csp1092352wrh;
        Wed, 23 Aug 2017 12:02:54 -0700 (PDT)
X-Received: by 10.98.10.206 with SMTP id 75mr3781097pfk.132.1503514974203;
        Wed, 23 Aug 2017 12:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503514974; cv=none;
        d=google.com; s=arc-20160816;
        b=Vd02wAKxHaRZd7dKiBLUH5dNC7A25w+LRlUi7nVHJZWhDCmhd3KhwHgy80pcAowsD0
         DUJ12GE/kBQ5+Bbg0KFZKU7U24RlJZ3KEwHzdxUM6JI8gg/9e5GYUPBOu5eqqCctBoCG
         i8ET5NOOAXOIGcrmCOOdzqeCVV29pjP9iBrZW+tQQGjoYgz/ddMzzvVdZNfPXdvbt5+K
         YGlVeFET9b7D2ONDzGgl1ckMXcOVhpq3xQO7HThoBJEnuEGAZNY6gqSQ4ukzUYykAKUS
         wPO9cBP2Chy0zy2a+2N50obrBSxOtgxoIfgL8/xkDvtW2Unu62pi84tOtfk+dl3Vubzb
         6Eww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=AaZnFRLqz8QV8y0l804ii/Feh4zZXvTLHkEjsBf7vKM=;
        b=omXj9q9fRZoOWjLGX/sQQRXwOfSOpTemNwt7Rd6lqv/FKvKde/q45uCyjeZV/EWK75
         C0xT9IYrwSp3McHOLkeBBG4gjtvf8a3jyBBGf08LZ9jnXCKzvFit2iBcJdd9M0oMOARQ
         +g5q9atbU1g2uUTSDIjmM4eZY1vRaPnq0tjUk8v7J4BD687Bz48dGX1OocR9pBO3oSCS
         fKwD+Q8UgnnHLDgZlx6lGwQW8mJJVrsf+cya6o8n7HsAFo9Rp8b+54S+oNI+0GJUF2ZV
         K/5msMMpxGuLubkwKBkuvV+rEEZp6DXM93lLm8PY0yWy4LgmmgtRnok6eETp+G9EZkTk
         LGTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Is7j7TCW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22b as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-pg0-x22b.google.com (mail-pg0-x22b.google.com. [2607:f8b0:400e:c05::22b])
        by mx.google.com with ESMTPS id d12si1470369pgu.120.2017.08.23.12.02.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Aug 2017 12:02:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22b as permitted sender) client-ip=2607:f8b0:400e:c05::22b;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Is7j7TCW;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 2607:f8b0:400e:c05::22b as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-pg0-x22b.google.com with SMTP id 83so3733921pgb.3
        for <alex.bennee@linaro.org>; Wed, 23 Aug 2017 12:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AaZnFRLqz8QV8y0l804ii/Feh4zZXvTLHkEjsBf7vKM=;
        b=Is7j7TCWyPhjcQulPwL/wh7nYIVR9snS9oM6A96wqH3EmFGCikmTN9FNTnU5ZScbMw
         yTuz3BVeSyhynmhdmql85rCeAb1qPeTpXCjoWS4Mh2hI2Rob7GkR2pe/9W2H4qxlCPp6
         W2CXH+1XHsUBZuf3l7wdPByPXP+P+8hNBMBRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AaZnFRLqz8QV8y0l804ii/Feh4zZXvTLHkEjsBf7vKM=;
        b=n/umU+Lk9xZGKoglFOY8DPgokgfbiWxo+UWMSuW4TXuXRh0B5cnkw1pJnLiGE/1ElV
         qD3NG+6E81PP2ViOHMKso/gF/DU4w8di/DKA7ApIRG/GatvUuLzjx8Fdi2PpyNHYEqLA
         MMB/qATvcwve55bxjgCLClcgX9roa50pzgleAt0OVnFTP701lUioVT6AbfmbuMQ33ztg
         JtKJ3bziQSXeS3mYZTpBQxkqpg8vdCwWJLzjOBMXQW15S7UcSCSwJpWQ+ki7ZNe58Rte
         Vp5Mr3ugmCfuycpocWg487FIvk2OUhycDEBl1Ur/FSUpp4xXDoN2k83GsL0Dsy2rsdVR
         5Deg==
X-Gm-Message-State: AHYfb5hjt/isTF3kHBV27GNm+u/yWBr3YHN8748vl6kwKz0i0wn/Wokb
	d3gtK9Wz7wVBwiGUq0A=
X-Received: by 10.84.218.68 with SMTP id f4mr4062933plm.214.1503514973682;
        Wed, 23 Aug 2017 12:02:53 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from bigtime.twiddle.net ([172.92.59.166])
        by smtp.gmail.com with ESMTPSA id o4sm3763408pga.47.2017.08.23.12.02.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Aug 2017 12:02:52 -0700 (PDT)
Subject: Re: [PATCH 8/8] tcg/i386: Add vector operations
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20170817230114.3655-1-richard.henderson@linaro.org>
 <20170817230114.3655-9-richard.henderson@linaro.org>
 <87valf4ub7.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <afa5cbde-a5e9-0ae3-5532-2073c3a90a57@linaro.org>
Date: Wed, 23 Aug 2017 12:02:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87valf4ub7.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 5esIW+VVAqjJ

On 08/22/2017 06:15 AM, Alex Bennée wrote:
>> +#ifndef have_avx2
>> +        /* There are a number of things we must check before we can be
>> +           sure of not hitting invalid opcode.  */
>> +        if (c & bit_OSXSAVE) {
>> +            unsigned xcrl, xcrh;
>> +            asm ("xgetbv" : "=a" (xcrl), "=d" (xcrh) : "c" (0));
>> +            if (xcrl & 6 == 6) {
> 
> My picky compiler complains:
> 
> /home/alex/lsrc/qemu/qemu.git/tcg/i386/tcg-target.inc.c: In function ‘tcg_target_init’:
> /home/alex/lsrc/qemu/qemu.git/tcg/i386/tcg-target.inc.c:3053:22: error: suggest parentheses around comparison in operand of ‘&’ [-Werror=parentheses]
>              if (xcrl & 6 == 6) {


Bah.  I forgot that my default build uses -march=native, and my laptop has
AVX2, so this bit wouldn't have been compile tested at all.

Fixed on the branch.


r~
