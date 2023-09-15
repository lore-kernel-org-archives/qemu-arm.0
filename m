Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1086927ejb;
        Fri, 15 Sep 2023 02:14:34 -0700 (PDT)
X-Received: by 2002:aa7:c252:0:b0:522:3a89:a7bc with SMTP id y18-20020aa7c252000000b005223a89a7bcmr725269edo.42.1694769274335;
        Fri, 15 Sep 2023 02:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694769274; cv=none;
        d=google.com; s=arc-20160816;
        b=kuSWybIHZwT9XzDLl5Md9x6GPugR5Ps/v88keg51fKBdThsGrIYtPQGhD9JGwiY39a
         xwc7ltTU+NxMSMStkpATMABiYuRHn4PBY2KIaUaJbgx/R4ilalPwxpQqOOQFjgThl/sV
         MkNoWNnNDSilebkmAXWSMQd/K5OjLdSZMatYQapvwdwdueOMI6kX0U0RifvKYLT7ri1J
         kreTVHh1MjZZtkG+q5UZMDNuQc51teKb+x/ECkVVmPoY/InFNTDrHj8BXLWKemZJ9AHv
         2/7j0auXnvDmeI7n8G1S/FPxDahWzkrBSolR/P0Xr3lCyuFJopE5j6mofvadvTaioevf
         +SXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=csH8uynrhAKRyNtySU3G0SLyp0u8KMtuWG9AGTXrGYE=;
        fh=rXwYELN1Yk2GWM+Zx5hXYa+NhNYIG215ZTc2cIcOsY4=;
        b=0QW5zTGZNgTrEbdsU8XkvW1hq0o+/XCCJkDyYWHJqeQ1C0IE1hwfcQsa2eaNvijJ9y
         PufWQ27HRQzYmOPC95aCzaIQk7wjgkIUhQGPWHkW1TdQwe9yC8kXLFxpNRd5EaMRUTKU
         rAZs2rPOCm/tiaM61JXe7d2oETxtsBp06lyzSzb92gs6VuQLCCDc17sdK3zCHvCBQNAZ
         IuTT8O2IovRfE6qQJka4/CXqER5Lh0dtmwlr4YFrhiw0DYFo183jarkUbAJm/13aaQqY
         F9mWQ0ixOo8nYK8j+Q13Xz0R8mquQ76D5LNEcCuwrn1TpPdMtml+55SWPluYF6iI+RYN
         iYaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rD27yx8i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a19-20020a50c313000000b0053077ae3be7sor446550edb.4.2023.09.15.02.14.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 15 Sep 2023 02:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rD27yx8i;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769274; x=1695374074; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csH8uynrhAKRyNtySU3G0SLyp0u8KMtuWG9AGTXrGYE=;
        b=rD27yx8iXIgo9M5J65aNlUoLTeXzYddNxF6nj3TGVSb6/auAjyEkK2LO+AdPFzSICC
         HwIGQWl3V91GPlM2HyevniMPGIaeqHQK97+VgLPk0JN5em8ukRBLt1mJroftiYzcz7Kt
         7kPI/7wlqmpAG0Gao/mIbTJ2/ndRdbxHJfcciNIL/bfkR2NTAdbyrZwWRLF+maM3O+DA
         hdU3vLOjXjiltpU5y2Px6K5nDr2LNW7h+r+iy3wZcpPXb6n9qKGixbXJxADCN9AEuRWO
         2F7MJwfI3sosD7sjLOD4QerdOhMjWSTG2SOxhvjo+dXeNXJN6YqFX6VdO//aKnCDeC5/
         DSuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769274; x=1695374074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csH8uynrhAKRyNtySU3G0SLyp0u8KMtuWG9AGTXrGYE=;
        b=dlCQhihvTVZ+/yXe+LJau+TwxsXLhjChfG2iXLoCKhvObRQiPATGJ2tCAFKfnmvNJc
         Rdz9O3NflLO1/bi5H/mZ1KqcbgrX/U30p1W23wJyQQLmY3RThyTMY6u67vYTRAYiAcL2
         K734iR7Kdb4uf7fp6zp2YEsxQflXJBj28N7TfEeaGfspOvB7DXG3C+XvRrTW21E188n0
         uHvzQwtFYzkcI3oPpFWCCF8PYnFoiQNVNhFcdZIbMFPDEpmq6mzl7HqWtqH6xH+oyk6I
         tcsobwbRK9vH7GcDtepVDizXxCQAA4A9n/WSXdNJcmbilR2FWP9ffY9kx5FR5KpuVLYP
         WDFw==
X-Gm-Message-State: AOJu0YzWqhQzNe050vIw3HXfLow6JgNdvsV6MtlksPQdPT261hQ1HU1K
	3CH33gZmMfhM+0pCYcuFkRZgVgexwivJStZa4T/A7g==
X-Google-Smtp-Source: AGHT+IGZ8EaVyfDw9TBqdJ0RB7ZP2Pmyqfw5bkWeQJt1slikn5Yy00nkOq7A/UCdrE0Ei0pkv+6ijQ==
X-Received: by 2002:a05:6402:703:b0:523:3889:542a with SMTP id w3-20020a056402070300b005233889542amr1023965edx.34.1694769273712;
        Fri, 15 Sep 2023 02:14:33 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-223-129.abo.bbox.fr. [176.131.223.129])
        by smtp.gmail.com with ESMTPSA id v15-20020a056402348f00b005308a170845sm532918edc.29.2023.09.15.02.14.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 02:14:33 -0700 (PDT)
Message-ID: <30ac04ad-eb02-90ad-57ff-089538413602@linaro.org>
Date: Fri, 15 Sep 2023 11:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 1/9] tests: update Debian images to Bookworm
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Cc: Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 John Snow <jsnow@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-2-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230914155422.426639-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 9MrB0eLGMuzl

On 14/9/23 17:54, Alex Bennée wrote:
> Bookworm has been out a while now. Time to update our containers to
> the current stable. This requires the latest lcitool repo so update
> the sub-module too.
> 
> For some reason the MIPs containers won't build so skip those for now.

Debian removed mipsel:
https://lists.debian.org/debian-devel-announce/2023/09/msg00000.html
https://lists.debian.org/debian-release/2019/08/msg00582.html ...

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .../dockerfiles/debian-amd64-cross.docker      | 10 +++-------
>   tests/docker/dockerfiles/debian-amd64.docker   | 10 +++-------
>   .../dockerfiles/debian-arm64-cross.docker      | 10 +++-------
>   .../dockerfiles/debian-armel-cross.docker      | 10 +++-------
>   .../dockerfiles/debian-armhf-cross.docker      | 10 +++-------
>   .../dockerfiles/debian-ppc64el-cross.docker    | 10 +++-------
>   .../dockerfiles/debian-s390x-cross.docker      | 10 +++-------
>   tests/docker/dockerfiles/ubuntu2004.docker     |  2 +-
>   tests/docker/dockerfiles/ubuntu2204.docker     |  2 +-
>   tests/lcitool/libvirt-ci                       |  2 +-
>   tests/lcitool/refresh                          | 18 +++++++++---------
>   11 files changed, 33 insertions(+), 61 deletions(-)


> @@ -133,24 +133,24 @@ try:
>       #
>       # Cross compiling builds
>       #
> -    generate_dockerfile("debian-amd64-cross", "debian-11",
> +    generate_dockerfile("debian-amd64-cross", "debian-12",
>                           cross="x86_64",
>                           trailer=cross_build("x86_64-linux-gnu-",
>                                               "x86_64-softmmu,"
>                                               "x86_64-linux-user,"
>                                               "i386-softmmu,i386-linux-user"))
>   
> -    generate_dockerfile("debian-arm64-cross", "debian-11",
> +    generate_dockerfile("debian-arm64-cross", "debian-12",
>                           cross="aarch64",
>                           trailer=cross_build("aarch64-linux-gnu-",
>                                               "aarch64-softmmu,aarch64-linux-user"))
>   
> -    generate_dockerfile("debian-armel-cross", "debian-11",
> +    generate_dockerfile("debian-armel-cross", "debian-12",
>                           cross="armv6l",
>                           trailer=cross_build("arm-linux-gnueabi-",
>                                               "arm-softmmu,arm-linux-user,armeb-linux-user"))
>   
> -    generate_dockerfile("debian-armhf-cross", "debian-11",
> +    generate_dockerfile("debian-armhf-cross", "debian-12",
>                           cross="armv7l",
>                           trailer=cross_build("arm-linux-gnueabihf-",
>                                               "arm-softmmu,arm-linux-user"))
> @@ -165,7 +165,7 @@ try:

... so we have to keep bullseye here:

>      generate_dockerfile("debian-mipsel-cross", "debian-11",
>                           trailer=cross_build("mipsel-linux-gnu-",
>                                               "mipsel-softmmu,mipsel-linux-user"))

but the mips64el should work:

     generate_dockerfile("debian-mips64el-cross", "debian-12",
                         cross="mips64el", ...

Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
