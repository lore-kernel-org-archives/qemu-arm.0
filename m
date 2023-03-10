Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2178988ejc;
        Fri, 10 Mar 2023 09:59:04 -0800 (PST)
X-Received: by 2002:a05:6a20:c126:b0:cd:74aa:df55 with SMTP id bh38-20020a056a20c12600b000cd74aadf55mr21560708pzb.25.1678471144681;
        Fri, 10 Mar 2023 09:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678471144; cv=none;
        d=google.com; s=arc-20160816;
        b=olFgEatZsZUQjAvjF9uc+TcFPtAJeOO1ZKttulzhRIvu+KJaYY+dRlaSQka5IE6VHZ
         tYHdYC676LS9/iiBUYpyYrM5RNgmCLbyraUdtXykshHXyAJcxl9wJVum1RlmXL1lQAAD
         pMXp2qYAVv3SWspMScnhiULsz5myFzCqwUJog2K0ioXjk77OnDIgqT5vH+JMXMJMkQSM
         Ht06IpkhWAXX9ze1Z8N2Pj37hYhiSn9kRFkFRh8PwxRxuncZCRzHPRP7OULe47FfnT5J
         8j1cS7ObkPork54870+ZuRkfNKexJnYTI7sl4HXF2fAmolJJcCuDF5FSH9HZyLXW3pgC
         JJeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kIQjnojWqKH45Bp/4zcQWFEmnDrl7qLSAucD5qtgmTg=;
        b=fAtXtb+SilxV5Wq1cgGUZ2wCc7WBlPwUCwMRiFTb6aw5JJZp5jjj3sFGjklX+/L8H7
         6Oqohe5oKEgl+qddnoI0zOouz9PG4OhFa0AL+cb1ar361jp+UrcuwokYQcV06d7PTJIr
         IjaZ/O0tvIBkLkZAp3ZQ0NnM0X6tgzvpX8rFYyBkAc7d42Mp7LTMJPVKUvMLs6oQHn+z
         94otxRXmwW3lixipvlkYczOGizS7D99cUGXCNJSQ1KuO4Bl65XRgppW+hAvRgfP8hfRY
         nTngW+Byze5QLGw4gxODWs+Dd9znRah9deTbFty0XAESZkrCuTNJp46D093uRPdIVVxj
         /ZHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W3zZn5H9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i62-20020a625441000000b005a91ddba759sor148019pfb.5.2023.03.10.09.59.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Mar 2023 09:59:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W3zZn5H9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678471144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kIQjnojWqKH45Bp/4zcQWFEmnDrl7qLSAucD5qtgmTg=;
        b=W3zZn5H93npBJj7aD3kcbeyEKs724K94ENr/GpXylXdh2nDGDl72J9eAHXPfbvw8i/
         zh26rqIMC/SXLFpQXeM/Cg98S8wZhYu8RWr/P44tkgtWBG2OUzo7ZJK7wrLTGTqMlhiL
         MGpNuNVLeNLJx+rt0ZvnDaB2gpAiLvPITSRmYrAS7fUsfDHi5U0OLNQ1JYDndMdQr7yS
         1MPRXg8Iqum6/KD5Z7uDXMElAx71SXmhLzVOl0yMffNWe5Vz48DJ1l49ykkaasg/Ftbz
         vSy6D8qFSGb6g8T4mKlBSIoTGMGB75N2coBtTvCDpauArQlJM3E2Ta2RipY7kG99vpfG
         XGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678471144;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIQjnojWqKH45Bp/4zcQWFEmnDrl7qLSAucD5qtgmTg=;
        b=wHk7Nl6vD41r4zOgwezcyidhn4BbI26YDRWQ/b8lsojaMxkua0R/UAo1RjgHzF/TdH
         o5viE6Oq4KVvUHy1ACoM1aBDiM7BnkhKQijpGksUZPjv5ZMG4HDosWjxix9jsROoiQxK
         iBGnQv1WlRPPNhKqkCQqxwgpZDyMsS1dpSzF9DTyZwuHqTzspbDPaJ7PMAqAJ4ipGEIp
         00F49kzmot4OjEGk7HIvgO8HPkmUVUIdNRQmpPMVPJeBgAXZh5nTRofS8+7eQwBeDpHZ
         mnIfMn4V0ccaKqNbQNPtZ+HKZE/IedA71sF9IiA+fjatEKJ9HfY14i+FO/Y9RaomsFa5
         BgYQ==
X-Gm-Message-State: AO0yUKUxEycv8Zat5Gj6GzL0GwCUe0gUkcRgJvJjwuazmW5huaL12qk2
	5O0Whvgaepa9EBMmbH9rMqfRMZBuuxAVnAaSQdMdWQ==
X-Google-Smtp-Source: AK7set+McK1RPe3GpBWu3P7MFEwQKjsLDWG7Oa1cAEE/O5XaEGzDSYcoeFxsRg7zC9IZ0s73C10b/g==
X-Received: by 2002:a62:844c:0:b0:5db:db1c:37f9 with SMTP id k73-20020a62844c000000b005dbdb1c37f9mr27032665pfd.10.1678471144160;
        Fri, 10 Mar 2023 09:59:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62? ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
        by smtp.gmail.com with ESMTPSA id h4-20020a62b404000000b00592591d1634sm113723pfn.97.2023.03.10.09.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 09:59:03 -0800 (PST)
Message-ID: <10c75176-64b7-f35f-b035-c2a69801e0f2@linaro.org>
Date: Fri, 10 Mar 2023 09:59:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-8-alex.bennee@linaro.org>
 <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
 <766cc218-dcbc-b6bf-d172-bb4d4ad0b7e2@linaro.org> <87wn3olcbw.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87wn3olcbw.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ARIiXly9YTHG

On 3/10/23 09:56, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 3/10/23 09:39, Richard Henderson wrote:
>>> +    /* Undo any setting in generated code. */
>>> +    plugin_gen_disable_mem_helpers();
>>
>> Oh!  And this is the wrong function.  Should be
>> qemu_plugin_disable_mem_helpers.
> 
> Did I miss a newer version of the patches?

No, I never posted one, since you already said you picked it up with the requested changes.


r~
