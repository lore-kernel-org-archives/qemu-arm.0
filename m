Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2157262lfc;
        Sun, 15 Mar 2020 14:03:28 -0700 (PDT)
X-Received: by 2002:a63:5f43:: with SMTP id t64mr24208288pgb.207.1584306208759;
        Sun, 15 Mar 2020 14:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584306208; cv=none;
        d=google.com; s=arc-20160816;
        b=mjDqXoRt6gMgXdrr1Xqi6ZVKe/OIwrSBQ0j/3pYm7xjZYlg6PsuTmmMPx6iOV02ARA
         46BqUdNclMk0ga5Hmi5x+GIFsELu2LECA9eL4YnMEdTigfA3ViDOxVhZ3bh635BdfeOG
         EVgmAULFZeerhY7j13Lgv0Du3zTdU5uUXjiLSRIWyG0M6yUVj9upVq0AhHWUYPB8/9vD
         uspLpT1ReeKhqRhatp1zvFk5jpwVA3SE9ZB/0JcmtBbU2QdjjVrxWdO+ph/N82ggEpz1
         H0nSxTvpDRexZ4zNZgTEzqqqUNPihcQGvY1xcMbF8eZEAidta0cWWkDEzTwG1Z4tGsRb
         4suA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Tf2d/Pl21azP6oW+6DBWLXnY3oSLQe0tdutvXKmprPs=;
        b=XyauNdXMwxHyrB23JZOyfnCURljGHJeFH6t2fhpbCS5PvP39o+HbPMdFPVQnKCUKym
         99QgfDOK/8dzVRlATwZogCG8qHaoFhuvKDSjj3ypI4KByROzAi0BU31lGKrJAq/9joFg
         nej2ixsgrVJG8/0ygJXuoaAXQCObXjL5jDkgAULQ/Ks0Bc8vBXoYQ0JOPJfbWvs6kVaR
         gC5aeJ76lK6WPtK6gNZdJwuq6K0Dj+HBRIHMtKxeZsJqUtQqsjGS8lVCkb46jub9WM9u
         Y3xkckK21eihc4uWUMTX5A8CM+J60R5eufaiCJHp9s1v4qfWq76jQ21LPnKMhz3rM4wU
         JEFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dNFPTvgl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m10sor17405943pjv.17.2020.03.15.14.03.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 14:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dNFPTvgl;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Tf2d/Pl21azP6oW+6DBWLXnY3oSLQe0tdutvXKmprPs=;
        b=dNFPTvgljfFOiJ2YAsaIlCtKqscBDJvAI8JT6p8y6vGZdv4Kdn4jqyC0lXIw9QHlXd
         21T2NyX1+7TOBoNjxtYVFf7MSleW5NO2ntxLDzQywJcfK8+/C+ISJdkK0ztYLe4Q5i2F
         qPZNYEmu4h4KIlDvc518jQy1KMx7bSKhhWSWp4Gybj2cjcPQY4pU+/Hb+ec2a56E7EO1
         A21W7zYYcGr/60BGPqWBzs8FzY+k7Ef1R9hrT6pyhKCahiM/IICoLpyv5QCntxFkwbeo
         HsYqxnpWiGDLJ9eJGfiH1hu2Q9SIBxSXn/Mfv6l/dYdhmEmugo1ngCkYkzT4GjutJRR6
         Iqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tf2d/Pl21azP6oW+6DBWLXnY3oSLQe0tdutvXKmprPs=;
        b=XIhDVgmFa6nLliE9d3fDPxT0wC8nDx3M337zQSMTcNSJ3pbJmvc5haAMuyAc/73vjN
         pyCOOSUwITiNpg2sLJdnY/EwCPDRzpSSdsyn2ASqk38Zd6kIxX7+w4eEwf0gX/P0j9MG
         CKTTPr2f291CVj9mpkBctzfRLBH8/emneybVpsnY5MIZlPwCHnUn+RE3x4XWZlkAy7Vl
         L8VU5WYWrfU7j3SzN1lkXKuf+7jYir0DvVl21lxGSRj8GxdTyWFvSDXzz80yQKr6Oymx
         M3cvYMninmFYkbDnw/lm2XaeSdnM91vGNHKBlgC1hhk2oewaVlam31S3VccuEzVh6Sef
         Tzaw==
X-Gm-Message-State: ANhLgQ2AeqUfXE6++lnkU3LLvgDRpn3gbXw3wdpKoVEL4z+tEcCuMUev
	yMDYKbrBXk4W60oayhEcm9cS8i8G
X-Google-Smtp-Source: ADFU+vvY8QDsdzkr3n15NQNan1u7ji2ivB7a+dbOciaTSo03WB6wWvQWtqSei9LxDxPKFJZf1CI8eQ==
X-Received: by 2002:a17:90a:d081:: with SMTP id k1mr23020343pju.57.1584306207058;
        Sun, 15 Mar 2020 14:03:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id e6sm14756519pgu.44.2020.03.15.14.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 14:03:26 -0700 (PDT)
Subject: Re: [PATCH 14/14] hw/core: Restrict CpuClass::get_crash_info() to
 system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-15-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad894cd9-7916-0a24-8466-adb41c3ad854@linaro.org>
Date: Sun, 15 Mar 2020 14:03:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-15-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: uRlcwpNI22IH

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/core/cpu.h | 7 ++++++-
>  hw/core/cpu.c         | 2 ++
>  2 files changed, 8 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
