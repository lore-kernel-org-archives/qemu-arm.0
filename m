Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1205180ejb;
        Fri, 15 Sep 2023 05:51:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:188f:b0:68f:bb74:b1b with SMTP id x15-20020a056a00188f00b0068fbb740b1bmr1721772pfh.13.1694782288909;
        Fri, 15 Sep 2023 05:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694782288; cv=none;
        d=google.com; s=arc-20160816;
        b=NYy2QlkigS9VEojozxH8c9OpCpZTilXoUP+DFHy5EVKuxnxESL7KqI9GFFmzYpm+kZ
         DeOPr1i0DJYmbuAdTd+zR0QWlJaQP/UeTKgkrnmMlvx1yml+etGswyeuby5b2LAvqNmX
         5z/EdlkOxnn23rvfrZ7wZQXbDgK2ek1VSPWbCQPR9WDDi8PMwW87OyGM9Ht/4j3HEKkj
         ANrsK2jZWpVWwium4kQYeFkbjVHiQso5rYfd5bnAbbfc+sjScZ1FU3XYsvKz3fZkq5cG
         Gq7LXCdo5MliaC6pfkOp60FnAsMx+C9wdtn+WHFI7Slmn7bgrl2JXlRhgQxMa8G5UEJb
         5eCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=elOgSevuCNgAMJDDaNVSLwmdEKFfMYYrJOJft5/GhbE=;
        fh=ByEKTo1dmum2LbScobfYCcvvfZhHJNEjeG1QbUbQTGc=;
        b=JG+klVsF7VwgsfC8A646ksjgeF1X1gnCklN3Hje+/0KHlaaVjfFDSK3084kh3EPjvN
         GsSrh/hSaOnJCwAFPq2HvMkQkAMPaK46qZrboT6PfPuBuNKlStyRWGKgufif4G0MlLsM
         ETUzd6TWyYB2hPsxyISxwP+pTf3oi9SptiIRWQTwqK38VR/vBbC6DxLbUsf2BEtJa3rD
         F1hhj9B/5Qz7GEtZI85n4Y2+egnqxTNiJjaMvWfUeq1lBL/GdP4JJBtWRqvTzMe6mk0U
         T15WQjrpIaDjtCQYbpHHB5cJqO/TXU/X3Zat7QMFT7Ba80kInM4puhIgmjOGJ1coWfcW
         EBWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/cc3uct";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r13-20020aa7962d000000b0068e3f550755sor2327840pfg.3.2023.09.15.05.51.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Sep 2023 05:51:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/cc3uct";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782288; x=1695387088; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=elOgSevuCNgAMJDDaNVSLwmdEKFfMYYrJOJft5/GhbE=;
        b=Y/cc3uctlfqob8Jhaik9f2H4zCpCa4w0bBsbZpLW5ZGAzLza4+AHLgtStADHkPHifa
         uRgMjW08uJPfDAUPKxevC3cVS/CcqfKAuG0w8ZKV7HqEzZMSPD9RbwPii+N6f6XQ+TCn
         FNphZX2qUqZkwvELh5AzakfjagHf4hwRVPEjdgpy36IuP4D0RMMxj39nU7ZQIMrrewBj
         2loLM3OUZZOcVgn/LTLdfWQ+JonyRDjsI8uQWkGD1syR5kRdEBMxcu6scEKzcaIDdyHE
         omBOemCpK0tR20zLGe5vUswGN3GHfd/KHp1yfJmGFwh+Qhnr8BWFZzNzonYkuPjqzIGl
         qkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782288; x=1695387088;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=elOgSevuCNgAMJDDaNVSLwmdEKFfMYYrJOJft5/GhbE=;
        b=I6yWTsmokHoo04chPDFbPtc0H3IvnbJCfaTsxIIoa6hqRONd98/f9ExcmcD3GnVTf3
         q3vZGAEZqTFeZnOgnYVEb/Ecv503xok8R5jQ8CXNlWq7mwAidXwnchaiwdcgbDNJCVJK
         +dKw8YNRQje4OYL9gZc02sxcgclYZJTrDvffzbbLHMHUQ6AIyDBQVAdA1IribWdZgnxJ
         2lFUpTxyUholEOVgAuIe2mzC8F29nIjZd5+IYIjKHEuo4vewlFCr+Sg8EXT7HjTBL70j
         looG+sz+lT8aleNjvF7XSHMBCkg1bYJeKJp3GejMKL6YTcASane/YZZ2eWKWwboVxMus
         Hr0A==
X-Gm-Message-State: AOJu0YwR2SIpXFvF90gOLdoTDpHOuMzb0BQsv+nWCKXp47kTW3IGmpes
	ZahN2v4z3hyVgL0WZMJLh5PmpF4B
X-Google-Smtp-Source: AGHT+IFXK06FDxK/aVM92kvtkgrIdC9GRzge6Y/ssMGGx9gIZ0t/pWwo6zP7xK3I6uC68iwBb2VhEA==
X-Received: by 2002:a05:6a20:8f01:b0:152:6b63:f1e7 with SMTP id b1-20020a056a208f0100b001526b63f1e7mr1864873pzk.1.1694782288447;
        Fri, 15 Sep 2023 05:51:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.131.115])
        by smtp.gmail.com with ESMTPSA id p15-20020a62ab0f000000b00682a27905b9sm3039571pff.13.2023.09.15.05.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 05:51:28 -0700 (PDT)
Message-ID: <30591e5e-2f8f-1fde-c5e2-a1b543f8bc30@linaro.org>
Date: Fri, 15 Sep 2023 05:51:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 1/1] tests/avocado: update firmware to enable
 sbsa-ref/neoverse-v1
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20230915113519.269290-1-marcin.juszkiewicz@linaro.org>
 <1e7ac58f-907b-826f-5a06-5caf8fb3b963@linaro.org>
In-Reply-To: <1e7ac58f-907b-826f-5a06-5caf8fb3b963@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: i7ItdTgbbXAL

On 9/15/23 05:50, Richard Henderson wrote:
> On 9/15/23 04:35, Marcin Juszkiewicz wrote:
>>       def test_sbsaref_alpine_linux_neoverse_n1(self):
>>           """
>> -        :avocado: tags=cpu:max
>> +        :avocado: tags=cpu:neoverse-n1
>>           """
>>           self.boot_alpine_linux("neoverse-n1")
>> +    def test_sbsaref_alpine_linux_neoverse_v1(self):
>> +        """
>> +        :avocado: tags=cpu:neoverse-v1
>> +        """
>> +        self.boot_alpine_linux("neoverse-v1,pauth-impdef=on")
>> +
> 
> Second function shadows the first?

Bah.  -ENOCOFFEE.  n1/v1.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
