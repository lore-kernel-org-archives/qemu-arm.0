Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3722640ejd;
        Sun, 21 Apr 2024 09:52:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV7Am73T4vrYJBe1B6uL48Mnee5yMFZg9+Cll3MYmpg5aZmEVIz4w3aXnQtQRSbAHq1GkXZNvQPBRKUqIAvjllTAThO7UIW
X-Received: by 2002:a17:902:e744:b0:1e2:a162:6f7a with SMTP id p4-20020a170902e74400b001e2a1626f7amr9212481plf.43.1713718364284;
        Sun, 21 Apr 2024 09:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713718364; cv=none;
        d=google.com; s=arc-20160816;
        b=I36ahKGEBYXOcH7kKLJhh8bsVxJYkVcNFDYr7cknfqaLK+YBentUMfV/S/L/jSMDcB
         XJQiStTMbfaNYCBqSCxUwkTtaWEBMOItooeG5wBlk5irvO1YLWYEtdqi3ItT/3ZQlCPN
         mf/XBRHARsgVXWCfZVJOD1jkAJ6pvv6JCpv9BcH8kHuykj1ZEtmsSlhNG5Le1OmMjRNs
         vcfK+k15lE3btkA7+99tHazGNuRcs78uGcfJmdbyTN+kj0HXo9a/jb3Jx4G52jTxsWPO
         nArvmJXgqYLTSRK3+N5I5LavIc3fPcHjkNCKA32GrUy/2pd5v3e7ad1VEA0rMTJBHq0x
         dV/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=S5TVtZGaltNicInXlF3zmRiIbJyeBcFpWjIy6Br2PL4=;
        fh=OdHVPz7EJLuk9X/HGfA3rt0ccS5qATxB0sG2l/KS3sE=;
        b=cclvpGj/zfKPpqFfBsDThhjKrAuyo/ScDYwXRlhuLFBvJonl5YIPZn2pN0WaT4z6Y/
         +v4n44XbRh3SupVLVSeWbTmNq1lmH1dYCLxjPmfPrV0BmqorQZt6qqQbnqQo4wmobWxO
         zFkJsMDzdzL5aJb6Cs+ehrFGsIzF1S5S6wybTuYG8no9HK0kUnmWFAOO12r3ZgcaWJc0
         uOA9nppac3SGkJFVlZJIorEP2tCxeptahvhNONlSJbcqbxHE0Rqs3MyrT1iU2VaiRX6k
         8Z7XvqkEGHITUbqfAoj72HfceesJst4vAGvPYSmxr4rNrtCm3cN01HW3l3m1RoYCNiIo
         abBw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S0u96p7d;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ke11-20020a170903340b00b001e2bf9ac38fsor7944450plb.18.2024.04.21.09.52.43
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 21 Apr 2024 09:52:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S0u96p7d;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713718363; x=1714323163; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S5TVtZGaltNicInXlF3zmRiIbJyeBcFpWjIy6Br2PL4=;
        b=S0u96p7dqLrCuA6XkSLZvxF+LPMICbb6FsVEDhYUko9UDBwutqmeL0p0jzeHrbuBsy
         BND1u0L2JEyTBbBaxb4YaYFbdKzTrnu2KWyIpIcClgAuLMLnG+HvIpQr74sDdPVIkFzH
         taeYaKz3NU4i4bPnBUtyZFe86Ytp8H/HKIrkT35MZQXDoAMSuwyt6bjzIqoZw3K8TY/2
         maFlxyMxSomDbRoeVYXUTc3TvuNBVjX98juRYLkxKOrPDUO3dvnu/DsCwXMfeTVsFJL3
         tk28zWUJ74lAmBN4gDVbbgsi5ZPt7YIB8ziZEDrX56evJSSiNwQBFKhoLuhQI40uYMW1
         pikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713718363; x=1714323163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S5TVtZGaltNicInXlF3zmRiIbJyeBcFpWjIy6Br2PL4=;
        b=qRBJjjFXASwaI73NCXTuG97Ek/MJdSKnFqmHhq3DWYWq7zp4Ys7KOE2aTusD0D2AIJ
         jwKMx0fEwU2SF7Ay5rOR/q5HaGv+qiZrMLXTdFFep1lQzWlWpQYx/LyWFXTPKIZ+4isZ
         4IuVar7F1N9QvqK8gPlFmw8KmBv6jnxJVNhhT9FMnFLkqh1i64804H5wwdw1XYwSpKS7
         FAcbK8IxAVabs3R5S9ri8YzB1cR5Dj/fHx1trFmYk2hBYCqVUvYhxccqiozs82arZKOx
         ui3vrHlKlNByByDen6jv6LZTdH1jOscDo1zWT9RIaOBG+3h4PU9hRuuNcEBZQdAD1Fjk
         0dng==
X-Forwarded-Encrypted: i=1; AJvYcCVd/duO9z1r0d+USIqGTSLRONyJXgzG68K0f43+DCAztE9/B/t1JTWGh7VCwNm8ANA40nH476MO43+I1OINHKnT6FUuQ9Rc
X-Gm-Message-State: AOJu0YyG1wyVkJDrmau7rBoIy7o8t45Yh49Iw2xYqi/uW2NQqUQvJl5F
	eJqbdr1Lgl1KKQ57YZuERJdeAgU+hjppyeEZla6PjDV+CArVZ2bSNpZQLK0YT2WEog==
X-Google-Smtp-Source: AGHT+IGgeaVwECaFewtI1rsLqV5j/Iz2o7W4fP9LzR76Gt1hdSJdo8Nrs4odSu3pN3cbYKZ1ed0buA==
X-Received: by 2002:a17:902:e887:b0:1e2:9ddc:f72d with SMTP id w7-20020a170902e88700b001e29ddcf72dmr10084005plg.26.1713718363485;
        Sun, 21 Apr 2024 09:52:43 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.91.227] ([156.19.246.23])
        by smtp.gmail.com with ESMTPSA id y5-20020a17090322c500b001e2461c52c6sm6505421plg.149.2024.04.21.09.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Apr 2024 09:52:43 -0700 (PDT)
Message-ID: <5d092e5a-6999-49f5-988b-f54bbc318d80@linaro.org>
Date: Sun, 21 Apr 2024 09:52:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] plugins: Un-inline
 qemu_plugin_disable_mem_helpers()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-22-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240418192525.97451-22-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xO1kVNHcAUOy

On 4/18/24 12:25, Philippe Mathieu-Daudé wrote:
> "qemu/plugin.h" only include the huge "hw/core/cpu.h"
> because qemu_plugin_disable_mem_helpers() accesses
> CPUState::plugin_mem_cbs. In order to avoid including
> it, un-inline qemu_plugin_disable_mem_helpers().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/qemu/plugin.h | 6 +-----
>   plugins/core.c        | 5 +++++
>   2 files changed, 6 insertions(+), 5 deletions(-)


I don't see how this helps.
All of the places that use qemu_plugin_disable_mem_helpers also have cpu.h.


r~
