Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3553452lfc;
        Mon, 7 Sep 2020 01:06:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyjlubhDNy7qrUR6TVtZS+R83YLMQ0ZOEISdLCOPsJ4uQPBfQm2v0jYyHb6dWKSXwYNJl+
X-Received: by 2002:a17:906:4d4d:: with SMTP id b13mr19383744ejv.221.1599465990727;
        Mon, 07 Sep 2020 01:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599465990; cv=none;
        d=google.com; s=arc-20160816;
        b=Da4OYWtCOaCjAU9Mvq/XeGamIf/2ZEVlOllwG5x+CdOmARNAATxYWnxV1yapOrdt5i
         NaHaeIxJgkR30j/v+OZNvZzO2f4wu3oSPDSjUWxHMg8pJY8LTV+L+WQWnQ8KnsKg7uHX
         c3SIrcclg38m0AbKazTuvacHz4too43fgrzcVLrCK2wySOw6lNuGrxXd3BSnaRfOB5A7
         AIar7Z3p4i6iQ9AJLPaju18m/uRI1Z8D0HtEFautEaPeF3I1LHHoAladjXlhEO2ssd9Q
         WAMbde94gE21XcmZ2wSyhMKaIF+wiEkaFl8Q+XGZpih+ZtLioqlFc4XYpFWnlggoFdwX
         ZV8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=tS2Qq1anleUR4l3gZyt5zexQbh7rzVaDOovLt7uzP6s=;
        b=pz1Rq5LOi/UCqYwCc/s1Ern2bOugvXbn00Ga1Vm0BS30ltTnq8KscXjw0FXYJboRv6
         Iei4uzsH0VgBs40OVBmrOMbeOygT29/5zXg3r5D1rAEm8GU4hk4DHZK7RfZSPvPphfsY
         ys0/wEVEnTgHlQGedMaAIETppJeSHvESOXfUY1pWJvm0nJOdJ64glVospujyRy/Xa2/t
         wGrqMvE4ooXZOlW1t2AhpKff/v8Y420I1qy08dqZuXzfE2qpDABSsQvq3hbpjtoMlVJp
         V3hikv0XjfGZ1Fxa5HlfM4bVFj1GAVuu2yVkAh03AlXrHiDacBRnra9wBRCnH/hBjmck
         EbgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KQmEqXse;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id h11si8967060edw.573.2020.09.07.01.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 01:06:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KQmEqXse;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599465989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tS2Qq1anleUR4l3gZyt5zexQbh7rzVaDOovLt7uzP6s=;
	b=KQmEqXse+og7VzMr5KMZW25VW0uGsLdWcUmDXtDF8+HzONgTFn4FA/gC4r6pacG1XQSXfy
	4aDyrsbn4tEyyp84YYnLjhyJSn5Z7g6iNOJ50WeTAwZcuEool1ggG2W/NlglrojF3rpdlD
	4klihEkgSq9UkHMLvoXO0kdBrTZ4uVw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-jlZcPpaQNLC8X4xU-NE0DA-1; Mon, 07 Sep 2020 04:06:17 -0400
X-MC-Unique: jlZcPpaQNLC8X4xU-NE0DA-1
Received: by mail-wr1-f71.google.com with SMTP id k13so3845158wrw.16
        for <alex.bennee@linaro.org>; Mon, 07 Sep 2020 01:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=tS2Qq1anleUR4l3gZyt5zexQbh7rzVaDOovLt7uzP6s=;
        b=T9Luu0CAQexJqTsh46By3uvKshldz9JYS8shy6pyxZmx2SOci3fY4yJYiALV8yg+hy
         +WMPoqgiYXWwmhGjjKSqnLj5faxb/PF4QTOv2uckQPS1TCPn7fGVYgzYkAioBcjD9+Sq
         ImqK1Qsp6TAC5+pElkJy1iiBNoM1F/ouEXpJ7SkjBIj3cTCMCgWMAz6C7+snPw1toMeH
         1ikKd3+I9STFysixpcDj/sINF8Mwv4PDqzRyTmdh2DVCo79F/rqhh9SSEQ3GeqVR225a
         MLMx2g6LQW6HLd+NbcEmaxf2PVspTqmanucNaedunWQmk8HjhgnGxw/RreNhpxlKUbpS
         6qLQ==
X-Gm-Message-State: AOAM5306YfNXdQGFXkwLllqv3u1PxtPfRxJyTBP5frWj59nOyxxizCmr
	fxtdKaOIjDdDTOirjgG91PIrhmBCgTqM52N20bdDPiOluTH9QdCUnAwvDkJCy3+kp2dZ+Hk6Fbk
	pyzY1boGTdN+SfUsw
X-Received: by 2002:a5d:6305:: with SMTP id i5mr6940149wru.337.1599465976326;
        Mon, 07 Sep 2020 01:06:16 -0700 (PDT)
X-Received: by 2002:a5d:6305:: with SMTP id i5mr6940126wru.337.1599465976077;
        Mon, 07 Sep 2020 01:06:16 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id w14sm10891918wrk.95.2020.09.07.01.06.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 01:06:15 -0700 (PDT)
Subject: Re: [PATCH 1/4] Acceptance tests: use an available kernel image
 package for arm
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Sarah Harris <S.E.Harris@kent.ac.uk>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200907042000.415931-1-crosa@redhat.com>
 <20200907042000.415931-2-crosa@redhat.com>
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
Message-ID: <001385a1-92eb-d311-88b5-8e1e7f6f1f48@redhat.com>
Date: Mon, 7 Sep 2020 10:06:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907042000.415931-2-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: H47VufHGiFoh

[Cc'ing Daniel who usually have good ideas for that
kind if project-wide problem]

On 9/7/20 6:19 AM, Cleber Rosa wrote:
> Which means a newer kernel version.  Expected output was changed
> to match the new kernel too.

Nack.

Acceptance tests are not to test the latest Linux kernel,
they aim to assert a specific kernel tested by some developer
still works while QEMU evolves.
QEMU doesn't have to adapt to the latest kernel;
QEMU should keep boot an old kernel.

Testing new kernels is good, you are adding coverage. But
this break the acceptance testing contract "keep testing
the same thing over time".

The problem you are trying to fix is the "where to keep
assets from public locations where they are being removed?"
one. Two years ago [*] you suggested to use some storage on
the avocado-project.org:

  For Avocado-VT, there are the JeOS images[1], which we
  keep on a test "assets" directory.  We have a lot of
  storage/bandwidth availability, so it can be used for
  other assets proven to be necessary for tests.

  As long as distribution rights and licensing are not
  issues, we can definitely use the same server for kernels,
  u-boot images and what not.

  [1] - https://avocado-project.org/data/assets/

It is time to have QEMU assets managed the same way.

[*] https://www.mail-archive.com/avocado-devel@redhat.com/msg00860.html

> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/boot_linux_console.py | 44 +++++++++++++-------------
>  tests/acceptance/replay_kernel.py      |  8 ++---
>  2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index aaa781a581..751b47b8fd 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -490,12 +490,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:cubieboard
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> @@ -522,7 +522,7 @@ class BootLinuxConsole(LinuxKernelTest):
>          exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
>                                                  'Allwinner sun4i/sun5i')
>          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> -                                                'system-control@1c00000')
> +                                                '1c00000.system-control')
>          # cubieboard's reboot is not functioning; omit reboot test.
>  
>      def test_arm_cubieboard_sata(self):
> @@ -530,12 +530,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:cubieboard
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
> @@ -573,12 +573,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:orangepi-pc
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>  
> @@ -598,12 +598,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:orangepi-pc
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> @@ -629,7 +629,7 @@ class BootLinuxConsole(LinuxKernelTest):
>          exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
>                                                  'Allwinner sun8i Family')
>          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> -                                                'system-control@1c00000')
> +                                                '1c00000.system-control')
>          exec_command_and_wait_for_pattern(self, 'reboot',
>                                                  'reboot: Restarting system')
>          # Wait for VM to shut down gracefully
> @@ -641,12 +641,12 @@ class BootLinuxConsole(LinuxKernelTest):
>          :avocado: tags=machine:orangepi-pc
>          :avocado: tags=device:sd
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
> index b79fc8daf8..80a460814f 100644
> --- a/tests/acceptance/replay_kernel.py
> +++ b/tests/acceptance/replay_kernel.py
> @@ -132,12 +132,12 @@ class ReplayKernel(LinuxKernelTest):
>          :avocado: tags=arch:arm
>          :avocado: tags=machine:cubieboard
>          """
> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>          kernel_path = self.extract_from_deb(deb_path,
> -                                            '/boot/vmlinuz-4.20.7-sunxi')
> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> 
