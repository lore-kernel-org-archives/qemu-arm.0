Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3044889dye;
        Tue, 1 Jul 2025 03:11:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0njKH1bAU6+rzMAPdSLb1/YzeAF54V4J//2ECgyhELUWLwsUbjAXCypd3/jyF5M4Q6VEELnji8wB58g==@linaro.org
X-Received: by 2002:a05:600c:4ed2:b0:453:7b2b:ed2e with SMTP id 5b1f17b1804b1-4538ee8cb15mr166395445e9.24.1751364691638;
        Tue, 01 Jul 2025 03:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751364691; cv=none;
        d=google.com; s=arc-20240605;
        b=MuHJen0GWolHecXRNqUdgM0R9s88iBPWsn053fbhswxefCE0zqDu8YBwW0xim4ThC4
         SEpGJPfHo4hKgeVZdDbPlWEzYWNEPXziWSFVPgdwc3/QGdySkIolixIRoGdwVYoWz2ek
         dOwMAptceDGPuxeObtVpXsVcM+y5Qf37HF2GmKr8QjNjhLOx4Pfx5R5vaJINeIZJQzeF
         +IqkMAN3WyJ7nIh2DNix7dZ4HXD243THiiZkzEu5GOVnvACDMMEc6T9/+mkKd4OvnSIW
         gQ3gzjfKVnF5h7r8aCwteD+gAfsT7mwm0IXADqpK/EqsWAJGOhe3PNbnEMAkX6ns7s0M
         3N9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xukDN3H63LwhhQewlIjnzCHEaos/m6LMLbLr7A6Mjes=;
        fh=NGpPiN+DnMTp/AsXcVvVscpePdeG8hgK5Pbt0P4+p9c=;
        b=VtmVegF83fXv5e5WRVTR062Qn1JO6RkBeNSMIrSDV1ZDqxaDNXvmYSOv29+Mn7dYXw
         7zcGfK5VfoJuTLHBSK1OFhyn7Ud3nRUtNs3TCK9iycNcZkYOpWhhSLN9GXJxiyaQ8g5/
         +OEeX9jTMWdUnPToD+Zv/JYKA7sqVs/DBLpugQWNQnf9GI6p52aDS+SNGjLMkPko59Mb
         3y5DsS5Q0d3bk2LhcplLexjgDEf2fxLqoYmXpT7dEBtmgJD3aHY3SB3CfmCBVL5dCCYe
         BTuyhc+s2z8BrZDAZ5BAicvRLYjj1zK7cXi3khXce4qcmCdD6/wJE4Q5OP2ZP64yEcz8
         i+xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TunWQn1P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4539120a895sor35133815e9.11.2025.07.01.03.11.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 03:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TunWQn1P;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751364691; x=1751969491; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xukDN3H63LwhhQewlIjnzCHEaos/m6LMLbLr7A6Mjes=;
        b=TunWQn1PEC+vH76T8M5+4ysqMLC/OT6lrYn/TKe4Tbk2XUTQDJV0D7/nv1HLEbAucc
         TS/KntSCgbpk/P1OI8m/hP6YONbxLSRfd8KJGUDRilBH1bKoRuGSCsHV3UPZpmPoSqMz
         oedAj3JRRsQByRwrE4b0+3IxxSSahRKCZjQp6yDeCl6GdvOBXlGdvNhOgA7sWflFDjub
         x/JbV1OvqOhXQWwwdsSYiE6J2OznxooKE8ZgN3nLcJz6G1GFQlvXEOOBt+Djm6HdG669
         KoRu/ly9TwU1kmQ2dNMoKuKZR+SIhgdeoleEM2Ik4JMZaQUjP5MSYVFMyhsLjCi+U5ME
         2Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364691; x=1751969491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xukDN3H63LwhhQewlIjnzCHEaos/m6LMLbLr7A6Mjes=;
        b=Y1+OUn1fUZyCcGyq9QxYGKodHeiFkcvHYhbK0SoV8iqmEzbVe8pVB7N6czNA4FeiEH
         U5g+8yPQHtS1LjdajAOBeAzzJlKTqkO4QrmFW5hBwdcWzp8A/JYcU0SoCZ745rUYag3w
         3M3EwsgyVOM5PzMIiBNTrPNGcFbe1nVVDjf9QHQhdkeaquJaih3S1gDPiSvGo3ofjc+H
         s+qrC6b3tuhWyNMcvZ1wCXXAAcFToX70J6pUGl99Fhp0X2ha81a6UyQAn2XdbB1n87qy
         6SWJR05fdaVF4c/KksIbUgB3pECctmNGfoPQtKSwix0ypInMDLaApVs7W6p+yS0hVyQt
         z+mQ==
X-Forwarded-Encrypted: i=1; AJvYcCU44HbJjJQQR+shyQRhDJfzKtH0QVr6faxrhtdh7wgON8motsEa1xibYdBN3h1DQRNC1NtjXI4Be42w6w==@linaro.org
X-Gm-Message-State: AOJu0YzJFxnMOTvgKvWeM7Z+il8GF3266l7TINpUmxkxkld0Z9X6F9Ts
	xYSDbXx2phmfvZ7yb5UvoPfAmvZBqembpQoyMwSd9as/tBwxjfOTcLTfW5EmZhrZLJU3yw==
X-Gm-Gg: ASbGncsw536QF7mcgFu/suobNdb7LzoZFkkAEf4Z96OR9ljyKovTfl8MkMXrQAISQY1
	JgLaa2zIDM+90PRqeIJOqcLb4d7MYm5Zp0923KaTf3paAqmtKhrTESjwArmQHvvN1ernLskbaTn
	5jE3tpXDG/Uk1oHZd6dQ4lJJ4kjM67XHL7SqQ3GFAhBXpvsx46c1Hw6Bm+/tmMpQfC4Mr17Flg4
	fI9BzuVp5r6eOjtwLHpY2RBdkdgJyOrk81vCOux9NTq0ExT49MjgnTgrLumunf+zfLW3wtw4rPS
	60g8YhWnBW9zlzbgphdOMUD5wPn/BvLw5M12s8JELCHpHZsWuG7Kyj9DWPesTrMCekVuoFyUqUG
	aXDniaZHtXG6HrQFVxERR7qCflhpq4ITOL9XsEyaf
X-Google-Smtp-Source: AGHT+IFJ2dzhbA7AS66Am/DJLv0M0N+kubAZsKkWqs3D2gOnCtcFq+eIstRODMqR92FI66ozNZuD7w==
X-Received: by 2002:a05:600c:4594:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-4538ee8c45emr157635275e9.25.1751364690947;
        Tue, 01 Jul 2025 03:11:30 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.166] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm191355995e9.5.2025.07.01.03.11.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:11:30 -0700 (PDT)
Message-ID: <8d72bfca-b79d-431b-b9c9-8e21fccd22f4@linaro.org>
Date: Tue, 1 Jul 2025 12:11:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/26] hw/arm/virt: Only require TCG || QTest to use
 TrustZone
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
 <20250623121845.7214-19-philmd@linaro.org>
 <CAFEAcA_M+nXYL5HaN7QUUwWywJw8VaxU3T54YCMQsVd42PQ+PA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA_M+nXYL5HaN7QUUwWywJw8VaxU3T54YCMQsVd42PQ+PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 1S1+tTjrlX4z

On 1/7/25 12:05, Peter Maydell wrote:
> On Mon, 23 Jun 2025 at 13:20, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> We only need TCG (or QTest) to use TrustZone, whether
>> KVM or HVF are used is not relevant.
>>
>> Reported-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   hw/arm/virt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 99fde5836c9..b49d8579161 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2203,7 +2203,7 @@ static void machvirt_init(MachineState *machine)
>>           exit(1);
>>       }
>>
>> -    if (vms->secure && (kvm_enabled() || hvf_enabled())) {
>> +    if (vms->secure && !tcg_enabled() && !qtest_enabled()) {
>>           error_report("mach-virt: %s does not support providing "
>>                        "Security extensions (TrustZone) to the guest CPU",
>>                        current_accel_name());
> 
> The change is fine, but the commit message is odd. You
> only get to pick one accelerator. The reason for preferring
> "fail unless accelerator A or B" over "fail if accelerator
> C or D" is that if/when we add a new accelerator type E
> we want the default to be "fail". Then the person implementing
> the new accelerator can add E to the accept-list if they
> implement support for an EL3 guest.
> 
> For the not-yet-implemented case of a hybrid hvf+TCG
> accelerator, it's not clear what to do: in some cases
> where we check the accelerator type you'll want it to
> act like TCG, and sometimes like hvf.

In that case we want to defer to the accelerator, not block
from the machine init.

BTW hybrid hw/sw accelerators *is* implemented, but not yet ready
to be merged:
https://lore.kernel.org/qemu-devel/20250620172751.94231-1-philmd@linaro.org/


> 
> I'll take these patches, with an updated commit message.

Thank you!
