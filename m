Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp1649968njj;
        Sat, 3 May 2025 15:20:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUe63KXdDxEbeWexQbzf88AWI2hIjSGkNmNWJBOWp6KjnG2imVQdsTd4N9KPzzA/4+ICKza7XVS1V4keA==@linaro.org
X-Received: by 2002:a17:902:fc84:b0:223:64bb:f657 with SMTP id d9443c01a7336-22e1ec35548mr31985365ad.46.1746310837907;
        Sat, 03 May 2025 15:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746310837; cv=none;
        d=google.com; s=arc-20240605;
        b=bXD8enclymE2Vy5aDzO9SfiC5/asQAXql05wVk9Sv5tQE/qGPjxtnbHAu84qEoM5+8
         louuW52rSWHXUKqxhS8F0cpziDPm7+QpVzJ+MYY5MEmpTEV//K0IYDmH2EUYsRvvlrUw
         In30pcOKc4+IaE0wdrGbaysN9a20KQtg3OwFz14DjmhgsHWdcq6zIm7hy814duWPtlYz
         +e0cTCdzZjAoFJNOCq1g9gDOtpCZwRCGcYGkH4uayLigxx7QtwSlE+CNwv0vNd/7lIYo
         zbzdWx5uhJQA7wl0IySLE6KuPaCinGfEexCn2IPqqJ+nKVDMK8yNPQmnuOKy8ziEQm3t
         7O4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=U3XNTdWrjdDo0RP0WVFaZKWtTI+X6cTatFOOc4Qu1dY=;
        fh=d70v2V0JCX9u+l9HjqI/Khvmc8b2T6dvbZ7tzUtEf8A=;
        b=id8eZBDjXeyhmbDFAjolrIDLcQU2a8n7j+w4+R82KRM0jDgYxnGGvpXTARJMhIv+Li
         1EuYiF8oKVe0/HE3Qr3vejX4mnCgBx8/mKu+kBEplmRjeJ0xa1sDDjLvAvOuzBq/FBpR
         j19289QGply8aBQixHKWnD7QHQENHUxEnjtNE/pxa8l+9tOPA0DS/IFVbD3Dv00oteWq
         JyTm53VcIzVq67uxzi0PbtQT6uXKI7OEra2QT40bHTappoGH19wDWCaRHuZshiHTMHDk
         j8teto3XKcY0DhYdRdWXiSdF0DwPwMq5nkDzcYxBJ1boq9eeAqJ+WaIpVfPb0Rz2fkGD
         FQ8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FelPG8sR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22e0bb1957csor31293815ad.2.2025.05.03.15.20.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 May 2025 15:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FelPG8sR;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746310837; x=1746915637; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3XNTdWrjdDo0RP0WVFaZKWtTI+X6cTatFOOc4Qu1dY=;
        b=FelPG8sR5xnwikRpJDelFaFa86Ab3DcG4BY6kST0NNkOOlJ6ZlHYjnLyf6uNMgETwY
         a2eZYF2Rp7CTn/gEiXJ2WWU9d/RRrr13GwfDpOs2y4XGKBoDQUYhTN5Bw4JKyJdI5FU6
         FHZGELGDPWfrsIiWzCeCtQZHogxEsWB13azv8oOSpZ1P+FdyQFOLIX7Sm5ksnzaLUcdE
         cc81KPLHHaMBMpxRr/J8FG0UHzjjM/D55bL/NYcYgZZyeo6gGJCB6RybLr7vQIIKVFan
         iRXiCda+UG7w0Rt9p0He5jrmy781a90DJwJyseNr+utHdG5Xpb8N4IpKpV5D2pveVNFx
         +KLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746310837; x=1746915637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U3XNTdWrjdDo0RP0WVFaZKWtTI+X6cTatFOOc4Qu1dY=;
        b=UzmzmuTdAVoq0pN+u+LNV5eJddiyp5sfnJSH9jQx4hzohpEhFSSGEpUgTrEppJQM13
         PmCifQgpeec/OU3st4DiK3UhmtJsuTKxOIDpdJqRDgd9sIu7q5e3vTS/VuwGyKhqhz4z
         28Tr8EkRm9/hZZvLi2AawG/dcKcunVFP0q5eQmiVcG3Al/XKnwBwS5inPvb1kquvXpuz
         9XRwI6BAxaTRsCSBg6zTa0AAFSPs5QAVzgLBKyMl0eDm8Nuh089rR52Q89LDmufkd8tN
         efK2ENXkF0fJGI4JYSkBIG+zNRer932X44nGB/v+QWw8yeooB+gdK8/ay48kb/A/Bc3e
         T1qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWb7bvFp9pFZjXX43ObyeWLnqJB0J8Sxz0hhz4f40p53jewCNqrBKyTlgHdnC0sQl+VGOnv6B0N09c+dg==@linaro.org
X-Gm-Message-State: AOJu0YxaqNzpQKn3PyA+9v6XyEMf3zwNDNJe0CDOarU2AbukYIgte5ja
	Pee2NuptESBMPSxVTDGIUYYOXqap3StUYKwokhNs6Xe6vo3JDs9vDdIp5KcjvpImOQ==
X-Gm-Gg: ASbGncuIreQ11aVym2YfH3uIA58PmCTNTi8jiQJM+976K59o8ViWXyn05CzntriCnhW
	PSSu9Hp97JxontrvoyPHTqC8n7sf/Xyc/WOKubtdG/ACSpBV1Q7TTdocb3GkDmv49VJU3VVdrW/
	GZV+aBP1oG3mXoACr9T6MFMo+iuCkE1vWKODh9deSpz4eXi+tp8joH6s2HVZiyWLk4G/xbxPC20
	C1UcCOb9JGdWnJ/P5El5vamij/ytQ9470MEKnlSetmse9V9Nv8YPpea/GK5gPPfVdw+wrEXjJ7A
	Cpj4nXdJI3CnhycBIFNC0La4KvwISt7ShEx8hM/q4b6vcBrF94YfTg==
X-Google-Smtp-Source: AGHT+IG4xBk92Qmb14P3SC+6ErM2U8xgJgOkMaOYZto9rl9Jd5cV8hSFLDBqFi+G7UEQYoIMjleG3Q==
X-Received: by 2002:a17:902:da86:b0:220:e1e6:4457 with SMTP id d9443c01a7336-22e1ea969a0mr29683305ad.26.1746310837360;
        Sat, 03 May 2025 15:20:37 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590610desm3936800b3a.146.2025.05.03.15.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 May 2025 15:20:36 -0700 (PDT)
Message-ID: <a5b6548e-b4c3-4e7e-a683-ebb0243154ff@linaro.org>
Date: Sat, 3 May 2025 15:20:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/33] target/arm/helper: replace target_ulong by vaddr
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, anjo@rev.ng, kvm@vger.kernel.org
References: <20250501062344.2526061-1-pierrick.bouvier@linaro.org>
 <20250501062344.2526061-21-pierrick.bouvier@linaro.org>
 <a9d29064-e4c7-4536-b918-057951dcc1ac@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <a9d29064-e4c7-4536-b918-057951dcc1ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: NCt3YkWSpZ+E

On 5/1/25 12:28 PM, Philippe Mathieu-Daudé wrote:
> On 1/5/25 08:23, Pierrick Bouvier wrote:
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>    target/arm/helper.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/arm/helper.c b/target/arm/helper.c
>> index 085c1656027..595d9334977 100644
>> --- a/target/arm/helper.c
>> +++ b/target/arm/helper.c
>> @@ -10641,7 +10641,7 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>>        ARMCPU *cpu = ARM_CPU(cs);
>>        CPUARMState *env = &cpu->env;
>>        unsigned int new_el = env->exception.target_el;
>> -    target_ulong addr = env->cp15.vbar_el[new_el];
>> +    vaddr addr = env->cp15.vbar_el[new_el];
> 
> Why not directly use the symbol type (uint64_t)? Anyway,
>

Nothing in particular, I was just in the mood following patch 17.
vbar_el is an address, so it makes more sense to use vaddr.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
