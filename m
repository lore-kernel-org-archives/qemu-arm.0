Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp10237614njk;
        Fri, 3 Jan 2025 07:08:31 -0800 (PST)
X-Received: by 2002:a05:600c:1c99:b0:434:f218:e1a8 with SMTP id 5b1f17b1804b1-436686476eamr421884545e9.19.1735916911521;
        Fri, 03 Jan 2025 07:08:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1735916911; cv=none;
        d=google.com; s=arc-20240605;
        b=AvhEP8i4L+XKOnO62XnUJlTgH5xVM1GMl6ZG4rMz2sZi7tj2+Y5InyrxzsaQihhTNA
         lyvOsDGnM45vXeVxizodDIDk+GvfeVrimiMtfKvEi8IxvPzhaIr4IImpHLDKEaT4nYeT
         whfI3U2dmz8AlcPtMkEjVfAFlj7RqgJdVZCREgPNnG/4eCbrwzLBKdqLrZKX58G4uwDD
         YYEs0WPAuFf6Eb4B5dXzqvSmN7hxmDAIUCVt/0mPQUCaRL/1JxxgY0rEs18rlrXDi4YI
         aUhSdc5vsVOlvmblgJVG+Q4mo5kR6IVcPv+IRQf8u5Yix+XMnhGMOu+w7LmKDsFbJ6AL
         mo+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r2+EuOqgH2urw2OP6VSf6sSCRq9D8mLLNGymXCzT50Q=;
        fh=Xqzfu7V/6ex+ns7477EGUGHMmH0UYhtx1judbNfnZT0=;
        b=OIfZ+fT7Qh+mGlhMnEMKHNjBuoITEcmgA8dLpVeTkRnydc9IzNZPyOiyOtnnUbF2sG
         oVd2a1/VaRmlJa12OBTfTrktvz6EGtbRLCDwBHzlQPbeWPJ9plA0jsYdLxAgrFKM7pCi
         Jx7BIo4vDp79wnomWgsiGdj4QDlNrKxwO5O2JWoId5DlPiNhgeq1L5sJGbChgE0ri9Hb
         VTz9mBJzIBIH0slrVD6nI/iUIRN32/CZRznKi0RY/nIu7WQ3pDE1cz2s5Jyb7f7if9YN
         5P9sl5+CsmemrSwfTZBCOv1Fy1AhBIIygW7/iDN/gZ2fkl2J+DdHHYgjz4pPHjPkxDuW
         W4yw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7VeJTFt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38a1c6ac00asor7170410f8f.0.2025.01.03.07.08.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 03 Jan 2025 07:08:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q7VeJTFt;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735916911; x=1736521711; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r2+EuOqgH2urw2OP6VSf6sSCRq9D8mLLNGymXCzT50Q=;
        b=Q7VeJTFt6jn90DnWSu/0AoPjI07TnA433m2ugebvO0CrSU7/KHnV96DtmV5POhPjJ5
         hyPULMYXwF11wBKHpEuYJBM49gJXRbmT/QgAsYnPtQPTZZAXAUCrINitWVZgfooEPyJe
         P2C8RxOedFTkjMqEKvPWA6gYQZ0DQwcvjx3px1fJTGruUFqd8/6y182OLEFHxg4BjsMb
         ehnFPafxNpr4zo/EqdKSlxU83F9hb6OmE9iLR4K6f2mNE3J2614TEmrPNbM7TjDOpBAG
         O4IzrRIPG2ICT40czGFUqH00F1kVVSkk2w+weURp3xVlydKUko4BaVzFsRyP923ilrkP
         jx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916911; x=1736521711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r2+EuOqgH2urw2OP6VSf6sSCRq9D8mLLNGymXCzT50Q=;
        b=FwEQZ+FkQ2bCZL4luD0FLhZnksmZrUYIBzD5gg+K8FhagpnXiknM5XSUWRMMsIVjp/
         tnC9pGTuYo4eJ+YqGcwCuNizP079/uQV90jEP9sFRYfbYaqGqJf7jmQZNbJgs2f48hkO
         7LCBzHcQJea7lyRVmyf4aTlaVJZtLez3MRY/fCyXYDyGnsFTt4C8D1gzX/9UxPE3GrC7
         NGztP8q8Lsb4EnywD/40+l7cx35P7Rz8l2iGLd8zHaFT9cdhkRPWnvr0sV8PMwEqP/2+
         Bh9cFiumIUqkVhP3NiGne5pfyK05mg8PhcuR1r0HobQUwxP6Kkd0Yr8B6efxdem+k92u
         1UNA==
X-Gm-Message-State: AOJu0YwWVJX4T4wrCndaaa7LP9uVH05pD0TIiFfP7DKM4OSmp1IX9zFz
	JyQpTPiNC7I2zAe9YV6XNVsnnGGknedhRp1WwSqTxwolXMnoMvaIHyZc7i/QAltWnAENdL47gsx
	zKW0fPw==
X-Gm-Gg: ASbGncvalsb9r2vPDUCbX47amIHWA3y/q2PZKLRuUQEqN1wPqmwyND/oOTO8TTYxKx/
	OWqAbhhKzD6BaFkgopEbXPKxq9hnS4M+iJrVq74987eOdVSDszu71OKm+JfJfzmalATnD4CaF9c
	McwvSmp76EWPScJPrItRWACeHOL2BnLyeqnatoq1Sgzu1gKSZrsBpgafcpwj97uO/bPNpdjNabr
	jxt2b39AO1LnXO5IZAP26gY2IYfo7fFkE0EgP4T/PgqkPyPGGHKnNoGtkNJW8qhUUp0nCeVycR/
	ltqHMQIPvhnDdnZANIUywWIR
X-Google-Smtp-Source: AGHT+IHf92aNOME9sNfHMLKRq1YpEFls1kHnigg8kFTVtI1ANMu7tvP1Hi3QKh49uIssyE2ugh6jHA==
X-Received: by 2002:a5d:584e:0:b0:385:e5d8:3ec2 with SMTP id ffacd0b85a97d-38a221f9c94mr47449289f8f.28.1735916910945;
        Fri, 03 Jan 2025 07:08:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.132] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828f5fsm41382990f8f.8.2025.01.03.07.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 07:08:30 -0800 (PST)
Message-ID: <5d19a266-fb17-4143-b701-01740ce0c705@linaro.org>
Date: Fri, 3 Jan 2025 16:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] tests/qtest/boot-serial-test: Initialize PL011
 Control register
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250102105822.43532-1-philmd@linaro.org>
 <20250102105822.43532-5-philmd@linaro.org> <878qrs7xhy.fsf@suse.de>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <878qrs7xhy.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: D/K1Rm87CSFr

On 3/1/25 16:00, Fabiano Rosas wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> The tests using the PL011 UART of the virt and raspi machines
>> weren't properly enabling the UART and its transmitter previous
>> to sending characters. Follow the PL011 manual initialization
>> recommendation by setting the proper bits of the control register.
>>
>> Update the ASM code prefixing:
>>
>>    *UART_CTRL = UART_ENABLE | TX_ENABLE;
>>
>> to:
>>
>>    while (true) {
>>        *UART_DATA = 'T';
>>    }
>>
>> Note, since commit 51b61dd4d56 ("hw/char/pl011: Warn when using
>> disabled transmitter") incomplete PL011 initialization can be
>> logged using the '-d guest_errors' command line option.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/boot-serial-test.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/qtest/boot-serial-test.c b/tests/qtest/boot-serial-test.c
>> index bcfa504826c..6ea7e62e076 100644
>> --- a/tests/qtest/boot-serial-test.c
>> +++ b/tests/qtest/boot-serial-test.c
>> @@ -70,15 +70,20 @@ static const uint8_t kernel_plml605[] = {
>>   };
>>   
>>   static const uint8_t bios_raspi2[] = {
>> -    0x08, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #8]   Get &UART0 */
>> +    0x10, 0x30, 0x9f, 0xe5,                 /*        ldr     r3, [pc, #8]   Get &UART0 */
> 
> The comment needs updating, no?

Oops indeed, good catch :)

    "ldr     r3, [pc, #16]"

> 
>> +    0x10, 0x20, 0x9f, 0xe5,                 /*        ldr     r2, [pc, #8]   Get &CR */
>> +    0xb0, 0x23, 0xc3, 0xe1,                 /*        strh    r2, [r3, #48]  Set CR */
>>       0x54, 0x20, 0xa0, 0xe3,                 /*        mov     r2, #'T' */
>>       0x00, 0x20, 0xc3, 0xe5,                 /* loop:  strb    r2, [r3]       *TXDAT = 'T' */
>>       0xff, 0xff, 0xff, 0xea,                 /*        b       -4             (loop) */
>>       0x00, 0x10, 0x20, 0x3f,                 /* UART0: 0x3f201000 */
>> +    0x01, 0x01, 0x00, 0x00,                 /* CR:    0x101 = UARTEN|TXE */
>>   };
>>   
>>   static const uint8_t kernel_aarch64[] = {
>>       0x02, 0x20, 0xa1, 0xd2,                 /*        mov    x2, #0x9000000  Load UART0 */
>> +    0x21, 0x20, 0x80, 0x52,                 /*        mov    w1, 0x101       CR = UARTEN|TXE */
>> +    0x41, 0x60, 0x00, 0x79,                 /*        strh   w1, [x2, #48]   Set CR */
>>       0x81, 0x0a, 0x80, 0x52,                 /*        mov    w1, #'T' */
>>       0x41, 0x00, 0x00, 0x39,                 /* loop:  strb   w1, [x2]        *TXDAT = 'T' */
>>       0xff, 0xff, 0xff, 0x17,                 /*        b      -4              (loop) */
