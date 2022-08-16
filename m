Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1493885ejf;
        Mon, 15 Aug 2022 17:28:04 -0700 (PDT)
X-Received: by 2002:a17:903:1106:b0:172:68f9:f68 with SMTP id n6-20020a170903110600b0017268f90f68mr9892856plh.50.1660609684363;
        Mon, 15 Aug 2022 17:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660609684; cv=none;
        d=google.com; s=arc-20160816;
        b=I6UkZtFZfBBIqhl7p+NpO+BvJLpB+yJj22gNYbym2eqEFyYDYGInVmfvPA36kIhQ+M
         S8V6SsDVVqjT5d3EulVvWYWrA6fyEXH6w0pYFlT5WcHTnNm/VqfV79ssWMc41CJ3fqjd
         B2TQAbuIy4KL0/ImxI7GnMUz6qUCL/vgva/9MwQgJmxCcFOJ/TmO0phMQl+R99QTSmfw
         k/RiIwRM2mEUDKKgI17AvBH5IiwRqpaJzFlDVNl10WmBrz9N6oX6SkHlNc/sbi/9LTAr
         99UJy5x1F9Vup5ovbzcjtM39IiZMVTOHyaAK8o6pbWPcijN4nci5+na8leE0LxMFutby
         XlGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=UZ0PWb4u/K3MzceaxSR1BScumNLvE8kHzwOtMREmTuo=;
        b=mbbRjLGkcsa31Y/qZrxhiKgSC+H4BmPPzPnWJCz0XUupzcXdJZh/HWbrOatyyP4JpW
         Oj8sZihjf5Mz6InHvKCuZouyFiLY260R55SKkLnBV4FkByib5jgVPkfax+wC43h6mBXU
         YyMZlQqp0+KjXgntyfBLX1S3+9F9/EB1hk+PuMs6eswvgsxvhLrXeRBYwybogtmTiqBg
         bZRX93TBJWHTjTmyOTuuK0YnW9NvoXuVmwA4rm8gVSN+GL9v4zzqgZuvv8+fj4WmDqra
         uCMP+stPDdYSWD1DhNsnGPqLVBXsZdl9SOhut0h+MrHtHS3+S5W1XvI+mfbDV3V9HWMw
         b+iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=RWkFrrdc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y1-20020a17090a600100b001f04bb12977sor4008275pji.0.2022.08.15.17.28.04
        (Google Transport Security);
        Mon, 15 Aug 2022 17:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=RWkFrrdc;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc;
        bh=UZ0PWb4u/K3MzceaxSR1BScumNLvE8kHzwOtMREmTuo=;
        b=RWkFrrdcHYJa66lIaUgsy50J9RhRqF3vnBuJfqBW1iESoZXM5YNSktSk1JgBWffIP8
         ZUZ19vWozNkF5M2Bn8008a0I2TQNgAAQCWAp+Jq6EhV9r9iUT/hD27E3Rbh8yjE/OT9e
         c26mwBEvvn/4/umhmvmbV1aHeb35YSCR+oJ156tJbwTmau8fyA7xt61EGIJv2WSMRl3d
         9kBMiduz3hrbLiVMOf+bsXlDk8GNku8Rlmur3IXnsnqabtEFp4NOBvMdg9nmmbLRJcTg
         E5EYENG7RFOeSlmXe44SS3SQOyOmkJmdFyNgGVtkOAo7TV5wK561+AO8k1920OU3cB1U
         o8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc;
        bh=UZ0PWb4u/K3MzceaxSR1BScumNLvE8kHzwOtMREmTuo=;
        b=c1ZRFhg/iIBKNgVzoGgBQ/hnAIYk5CMkveNWcidvuxk2KlK5Iau9VPOF6O3QFXbOal
         8AuxNUynelrb+341UL7Y6kMkWByXoYWjgCfKkTmjHqdaeQQlphKV9t5wUB96BK7kGEcU
         dveah1tj/dSqvxqCxKHc/MWcNG/I0Wimk9qf5xdheFInC8kits8zJEW1+yqyRChlWMUB
         9NlyiLge95vMsqJupJIJ6bePJ5lREN2iCfeqLgf1Nrz4NJmfSVV2cFceAnC4E7IuMcLf
         2vgDJH7s2F7/9SIIME+YMRhy+7JqtgnMypDSrgZp8LIjIarPZfl3Q+kIXGlTWDYW8e8K
         n5Rg==
X-Gm-Message-State: ACgBeo18ntxsbZYwHPvWsA3VTEU1xYOxqRVZWHVB3Lt2nnQkGRZOETi3
	Z80iNEysR8ct2G6SZK9vQSh98Y9H8iU=
X-Google-Smtp-Source: AA6agR6quOOU+hp1ifQSRZAEBAsmZjPTksd30w+I5QhsTo3pTIm2BSlOxHVw/cTcu27bjCe4MQacfQ==
X-Received: by 2002:a17:90a:d982:b0:1f5:49e8:7803 with SMTP id d2-20020a17090ad98200b001f549e87803mr30015124pjv.173.1660609683679;
        Mon, 15 Aug 2022 17:28:03 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id i8-20020a1709026ac800b0016c5306917fsm7556853plt.53.2022.08.15.17.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Aug 2022 17:28:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Message-ID: <25c03df9-8454-5283-9d56-21fb18ad9975@amsat.org>
Date: Tue, 16 Aug 2022 02:27:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH 1/7] semihosting: Allow optional use of semihosting from
 userspace
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
 <20220815190303.2061559-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20220815190303.2061559-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: eISARC+pN1b4

On 15/8/22 21:02, Peter Maydell wrote:
> Currently our semihosting implementations generally prohibit use of
> semihosting calls in system emulation from the guest userspace.  This
> is a very long standing behaviour justified originally "to provide
> some semblance of security" (since code with access to the
> semihosting ABI can do things like read and write arbitrary files on
> the host system).  However, it is sometimes useful to be able to run
> trusted guest code which performs semihosting calls from guest
> userspace, notably for test code.  Add a command line suboption to
> the existing semihosting-config option group so that you can
> explicitly opt in to semihosting from guest userspace with
>   -semihosting-config userspace=on
> 
> (There is no equivalent option for the user-mode emulator, because
> there by definition all code runs in userspace and has access to
> semihosting already.)
> 
> This commit adds the infrastructure for the command line option and
> adds a bool 'is_user' parameter to the function
> semihosting_userspace_enabled() that target code can use to check
> whether it should be permitting the semihosting call for userspace.
> It mechanically makes all the callsites pass 'false', so they
> continue checking "is semihosting enabled in general".  Subsequent
> commits will make each target that implements semihosting honour the
> userspace=on option by passing the correct value and removing
> whatever "don't do this for userspace" checking they were doing by
> hand.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/semihosting/semihost.h | 10 ++++++++--
>   semihosting/config.c           | 10 ++++++++--
>   softmmu/vl.c                   |  2 +-
>   stubs/semihost.c               |  2 +-
>   target/arm/translate-a64.c     |  2 +-
>   target/arm/translate.c         |  6 +++---
>   target/m68k/op_helper.c        |  2 +-
>   target/nios2/translate.c       |  2 +-
>   target/xtensa/translate.c      |  6 +++---
>   qemu-options.hx                | 11 +++++++++--
>   10 files changed, 36 insertions(+), 17 deletions(-)
> 
> diff --git a/include/semihosting/semihost.h b/include/semihosting/semihost.h
> index 93a3c21b44d..efd2efa25ae 100644
> --- a/include/semihosting/semihost.h
> +++ b/include/semihosting/semihost.h
> @@ -27,7 +27,7 @@ typedef enum SemihostingTarget {
>   } SemihostingTarget;
>   
>   #ifdef CONFIG_USER_ONLY
> -static inline bool semihosting_enabled(void)
> +static inline bool semihosting_enabled(bool is_user)
>   {
>       return true;
>   }
> @@ -52,7 +52,13 @@ static inline const char *semihosting_get_cmdline(void)
>       return NULL;
>   }
>   #else /* !CONFIG_USER_ONLY */
> -bool semihosting_enabled(void);
> +/**
> + * semihosting_enabled:
> + * @is_user: true if guest code is in usermode (i.e. not privileged)
> + *
> + * Return true if guest code is allowed to make semihosting calls.
> + */
> +bool semihosting_enabled(bool is_user);

Per the description, possibly rename as semihosting_allowed().

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
