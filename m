Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1702659njb;
        Thu, 6 Feb 2025 09:44:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWwn1c5b7dREoxWezl1jyBMqDBzjd7IPE7waoR2X17jCwAAYqnIiJvz77VaPSWA4pfRlevi/1B5l/iJMg==@linaro.org
X-Received: by 2002:a05:6000:2a7:b0:38d:b82a:d772 with SMTP id ffacd0b85a97d-38dbb3063f0mr3464448f8f.26.1738863851817;
        Thu, 06 Feb 2025 09:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738863851; cv=none;
        d=google.com; s=arc-20240605;
        b=UpMILTok3RuGacOPPSFvd9TKVo3hmUpWVUbsIp7kRFM3V+luSEXoAwdarPCfrqVizj
         qexpQPkA4N3+uh0JQjEK817N9ceZVYK5onsHJRnKBApo3oyZwUQF/jKvhrzAryg7Q2f5
         7LqzIRahzp0qnxLweTyWeZmWMW5eN3ikTML9eptjR0D26+vBCUs6qbm23mhbDPCoQwzP
         1KjpRmXlbnuIT86KRBNI77CmhzBjn7XWd0ES48zcFb1KpFQehP+G5joEWHjrHoqBfIIk
         2PbnaLOaPs2fBK7NEWUfOIFJ1ZJwns5gSDyrfSMBH0OneVdWhcAZlpjzBYh/h0d9ZIm/
         I+7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=TEZyHg+bj35k2nBBFrqPgo/5xtqVGiO77l1MPPfSoNo=;
        fh=YELl7AZa0bdmr67hidLvWYDMLvHV3Y+gCU6wIS8PnoQ=;
        b=B5lVR7viwUkuq1ri/9FqLRMTzsdxfbC4YGdpB5slu5kaZL/Peq+37tOxjCT66qjsfv
         pYE+h/H1CXD3m0a9IycnDOiPSq3t128xnfTuZU6tJZ0RbJ6l3jlko24ezesxC4gKnUKe
         Tl4oM9bUDYess2m1VNrTDa2PSRDryyog3JzfkQ+SVtXEtH8I7p4/5fnkL9aULcRpEfZ4
         nq5Lbu8hDfnFj9pBEglqs1JUSX4HNhmsW837iFCb74xNlQqvfY31PBC1WNwngwcd3K0Q
         xI5fzTfxu0E/MHqSYbxd4vpJ40foTFIifarFlN+EztXa+Xk82vED2KnXzUyFopPKgf0K
         3K+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGbws3EX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4391dfd1f1fsor5643925e9.4.2025.02.06.09.44.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 06 Feb 2025 09:44:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGbws3EX;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738863851; x=1739468651; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TEZyHg+bj35k2nBBFrqPgo/5xtqVGiO77l1MPPfSoNo=;
        b=HGbws3EXYbKdEzXwvpTNYUrAR2XCfTDGs5kbxxNOz4uVWevPwVZ0jvb4RVHeZBnJo5
         8as95mG97I8UV+voGMSOcKKQEVosS8/TMV8uybkJ0w+RVV+LMf4cnAz4HO9SgO7auT7b
         XWuZALBUe29YJMLTEcUo09HJoQHgfK/oZmhJzbQoc4rXIqIJZuhqhiqUKf8EBkpLqFBS
         QxZfiSxTxxIeH1TFh+aKLMPowGceqs6ZwucUJJNq+TY48MIpXAwHCvo/mWqyEOtEV3q1
         +akJo5G/riVLtsZvRzxcCvGigkKt9/SRo6LIBbZwCw5OJ8drFqh+8GRCOBv4yJcg1BCY
         vm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738863851; x=1739468651;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEZyHg+bj35k2nBBFrqPgo/5xtqVGiO77l1MPPfSoNo=;
        b=pcNxnhrQcyNt0eQyTC0X4h4zKMphp62CQnZsIoLElgWMT1YRm/0D960cw+4ogmRGUC
         0DrZN3mkSwicSGbhs+cgknvPlwelKQm50Frc4DgfJUFPJIWNorv0GAh4fjdq7coG6i5T
         Ex+a5deER85VDZNBHuXgP6LEUvTNsILQvAoUb3LAOfWaZkptGeldOgTUZERhN4VsmMZx
         8Db9YlFPTC0czcx5/CQcu84gpCe+7woFYE8SeM6/p0CoyGMu6pK8Fc4LBuVWR/QruzHQ
         UhXLdVOr6xTPgVqWqNMusHyu42u5+OwmbofIgsmcpEfkhKj3kVkpm+mx9gZaWw7aEhiP
         vW/w==
X-Forwarded-Encrypted: i=1; AJvYcCVFeGmwk26mpOxisyfKISa3saPOWRvwWsNDmEyP0dZwkCKqFM1K2j/du322MSvCBns9SrcdrlqLpsddsQ==@linaro.org
X-Gm-Message-State: AOJu0YwmWbUgSiKOGV7OF3hh6vJm02gl1/HT2dhNjk9Al9AN1UpyeK3R
	W1b0bMieAbH4taRZ+36TTRJDzxrHxm98oFphBr17nU2qbTNZ363x/s6BHBAyd2G7BQ==
X-Gm-Gg: ASbGncsW04xkAiZFqmd9jawOm4DLPfSOOy+pKoy9Wg5LzSwjZ4Kv8c5QJtPrllPKNWj
	wqW5t2M3HsZa/4Tu3CI+UkwRr5kFCmdmlxbfMYIXfsBgTMM6K75fl8vRBNbfF9MbNaS+rSy60mn
	4598gc7Bgn+rINjso7GEoMeyNti2TJ7hcoCibUOyh6sYE4K2ms+beRqg69wTXyJPilhFVqDopIN
	th39/ub/Hqy0iB1wXpkhTyIhpMhiU2TWl65et0fUadTH7orMRksQBzMz1A/z7BZGNhrxx1lS7RJ
	QXndNexMdvl8qghMA0abog1+6Vb6fMbYNKYhEvuyCqjNDfkjdNCR0CY8sa8=
X-Google-Smtp-Source: AGHT+IEmNawCWUy80Kgnx7DUllCsnn/fPm/Hj7cpmj76EavKTXA+5NfdwanjKohiX+yB4z7etOYXLQ==
X-Received: by 2002:a05:600c:3b11:b0:436:76bf:51cc with SMTP id 5b1f17b1804b1-43912d3f063mr30219515e9.12.1738863851260;
        Thu, 06 Feb 2025 09:44:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf7dbcsm63160665e9.30.2025.02.06.09.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 09:44:10 -0800 (PST)
Message-ID: <60340d70-e307-44df-9f4f-fffdb6a440e6@linaro.org>
Date: Thu, 6 Feb 2025 18:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/16] hw/microblaze: Support various endianness for
 s3adsp1800 machines
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>
References: <20250206131052.30207-1-philmd@linaro.org>
 <20250206131052.30207-12-philmd@linaro.org> <Z6S3Mgt1G7fIjeBB@redhat.com>
 <4624f149-76d0-4da5-8f13-8c015043c335@linaro.org>
 <Z6THtfjL6UVhBiW7@redhat.com>
 <3156dc3b-9553-4b5f-a934-f29ee0601887@linaro.org>
 <CAMo8BfJrzj1rERAXXZ8dfVYjnD744mCdCcNUuB1qeqD45dTUAA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAMo8BfJrzj1rERAXXZ8dfVYjnD744mCdCcNUuB1qeqD45dTUAA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IkUGC3TM2oXE

On 6/2/25 18:34, Max Filippov wrote:
> On Thu, Feb 6, 2025 at 7:04 AM Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>> On 6/2/25 15:31, Daniel P. Berrangé wrote:
>>> We would pick an arbitrary endianness of our choosing
>>> I guess. How does this work in physical machines ? Is
>>> the choice of endianess a firmware setting, or a choice
>>> by the vendor when manufacturing in some way ?
>>
>> Like MIPS*, SH4* and Xtensa*, it is a jumper on the board
>> (wired to a CPU pin which is sampled once at cold reset).
> 
> This is not exactly the case for xtensa. Each xtensa CPU is either
> big- or little-endian and it's a static property of the CPU
> configuration. On physical machines it's either fixed (e.g. if
> the CPU is a part of an ASIC), or it's a part of a bitstream that
> gets loaded into an FPGA and there may be a selector for one
> of the bitstreams in the onboard FLASH. In either case there's
> normally no board-level switch for the CPU endianness.

Yes, this is what we meant in QEMU terms, "static property".

> Also big- and little-endian instruction encodings are different on
> otherwise identical xtensa CPUs.

This is handled within the CPU decode logic, and doesn't have to
be exposed. IOW, we don't need 2 distinct TCG frontends to decode
the Xtensa ISA.
