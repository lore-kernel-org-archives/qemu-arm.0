Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1995401njj;
        Sun, 4 May 2025 09:29:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUizeaKCU8PVsVwpk3xxigxSIaaraoYErQ1ewQ5p1nCDFrnQPOzXCcQo25savjZ8ucqPqIKLZDVARQ9/w==@linaro.org
X-Received: by 2002:a17:902:f543:b0:224:2a6d:55ae with SMTP id d9443c01a7336-22e1eac1872mr80484985ad.48.1746376193649;
        Sun, 04 May 2025 09:29:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746376193; cv=none;
        d=google.com; s=arc-20240605;
        b=AHClzx29SJ5XUOMgLb8rgEwqy9kLYJBFV27RDaC9XnNoQURO93zUqByK/+4RtqmBSQ
         1l8JkRrOHYPxoKuc8IWiXVlCol0vl7QAQU4uQ+hIimZ9EkW0hEgOoIBx1e9urfJ9FE2z
         /tYmLi889+HVkBLXACje603GJFXaoyjmN6JjoCfEt3mUppSptg8ZNxdGGKmGuuod/ogs
         dO/jOZ1gsh8BWWzG4OWMR3P/zIV0AGOayIh9dUWXXSdJKZgtjMzJYR9zNd/RVj8c26zG
         K+0TnQdJV8hR5E1Zi2Ny3uRFbiw385xdyE5bF7Wz13jbA4XjbPIsbwNG0N2LZ07UrOam
         GrSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=flwasTZuJuRJQjKKfHx/Jki6vfwUMVpkVeX2nZYOmHc=;
        fh=4CjBN7ZUaaJVC/eo51bkKXQQ3DL/q6/Ws9yQFocjEoY=;
        b=LWYB8EeceWddSPwLcqdbmvxl37auHbs+ni9l69Blo6V5c/iMPyYPN3A+5D8WPHq301
         JQfyYoYK1Lc2+aS1UQNRAqVNqt8Ih0LmOXqK55FpiNdfv/nquHXQSPgLrlJ7LYXpB6Hs
         nK+8bwq6uE7nMy9j1Uj3XcV45ZhTGaC4pL0gjDa56oGl5lQLeF/9MX2gf7mYxHowZHxb
         4eYreHAu8MtNhqFc9J6eYHGyVrVnJjXDMdguvMq3f8pl5u/lfli7X/RovECUYKip88/1
         8mgC/Mmw0KaDBnSttj4LDJpzDofXUi9bi4SJDFZZSb9HQLKLZnrIluzHmrLBOktDWRIC
         DAnA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTiwRMRU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb0b96esor38282655ad.2.2025.05.04.09.29.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 04 May 2025 09:29:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UTiwRMRU;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746376193; x=1746980993; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=flwasTZuJuRJQjKKfHx/Jki6vfwUMVpkVeX2nZYOmHc=;
        b=UTiwRMRUoGiHSHNZz7B/HZtRvzJa/UbEU39Xi5Ms3Qy/Qmx+N2puqXD1Tnlp70ZdwS
         cvOhvz07Flh5PO+jN1u3/LPNtz5GXnuHu5rjjVa+cSeJBKw6K9iy2Vn7jOghLgdMutYw
         ORXP92NJVnxngocclYiUSfIXn8e53hBSarggp039+GXrauvM+/ZDypKyxggZWPO4mDa0
         872M+mkHHZegkIOFz+VEj5AAW2KZE2GDohNG3IkNtPxkrXmj+k7UY1V9MaRJAXc9pBJE
         77kMcub9+9/GTL9O1u6VExR9jCVYmZMEtNDdKjmExlQ+kpDdQV5dQ6FU3Vqj6Ml4hzTd
         K6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746376193; x=1746980993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=flwasTZuJuRJQjKKfHx/Jki6vfwUMVpkVeX2nZYOmHc=;
        b=Ohj/YjCwMxy1lAp//tg9kMznCLW2b4G3AU2D4nA06fUtYCC0QOrgtg8UCyFsQIl1Am
         PEzg2h5lSzY+6usdnrgwsV1o07/SjtiZiLczarXZkwesW7ORgGRFSXq556P9BhfszEzX
         LWi+3qjsF5ZMh8ZjlA0oA0lYOTb6OHyqSFbh7FD3Wq9IoAr3bDFH8SMuwEtUfTiNXcfv
         im1nOjJxXM7l6jFIS5gQk3RsSIeJ/U6HkXK1oOdjgBiqkS/3fBJZk1KusdAiMR2/cHLK
         W8oaxVfTCDfdmXD6D3hsYWFMPkJIG3MqYPBJXzZDvRyQ64IRmXW4j42eq/XlB8UpLGBs
         o6UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV31/MYpefTbeaSrJjYbDhUlwoqhw4HNwYhQDdnuqezWRcVkeBO1NQVGGmOX8Gi4P/Tx5W59Rz6jTkWBQ==@linaro.org
X-Gm-Message-State: AOJu0Yw6mMWaTmRs4QL9rSWFIswBIUfc87jJz9GHeZ3oQFRDkWQw4DfE
	7t18warsYGFJo7V2ySDJ/75TSQDzigwOlrQv2zpiMk1Bnt7XkLMLaj2TZvvTjakT9A==
X-Gm-Gg: ASbGncs6g3bK/22iWmjLDmu66u0SLF77dYRK6z6egQa3d7XFriWPANUg7KU9BYUX9WP
	MMCoIizjhRMvRLQ4PKueH1dPjj47Mj3id0hccm+wPF6uhNYF4hHnDR//0p63c2C4QMde2f5W8M/
	QgBTbdw/WOhLusWZxcGo6YsytZ/52kvzxPRXjKrCCxjNzNZARpxHao5ig3WUTFnAiSTvU4IehMs
	JudzU4M+SYUWXDRNILq5tzGxvHryEqJHFn6qoHgs8ulPefx4McSm4wRLUmAsmPAo5ZJ9ZAWzIFc
	xMfdIWtsDgW6juTZInByuIkGRmGW4rsbIhl5bkNWb0zyr8NTAEiyDQ==
X-Google-Smtp-Source: AGHT+IFUvkPvo+NhY3ntt8T6pn9WxQwRYyY1sF5qimroiZid0sEQmoCyAGZR+08a4QGy+f2RwIsoaw==
X-Received: by 2002:a17:903:11c9:b0:226:5dbf:373f with SMTP id d9443c01a7336-22e1e8ca3cbmr61521405ad.10.1746376193168;
        Sun, 04 May 2025 09:29:53 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fae5sm39307645ad.132.2025.05.04.09.29.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 09:29:52 -0700 (PDT)
Message-ID: <e9381208-fdcd-4c62-b1c7-60cc9f6542ab@linaro.org>
Date: Sun, 4 May 2025 09:29:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/40] target/arm/helper: use vaddr instead of
 target_ulong for probe_access
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, anjo@rev.ng,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 alex.bennee@linaro.org
References: <20250504052914.3525365-1-pierrick.bouvier@linaro.org>
 <20250504052914.3525365-17-pierrick.bouvier@linaro.org>
 <5b152664-a752-4be8-aa15-8c71c040b026@linaro.org>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <5b152664-a752-4be8-aa15-8c71c040b026@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ttClSWByr5GD

On 5/4/25 9:17 AM, Richard Henderson wrote:
> On 5/3/25 22:28, Pierrick Bouvier wrote:
>> +++ b/target/arm/tcg/translate-a64.c
>> @@ -258,7 +258,7 @@ static void gen_address_with_allocation_tag0(TCGv_i64 dst, TCGv_i64 src)
>>    static void gen_probe_access(DisasContext *s, TCGv_i64 ptr,
>>                                 MMUAccessType acc, int log2_size)
>>    {
>> -    gen_helper_probe_access(tcg_env, ptr,
>> +    gen_helper_probe_access(tcg_env, (TCGv_vaddr) ptr,
>>                                tcg_constant_i32(acc),
>>                                tcg_constant_i32(get_mem_index(s)),
>>                                tcg_constant_i32(1 << log2_size));
> 
> This cast is incorrect.

I'll change to i32/i64 typedef, but I wonder if it's ok in tcg code to 
do this kind of cast, when you know the dh_typecode will match behind 
the hoods?

In this case, I thought it was ok since this compilation units is only 
compiled for 64 bits hosts, thus ensuring TCGv_vaddr has the same 
storage size and dh_typecode behind the hoods.

> You need something akin to tcg_gen_trunc_i64_ptr.
> 
> Alternately, do not create TCGv_vaddr as a distinct type,
> but simply a #define for either TCGv_{i32,i64}.
> 

Ok.

> In this case, it'll be TCGv_i64 and everything will match.
> 
> 
> r~
> 
> 
