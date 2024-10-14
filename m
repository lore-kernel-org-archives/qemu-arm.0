Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp2053746njb;
        Mon, 14 Oct 2024 12:31:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW45nuCv+50a50Rl0Qk45WmU9OpA0u1TsH6v8s/gJrOb59X+aXYGAASA+JvxikOP342W5GWWYQskKN6xQ==@linaro.org
X-Received: by 2002:a17:902:d4c4:b0:20b:983c:f095 with SMTP id d9443c01a7336-20cbb24243fmr139601215ad.51.1728934267476;
        Mon, 14 Oct 2024 12:31:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728934267; cv=none;
        d=google.com; s=arc-20240605;
        b=Za6ktG8OpunOQviOg+gx9aiSdq7nBd3Hksmxqd2lF60I5OSN3l4/QfBjkKdHLOkbVZ
         RgWzzh58qfHjKtNJG5s+bUFuxTL4tTOt1QkbaXmgwDll/CYKWW0v2vXF/E1bgudrCYkg
         q5LGTyJRcXuM4BhORfr94icYj8kjZStASbUaCTsby/Ay/V1OW2hjyBBRDCtqisbE7lZ2
         yzxMsm4SZSX3z3szNWol62efS/mV0yg6p8Y/j8pzLMMgyn9877WYvoSHfE5Hi7Xuh5V7
         +C8D4fUSIIKHrntm3PydeKPeZBs6P7cpECZUhX0v/drSI2shfza8fPvs/Wb+NIIEgIUW
         l+zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=i1AEL1iCDF9gEmhg3gccpp0WV6U4G1Xodmz32GJKaMw=;
        fh=8b7qnY7oFvSbYM+pl8SsNr+fBGTNBOIwoLa4A5BkI68=;
        b=BvjO7PZkAu2c6jDSJoBXDHLkVJXlh676OutDqeesXt8uPrdGfWLV79BO+/3hbZqD8c
         4JhdWSTZSYUWpOTjtCDNrU5aYYVjQN1Io5VIc87LFszASYq5+FQe7jGQZoMusT4vWTqI
         By8BS0ZlaqrmZXmTU1jpA2HAD8Gu2IFQ/+3DCFjWdV/rDR8aH2UufwfFPXWGjFy50tDv
         I0dPridPFprbeDpG3azrD5VinUdjAfhEYNOMRKfHjo+rcKuH8zARVtXuLe40o7GoTq+d
         Ct/uvHeFxIAYYL7Ivyu6Otli0tauOIQ8QSr6VtcpmszBYkNv+ujl5Tt3R7M686s9AU4W
         i5lA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnnjQNnF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20c8bac84c0sor46031345ad.1.2024.10.14.12.31.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Oct 2024 12:31:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnnjQNnF;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728934267; x=1729539067; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i1AEL1iCDF9gEmhg3gccpp0WV6U4G1Xodmz32GJKaMw=;
        b=PnnjQNnFFlhMtu7OwPa/6C109cMbHcRFytm7DbTyYuO9oeadwqhW9Pwm9StzcYynI2
         nNKMqkfXl3y+HLOtynJvaImM7dhBjaWmcTYOrcxuux09sUDxfQrqKNVKYOXPhldisFVF
         1ncsdl3UOOhtco9s9oQDIbeTpe7AheJKtBPcuJGZGK7rJmzpo/rcFCnhVFPxI4ktH5NL
         vyPDMH7zuwsazQvKS3qABWuUb9yxjN8HAYSttyY/hkXApkOn78TEYG3DNz+X0OkO4GkW
         T3xxeYS0m4q4rULcgjKDuapNKZQ7ge/8oR/ekvdvJ1eAywm7ktGA+KtDPHhPWeLnfPhj
         udMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728934267; x=1729539067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1AEL1iCDF9gEmhg3gccpp0WV6U4G1Xodmz32GJKaMw=;
        b=I6vWszYUfqtBtA5i2JTHZq3Ryr44+ED/uO+8+npVY0lZhYE9PVGZxGFv8AUdlAXm/m
         UCpBWW1SBjp2/o5nD15AaZ3h8SBDFFiZa38X4A3csrrFrDMfoYT1wY4r/otPXE+DTXWQ
         6TLFItfPnKyD8UTjFN5taAdXUo75HOvA3KM1nXtF701gYr/jHL1EElXCjOl6rGItD+nM
         J8DbamlO7oVqC73WBdKn1EZMYRWe9QFgsUxhlKTwJaCIyEENZA4MBoeEKC1CK3Hoe8sZ
         vOehUEkDzW85PIYRwonKfd8AFKR4lkqjrXVEN43J9OLWNJ34pj9UogGKWv1L+wU+LQSm
         NjEA==
X-Forwarded-Encrypted: i=1; AJvYcCXyjFuk/OgUqJrUmIaqOwVgZAu3sNZIN8p0+Ejer8hi32cMhCBCTAf0ORIETRgrKQueIx5qOcWiWPIrow==@linaro.org
X-Gm-Message-State: AOJu0YzjfIz77ziCLBa2mEIddw4tHke3i2feJoyVSirIiHK1uUtRkWO5
	Nmtz7IEobfYQUGbt7RLoaFlEQ5+amfH2tCl80sfYwSmlelkobG0wTujiTtz1kRXIhA==
X-Google-Smtp-Source: AGHT+IGNwfPrqX/p12MjjHkL5fhFAF3sIeaw3O1of+XU0hk007UxnEm4B47z8tir6AN7cjGiuEiBDA==
X-Received: by 2002:a17:902:fc50:b0:20c:8c0f:f986 with SMTP id d9443c01a7336-20cbb1a91camr125106145ad.24.1728934266970;
        Mon, 14 Oct 2024 12:31:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c3561e0sm69129535ad.291.2024.10.14.12.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 12:31:06 -0700 (PDT)
Message-ID: <b8e76800-e5ea-4060-9e3c-35e8a9f8812b@linaro.org>
Date: Mon, 14 Oct 2024 12:31:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] target/hppa: Fix priority of T, D, and B page
 faults
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: deller@kernel.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 linux-parisc@vger.kernel.org, qemu-arm@nongnu.org,
 Helge Deller <deller@gmx.de>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>
References: <20241009000453.315652-1-richard.henderson@linaro.org>
 <20241009000453.315652-10-richard.henderson@linaro.org>
 <4810ac6d-cbdc-4f04-a2fa-895e78cf2fcb@tls.msk.ru>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <4810ac6d-cbdc-4f04-a2fa-895e78cf2fcb@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: F+Ncat6aVRor

On 10/14/24 11:02, Michael Tokarev wrote:
> On 09.10.2024 03:04, Richard Henderson wrote:
>> Drop the 'else' so that ret is overridden with the
>> highest priority fault.
>>
>> Fixes: d8bc1381250 ("target/hppa: Implement PSW_X")
>> Reviewed-by: Helge Deller <deller@gmx.de>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> Is this a qemu-stable material?  For now I assume yes, please
> let me know if it is not.

The kernel fault thing is pretty nasty.
Fixing that probably requires all of patches 2-11.

I don't think the arm fix is serious enough to backport.


r~
