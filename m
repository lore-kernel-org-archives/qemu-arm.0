Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1789108njb;
        Mon, 29 Jul 2024 06:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVFOJO24VgYxv4YHeWATXlcnhRaGnyC/4pTPW6gwTJOCBFxDIm4TUf57FUjB6dSOMDnj67LzrDZ9zbesEP19rKqHOKGoYAt
X-Received: by 2002:a5d:5491:0:b0:367:40eb:a3c3 with SMTP id ffacd0b85a97d-36b5d836c50mr4707234f8f.34.1722259918331;
        Mon, 29 Jul 2024 06:31:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722259918; cv=none;
        d=google.com; s=arc-20160816;
        b=oPVm6x+IBuDCK93HCe8ZG/NBsdLXQ6pDCAYQ3OgF8I9WtlQkNOdeOraoK1XE+k0PzT
         tXFoHHuVWpOqhfyBSZZ0vqmCmLblNAlJ5GDqcDrPECc2kl2GqMYhFtv9YijS3YAypbwj
         PZGNPEaSZ/PGiQDIwE6Ye8pZcVogoJJdKaaX70r/WEOw27FZhuoIlWd0Z58yrCHLdinq
         +ZwdABmV+12eMpT158VzttVmwlA4MNvmPIX9IeCV1d5iCmMommKMJGbEmFV3NoZPpFlU
         Luq9Kbt8tNhaCMlCkkww+b6r+tRsVZoyZQOSJINgOce7SZHcE+5yDRZ7L4odl7DQ0dmI
         EK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZQT3T6RmZ2H5qvtEBp4V600bTpbpclW5WCf38eHwquU=;
        fh=xYaYu0NJZl8Sn36mpURNMuOVCNEB/D1U4y49MgDDkJ0=;
        b=eXN78MtTecg4oZbPQRfap8XPFjgKF/eBMYaZRZfbSoyg3Ke598r1F5ztW7NtQ8G8xn
         njQgmK2B945syEI6K1jav2Y9+9MyLq8NEpICXjGPBg6DeflNFlinlEbgWvrlkSMdgaTc
         AIyRfi2bo6i8bJuDlf3nN7k5BinZn9HKcRJjuFnUwMqLQv2QkqWQtUvxsIC5gxZubkDw
         h/glMv34lxVFf2yos/O5ioBLrnh+tyUlCb4HlkiSnTb1/V4bPsOFIu7QGaSU5O60E/+u
         ubRhP1iK3zAWTLgqu8dJQ8kiU2bnMLrOh+pYqeB8YKYLkd+Dg1U8/egqElE8wV63vR82
         9L7g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vuwLlkgA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36b354e2c12sor2508157f8f.0.2024.07.29.06.31.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 06:31:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vuwLlkgA;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722259918; x=1722864718; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZQT3T6RmZ2H5qvtEBp4V600bTpbpclW5WCf38eHwquU=;
        b=vuwLlkgA4CHPb9tLuDbkx52saMp+t3wklwhaPIt55rkpNUyNHxJsI1c52dxvHrS3YB
         8KSV6KgFKyspFP7GeMDtA49fUZtwsGyGHw50P5ZRXOLfBhkJfej3M1rX9JWQYtlg4k2j
         BVsuRrE3LOIs0gZ5J4XEA7KtG5c6JGJx0waIiSrDuhCX7lzlNmzufn3ZKJOewZWHbKVb
         ldT99m/TRObSmfGvXMJ9hI7xhcTYsz49P7WOOPRAoh7aIjH/FzA0ixcFFeOGtFFAf2hb
         ub6YIWGjUGmLyORdvgos0YWHQ7oPtLMPWdbAOJQEN7U5dx9aoJB4ZsrnAxV4d9Ir2Hau
         wtxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722259918; x=1722864718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQT3T6RmZ2H5qvtEBp4V600bTpbpclW5WCf38eHwquU=;
        b=Fzn5xGqxqHU3InHZele0b/xBv0SU77wI9ivCtba/QNRyE/UAJzQjEyoUOV67FBxj/D
         DzGPGL0ak/z1HK3acP5H8Wh0jM9uIOKPQCXWnbDJgdAXsiTCWDzPkdqNHA8nNeoJ64EO
         +89qvAKeWD9Cz2969bsgG92XAFAPMBDHGRr/43hd03y/CwVlsmzV+FtHjqqscV/rKCLQ
         hWNCrBsFq7wAILsaemBKtQvdkwMh/nBnC/BGnSQvokvz/KbGh5vKQNwqsim6YZvJkEai
         xeQfbtsGUh8dLLuWIx1vuAYimlTuZZnYghxzXCSb92cBQ764DQkO3hI8ImPbiFLVvr2i
         zfxg==
X-Forwarded-Encrypted: i=1; AJvYcCXVJ87Jc4mCmonMpwMDiUq0oCivKJiG0mmS16TZPp8EDsgju2x2RHtomwGsRu+A2Vm3wsvwtmhCpHCd9JHFo3yTl+9ZSHQ7
X-Gm-Message-State: AOJu0YyNSEOFOmDqX68+LOBRZwugsHyVQiAgUmRV4crwKyn9sJv1LRVM
	SrMX4SYQPgGJutb1HOaBX2z0ObtRs6FVCVeX16aX5Tvlq0VRZ4RnowjoA/A+dcCXQw==
X-Google-Smtp-Source: AGHT+IE5cgvLd+kbGwHgIBV3aDODiXIYjj1tV1CioKxN6XGbK76LVWvlf/7jgZ9nTFITZ3JFg7QiEA==
X-Received: by 2002:a5d:6508:0:b0:367:9048:e952 with SMTP id ffacd0b85a97d-36b5d7d00ccmr4827409f8f.18.1722259917619;
        Mon, 29 Jul 2024 06:31:57 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280574b2c2sm176563135e9.28.2024.07.29.06.31.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 06:31:57 -0700 (PDT)
Message-ID: <64440298-8a9e-4b36-b1e2-0a9436bd5c12@linaro.org>
Date: Mon, 29 Jul 2024 15:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] tests/avocado: mips: add hint for fetchasset plugin
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-3-crosa@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240726134438.14720-3-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Ti1js/9T6rIx

On 26/7/24 15:44, Cleber Rosa wrote:
> Avocado's fetchasset plugin runs before the actual Avocado job (and
> any test).  It analyses the test's code looking for occurrences of
> "self.fetch_asset()" in the either the actual test or setUp() method.
> It's not able to fully analyze all code, though.
> 
> The way these tests are written, make the fetchasset plugin blind to
> the assets.  This adds some more code duplication, true, but it will
> aid the fetchasset plugin to download or verify the existence of these
> assets in advance.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/boot_linux_console.py | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
