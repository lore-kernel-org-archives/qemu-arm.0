Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp653024lfr;
        Thu, 15 Apr 2021 08:55:19 -0700 (PDT)
X-Received: by 2002:adf:bc09:: with SMTP id s9mr4181414wrg.329.1618502119550;
        Thu, 15 Apr 2021 08:55:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618502119; cv=none;
        d=google.com; s=arc-20160816;
        b=nUyFmzSKBHZXGLzAVHl5VYBpfTkxU8oBHdlPkZ2l4tVDVFUVPCc40Gx38BKp0rpxJs
         0BzzC+rEDtkbgmVsWQArhM4z5CvIhzjwlFE0sXuMq5pKhhyV8rCT2EGfB3HGvA4jeX5i
         hv+RzPpgd8C/3+sAhm3n9vU4VoldP0B2swSy00bW+A/+N4mL0gmEoPeBjdi5W7Mk1ez3
         pSBTMT6trO4T/cABvzUOq+mWJDS18F1kdXdi4Q7Q85KErizCpLIkybZcoobEe9V8W5Ip
         f5zHMeGoyACgX47FB7+wzeqpZ5vE4H2oW3FNQQT5DyUlLo0WDzxyl+slv1mMfy++LsIG
         C8sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=1iJlHk6v/UUiwwngJCIvEQtApBK1nE4RmsWgnACZLdY=;
        b=ZmZXcjIqXjJQo2crbmLns7qlb9Hc1J5dpP6iLLEYYH8y5YmuRUg2adTADW0ZwSDp4l
         ZaQWb+lbkRhPMnsL544smszDiYVCDItN7qmHkNr6yhumXGqK3KGVQrs6nuZCpch/U5/+
         ZAHPhxchKkNTAgLGt7MQwZX7djE3O7i6TDS4YAZIB/Cfbze5SqaokqjAbd6oZND7fJXn
         OT6QOIzC0AiiAqPQJZIgI8iNcg7pomOMfIp/216hb8vRcSaL6Ej6E8+mzmnA869pUyy/
         loFVU6jW14YUNwAocRLcmedAb5vQRN5Po/c0MowxgZJAmRJhgcv0bkPJce3DmYpq1On4
         cZDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CiA6EWFa;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l185sor1514241wml.28.2021.04.15.08.55.19
        (Google Transport Security);
        Thu, 15 Apr 2021 08:55:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=CiA6EWFa;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1iJlHk6v/UUiwwngJCIvEQtApBK1nE4RmsWgnACZLdY=;
        b=CiA6EWFazR/n0+oGCWpcZk0q82xrqft8bMsUK6WxO+P/6wyul5H14Av1buND1hEvi0
         YPuM+enAI3s8/jjadhd9sm2cIt5W5Sau96EjF30C8r04cOQ91m0wgoKzjSJrMh0gsB2J
         kNpDMfyt1n+Jun7YFPn2byfKF7HlY+twHPDNBI/5kAQE/NJpTOQttzY8SFjUZeMH+PQz
         tSp8Z+h5bmtl7uoeQ78lhvZDZChZQZLcq8Z46PBIyXk2aLGo4g5sciO2gxgJxjGpEz61
         qQsHYfcoyX7NIIhgmuPPiB4eijB0QK/Ich3mmyoQ88pYECKWc2x00vIW434Cry81uH6p
         lsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1iJlHk6v/UUiwwngJCIvEQtApBK1nE4RmsWgnACZLdY=;
        b=UK5TbYd3dqxcrYrFk436MMJzFntX8XUfBXe/j6aGdx4JpcCEWWWu2Medd6JpV5Rgq5
         6tr7+xw7RXjGEhUlV4t6qCEIqis8k0gG38l+NvUxahbqIltMJpJppWWkGzpfn7dTBFgt
         C/6vuUezVmav5R5qCnJmhkZ48z074yV9kHmVXQHlkbzLmsg09C3+p01pFhBsu8hMjqbp
         YjU5G+Yf853zURDs0gEGGFcW9HoMHXeIaj7jxrtgM2GqRR5V52XSedasEjHC44taN9tq
         T7wkzgpN787QSVEMR2q03IbEpM4qTrrccNBTIrYIqRkJWjf2xDF/ZAX6HIKggFmQgjc0
         rH9w==
X-Gm-Message-State: AOAM5331/Tpi64j+Bo09k9gwjPk4aqbyeYhOTdCWhCF4h+sSnfAGTwzx
	MZwDAVh8pCpdH34P+c8/jZ8wOey5DCo=
X-Google-Smtp-Source: ABdhPJxmXHrZLcCq62I9Q3o0+wqhE+Rlk4V6aHko4Zw3jPt0RyhoT/FARIcmY2uhCkIzdZzsKLiu/Q==
X-Received: by 2002:a1c:b457:: with SMTP id d84mr3825603wmf.169.1618502119320;
        Thu, 15 Apr 2021 08:55:19 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net. [81.40.121.39])
        by smtp.gmail.com with ESMTPSA id g132sm3565620wmg.42.2021.04.15.08.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Apr 2021 08:55:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PULL 18/23] accel/tcg: re-factor non-RAM execution code
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cedric Le Goater <clg@fr.ibm.com>, qemu-arm <qemu-arm@nongnu.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
 <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
Date: Thu, 15 Apr 2021 17:55:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: GDuEiQ6jxKCc

On 4/15/21 4:54 PM, Peter Maydell wrote:
> On Thu, 15 Apr 2021 at 15:32, Alex Bennée <alex.bennee@linaro.org> wrote:
>> --8<---------------cut here---------------start------------->8---
>> accel/tcg: avoid re-translating one-shot instructions
>>
>> By definition a single instruction is capable of being an IO
>> instruction. This avoids a problem of triggering a cpu_io_recompile on
>> a non-cached translation which would only do exactly this anyway.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> accel/tcg/translate-all.c | 2 +-
>>
>> modified   accel/tcg/translate-all.c
>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
>>
>>      if (phys_pc == -1) {
>>          /* Generate a one-shot TB with 1 insn in it */
>> -        cflags = (cflags & ~CF_COUNT_MASK) | 1;
>> +        cflags = (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
>>      }
>>
>>      max_insns = cflags & CF_COUNT_MASK;
>> --8<---------------cut here---------------end--------------->8---
> 
> Yes, this fixes the problem. Do we want to put this in for 6.0? My
> feeling is that executing from non-RAM is pretty niche, so maybe
> if we need an rc4 anyway, but this isn't important enough to cause an
> rc4 itself.

Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing Cédric).
