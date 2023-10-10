Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp73787ejr;
        Tue, 10 Oct 2023 04:57:07 -0700 (PDT)
X-Received: by 2002:a05:6512:a91:b0:500:bf33:3add with SMTP id m17-20020a0565120a9100b00500bf333addmr19462704lfu.47.1696939026850;
        Tue, 10 Oct 2023 04:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696939026; cv=none;
        d=google.com; s=arc-20160816;
        b=gXX6VbuvcB8bVuirHxBP6j4yWb6yTqAYY8Cm5k4bM9gZ/A4/aNDSC+xWT6TyKvMojX
         1EPsT8KsqsAVeYDAF7SlbwRMsWmBrNL1KJZ2SfyHc/m8erEKg7NNtGHhRrw53vzVVL0g
         nWYw30+vC+Ue2DNqs4bAvDY3Y4CyQsyhdG6xvG8yfKUOLia14Bjn2vog9jHLF4XDZx4R
         I9CPrzyAUbuVsEAFQcknfFE1RqdSAMpRaRtVdzclv3WCKaKTOhKb+j5jJub4q8arFVD2
         cYMYQ8/EjgBGhyR6b3/PZUFjdxYLpQk3TCQCLKamVCHVnpqw3pxil5gi43XUOr6zQckU
         SzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eWF+m4pmlfZLAIpIOX8F8HUE5rhtBj2ixSHT38voTQM=;
        fh=laApbzcyDW67yvaQPTErmWsSK5B0H2U8qOdh4S20ATg=;
        b=s9b/TiirESgfZnfXQ0vzWG0VVv/bYYiTdDp9XLm4pP+28c0PaaAgxvH8cPwF6Uoe8/
         wKrk4og4Z6hD1wzyA3hNTy1U+Xk0yLt3CqzuEvRIEdE38muYCJE98fyjgv8mOTUZ3gEQ
         uydxsMgrTWJoU2tZLlrLVW5V5DSsZ+vCwUOswJosEK+B05TyfNOKsD82pNVOkPgxtss/
         eCRWKsP6Sx3RDXhdKC26cINrS9vbH9RSDYmQb+XBDMbTlTwK48CUnMhEjQDYokMD0O4E
         RXECul5biGUQP7baiqVPpVRyFGwJouR06P9FSgw62mFZoZK96WuawX9gpR+kG/UknbEy
         nYqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUyBCdsj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g27-20020a50d0db000000b00530e12636f9sor3761484edf.0.2023.10.10.04.57.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 04:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUyBCdsj;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939026; x=1697543826; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eWF+m4pmlfZLAIpIOX8F8HUE5rhtBj2ixSHT38voTQM=;
        b=XUyBCdsjPKUgi7KMI05y8yiTWamrIazcnyNe0ETS1D7+kYhOcElpdgrwj7ASORANWd
         xAabK7UwMBpKPl0PfSgiNIF6CHoNKsyV7YuLYD/y5+S1aTA1MAbBBAC3smt5p+z82Wui
         l9ORSBeeIwynz3YogRsNEMmwDUdgZ3VmJHTVtzMvKOe6zb4TBwayEHlA/OY51nu9D29w
         Gr0luRYqsRRbHFbnuVbNLi0RWsh2u8Q3FeatWUyOYbUcmMndsqSwnIWPgWxTGaFRi08C
         13FRx3UioA44ude/QJfqYh0XEG3ZTxMeEjR4g7OBKhE78kK8TZ3BX7AISZk/Kj5D0WKJ
         r9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939026; x=1697543826;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eWF+m4pmlfZLAIpIOX8F8HUE5rhtBj2ixSHT38voTQM=;
        b=XSwDeq1ayMm7CistS68jL3Igh2zxKPV9Q2NpHtlVMEUWttlADJSgv2t2Y7J7GMTVJA
         Yp9NWjuA2rsynMZTJKD+u+L6bFwpvCC1WqR72HX9nLhO83RD/yvCYdnxIweon2SyRplX
         8NY/ce4wv9OJgfQHJzdTHe/6vtHpCoh9QJRV62WDPIiNK4y7Ii9OMzOayg/uehdIGgh0
         Pl6xK/yVCXY6/H4aZSspVnQzUTaBjJX9tZRz12fETNXJWijth7jAshOj2KFgxVTEsdYW
         JTt6aJcB/8xuqcQI+8OudwFEFUiIUGx/HZVO5OirVelREt3gamy8W0jRRIEwVwCXc8N6
         Jz0g==
X-Gm-Message-State: AOJu0YwDXsDsMezEy95kJxC2D6olDrTXYjTUGZTi5rSjfysZ8g4IZUB9
	4ZZbyAkpMLACbmSmH7BajvYa1K4NrRXOPAVx533o3nTY
X-Google-Smtp-Source: AGHT+IHfB145nG+TeoZSEt8bxGhD8xr+jSnAGmMzYeB8hHxke6AQOQFtI21tddfQo93Ic2/LaESFjQ==
X-Received: by 2002:a05:6402:4308:b0:53d:983c:2672 with SMTP id m8-20020a056402430800b0053d983c2672mr1269807edc.38.1696939026191;
        Tue, 10 Oct 2023 04:57:06 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id c25-20020aa7d619000000b0053622a35665sm7438272edr.66.2023.10.10.04.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 04:57:05 -0700 (PDT)
Message-ID: <68a6e682-3cfd-9ea9-a81e-3f244b7893da@linaro.org>
Date: Tue, 10 Oct 2023 13:57:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 03/25] tests/lcitool: add swtpm to the package list
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-4-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231009164104.369749-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: vlKZr7vFSoY5

On 9/10/23 18:40, Alex Bennée wrote:
> We need this to test some TPM stuff.
> 
> Message-Id: <20230925144854.1872513-3-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   .gitlab-ci.d/cirrus/macos-12.vars                    | 2 +-
>   tests/docker/dockerfiles/alpine.docker               | 1 +
>   tests/docker/dockerfiles/centos8.docker              | 1 +
>   tests/docker/dockerfiles/debian-amd64-cross.docker   | 1 +
>   tests/docker/dockerfiles/debian-amd64.docker         | 1 +
>   tests/docker/dockerfiles/debian-arm64-cross.docker   | 1 +
>   tests/docker/dockerfiles/debian-armhf-cross.docker   | 1 +
>   tests/docker/dockerfiles/debian-ppc64el-cross.docker | 1 +
>   tests/docker/dockerfiles/debian-s390x-cross.docker   | 1 +
>   tests/docker/dockerfiles/fedora-win32-cross.docker   | 1 +
>   tests/docker/dockerfiles/fedora-win64-cross.docker   | 1 +
>   tests/docker/dockerfiles/fedora.docker               | 1 +
>   tests/docker/dockerfiles/opensuse-leap.docker        | 1 +
>   tests/docker/dockerfiles/ubuntu2204.docker           | 1 +
>   tests/lcitool/libvirt-ci                             | 2 +-
>   tests/lcitool/projects/qemu.yml                      | 1 +
>   16 files changed, 16 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
