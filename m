Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp1785440dyb;
        Sat, 21 Jun 2025 17:34:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVddODTHFGzM10wG+EhxAmJS2J6EKdamlK1hSGa7LxT88NHIZM5xo/t1d0PlGgg6jdjUONSULYEQwR7sg==@linaro.org
X-Received: by 2002:a05:6a00:1817:b0:748:f6a0:7731 with SMTP id d2e1a72fcca58-7490d72315dmr12511195b3a.23.1750552452130;
        Sat, 21 Jun 2025 17:34:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750552452; cv=none;
        d=google.com; s=arc-20240605;
        b=MACpq6HTPVmTcmY7ZwSodd276V9W3E9coLDoM06fOL4d9uGLyYBMh/vVyPdPu2/CWZ
         sEwxP7XS5BZ10uMuyVLqWn1YtlQqCqA1zxg+PETMchDaZDGqQpkeoTtBrNe8tXtI3jRt
         I+e0OvcIswYGqC9rbPz+t57Bl+5jC/OfVQCyR8QcSBHH8VFfoKVd+x3nhDLIxxluZmkj
         rd8ghMcGEumRds/SYvUErC52Ooeowbz8AVjZdQId7d+acWypxV4l5EOU2AdcdDdXuUOG
         k7Fbk4OvY/aregC/9Fy4wTg1feLweOLM71bBEjFAR7zTiIdDG6D8z9no7G1SeLQc59cm
         7Kbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=HQKq9VPzQu2m/paj8efF0ht9BTQlnBGHLNhyyPz0tU0=;
        fh=18vgtCmFpv/dDO0jGILQKat/KQkZ0hILvle6zyUYu7E=;
        b=NNQe7XlhCZ07xWXzk+M8C/wBEs1SgxL+LlvkgMHZ1WGIL1VND6EmGmvZbGTlS6b+gk
         WBO8sip1hpjEjIr9UhLNoZOoIkNs5oQxV0mNvbN3gPLYwnLeGWQmC/Qi5ln2uwaIA2XW
         kflHx9Mbf7YAUC4nBvMstac1sNBiV+r2HWGJqicgnDB78fnrdczCFqDqhUfcfSw3kbPp
         Wl72p9Vzj8HqM1LljCFPpwukGOP5xv85iajW9sfztrSFFVF2KR7SIaHoP9ML10uXPSWx
         w5VdV1Vv+v0xIyf+38vwipVdw5zElLoWY6b0UIC+WAAHrC0LycuWA8NoQ0LRrEYTSxvv
         xURg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g6ZlO/nq";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7490a2f104fsor2110170b3a.0.2025.06.21.17.34.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 21 Jun 2025 17:34:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g6ZlO/nq";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750552452; x=1751157252; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HQKq9VPzQu2m/paj8efF0ht9BTQlnBGHLNhyyPz0tU0=;
        b=g6ZlO/nqTIJklyQAAjURdKTmlcif5yfptgqkx8StOWCFlzNh8KJjY8dKKSlUiHhhNk
         WL1WxZnBc/pIxTE8jiAoSH3EZ9y2eS2LVq/M6RNIOxG0MqEDsGLHD8u0AakT/I2FqoZR
         snx38jQ4k1mYzm/4z51Cu6u+YR/UqPc1fGb/A1G3VNWo+dqbBdFWGvM49x44DaCVded6
         vFMnvkJhG4xEtFm0A4CP7JUd/tNyzPFoKWKxy+p5dxIh+1e/2Vo6g/uuBeDLos+tP6LL
         T9UvxuOAmno9qOMvte6kj7wgoviUxUhBoz7P01TT3L/9gSty3pQWr0TwGRW5Xa6e5sbx
         IRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750552452; x=1751157252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HQKq9VPzQu2m/paj8efF0ht9BTQlnBGHLNhyyPz0tU0=;
        b=qWbdFfppqNrL9vHRN/1zKMzKjh7f8VYe1MtHf+IYz51vXGDOMf2B8JrH0z99lzXDF3
         b0pwKNSYNZnPBovntzcn2FmTMe8ViD6Fkx3PPFFlKXHVxTdOXvpJ755XWoV8C75ZrygE
         1UUcQMksgXiG+4gp93eUENl3ca/4ET9uwKPoQ7Nhkg/rmiuGGYiIcV7HqXfGVPohv6Qc
         MkSf2l/8hmqENIvzyDpVzaDHA3bDLIrlqOxl/xxCNYrZjDGoySGBnkxcXv67H5tJpc9z
         xkiHONJEQPzEL9FVBvKrnkYe/qEbCkg7HcBFhOMJO3EjvOh+eQQsMUHGhofWu8b87ks7
         Oj/g==
X-Forwarded-Encrypted: i=1; AJvYcCWQhFVYXhMBpPPyw9zsn1wlX2hEhfpiX8sULV3zKiw2dqFHRs0ehav5NXNJFmlKPkuat43Tvh0phPNATg==@linaro.org
X-Gm-Message-State: AOJu0YzRpocOA0wroNCX4vt18BiWpkpsocB/X+xKm8XcsMreUChanAdF
	MeoeDqZi1vgmuKp8N6u7abyVAL4QL8zvDqt8W+qn3h8b9vTsxehPa1UIQWY/XEagBuvERA==
X-Gm-Gg: ASbGncvQKgrdHolyj5U9VKYQV5BByFOfjvCLWrZcvQKUQjg8bzerLJqZyCAN5ygqCVB
	X3/scdrrUVHkXQq4esYWLF2CVOC4qvAvtq0I8hx+6DGcBuHJQyJgF0sCiXjrBXc7nUOniRCLWcd
	qqRNbJntUNV3JhmiJInCLb1DpldSKrwkoE7hXtjZwaMWh36L8hTydoIO0YyPlwEOld79m+HNcPn
	LaJ6PEqc5LsRpGJvceyxKvvzmyMxmgFel1KDFjwQJEnt2TvrY+lhJLC1HTxqmRlhgD6/v6lvIEB
	ekA/mrSatBLZ2SktYTBCU14ubxGWfOSbbLlX3ChCMKE7v59/nAMAuXVmkRlI0VHsl7hvnJ5pGg5
	CKSJIXZ9aTMj1u0OWvUnv5rrG1hNd
X-Google-Smtp-Source: AGHT+IE9ZIuXLJEu7AWPd+Sc/mHQkW/SCq5II3XmQewc9+ZNt/tbdvyhY7AYKtITLwaLNN8urQV2zw==
X-Received: by 2002:a05:6a00:22c4:b0:749:112:c172 with SMTP id d2e1a72fcca58-7490d691208mr10318918b3a.16.1750552451700;
        Sat, 21 Jun 2025 17:34:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-67-243.tukw.qwest.net. [174.21.67.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a64c203sm4946969b3a.112.2025.06.21.17.34.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 17:34:11 -0700 (PDT)
Message-ID: <9105ea2d-1f18-4977-8ca0-dcbe6c89b166@linaro.org>
Date: Sat, 21 Jun 2025 17:34:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/26] hw/arm/sbsa-ref: Tidy up use of RAMLIMIT_GB
 definition
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Leif Lindholm <leif.lindholm@oss.qualcomm.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Bernhard Beschow <shentey@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org, Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 John Snow <jsnow@redhat.com>
References: <20250620130709.31073-1-philmd@linaro.org>
 <20250620130709.31073-23-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250620130709.31073-23-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MXEltIC0mmSf

On 6/20/25 06:07, Philippe Mathieu-Daudé wrote:
> Define RAMLIMIT_BYTES using the TiB definition and display
> the error parsed with size_to_str():
> 
>    $ qemu-system-aarch64-unsigned -M sbsa-ref -m 9T
>    qemu-system-aarch64-unsigned: sbsa-ref: cannot model more than 8 TiB of RAM
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/sbsa-ref.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
