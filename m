Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp441478ejx;
        Fri, 4 Nov 2022 02:41:56 -0700 (PDT)
X-Received: by 2002:a05:600c:4f93:b0:3cc:9bc5:c454 with SMTP id n19-20020a05600c4f9300b003cc9bc5c454mr23019615wmq.84.1667554916687;
        Fri, 04 Nov 2022 02:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667554916; cv=none;
        d=google.com; s=arc-20160816;
        b=sej0r6/HwfmzNJKJqWMh5hInwFhYFzEy7YbEBKfCyerg2bF14XIlIIxU/+bafIqO5I
         wtZgVlDRU+l9x58zWam5x8DUD4KPh365lqfLum2KkfCWzD9eIevFlt3zigFb6LQJtFm2
         wyD0T8mKL8gYYlOC+vpYBHZ3QPNf+ceBZ/GsBUHbNnR/h86TnhohMUw5TumzRHPQDtfC
         R5rK51g1WLeXGQYbI5YcEkPsysUCi3Nvo3MagZZn78FdDN9oSuTxglv1SNY3qlWAlMWV
         mPEeN/9pOUSTE+a9EdST8Zt8G1raGbN3ga8DqUtwnAHA5Y8uPQkA6rsAQ2UYb7rfrrMS
         xK4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Eyolgd9snAmDnylLxMB6aqZBFzrOFTsWRVnlOpBec1A=;
        b=ljxC/nrWKfSQGk4Zz4y27xc5HxnR7EUq2qmBpBsdFx/dQhODsS3O2UGV31n1MQL1hG
         Mg9wCguGiG5qwkTMCm5g1JudYDCvc3fZmoj+hTJOAAGzQnMFFKqJF56xX0/vXnTNzQsP
         bLgnPyvaMFi+mb/a3iR5pu9JzZQknx+SwuBsmdmWAXwlrhCByItj39sn18JvgnrI7JSh
         6ZZ/gPIowIjLgT0Rd+GDqOZvQIile8yOsmTWbhfLlv6TgH6tmtoFPiNaxKS+G3ftKjfj
         A0YQmtoHVeNYYwMuujkeZ3FB02jdjsetACKZz6HkVuIDoY+mS/7ZuIRdSmcTUZjw7ilT
         wNvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oC9AyKYE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v12-20020adfc5cc000000b0022e7b793e72sor1853720wrg.69.2022.11.04.02.41.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Nov 2022 02:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oC9AyKYE;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Eyolgd9snAmDnylLxMB6aqZBFzrOFTsWRVnlOpBec1A=;
        b=oC9AyKYEyTf/l9SBwYmb/820cbO2DbUe5OToYyUkqftDw1Eb1dygGdSzGlp1jzOS2O
         l1Xhz5lFgor7I2JQaj3xcP41Jpk3A6gahzTAcTRkAYvuH+kV0oI0qTKZsE2aIFRqRnU7
         OAY1VgkvEvXYcX7D9SzXekz/SRP9WUPpfHEARPlLisQz4DT7vV8isQV45ZESAzIh3LDI
         1oP/bX2UAGotnNEObdPJPRlfQLPQeFCmQCRIGC7qOnI8sl0j7ENTKtJmf/N+ZxC/iy5y
         TRGDeTnvHv7+UogzHA5KmCgXMWbub4tebfnrwb8SvSPylKds+y0olP1A8lL+y8+jq0nH
         Bu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Eyolgd9snAmDnylLxMB6aqZBFzrOFTsWRVnlOpBec1A=;
        b=eZiliPCYCygYpRX/LuNd+DuisM4Omr8a6fLo61m4c4iuaJ7pXk2iAj8nKlqbA9WILJ
         ms6Xjp16uDgPNWzoCt0sx7XiWXNmJZySCwj46Eza7ybzFWfyxcZYc9DfqxI3P8lH58Jf
         7el1yjKruMU5sKAvzVlgOhDiI0c5w4eglvpoeGmmF++a2d1h0U9F7Tc3eiw8bjo7FMMP
         Qg9pQqVIWuxXgqX4nHmazBYjx89dNd+n3D3ceTZcJ/ymRL3Nnacr3ao0e+8yOfrMtivJ
         r5me0pPLpI+HOCeIvFXqqytquKyiYIenOF2XNB+Jtzfx3Xp9vFI5bX6bJX90lUp9cPWj
         fy8A==
X-Gm-Message-State: ACrzQf08PY3h6Qz44x1YD+CSPK9cbklFbcysZ1GYmRy2Kef6l6ntTpeO
	Kyog3/aaK7rrrQafwxyTSR0JotLMbIDQDxCz
X-Google-Smtp-Source: AMsMyM6woUxGKSHSu0aPafJq9CLz+TJ9HagbLpUZH0EVLKRDGepuzz4F+dmDHl71bOjsxsw+y5bioQ==
X-Received: by 2002:adf:e804:0:b0:236:657e:756e with SMTP id o4-20020adfe804000000b00236657e756emr22083743wrm.452.1667554916356;
        Fri, 04 Nov 2022 02:41:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id m5-20020a7bcb85000000b003bfaba19a8fsm2223387wmi.35.2022.11.04.02.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 02:41:55 -0700 (PDT)
Message-ID: <296866ca-a6d9-796b-46ca-797937d44f12@linaro.org>
Date: Fri, 4 Nov 2022 10:41:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] tests/avocado/machine_aspeed.py: Reduce noise on the
 console for SDK tests
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20221104075347.370503-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104075347.370503-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: G5Suks+lFH0l

On 4/11/22 08:53, Cédric Le Goater wrote:
> The Aspeed SDK images are based on OpenBMC which starts a lot of
> services. The output noise on the console can break from time to time
> the test waiting for the logging prompt.

IIUC OpenBMC uses systemd, so you can mask pointless services from
the kernel cmdline. See for example test_arm_quanta_gsj():

  # Disable drivers and services that stall for a long time during boot,
  # to avoid running past the 90-second timeout. These may be removed
  # as the corresponding device support is added.
  kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + (
          'console=${console} '
          'mem=${mem} '
          'initcall_blacklist=npcm_i2c_bus_driver_init '
          'systemd.mask=systemd-random-seed.service '
          'systemd.mask=dropbearkey.service '
  )

> Change the U-Boot bootargs variable to add "quiet" to the kernel
> command line and reduce the output volume. This also drops the test on
> the CPU id which was nice to have but not essential.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   tests/avocado/machine_aspeed.py | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
> index fba6527026..1fc385e1c8 100644
> --- a/tests/avocado/machine_aspeed.py
> +++ b/tests/avocado/machine_aspeed.py
> @@ -12,6 +12,7 @@
>   from avocado_qemu import wait_for_console_pattern
>   from avocado_qemu import exec_command
>   from avocado_qemu import exec_command_and_wait_for_pattern
> +from avocado_qemu import interrupt_interactive_console_until_pattern
>   from avocado.utils import archive
>   from avocado import skipIf
>   
> @@ -182,6 +183,8 @@ def test_arm_ast2600_evb_buildroot(self):
>   
>   class AST2x00MachineSDK(QemuSystemTest):
>   
> +    EXTRA_BOOTARGS = ' quiet'

Maybe less bug-prone to handle the spaces around EXTRA_BOOTARGS where
the variable is used.

> -    def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
> +    def do_test_arm_aspeed_sdk_start(self, image):
>           self.require_netdev('user')
>           self.vm.set_console()
>           self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> @@ -202,9 +205,13 @@ def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
>           self.vm.launch()
>   
>           self.wait_for_console_pattern('U-Boot 2019.04')
> -        self.wait_for_console_pattern('## Loading kernel from FIT Image')
> +        interrupt_interactive_console_until_pattern(
> +            self, 'Hit any key to stop autoboot:', 'ast#')
> +        exec_command_and_wait_for_pattern(
> +            self, 'setenv bootargs ${bootargs}' + self.EXTRA_BOOTARGS, 'ast#')
> +        exec_command_and_wait_for_pattern(
> +            self, 'boot', '## Loading kernel from FIT Image')
>           self.wait_for_console_pattern('Starting kernel ...')
> -        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
