Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp618775ocs;
        Wed, 28 Sep 2022 15:55:00 -0700 (PDT)
X-Received: by 2002:a17:902:b104:b0:179:b7fe:1960 with SMTP id q4-20020a170902b10400b00179b7fe1960mr309016plr.42.1664405700479;
        Wed, 28 Sep 2022 15:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664405700; cv=none;
        d=google.com; s=arc-20160816;
        b=iP6UjUxMUgugSTRrnm76KDS6aau9qmiYMAsa2fnO7Lc+qorlrPc9af8rhD8S8olzcK
         2H5SCqK8m7LRXlrI9Qkj7/arVU5x19C2WwAQwzoj7sbaUJg6Hg22WQKNqlk2veSASB4U
         J9rLr7iATQaEEQQ/QoVA/KyGsU9RfAKmS5QBplq31F1g2U4I0kOxMFI/9i2wkReF0POm
         p02X8ZuM3smfnoc5NsWTSe0xZbJX7TNLWP0w8XGP6nCY3BI2G3SRY/TPGyyCkLntrhLw
         Cme9DBOp47rfu1vSf9fH3o0ADNcv354KPD1gci62WLwf6jmErPqCCon9SRbPlvo0jhK5
         7KNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wbpp1UArPUT0zXzYA0klWGc/8l5VI+cqbKXZDDtgp5E=;
        b=v5zst1YTzysaCjChMuYUZ2tErhvhKA+G5jenBg0qIq60yIZVBHfIA1qsMqzrRL60xl
         NCCSA/qRWFcEUCYSxJF1cS0ptjNPCQwkwXBd4oE5GgfP/wsckaRQco477OG4VC/h8Afn
         j/iOV9ugPw4xYe9Q6mCIWXQsKyvyzfd5EIOJcFkyPq+a+TXt7vOoN25PL+Pp3fprZ4VX
         Skoc/2gmauFwuKiUoeapUismw5b8c20pkLlafGtATK+//AXz5C+q7FDKBXqSEU/uoOUg
         slIxsvfTnAuuAO7BsKdXKJep9dpVZOgmlUW7pzR92uJEWVOAD9amZRFUB+iWh0boYTnE
         M3bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iflhh+ia;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p3-20020a17090ab90300b0020396a6379csor1232528pjr.16.2022.09.28.15.55.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 15:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Iflhh+ia;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=wbpp1UArPUT0zXzYA0klWGc/8l5VI+cqbKXZDDtgp5E=;
        b=Iflhh+iagfXC3GqQ3Z5XJLtM9XVUnyGzqbVoIjcCvkl0ciB3qbGpULVYUbQNrgP1tv
         H6SFy9RQjF1v65/3My+9rOhUVuYx495T0MNnjidZO2dJRhRfxlKqUjIova7CqSC+OvEM
         49iX3nqVk4nCj09yH3en8Qn5UYdo3yuZHOSTDXlt20HIBKgTmxIs+wTw6vnvrzBODNXL
         W2bMYvdFsd1jCI6tk1QSxFzAyDk+pdewHZvzFg3NBay5OJIJw+CYUaCsJdLBYu0MU55a
         HTiA3Lu6HLHqmZBPfrPJVM8JLpB1trBNfRWtcTiGP1AkzRsoNuTfLnQ/8NDNpg3D2jEI
         W97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=wbpp1UArPUT0zXzYA0klWGc/8l5VI+cqbKXZDDtgp5E=;
        b=c6yHudogz4mR00qqgSZCaelubHIigzUKLMNvHAIEdf3O03WBZ4x+b9nmWWazauTnHL
         LYOqM18FqZKEIpKYkbXhcxU9WKvTOAiEDirj+Y1Jq41zEzMCUb/kPvLJilq08WAGjgan
         8S9q4+iKJNHiJu2MnIAmY629l1DNfSZ2Gdi6L2ABugwFlMuktv8wPE4ouww5T4wl+Adn
         D20MkvAkMFSRUFsrXjkvF62YAJEzCjDKk69jwQqkzpSCALvursEYkDfCe/8KsYSIjAa1
         ej6VT/f70RKffZz0Cog3DLmpV7EWPthy6cvSJMPSfZC1ChdELpH4JWRhtsjpzc+3PTMi
         9NjA==
X-Gm-Message-State: ACrzQf3iLARQ5Ka/Eh3wDS8fsu5WbcGTofE+VZ3qCfbNVaLeto426Ju/
	x/ky6k/WPAMkRS3a4bTth+261Td/T7yRj+GI
X-Google-Smtp-Source: AMsMyM7j+Cqwtx+fi5WEpKikwqIdVrhMJxAq5zAbbOHCAg6Uw5fkGR8DopBmvpZ7oicyhUUGjygtJg==
X-Received: by 2002:a17:90b:2246:b0:201:d6d6:9809 with SMTP id hk6-20020a17090b224600b00201d6d69809mr286973pjb.159.1664405700010;
        Wed, 28 Sep 2022 15:55:00 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id d190-20020a6336c7000000b0041cd2417c66sm4227756pga.18.2022.09.28.15.54.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 15:54:59 -0700 (PDT)
Message-ID: <cfada682-bc54-d904-c733-b973673074fd@linaro.org>
Date: Wed, 28 Sep 2022 15:54:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 04/10] tests/tcg: add memory-sve test for aarch64
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
 <20220921160801.1490125-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220921160801.1490125-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: WwvZuKVtuECO

On 9/21/22 09:07, Alex Bennée wrote:
> This will be helpful in debugging problems with tracking SVE memory
> accesses via the TCG plugins system.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Robert Henry <robhenry@microsoft.com>
> Cc: Aaron Lindsay <aaron@os.amperecomputing.com>
> ---
>   tests/tcg/aarch64/Makefile.softmmu-target | 7 +++++++
>   tests/tcg/aarch64/system/boot.S           | 3 ++-
>   2 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
