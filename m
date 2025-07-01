Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3048372dye;
        Tue, 1 Jul 2025 03:17:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtZSaDNbDpEpI8d9+bqQnE625yi/kHXLeM0qcYxN0/rTHrziJJNvbfJ++PSKNwhMCwZKri1poMYnJ1wg==@linaro.org
X-Received: by 2002:a05:6000:2d89:b0:3a3:7753:20ff with SMTP id ffacd0b85a97d-3a8ffdbef1dmr14013745f8f.35.1751365065367;
        Tue, 01 Jul 2025 03:17:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751365065; cv=none;
        d=google.com; s=arc-20240605;
        b=eSHP5ZlNaVXrFTzKqtxU7Mj1GVC1fH1eh4cy7Vv6CjepirNVhyJnqisXbPeAcAIbVG
         VNVwTQi3AzT/XB9udXVV58sKwTy+EPbcT0pO1A+7CtZNVmFyoBY55Vn777MBSmfOBVdf
         7BAA36xeoakAnIs5s3GArXSUAaPuugvRgmo+7sqEII1aHOZvzAS/d8ds8BAaNqi1LfcN
         7qZwjYgUfCrX3U0NgWUkHgy/szWQgI89GNQfHXmJ/pASlFPVzXFx1mVnF4SyNpKQnNzb
         p0C5HfhVIioTm+vH5pJmhmA127/q2mO+tZ9UVT4hCa7K8oE6vQKVyCGdzrOfsw3rCrTF
         dVqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Qh+yvpcI8r39ZKZnBJSA3xxSTxkk3HrG+GtGOxH4/PM=;
        fh=skTnQ959amxmGf9l3j5ddTr2xZ5WBR1xFCZ2XnmYnuc=;
        b=fSd0mxSApCw/jhJbTtpHeI/Gu/S3H+MrVfDoAwBRdyMt/DIZUOlLR9GYoemthHIwKM
         +bj+P3KJObnBuHRL913KxB+/GhPF6yrY11LVdBRMnaahYpSUXbmN+8q3x2AgQYQQx1Ak
         P1OCl/GuSnkrMiAR99gpZCLRrrA4Iz7xYbiQgz9k2tVAb55PxBIQbJ+z4HZ5xdIY8hpv
         Vi09LHfHMyLE/yJ3smRWfL0J1Qb6qZPArpBuXyLNMpRbIy0UCEOs/KHo1cAjguxFxBdH
         IofFKNCqmGYSsQSHJXS0QdKqXTiew9Bz7TVKyJ9kg6dWpn4dXT4DzCfKqcgX2oQCJ5+4
         52UA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHrWNRa+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4538a3ab1b7sor40603715e9.1.2025.07.01.03.17.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 03:17:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pHrWNRa+;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751365065; x=1751969865; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qh+yvpcI8r39ZKZnBJSA3xxSTxkk3HrG+GtGOxH4/PM=;
        b=pHrWNRa+C+DB0q9NMuTiUSrf5kd3p4o6CBgsvlm5mFXybcIyyvQtylxix46eqPUy2h
         bRuaxsGs/RWE3mMi/dlFnJAHHJpD53zD1sovIX/6HS1SCTzrx+UkSnxSEbvXCZSsfBUB
         rfASfVKFikHpGvxXladb05YkpwDBRiXbNxFRY6Fkg/0JVY3mT3jhCvWblQeA93FCTuKu
         1j0Aiob6iPm4vaZH7JFDbOzXjoCViJmVV12SXisNG/TCj3Y6IGBeXVC579ILwDMIhQC1
         CtgRImTmRd63Trikul6Mw53q1E5aIX3oB/vaoWQBuALsC13oKSKXNKOB1uI4Knc0/5ng
         Rl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751365065; x=1751969865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh+yvpcI8r39ZKZnBJSA3xxSTxkk3HrG+GtGOxH4/PM=;
        b=hsepy/nJ4MgHwxTj5yrbWLukxxYRrxemvupumw+dbMwWIuBDaBE5geE2vf7hWssR92
         c/3NIzxjOrCwNQ7ZrPQYwnpbEVixwW0GXyR0BMcxoL/77PZecBo6AU20xQ/DcbI9xahn
         WmLo5nA/LwdfAavxSyXMgwiR5tTGTFRfNzutlX2cgQaY7ASE7fb4wVT5jqzX8ygeVrFT
         wrFxs5gmdwvb42wLZ7q/58uaEtYw6Df5xmp27sbpX7PjKamlcBTD9JXlarGVBNHs2dV0
         AEvpMe3T9GTfW1wr2M1+e6+69B8Wp51EEp4yogInN4quMuNjNc7wksRV+ka+QoNSdsch
         tEqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrfEj9xjm1aG5v2Ag6hMJgX5gcmuw3VLQjuvHMYJ8wBqRA6legzrvOZrqaRQx2inqSMdNI0xN4Fs/MRg==@linaro.org
X-Gm-Message-State: AOJu0Yz7/7jLvjtXpRXKVbv7vKT49VhI0gRBuHy8ZgcvTFZetbgqyEG3
	NYYvmvhNeGCgdpbkR7Lw44lGF8QQtzV4RJaJfaPQFYNjRepwZXZK4xEIRhL1enhbiUj0Jg==
X-Gm-Gg: ASbGncuPLBxg7e1xd12S+qS81aogT7ht8eapJiNLXV8bVa9Fm7nKnvCWfVPSI3Q0LRV
	AILrneb/GmNYL1ecuYXUs0Fou9F3PeB5q/21R1+P4TlQQK38v/naAKXl759Zmh3wr/o1Hz1swmp
	mz9ST6g9shV6qcnwxaRaAaY/wN/7VTuYfCVYWD7llfNHaZfhWlYpI5TQ3vdH6xaLD0/G8yE1WmE
	5sn/VYA5kGkFCdNyB448Pfz0XkiZwhdHIow5zgVlMbSP26FGouAi7OiyH1ZGWOwLxZ/3HWeFH9k
	3UlHsH1dbYHmfM2x6KdW0/iMXj3V6epyzBX0Rr/HRW8aZQKmE0Ys0hV//+aQzH4oQ2EM54Ne2es
	EwTQoCbbOEly47L+Xe17QlLsArcdKIA==
X-Google-Smtp-Source: AGHT+IE5IcBl2vXleQw3Z4b776SWAI+wP2cBamwyIbAvuDtna+L1v0oFCMG9wzPPraFIdJIOW3LE1g==
X-Received: by 2002:a05:6000:2b0d:b0:3a4:dfc2:2a3e with SMTP id ffacd0b85a97d-3a90038b75bmr11438237f8f.39.1751365064682;
        Tue, 01 Jul 2025 03:17:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.166] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b6b3sm195419235e9.13.2025.07.01.03.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:17:44 -0700 (PDT)
Message-ID: <ae5bcf94-b9ea-43d7-b3f5-fb3a5674f9fa@linaro.org>
Date: Tue, 1 Jul 2025 12:17:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/26] target/arm: Restrict system register properties
 to system binary
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250623121845.7214-1-philmd@linaro.org>
 <20250623121845.7214-13-philmd@linaro.org>
 <CAFEAcA87+SMWdSOGBaGuNDzynaLzoFMKv3PJmbfTyd3mN_TwzQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA87+SMWdSOGBaGuNDzynaLzoFMKv3PJmbfTyd3mN_TwzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EhEmwtERPYCs

On 1/7/25 11:55, Peter Maydell wrote:
> On Mon, 23 Jun 2025 at 13:19, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> Do not expose the following system-specific properties on user-mode
>> binaries:
>>
>>   - psci-conduit
>>   - cntfrq (ARM_FEATURE_GENERIC_TIMER)
>>   - rvbar (ARM_FEATURE_V8)
>>   - has-mpu (ARM_FEATURE_PMSA)
>>   - pmsav7-dregion (ARM_FEATURE_PMSA)
>>   - reset-cbar (ARM_FEATURE_CBAR)
>>   - reset-hivecs (ARM_FEATURE_M)
>>   - init-nsvtor (ARM_FEATURE_M)
>>   - init-svtor (ARM_FEATURE_M_SECURITY)
>>   - idau (ARM_FEATURE_M_SECURITY)
> 
> I guess these are user-accessible via "qemu-arm -cpu max,cntfrq= ..."
> syntax? Makes sense to not expose them, they won't do anything
> sensible.

Indeed, which could be confusing for users (set this property but no
behavior change), which is why I prefer to not expose them.
