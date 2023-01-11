Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4061283ejc;
        Wed, 11 Jan 2023 07:06:59 -0800 (PST)
X-Received: by 2002:a05:7500:610:b0:ee:57e7:7b62 with SMTP id bc16-20020a057500061000b000ee57e77b62mr3698562gab.62.1673449619734;
        Wed, 11 Jan 2023 07:06:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673449619; cv=none;
        d=google.com; s=arc-20160816;
        b=sfK1640xXVmOBcSy3moOouAA3kEOCGT6ry9ovBAJxwCgn1lCAQsU7EZqBGZYX52u8Z
         4IXOqLBA3hfk+EsJEO34Tv2gF8loLiJzH5tP8wsl8SPL5BPbs3L8c3e3lHmHD93NwzV2
         85p6FzFv4Qi6rFe1rKw37di2QkA8Hzmcsqtqdp2CBCuvNJghgN38LsN8AuT3DniGq7S5
         7sa1lkBj+UUGJ9WYpoE9EK+sHZQo5qUHyprt8wFBCpQjauIEPBppcUx8Id5/LORNhiBZ
         +cEVXjUgMYJ5DMX/5UdcLOTdSDVrHa1i+9geFOvd4dflUfSgNtIRbaaap6kcBdrq741P
         cdIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cf/lJoArq8QrnipC49cD1Zh4f8VhsnbBmzMv7uBKIic=;
        b=sRG5eVGJFwu5lO1j1E2o9VHRiEoo/Qdyq3W1a0LgrRzpEr/hKbd2dmqkWCUW6/5MgU
         Ri2JTI8csiQcGuFToGEX6URgpdFEI+Qq2vmNBZuO3PUloP8nj2Kb9aPHUSmJy7QJjQps
         oyzGfmBfVA98qt13WobcEycGkA+PxpTETBtQ2rruIXEnXLjJapRqimJwOhXMISikgzLZ
         R9dcuk05gtaNkyEsTY16L9h/07Hc/sCvuE2ucsWB9j/YUeJ91CsF5/7e16oiioZxuoGu
         XHhGfeNJA6kfDEa+VSh5AR5HRQcTHwKJjYQXzscjGZ471PzUoU0iFppNSSOCwX70M3gy
         /41Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtRAqPgX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m23-20020ac866d7000000b0034355eddd26sor10250870qtp.85.2023.01.11.07.06.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Jan 2023 07:06:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JtRAqPgX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cf/lJoArq8QrnipC49cD1Zh4f8VhsnbBmzMv7uBKIic=;
        b=JtRAqPgXWIQhTIJ/pvk9nHYyl7YD9joVmZx7bvBLPEfghgcyasYNpGEfImgnL21RZM
         Vu3LV7gd9NY3k30xaHijY9Vg0DQbiyxJAjEHqf+s9pWiPiikulqgKmoYH1kce92Aibcl
         yl84iRyD1nJ5jDH5UY/79s5T6x7lNYs8KHXW3whmtwFBVb/H40VKRmgOuiLWWrTmEvDT
         +z54+0Ji1v0WqejbtVy4wjc73ivZFxPlbsKPySg1aicbJ0299CFo8AfIW7zQLZMmpMmA
         nQNb4iI87PSSI3NUhU4g31bGpQaDIAEK7KD/iKiuiWN6x+ogimpzelpSABwID15eK1j6
         wpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cf/lJoArq8QrnipC49cD1Zh4f8VhsnbBmzMv7uBKIic=;
        b=13b/SdrITSgrcMbSMTJYWuJ8p050b3xYGoc8u9s3ys1qCAyNzMNgw8AZmQVPYyoihn
         IdmyTMRaCuCgH/Z+NuVu5qiT0F+LZkqdRFYj0uxdEEzQt2uBYQBQpIKfGocgGCNY58Ku
         YB7tDS2VNnNMtV4K9zE/9th1DcURXM+/rxOsS+72Acs8dgYhvrLIuWyTlvXLohBydgNU
         Ec8DZj5vvOKl4zvmoG1J4sy5RvEUwXVHoZOpULFawaqocvi5FgGizVZZ3kF41UKgt973
         /rlIh4v7iaTgyX4T+OYnISxYPuSPX1qTLUeQSar/pXCLyLjJd9mnZihZDjpF6LNfdf8X
         3RxA==
X-Gm-Message-State: AFqh2krvDWEH9PXJVGxw6VsVBsPDJW/6wX9rWgEl/1GG1GkATIsGcgHu
	uoPTRo2C7XI8MXP9UdwqsKbZv2qrdH6WEUThTg8=
X-Google-Smtp-Source: AMrXdXtsl7+BdVbfYQ/BdyMcVxwR67zbAtKaRlaPFHgzN6ZcSRGdIpIaDmwAMndXGaCkuYpOGow1PQ==
X-Received: by 2002:ac8:690c:0:b0:3ab:9974:3a06 with SMTP id bt12-20020ac8690c000000b003ab99743a06mr74358212qtb.38.1673449619237;
        Wed, 11 Jan 2023 07:06:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb90:8062:d32d:5ad4:bcd:2063:a06? ([2607:fb90:8062:d32d:5ad4:bcd:2063:a06])
        by smtp.gmail.com with ESMTPSA id m20-20020ac866d4000000b003a6a7a20575sm7661969qtp.73.2023.01.11.07.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 07:06:58 -0800 (PST)
Message-ID: <7ba0bf63-1b46-7f70-a0ff-6d62cc963d4f@linaro.org>
Date: Wed, 11 Jan 2023 07:06:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 03/36] tcg: Allocate objects contiguously in
 temp_allocate_frame
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 qemu-riscv@nongnu.org, pbonzini@redhat.com, eduardo@habkost.net,
 qemu-devel@nongnu.org
References: <20230108023719.2466341-1-richard.henderson@linaro.org>
 <20230108023719.2466341-4-richard.henderson@linaro.org>
 <87zgapl7az.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87zgapl7az.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rNCtClim77de

On 1/11/23 01:59, Alex Bennée wrote:
>> @@ -3277,13 +3278,26 @@ static void temp_allocate_frame(TCGContext *s, TCGTemp *ts)
>>           tcg_raise_tb_overflow(s);
>>       }
>>       s->current_frame_offset = off + size;
>> -
>> -    ts->mem_offset = off;
>>   #if defined(__sparc__)
>> -    ts->mem_offset += TCG_TARGET_STACK_BIAS;
>> +    off += TCG_TARGET_STACK_BIAS;
>>   #endif
>> -    ts->mem_base = s->frame_temp;
>> -    ts->mem_allocated = 1;
>> +
>> +    /* If the object was subdivided, assign memory to all the parts. */
>> +    if (ts->base_type != ts->type) {
>> +        int part_size = tcg_type_size(ts->type);
>> +        int part_count = size / part_size;
>> +
>> +        ts -= ts->temp_subindex;
> 
> Whats going on here? Are we jumping to a previous temp? What guarentees
> there is something at ts - ts->temp_subindex?

Yes.  Guaranteed by base_type != type.  See tcg_temp_new_internal -- it's the raison 
d'être of temp_subindex.


r~
