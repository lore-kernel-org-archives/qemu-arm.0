Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2528907ejb;
        Wed, 4 Oct 2023 02:41:04 -0700 (PDT)
X-Received: by 2002:adf:f104:0:b0:31f:a717:f1b6 with SMTP id r4-20020adff104000000b0031fa717f1b6mr1338354wro.11.1696412463932;
        Wed, 04 Oct 2023 02:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696412463; cv=none;
        d=google.com; s=arc-20160816;
        b=fKIqxkQQtTixWYBiOAq/pySiOcqf4maruT+/JtS8JzrQMyqOg491Jc2eS/+3BdKkPm
         SzltWcURqT6KbKWO+uFmQ/bTCmIUGEom99uEVEOKJdq2zhssuqmVekqE7RrIHE+PjDhG
         XZMhs/30VvFeTNs26+nos5QKeck+/3bwPVPGnxW0u3NPJ+NlJnMsPLMTgu1ZU70C0+jm
         Lsd021QPjVPryuHf2d+gvNQschxU69knGk0gVqtmLMifgkeR4dPd/phel3mR9S+R9RMn
         GTPgobWZhpBbX+m5B4+wbrgmTOZ4iNXrV4tUim0is5P7h291Nbrugfj4Cwcd4eF5STQY
         bh1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mPyR7fzdvBJO20jq6WndE4wgUv3adp8c62vlDAveGHM=;
        fh=m+6GIPiqUJTObQG9qUmKPWYtwHmtbUa1LZh8QyO5rb0=;
        b=WGSMzXeuyWedYKDf0uH2txX46j2h1VqCWMOHbNtVw3+pmjK006wjOveOyUJwnj1mBG
         sik+Ca8P3ZPW6lfquRdAn53Uo6TRvAfQ92yP2G9kmZRWMQYoBCOmLfzmSOfg1ZwtwC77
         HhKwFC+OPdxbrjnoSytL66n7q1+3NNWwPYwdiwI5i+6kZs28C10aDuSy8fxAk6Xsme+q
         wUs28rWjGKxjDjet53hffyicU8wjrg8uNS/L4UEFCmhqHaMuTz9hmocDVJhOXU6DKwiN
         f8iVLf7vcPmUNB/X6FlGeaBHxcnI6iV4gIrCDxoiPBnfKz85RAjj0cP/ZDmKpTiLzXuk
         mWqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgBO7LZm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id co2-20020a0560000a0200b0032484cd5840sor256067wrb.2.2023.10.04.02.41.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Oct 2023 02:41:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AgBO7LZm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696412463; x=1697017263; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mPyR7fzdvBJO20jq6WndE4wgUv3adp8c62vlDAveGHM=;
        b=AgBO7LZmPF2A5YMeQ7kGl0GghIZIBbJCQT1jOwGvIVAH4rlRkAllrbrwKdEhWzqDo9
         z7PaQs0J9a0R8XnFMVZrJMbsfHknqPxvaxVjudaJ8KR2oFceO1eItd+Y/McqxC6yPKOy
         hz3tX6VZKZxW7CsORcvLHbLMyhLpoSgyqSwvqXFT6X+ONUfd1Pe7kKkMWQzGuGBxoDG4
         MeMb26lsjt6CCfgcocSbACysxRYs5Mk5g2qgglP7lwvLgSTAXl64Cl2mFPEsruRMqbCo
         lsm4ejFGQM2q+coIbyauwlv696ouN99HdvOkR1KaMjOe6b3AnpOzSmwyC4U1wp4dQU5W
         tENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696412463; x=1697017263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mPyR7fzdvBJO20jq6WndE4wgUv3adp8c62vlDAveGHM=;
        b=KZz4XTdqyOBze5+TXN8Nn364TioM6nLsPZ6sJU0z3ouni3YEXHkIWgXsjKdx7q4rPT
         97ZK29hhVJVFxe7tj8eUyyoKgb4A6yr2s8P2fm0rnmltuOaAhVkN9nqz4zWWyquPI4+d
         1RZBdwGGdOyhq9iW8zwWY3vMiCj1AukpeGX0Bv+Iao9bv9I2hZLG30WyFuJpm/coXiBK
         I4V6yU2WS9RiY3FNnuQ1toYX/Kn7FIj1iN+A/pRKajnwJOcoFzLQZD3hQeDWRq323/a8
         rIeQ/g43hxu5FRrqOOv4NqT1rjgC2XrQyTN9wxG+0GY0FzsAP72YaQ/hwN+YMtY5qyJX
         uL8w==
X-Gm-Message-State: AOJu0YwZx6lkT14ffRmFlz9k2ftWGSz0mfI0DylPjusQxBThtVo2DWmS
	ZCwdrZOE6TUjII5nqfeAFmXZWT9R
X-Google-Smtp-Source: AGHT+IG5u9t/Fu2nFNQ1orE3UNBHQBQ3LDCyWgqbnTvlCVgYDh7o8ZjNKy38BsKJpGRjT+NHiAt4jw==
X-Received: by 2002:a5d:6801:0:b0:314:314e:fdda with SMTP id w1-20020a5d6801000000b00314314efddamr3829028wru.23.1696412463511;
        Wed, 04 Oct 2023 02:41:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (5ep85-h01-176-173-163-52.dslam.bbox.fr. [176.173.163.52])
        by smtp.gmail.com with ESMTPSA id c15-20020a5d63cf000000b003143c9beeaesm3539672wrw.44.2023.10.04.02.41.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 02:41:03 -0700 (PDT)
Message-ID: <877d2851-09ef-f275-d608-2766bceb7132@linaro.org>
Date: Wed, 4 Oct 2023 11:41:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v2 18/22] semihosting/arm-compat: Clean up local variable
 shadowing
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org
References: <20230904161235.84651-1-philmd@linaro.org>
 <20230904161235.84651-19-philmd@linaro.org>
 <CAFEAcA-rV+VtS=2nVPDuh=bhdoy3LKdzfXOtX_2Shb58i3fS6g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA-rV+VtS=2nVPDuh=bhdoy3LKdzfXOtX_2Shb58i3fS6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Kt7Rp8pLo2rQ

Hi Peter, Alex,

On 8/9/23 14:36, Peter Maydell wrote:
> On Mon, 4 Sept 2023 at 17:15, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Fix:
>>
>>    semihosting/arm-compat-semi.c: In function ‘do_common_semihosting’:
>>    semihosting/arm-compat-semi.c:379:13: warning: declaration of ‘ret’ shadows a previous local [-Wshadow=local]
>>      379 |         int ret, err = 0;
>>          |             ^~~
>>    semihosting/arm-compat-semi.c:370:14: note: shadowed declaration is here
>>      370 |     uint32_t ret;
>>          |              ^~~
>>    semihosting/arm-compat-semi.c:682:27: warning: declaration of ‘ret’ shadows a previous local [-Wshadow=local]
>>      682 |                 abi_ulong ret;
>>          |                           ^~~
>>    semihosting/arm-compat-semi.c:370:9: note: shadowed declaration is here
>>      370 |     int ret;
>>          |         ^~~
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   semihosting/arm-compat-semi.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> If I'm reading the code correctly, the top level 'ret' variable
> is only used by the SYS_EXIT case currently. So rather than
> changing the type of it I think it would be better to remove
> it and have a variable at tighter scope for SYS_EXIT. I
> think that's easier to read than this kind of "single variable
> used for multiple purposes at different places within a
> long function".

Yes you are right.

Now looking at it, we currently use a uint32_t type, but per
https://github.com/ARM-software/abi-aa/blob/main/semihosting/semihosting.rst#652entry-64-bit:

   In particular, if field 1 is ADP_Stopped_ApplicationExit then
   field 2 is an exit status code, as passed to the C standard library
   exit() function. A simulator receiving this request must notify a
   connected debugger, if present, and then exit with the specified
   status.

exit() is declared as:

LIBRARY
      Standard C Library (libc, -lc)

SYNOPSIS

      void
      exit(int status);

So it expects a signed status code, but we convert it to unsigned...
Alex, shouldn't we use a 'int' type here instead of 'uint32_t'?

>> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
>> index 564fe17f75..85852a15b8 100644
>> --- a/semihosting/arm-compat-semi.c
>> +++ b/semihosting/arm-compat-semi.c
>> @@ -367,7 +367,7 @@ void do_common_semihosting(CPUState *cs)
>>       target_ulong ul_ret;
>>       char * s;
>>       int nr;
>> -    uint32_t ret;
>> +    int ret;
>>       int64_t elapsed;
