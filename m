Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1736302njb;
        Mon, 29 Jul 2024 04:49:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXxGK14YlRGERRKAwMKKb3CE06FoeDyPTlqiLQqLoJGAWMnjZUGZXRaOpSMG0XVBF3XkS3yIDoOoZHmnyFGlgcxL12+GerS
X-Received: by 2002:a5d:4c42:0:b0:362:b906:99c4 with SMTP id ffacd0b85a97d-36b5d0ddbb3mr4162755f8f.58.1722253775842;
        Mon, 29 Jul 2024 04:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722253775; cv=none;
        d=google.com; s=arc-20160816;
        b=ch9biCFyDVCX1xIqqemLD6WXl3I9vGfCSWXesU5gAWw/IrvdODC4PpaqNGilPlkKZ1
         ziGUyqQlvGiB6KckVH9GYT7Enf1G4LwVOztb/sQa67qWYTCgwOjJcyXhm7UchWnpWFgU
         5kVSqbBPFCDTrmIRjsx6pCd+UgbjmWVZlUV84mZfdjBXvMRBHoes01sCHQPDB6gZg5gg
         IMwdd2PwEh90tXvG+QCBgMkgCHmvMANrSH+UH/E9oyGp8TqjtdqdGvGg3KcnJsuzqdNY
         qrauUzPbw9JgMkamNZt//tdbss1Y1lWZ3i2nKquQuL3SMFYhq402KMjS/5AV4tSJTLJM
         Y9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=9JnXahZi7Ry6BaSaWzwQlRdolcTPy7oGkuYP98Cp3gk=;
        fh=sMYb60gi7rh912O0hDQ2Rajt+/qEqF616Xg8RQGiXxg=;
        b=QuRlG55cSbc4Tt7AZvzhTAkAQo0f+0GH0ujYElJWYiKyqmudiYh6ipENeNtcfYF/Xz
         hhVehGHGIvleXdy1rSpNvH17IaaE6B00+ume08Ioqo0qLkJBnYkzvv5EQShJGgumvAX8
         DNNU5DKbwZ8VkPmYgNjb7/CRMthoX/swYtOq3Kr7MKiNyKEw+ZLzYkuDgD893CHBbUzK
         CP+LS5mjQjD/8ni3OTyKHE1TJFaGhkaaAiqJjDqEsEFEP/4NyC2BSbl0kT3kIQFlQrLo
         BqAEuASEVXUBXkfxADHufF83MbIFMJnpQPL6eOsQbZQ4eOzb5aVadyqUJJNswHDt4BP7
         rTqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tvjcPPfN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36b36837d1csor2655152f8f.7.2024.07.29.04.49.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 04:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tvjcPPfN;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722253775; x=1722858575; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JnXahZi7Ry6BaSaWzwQlRdolcTPy7oGkuYP98Cp3gk=;
        b=tvjcPPfNJG8gEJc5p0LVipyib/y0pQtGLhZD6txcU70ckTW+1iZTEefvOc9AnM6uOq
         ATLlEivlr0DPPgsbEYJJUEnRpquTqqFja9x5+iJUqvkeBFYHwMvjMWxFAPSccdX8Qf7V
         hEXg/hIKvvKg7+Xfldeq+j4hnCzV4gZOcK61rebP79JuT7H+aq9fz6HUVmmORLuQD4kF
         D3+julAwPW6vK9WI32WzQJWQXz89hHYu3VBroSCdQdEwyjlg55L8dJ8nhhae1YnphOtC
         /VtXXlxzdzJec2y2RvYD5/6DgGMcXKOOYEThk9yAP0lmhVPdchHlzbal6zF07/GvCEvA
         gV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722253775; x=1722858575;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JnXahZi7Ry6BaSaWzwQlRdolcTPy7oGkuYP98Cp3gk=;
        b=HOe7paohYhVA16AGhuBvHRoSAbkEgeRjOIZc+UwuTnMjwEJEjpXjYwV+Y6wfTkM4WQ
         M5D/kY8mR2EqnN120l8dMZhNbmXQtn3FlaLGSPoLJRTNk5qbA41NtQ56EuHYX3RPRZ2G
         MAMQJ1NA7lpMZRVvzlbn7asXmF4XsUk5Qr/TJZANv9iUTCoAs4jTNZN2/RgrOe5yJTxp
         9ZeswgP6bwp/2uQZ7gQIip6l00J4NsdeOxXCH88rrProB6ibaO7xXucjWk+LcdF5b62o
         +YfnR1oaMfyXDJqQDZNyKg9prhV5n2d57xqVPwajj1u1KMTQc+KVu8bluqArgd14UJCY
         vPUw==
X-Forwarded-Encrypted: i=1; AJvYcCUCxdBqsm7x4T/zTszaG3a4UGpNDStZ/BhSQz7bbb8Y02jKO8uT5PzGEQiT4a521PrdK4vHnZho/fNH65aK6q6iQ4S0NyQ6
X-Gm-Message-State: AOJu0Yx4s1z2wywvOMjBuJCukUZJ6UN/CGTdDMHSyMtPKmrkcPofH8RV
	BIJDGyDOX6kEpqYU4MmRdI0EJRtmdgWxvFbR44WhSOFkTC8KTD5zMDQKTZn4ms/wdw==
X-Google-Smtp-Source: AGHT+IFeeCiGV5thGBTiNh7gr+7QbahBgArLsgKhz9+VAJf8JWTBngqYPYwRIe5wowq9hn3JvNtDbw==
X-Received: by 2002:a5d:4e0d:0:b0:360:79d4:b098 with SMTP id ffacd0b85a97d-36b5d03ce06mr4046832f8f.29.1722253775119;
        Mon, 29 Jul 2024 04:49:35 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4281a26e1bcsm51280515e9.34.2024.07.29.04.49.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 04:49:34 -0700 (PDT)
Message-ID: <7ef24be1-e79c-49ce-8c73-3509a7c8d77a@linaro.org>
Date: Mon, 29 Jul 2024 13:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] tests/avocado: mips: fallback to HTTP given
 certificate expiration
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
 <20240726134438.14720-2-crosa@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240726134438.14720-2-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: b4V2ykYrGZmq

On 26/7/24 15:44, Cleber Rosa wrote:
> The SSL certificate installed at mipsdistros.mips.com has expired:
> 
>   0 s:CN = mipsdistros.mips.com
>   i:C = US, O = Amazon, OU = Server CA 1B, CN = Amazon
>   a:PKEY: rsaEncryption, 2048 (bit); sigalg: RSA-SHA256
>   v:NotBefore: Dec 23 00:00:00 2019 GMT; NotAfter: Jan 23 12:00:00 2021 GMT
> 
> Because this project has no control over that certificate and host,
> this falls back to plain HTTP instead.  The integrity of the
> downloaded files can be guaranteed by the existing hashes for those
> files (which are not modified here).
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/boot_linux_console.py | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
