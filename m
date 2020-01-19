Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1892725lff;
        Sun, 19 Jan 2020 14:30:05 -0800 (PST)
X-Received: by 2002:a5d:494f:: with SMTP id r15mr15191717wrs.143.1579473004907;
        Sun, 19 Jan 2020 14:30:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579473004; cv=none;
        d=google.com; s=arc-20160816;
        b=s8NJSK1ECD0aLXJNKxY7sz631utc4eSy9WqgDu7qSLNciY2AHnvlb6vJ3r2Dp4n6oN
         vaWwUvmtC7Oxwy3b+rTPTbj3okKP43N0YpMArMMSeDsQche9jWflawpmhrSoJ/3qV5E1
         mBZa+ffN2fxBdAuSyWkT39c4LJVHB/W6+9Bn52EF1UzX6hRTHQYAmFPrcZAxOve0p25Q
         m2PN+2+rxtOMVBhxNofAFD7foV8PscGs1YNcUsUc9LDH215oV965mhfINcmg5J5O8ES1
         /oRvqQzdWL04oR7O/4f3a3m/MG2BCn8VezSITU1+NdXIBt+W7ucXscffUOAs4t1lY+v5
         az6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :sender:dkim-signature;
        bh=pzpUsFZLFxF+C5FuMJ2XDSXvUsBCMODgN+5k2ahrgYc=;
        b=Drm4cEayv4cMUrPCEZqI62DYGUNrTbQwBXBmn9dW2YT6ZGQOBRnSGt3SHdC0AqKTxB
         0n37K2OSqgyXutDjZHZgs+xEQshYYqrgcgRgoxXd5XYKgddK3wg/FPt65ANxCeuG+5cP
         nlGi+FpSRh5t6HQW3HOwcp210LnnGbajY0a5ZEx+96eplhKAi3kpHpMiPYajOnmcYDne
         35x9sI55Mct/zPWPtvKQO0Z51yyJbgIm6bIgpsy97APpoZfZMnIhTBNV2NL0S/+lCQUU
         5yTLH0rmp63FG02NDjn5aqxMdNYP7ZfBigemBdL2LysHqiIFQw2iSN0i/h6YDoXppk8e
         DfvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="OLpSn/Tf";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x12sor10854527wmk.0.2020.01.19.14.30.04
        (Google Transport Security);
        Sun, 19 Jan 2020 14:30:04 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="OLpSn/Tf";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pzpUsFZLFxF+C5FuMJ2XDSXvUsBCMODgN+5k2ahrgYc=;
        b=OLpSn/TfAFTFh7OTGZuFaD6SYDihV8s+AqYAtAFmxK9FP7Ibvj9TIvVB9lMCmxGlCD
         K6miMd/Z+CmU7GDdo6ErAfuOyZ9dXx9mj1UIGGzZkbBzmZ0tfICGoxMGBJ6617lTMCda
         AcODe0ISIOU7r3eI0FeMn9CCJvTW/JHfDBkEGhIYjKEbvVtzs9G+J9eztUyK60RsgxVH
         s7dvMQJHoc7pGFmLdx7PoWwewQLQtiUgTFOkP0/2NL+PNeSjyk1oll0N+p2eWFU2PXPm
         0WeZniHeblWeJbfUbITNZvtWnJnGKSG0GK72d+Mjd/z/2aXvnXqQ0NnA0D/cyAAeO7iS
         G5Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=pzpUsFZLFxF+C5FuMJ2XDSXvUsBCMODgN+5k2ahrgYc=;
        b=cJ8+v0b8h9xjxPIbVZ6CzPLQOG2QRgUChxLRVl7prDCARDic4VACmZfIL3W//8YF9M
         l2+Wulc1oV2Ygm1Iks1V5JmVf3d6rdkNjcgoTXuLH/l9hRGeysVNQ+dTS7ewKTwbQKCt
         S6ggHLli/1IK5XFd6YcMZoHQzcetBpkrWsK7eVy6sF2HoI/uLRATY31ebZhS7zP7aThZ
         gGgLWZRsISvVPhY54EmNS9/VpgAkd/Zl1WsNV2/CGpf7lWU5JRxFqoPuwYa+9rmjneUs
         u6kqttJrRgYiGNvsFB8LABVGYlAIUMLQacn9CkwMBQeQXjn4ROF/nsZ3+8jeui3nZ+w0
         YmzQ==
X-Gm-Message-State: APjAAAXPfajU5Y6XbWB+2fHR7894nqkAwU4FBXg25wGAro/tSaJGsSQA
	ZYJ/FzMj4aNDSlew+/VtWaQ7uEL3
X-Google-Smtp-Source: APXvYqzwis/RDPeXG5Ad5ksON9kzdd3HdhkflWM6sic+r6OihsXlVbKs45DHVHCyUyx9Ay1ahrk2GA==
X-Received: by 2002:a7b:c5d8:: with SMTP id n24mr15707408wmk.124.1579473004062;
        Sun, 19 Jan 2020 14:30:04 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id b18sm45625081wru.50.2020.01.19.14.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2020 14:30:03 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v4 16/20] tests/boot_linux_console: Add a SLOW test
 booting Ubuntu on OrangePi PC
To: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, philmd@redhat.com,
 b.galvani@gmail.com, jasowang@redhat.com, alex.bennee@linaro.org,
 imammedo@redhat.com
References: <20200119005102.3847-1-nieklinnenbank@gmail.com>
 <20200119005102.3847-17-nieklinnenbank@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Autocrypt: addr=f4bug@amsat.org; keydata=
 mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
 u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
 HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
 YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
 ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
 dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
 ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
 Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
 HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
 Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQJVBBMBCAA/AhsPBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgBYhBPqr514SkXIh3P1rsuPjLCzercDeBQJd660aBQks
 klzgAAoJEOPjLCzercDe2iMP+gMG2dUf+qHz2uG8nTBGMjgK0aEJrKVPodFA+iedQ5Kp3BMo
 jrTg3/DG1HMYdcvQu/NFLYwamUfUasyor1k+3dB23hY09O4xOsYJBWdilkBGsJTKErUmkUO2
 3J/kawosvYtJJSHUpw3N6mwz/iWnjkT8BPp7fFXSujV63aZWZINueTbK7Y8skFHI0zpype9s
 loU8xc4JBrieGccy3n4E/kogGrTG5jcMTNHZ106DsQkhFnjhWETp6g9xOKrzZQbETeRBOe4P
 sRsY9YSG2Sj+ZqmZePvO8LyzGRjYU7T6Z80S1xV0lH6KTMvq7vvz5rd92f3pL4YrXq+e//HZ
 JsiLen8LH/FRhTsWRgBtNYkOsd5F9NvfJtSM0qbX32cSXMAStDVnS4U+H2vCVCWnfNug2TdY
 7v4NtdpaCi4CBBa3ZtqYVOU05IoLnlx0miKTBMqmI05kpgX98pi2QUPJBYi/+yNu3fjjcuS9
 K5WmpNFTNi6yiBbNjJA5E2qUKbIT/RwQFQvhrxBUcRCuK4x/5uOZrysjFvhtR8YGm08h+8vS
 n0JCnJD5aBhiVdkohEFAz7e5YNrAg6kOA5IVRHB44lTBOatLqz7ntwdGD0rteKuHaUuXpTYy
 CRqCVAKqFJtxhvJvaX0vLS1Z2dwtDwhjfIdgPiKEGOgCNGH7R8l+aaM4OPOd
Message-ID: <6dd1ab52-3a75-c439-f26b-fa04d797059c@amsat.org>
Date: Sun, 19 Jan 2020 23:30:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200119005102.3847-17-nieklinnenbank@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: sTMjeGa4NAKt

On 1/19/20 1:50 AM, Niek Linnenbank wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> This test boots Ubuntu Bionic on a OrangePi PC board.
> 
> As it requires 1GB of storage, and is slow, this test is disabled
> on automatic CI testing.
> 
> It is useful for workstation testing. Currently Avocado timeouts too
> quickly, so we can't run userland commands.
> 
> The kernel image and DeviceTree blob are built by the Armbian
> project (based on Debian):
> https://www.armbian.com/orange-pi-pc/
> 
> The Ubuntu image is downloaded from:
> https://dl.armbian.com/orangepipc/Bionic_current

I forgot the image is compressed is compressed with 7z, which is not
provided by avocado.utils.archive. This patch requires more checks, see
inlined...

> 
> This test can be run using:
> 
>   $ AVOCADO_ALLOW_LARGE_STORAGE=yes \
>     avocado --show=app,console run -t machine:orangepi-pc \
>       tests/acceptance/boot_linux_console.py
>   console: U-Boot SPL 2019.04-armbian (Nov 18 2019 - 23:08:35 +0100)
>   console: DRAM: 1024 MiB
>   console: Failed to set core voltage! Can't set CPU frequency
>   console: Trying to boot from MMC1
>   console: U-Boot 2019.04-armbian (Nov 18 2019 - 23:08:35 +0100) Allwinner Technology
>   console: CPU:   Allwinner H3 (SUN8I 0000)
>   console: Model: Xunlong Orange Pi PC
>   console: DRAM:  1 GiB
>   console: MMC:   mmc@1c0f000: 0
>   [...]
>   console: Uncompressing Linux... done, booting the kernel.
>   console: Booting Linux on physical CPU 0x0
>   console: Linux version 5.3.9-sunxi (root@builder) (gcc version 8.3.0 (GNU Toolchain for the A-profile Architecture 8.3-2019.03 (arm-rel-8.36))) #19.11.3 SMP Mon Nov 18 18:49:43 CET 2019
>   console: CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=50c5387d
>   console: CPU: div instructions available: patching division code
>   console: CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
>   console: OF: fdt: Machine model: Xunlong Orange Pi PC
>   [...]
>   console: EXT4-fs (mmcblk0p1): mounted filesystem with writeback data mode. Opts: (null)
>   console: done.
>   console: Begin: Running /scripts/local-bottom ... done.
>   console: Begin: Running /scripts/init-bottom ... done.
>   console: systemd[1]: systemd 237 running in system mode. (...)
>   console: systemd[1]: Detected architecture arm.
>   console: Welcome to Ubuntu 18.04.3 LTS!
>   console: systemd[1]: Set hostname to <orangepipc>.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [NL: rename in commit message Raspbian to Armbian, remove vm.set_machine()]
> [NL: changed test to boot from SD card via BootROM]
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  tests/acceptance/boot_linux_console.py | 41 ++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index 50294e1675..399d5062db 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py

This patch needs:

  from avocado.utils.path import find_command

  P7ZIP_AVAILABLE = True
  try:
      find_command('7z')
  except CmdNotFoundError:
      P7ZIP_AVAILABLE = False

> @@ -591,6 +591,47 @@ class BootLinuxConsole(Test):
>          exec_command_and_wait_for_pattern(self, 'reboot',
>                                                  'reboot: Restarting system')
>  
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')

       @skipUnless(P7ZIP_AVAILABLE, '7z not installed')

> +    def test_arm_orangepi_bionic(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:orangepi-pc
> +        """
> +
> +        # This test download a 196MB compressed image and expand it to 932MB...
> +        image_url = ('https://dl.armbian.com/orangepipc/archive/'
> +                     'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.7z')
> +        image_hash = '196a8ffb72b0123d92cea4a070894813d305c71e'
> +        image_path_7z = self.fetch_asset(image_url, asset_hash=image_hash)
> +        image_name = 'Armbian_19.11.3_Orangepipc_bionic_current_5.3.9.img'
> +        image_path = os.path.join(self.workdir, image_name)
> +        process.run("7z e -o%s %s" % (self.workdir, image_path_7z))

Because here 7z is called ^

> +
> +        self.vm.set_console()
> +        self.vm.add_args('-drive', 'file=' + image_path + ',if=sd,format=raw',
> +                         '-nic', 'user',
> +                         '-no-reboot')
> +        self.vm.launch()
> +
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyS0,115200 '
> +                               'loglevel=7 '
> +                               'nosmp '
> +                               'systemd.default_timeout_start_sec=9000 '
> +                               'systemd.mask=armbian-zram-config.service '
> +                               'systemd.mask=armbian-ramlog.service')
> +
> +        self.wait_for_console_pattern('U-Boot SPL')
> +        self.wait_for_console_pattern('Autoboot in ')
> +        exec_command_and_wait_for_pattern(self, ' ', '=>')
> +        exec_command_and_wait_for_pattern(self, "setenv extraargs '" +
> +                                                kernel_command_line + "'", '=>')
> +        exec_command_and_wait_for_pattern(self, 'boot', 'Starting kernel ...');
> +
> +        self.wait_for_console_pattern('systemd[1]: Set hostname ' +
> +                                      'to <orangepipc>')
> +        self.wait_for_console_pattern('Starting Load Kernel Modules...')
> +
>      def test_s390x_s390_ccw_virtio(self):
>          """
>          :avocado: tags=arch:s390x
> 
