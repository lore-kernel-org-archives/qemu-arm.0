Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp817693ejc;
        Thu, 12 Oct 2023 06:40:05 -0700 (PDT)
X-Received: by 2002:a05:6402:b18:b0:523:3e23:15ab with SMTP id bm24-20020a0564020b1800b005233e2315abmr20260951edb.26.1697118005395;
        Thu, 12 Oct 2023 06:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697118005; cv=none;
        d=google.com; s=arc-20160816;
        b=zgFkKZtgD7OB6oCeMRd6zHUQ0wr8X+tNZ0ZMcOgPHy4Vm6mjUl8jgd+3Ozx31RTqvy
         VPRibpf01XpRPeu7Gmx4z1m8xbu3Esobuzs0hU0L+1fkFUXSeTx1KZljKAdo9m4qoxl7
         N9e5GzAt2pdho5jzkOna7/EW+GqRpBwMEUcKBuRTjRmcaGCW11vNukmIAF8ovsIHy3lt
         Sp7e3L3pgWlWo7IkaQ9p0SsP1tTp9alrbbtPhGjoanjB1Wu8hBaBXEC0PsmhgTEJRqOh
         sWrGjAa89YkYvNSPMJCjVjQ2St+e6toiUmwVa3rKIqNTthMyIYzGJunA4n1g0hC5YRxc
         fwBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=uYKLXRBDpjhnnA5ve4A3/KEPKk2ji4Xv7HCEFBJIRF8=;
        fh=cGX7IsaA1vpuKiMoCeRajWuVCxXBtfL+id05qlNWIz8=;
        b=AemD3GOCE9oNFNW8sPUWXsf1nQo8w4x9sBb/wL9iQKFjQCr+7FqYopqY29ZGoQphdu
         acMGPmFN1g82uVqdRniNYn5yMidak1VyeOCFfjaXfoeCGev+mfg9YzN3z+qlcgPN4mu2
         uMBjcwbVFknBqSIVG3oLbFFHnBtI2HL9ucwoAbN3pwRWDKcvclBz75kH3bg0N7T2mM8Z
         UeWpqC4eDFQe7EW/1+P2bvbLybUbzBwumf8pJWouYcFT0zkMyx7wYuTiHxy3OVKvAU1r
         dKph6jOu6KdgC0tnQQhTBJF3ILxh25WzJYAZVCQNKj5wnwx94Xmx4cn3Bys1VwFHhiQm
         3POQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qH0+32pU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g1-20020a056402320100b005383860d2d0sor4486244eda.1.2023.10.12.06.40.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Oct 2023 06:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qH0+32pU;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697118005; x=1697722805; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYKLXRBDpjhnnA5ve4A3/KEPKk2ji4Xv7HCEFBJIRF8=;
        b=qH0+32pUSHto7K7ZgJL1M8xuVxJsX2UTDu8zSRCBzTar3BIuti1OhhIejKmXqDmIjN
         1uYmnCOO0GZ0CX7oYYoAsmrzXpuUoO/xnRWpaBqBko7hB6BRroYsKHbBkeokLgVq1Vrf
         2VVpyeCoo8ncfM1jvWEb8zs/Ybm44qX5lYhVdcSL3i/JOT+gmsYfRfrOOgIXjNrdZpRw
         xPNiWzlUsLEeX49WevASBmpGysjv9sttKmkVGaJcJgQNe2jIWoo7RlkH2zwvkPt1srm2
         erJ8dxJyQuxbTcGoi2jGlA99FDGMKUTW8vjjZwZiW8JfYTrKjXt6G0Yo/fc1hZDphIlz
         xYhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697118005; x=1697722805;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYKLXRBDpjhnnA5ve4A3/KEPKk2ji4Xv7HCEFBJIRF8=;
        b=dYTrDdVQV49iUHDSW8zYXrGmrqToxDRFsBof2ILqeHKXGnlqYqm8G9HO+gXb0NsIgQ
         f7DzwuD27MsH7xoHkdIIHeElQ1t3tsYu6q8JboljdZ/lfJfQAgUSufs7WxOhcl/1bCEl
         /qxrJinuVmHmI+PXn9ncM1OIWDRe0JTLZ+4Q63Rnf8B5Lh+HGVpqO4cUDzcGd0lxWtth
         FybE2tVSVDR75CkhAKi98dgpgs1YQjKwqC4tBOfgK06M6MmJWuMs+xkXZ4GgmG6SKi7p
         Dqtlcj5gTeJ5p3IhPncfhDeRKHiNjgCiGjlXPYXc87tgklRiii5NveEaQZtesrC2OgmE
         uGQw==
X-Gm-Message-State: AOJu0Yy0JRAGNBzie3kfCVRqjmOYEyfQB4asEnQoC5fG2RGkX4Qabxrr
	M+t1re4ylK4qCKFu9uMS9iGehmfC58bQkAzjDzvTBSVT
X-Google-Smtp-Source: AGHT+IEG2/mmPvu6Dk8Uj2JxxGJV/oAs2NAZI7DoFsmE1StO0al7tlMTTqywfa7XlsR5j8JdEqR98Q==
X-Received: by 2002:a05:6402:60e:b0:523:33eb:1103 with SMTP id n14-20020a056402060e00b0052333eb1103mr21984333edv.14.1697118005004;
        Thu, 12 Oct 2023 06:40:05 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-211-232.abo.bbox.fr. [176.131.211.232])
        by smtp.gmail.com with ESMTPSA id ee48-20020a056402293000b0053120f313cbsm3392652edb.39.2023.10.12.06.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:40:04 -0700 (PDT)
Message-ID: <acb33f5e-4234-fc18-63a6-b74294857468@linaro.org>
Date: Thu, 12 Oct 2023 15:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH v11 09/18] gdbstub: Change gdb_get_reg_cb and
 gdb_set_reg_cb
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <20231012130616.7941-1-akihiko.odaki@daynix.com>
 <20231012130616.7941-10-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231012130616.7941-10-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: js6nTQRHIiHS

On 12/10/23 15:06, Akihiko Odaki wrote:
> Align the parameters of gdb_get_reg_cb and gdb_set_reg_cb with the
> gdb_read_register and gdb_write_register members of CPUClass to allow
> to unify the logic to access registers of the core and coprocessors
> in the future.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/exec/gdbstub.h      |  4 +-
>   target/arm/internals.h      | 12 +++---
>   target/hexagon/internal.h   |  4 +-
>   target/microblaze/cpu.h     |  4 +-
>   gdbstub/gdbstub.c           |  6 +--
>   target/arm/gdbstub.c        | 51 ++++++++++++++++--------
>   target/arm/gdbstub64.c      | 27 +++++++++----
>   target/hexagon/gdbstub.c    | 10 ++++-
>   target/loongarch/gdbstub.c  | 11 ++++--
>   target/m68k/helper.c        | 20 ++++++++--
>   target/microblaze/gdbstub.c |  9 ++++-
>   target/ppc/gdbstub.c        | 46 +++++++++++++++++-----
>   target/riscv/gdbstub.c      | 46 ++++++++++++++++------
>   target/s390x/gdbstub.c      | 77 ++++++++++++++++++++++++++++---------
>   14 files changed, 236 insertions(+), 91 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
