Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp1478772njd;
        Sun, 30 Mar 2025 01:25:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpuYhTK0LE2kmsa1MMAfH8pqD9l1yCPXgayAzrtbWIdSn1XC6VTGNGh4oZOgpGcdMoAubWsFZZRDaUxA==@linaro.org
X-Received: by 2002:a5d:6d8b:0:b0:391:3049:d58d with SMTP id ffacd0b85a97d-39c1208ebcbmr3515949f8f.0.1743323140119;
        Sun, 30 Mar 2025 01:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743323140; cv=none;
        d=google.com; s=arc-20240605;
        b=GcRP0Z5NqU9JCbSKnKL+wIh6vW8PBBBUZHHUDOcVN3tys42mHW0RpKKUNHOSB4bPD9
         dUO8j8nxyjtOatOneuWWJKHtNqYDGQrBLt2J/EiyE484Rxlj+IsWy6CqT0UWh4IGEYHx
         3TtfECyTYiq7mz5o2Ffwl0tNIUEWmTeeC8ROVswgBmIAIMtbLDtlygAAVxvGLnOojlN+
         8S1zMlHjz4q7m/ElAncrKWrbUew67iqYntjLGeU4qu2qI2jLgHMq+CfSvbTNO+twAQ7q
         3hZSQrPvuMtkXH9wfSlHoXF4iL3eMXE7SBKpfsG2p5QnAasyqJcv21nWfpBi54Artrh9
         y/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=AcYIndhl14cmw23q+DOBnpn4QIlK83HGn3hyGxMylyc=;
        fh=kkncIjv35RIsT6eCqd9fhuOaigjGnk6yoLXsx9o+beg=;
        b=A4dT96r4LMIrMUxnUzwHg+2HMeLtC32KDwu43c4td99qq27BVOvScm7dJfut96o/BZ
         VH8NNtmnsChlrz0cVNUYnBERMUd6h2tRy/OMETkF7QJnZCbC9N27c/XckHtw+yav5GmI
         gGwZ+spE2Sxh6nTW+19FkpEfJ2VFEhbFTA4RUQ96jHP+fua6jWjuO8swE5xyke0WynBO
         SOP1g2OHJ9GAyE+kKJBvek5uAk4kKga3s7BtH73OkKgeYu2zWxtSm69QvqNj9GhIL8yZ
         jwBY18K6UMazJxXoI4ELIIsIEIHtkip1VoOrGqzTDgqFQlJ0AYI/L4FtqoPunns+jzE9
         SvLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gx5Rz/NG";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43d900fa512sor22885745e9.11.2025.03.30.01.25.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Mar 2025 01:25:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gx5Rz/NG";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743323139; x=1743927939; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AcYIndhl14cmw23q+DOBnpn4QIlK83HGn3hyGxMylyc=;
        b=gx5Rz/NGI9hRY8QxKNez2jbNWg3bD4SkN+wd5I7wIy5iieuJt8iJmgIT0BDx+g08Qw
         rHOpR1N4EC93h7bkHgXfjgSmYhz59tcQjfKRrSEAlT25FABuw3nKHjTb8FrpBZDPheo1
         Xq5JPV7W0f7i0uZDweCC4+9+FgybnB7MPR/UQ6X5XoCJFHQibo2jTilxl1jdoKQU9t6d
         Y3SGNTsckMFtXnbKu0W/x8GOio/Bas4AnbYltPckoHTdHbkX9UM4XeddCH9aceINv1IY
         ctg/YGvpX2FTJtjsvC/Q4EUIpguTleGyhJvrOHUt8POQRBJVbY5iXQ0nAiaJGz3wwxw3
         H3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743323139; x=1743927939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcYIndhl14cmw23q+DOBnpn4QIlK83HGn3hyGxMylyc=;
        b=VgrDCZVTQ20jdXAlvftGuGG02zO6cVAeyrW2uumdBu33UYNeuNvW2rylycctw3PI4u
         iiwAxfWMIfb//6QEqRLRoIfmMEvp0UOC0+sa6Sj1j2mavix4eelVSmK+cx/Mf7Op3xfF
         5Nf5f2Akuh+nM96CTzH6Oh9q7Ekp/ks63GCGwqXdA61ncnVWljrcZ678DvDR5D+WVTW7
         yRobHnzSPInXvrofzVYV/mjwt2z2B3ihRW80WY0oz3q/341IK0BMdc623damXBUH6wmo
         YVL2rPqlOJ5h0MN4LW0RCCU28H8DVWaLNCuKM+gLa8ZHXsLprfarktDI9D5RuVg7cds6
         je2Q==
X-Forwarded-Encrypted: i=1; AJvYcCURLoed6XAqv+RYRt5MF/npb8dMI2K8qbQysHpidP7zsO4hYOgmzKSZ+6k4G69k8cp9Ga7Kc60FR5q7rg==@linaro.org
X-Gm-Message-State: AOJu0Ywao1oyA5hw1OtyvXWD98xtX2x+WZCrWsw6jqwjIayyHpZQ72Ki
	RHKG240uPv/osXpz7SyJ4cs7P/g/tPWXlBkDVNPd+jHF7uuNXDzk1+jUGJrb75VTaA==
X-Gm-Gg: ASbGncvsrwxSJiPOrNf2gcVUbwI2qSkXxB8j1vEEgW2Acd+CZqpfArxKWvt1eIHglw7
	pJgtuXJQ7Qv7+Vj44Yz7PpOOZ4+rYPpADehKVpuu9WuQ8+0LIPJp+s/+/1fyR+d6smtbaUGWxNz
	F17Z9i+SFrn8svo5K078b64UcJr3mdiegiw0HogGCWiBVwgoRwkrx0sg0NbtAFper2adbhquAAc
	SRH9Qv2lDqhlHnYbFpdU1zFfwGTkMt5gU3s9D5ghJ5T5yR1KyDx4/jMJGOQaF2vPW1Cmg98b3sM
	hsR5YDZ2EMGg5AN6C9uEdPwqzxLE0QhVffW2krJLlpvChtsS7gZmBvXQfsJ1bk7TqDVeX8WteVG
	TloQ=
X-Google-Smtp-Source: AGHT+IHe+y3Ztuy4v1H86YIezz8B5wo87c+zBoOHzm36A/SO3bUdFHDTysx/YSidoK0yEQ5XOBZ8bQ==
X-Received: by 2002:a05:600c:16c4:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-43ddccbfe45mr32952945e9.12.1743323139476;
        Sun, 30 Mar 2025 01:25:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [10.155.70.213] (63.170.88.92.rev.sfr.net. [92.88.170.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90000a09sm84312955e9.35.2025.03.30.01.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Mar 2025 01:25:38 -0700 (PDT)
Message-ID: <eec76ce0-c3ca-48ed-befe-e0930d4a39d9@linaro.org>
Date: Sun, 30 Mar 2025 10:25:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] include/exec: fix assert in size_memop
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-s390x@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-2-alex.bennee@linaro.org>
 <4fbe53ce-047e-4efc-a0a6-f59342e1f3ea@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <4fbe53ce-047e-4efc-a0a6-f59342e1f3ea@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wg6oj2FtLY/F

On 29/3/25 08:51, Akihiko Odaki wrote:
> On 2025/03/24 19:21, Alex Bennée wrote:
>> We can handle larger sized memops now, expand the range of the assert.
>>
>> Fixes: 4b473e0c60 (tcg: Expand MO_SIZE to 3 bits)
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>    - instead of 128 use 1 << MO_SIZE for future proofing
>> ---
>>   include/exec/memop.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/exec/memop.h b/include/exec/memop.h
>> index 407a47d82c..6afe50a7d0 100644
>> --- a/include/exec/memop.h
>> +++ b/include/exec/memop.h
>> @@ -162,8 +162,8 @@ static inline unsigned memop_size(MemOp op)
>>   static inline MemOp size_memop(unsigned size)
>>   {
>>   #ifdef CONFIG_DEBUG_TCG
>> -    /* Power of 2 up to 8.  */
>> -    assert((size & (size - 1)) == 0 && size >= 1 && size <= 8);
>> +    /* Power of 2 up to 128.  */
> 
> It may be better to avoid writing the literal number (128) in the 
> comment too.
> 
> Perhaps it is easier to simply remove the comment instead of updating it 
> to explain the assertion without the literal number.
> (size & (size - 1)) == 0 looks cryptic, but it can be replaced with 
> is_power_of_2(), which is more obvious and will not need an explanation.

+1 for is_power_of_2()

> 
> Regards,
> Akihiko Odaki
> 
>> +    assert((size & (size - 1)) == 0 && size >= 1 && size <= (1 << 
>> MO_SIZE));
>>   #endif
>>       return (MemOp)ctz32(size);
>>   }
> 
