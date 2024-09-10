Received: by 2002:a05:7022:6591:b0:89:eff1:5568 with SMTP id bd17csp1387873dlb;
        Tue, 10 Sep 2024 11:17:05 -0700 (PDT)
X-Received: by 2002:a17:907:3fa4:b0:a8d:250a:52b2 with SMTP id a640c23a62f3a-a9004745639mr33324166b.6.1725992224757;
        Tue, 10 Sep 2024 11:17:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725992224; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7ETPdTGkxY0gwgjiiAJVqz8uPBnzdvuHhUNK0BY3extJhXQBVbV6mTIKYGk2wYhKj
         LAOML5YpPuc43bdk9blIzP0xFdLqplh8jqX+Vdkzg8zyUuoahWIgaCMpmjxfYv/2Fzx/
         lJwYjNLxiNgKRjBfmxG0sKYypr8Pie3U4GHSlMiJBiK0AdEPC5XEmeEP1y+xd/wdBb0p
         FUueEgXuWol+2Froo7Kutd1UO1nxuJvzoQIvRibbzflEuRPUZK0nv7QTfYqbe3/tgKZW
         cgTKSRvVLTqDBFezBCFpM/pdKzegEQtcTBE55eNImu2r7qfTyVGZXrBUUQwTNW5t3INE
         AfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ZNpInoAnaoFw/b6JC0InJhjKIpedK1j64nWnGbkzwe8=;
        fh=10I7LMNqObWpOeLUn0pka3rx+ntIOUBPN93YO8lxOBg=;
        b=c95brIEfdxOhYo7Z/Kw4dTOEfDjbVVhvzRQTnzoJqPtPMDNrc6qFYaWZc9t/Tky/kM
         SRLqUeU9xyayTr4w/cNVh5Eq9uOjKTMxhY1dvKN1vR0BXEXIaD1m836PyepUhMT9pE1z
         pDRuZh0fQHDuvZZMO43qUrWvMAjyHJkeUGmdI7A3pISnlhChC39f3fpKQjBhzUTB0oGn
         /QoLrS+BtLCub8xou3R1ehXdB1B/jjEm+uOfdLNk+5ueMhE4P9m6EJg2xMIL13T4y3nq
         S1v3uSJt4WgBWXdNjkKtp+s3hHnMyCLBT/hWFK3ekMio76f7GDMliajzykbJcECnlLc0
         JaMw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oyHaoYCe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a8d25cc6fc7sor232236266b.17.2024.09.10.11.17.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 11:17:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oyHaoYCe;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725992224; x=1726597024; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNpInoAnaoFw/b6JC0InJhjKIpedK1j64nWnGbkzwe8=;
        b=oyHaoYCeJ8VdbQuXArW7c1DykNNwyNIIejQH5Y4NRDvS2Xydk2K19eaDW5alAatlGT
         E6DL7BtFBQhUhO/eyJFuzmJQFX876lQT8mFyku6R8DzT7FobeH/2biRiKc6FJ2yM+Tsj
         ky1iVNFkudpoQtyJUo66NKAbTZOEn2KOKsT7lS5428bhiKDrOw5Sfp3+kDm/Kwvja/fd
         4Uka3j9re58DS2Ewy3tjKtFNeBWA+bWrpHpAHjIl9S/LxtAo0tXHMEgjXCXeB5npWYvy
         Vv32SYOAC2Ia/0/xiEegPQVKHVkyajcFcCSqhbO+k15px2T47r+Kt6NV1tyhnQL2tzgw
         3OPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725992224; x=1726597024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNpInoAnaoFw/b6JC0InJhjKIpedK1j64nWnGbkzwe8=;
        b=AaNm/lUwOuo0ZvrwZj4d2kH/Vl3YDKstyxi9D9r3I/TlV0vg/HGEBrUFdl55+Wnv8C
         sllcYTCPX0K2jK5on8hVk4C2p1L1MfCVnoNWsWX3yaGNlYrORQ2xSDU1JtCHcMgQOZFl
         JarIjUYMJOLYIOUfiRlnSFlofmWPKkYTFm5mamaaMr6PHFZvmAxUbvgjtDi1KoCKws6f
         ECex7w5vwpYhiqWRGTUEWf5rrypCPKCTGAM3g7sm6RJNJOJcEtcWWhiPMyfDH47Aahf3
         FKAMLGOuaqC/TSF0m4TlC69ers7h202LgKAm+1vx4B8dXSdAmgWCfBiCqfM5JTclH4RV
         0uyw==
X-Gm-Message-State: AOJu0Yw74KsNuebVUzrBJLOv1UENQ/tTC7j9W9eMoWxh21KdAHU5f4xo
	mx28XfAPhYm8RmkKvxyjDskXQXtWFk2qwFSnZwBIcQvz6uGzrGEiGxtOXhDnbcm4ECUbvlDnOC8
	1wK4=
X-Google-Smtp-Source: AGHT+IHVBAS7aoNz98tml5HNyb5wUj8Kc52IBzujPkjYyxzcZdwbjvBFkiRx/JtImA3ubIeoEer34w==
X-Received: by 2002:a17:907:7f25:b0:a7d:e5b1:bf65 with SMTP id a640c23a62f3a-a9004818013mr46073066b.21.1725992223484;
        Tue, 10 Sep 2024 11:17:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.217.32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25ced20csm514193866b.172.2024.09.10.11.17.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 11:17:02 -0700 (PDT)
Message-ID: <8f93171c-2964-48dc-b742-72c73e57d917@linaro.org>
Date: Tue, 10 Sep 2024 20:16:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] tests/docker: remove debian-armel-cross
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Beraldo Leal <bleal@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20240910173900.4154726-1-alex.bennee@linaro.org>
 <20240910173900.4154726-2-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240910173900.4154726-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 62BGuM/OIQPr

On 10/9/24 19:38, Alex Bennée wrote:
> As debian-11 transitions to LTS we are starting to have problems
> building the image. While we could update to a later Debian building a
> 32 bit QEMU without modern floating point is niche host amongst the
> few remaining 32 bit hosts we regularly build for. For now we still
> have armhf-debian-cross-container which is currently built from the
> more recent debian-12.

Indeed I can't remember a armel build failure that wasn't also
happening on the armhf container.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Message-Id: <20240910140733.4007719-2-alex.bennee@linaro.org>
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/container-cross.yml              |   6 -
>   .gitlab-ci.d/crossbuilds.yml                  |   7 -
>   .../dockerfiles/debian-armel-cross.docker     | 179 ------------------
>   tests/lcitool/refresh                         |   6 -
>   4 files changed, 198 deletions(-)
>   delete mode 100644 tests/docker/dockerfiles/debian-armel-cross.docker

