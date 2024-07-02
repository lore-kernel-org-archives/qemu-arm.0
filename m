Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2084154njm;
        Tue, 2 Jul 2024 09:48:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:1807:b0:1bf:cbe:4760 with SMTP id adf61e73a8af0-1bf0cbe496cmr6004360637.40.1719938916131;
        Tue, 02 Jul 2024 09:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719938916; cv=none;
        d=google.com; s=arc-20160816;
        b=W1LGAYyFO+E8xRmCqu1DJOIxtUBJddNs5jcSViR0LnfvRJ3PF639tzK37JUS3YIWuO
         EBt3WtWS/2wv6ndzQloa4Xr6Uk4KzJDfrrWRNB7I/f0FqeuV/mWhYGzebdNRRYt/7S/Y
         74G4Xv3ENcZjJTmotILPVZCPNAGq8y2s4zeoqjvggx7r4pp+Ninvt+mbAScZSmOZGifJ
         rI8TnALhiL5l9dN839kToq1vPO7kSDyPEppE3YFYdACyWcw4WkeiDis5MXKT5rsEs6OS
         lThjl4fJ38LhpNVPt3sk/+Pq9I7adWlfwydtQiaJOOI9JLigp/AGQxwi7zDZjoIqIDmp
         tyTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=QoQraaUvksne9lvI2gwP0oQnXURXrScHT/MvNUuRmJo=;
        fh=iSldDLLqkxaDb44X9oiFwqJJs8gFQQ5pY6Sn3NcSAV8=;
        b=XvAesK61BJnbAfM0gXbmjrzi+z9O/jE+rBVshZ/+oiAvdwg+AWrEAcTm9vPxN9UIlO
         1id6+S4A6b09JCJyVMBWoklKdKf5avAETe037syOOPQypTO+SbtZZ4l6bF8SLqy+Rs+2
         BJpGL+9sKkjtBQZwcFvU7JEUvrouufYRHswulVZAt8CCOxAafhPQVr0yfvHrYI3nrEQX
         6dnNAvrZeKVwK2Y8Yw9bBI4t1LNuWfKTcIOCSGPAP0fAH/Z70WW5VA/T+FKDLbARx4Gh
         4Zcp+fu+plvCVNRGVp6iCBzawaHv+kkSdv/JRLrHaAHUiFgDwLHTmFt7aFhFgSD+kyBO
         91yQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G5Pl4sKS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-706b48af12asor7973887b3a.3.2024.07.02.09.48.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 Jul 2024 09:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G5Pl4sKS;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719938916; x=1720543716; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QoQraaUvksne9lvI2gwP0oQnXURXrScHT/MvNUuRmJo=;
        b=G5Pl4sKSqfxjlo21sPsj6mnwMxisdMlUorS7rtdwYpj5sfEVYDgiXxcVub9h50mE0F
         0Y8wmj/cAcGt3qKg+w7oLZOU4Xh3gr9I4ZwpWM7SGvhzb3EdLOIaOmD/srqQn8EOVfPM
         8JhGjnhw/CxLBWXylWi7KK0dS4zEF1UUCVYpMl18Zc8ub8Ncmwu23Ss7GJmBxoW/HeRI
         7ctKEl//foKPKU5i7HbBaVVZimCXdOsVs8LAGpr3ZgPN49kkZ/u3Bteg0eSjhR9+ayOw
         Non1emzr/3O4JLbK3VARGcUPCcJCGOo4N63fe2xz8j5YiVG+GjI7z9e+5UK3WGA0s/2A
         MJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719938916; x=1720543716;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QoQraaUvksne9lvI2gwP0oQnXURXrScHT/MvNUuRmJo=;
        b=PoFH3s2tcy5LmYyIp7aVI1seTxqcyeuU/jNsD10xN24XO+lzziAiByKkXXxUNd31+L
         NgdsNM4Xz+q35rvC5bW3qlM+ereboxEQe5FMrqsoAfob5OERKWkROnPDfOlazRUUxFaY
         fw5vcJOzNrV92XhLnNRMMOeO4tukkGsY710uKzY4DZvVYS7vcsuzlcEC2ARIM12TCcVa
         U9HLQJjh2SxJaZ5McYL//+a229ijlHp+Zjtp86ipD0Iw8d6VMtOLyT7WpylUHNIZ6aZL
         4erkJgMOE+czYT6y6DSvccuHzL/KL23fpSb6iJuMbde+klieDzz6owzj1ghLdhOL/z3g
         x2Jw==
X-Gm-Message-State: AOJu0Yw0ht9nAb9SmMRl3UbEdiBwcqMjetWFSTE5Wv+rynPNy7nOH/eh
	XcGsr9a3mmgq7lurwpMrJYxIMpKOmTyOAj4uPzUDDaBOu0wtXgyym4IxdAblpkLIaCr4Exj7O6X
	vo08=
X-Google-Smtp-Source: AGHT+IFEZF5CzCYXCKeaXCkTF1DpFqvbQQEGPjQeMo8dIfnSxZoBCMKG0dP9zDZ8nVCOi5KbSG/NHw==
X-Received: by 2002:a05:6a20:2d11:b0:1bf:1158:1e5 with SMTP id adf61e73a8af0-1bf11580450mr7106106637.49.1719938915475;
        Tue, 02 Jul 2024 09:48:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70802b495a1sm8964284b3a.92.2024.07.02.09.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 09:48:34 -0700 (PDT)
Message-ID: <5f52f7a4-1146-42a5-9485-09ad9192df4f@linaro.org>
Date: Tue, 2 Jul 2024 09:48:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Use cpu_env in cpu_untagged_addr
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240702154911.1667418-1-richard.henderson@linaro.org>
 <87ed8brdjo.fsf@draig.linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87ed8brdjo.fsf@draig.linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4LWAsy8IZdDD

On 7/2/24 08:58, Alex Bennée wrote:
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> In a completely artifical memset benchmark object_dynamic_cast_assert
>> dominates the profile, even above guest address resolution and
>> the underlying host memset.
> 
> We seem to use ARM_CPU() quite liberally for a number of helpers so I
> wonder if its worth codifying this anywhere? At least all the direct TCG
> op helpers take CPUARMState *env directly.

For things that are akin to virtual method calls, i.e. the function pointer comes from a 
table within the object or class, I think we can trust the lookup.  Therefore no dynamic 
check required on entry to those functions.

That said, cpu_env() is relatively new and we haven't made a concerted effort to use it 
everywhere that it might make sense.


r~
