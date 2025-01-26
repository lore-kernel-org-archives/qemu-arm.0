Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2066983njk;
        Sun, 26 Jan 2025 12:01:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUgn6fWbILPsCtALpRwVYob/idK4EExCcWZMY1H830LlbN9zDKKXPLp9Gr3WaF6JAJzHTVmWxIPoQjdWQ==@linaro.org
X-Received: by 2002:a05:6a20:3943:b0:1e1:c03c:b420 with SMTP id adf61e73a8af0-1eb21587174mr65728581637.31.1737921659986;
        Sun, 26 Jan 2025 12:00:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737921659; cv=none;
        d=google.com; s=arc-20240605;
        b=JAtgRClnkuMuTZYzEqXiHZrj7RlPsWdCdGsrtiXRkuNTI3r36Vfk9JMPXfuTeCbFL3
         TSES4Rx22WPJ9MQLSEfdqNoDhYaiCldHiAGh8Zezdt7n7dqVQ3htqHBWCWeY9R783QYI
         dso6kfOKCfDAPBQPBfNWdjujrA1JoTFGT+MrgEvLC/J+yU06JtdTVJV/fDgaB4I39bd/
         +zgGDtlGl7myAHPmbCiMyNCEpl23xo6ZH8tPsH2hkLGrU138M+8eenPxVScK0MaQJZua
         A9Qabqi6e1Lhj3iM75OTq9DGV/JbK81IsJdS1uMRFMYkFXkb77lg8cM9tyHHiMueygiO
         Ck8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=UTEeD0XMSKGDjb4UjeehXNP6i1pjJAUAQz3ZrUzV6BY=;
        fh=/s1Z+3/E4BlTW8eswgCpawpS2JFQloO27BuRsyB+S2I=;
        b=TIa4sLGTcL67qG4a0FCe4+eY8/ggFDXjES+oIvwWyHDm5A2ENTkep0vCHjR5jBQ1fx
         tuTFrCzPzUhsEX5fKpfFZCXaGeBS/VZJczaBA09EKyCuaTPnrd1Pwy5lFXhg/bVugPT5
         poJePtDCtWANCojMVgmpguOwl4evf9iyNvYdHwu+3c4m0FnZR+xSmppzOQSPosAZVo0F
         rN5gnvwe5AxsF+N1GXrOcuJTxDcQP1gWBwi3OfftabV5pOnh/txdPXl6CI/8lDXC+tuo
         8ApPeietnNEh5PMeXvN+Y1fCLE+11FK2cK3I5H9hkPdEN99wQ6l0BaEQC/0n0oxchRM/
         hqFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqVcEb1y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-ac48e65fffesor2965889a12.2.2025.01.26.12.00.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 26 Jan 2025 12:00:59 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uqVcEb1y;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737921659; x=1738526459; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UTEeD0XMSKGDjb4UjeehXNP6i1pjJAUAQz3ZrUzV6BY=;
        b=uqVcEb1ySHFQhmy/ZDGeOJviSBrEa6/765V3ppNabY2xdOimTTn1EVkk/+mo1qI332
         7gzCGz9E2HWxwmIL4dMdcttDn6iMes8F71OpXFrme8e9IDIIhHTqcoVFZkWz48B5i2JQ
         zP3VctIrEUGBeO2fyQN87drlI4bAslMo2fOAJmNK1Q5YYFoiSOx8DOtEte4HCgivi4NH
         SL73vDYZcA9M/c85PKmDwbBWo9wIDt+wC0uD2D/HyHmZpLUolI4XNVpCsW+mYDHSON6C
         74KTG1MiHQik0gPx0fJ7Vo69Qx5h7WzOiPnodHlcO1hYrFI8jiTGXBZ8RR0bVk9Ec10w
         k+kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737921659; x=1738526459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UTEeD0XMSKGDjb4UjeehXNP6i1pjJAUAQz3ZrUzV6BY=;
        b=ILYCWKOiUoxjs2+lSq520Jm6xgz45Wu2jjO+q8ZZo5PbsQ4IszhwU3UmgmU2w6O7T5
         rSBjdENVD50uBWBIG9wFyrcgtd4nCoQlxM2NRognMODXLTMsMsyLjSA73/Q7w3sOlIVL
         sQA3gtL7Wl7uQ+5Ff1nv3OZuJT8rrkqwIJ3cK36qJGfzAR9+HIi6+Sl2G6S9730Bxx+w
         iGB8h6Om6HIvUtKh8+uaHti01omBvcLmiEcNEzue4OnGxwcUJVkfU6CJhiCmdPBEweMl
         +OY48mYZg1tOE8p6jpiBXp0H9e2tBxTzhZgjCuowJj6hA38UQksE+4KnMvRlVGReYn5E
         UDLg==
X-Forwarded-Encrypted: i=1; AJvYcCX0hSzD5LzEBJ5/MXiKEZs24J+YH3pIaOheDhTQgU4AjsTS9LXD53NLfDd+loB10o39WLHU3vsigauZLg==@linaro.org
X-Gm-Message-State: AOJu0YxtoPWNkNYj+pi+7hfbUFk57TOkgd+8b6s3SLrMyhEiaamX/80d
	Q8X3kgDM3EplpF5P8Y3VddmYI6mK6Zjceui+EWlqWhkkp89p+OZgo9/G/UQWwluRAw==
X-Gm-Gg: ASbGncuWpBjG81JecrH3yzyusSH1orp4+Sqrk2Hyv0kazdcSwJ80HSclP6DI4ba/8C3
	HHx+VWWZGd4vCUCrRTEM3pC4HVzQJSwotirimtzF+Bb8vxDlVENBh1rjkGuUpezYFxM8W3s+JwW
	Rhv9os8ETatZihJy75dNU5IUgznmn6gEwPqr/GQ6gMr/phGhAofFCDiozKdP0dZluIoirg8Efhx
	/DdTL/1c6NC4woA5NuCe7N4kxRiBO3bGzIUSR8fljaS8MqbJM3pTOmchXI08CM25UyKlTCOsKYH
	duhGHT77A0dNXClDfVafRgOBkbvrLnSsclO8sNLJGT/2y8w=
X-Google-Smtp-Source: AGHT+IHk4oCZBkQ3EpN55L01I/3BlN88uO4hEsi17nz9LIDtFF+nfMo3swxHhoOsy6uzlknivzwr8w==
X-Received: by 2002:a05:6a21:99aa:b0:1e0:d89e:f5cc with SMTP id adf61e73a8af0-1eb21485c9bmr55831284637.11.1737921659596;
        Sun, 26 Jan 2025 12:00:59 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ac495983698sm4974713a12.55.2025.01.26.12.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 12:00:59 -0800 (PST)
Message-ID: <aa1564ba-b51d-4278-9368-2849266f8685@linaro.org>
Date: Sun, 26 Jan 2025 12:00:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] accel/tcg: Build tcg_flags helpers as common code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-8-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lXDu4niF4XxA

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> While cpu-exec.c is build for each target,tcg_flags helpers
> aren't target specific. Move them to cpu-exec-common.c to
> build them once.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   accel/tcg/cpu-exec-common.c | 33 +++++++++++++++++++++++++++++++++
>   accel/tcg/cpu-exec.c        | 32 --------------------------------
>   2 files changed, 33 insertions(+), 32 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
