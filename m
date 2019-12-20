Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp3594566lff;
        Fri, 20 Dec 2019 05:19:01 -0800 (PST)
X-Received: by 2002:a62:888e:: with SMTP id l136mr16227591pfd.80.1576847940982;
        Fri, 20 Dec 2019 05:19:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576847940; cv=none;
        d=google.com; s=arc-20160816;
        b=PC/+GWZr6wmSsgvHkfyRmLRiv9u6JDuGJXkotQqJItYPInA15kFTYX6Ss02UO0fHjR
         h8b6xV4xOyTow8DEKxpw69xrwNNYSxCo8LWNoJn0intlQEzps65C02HYf363zAGGSQS6
         N4QnSw9wqLuZLH9+KRBW/PVSfCkwqCLlEnGCIcN4M1ADP5QNkJF8KK5zwrWNKEB+UtWE
         djc+HkwwIqadqy/3baKizVUwl6LxOsV/9DVVok2ZAE/K4BNgZQ0rel4AAoESvzHJP8td
         mGtB5T1jc2vf0dJvyJavMVGTgpxZoatX3Ppa5+iP9TlHLLrXYd9qUuhbO4YfcDQ2VL7O
         xI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=4aK/ve40XlXyED/AEPJ4m4wmtwjR1LdUmhAHwiSmLJo=;
        b=i5nXXoKg9QauzUzVSNhHIXQUzo+Yz4HrJV/aizlU0/NZbvJ4HZ5ufcoIcd+W+swWO3
         Go+VEpW0NGiuzQtRzLZTqPkqwsghjjbbbWYcwzBx5cvsaXH94u6MRMcpGBK4lEXpTkdW
         aGHNCQIcorGYKfBGa/QHtt2Mhe2E20/ej2t0hJVcmo/JG9VdZCpvRnrN2ylcnoPudbWy
         QE1lhtQLCxoeqwHxYoYB6mTKmHEj9L6438X1dZuqgz0eu1Kd0jPdAxUewQlgv8+1xyHs
         7bcqskqkdZBCU8TaM8CJn92lFafi2lGqhwz1359zEYeXvhrJf0btBUzk8UJhJq/j7pxS
         BCcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l6IlTDNs;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <luis.machado@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h3sor9987625pjq.15.2019.12.20.05.19.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 20 Dec 2019 05:19:00 -0800 (PST)
Received-SPF: pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l6IlTDNs;
       spf=pass (google.com: domain of luis.machado@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=luis.machado@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4aK/ve40XlXyED/AEPJ4m4wmtwjR1LdUmhAHwiSmLJo=;
        b=l6IlTDNsvGyoB0tXXWQHti/s95zZOjKD7QSM/iiqgWQHlu/BNJKjy77573eoZHiRi1
         UyU2sc9LkhbSxqBYipLylqXs1qrcfzErjz/wKniNoOZl8UgQKTd6A/VomCu5IOBsM3df
         lR8pGwT0Np5uEp4ZIwaractOxLEN5EMloX02ENBokjLaT4dN9CpRYcRiMWvyo444hcAA
         7PjuDbvkMtY5RhbpJGeZMrMROIS10rmFSKNjldTmt608Q6wOTYS8mbFaAhZFGL8f3mW+
         NqXtJ7M5S7ld3WmWIOlJYMuYNuyx15LsUqWJei9hloiV5lW+9965EcoOCmzmTDuRkqt+
         tYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4aK/ve40XlXyED/AEPJ4m4wmtwjR1LdUmhAHwiSmLJo=;
        b=i+/IiUZlOxbqzjqjnge/k7YY1GfobaBAlfTD0DmDFq8AvS00NW0mdaDmoAgjWM6i3Y
         iMWagP7m40E6szajTQY+77+X+b4f0R3TiT2jZF+vRAIBwqpIWFel42xwZFquri/kuhjg
         bduzdBhSPzf69Oqr+wjQhfwp+0Sd8rntbTKD7FDovKxw/D/evo7LArMkrPc/wZGC4Amk
         1cZQCrJutS6ODhBzPoseweo8bBoJY8VPj3f4fnhpNQmSKS5QtjPZrIDH3CyYTqOaxyKj
         C3JehgrHdlP079/pBpnE1lYeCJrOcsJFLOERozfCEuf+p33ELDdu3C8wA1axVC9Bgtar
         62xQ==
X-Gm-Message-State: APjAAAXP9q2EaRRcsDmlgKaj5FBCkQZPHP8a4hMYrAhk6/o2cA7DUI3U
	LI42g+f/FANxipNjp18T+IK/NvyF
X-Google-Smtp-Source: APXvYqyWN9m1C/V/VpQl/BKNVN/sNfLzvNeD66xVzRfevTHKsRReemtDQ6psnbh0PHz+NZi9wIDdyg==
X-Received: by 2002:a17:90a:8a0e:: with SMTP id w14mr16312526pjn.51.1576847940320;
        Fri, 20 Dec 2019 05:19:00 -0800 (PST)
Return-Path: <luis.machado@linaro.org>
Received: from ?IPv6:2804:7f0:8282:d06:e0aa:310d:b742:862f? ([2804:7f0:8282:d06:e0aa:310d:b742:862f])
        by smtp.gmail.com with ESMTPSA id 199sm13643132pfv.81.2019.12.20.05.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2019 05:18:59 -0800 (PST)
Subject: Re: [PATCH v3 12/20] target/arm: generate xml description of our SVE
 registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 alan.hayward@arm.com, damien.hedde@greensocs.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20191211170520.7747-1-alex.bennee@linaro.org>
 <20191211170520.7747-13-alex.bennee@linaro.org>
 <69e10c48-8bdf-cbe0-3372-815b647f8312@linaro.org> <87k16sdt4d.fsf@linaro.org>
 <5c6dd0a9-23ba-63ff-5738-8bac11aad810@linaro.org> <87eewzdtqg.fsf@linaro.org>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <81e43d43-29f8-ec56-5270-bb90dd1bc077@linaro.org>
Date: Fri, 20 Dec 2019 10:18:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <87eewzdtqg.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 1z+LW+ptsxwu

On 12/20/19 10:14 AM, Alex Bennée wrote:
> 
> Luis Machado <luis.machado@linaro.org> writes:
> 
>> On 12/19/19 4:15 PM, Alex Bennée wrote:
>>> Richard Henderson <richard.henderson@linaro.org> writes:
>>>
>>>> On 12/11/19 9:05 AM, Alex Bennée wrote:
>>>>> +static struct TypeSize vec_lanes[] = {
>>>>
>>>> const.
>>>>
>>>>> +    case 51:
>>>>> +        return gdb_get_reg64(buf, (cpu->env.vfp.zcr_el[1] & 0xf) + 1);
>>>>
>>>> You need to use sve_zcr_len_for_el to get the effective vq.
>>>> Also, I thought vg == 2 * vq.
>>>>    > +    case 51:
>>>>> +    {
>>>>> +        uint64_t val = *(uint64_t *) buf;
>>>>> +        cpu->env.vfp.zcr_el[1] = (val - 1) & 0xf;
>>>>
>>>> You cannot hard-code EL1 without ifdef CONFIG_USER_ONLY.  If the effective vq
>>>> decreases, you must call aarch64_sve_narrow_vq.  You must call arm_rebuild_hflags.
>>> I'm just going to drop vg (and therefor the ability to set it) from
>>> the
>>> regset. It was only meant to be an indicator and gdb doesn't actually
>>> look to it to size it's output. The likely dynamic extension will just
>>> re-transmit the whole XML when a change occurs.
>>>
>>
>> I'd verify with GDB first if vg isn't actually required.
> 
> It works with my tests but perhaps we use our own namespaced XML rather
> than the gdbstub XML.
> 
>>  From looking at GDB's code, it does set vg as one of the register
>> names, and this is regardless of any XML input. It does reference VG
>> here and there in the code, even though it may not use it to size its
>> output.
> 
> But this is all special casing for feature
> name="org.gnu.gdb.aarch64.sve" right?
> 

Yes, vg is only available if feature org.gnu.gdb.aarch64.sve is available.
