Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp960111njj;
        Fri, 2 May 2025 09:13:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXYbKmtfJofq8zIwvqgsI8L5kwzfQ4cwHT69OiLgGHNzGws/qvm2bu0fdZ8laXtAAWOMpNllNpVYAdSIQ==@linaro.org
X-Received: by 2002:a05:6a21:338e:b0:1ee:dded:e5b with SMTP id adf61e73a8af0-20cdec4b5bdmr4644545637.24.1746202399316;
        Fri, 02 May 2025 09:13:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746202399; cv=none;
        d=google.com; s=arc-20240605;
        b=QZdBEuoSb/83/oTgTiU1p81dX1ape9XWH8+TNArSiCMoWOeObswUELk8jzu14hcHWi
         rzjFutImYP1NSSoQV4AnwS67cbP1qglNP+JfIr9vjqP/HEAxvKDZRTJvT+KxnTwYVMU6
         bfIK4BoJIjmZENfwH0DKMpGIxLVXLd1wsB4iTy+LBhRyAVy1UP4sQFe++tMqUUZDl24n
         QILjX9ZIEd4RsBkSE5/7ffztQkdwp6x1uLBQ9v9IQ+iAHgWesMseOiF5/nBloBHgDTix
         MMzqOooot6w9eL9fDzwP00thE/aRkqPPTbBILtWW5Rz4asJq5aqwohtpwy+3IUxbIfMQ
         cNsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wXEUlTRcnhe1HcrsomLd2HTF9lYmi8YpwQzWpH5iy2A=;
        fh=tv0De5I01B56oM2YlsGRuC3v4vgUZpLKU5kNVeO9pG0=;
        b=RoQocNFva1U4KkxvR0HzXsDe2HJtUJLBU+aEzyKQaCBhDhS9wXXS0XNAWttRWxbcMW
         0yvwUypAknEWF43KVPYol6tNrX6JEdypYRqVDpAqw5IVxz8rpfmPkkvKNcbBUnjK+358
         kHgLD9GrMA6FJp/gUsstbJDWszHGxwn/O2JsQLeuR9nt3s6cw3L5qcZPTByZ4mCMMenu
         /DbjKQknHackyc1H28X6+AAt90HMo11Rd+PGPxGZhr9ocOG+15yoHAri8KVSGEmVX4rY
         6J4/RDVB3/EMtKXM8pcLfu3I2mynzU59SVc4rotPBNtieGqe7pMsRw9P67cLXlVcWd1D
         WhvQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xdGPA0uQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <pierrick.bouvier@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404f9ed8e7sor2864752b3a.8.2025.05.02.09.13.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 May 2025 09:13:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xdGPA0uQ;
       spf=pass (google.com: domain of pierrick.bouvier@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=pierrick.bouvier@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746202399; x=1746807199; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXEUlTRcnhe1HcrsomLd2HTF9lYmi8YpwQzWpH5iy2A=;
        b=xdGPA0uQCAxerqMFAuc2L9MiiSKFiYhEIrlyu1mwYz95QXnAooj5sMJTto7EdZ4xb2
         NdydAIiq2Q8ryVPIMqAmAth5KgAiUpT994T2fQt9+qPbNFG6Id5/XedLLWrN2Yf+5siv
         UHzXzWQ6AXwRaA6xSus0HT9UVqTsT53/Wdvoeklq6s9pzriD1RMUG1LydXsREHGwAFNl
         svGtxOoDzI+rhubsel0lCE8eVsHiSnuIVOABLXC2vcMg9UStrxhfdjTzn9hQEblY2+uW
         hZ93dMUMrilsOv9maxWbAbFxNcSRfu8RLkNOPRZazJ/RzAOawX/cK0v8cTlIsuAOVLZa
         T2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202399; x=1746807199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXEUlTRcnhe1HcrsomLd2HTF9lYmi8YpwQzWpH5iy2A=;
        b=MEbD2sQHbZTSNQiKS1pEwouNMaTVebflF5mStweQnt0ae66J0Ogedr5XM3MqZngd4m
         tmgFP+rbtexQd1MnMwAYkSB1NjjrNthu6pMTp7BCYviKbzhUsOxacJBBKUAEiPIudIJn
         01HRX0Rmn1ppqI0IDZXQAcdw58p8cVXT023iZTBTShI0ldq039RbNXTWzK40eG/wnzmC
         SXWZOqgkIlRaQNlVFflB9fXHug8pnGIlqRbiYRzx25dOR3w6/0PK3QzCgxEpqZ4uIN0G
         YV1bYKFnWXqN6kvDkjCehx+FOb6FusztXAPQHQAOk/lJ0lRYov5WVBWfwAn0rdO3HMP3
         0D4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVahzwBR7mQ6RzMSXJ77qBQo/RnMwsN1RW5LvnL/FOgNfqH0oTQ5Wgpw+LHHobU6n6+MxhPLWjWt80vlQ==@linaro.org
X-Gm-Message-State: AOJu0YyEe8kq/87v3y2LUsQPJW+OdoUdXGyTyd2m9y08iUiZ8l0gqRHh
	tjMOd5SQbSaY7NPVgVRX18UEpxahhQLBVMEOW8KGVCleidA6f34p+5g9uHlhjK72KA==
X-Gm-Gg: ASbGncsHBbrMXxZjfoXcOyH1diOK6pmiKMMWrSHtiOWaEmpJzhePhSAnRTK3T+U8SZ0
	rfeoPlvpwjLTK+rudYrDWGc0+ZlIGmk2JyNhjkeLULFDSvltlIWSeq8jrC+Tcwd+qSgPDUp/+8g
	zGQj+B1PqsPvId29plPIySklNc4vFPSRGN6qZfuPqkiXLoY/YiVnRmSzw/hURXM0klmG9IwnfOD
	Ty10Y4nHlq/aLJnP2yLvh9KRvqS1G/jFnE1w/E5SJl0I7DSR6dTBbffbSjS08NcrhsAd6+OsQOC
	HSMp6e554+gk+5QkV3iS3FPNWfSt6+6xvV2uLoNxK1lQKL1L2msc7g==
X-Google-Smtp-Source: AGHT+IE37k9QAdxJxApNWGXISr8wxzIX29NjEHn/d4ixWkIpY+SoYa8IBivUo7zM3LfIVL5gmhNwCQ==
X-Received: by 2002:a05:6a00:8c04:b0:736:457b:9858 with SMTP id d2e1a72fcca58-74058a188d7mr4597030b3a.10.1746202398661;
        Fri, 02 May 2025 09:13:18 -0700 (PDT)
Return-Path: <pierrick.bouvier@linaro.org>
Received: from [192.168.1.87] ([38.41.223.211])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a397sm1765156b3a.28.2025.05.02.09.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 09:13:18 -0700 (PDT)
Message-ID: <8900b336-6d2c-47d0-9054-e6648a5f9294@linaro.org>
Date: Fri, 2 May 2025 09:13:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] target/arm: fix arm_cpu_get_phys_page_attrs_debug
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Yannis Bolliger <yannis.bolliger@protonmail.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20250414153027.1486719-1-pierrick.bouvier@linaro.org>
 <21843e8d-cdbc-4f84-a652-01ee467f2dc7@linaro.org>
 <CAFEAcA8cBUc_iJCA_D6ZDsJad75Rmad6xDz34FPXWrnyEhk4tg@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAFEAcA8cBUc_iJCA_D6ZDsJad75Rmad6xDz34FPXWrnyEhk4tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: MXqDnrYV6KCK

On 5/2/25 6:05 AM, Peter Maydell wrote:
> 
> I've queued this series to target-arm.next; thanks.
> 
> -- PMM

Thank you Peter :)
