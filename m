Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6204337ejc;
        Tue, 28 Feb 2023 13:53:11 -0800 (PST)
X-Received: by 2002:a05:600c:3b11:b0:3e5:4fb9:ea60 with SMTP id m17-20020a05600c3b1100b003e54fb9ea60mr3527898wms.9.1677621191793;
        Tue, 28 Feb 2023 13:53:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677621191; cv=none;
        d=google.com; s=arc-20160816;
        b=b6IR62avvD4lwq96lxFpi7LAknvFIs2XwN7YoKu0Nd+z4CKs4lRqMzZ5tgAKYDP04J
         Q2dP82Kw50BYEot+BaLhcJ2mlV3rbU/atniBcTZiYl7hVzOmwcm8L35qeQ6Lfg3PWQKI
         8kFg/jvUu1fSMVag/7R9JGhvb/SXnQOCKLbOCH5sskox78mzZh4fBYTBKOM6wVpePjlT
         +bO62+We737DRZtGj+aWYXzsQHulvDT7pnKakBZOXbErdcGzP9cKJ8sYgc8GisV+kn1y
         pC2Agas3hzpAoFhiunf3szsSu4Hp0D+FjqRUF6eAciutsQrrGBKLt4mKoaF631Vljbb5
         Kizw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=eNWWTmXqD/Hl2svbeJU3DygbOC8Ekf8J+x0b2gnlOVU=;
        b=eWIU2BX2ep3qmloBJusezuEDXwRpV+PGPYYMXRoslSFmxXwgLvMigHsdGBIODn16Qr
         FVYlsGQ7tdfXztpS3vZ22NsVSMdj4UNYo286Pl7rYQJJqALBpgwgJtPaR4C4/z12YbWF
         aNmSHfS++jNuUNb16tjb14ECTznnuLL6atSRwowUaq6ikOuzb3JYeYk0QlcncNHugPSD
         NWCHWpHjQjXNs0Jcw6yv+0IWx4aQ5yWIUMjMBxHR9fV1gbAyWvGKV/JERj8ES1Kt5iVZ
         3VW0npk3Eyq3icRV89O0tceLz3VcmIqiLQjTQsYLN62WQ/J59RpMUqvL42fEK6j/pz04
         AdOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tT6zcdlm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m21-20020a05600c4f5500b003df0105479csor4324864wmq.3.2023.02.28.13.53.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Feb 2023 13:53:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tT6zcdlm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677621191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eNWWTmXqD/Hl2svbeJU3DygbOC8Ekf8J+x0b2gnlOVU=;
        b=tT6zcdlmnX/XpXr/pqTym9Xn6fvTrPLkZX1LubjvGFLnJ0jnq1uHsamMtO5fP6M/L2
         MiCYeb5u1X1ELXQWn3JPyShD2FLHakncjLG/Cu5ouGYBdXu+/qg6TyTYcY4ZfPGBInyW
         LexAd7nfWCQUxLkMAlxm9/8U63CAxLb8uREBqO9NWvlxwr8HXSTlHh/9Nz55kfpd87UR
         sGXmGhwCKQg2h7z7a28Gziyw7CNSjDLta623y9CV2hNHAF23bQR0iUOkR6/1dl0uXpM+
         CrW8safroNC8MkGD/o/Asgxb/1HQ5KwRzgLS3mHUn5QrFFtRh4dMghxr/v+hZmtl1V6A
         AQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677621191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eNWWTmXqD/Hl2svbeJU3DygbOC8Ekf8J+x0b2gnlOVU=;
        b=4uKWuFFnzxrClncs4tV0JfUByW5jBqhOahcCYBNB45CiY1dFb4WrK6XCA4nJem1xX9
         G5I2uevIXvJDdmTG3fESoQDySwBCEyEEM8BDswQ/UiSiP9I+opbZBvX4Iy67RUQqKNVd
         fMum0FYvuihg2XUSm89XmniSZuyUHtAhNQJJvzc1kLa7SHmWbrery44clVqQ4WkC0Uma
         59HYVVUQKa739vRFzdYudWIfVzOTCTDXqZvL/otvLOdA8RTLiI6STdyUDhVqHMr962Qz
         y8rRe8IQ8jv0FZjEHeJNebEp8iSZqyb+azuBj46BBszxRDoRCnlYzG5IMe2MHAT1MtYJ
         lWFw==
X-Gm-Message-State: AO0yUKVUFaxv4jIVLIrc5eivNkrZtzgJFfdATW27ppOzotCD/0SBq2Ux
	vc0ANdDA/ShbwBhrHnMulRyvZd8TeQZWTI3Vnqs=
X-Google-Smtp-Source: AK7set8oBR8ZUtKQfqXL+uNsLpS+qcGjndSeFiC+tF7ogAloU4b8rKQM0LcUu+sp9QLiYqfwgJaJdw==
X-Received: by 2002:a05:600c:4fcc:b0:3ea:9530:22a6 with SMTP id o12-20020a05600c4fcc00b003ea953022a6mr10194680wmq.1.1677621191115;
        Tue, 28 Feb 2023 13:53:11 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.68.175] (166.red-88-28-30.dynamicip.rima-tde.net. [88.28.30.166])
        by smtp.gmail.com with ESMTPSA id a2-20020adfdd02000000b002c3f03d8851sm11013264wrm.16.2023.02.28.13.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 13:53:10 -0800 (PST)
Message-ID: <fa133859-b079-2cc1-f431-cee6b1c19af3@linaro.org>
Date: Tue, 28 Feb 2023 22:53:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Yonggang Luo <luoyonggang@gmail.com>,
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-25-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230228190653.1602033-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: QJNN4mg2906T

On 28/2/23 20:06, Alex Bennée wrote:
> This test is exceptionally heavyweight (nearly 330s) compared to the
> two (both endians) TuxRun baseline tests which complete in under 160s.
> The coverage is slightly reduced but a more directed test could make
> up the difference.
> 
> tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:
> 
> Overall coverage rate:
>    lines......: 9.6% (44110 of 458817 lines)
>    functions..: 16.5% (6767 of 41054 functions)
>    branches...: 6.0% (13395 of 222634 branches)
> 
> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:
> 
> Overall coverage rate:
>    lines......: 11.6% (53408 of 458817 lines)
>    functions..: 18.7% (7691 of 41054 functions)
>    branches...: 7.9% (17692 of 224218 branches)
> 
> So lets skip for GITLAB_CI and also unless AVOCADO_TIMEOUT_EXPECTED is
> specified by the user.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux.py | 4 ++++
>   1 file changed, 4 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
