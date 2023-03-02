Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp244011ejc;
        Thu, 2 Mar 2023 13:58:17 -0800 (PST)
X-Received: by 2002:a5d:6386:0:b0:2c7:31cf:8be1 with SMTP id p6-20020a5d6386000000b002c731cf8be1mr8121591wru.12.1677794297657;
        Thu, 02 Mar 2023 13:58:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677794297; cv=none;
        d=google.com; s=arc-20160816;
        b=DyCmDA1XaScJ5D5J3x7+B7NF0bx6ZB1n9WRMG2nQpWv/DkhhIXuUg+I3idEUx9gc2/
         uBQHC2JZvrfDy4Loc1dXw4+WOsNqJQ7Y2EeRpYo12ADqVIwviMj02r5JuRrvwbd4KI7V
         Tj05H3DvLE1PuVgpqJmeqcpcYAhAJKMf2VmHtKI47QZkBSM4XAWxxPmQA+jX+EfRYxE/
         ANbvOSRH0gWJRTxfzGwVdp0d/0pJu1YcL5D503OHncrBC1b5CqorPRJJEcQG2P4c5rvZ
         ms7V+0WWg2lmNWOAfHBQfDkAEMB369AASFSBq7K5oZDHdS9yUEOYkBMg9PxzNdVmB6fn
         HPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UDZswf4uEzany5QrvvRK53tLE5TnRjTJMGZStuNH0Pg=;
        b=mj5Q182IzzDRauIoFO5oBFdNnxtJQSw1hIqaVgAOrws2YfO/RDu6gMKoVZVQJHcJFm
         RokzrkEr+LSlF2cwrXtAZJDKHRi69B+9s8Wn9w3HrGGBZNg9rQr2ums4XU4kcHTfLb4v
         ChYEWU5bHkc3gcRV0FQeJhi66HL7pEiZiyxORL6aW4Sc/LaO7VPKiNZPQH2H27EtsCEm
         LZYhMJFzxZk6+9gJGYJ1a4cJBjXO8qaZmqrdhJLT6auWTQR5bn7uTgnMq+GKCLWmAdAA
         x2vsVNz8jOOQ6+tytOnjkWbYHkXQV4VRO4m88A7PAeSE7d2Fhcwr7pyEnhU4noePBaIE
         Qkvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c01Qm5CA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d13-20020adff84d000000b002c55dbd4b77sor184648wrq.78.2023.03.02.13.58.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 02 Mar 2023 13:58:17 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c01Qm5CA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677794297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UDZswf4uEzany5QrvvRK53tLE5TnRjTJMGZStuNH0Pg=;
        b=c01Qm5CA9+skyR4wswaewku8HTJNl4WNaS20D2CpfxO8Uapb8pd235XipMTAOE02zw
         Cf4NYqj702NtkNau1gYU37Byl3EPPUAKBRw1uNCD81j5DgdZNqraJA/oFGGWMbclPFiV
         DYrrtY6VGcs2l8S7aa9xhojKYEh1kjIfhFUH9W4QLFbjVFcVenWwr5lmk7WlpqpTMyjp
         iLduF8H0R2/o+Rt2x2YFylbTqEkz2DCf4I0tA28QEeW6HPm1RJhXtrnLdV4rh14FyL4M
         YGDf3Z6clOtE5jjImbqk4OJ77rw93+m0J8x5rH3g3miRBOziwW3AasfpHoscXGq3br7h
         HPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677794297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UDZswf4uEzany5QrvvRK53tLE5TnRjTJMGZStuNH0Pg=;
        b=Wa66WfRhwbmOXtx/iOiAW6ahpWbAzesrIdVKVtGNTA06AzslX1DIYJElNAN4ABuOXJ
         JXsra32lzhpY/faiYAegxMTUs1FImcsW0mvWQG8JY5GOW5Rjqed/HvGi+1HhigaIsaex
         4SUWQ+PAyLGmGX5+blmF9wgYAjMsVjWetdTj9IvoYKv0wukSutbxk+EVs9j5XAQcaksW
         IGAWbWduCQEQbrODbIROd7ZzUu/QaBMlX2dzzPYv6dVN2GHmF+bNye8P4JwzxIZ3kyqH
         QZWaXNXA6OJChjuU4NLwLzxPuCrhRtlMEEXOTFV/hmAC+iNn3XlAchVAUsGR1xogJ5yI
         Qbrw==
X-Gm-Message-State: AO0yUKWroJq8uhaDAjL+OX2B/mgepFL1JS2LW9+2R3kJx7ELrKwTzNjl
	UL+KmrzkJRep3QahohkggrIhynWKR77INWiQNQM=
X-Google-Smtp-Source: AK7set9XlppTHh6P/NYuUA8627xDZx2JgibTevKCtg80T+5uYqzA7ofikej3nH5tro9swhHZf/7amg==
X-Received: by 2002:a5d:6e01:0:b0:2c7:1c36:3c6e with SMTP id h1-20020a5d6e01000000b002c71c363c6emr8454808wrz.64.1677794297289;
        Thu, 02 Mar 2023 13:58:17 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.27.175] (43.red-95-127-39.staticip.rima-tde.net. [95.127.39.43])
        by smtp.gmail.com with ESMTPSA id v38-20020a05600c4da600b003eb68bb61c8sm379710wmp.3.2023.03.02.13.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 13:58:16 -0800 (PST)
Message-ID: <7d696728-be96-c720-2db9-b93a5a352d1f@linaro.org>
Date: Thu, 2 Mar 2023 22:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm
 system emulation jobs
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-7-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230302163106.465559-7-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yQxJsFx2Zjvx

On 2/3/23 17:31, Thomas Huth wrote:
> Hardly anybody still uses 32-bit arm environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 14 --------------
>   1 file changed, 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
