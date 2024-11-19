Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3152499njc;
        Tue, 19 Nov 2024 01:56:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1ctCd/U4F6a9eUbAwWGl6N+KwC3Jpt6J+6K4H4zauALg7kcYTV9e0FPm8ooO+sgDXnO8f+MaRVhWngg==@linaro.org
X-Received: by 2002:a17:906:7952:b0:a9a:c57f:9666 with SMTP id a640c23a62f3a-aa4833e9b01mr1422372366b.2.1732010201010;
        Tue, 19 Nov 2024 01:56:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732010200; cv=none;
        d=google.com; s=arc-20240605;
        b=HYpWlIwCgr5Sf8x9q9n63FxzpVRiHRZYBumidvePSGK+q0A+CH/BvVH8NUD4rFeYc7
         cAjYIbAClpH48e55Q4Z7TqOPcrSjQ/dVBrvq+1qVIgaMBuqsg7+3wK22CEoieB6aOkta
         tWY7mdoWT6Q/0l1kJWXJxcjnsUzbQNbsJwCeUVY/9/FbPBGbjiu5we6LJvWp9lAFZXxo
         vJbn7sj/J6ahh18KkM/uyZHcRdJ3EycUwD9J8irBu7fLtaJo55S2wuVaRXzMXL8jElk+
         CdTjy8IggeUl7FQkuIrGAKPnI3q2SyBSRz5JViHCfFwCzARMJ0pXjzaTJ0e/sPxMMBXx
         tbWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=5LTFzYQmPxYDonB5fe7UjSYJHb2KlfJAa4k+kdB4/R4=;
        fh=U+w7qMf/R7lGjc0lPg9BN56fpqVt55SHuTG6sTwQ0us=;
        b=FWc38DRG7XBd94pSK64getYwfB72D5GHO1Jy5YeE4CvIB/YatlVkwxvQpqBHn3QFqC
         owsZ3H13nbJhsBCPNkpD8v4kgwlOVhu2hIDx5ZORsMWBYIicUQgK3mxSQ6cj7qfdYscB
         4MPp70evqdin2sDhVgYYxgq8vQ5xLxWP/DsegUSSPYFGoDwbhoZ3dqpyyMY83gJdLeXR
         abqauGpAYJKkgBHXfXfFUfcNCrTXhBInaNptQ/AlSQNTA5wOWo038Yq8T2w7SrzjvsGI
         +4YINmfNbWcV5Ywij6gGT0LwIXLKTpmF9g9gxO947N/iy5GpZKuKU+1MaS4llEK+IKit
         pfzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vGyAH/Sq";
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-aa4c80d3aacsor52492966b.5.2024.11.19.01.56.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 19 Nov 2024 01:56:40 -0800 (PST)
Received-SPF: pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vGyAH/Sq";
       spf=pass (google.com: domain of marcin.juszkiewicz@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=marcin.juszkiewicz@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732010200; x=1732615000; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5LTFzYQmPxYDonB5fe7UjSYJHb2KlfJAa4k+kdB4/R4=;
        b=vGyAH/Sq6l/faBXAxd1TuwPw1O8IYPJu//hITD+VqYRmJf+9nTBSiQMAQ9yXfAiOo/
         QPCyQgVXd1OCa6ojzMUPRRvXxSU4otTyZzdMryYkmOXcYQExfJf1itjGgzIK3xSiNxzU
         uLl5curp4GgvNla2IhHYLqe+aC5eoubiQuBUWE9oiN634aPeOgIpPQStrr1xvwALUujG
         9d50l4zWbkrdeIgVwhNTk1lujkDsRn19gzet3nCo9QaQSGvikshAtc7prIRR7CuD/HY7
         ZKvGa+Vkl7RFnRVc7rewIzTW0mZTTqVpCJZAYjjljVgWIKxGuRipapwhl0byep9OkGlZ
         +LwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732010200; x=1732615000;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5LTFzYQmPxYDonB5fe7UjSYJHb2KlfJAa4k+kdB4/R4=;
        b=AhM5hCSgC7oL2/nNykv/keH+HO+VVveBMu38q8/wGIcVNtF0nm7Tw4W3lT87ULhvbb
         TV0JjOpU8Aq5ZKCTzuJBG89wOiHpQPC3IpVukz2zN8nQpkF9GtpK4FCVNrURo8hyCavB
         ktEIrxL4WBMzzAndRcWdOWzuM5Dn4Ds4+IXUmWnc/0oN2YegyjQGTythmtQ5CtnakSP+
         mTwe266OegNPfRvSi+PiLw4QlOc3g+FMxQ2W9c96+/GgiXh9UgZlvmspR4Jf3zY0K1Yl
         /gNyBfs4I7ptYUzO9HtJEX6yCesMDVj38EPvacV1fcxiRo5MMRWM1RVdBMZSzjcUv5Uf
         5UKg==
X-Forwarded-Encrypted: i=1; AJvYcCUS+DIxEMW1Q6qi0A7u9A1xZqmKJyOVTxYfHu1JhwHmXApY2MhakcVelgDwXDVF7BAcPLSv6ncW9QqTcg==@linaro.org
X-Gm-Message-State: AOJu0Yxj/zvOdIWOrKzGBAA6w+7cfDUvwdhlavNoJCWKx/aXF1XyVXDr
	3PB2s6rjNM8YCPZJcY9SlHgNBr2AQ3DD/0qFEL3iaHn0x1sHmhVBfhYxP9wenlMfkg==
X-Google-Smtp-Source: AGHT+IF3+jmxr4QshurKhK8jdb65Rbq+5wSWdMSzKgS84eR4qPPebPVvPe114OMoDeZ/vyZZdUVCGQ==
X-Received: by 2002:a17:907:7f23:b0:a9e:f28c:374a with SMTP id a640c23a62f3a-aa4834544a3mr1313757366b.32.1732010200503;
        Tue, 19 Nov 2024 01:56:40 -0800 (PST)
Return-Path: <marcin.juszkiewicz@linaro.org>
Received: from [192.168.210.26] (83.11.2.232.ipv4.supernova.orange.pl. [83.11.2.232])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20e086098sm635405066b.190.2024.11.19.01.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 01:56:39 -0800 (PST)
Message-ID: <47831adc-26f7-4633-a371-975c97e8dae7@linaro.org>
Date: Tue, 19 Nov 2024 10:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] docs/devel: add b4 for patch retrieval
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Richard Henderson <richard.henderson@linaro.org>,
 Andrew Melnychenko <andrew@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Thomas Huth <thuth@redhat.com>, alex.bennee@linaro.org,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fabiano Rosas <farosas@suse.de>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Yuri Benditovich <yuri.benditovich@daynix.com>,
 manos.pitsidianakis@linaro.org, qemu-block@nongnu.org,
 Michael Roth <michael.roth@amd.com>, Konstantin Kostiuk
 <kkostiuk@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, gustavo.romero@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20241118172357.475281-1-pierrick.bouvier@linaro.org>
 <20241118172357.475281-4-pierrick.bouvier@linaro.org>
 <ZzxXAtuRowg8hp9u@redhat.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Content-Language: pl-PL, en-GB
Organization: Linaro
In-Reply-To: <ZzxXAtuRowg8hp9u@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: z2hs3TxIOiq/

W dniu 19.11.2024 o 10:14, Daniel P. Berrangé pisze:

>> +    b4 shazam $msg-id
> 
> I'm wondering how b4 knows where to find the mails for $msg-id  for QEMU ?

It goes for https://lore.kernel.org/qemu-devel/$msg-id by default or 
checks b4.midmask in git config.
