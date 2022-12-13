Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4356155ejb;
        Tue, 13 Dec 2022 08:10:31 -0800 (PST)
X-Received: by 2002:a05:600c:502c:b0:3cf:900c:de6b with SMTP id n44-20020a05600c502c00b003cf900cde6bmr16138666wmr.15.1670947831038;
        Tue, 13 Dec 2022 08:10:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670947831; cv=none;
        d=google.com; s=arc-20160816;
        b=Z2eTrAanbuJe1CtYARbzzigWyL43f6GbczHejnl9xFq0aRqR+V6KCoNWqEuuDRhkLn
         LSPkZbvhd5PANXu4umZTOQPUVFvPSDanqGxKn7T4nhRIuw2BdmqLKhm9wtQWZQfsHuwk
         BQAamyrpB9H2jsRIil2vJvyYvvdsIk6mFDycMP+xJ/U9AC/mUPbrHyEQRA0+njB5hlgP
         HAccHKutd8kqUsEV5nyRvIqYL8vC4GY//5n23OxuWnqa/QYx8kH1b94enJeMzc8Ag0pN
         uVvLtE1cv66cGSAX+Lhg1vTpdivtmqeTBnQsX6t/2wxzhxv3PrcZMwpUSjRoPs6RvmYM
         Kdeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5dXN+CD9lhvHiIWiOWgMOkBgxkPBCH5Ovu3I4CfrvzA=;
        b=KBl/vEOt5ax8nL3RXnXvMKLsB0GETqGmHEMmYMCpB5V6LiM8XAxFpwXX+7rR7d76lE
         EHzp1+WBDWdU+LFADCmitC+7hEbg1qF5pyzxh0UM0nItZOE7kiAcEk87p5q3klkLbgu7
         /HElJIm69WEuI5UelVxkndWuiUMuDoA0wgPH8QcTIQOEu4D2x6Mu68totXd5HtWMkIl7
         a5pT6FkHeHxB0K8ju9nQmwhlJx8t2BWWpDfiF6yD5oi6kW27K242kfaV4YJ+/RVqLoUL
         FzjswGEKkTzOMm1IKPkdSjQjklLMzjTlXc2JanCr0gbCteL6KjgMtmXDqsH8wG8vbR8Z
         LQ4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LHGExF3Z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q9-20020a7bce89000000b003cf5ec5cd24sor2979816wmj.16.2022.12.13.08.10.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 13 Dec 2022 08:10:31 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LHGExF3Z;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5dXN+CD9lhvHiIWiOWgMOkBgxkPBCH5Ovu3I4CfrvzA=;
        b=LHGExF3ZGVk6W8rebTBqv4sSEpWTJi+0k2MA1ZMXftD3i0RrkJRFASer8K/VvsW8qZ
         CxDLbuPDbc+ZnjkhvhyoTrbwcs8ld8QxqERhXyr7FC3ZKZ6cPKXogdQH8FdwZaTkIxJi
         CNMnSFskiBroDNtTw/BIvQu0pyxVRxS6apfEO6bKxJmcfKAdvRPbZxVg1pHRIQWW5dQO
         hrYlcNSlWSQlj5t3ka7XZoqd6e1I5aVMKJrUTX3u+WeouLS0JI1e4cPUJx89YTUenbTq
         scuXh1OrcCIHLu5gJg9SfMv4dq3w7c3I0yeennsNYDHVrV0oYwp3VYQ5WueimrEBFBSP
         sEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dXN+CD9lhvHiIWiOWgMOkBgxkPBCH5Ovu3I4CfrvzA=;
        b=h/rxJ80XKAPRKoHhGbgtzM0msJfIF1x4/pvJg0BxqYR1WrYZEyQPc2et7Fk3uwwh3d
         PNPrvl19xv65VKEbsXQI0jsM85S2ZpEGAtxXWzwlPnMgdJMD2TFC1R0NQwXa+UMy8TlB
         cr8nLebZbnbJJEHQLsmBE6S8+6JzDXYA7KJOO8DA+RGSVUwenJ/QSf+38zqsk9OpWrjB
         AYmnT6EjCiXyPcqoHNODO/YRnfahijEVw9Het/1ExvS7mfV7RciDXaOFi+sFwMvTULzn
         zFyG51tbGdR/oQ3WFdcHHu6rIy88HsKBZvPvYyBhhT28XvQq9ZR1GO3jZ4GDnGqjjER1
         JmPA==
X-Gm-Message-State: ANoB5pkYEVvIRolm0s+p7ivI6BGWw+BLmTd/dTn+TcNSP76SiHTkxxZG
	pVDNNIGNwEp278+698o0wMD1SFCK
X-Google-Smtp-Source: AA0mqf5lwiCvJ8yWeCxX6DBFqysh0TogBoDVGoIJdVUNTXaVmpG5DlPodPhR+3eVCgqm/5eNUc/usg==
X-Received: by 2002:a05:600c:35cd:b0:3cf:973e:c874 with SMTP id r13-20020a05600c35cd00b003cf973ec874mr16008397wmq.14.1670947830764;
        Tue, 13 Dec 2022 08:10:30 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id iz2-20020a05600c554200b003cf78aafdd7sm13352584wmb.39.2022.12.13.08.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 08:10:30 -0800 (PST)
Message-ID: <d73fe725-565e-7fcb-e7d3-846189459545@linaro.org>
Date: Tue, 13 Dec 2022 17:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [RFC PATCH-for-8.0 1/3] hw/ppc: Replace tswap32() by const_le32()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Alistair Francis <alistair@alistair23.me>,
 David Gibson <david@gibson.dropbear.id.au>, Jason Wang
 <jasowang@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-ppc@nongnu.org
References: <20221213125218.39868-1-philmd@linaro.org>
 <20221213125218.39868-2-philmd@linaro.org>
 <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <8d47b826-2011-3203-c682-aa32a76b8dc2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Bnq9UBNHYycw

On 13/12/22 17:00, Richard Henderson wrote:
> On 12/13/22 06:52, Philippe Mathieu-Daudé wrote:
>> Assuming the developers of commits 2c50e26efd ("powerpc: Add
>> a virtex5 ml507 refdesign board") and 4b387f9ee1 ("ppc: Add
>> aCube Sam460ex board") were testing on a little-endian setup,
>> they meant to use const_le32() instead of tswap32() here,
>> since tswap32() depends on the host endianness.
> 
> tswap depends on target endianness.

Yes, it depends on both host/target endianness. What I meant
is we shouldn't have system code depending on host endianness.

(I'm trying to reduce it to semihosting / user-emulation).

>> @@ -255,7 +256,7 @@ static void main_cpu_reset(void *opaque)
>>           /* Create a mapping for the kernel.  */
>>           mmubooke_create_initial_mapping(env, 0, 0);
>> -        env->gpr[6] = tswap32(EPAPR_MAGIC);
>> +        env->gpr[6] = const_le32(EPAPR_MAGIC);
> 
> I think this is probably wrong.

Since this is used for the kernel, I'll try to get its endianness
from the load_kernel() calls.
