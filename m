Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp186055njc;
        Tue, 21 Jan 2025 07:57:22 -0800 (PST)
X-Received: by 2002:a17:903:2344:b0:216:32c4:f807 with SMTP id d9443c01a7336-21c3564e7b4mr213113495ad.45.1737475042163;
        Tue, 21 Jan 2025 07:57:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737475042; cv=none;
        d=google.com; s=arc-20240605;
        b=d6j0sf51suWhLAtZ5JZnXJBwFK+A4TVk2p+PxA2/tj+qYmDD5Y5PlDCf9m4DUmMv7c
         2iuI4ncZdE969VwmsP5+EY1mUxCRDCv3bVfqJpxOG1q08MHuAcyBnANU6tPkrSpC7W7P
         /qJrYVh+euHyyQUwTfQ9wP3eL4BLsG5rX/qX1dv04pNjtB/+bUMMvATE4eJ8J/b8lhvz
         d6qrz1rkdtP9czjxwzS1r7OSlN40BmhQKTQSfVQWxhnwJQJr45NYkSKV0kn3BkKeBjic
         DEju2BIZ6epAFenyqMhPjY0TPFGwguLarasbjAk9/VUu/YhJVNhyvTtfX9o3JuZEZRo0
         hfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4wDzsNbQZmZ06uH+ya/l6f07WSn261srnfiAxHen/9A=;
        fh=Z9TgYPPhehYnX+a9Hr43JWxW1r67Po2B1YCtGvGrEy4=;
        b=J2IYireVSPPJJvwZoI49jzXX/4khibXyVbbEb2VHkjk6GhaHUqMDNSB4GL3vfnlamn
         j9eJnmAqOlMuZ0gMy20GL/fkspS0kr5NpQN9RLijVEUbndQyXP3b29d4TfsYwCHs7xbI
         WOgE72OIpSq70TSeIXHCqtGzYHCgNB3VV9v3zDJO3WF5kH8e4301kRnpz5gu3PBDWp15
         DpOynbZ5vafadP+MKuQuK8pgJdrdbCyQ3QPHbog8NX7SmgrmBPGd8fZuLl2sJt9X/Ui3
         hB1zk3hSsjDay7+hzGGOCO9ft3+lfRtYibV2/1qAJdaqXl2RHCsBnE4Lm8gTGhGodq1z
         qtCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JmOBV+6q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-21c2d2f924asor79963225ad.9.2025.01.21.07.57.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 21 Jan 2025 07:57:22 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JmOBV+6q;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737475042; x=1738079842; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4wDzsNbQZmZ06uH+ya/l6f07WSn261srnfiAxHen/9A=;
        b=JmOBV+6qr/GrsNxOrk0OfGQEMHlF2vsBkWg14OOdU0B7ig+KAZk2UE091iFn9T2nRa
         UVPvq8l52i6bgWCUsgJjSihGF/nZorP62Bs1XhNpkXWhPwvIAHm1e5PWZIi7Pup1GP1a
         Gzr2YFu1QnvsQEi5nSqwwUsOahfDtxWYBUNqsh60kf9s0HBLL2aGnIJBeM8FvM244Ct0
         kzIbZgmaDFnTPnKnm6WrbWzZQe9c6w/QOHwdG+1vP65PML/FjJLkcyQtNE3kfzx47Jb8
         Vu9FcPI0bSY6/WRtT7FS5vQH8b7DkWWSXMxMLHGHpAVmlAUv5n3wwf7KC/hpFdjukv6H
         XJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737475042; x=1738079842;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wDzsNbQZmZ06uH+ya/l6f07WSn261srnfiAxHen/9A=;
        b=oT1JpNyDoWAffEjLZaEeOWOE1ZDLAMWCRuiYHPwGbOPcMQ5/Wb2IujqmTw8Xmxie0k
         /tIztI+gI+1uLOA9VwCpVNlQpJTDq1sTEjOAN5e2hSnoaWhevQEf0wLK6rBhVLzZh1Ns
         bfIJ7OZuOwi4ufpA8wBMpMGh9xZT5W1yCMFYjG7wWIQykLPcDkWY7MOrMRyZmuIUDUMs
         ujaOi6UoEawWRGoZYTukvO3VepSOtn2Q/jXAel2Lylh3YIi77y2b7PUwcejnlHSrYJQ4
         1l0o4C/F8K/yr0FYRlyGBIRH1W3mPXmRRTuD3OYMljl08u/VqRcHDLSIS9F3ePUjEgW0
         LPzQ==
X-Gm-Message-State: AOJu0YzTpLBxQ6C9hDOGtfwqDJMgxt5Gfs2pdm+BZqsrFd9gu8zvK0/b
	BFzc9dGhef/GZjVuZQfg+KNPMfza3zMSxLcC4dwNxDk6bsK2md8A5oB2HXaaT7Ub3A==
X-Gm-Gg: ASbGncsGuPeDAoh/POBxkjfZQm/TAw9IpLK1wRQMCqhXImnZ6XFqO3jwIrJ0bnJop4o
	JozjshbH6T/XEj2+G0mMSYMK+CJFJv+lUK8x9Ez5qdmKp7rp/ommG6zRqmx6icImp3y7O+tUZOv
	Np46FxALcC2whIg88c4gqPdfoWXsUTMxT5twB/0rIAaP2VRTHRwk0ILll/WunJq3T2hebrFbmc3
	DjLet94mzawjLWF4qmwKHEH+O5x6fbYOc7fDE1ur5+deWbYvcIdoSntjMUeN8CVTghHa2NkHiX5
	p5jY4B0H2Lf8Q2aPmMWPAI52X6iIlgnGjBM/
X-Google-Smtp-Source: AGHT+IG5LBEX6jqir5XDRicsWBDWGzUoTWVlFGeospg6Dan/9Sgp9SHpp37qORngecmNFSLAN06EEQ==
X-Received: by 2002:a17:902:f68f:b0:215:a964:e680 with SMTP id d9443c01a7336-21c355eb678mr284443905ad.25.1737475041723;
        Tue, 21 Jan 2025 07:57:21 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21cc440b929sm36480875ad.68.2025.01.21.07.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 07:57:21 -0800 (PST)
Message-ID: <9c20ea71-f662-4961-8e25-b9d53178be30@linaro.org>
Date: Tue, 21 Jan 2025 07:57:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] user: Prefer cached CpuClass over CPU_GET_CLASS()
 macro
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20250121114056.53949-1-philmd@linaro.org>
 <20250121114056.53949-5-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250121114056.53949-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: sKBPKsN6QzRj

On 1/21/25 03:40, Philippe Mathieu-Daudé wrote:
> CpuState caches its CPUClass since commit 6fbdff87062
> ("cpu: cache CPUClass in CPUState for hot code paths"),
> use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   linux-user/alpha/target_proc.h | 2 +-
>   bsd-user/signal.c              | 4 ++--
>   linux-user/signal.c            | 4 ++--
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
