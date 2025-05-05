Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2647185njj;
        Mon, 5 May 2025 11:43:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXA2PVJvKTyUdq9a4pu8RrQnlHLEuzHHrSeH13F9YCu2sdCM+83Bpptw5DoeO0IH8XpsRXsWQ+XMkbBg==@linaro.org
X-Received: by 2002:a17:903:110f:b0:221:1497:7b08 with SMTP id d9443c01a7336-22e328cc817mr7198595ad.23.1746470611782;
        Mon, 05 May 2025 11:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746470611; cv=none;
        d=google.com; s=arc-20240605;
        b=SDNkpKorjFsi2xkLyM6/xPwWPnibxKyrsbHs/9Ai96phhPtP/5mlNvfofQhqLoJZgy
         zmWTeHxgBaIIkolJl9+j1x4y1bu6EFIQAKlGCcEGed111zDeeONA0T40FUkvRSjt2fLf
         UxW3fo68hBUGDmcyiI/X0owe0sMPME/asmmzvMNMLwojardkScWY7naFaUWua73qxAzm
         s3mnWLPMgQoAr8+GzaPzLOePGYWaAwTtZfGxvD2LPZDJvNp7bBsgVxgn3lUhM17bR55v
         1ok0pOWXsy/K+kfeGKOgQ9pIr5Ib15SZNsm4JhfNl6YQZLA3thOysf74DKRxnlSsQfMM
         BBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=+V/yckTEt3Of60Tx9qYZWVyVlI2Maq0VpPJSJte1eI8=;
        fh=kUKENpCIlwr0y1uTZKQLAUg/SwIMh0I6V/T9wyK/V/A=;
        b=lUCGgtVkrC6ZLDCorlNHBjjcLUBDwncLY7yYzreE4DeL6e/KimydA+roS9KJudvqYC
         P5MOzK8O674qQOBnnDbX3rBW0dwVuU7v9XyzNGv4vChYHMSjPb6RnU+HhsTUBr/waooI
         miV0xikOiepV+OzR8Lu6A7/F5qWsbMps2PrLA0LcVwrtV8c2Ry9PycVY1EiNoEtHgCri
         Dxr1IMAaeWayRDKhmcnsA9nskpfFW6z3d7qpsQcc4oNBu363AWsgg2mEmEe8PYcaomhc
         Mduf27Hi+3kysXKig9xitIJeVFBfWfyoyUB3gIi63+2sIVLK0u2QQ0LL3bgkvu/1c8xJ
         207Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IW9n1bjy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22df553ee19sor67947435ad.0.2025.05.05.11.43.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IW9n1bjy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746470611; x=1747075411; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+V/yckTEt3Of60Tx9qYZWVyVlI2Maq0VpPJSJte1eI8=;
        b=IW9n1bjyPbuFrFGcZMAoz5jLs3JCLEuwXztY3ZQvb3m9rtob21S55Y0kyqnWJXuvvH
         6DYN/Q9c0DFHA0fWNbE7NWMegw27nX2p6yD6ZoidjzgkFBTnBuN0Y+B8X5qCdsG9gTGy
         lJKLsf5YgmMCkgS4EHMN96vE4T/ariUSTThUeuln+w2kEHuGO16DaQ5jlgXfFV8uwtqg
         syxqYDm+Z+pDpXZcnjuz5/frAbpA1LWhwTBOflwR89t6i+ZYdJ1BE3NZboNNe/wO0qsA
         kna9M50MJ948SWZ3GL6JBHr54B3NgUfQLUoxcAXmibw7t8DEpVEYOyH7wf+UZev52EhC
         CqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470611; x=1747075411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+V/yckTEt3Of60Tx9qYZWVyVlI2Maq0VpPJSJte1eI8=;
        b=cGTyo5ycDjo1jvTV5NBMut398fDCbh5xh6271ILayvQnf4+bA9xhCmsiAQuV06pIdW
         K5qnl3ef/PlPLXc93A1pns4BrZfK2sG8XJmjZEJPB7t9e1T8ATRi/ssUt24TQmyBEGtn
         5X+S/OPcJTfkBcR+wfYTtizDoQ6L0wkxFMi84PHGlE0UTl1KpLhA5pl7gpsxZxP+vSSd
         5svHOCmeb6vHRI3/5ihXuHYx3d930VmJxIJpfOPaCdoXh49yEdqtg1fcjM+rXAu1vOla
         FvTsXhtWctWgx0MFoIepbrjmJW6CmLiq36Hrpb3uHFehmaP6QYDtrM+Yriv4avV5oOp6
         8BEw==
X-Forwarded-Encrypted: i=1; AJvYcCX0v6fGK7ZrsyroMdRQ8BA/rCNm2sKr5F1GudQm/tXuZzTBEKwdr9GarkT8IabqvLACnhn4StXdvN7J4A==@linaro.org
X-Gm-Message-State: AOJu0YwPNntfxG2fvS3S+1E0gT51XwumHxnguBmfFbeOlcne/AI19Sum
	z5MKir61kQcMJxNntsKJHFuUPq2nLVNJi+FBZZKz7qjUCKk6ZwBtOxFmv+bMlHfS7A==
X-Gm-Gg: ASbGncs+K/hnspagDK+E55NtbXBUgcsthYhy6tr69fmioy4GuLpj0kCKMZkspQO9cjd
	V1jF75MzvW13FDXl+AQYGmYXdCExEe9QN8Sp8ZZuri1jkSAlGTunfAMem4Tl7XHwA7GsyeHzifQ
	u0SbuSRlTNIywCh4coqI4Bfb6+khuY3vwDmwxFpybmVRMTGMEZi/qcmNYi+kZvncSv0Kln9ANH/
	K8nRqhCj4Dkvqmaspb7GOi7Rv/imWRl2c4pQ5rwTQSzj1ILZI9lzlMETzgUXQv9P+sGyDuFWBtA
	M6r6gGWrVabR7cf8SyZk2t5lWF8Q6WSDYYD/tqvyrarLZmM5F3cGnpMfo0Ok/4+Maqz8yYooY4n
	7kLicL50=
X-Google-Smtp-Source: AGHT+IF2+Z8KaYO4OS/kgD6+IOcvIP8nAKXcU3gY90DE6aQn/DUfu/Od7V5lrZ6DteiM9KOSigti3A==
X-Received: by 2002:a17:90b:2f45:b0:2fa:1d9f:c80 with SMTP id 98e67ed59e1d1-30a7bb49ab9mr788615a91.17.1746470611247;
        Mon, 05 May 2025 11:43:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f0aasm13392418a91.35.2025.05.05.11.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:43:30 -0700 (PDT)
Message-ID: <2c005b5f-1308-4c7e-9b0c-9640aef294e9@linaro.org>
Date: Mon, 5 May 2025 11:43:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 43/48] target/arm/tcg/iwmmxt_helper: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-44-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-44-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: YtV5geunCBzn

On 5/4/25 18:52, Pierrick Bouvier wrote:
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/iwmmxt_helper.c | 4 +++-
>   target/arm/tcg/meson.build     | 3 ++-
>   2 files changed, 5 insertions(+), 2 deletions(-)

It appears iwmmxt_helper.c could be built once, like crypto_helper.c.


r~
