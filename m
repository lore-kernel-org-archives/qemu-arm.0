Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1825967njb;
        Mon, 29 Jul 2024 07:39:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVncUYmt/6RdtbaETfrgu7LUrb20D4UzzhTLRUxNLyUvm+LAp6bU4N9UU+VH0VpvpNbMR2RSmf/BuZvNCs5ux3Ox1b3eRex
X-Received: by 2002:a5d:4685:0:b0:360:9500:9bbb with SMTP id ffacd0b85a97d-36b5d7c4d18mr4605078f8f.12.1722263955052;
        Mon, 29 Jul 2024 07:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722263955; cv=none;
        d=google.com; s=arc-20160816;
        b=tjS9t/vPC+j6Rye2NEmfUIz1W2lB4guXsZuWDps3SoVdSESLlK2/bWJ81FfjJ84hZW
         33IIBYpVk5pujE3+/0CT1yXg0EeBJG7qnN9UBEdGiaBN3WGsj9uDY7eINcvMMTBQLQC7
         6TqVHUQ3L8pgYwbeZ8zLisWUgtu+0v4RyRRMcAtTPP7aqbLmL+amypmxplZJ6kwF7Rb2
         MggsDmpOUvZOLA8a8g8pnai3yb9ngKejt+Pno2/+eCdsw5Byw99baF+ZOU/NwhHjgoKt
         5eu/nlsx0FjLvc5ArCpZzCXuLmTsg+PvaTf1eJ3MClUgUOYru/bSyD+dOlJi8upqGCqP
         mo+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=qEnyOvA1X8TKi0lsodpQGCil95YO2hb3XDAGCjbudWY=;
        fh=CkvI9CsG9ptrzJ2HGFVX4RYG2SPiIKrtOk7VQCxxd+c=;
        b=MVqEm3gUfgGmRbPM+QZx8+YxdbKBmOjuqMIKXKPA8JjJ+gjHNTpKJWLgC4GBkWyZZ1
         BWRbvPpVcYn7MvE7MOQULz6dw+bmkJkr6yE0KWt9JERxITntEGQw6ihc5C7Wiy9cFKEF
         W0AypEd6Q7rWbqAsrAoMyRmeAkOs4lIwoSUpNADW8rxDPgi9SrNKyRjVLRcRGrnk/ciG
         unGijYSguiFw0ZlcDM6t8s6n4uQxPaJRaTJXTtjzQLEmhR4YIQFtoxAhbptIzA0/RZzn
         HIL9kEBM2PXE5cgwWDLk4seu5CT7YWLxmPi8WoUN5Lbm5RJsgP+ASr+2fRnMl53D56kb
         hfbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4BYTgtF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36b3567ee9asor2124741f8f.2.2024.07.29.07.39.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 07:39:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=C4BYTgtF;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722263954; x=1722868754; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qEnyOvA1X8TKi0lsodpQGCil95YO2hb3XDAGCjbudWY=;
        b=C4BYTgtFawxyVMaXgUEpIpFXvAyJgY5WHvJYbXAV8zmsUWKO0NjhSzZCRhExUTp4e5
         1JV+ej8HPa3bccneGPIkOLhp3j2T0kHgr4dVYsx6wNBRIdiZ/mFdSck9+sMVF1OMUnXy
         SrB0Rzlap1U2T+ql5lygoeliLnqitPV3/ymdOUH+8J1F0BGlPpztMuaR7KEGkU8NAGES
         tKB1/gbarsXdYS4jPU0xwzT5kE/DyhU86qfaIYUGSQug8YXTU/CwZTAb5YO6CjImXmkD
         md/KgU6rDgDPX4cUKkHAai6MjopQIjFbFJw4MTYusAyFYjPorMxX4k/SvAU++usTW4aF
         Un4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263954; x=1722868754;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qEnyOvA1X8TKi0lsodpQGCil95YO2hb3XDAGCjbudWY=;
        b=C14cEVCucJeOEUubLyar/jTdIRPGQLn9LQTZAODSw2B3znN25dwjRafnmaotcsO9vg
         QV5pq3ObbLqkMUiCKCOkwmPNBPmKrE+j3SZs6mA+E3faUTXp9zN+SLSe+bR69irTgT8D
         XtXJusPxwqGqE9FYdV/AHxos2LGEWtWokbCUY7gddtEjLxxdwioHs0ZjEGzQAIFnVN6z
         C6tDaRXiLs56sLlYZblQNqNb6A3M7bY8MKHSLDJ0sMP55WVr11TAOIi005S95zKL6RUy
         bozCNSxnY7TmOjPSK5udwbwZXC6ZoFi8t3/SayoyjBF/pj3UpQY09nq2PoOUxGh2iHg7
         A0/A==
X-Forwarded-Encrypted: i=1; AJvYcCUc8aPXn3AJImT4b5p2xvBYvqn3CEdh2DIL9aUKMaAVCuHmv3iZsnN5VGMoDKZXH63XsxIBG7ijtiDhmXOk6Of9OD8TVRv0
X-Gm-Message-State: AOJu0Yx6q/CAuDmgfBHIkxhNjQWmmBSIarF5vtGY55sa6wv6QKBTDXXa
	Jm7VV7V3RK9kO0NmUwea5nwoFM4KNBAqScJ2rWmMOEiePbkFmRCJABHFyIbNRCN4MA==
X-Google-Smtp-Source: AGHT+IGhrXmQOvCwdmc/mrVWsNfUM8NWLaSEVksL1o/NLVYFClufq9VU4ziPQrR4Ung5I6UYQQ0o4Q==
X-Received: by 2002:a5d:55d1:0:b0:363:ac4d:c44f with SMTP id ffacd0b85a97d-36b5d7cf02bmr4471297f8f.17.1722263954418;
        Mon, 29 Jul 2024 07:39:14 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36857eb7sm12396324f8f.66.2024.07.29.07.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 07:39:13 -0700 (PDT)
Message-ID: <a7f2d78a-4de6-4bc6-9d54-ee646a9001fe@linaro.org>
Date: Mon, 29 Jul 2024 16:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/13] tests/avocado/tuxrun_baselines.py: use Avocado's
 zstd support
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-11-crosa@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240726134438.14720-11-crosa@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: c59jIOgLnuCX

On 26/7/24 15:44, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/avocado/tuxrun_baselines.py | 16 ++++++----------
>   1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
> index 736e4aa289..bd02e88ed6 100644
> --- a/tests/avocado/tuxrun_baselines.py
> +++ b/tests/avocado/tuxrun_baselines.py
> @@ -17,6 +17,7 @@
>   from avocado_qemu import QemuSystemTest
>   from avocado_qemu import exec_command, exec_command_and_wait_for_pattern
>   from avocado_qemu import wait_for_console_pattern
> +from avocado.utils import archive
>   from avocado.utils import process
>   from avocado.utils.path import find_command
>   
> @@ -40,17 +41,12 @@ def get_tag(self, tagname, default=None):
>   
>           return default
>   
> +    @skipUnless(archive._probe_zstd_cmd(),

_probe_zstd_cmd() isn't public AFAICT, but more importantly
this doesn't work because this method has been added in v101.0.

> +                'Could not find "zstd", or it is not able to properly '
> +                'decompress decompress the rootfs')
>       def setUp(self):
>           super().setUp()
>   
> -        # We need zstd for all the tuxrun tests
> -        # See https://github.com/avocado-framework/avocado/issues/5609
> -        zstd = find_command('zstd', False)
> -        if zstd is False:
> -            self.cancel('Could not find "zstd", which is required to '
> -                        'decompress rootfs')
> -        self.zstd = zstd
> -
>           # Process the TuxRun specific tags, most machines work with
>           # reasonable defaults but we sometimes need to tweak the
>           # config. To avoid open coding everything we store all these
> @@ -99,8 +95,8 @@ def fetch_tuxrun_assets(self, csums=None, dt=None):
>                                            asset_hash = isum,
>                                            algorithm = "sha256")
>   
> -        cmd = f"{self.zstd} -d {disk_image_zst} -o {self.workdir}/rootfs.ext4"
> -        process.run(cmd)
> +        archive.extract(disk_image_zst, os.path.join(self.workdir,
> +                                                     "rootfs.ext4"))
>   
>           if dt:
>               dsum = csums.get(dt, None)
