Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2397891wrp;
        Thu, 26 Sep 2019 10:11:09 -0700 (PDT)
X-Received: by 2002:aa7:8816:: with SMTP id c22mr4950150pfo.197.1569517869711;
        Thu, 26 Sep 2019 10:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569517869; cv=none;
        d=google.com; s=arc-20160816;
        b=ky/ZbQxCb3QYR2b/QgtxTsKQ/JD31aQ6aOWx4ga+IKGYO5tlU1NAxsiiTthB+iVgM1
         Kxm5hwqqTHp3GLrNtSjYq27/uleFbgFSsA5fCEF685JlJccChdmrj8WNQQm57bVFXFAB
         UhDzAjQobD2p8eXjhWkKUsvXQRqHKWdo6vqzJJ5ASeQPbLCphkGTpvF9z9JMR4fz75Lo
         8AWr+9V9IA2ZHDxLKR8d/U8gL2ILb2yij1EG90akYacfR0uITXi39MyZ01keVophYjmL
         sxkSteC3cfKSxX5QHoqCnBix308uG6VmezdAtYvE3tFbeb6MtIo2z8zUXHcPG7e3AFl9
         wh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=9SeAmBswGPUU/7s1XP2AkyYn8Y1JWganLEKiKSJadmw=;
        b=i/BF2JiTPMYDXMWqChbedqG5JsHnp6aFD12ZnJZrKtKEyO11i44C7aLYu/gM8lKXUq
         v3QTm3QLCcl06ObpoIYsFO3MOiN6qjk7Pn2qXdqD1mvx7OVvClWSmu/0+rs++PM97x9+
         vIEY0zqBzg2L8grFGffarkMRpMfneXIWzz1J1g4hnbULQzkmBdefM4c8wCgHR3moYp/v
         oKtNS73rcG/DMYO1WLjc/uCcl7jnIBXx+3k6D4DvXeOHP+mqZ3A6f1HZQRgYwn4r9Ort
         faN9QXfff3R5QOY2b932j8TF7/wJuD/aHfZRtGXjNJPf6GaxoiIIEykSaiCJBQkPO2SC
         pe2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOUa2Yg3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id w197sor3206282pfd.19.2019.09.26.10.11.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 26 Sep 2019 10:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HOUa2Yg3;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9SeAmBswGPUU/7s1XP2AkyYn8Y1JWganLEKiKSJadmw=;
        b=HOUa2Yg3NKZH23KPRP27i1SuQYGPZ0ioWma8hZRodfHbySuHPCAeela1Euern5q3ra
         Fz7qksFFNuCiBRxT3m+9l3nJxQMAUO5CfpSYeiI5E93O1tblteC0Q4XKWS9ag7mCsfS4
         ATGtHARHsrR8L1EnufpviMg5KfYZco+QKqOPcFoypHY8MW8SdspJPUSL1Dr32OUu0C0s
         xWs9W1brPzf+GqH2vkGXX3z9mAwfQAlkg30XaODDZdu12DKT10IPcScdBr3jbZ/SsPRM
         /fl4oDZY2MaCDxR7WeobbISX9f9Z+bBDTURjo7oh3PF7CBnkZjE+ivMuYISqSqAaGmrG
         +j2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9SeAmBswGPUU/7s1XP2AkyYn8Y1JWganLEKiKSJadmw=;
        b=e3Kzn9CvlzaxRCsKvs1SO1iDAwnmjmtDrGZGZG435j8oO+R+O02ijJ8AlXMRVH62fY
         peFbkpa/5/ZkGQXFqIZI4sOWEExnN5ls6pfvMGtAlHZcRPHEv0CKNrwK8YmNKlxv7UsW
         kDbNZFxBEr2nvI3VAbKG4Yfk4Y8AUqOgiGMgENUZItxRdkKgG0cj1OFXz2erzmgiYZuw
         r6YyRX9MSeGuRRqtomW4v4n1eTQGQ3V2KOaI2zGbvL2otd64adKIDppn509IFxAWit4m
         +sXLToaor5QX2Q3N/lAm9tb/6Okm7q/dVPMeflpeeVUGU7uVrCONgXLEJwKH71lpU98q
         tUmQ==
X-Gm-Message-State: APjAAAW1+lmjywfjwgX3k4csgndgMtuxNv/M5AQ2X2wwZL/jtAhy24mA
	76afL2UhryY9lux2omkDy/MvqBNYEwdlEg==
X-Google-Smtp-Source: APXvYqwuZdwdokxX7L2XLlS5TdmlGrJY1vSMMT7B6mTyEQmDtdAcjlg5kPy2z3STwqoZ2VqMANAWQg==
X-Received: by 2002:a62:8209:: with SMTP id w9mr4981825pfd.112.1569517869117;
        Thu, 26 Sep 2019 10:11:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.32.216] ([12.157.10.114])
        by smtp.gmail.com with ESMTPSA id c128sm4188974pfc.166.2019.09.26.10.11.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 10:11:07 -0700 (PDT)
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-ppc@nongnnu.org
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org>
Date: Thu, 26 Sep 2019 10:11:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 03u1/EhykV5y

On 9/26/19 12:50 AM, Peter Maydell wrote:
> On Thu, 26 Sep 2019 at 00:31, Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>> The 32 bit hosts are already a second class citizen especially with
>> support for running 64 bit guests under TCG. We are also limited by
>> testing as actual working 32 bit machines are getting quite rare in
>> developers personal menageries. For TCG supporting newer types like
>> Int128 is a lot harder with 32 bit calling conventions compared to
>> their larger bit sized cousins. Fundamentally address space is the
>> most useful thing for the translator to have even for a 32 bit guest a
>> 32 bit host is quite constrained.
>>
>> As far as I'm aware 32 bit KVM users are even less numerous. Even
>> ILP32 doesn't make much sense given the address space QEMU needs to
>> manage.
> 
> For KVM we should wait until the kernel chooses to drop support,
> I think.

Agreed.  I think this discussion should be more about TCG.

>> @@ -745,19 +744,22 @@ case "$cpu" in
>>    ;;
>>    armv*b|armv*l|arm)
>>      cpu="arm"
>> -    supported_cpu="yes"
>>    ;;
> 
> I'll leave others to voice opinions about their architectures,
> but I still have 32-bit arm in my test set for builds, and
> I'm pretty sure we have users (raspi users, for a start).

I'd really like to know what raspi users might be using qemu for.  Depending on
that answer, perhaps it would be sufficient for arm32 tcg to only support
32-bit guests.

For context, the discussion that Alex and I were having was about int128_t, and
how to support that directly in tcg (especially to/from helpers), and how that
might be vastly easier if we didn't have to consider 32-bit hosts.


r~
