Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2493823dyb;
        Mon, 23 Jun 2025 04:54:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEvuXhh3EUfu+7xtC7hcKFmVrIJSwxAPNXCeGHsRmgchkS2aqxVSsOvtLoNynHI0LfzMi1DjmYwhO90A==@linaro.org
X-Received: by 2002:a05:600c:1e0d:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-45364791b6cmr128817705e9.0.1750679672837;
        Mon, 23 Jun 2025 04:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750679672; cv=none;
        d=google.com; s=arc-20240605;
        b=TVyEAuEEDEj1sBbjBzpOIOroNCO4qimQqor2HbaCIbwB3ri+r5vscA/Dh1fXqCOYGo
         baawDrcw8zBa80MQ4v8uUo9eNL4vCbEjGQEVw80zFDs0rvLL0EN33B0pUBrDeaBZvPzB
         CTf9OKmGNLU13DhcQA2/uq8V0d6Gkn6gaUADXyPRQykfwQG7ey6ccmzPKWShNExaDsK+
         V6+AZ6TfRgy+KyFXuRmdtLk8JnP15yZ4VxsRm38+wmD9D5/evxwyOo7QVoeHhHNTOjf7
         2eN/tGRbTJ9HNRJGgocxBgBO5tWHCowpKxR0ci0QJDZtjDmqPmO4WXkoY5aPKwn48ubE
         IDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=mA1bPn5/VKcYzEd4AJcMgbdM29kFbTpL6cqkZBp0IqU=;
        fh=nP6Cr8Krl4JgQlW/nMACnMw8IoeYt7QqKMEUF5Dr8jE=;
        b=JbY3byXVFjtRyRq7APqpFFY94z4LXmxJfFHEWcPAZKwfHtoNGVqsg8F52yHHcKUYJx
         RhPb7+mScEBHVJRgcJilhTuyaaJkuWi9sqkI/m5USYgrtm2eq3lEkZ3FO6L8gbDy7UcW
         3yLUyKVVPqvxPoIpZSeR+r4byjsgpVarLAWD4aE45ApcUeTngHPmyDruNoSAPRXMx4wt
         J7hWby/xCVhKsi49rAOsZWrNWiukO5ho2YehWAzv05dDdE2dtQ0/T1aKqw16izssiTdO
         aQHTwTfaOt3Z6Uuoz31jqEmNgvXNynG19YVOGJ9BLQOBRc+UksqxiRpwgZvU+TsQkPh5
         STkQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtyp0dlE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-453646d8bd3sor29347705e9.3.2025.06.23.04.54.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 23 Jun 2025 04:54:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xtyp0dlE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750679672; x=1751284472; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mA1bPn5/VKcYzEd4AJcMgbdM29kFbTpL6cqkZBp0IqU=;
        b=xtyp0dlEgLBnWBlCFqvo6n5mvqN/MG96nyROldZrtkdrMRCJ+KsE+tR3E2XC+NQviy
         6TKSaL4enjdWf9qO2SLUxciYG5Y+KX15c/Fs+1b4ORgfJBwOS8MhS7CTPMpMTVOU/9SD
         4b99SDku0OAuxROY25pck1bAFyzwd8To18Db78LaNrU3TqEbm0z0+/gtH+1COedpaud2
         juhl4k5WRVxDMRXHM2ktguuPAU4nBd95j7yltNDMHsmQsiIQnBiagzUM0YWZFhXbbqba
         4CIflk7k92YxOTvnxtjd58piZxxbyLHVLzDZeo7kSHQvcBloUqRxoOzjKLv+EHfpvlHL
         ly1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750679672; x=1751284472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mA1bPn5/VKcYzEd4AJcMgbdM29kFbTpL6cqkZBp0IqU=;
        b=ue7y/KtTQbrLIDnZMPBiE/9LMnROKiaZrWCp+GLFiiRQwptQiuI/7iuh7hEF+J7SKi
         l9cZZXPNsBprcydQAHcrSRIkZ70Orhfu11War+UN2nn3IOkO+8pvvFvCLlWCUzFbZX8+
         bW+4QVC7PzUrVvr/7QLuhAVwDtqPbx7f4wpEWULMkP67jUMAFL+YcT5+eNFO3jsJdnIK
         Zgz2QahYUlQb+TmDoSKxClngnIuwPf4Mmm1v73QyJ6n6o9tV7ZKpnUXmbJmZ2938G/Yj
         IC3oITMOppoIsNKuT6mg6Id+R1Y4l1doPW8c7N2ZFqnT1PohQg0H0g2sSP4e8csZEshg
         Cu8A==
X-Forwarded-Encrypted: i=1; AJvYcCV2RRcoVrn/qDHpIHbRm/6YVqhwBv7xbpf/vyytVTCm/+4rODwVKd3mDO2xkjf72hRHzsw0LcxVKQWAcQ==@linaro.org
X-Gm-Message-State: AOJu0YwEWXbIDJT9i+r2K4VO/uKiB5oeex/lw/yfITiQgELBqCEvHwlN
	27IrxGZelzdIFMMaPA6CIwHEMu90778oWTk9bEnvEZt3kEjtPf1FqSXMyVXH1XXCMaICJQ==
X-Gm-Gg: ASbGncurwfoHzxz8casLNAjivD3GJVCZHs6wV5glJo9Xy4dsD5v8sZQljBNJuyAO0Wa
	yn3UoCHltgvpIItKg0NX9QYu57sa9wd0NIydsmGcQgmKXnWdn4F7LPuhxW7bpLqD81MgSbV7YyN
	dyTRRYfXh3GcbK9731OXCu8pw0F+ybtinTvl76amRNvOJl3d31u0UY/MXTJsoZn25x7mVuY+CrR
	32dT9YuKwZVyKRLq3V6RbswLX1qSjdNUxD3Abhxf4nZxFK/CIlDfExvTFmx6Y4am8hlu9opGQR1
	hyzUo8pCI+8vcUuqzUWXhBwOMXKOwHsQbJ1Zr6GOxrDahVLjEFuEnkKkKoshQOlaLGJvqIBWVFU
	gsbNQ5DBPtV23Hnt9eBpkLGvSgaaJFg==
X-Google-Smtp-Source: AGHT+IECw1gIHOR0QOBsHa/SDc+jBWm8t+IURqICdiK8HE4kWpV03x7yosYd71lVv5bIijrW7Li9TQ==
X-Received: by 2002:adf:9c8c:0:b0:3a4:f7af:db9c with SMTP id ffacd0b85a97d-3a6d1318226mr9569094f8f.59.1750679672219;
        Mon, 23 Jun 2025 04:54:32 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.167] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19b30sm9469755f8f.37.2025.06.23.04.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:54:31 -0700 (PDT)
Message-ID: <76730787-f153-474d-859f-0f51ede79e93@linaro.org>
Date: Mon, 23 Jun 2025 13:54:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/26] tests/functional: Require TCG to run Aarch64
 imx8mp-evk test
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Bernhard Beschow <shentey@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, John Snow <jsnow@redhat.com>
References: <20250620130709.31073-1-philmd@linaro.org>
 <20250620130709.31073-25-philmd@linaro.org>
 <3896c4a8-8b25-45e0-978c-1539648ab4cc@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <3896c4a8-8b25-45e0-978c-1539648ab4cc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cy6Jd4fKAusE

On 23/6/25 10:19, Thomas Huth wrote:
> On 20/06/2025 15.07, Philippe Mathieu-Daudé wrote:
>> The imx8mp-evk machine is only built when TCG is available.
> 
> The rationale here sounds wrong. If the machine is only built with TCG, 
> then the set_machine() should be good enough to check whether it's 
> available.
> So I'd rather say:
> 
> "The imx8mp-evk machine can only run with the TCG accelerator".

Yes, you are correct.
> 
> With that update:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks :)

>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/functional/test_aarch64_imx8mp_evk.py | 1 +
>>   1 file changed, 1 insertion(+)
