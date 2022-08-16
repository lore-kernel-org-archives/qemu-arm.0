Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1496005ejf;
        Mon, 15 Aug 2022 17:33:54 -0700 (PDT)
X-Received: by 2002:a17:90a:8001:b0:1f4:fe95:c420 with SMTP id b1-20020a17090a800100b001f4fe95c420mr21557148pjn.146.1660610034538;
        Mon, 15 Aug 2022 17:33:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660610034; cv=none;
        d=google.com; s=arc-20160816;
        b=Lwjn6rP/UAxQGCn37DNsXRLaVNrrXUV+RoWF0jKxgjO6bNoHPkJBD7rwKTG7iFBrwH
         ufve2vJix3rZ4/Bd95qtXz6jsLN2wSXKrhXxtyjFjEzHpUHo7TZsxBKIwEr6OjcGn/8J
         Y077GGPlitOXmdjL5gtFnR8fCuPoeWmEPFg0jCZdZZUU/fX1KX85tIun2CJiie8eMyeq
         V0DDkRobLo0zgQzRVZrJK1UnXFbnvKWg1FQGnElCRV1VVvotmGSdPhqLBRw/xhMiK7Hu
         4EP8jnwRZjp92MTO1FYKqU2ZxFni8ydrvG1jWpS0US04qg6H6jMz2kJhmv6iETvwUfRB
         Yksg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=H30dPL6TD/uhifjhrNgF/8ibs95HjsoodU+8JbgeFEA=;
        b=q+lgPMtXAESwZrLCmXvp2cUu4X46S0AOueoYSGKe52EI9s+modcIdVnIG/SaXdXiXN
         +jCbEoYrlKhw1aStYO65kwLFRVTHc/LYzgZXenllOho9WHcuWjCP/w5/kzTQPYY0VTuP
         6rL8iPwj6mij3LIl3qkIyC07qJyeqi0TtF7Xz0cbjvydScQnMhY/BtdZ3rLANXds2Pe1
         W9DyAhc+ov/H6tW9XtuGF8TXuy94H8OmkKKXERIZcrXdv35oV2Ar5cglNOHrm+kmntjN
         r1d3hTCS3bMGGj9pAdhhg9Z7adUcGuwad6RHE5+jC1iXsYQw4KE4MehHhjE4lTDr9lXv
         WOrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=byMsT9Co;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b1-20020a17090a800100b001f4fc6d7292sor76668pjn.1.2022.08.15.17.33.54
        (Google Transport Security);
        Mon, 15 Aug 2022 17:33:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=byMsT9Co;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=H30dPL6TD/uhifjhrNgF/8ibs95HjsoodU+8JbgeFEA=;
        b=byMsT9Co9+IRt57K97+bK8FIZgNJzFdvfegHNq5Ahwy1mkmXv0uULTFdLquRjCN6M6
         YThTZCgWIxYDNdN19c/Q//oKOz4lutarHwk8aAjMRQIeq1R1taQhgUODPt4aDz7TXwnd
         Gjd+po4ITAQC4tiIdVl2LmTWw1k9f8oOhbiPkxfuT7GBkKTp69PKTPFMn8cSNCboyPzi
         TE0YupLIaN9HFTQGKQUtJdkixB9CRYRlZTd2iWVFRhMoj4IchwECAcvzlxOuUfaN/n7i
         LoUbCY3IhSfjowZHzD7T1qTKgNUQ6nIsU6GKttb1UhVUw9zRqCea4n1Z8cJXKyAH37Uh
         eUGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=H30dPL6TD/uhifjhrNgF/8ibs95HjsoodU+8JbgeFEA=;
        b=wctcX6jOST4hWZqLib90ZTKzrVmZGuif/KTs4JT1Jj25kiqjgrrP/lxKcZi3Y1TSOa
         dbe+XCz/So/MvVvNtW0J/1j6y0+DxDtZYdKKuL8nXUd0TQHHbGbEUnEMAuwTcNYdvrHC
         I7u6vpXwIZpHVMwUVEmDFkSfGPhEhrvfuBOROV4dFgoPJySyLxE5xVR+hCi98aXJnzFC
         8XZKDBFP1Hw5+KVHIAGTV3A4NQHUc6bKS4nXbMh7G6Zl/t4mavlEourX62vs72I57Quj
         YdT3v5TQ4XXYOH8NIlgptw1TRQPyhVnjCj6/kxDyVdHvkcTkDrjp0oDmNREDtCfq8Ck0
         tClw==
X-Gm-Message-State: ACgBeo2Jmf61v+u9NddPpI4LRcoHHkzrK3hj06jCOW0LHcrl/aAa/eol
	XXNodXcmseR5386DN8mu7zVDhBmeHf4=
X-Google-Smtp-Source: AA6agR5RWUb3KtwiMWYHs8+DwsZH8rram3dNM1i3cir/t4tXQbSelF3jndQ2YiyhUFpPnVRJcLmf0A==
X-Received: by 2002:a17:90a:c402:b0:1f2:ca71:93a5 with SMTP id i2-20020a17090ac40200b001f2ca7193a5mr20895325pjt.34.1660610033812;
        Mon, 15 Aug 2022 17:33:53 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id h88-20020a17090a29e100b001f303d149casm5028276pjd.50.2022.08.15.17.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 17:33:53 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <a773c5d6-1c33-47b8-3ba4-7a989019d05e@amsat.org>
Date: Tue, 16 Aug 2022 02:33:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 4/7] target/mips: Honour -semihosting-config userspace=on
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220815190303.2061559-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UuDbV+gaXkCl

On 15/8/22 21:03, Peter Maydell wrote:
> Honour the commandline -semihosting-config userspace=on option,
> instead of always permitting userspace semihosting calls in system
> emulation mode, by passing the correct value to the is_userspace
> argument of semihosting_enabled().
> 
> Note that this is a behaviour change: if the user wants to
> do semihosting calls from userspace they must now specifically
> enable them on the command line.
> 
> MIPS semihosting is not implemented for linux-user builds.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/mips/tcg/translate.c               | 9 +++++----
>   target/mips/tcg/micromips_translate.c.inc | 6 +++---
>   target/mips/tcg/mips16e_translate.c.inc   | 2 +-
>   target/mips/tcg/nanomips_translate.c.inc  | 4 ++--
>   4 files changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
