Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2664354lfb;
        Fri, 22 May 2020 08:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/90bMUA3du7ycS3igMmdGoeOfv0TiKhT3fr5pJMPh0nsYPhA4SdX28B+elfVv8ud20pGB
X-Received: by 2002:a25:cc87:: with SMTP id l129mr6725523ybf.18.1590160374837;
        Fri, 22 May 2020 08:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590160374; cv=none;
        d=google.com; s=arc-20160816;
        b=iCwBI27MnV4vyS/b+HgiqwjV3r+OANFirEynL3fZIzrhL6B0HwYCKxagNCsdfAzFm8
         U2ZetA7D3Izs0NJI8Ovc9XvGz/NLGA7PI0SuWg+8MzqvPx4RDY5Pg5n9k8FnX+Tz8pm0
         F8cWxM7AjYuoVALA72c3WdSkLfeOMSmDz4Ks0657DbHhlCGsw/3lO63JWw43KczCoToY
         c+89F54fhHtlYuXhJbmJ1YX3HpGAhbifp9M7G7bDKF8fevHddtpIGSV+OV30h6Ht9+IS
         R+qI8P4AfsNNXbEs/q+t10wIgNOSLs/3GDWH5RGRGhsoXcCdxKNaeo9Xh2glc+Gqg7Iw
         V2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=esPhA5uPa52ZkKLU+VzHjUqOZ2ccRyG0jIhcXa9X9os=;
        b=ZpsqnBaKiaBodw9EuQynMMwbKhI9KrdVwXWFEMgjE9SiCVPaa1L/qJA/1UJdZqfAuj
         jyAHJ8V19d0MXJvpjVnCjvt6X29wXzq4d2DFzNBeDJ8tPclGriqR471ke82u8rMl4hiM
         m1rQNPMM3pKGStecu+DeVMBZRmI24Oc16Ym8sTOaYOSw8hjPbPfnQ9Kkmo8PMPSSF5v9
         ZBzSLpGNCE+ODKi/YN2hPfYVDVx91MrAjsaoDOKy/dACdoxL5cNkz4FVYrBky+hTF8cn
         +yDXLI5F+B+0rQasN0QTlROl+KE+uTHwlWf68yJpO2DvIAhyu8za17pfS0EAZq+7ltch
         ktFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCbzpXzp;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id z8si7991458ybg.74.2020.05.22.08.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 May 2020 08:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TCbzpXzp;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590160374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=esPhA5uPa52ZkKLU+VzHjUqOZ2ccRyG0jIhcXa9X9os=;
	b=TCbzpXzpKhl8RECy/stvrheYbSXUdPX71j4aSo5wfg+bYcNSYZwQRsbgeYXeYFu2QCZwcc
	/ykVK61Zwe0R/WajXLzfyrJ5tl3mu0fEtDDkA95qjJPKInTvW3w6CxuWbBjjv3xvdEjjg0
	n3YYQ+KtfhWt/05NCZDZX8Df3WBWxO4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-mmSTGCyfPk2A1ikZb7LI5A-1; Fri, 22 May 2020 11:12:52 -0400
X-MC-Unique: mmSTGCyfPk2A1ikZb7LI5A-1
Received: by mail-wr1-f71.google.com with SMTP id h92so222883wrh.23
        for <alex.bennee@linaro.org>; Fri, 22 May 2020 08:12:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=esPhA5uPa52ZkKLU+VzHjUqOZ2ccRyG0jIhcXa9X9os=;
        b=VUJsJygWi61qTjRJ7vCruKaZ+Mb9svfHKMgA1Td2C1/Z03oZIvLoxzf5yyKhK6saNT
         Odr0m+AxqLPSf5njlyj3cDsG8M7prgmJ/oEMPRtAeaqLj1KEXehVMuLPHXNH48DZfRVW
         LTKS7RerxF+JlxY5hdb4Hi1MKrI0twMUA6RE03Rv/MLCFAfmhAzdJxmohCkukUptfYCo
         X4KxuwxZsOUQ5s0kfIO0AwbGHw6Coqas7aK7xb5RTmNX+xZvxm83gtvo+M5QGr+7sT1p
         PWGbWSSw+ltlftl/whjvNsb9X1Rnaescickm4Mm6xA8BO4SeOxv5fXJDLoniD5st3yUH
         HsYg==
X-Gm-Message-State: AOAM530wFe0YkLdYnPzMrtMIf3YVB04Bpk9XpkvQkHFUB+jyS+WgSUWq
	/DgJeHdWsbB+QNDcCSYTHr0QScrdMiKvdqPneV6VrMOoKd8YsMqkuKp3bP4JzzyGYEYuIoRsaI3
	jFEWztlOkBtmh2Kqp
X-Received: by 2002:a7b:c205:: with SMTP id x5mr14437121wmi.135.1590160371306;
        Fri, 22 May 2020 08:12:51 -0700 (PDT)
X-Received: by 2002:a7b:c205:: with SMTP id x5mr14437106wmi.135.1590160371130;
        Fri, 22 May 2020 08:12:51 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net. [88.21.202.17])
        by smtp.gmail.com with ESMTPSA id n13sm9570037wrs.2.2020.05.22.08.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 08:12:50 -0700 (PDT)
Subject: Re: [PATCH v3 11/11] hw/semihosting: Make the feature depend of TCG,
 and allow to disable it
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff
 <crwulff@gmail.com>, qemu-arm@nongnu.org, Laurent Vivier
 <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>, Michael Walle <michael@walle.cc>,
 Marek Vasut <marex@denx.de>, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
References: <20200521195911.19685-1-philmd@redhat.com>
 <20200521195911.19685-12-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <7e59175e-86f7-98f8-392b-929796ec877a@redhat.com>
Date: Fri, 22 May 2020 17:12:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200521195911.19685-12-philmd@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: Wtis46GT4xF/

On 5/21/20 9:59 PM, Philippe Mathieu-Daudé wrote:
> The semihosting feature is only meaningful when using TCG.
> 
> Do not enable it by default, and let the few targets requiring
> it to manually select it.
> The targets restricted to TCG that previously selected it
> (see commit 16932bb761e52c2 'introduce CONFIG_SEMIHOSTING')
> are left unmodified; however the selection is moved to the
> target Kconfig.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v3: Fixed odd hidden \xC2 UTF-8 chars:
> 
> Traceback (most recent call last):
>   File "qemu/scripts/minikconf.py", line 355, in parse_file
>     self.src = fp.read()
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 21: ordinal not in range(128)
> ---
>  default-configs/arm-softmmu.mak         | 1 -
>  default-configs/lm32-softmmu.mak        | 2 --
>  default-configs/m68k-softmmu.mak        | 2 --
>  default-configs/mips-softmmu-common.mak | 3 ---
>  default-configs/nios2-softmmu.mak       | 2 --
>  default-configs/xtensa-softmmu.mak      | 2 --
>  hw/semihosting/Kconfig                  | 4 +++-
>  target/arm/Kconfig                      | 2 ++
>  target/lm32/Kconfig                     | 2 ++
>  target/m68k/Kconfig                     | 2 ++
>  target/mips/Kconfig                     | 2 ++
>  target/nios2/Kconfig                    | 2 ++
>  target/riscv/Kconfig                    | 2 ++
>  target/xtensa/Kconfig                   | 2 ++
>  14 files changed, 17 insertions(+), 13 deletions(-)
>  create mode 100644 target/arm/Kconfig
>  create mode 100644 target/lm32/Kconfig
>  create mode 100644 target/m68k/Kconfig
>  create mode 100644 target/mips/Kconfig
>  create mode 100644 target/nios2/Kconfig
>  create mode 100644 target/riscv/Kconfig
>  create mode 100644 target/xtensa/Kconfig
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 8fc09a4a51..f6044f1121 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -40,6 +40,5 @@ CONFIG_MICROBIT=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
>  CONFIG_FSL_IMX6UL=y
> -CONFIG_SEMIHOSTING=y
>  CONFIG_ALLWINNER_H3=y
>  CONFIG_ACPI_APEI=y
> diff --git a/default-configs/lm32-softmmu.mak b/default-configs/lm32-softmmu.mak
> index 115b3e34c9..6d259665d6 100644
> --- a/default-configs/lm32-softmmu.mak
> +++ b/default-configs/lm32-softmmu.mak
> @@ -4,8 +4,6 @@
>  #
>  #CONFIG_MILKYMIST_TMU2=n        # disabling it actually causes compile-time failures
>  
> -CONFIG_SEMIHOSTING=y
> -
>  # Boards:
>  #
>  CONFIG_LM32=y
> diff --git a/default-configs/m68k-softmmu.mak b/default-configs/m68k-softmmu.mak
> index 6629fd2aa3..4fef4bd731 100644
> --- a/default-configs/m68k-softmmu.mak
> +++ b/default-configs/m68k-softmmu.mak
> @@ -1,7 +1,5 @@
>  # Default configuration for m68k-softmmu
>  
> -CONFIG_SEMIHOSTING=y
> -
>  # Boards:
>  #
>  CONFIG_AN5206=y
> diff --git a/default-configs/mips-softmmu-common.mak b/default-configs/mips-softmmu-common.mak
> index da29c6c0b2..6c0904b200 100644
> --- a/default-configs/mips-softmmu-common.mak
> +++ b/default-configs/mips-softmmu-common.mak
> @@ -1,8 +1,5 @@
>  # Common mips*-softmmu CONFIG defines
>  
> -# CONFIG_SEMIHOSTING is always required on this architecture
> -CONFIG_SEMIHOSTING=y
> -
>  CONFIG_ISA_BUS=y
>  CONFIG_PCI=y
>  CONFIG_PCI_DEVICES=y
> diff --git a/default-configs/nios2-softmmu.mak b/default-configs/nios2-softmmu.mak
> index 1bc4082ea9..e130d024e6 100644
> --- a/default-configs/nios2-softmmu.mak
> +++ b/default-configs/nios2-softmmu.mak
> @@ -1,7 +1,5 @@
>  # Default configuration for nios2-softmmu
>  
> -CONFIG_SEMIHOSTING=y
> -
>  # Boards:
>  #
>  CONFIG_NIOS2_10M50=y
> diff --git a/default-configs/xtensa-softmmu.mak b/default-configs/xtensa-softmmu.mak
> index 4fe1bf00c9..49e4c9da88 100644
> --- a/default-configs/xtensa-softmmu.mak
> +++ b/default-configs/xtensa-softmmu.mak
> @@ -1,7 +1,5 @@
>  # Default configuration for Xtensa
>  
> -CONFIG_SEMIHOSTING=y
> -
>  # Boards:
>  #
>  CONFIG_XTENSA_SIM=y
> diff --git a/hw/semihosting/Kconfig b/hw/semihosting/Kconfig
> index efe0a30734..30befcdd21 100644
> --- a/hw/semihosting/Kconfig
> +++ b/hw/semihosting/Kconfig
> @@ -1,3 +1,5 @@
>  
> +# default is 'n'
>  config SEMIHOSTING
> -       bool
> +    bool
> +    depends on TCG
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> new file mode 100644
> index 0000000000..035592dd86
> --- /dev/null
> +++ b/target/arm/Kconfig
> @@ -0,0 +1,2 @@
> +config SEMIHOSTING
> +    default y if TCG

This patch is incorrect, because previously the feature was selected for
system-mode only, and now it is selected in user-mode too.

[...]
