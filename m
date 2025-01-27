Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2490601njk;
        Mon, 27 Jan 2025 06:54:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAt+sWpa40yIdQ0BbrAxQ+xuVYa3EahgcbYypC41K/vqHTzcQfTr22nogp/dfqk+NmuByxfHseJORO9g==@linaro.org
X-Received: by 2002:a05:600c:5119:b0:434:a529:3b87 with SMTP id 5b1f17b1804b1-438913cb50dmr451305095e9.10.1737989695379;
        Mon, 27 Jan 2025 06:54:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737989695; cv=none;
        d=google.com; s=arc-20240605;
        b=BiahZePBvi2HuyVtxyFusNo6jIdH/f+D+jUD/IZ5D/y91D2WWpMekkWbCJDQgAAuM1
         ktOX/c8tww51/PkCvtnj9xNt0DV3u9z74iy4/jksGLy0vytXNFbt0j8XF4e4gH1EepUP
         vuLnz/z9Bc2JJTcrNB6aKF8MPdmwFd5qpQyUd5BqXdahnzawKYkJCmwDvG67tp7PuTvp
         jvkfHyj6qZXa8THbDH7ISr10O8E4DkqmE9/J3W5eE/RDnlzRdcyEUWf5qjgmVdHiADxY
         r0E3affj2uMIvI61RMTAP6Mp//ffmhuRw+cPZLVu0qoTwGZCxj8h/q3Fhsgwy0dwYyjH
         A8LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9TWdd0QxdeY2OeyZBUdXqsmxJKK6cy4HHzaxyvCkSNQ=;
        fh=5hMs2QIf5iAnYLAeOgv2u0PuB7iy0PncCvRx3bzRSvs=;
        b=YoF2vSkbKEUlPvTzR2GQozxh6+44PsjRvy4HUfT2Xgx/mcm+RfwQDg3UghnW6418K2
         7VJGrcQonhWrPCvSJtHtwSpZ1hJ4EFgoONS1M/0YP822Da/sUXzbnTb6/2PVHlr3Dpfz
         4clpjUHRnYJY7ZvPvpgBcIcdq/yxlqEgtlck/lnTEBSm/f0JD4PWa9oUCLfxyLAsdmtn
         tk6En55yHu2KI49A6OHMN7Tnl9yis9IVoGplXc58BYhRqPgMOO2s403Fsu48ZX5sfAFV
         NzJS0hrqN4V9zE29CtgG42SmSCO3LDO6m/Qi8fusOrz8wq6EPt/CkE+cMIctcPmSoPz/
         YWYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CiWfbrGY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438bd4f8ca4sor23842425e9.9.2025.01.27.06.54.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 27 Jan 2025 06:54:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CiWfbrGY;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737989695; x=1738594495; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9TWdd0QxdeY2OeyZBUdXqsmxJKK6cy4HHzaxyvCkSNQ=;
        b=CiWfbrGYw3VoSw1uFpvR5SvSCfxwNlq41QAR4FGrxVXGSn38YcHicn/luHcwW3bYPy
         DOCD2miE3tCCrKCYl51ec05otYW3aERxgSwt4rG5qnFfE8kjyRQxqNbwxoaUE4z8KjKY
         2j3pJk0g+fVUDEHqiFZNYFy+vXqYz8MnsNSwV9npN7AI21nRrT4hJnkKwrfl7rjzi7Lj
         9xvtb4kTQ4Q+x5zWw8njXLoKqmQFwQTmz2w0FhLoB8j11L1Mr/BK6n4C0bSlYSMXDCnT
         Sg76+3sd92bu/Wlb534Gdk8XcY2WSNXcBJg7Sb7muEnERQSXhpeSyqe80Ws4sr1iD3kQ
         jSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737989695; x=1738594495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TWdd0QxdeY2OeyZBUdXqsmxJKK6cy4HHzaxyvCkSNQ=;
        b=oZdzNSveufN3XSbjorZgDce/P4dzSVX3qDjlCzEU2P7Xpaz4IyUgG/a+FwTVlwBzK5
         XPvV9J39jUBNDd2s53ywHXaX6wjsIavc6EWqwi5Nl7OBNAGVvJujJneuszCSDGFmbFBy
         0/mrMBbL8W5fdqXcMwkZSW7R6du/KzkZa6tNnuebMMagxbnwuQxhP7RK4jD6q+B5mDSm
         RCIcYNE763E/V1OIIoUxYR8UkgJWWodvB/NThfLKacTBFontxAO9pzysIN1di4qyFzTX
         NLCCU6dNKRleV2GYFdGZQbe9FZdy6yYFVIMCAYdJ5k/hTAQgea5BGrurNbE9DPcDHRh3
         DRiw==
X-Forwarded-Encrypted: i=1; AJvYcCWttiEjml9MspROofcUSglNjq9DenbuW3GDT0feeRzKwIyK+16e+3B5BNs7BFImpXI6WjN64rHbMJ24Dw==@linaro.org
X-Gm-Message-State: AOJu0YwyOcIBDhJh4qT2AQ4LYKJxE6fsB3E7f31NlsNo6X+GkQI50UNx
	GYwIz9FPw7jJC7eP+XHN0Vj/2likTofrThQttawcedNC+8cvGmiIgrll6qAk/9OB8PV7xU7y1LA
	3shOQVw==
X-Gm-Gg: ASbGncu1V2FEW4hDjef5F0zLPdm48com96Jkn/CXDrWiULuPcs+nJxphf0JZZflloVc
	lexBDAkedK0e+h9i0OeA58G4b2Zy0zju6f4JXpQR8grByJZRBfSzE8GbdJdVNL8u/hrIq6+cHiv
	FZN05EhBywz+Ches7mpBurrlD76b8+LW6F4Fnbi1ccsgAQtiNlVfSkQ8t5lXjC3Od9VNU4WhT+e
	RpMErq+Ban5ceYpW9k+KqCEpIpswUf6OR4bZ0+DMD8ZR9M79MiTInUfhJWZIXPQNDd16w9olumh
	tXrsk9ucjOs6zgLl7v7osNJFuLSZXQ5o53vYAGac6O3H7VI7
X-Google-Smtp-Source: AGHT+IFdbb6gbhrsAsHM0qZ+TYzIF/wzFIRkSuvxmggXVsLAMdH77a6gUsgdyZmhH4RsOTjRsRwF+Q==
X-Received: by 2002:a05:600c:3b94:b0:434:9934:575 with SMTP id 5b1f17b1804b1-438913e02f8mr458008365e9.16.1737989694755;
        Mon, 27 Jan 2025 06:54:54 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.181] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f25csm133506235e9.1.2025.01.27.06.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 06:54:54 -0800 (PST)
Message-ID: <f1d4a5f8-bc0d-46df-802b-a1c5b62e9854@linaro.org>
Date: Mon, 27 Jan 2025 15:54:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] licenses: Remove SPDX tags not being license identifier
 for Linaro
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier
 <laurent@vivier.eu>, Cleber Rosa <crosa@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, mzamazal@redhat.com,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <arikalo@gmail.com>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, John Snow
 <jsnow@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20250102160510.61894-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250102160510.61894-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: E012NnZH/qpN

Cc'ing qemu-trivial@ (patch reviewed)

On 2/1/25 17:05, Philippe Mathieu-Daudé wrote:
> Per [*]:
> 
>    "we're only interested in adopting SPDX for recording the
>    licensing info, [not] any other SPDX metadata."
> 
> Replace the 'SPDX-FileCopyrightText' and 'SPDX-FileContributor'
> tags added by Linaro by 'Copyright (c)' and 'Authors' words
> respectively.
> 
> [*] https://lore.kernel.org/qemu-devel/20241007154548.1144961-4-berrange@redhat.com/
> 
> Inspired-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   accel/tcg/vcpu-state.h                           | 9 +++++++--
>   include/hw/misc/ivshmem-flat.h                   | 5 +++--
>   hw/misc/ivshmem-flat.c                           | 5 +++--
>   target/m68k/semihosting-stub.c                   | 7 +++++--
>   target/mips/tcg/system/semihosting-stub.c        | 5 +++--
>   tests/qtest/libqos/virtio-scmi.c                 | 2 +-
>   scripts/qom-cast-macro-clean-cocci-gen.py        | 7 +++++--
>   tests/functional/test_aarch64_sbsaref.py         | 8 +++++---
>   tests/functional/test_aarch64_sbsaref_alpine.py  | 8 +++++---
>   tests/functional/test_aarch64_sbsaref_freebsd.py | 8 +++++---
>   10 files changed, 42 insertions(+), 22 deletions(-)
