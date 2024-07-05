Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1336800njb;
        Fri, 5 Jul 2024 09:35:00 -0700 (PDT)
X-Received: by 2002:a2e:8315:0:b0:2ee:8cbc:45d1 with SMTP id 38308e7fff4ca-2ee8ee354f8mr29665521fa.52.1720197300581;
        Fri, 05 Jul 2024 09:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720197300; cv=none;
        d=google.com; s=arc-20160816;
        b=boIc+BNOXHCTV9o4rRHRb79cRZxx0aj2eQ51D8aVOB7WoiEU/pGGmZ5qs9kVrC0QcY
         AYLrP+pdNe6l/PpitVujZiPjs4v0LVY/cx+BZrTqRXvGDK78d0OBIzy6aIcKT/rT1rwt
         MLEyWHo48bcWjpJmweOxs3IA9Zrz8MbBzTOuEwy2kZGWn4CMEBow4OjomBor4Yn251gn
         0/sjEYXAYkGLIvsIlJz4q+H3WSPGN3+PEHt87d6Ubq9GGGDMaqGRTtfN4UYi1t4HUHSZ
         /Z9Bit3+i9Fkr0j6U5ix4LDqkNFvaNCCumBlwq/ZXs46i1nKfSizy1dYk9uK2KuCLUTA
         lDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qVWSQG3CnDdkh7ckcl4qhpjIBkWTa9GUF45FvgsQbqY=;
        fh=q6inj+AP0PHbzuoi3QtMQaEJjzVwPZuy/n3Jj84RMxw=;
        b=v0Cgcw3VFvZu1ci3Sw0tvBxE0urqCcdtb2eaC+pOnIZ42RS3cld3SAOr7qfFZAigL1
         y3v2w7ZzshnalatFwhLhtG1ZGPPbMSI2yyJUaJnGb9Ni2iHmm6XVO6rszLszVqMpaKY5
         C0ElzP+k8LqhU5Cn/35zHnfjyoFV+3zt6RtDVbAbGyNS7J/IuYSt6ObLbd/6d38TguTo
         valup/X+uq8IaybQPXGRB8yekQv8qWlZSmVtpW7iERG6V8GmcURLpqcAcRXRqM6R95nH
         Md5Td03sPuxkEWroyK2zcja2QBnNVggFCIOPjgHyxbYhO495hOXpv5Bu5QiTy91oVzqY
         kyOg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QyZXB/G9";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 38308e7fff4ca-2ee855e3227sor14650391fa.8.2024.07.05.09.35.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 09:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="QyZXB/G9";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720197299; x=1720802099; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVWSQG3CnDdkh7ckcl4qhpjIBkWTa9GUF45FvgsQbqY=;
        b=QyZXB/G93t0e5hCIh73UCP86lhQM0OyTN3ao4nuAkav+pEZD7JOnqvb6lqgxDZDjma
         3QUBWaN3B7qR2WRriCGQfsSemlpaW6GxDHtbnGHgS/uZyg70bVjFhwUrG5G0Qa48iKTG
         it0amVYorgus0G/9+YHc19m8F1bn5SJa3HxGcu6NtlMu0kozxK82YV7bbclaQJdCM3Yq
         aXaIreKnvtC6ABIEWKnSH5Vhfi5v88Fxi2EhsvwzL8eCnD6WzYibLZiOOHGSj2CDmnhF
         R1s/AMA+uyGGdL242VU9g3JaJeOGnNQ/oYly7fTbD0ntBTkHEC99NfAvl6xbB1dTi3b+
         yavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720197299; x=1720802099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVWSQG3CnDdkh7ckcl4qhpjIBkWTa9GUF45FvgsQbqY=;
        b=TWTw+KF0rVb5sad53+Fzs3DNOlhusqcISWl/7oxquDEt5hBzz4ZoAFZm1iw/cJJ82Q
         Es0JB+43TgfpITszj2Z/HxyHyzNe+CTN6XLAkqOVQQNh1gcRc3XqK7CzBp8reHW+1mV0
         L9MJ6d7r9LA15JL9hcg60zfyds0pMgsxfIlaofN/fU8b1+LUwqOs4q8pAWORN4zMwlev
         idcPXR/VlkvuTzzF5h++isad5qOYVy36JtEORUbnVFd1ez1mrr/91XvZGEPscqVQSWWN
         y5X2SiMpEpUEKWEiUlPBMATcCn6ghMQapAie8NhqWRyiJ2gaR0CAYz9Ucw5uAxd+8VcY
         8Ljw==
X-Gm-Message-State: AOJu0Yz/AK3b5gIkKY2zsUEFsVsf3rZapRPP0NDCDLBumOqdsRkWf2Ne
	AZxh1Bvyehs0cR6QFW4HL42z2uudj7qPcWVi/Tv4mYzrG55bNEQh9eYbQMLKRrFdi0Tu/fue4uP
	NmLk=
X-Google-Smtp-Source: AGHT+IHUAQOzxjkwADsbM89h2pY5ZVgjSGeHIYaqUtyyOARHfPnp7b9i1SuOz4qDshsT2fx/apQA/Q==
X-Received: by 2002:a2e:8e82:0:b0:2ec:617b:4757 with SMTP id 38308e7fff4ca-2ee8ed8c869mr32639041fa.13.1720197299451;
        Fri, 05 Jul 2024 09:34:59 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.163.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264aa07a95sm66397295e9.1.2024.07.05.09.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 09:34:58 -0700 (PDT)
Message-ID: <07195265-2a54-4396-9724-2a63c98e45fb@linaro.org>
Date: Fri, 5 Jul 2024 18:34:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/40] gitlab: don't bother with KVM for TCI builds
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Aleksandar Rikalo <arikalo@gmail.com>, Mads Ynddal <mads@ynddal.dk>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paul Burton <paulburton@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
References: <20240705084047.857176-1-alex.bennee@linaro.org>
 <20240705084047.857176-21-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240705084047.857176-21-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LxhVDOf5DKVR

On 5/7/24 10:40, Alex Bennée wrote:
> In fact any other accelerator would be pointless as the point is to
> exercise the TCI accelerator anyway.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/buildtest.yml   | 2 +-
>   .gitlab-ci.d/crossbuilds.yml | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 425fc6479b..e3a0758bd9 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -635,7 +635,7 @@ build-tci:
>       - TARGETS="aarch64 arm hppa m68k microblaze ppc64 s390x x86_64"
>       - mkdir build
>       - cd build
> -    - ../configure --enable-tcg-interpreter --disable-docs --disable-gtk --disable-vnc
> +    - ../configure --enable-tcg-interpreter --disable-kvm --disable-docs --disable-gtk --disable-vnc

Shouldn't we also disable the other accelerators for completeness?

>           --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)"
>           || { cat config.log meson-logs/meson-log.txt && exit 1; }
>       - make -j"$JOBS"
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 3de0341afe..cb499e4ee0 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -68,7 +68,7 @@ cross-i686-tci:
>     variables:
>       IMAGE: debian-i686-cross
>       ACCEL: tcg-interpreter
> -    EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user --disable-plugins
> +    EXTRA_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user --disable-plugins --disable-kvm
>       MAKE_CHECK_ARGS: check check-tcg
>   
>   cross-mipsel-system:
