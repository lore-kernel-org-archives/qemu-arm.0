Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1856794ejx;
        Wed, 28 Jun 2023 01:40:28 -0700 (PDT)
X-Received: by 2002:a05:6512:3dab:b0:4fb:94fd:645f with SMTP id k43-20020a0565123dab00b004fb94fd645fmr345807lfv.68.1687941628701;
        Wed, 28 Jun 2023 01:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687941628; cv=none;
        d=google.com; s=arc-20160816;
        b=yeOi3Ub9jGiG540qRb+X00T5+FIxUuLP07wzw1lI4OyMB5Zj++YBcSqTc753jfHf2y
         C+ULZSDs0Ow7ZQwDxwVtK5YwHMlJTQEYDepNzIO3l2hrGc5rEzC3fFSHf7Tz9P3e7ZTA
         ZO/dXvQuByLXyK9TbsH+PBG8h6tucqDp1WQvPKYzNW85JqpflvU0sqxXzAiPw5GzUlQU
         A5pminqf/9unszcnoYiGX3rgkSdxmeOE4iHmeSCriB783LPZFErgJPBrH1lDoXYS0/9N
         dhjddUEPmSfAR4b6SABhIQLdb16GAoPH/5B2eukz5bgpxeN/0qiDWJTx9ZIqHc+vZOfx
         4tqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WtqTGNQgll00hcJJrLoHKotUK6PyfLyby7zxhKFYDUg=;
        fh=m/k44rLCZRXjU7LHDCut1Qw4eoCNsC1IESDZK0BOqws=;
        b=yRe6soIrr/KgGpX2MywKYYalSNX8beOvArgc0tyZ17hsLA51OzG9iAjaYXsVy61Bo/
         rJZiYhqqQvBGt65m+CvRtTvWIMrUAXyemWg8J/VqePIv4qW+P9apcLtmVyyxn/3N75/m
         npc1jgfnnukq8j0Vg+kLEf6mNsEaqgh5IV6mSFlHw9mdsq7OoljQWiT6qQYwPPw7puDR
         nF6Z9QcotDO7ZEDlAM4BuNrvd1KslfaefUi2ql+4JvB2WwCGOSKU18upKrhW6o07WJ6t
         DMeB79Dr1lyqTBgHEmU3JYWGA8HkRjvsP85nuEFAEAz8vjkWYaQGVBif88Na8a8BHCYK
         YOrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D1u9pU55;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g20-20020a19e054000000b004f863299610sor3378870lfj.3.2023.06.28.01.40.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Jun 2023 01:40:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D1u9pU55;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687941628; x=1690533628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WtqTGNQgll00hcJJrLoHKotUK6PyfLyby7zxhKFYDUg=;
        b=D1u9pU55YPGy7r6bL0/oYVIWgZquoViSCWtdRIA4DQzpamNaHu0MYBJK5RRPjb8bmU
         hy6Z+6GF8h8p1bbZli88eNlO4GOu4+rXkRxjomjiRHUJImnb9jp4I72holZx8ACZZGtT
         78+qu7lD1S4KzWSQbMhdDildpGMy8ACS3bUguWFDroC6sx6iQmFWKJPsdrEvhuLEXVvN
         oNnDpIXqWkotYm7MVPziXDDxhH3pnt95szzMyEZms4xzZPIDt2Z2moCjA5lcO3BegvNE
         0O+VwDEFe7SDXZY4koWPd0Re0T+9q+CILg+PS0tMe5n6tjvwnoZv9qjkl5YdlSIGi6/c
         WjPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687941628; x=1690533628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WtqTGNQgll00hcJJrLoHKotUK6PyfLyby7zxhKFYDUg=;
        b=dsLwAJW9ZmTxfgD+kjKYZxU5ai0f0JcfHrwFiGABsb4kuqSZHSapOg5qq/i1MWfnAa
         NxOmSTvQ4RTcHq/BQkkq1KixXXBJ1vBG2bMz2RqeSNVkXfvBt+/zlF3cIhhCXWLxKVP9
         Rpu8I2iXjEXv7KSB4giIyAMwYzbAsZeWQkXTt60l0b1VhODyP9m9uw/lvBuHGePSd49S
         2Vw0v2cqAHEHJg/41xIafpnWrrGReJvj+JMuX/BGGtEJ0s3dad/Sf2YfO6neb+cHTdOf
         +6vjnRgtzSocuXTjlXMJtnbq9XwLND3cLQ9Z5BR2lIe1a/RaJf7IAhNMTkAGI307lLDc
         vPBQ==
X-Gm-Message-State: AC+VfDw+AVFNB+hMEw02LvN4v76f17nl/ZjtTqPsezHheM63qCzOTmz6
	664CF76s8RUfpZE2L9i4TZOU9BdhRWqhNoxFlJIP46Oe7DU=
X-Google-Smtp-Source: ACHHUZ7VSTJ1+8Egtuj2rFei3XC1FYP+r8YRTT9Vpd+GykMF6D50EKB+0ioW8yN2JiwyF9KAfg5XWA==
X-Received: by 2002:a05:651c:207:b0:2b4:8487:5f77 with SMTP id y7-20020a05651c020700b002b484875f77mr17924725ljn.27.1687941628128;
        Wed, 28 Jun 2023 01:40:28 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.208] ([139.47.41.103])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc855000000b003f8fac0ad4bsm13015660wml.17.2023.06.28.01.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 01:40:27 -0700 (PDT)
Message-ID: <832d49b4-4d53-729e-c8aa-004a71bdf99f@linaro.org>
Date: Wed, 28 Jun 2023 10:40:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 17/36] plugins: force slow path when plugins instrument
 memory ops
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>, Yanan Wang <wangyanan55@huawei.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Peter Xu <peterx@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Laurent Vivier <lvivier@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Riku Voipio <riku.voipio@iki.fi>,
 Robert Henry <robhenry@microsoft.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
References: <20230627160943.2956928-1-alex.bennee@linaro.org>
 <20230627160943.2956928-18-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230627160943.2956928-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: YZAGdnUELGEy

On 6/27/23 18:09, Alex Bennée wrote:
> The lack of SVE memory instrumentation has been an omission in plugin
> handling since it was introduced. Fortunately we can utilise the
> probe_* functions to force all all memory access to follow the slow
> path. We do this by checking the access type and presence of plugin
> memory callbacks and if set return the TLB_MMIO flag.
> 
> We have to jump through a few hoops in user mode to re-use the flag
> but it was the desired effect:
> 
>   ./qemu-system-aarch64 -display none -serial mon:stdio \
>     -M virt -cpu max -semihosting-config enable=on \
>     -kernel ./tests/tcg/aarch64-softmmu/memory-sve \
>     -plugin ./contrib/plugins/libexeclog.so,ifilter=st1w,afilter=0x40001808 -d plugin
> 
> gives (disas doesn't currently understand st1w):
> 
>    0, 0x40001808, 0xe54342a0, ".byte 0xa0, 0x42, 0x43, 0xe5", store, 0x40213010, RAM, store, 0x40213014, RAM, store, 0x40213018, RAM
> 
> And for user-mode:
> 
>    ./qemu-aarch64 \
>      -plugin contrib/plugins/libexeclog.so,afilter=0x4007c0 \
>      -d plugin \
>      ./tests/tcg/aarch64-linux-user/sha512-sve
> 
> gives:
> 
>    1..10
>    ok 1 - do_test(&tests[i])
>    0, 0x4007c0, 0xa4004b80, ".byte 0x80, 0x4b, 0x00, 0xa4", load, 0x5500800370, load, 0x5500800371, load, 0x5500800372, load, 0x5500800373, load, 0x5500800374, load, 0x5500800375, load, 0x5500800376, load, 0x5500800377, load, 0x5500800378, load, 0x5500800379, load, 0x550080037a, load, 0x550080037b, load, 0x550080037c, load, 0x550080037d, load, 0x550080037e, load, 0x550080037f, load, 0x5500800380, load, 0x5500800381, load, 0x5500800382, load, 0x5500800383, load, 0x5500800384, load, 0x5500800385, load, 0x5500800386, lo
>    ad, 0x5500800387, load, 0x5500800388, load, 0x5500800389, load, 0x550080038a, load, 0x550080038b, load, 0x550080038c, load, 0x550080038d, load, 0x550080038e, load, 0x550080038f, load, 0x5500800390, load, 0x5500800391, load, 0x5500800392, load, 0x5500800393, load, 0x5500800394, load, 0x5500800395, load, 0x5500800396, load, 0x5500800397, load, 0x5500800398, load, 0x5500800399, load, 0x550080039a, load, 0x550080039b, load, 0x550080039c, load, 0x550080039d, load, 0x550080039e, load, 0x550080039f, load, 0x55008003a0, load, 0x55008003a1, load, 0x55008003a2, load, 0x55008003a3, load, 0x55008003a4, load, 0x55008003a5, load, 0x55008003a6, load, 0x55008003a7, load, 0x55008003a8, load, 0x55008003a9, load, 0x55008003aa, load, 0x55008003ab, load, 0x55008003ac, load, 0x55008003ad, load, 0x55008003ae, load, 0x55008003af
> 
> (4007c0 is the ld1b in the sha512-sve)
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> Cc: Robert Henry<robhenry@microsoft.com>
> Cc: Aaron Lindsay<aaron@os.amperecomputing.com>
> 
> ---
> v2
>   - allow TLB_MMIO to appear in user-mode probe_access
> v3
>   - checkpatch cleanups
> ---

I thought we dropped this patch until we could do something with TLB accesses.


r~
