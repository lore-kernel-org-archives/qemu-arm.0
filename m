Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp223718ejc;
        Thu, 19 Jan 2023 02:27:52 -0800 (PST)
X-Received: by 2002:a05:600c:4c21:b0:3cf:900c:de6b with SMTP id d33-20020a05600c4c2100b003cf900cde6bmr9485057wmp.15.1674124071932;
        Thu, 19 Jan 2023 02:27:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674124071; cv=none;
        d=google.com; s=arc-20160816;
        b=p8xFeB9IMsd+PdZeJLPSacN5cq1hNtmanKTOn27812WVDh1Cv8JP9fx0K6VrUpr4Yj
         kM2kcV5AirrbXmY/JvNSgN8p6RS7sI86vjHL8l6NxxxU8PEJQXyxRwqLehWSovMVRzpS
         XWEeHWOy+nAzssu6lyg8JCzySLqgKGq3b8N2Trb9WdPIOQsUw7ApU/UfhFVTrNWBKbK4
         Lxumm7dnpTry3jTw7su5qEp9xNtBw+LCfwqG4VDc36JpF8QjyaElfDtdSoC8uWJz6y5Z
         II+UjnuHPEwt//b3Dp/kQN4/zoDYTgC2d/6FHyJei13CBd8fKqG1cPUMqROhzFKBkXG+
         pO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=iOPwVs3w9fwJCd4U4LbZiRH3USQjmPIhLRhdMWL0NuM=;
        b=Wj2o0Z+5TyMKTmXSmSokd4MiJ2BhW1Wif2IzC+PV992P/BhjH4TgRdKW5gVP+awE41
         T4qkNup7sv9SLlVMsoHCR/oZM0kIbUeL139VMC9tekpgvcfc6znmbfPmm51nYN4YZlIc
         wiOUuQ1Z5KZ86Pqxo9lXhiQc0t2sCIATraclMkR7s9mdMNQEu/B11ftqT7zhcN0cTNc/
         taRm4JuTf5bEjsu9Ko/i+QhF+7TyyiKRe+/IlNxngx5fA7LADPvalNtw7E3UuZLMkDf9
         wgHyEU5S7hcJnb3i0nh1XpdGd9Z2JxBY34UmezqKAn9kdlCDoA8DbG58PIgX/FFYL6uZ
         4pow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oyx0W5El;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e26-20020a7bc2fa000000b003db09e630absor1546261wmk.26.2023.01.19.02.27.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 19 Jan 2023 02:27:51 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oyx0W5El;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iOPwVs3w9fwJCd4U4LbZiRH3USQjmPIhLRhdMWL0NuM=;
        b=Oyx0W5ElrpMHXVGFatMx3DqkfW+4EB+yspLwD1u1zXCOm7t6hyr2MCh8yw5SOqfGme
         yDFdcH9KEzR+S4c8ycomTsSUBwYA6TUPGmCQs9QKh8ZqWL7cs5KbbA+XP2Itg3Cz1kGi
         /OUGegCNNaHZhGsXH1SIXcB5amPDYLvA6htxM+r7jjUDL7H85zyCjPzRMHBX3QgA+PyD
         qSc8FrvV2TiyO7MGpilNlWugqrA2PaUmonWPRD19ljlJUkcUU0KFtkbgyB9HKSdcY5ai
         sQDObIjRPxgkgzeZGtzhzt1ymnqD6mLE4GfMOpwwDL/wflcfvzrotgKMM+A50VeLSmm/
         7M7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iOPwVs3w9fwJCd4U4LbZiRH3USQjmPIhLRhdMWL0NuM=;
        b=CokPM6uxQtIKkO5+y7Ii4X4IsCmzUKBTwWtFkNSAgYKVpEdPrEFY1VqQ5QicPmSuYf
         FF/YIZceLPxlziO6NENAOHNWmWJ9NzvZ/AM0h6sejlZg4hWslc7PHWYZ7Bhs27UM1Q6I
         gYQvfg1i3werPcsIgNaEoYWmJ2i7JsSlBuLBQghdUs2DbvWgYGCKIG3uxIythlB1A1uI
         CMFcxoRDjM7tjcj6t8H84VHZWsxh1FQchAPAcX9wMZ0+LnO/IePGqI3EQuqS1n9XgUAu
         bshaMgOaVYKg0TTGIJZqSWPClz+I4PkRsx+6SPmpU1TBVk+6T8s1Z0rG/kq6/VW/bGtS
         ZmPQ==
X-Gm-Message-State: AFqh2kpEEsqwKQLoJWYsrNaJoe2FKd3mRYWh80VtQxnmjxv6NfPclnf1
	VPvVE/ZXect+TQwZEaOwQgPqSA/d5RwAxPuuDgA=
X-Google-Smtp-Source: AMrXdXsAkNZp8TIId4EMRSlfpmGVfQERRV3dXjr/MZme2Jn8zZvHLKCtgCKzePsQiTg2KaKm1q3smQ==
X-Received: by 2002:a7b:c8cc:0:b0:3d1:ee6c:f897 with SMTP id f12-20020a7bc8cc000000b003d1ee6cf897mr9483888wml.3.1674124071715;
        Thu, 19 Jan 2023 02:27:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003daf6e3bc2fsm6147447wmq.1.2023.01.19.02.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 02:27:51 -0800 (PST)
Message-ID: <ab32e4db-2a6d-69f8-4b69-62a1f1c0f6ba@linaro.org>
Date: Thu, 19 Jan 2023 11:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 00/20] target/arm: CONFIG_TCG=n part 1
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Thomas Huth <thuth@redhat.com>
References: <20230118193518.26433-1-farosas@suse.de>
 <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
In-Reply-To: <39bb348d-e3af-6a20-e7d5-d7a1c918a389@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7LqZzEc0hbBY

On 19/1/23 08:41, Philippe Mathieu-Daudé wrote:
> On 18/1/23 20:34, Fabiano Rosas wrote:
>> These are the already reviewed patches from the first half of my
>> previous series:
>> https://lore.kernel.org/r/20230113140419.4013-1-farosas@suse.de
>>
>> This unbreaks the --disable-tcg build, but there are issues in runtime
>> that are still being hashed out in the other series.
>>
>> For the build _with_ TCG, this should behave the same as master.
>>
>> Based on Richard's "target/arm: Introduce aarch64_set_svcr":
>> https://lore.kernel.org/r/20230112004322.161330-1-richard.henderson@linaro.org

> Testing on Darwin:
> 
> 18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
> qemu-system-aarch64: -accel tcg: invalid accelerator tcg
> 20/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
> qemu-system-aarch64: -accel tcg: invalid accelerator tcg

These two errors have been fixed by:
https://lore.kernel.org/qemu-devel/20230119100537.5114-1-philmd@linaro.org/
