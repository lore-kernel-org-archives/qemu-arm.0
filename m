Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3157418njj;
        Tue, 6 May 2025 07:26:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzdNSTlz7U3zEP2wKK6NOG/6U5M8bEflfOAqMQ5dqOq0Z9WTPrj1SX6AcPjpcUGU4d0+wlN3hA0KPv/Q==@linaro.org
X-Received: by 2002:a17:90b:4d04:b0:2ff:7b28:a519 with SMTP id 98e67ed59e1d1-30a7fcc9432mr4061797a91.30.1746541590190;
        Tue, 06 May 2025 07:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746541590; cv=none;
        d=google.com; s=arc-20240605;
        b=ER7zIXhSgEFH8tGajgWo5fhdplKtL2vKUQeFQ3czvir87sawvG2MaCUcd0RMal6ohN
         UVnOLk1xZKyIHtkzHeoiaBXiNi7RRcieKUg3qNFp/jS8a2qC3/odOJsOdkXOARDr+csj
         UQgAYCleqHYAQV93qTbwuzgQoMKb8+QyAelah0gjubH8rIkEVrA7aSQDVJ9YPxhB2In3
         NfN9a5W93++fDtIeX+405Y28a5dadA/IWbb8LeZ1GoTC5GOOZSox2jboeYc51iS0hSmU
         CkZoxz+jwPqfcINxhnLXLVQ1aHvoP3G899LDoZFqJ472U6BaoAeeRsfIs319OTktVuo5
         BmPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Y1IqghFIXeDNluBDDx8gRPCXaqN0Xsj0VQP/eJlEg3g=;
        fh=iSvzjKdx8PSJQNep69XKVN1VktUyeWJtsxrr/U5bI8I=;
        b=HTrtnoJYup4V/WbxRmnCMyCmV3c2ZXJ2Rzh/1lxfMzbFYPN0E0n0atTlAQXiEMpJxw
         9JqsBOLXp08XiGdbK90qM3i0ePb9yn20x9vOChZhCj72LUrYdllx0ZijHo9RB7fMjmqq
         CG9LZbgyDt7ICqPOL18G+utkhuGJ7lowBdF73Qx3E+0x9RQL3B1KkZewSz4Vna1M2Zv+
         umxbrunEVrE/b3tR4VbVN4wfKpRxjLSfEsAL315fsDUtYDZLqdB6qFvI1cCiZFHXJvUr
         bUCgK5QNs5sfL8JMbEJwjdQWsSmTZUaED/F+8UyE6SMWQXmmDbWDaNsAf1twjc7ORPHN
         KeGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aM6tBi1h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-30a475deab9sor6961974a91.3.2025.05.06.07.26.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 May 2025 07:26:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aM6tBi1h;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746541590; x=1747146390; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1IqghFIXeDNluBDDx8gRPCXaqN0Xsj0VQP/eJlEg3g=;
        b=aM6tBi1h2Kp5o5cckNTpO6/FYPkByk/cG9tzAYYZNf824fbV1lVm4snmudJYHLM0ro
         q5rIUMBj8fMh5y6/ZhfxrIf4DxVWDCNJjj8+WpyonfSrfwlJTTlZwTl8I+gmkt1xti7I
         wDYE0maAv7EWeTmtvmDasFDOT+F+SNc0rYBUvtakMOm9ttEWHl66My0kNvdJ8/X7Kv/h
         +yfsbl+VBVShdDac/qnJz3MWuFZiRnq8hkcxnJwmaE+TuYfr9+Xz3FSRQnTCsSAbXURY
         zGDUUKl7s2zaiTWp1jyUlnHADzJSSpFmW4idpU+xaScGqYOmo1gjDEBwdARIaO55Pn2S
         Ilrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746541590; x=1747146390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1IqghFIXeDNluBDDx8gRPCXaqN0Xsj0VQP/eJlEg3g=;
        b=FKnMGsunlVB+bViHWQN8chfkXXhgdAVeK2zbaOzKm+fUmLf5hjeN3SE4XILpioWCQ0
         dH4boCHjS22SuaPSMLJS5F2nlWm6iUTn9JT2E6vcpoothtxd+Jnjz9+HX8PqBrp67BAg
         GgCwjPrhNktqeiK7eAARFSzSIMeH9EgUJ0CEi0JMGatfnoKB/+cCyaZmUk82xp4vqhMp
         fPl09ZxxUgEBp3eC+12h6lYc8puQJvD67t00G7/NSmoimFSwjQVskUGcopicXGS4YtpP
         96/UgsL740/ZB6bxVXcTUqPcnhA2XC8Pb3rq+LigfI+pz9FHbULRqBn2emijfXtXYmsc
         icnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqcwFxbccLooGTFTVUpGNP52yDYGiykWvAErUMAlTdDtE466Cz2eV9KemV4uDZNm8etue1C+U6M5+98g==@linaro.org
X-Gm-Message-State: AOJu0YzjFxWiKP/cXDORnL+CT4/iSV22WTpt9LnAimsJxjPpIOl4C5k9
	HS6ws/R2v2BcqE38Z/ySgAHAnXrshDjPNf6uHzLcRz4+h+oODU4e12aLENmiGHzDQQ==
X-Gm-Gg: ASbGncsYTCHkN6xLOQ3OB81/zpf0gOotwFO68Iq647NiGOQTd3wwNGp0cbfvaxiMiTa
	aU/a7Fh3s6MGTb9y9c0h3YPwVDPt0kKaGK37YzWfmISyJuCEDfWA/NJqeez0wmHOREf2XnRGBQq
	ped/sGQjCPDa0voxGHnon6rsgGevU5JlqLmO4u6ykmIIFMiaJ1Ex6/DO4+vLCI9KaBS30Ak466I
	b4dU7NaaF7H1L8Whbp6+A7Hz+dE20wMvE4/YO23dX7Xjz8MvE0EER4iNAq88nsQlh3jdvRNNTp3
	Wbwc2SFz8owu0hvtlT5jzpnSe9skAe2qm23EFJl84JBx17a/eOrFFOsE94EriUTl+kwyC5R0E1x
	2mMbsjOQ=
X-Google-Smtp-Source: AGHT+IFIgZvtnDw7CrIZAa+bkM6EA6FPoMcZ5Jq6srtFkQTcuITa68hlt2YJPQbKlNaXH6f0U8pLNQ==
X-Received: by 2002:a17:90b:4f8e:b0:2ff:692b:b15 with SMTP id 98e67ed59e1d1-30a7fcca2a7mr4974599a91.33.1746541589578;
        Tue, 06 May 2025 07:26:29 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a892f4d93sm1181773a91.1.2025.05.06.07.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 07:26:29 -0700 (PDT)
Message-ID: <a2f65004-da23-475f-a6d7-fc99870dd126@linaro.org>
Date: Tue, 6 May 2025 07:26:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 42/50] target/arm/tcg/crypto_helper: compile file once
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: anjo@rev.ng, Peter Maydell <peter.maydell@linaro.org>,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org
References: <20250505232015.130990-1-pierrick.bouvier@linaro.org>
 <20250505232015.130990-43-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505232015.130990-43-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: aMf8UA8g7MRn

On 5/5/25 16:20, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/crypto_helper.c | 6 ++++--
>   target/arm/tcg/meson.build     | 5 ++++-
>   2 files changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
