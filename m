Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1681561njc;
        Tue, 11 Mar 2025 00:56:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUbiu2mAQBaHZOl3DWiXA6+CNAph944YRUJpWnmaJCA718Pc+Q0/ysqXT5RmWJJXgl9que6TkYMk7NfXg==@linaro.org
X-Received: by 2002:a05:600c:3b04:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-43cf44c7703mr82327435e9.14.1741679774387;
        Tue, 11 Mar 2025 00:56:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741679774; cv=none;
        d=google.com; s=arc-20240605;
        b=jdcre46NRNSMsRyUyEsJADOdccaiHjlPXBRzDMueMSvLVXkCoqg/MxYoqu010sycif
         oM/INB/gjIGE8PFD+dpAQFC41gnm32S4BgmCeb3K6Sm7ZclG3cwfNmh9J8V2vUthMe6O
         lSzA/2Tl/zZSPCKuy4rbjPZi+quUYlqAqc6HDOWZ2DpnC7XZzhsAg9sei1iROoR3rqzC
         b+y0RUwn4NZdIHWhdHQCRyIIP27qmgon61cgwyOdm+jgBdVF8JEJI27WnN2toyNBtnjB
         nG2gJ5u1doCkrhy52zDAlrzn4Rf1Iin6MyyI/gmc5HwcLJCO25yUB1jFaPxFmt/Fty1K
         23Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=X7Iu1u2dXqtHxA7odZOWuoQYWQu8cNtKWb4foxrTEPs=;
        fh=Jrc54+klq3wVwVWCOu0Qv8Hp7xUyjaPom5tsXJefHVg=;
        b=SN/NIZbzFMgdXboyHZDu5gQcr9Y2zWLG1VFDkric2sU3ygbiRPeKlFlu7Zcs9GfqbT
         soTWzrmJicCdlFk5jRcyb+Ao6i7G1xvOychMIYahBEqVqixj7XDtKM5lg6cTWGNleD0r
         3PGrxWiMjXd9YhvMlHNGQIvi6zc06DlLCQJ1vtwXlercLoSHbhDmWvMeUa0e8skmf+LK
         jWk6ZfABrVuBe5p4bhQ7rh5l+HVJlhle6s6i2uEXM6H1b2QNlme75MQK8tE6sx/TS8QL
         b4FVZWHW+etN412nIMmwLiRPnDnM45VMR+zMo536BN8Ymzeo6Hpv4OAN82hkDvIIJuaM
         E+xQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nrDAZ4qu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3912c107f66sor2921479f8f.9.2025.03.11.00.56.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Mar 2025 00:56:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nrDAZ4qu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741679774; x=1742284574; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7Iu1u2dXqtHxA7odZOWuoQYWQu8cNtKWb4foxrTEPs=;
        b=nrDAZ4qum6kAZeAB2OHLZ+co3tkH3V4tBhx/x9A3jJA4d0ODhBgzhmbqJYR7IrQd+A
         sqT1m/5srVOoH48mvLRBvQcrmKEe2GBLYqTLdmZL2YEs9pO/4oulPETjBAqE9hhbNnfC
         IZM4ytHfK2e+iT/Oig+F1HQwa4WY3nm2ddv90eUK8v6ZEqLUMO9ux1cxs+ZThUrRVqo9
         wBWdAtNYHDSPo8FrzdldvbO80kTPU4Nx6N7L9uQXDHhYymFgPULB+d2vJ0mKAXvz7GTE
         9VzBlEtm0BZdcIJHo/kXE7j88JbDMPy2nae+mP64BffuEUQE4eN+vITk36B77R1bqYFW
         K5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741679774; x=1742284574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X7Iu1u2dXqtHxA7odZOWuoQYWQu8cNtKWb4foxrTEPs=;
        b=fc7J8rVyuhQpB8i6oOjqQNbD2O8ylXKEsz2MAkR9UW5smWsdph5qe/vr13NsxFuSV3
         i3MhjkLooHRAtmb6oojAyus7aihSBCWDzCA9D2Xr0n/b7EOLeihU5LGhDzkR0Jyhoezu
         I0+1kCSIbw3PjGVA9RmVEVxPgMj8u7PMNLeKoqyr97w2T0Eom7KdRD403iZjwrWNWLQh
         n/5SJymM9KbaDxoOqRtSkYTmInKqsZDwZM1tPsJ0nHtW66VDBVTDOY4toya+zAvOJKkE
         tYDkfwSgz6PZobGRzDRxjMKNWExbs/3UxjV3X0c5I5l3nVJ7xWbMSq3yiNhqnUEgrOf1
         CSWg==
X-Forwarded-Encrypted: i=1; AJvYcCVMJdoHtPVLO6klFDZDqPfvBWaUbCkz/tbQmicRwwvMn8FNO9HAVHgW5mQ55G+F7DrwCDVl5/XV8cTZag==@linaro.org
X-Gm-Message-State: AOJu0Yy2QFDBgOp6LFd+fwaHMS5/W1PNbQwGA/KG3hd7TZQB6w+WHNxn
	m9JX4SprZL71RSGllMyzIpyIeuUuKPedpym1mdgKGPIKNjTxz7yzivHa/usEcdWitQ==
X-Gm-Gg: ASbGncts2X659z2P2Yjuy5q32KgNohMhOSdXVZv6e4XUcFzBT5aa7nIIaq5flL0K9rf
	zGqGAeeK5K64Pduq8z8hSs/7VHUE4Of9Zy6vbL2hNgiscEr7/TJXwN0GtXfYVC4CNgr9Z/AAHYu
	AEqpl3arFFKw3cnxhuHW1wfI4ohMZ742VL3PIRCgxzQacqte4YmomfrYkT2ItXyl46Xz0yTBXRG
	I3ErOixh7EBpEgumUue7WrDAQZktdtsPAqL+VJ2B1n74EvY+bKOABm6f79IvLRiQ0Ulb6FRtTDe
	gjHc1MZi5W542Lpoj7XZEdTkamkrnQOKw07IgqRmyNXIJsmXNSd9n77ZpE7zbkT0wdvJUN8nJwX
	aVE2HPGdxHRom
X-Google-Smtp-Source: AGHT+IEtiRF/8Iuorn7Gjtn0HyQeDa/EcflgYbR8utiTJ0JsmB5lzqLJ5M2/N+y0q4woAzCFGdNG9A==
X-Received: by 2002:a05:6000:1867:b0:391:253b:405d with SMTP id ffacd0b85a97d-39132d98a1emr13213647f8f.41.1741679773775;
        Tue, 11 Mar 2025 00:56:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfba8a9sm17297839f8f.9.2025.03.11.00.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 00:56:12 -0700 (PDT)
Message-ID: <28c4b011-29e6-479a-9eb5-96c0bac5b8c6@linaro.org>
Date: Tue, 11 Mar 2025 08:56:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH-for-9.1 00/21] qapi: Make @query-cpu-definitions
 command target-agnostic
To: qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-riscv@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>
References: <20240315130910.15750-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240315130910.15750-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: avF5KllGa+gp

(+Pierrick for historical background)

On 15/3/24 14:08, Philippe Mathieu-Daudé wrote:
> Hi Alex, Markus,
> 
> Markus mentioned QAPI problems with the heterogeneous emulation
> binary. My understanding is, while QAPI can use host-specific
> conditional (OS, library available, configure option), it
> shouldn't use target-specific ones.
> 
> This series is an example on how to remove target specific
> bits from the @query-cpu-definitions command. Target specific
> code is registered as CPUClass handlers, then a generic method
> is used, iterating over all targets built in.
> 
> The first set of patches were already posted / reviewed last
> year.
> 
> The PPC and S390X targets still need work (help welcomed),
> however the code is useful enough to be tested and see if this
> is a good approach.
> 
> The only drawback is a change in QAPI introspection, because
> targets not implementing @query-cpu-definitions were returning
> "CommandNotFound". My view is this was an incomplete
> implementation, rather than a feature.
> 
> Regards,
> 
> Phil.
