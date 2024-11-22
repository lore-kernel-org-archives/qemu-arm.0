Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5225749njc;
        Fri, 22 Nov 2024 00:21:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUoW6l8LT2jPs0P0pN8JcCECsaaFiIxw94P4O1eV6B7UjOAa5ybmhW5fHDw2+6XBzHVf4GW88jJrKvggw==@linaro.org
X-Google-Smtp-Source: AGHT+IHRg5bbKKOtri5hSeTrHJ30/KuTgkCDZMFQoYGMT1O7OrE4VS4zkkZNynfz60ESTTtowziv
X-Received: by 2002:a05:620a:2406:b0:7af:cd3c:1f2e with SMTP id af79cd13be357-7b51453a420mr238004585a.26.1732263696815;
        Fri, 22 Nov 2024 00:21:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732263696; cv=none;
        d=google.com; s=arc-20240605;
        b=AByJHW9fTy/01qrLY+QunepL1yL/CkOc4NtBRJIuIMk9XYgW5rgjKpUw2hbTIGIA7P
         belTzsEaIFS/6Cbq+CS6UmYVnGiKgazsGkj6J/Cydd0bflrDOe/CWFjZKhmEx2D7yTkr
         DmwThiN43mQmIqwHZZYbZQWdckxZjSqOPd5+bCm4mdM5pMaaBbp3GpQCRxu0ODHGrQnD
         4gW3215yesRrHIgrATVo3jfk7JvXVR3JoEcvg0J1Sv+egE5ciNjWefpNwbtL0rJ9gN/T
         xHkM4iyd2S8mS0aB9n6LZ39Nkxk2I/o/BkYPGgoCq6TmA4Rm9ydyfumFtdNuh3a3RZwv
         dziQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=pdHXf7bdQWNwC0IHZFz5RGSWoCd2ZJXMrUIo60PbqTw=;
        fh=F0sDAcW8vqbcySvF3/XP/p5MwFX16PwOeBrRnUZVtfM=;
        b=ixdGFO1JoZYH+HL4quUvGgBEmzS7bkCqma83nYm06SlR+MDaBPxlviidinJu6MWGZV
         1MtCM9DZJqdw9HzoRpu7j5Abc3Wm01LGvWe9uPnni/GJoMZLwITT0XEC4CjEwS2l6lPV
         nlOct3JSHPg95N96TmlZfKwSqRCL9EUDDA0dsoqt+YDGl6r2rhgFPX0oCm/vs2Yziktr
         UUofNaBNfg1ieRDFEGSWiCiGzjHruBwipWuQS4MqVhn0rZ029a4hNQSYHpx0a0/bgpja
         V3O4CBYEQm8Ch9SdhUkZmK7ABBbUyrFhxwcN56UBt+Mlniy9Yphro85d7HY04XRejEoA
         yIHA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PftTj4Po;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b5143c2168si154629085a.708.2024.11.22.00.21.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 00:21:36 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PftTj4Po;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732263696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pdHXf7bdQWNwC0IHZFz5RGSWoCd2ZJXMrUIo60PbqTw=;
	b=PftTj4PoxAIIJdX3RacaWloBjZx4teEg9HxUHk7FOnpwXS07RtLizlHTpHMFla+6kY1KMT
	CPwPNdVHldZNPul+gaXdPi8SSi1IRbAjh3u3wPa9NU0VwkEfT4qGi6SglbuQvi7jDYp/A5
	QpobieGyOJm+w0JxRPnANckhGlt5v24=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-e3l1B8M7OtyfQZx6xjTwzA-1; Fri, 22 Nov 2024 03:21:35 -0500
X-MC-Unique: e3l1B8M7OtyfQZx6xjTwzA-1
X-Mimecast-MFC-AGG-ID: e3l1B8M7OtyfQZx6xjTwzA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4317391101aso13834575e9.2
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 00:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732263694; x=1732868494;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdHXf7bdQWNwC0IHZFz5RGSWoCd2ZJXMrUIo60PbqTw=;
        b=KJr9JLK0N/uwE9lEqtJA/k8Y0zKaTa3ZfPD2uGhHAh+Y5ooOwWMeU4Z/4D/ixpT8GJ
         c6V5oPtBGQVy92qVKfQouhGxVI7+xuOt+GXi01eAjalIjF1pzB+eMesrwl9adMGYMIfk
         6dOVRbvWtVh2nztMZ5Tgu/BgXhDCJSwlnqvtgxEAAN7zidIU9xPFB1jYyBRFWYpaGNSP
         yP4WDrlJK98O5hdUrstQBjSqqfipvcIbZ/iKL+Yi4Ns6e5+911dnihMOgwizx+Q3aoy0
         WMtYzHfBLwRKVrEjoeUxiKK7LC1A5pToGggYizpIpnJaLg2eEzXfjl0JK6M2au+TCp52
         tKzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHcv2CVbG2VumGKbUzbeOx9FkaDF1RbCnv3f2ALx/vH4U7wVeR7kdoklN6EI7/waFdhIqe/GQMHZMTlw==@linaro.org
X-Gm-Message-State: AOJu0YzsBl65ETnc1EU8xZa29BF9kDiEpA+rygiFiNLDF5H7TzYYsnU3
	1Zv5CBZhno4J5ySLYgOZ4Y8QLycpNLMYRq3NFpZ5PA7+yxMiyOD5iPHDYpnLmb1Wu0ATh0DCPd6
	wpWfDZz+WQ7mAJHZwFCAOKdzekvfMZa6b07XQ2jQ5ol/R5dHMga9gGQ==
X-Gm-Gg: ASbGncvvs3mED3rgq0TitRmdtdlWKV/6aCpB7H+GQtaVnBopUbXBiH17v7Ey9M/h0dr
	aDW2p2zWEmbsMfMDb6OQwWJaZfjjT0R6Fz/oK9HLSjrEH9Pe9hrmML8nfaLdb+qyoWrdXkAUk8S
	hvmW769blC4OhFqF6DpCsyTUE9DIdnOoIZSL9wiov2t8NmLp1MltTN4xHxm51JTMUnzMRmJEPBb
	2aiDsdpqdLCWfyYc4+At4/+nkMpSsEOuECQYoukEDUClORhRuKvkFTYVQF+cz/4ggtIFTngK5s=
X-Received: by 2002:a05:600c:a02:b0:431:4a5a:f09a with SMTP id 5b1f17b1804b1-433ce4b2f62mr14332935e9.24.1732263693907;
        Fri, 22 Nov 2024 00:21:33 -0800 (PST)
X-Received: by 2002:a05:600c:a02:b0:431:4a5a:f09a with SMTP id 5b1f17b1804b1-433ce4b2f62mr14332665e9.24.1732263693488;
        Fri, 22 Nov 2024 00:21:33 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [10.33.192.206] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde05898sm19459475e9.9.2024.11.22.00.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 00:21:33 -0800 (PST)
Message-ID: <fa39d761-91c5-4cb6-93b3-c077ce51a989@redhat.com>
Date: Fri, 22 Nov 2024 09:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] tests/functional: Convert Aspeed arm SDK tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20241122073309.1897944-1-clg@redhat.com>
 <20241122073309.1897944-3-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241122073309.1897944-3-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -Fsn8BA2s35y1U20MwpkIhg7hVAUn2HUb3-I98SiSQA_1732263694
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: t1K/+VWGRSVW

On 22/11/2024 08.33, Cédric Le Goater wrote:
> Drop the SSH connection which was introduced in the avocado tests to
> workaround read issues when interacting with console.
> 
> EXTRA_BOOTARGS was introduced to reduce the console output at Linux
> boot time. This didn't have the desired effect as we still had issues
> when trying to match patterns on the console and we had to use the ssh
> connection as a workaround.
> 
> While at it, remove the U-Boot EXTRA_BOOTARGS variable which has
> become useless.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
...
> -    def do_test_arm_aspeed_sdk_start(self, image):
> -        self.require_netdev('user')

The require_netdev('user') is gone in the new code, but it still uses "-net 
user" ... so I'd like to suggest to add it in the new code, too?

With that nit fixed:
Reviewed-by: Thomas Huth <thuth@redhat.com>


> -        self.vm.set_console()
> -        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> -                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
> -        self.vm.launch()
> -
> -        self.wait_for_console_pattern('U-Boot 2019.04')
> -        interrupt_interactive_console_until_pattern(
> -            self, 'Hit any key to stop autoboot:', 'ast#')
> -        exec_command_and_wait_for_pattern(
> -            self, 'setenv bootargs ${bootargs} ' + self.EXTRA_BOOTARGS, 'ast#')
> -        exec_command_and_wait_for_pattern(
> -            self, 'boot', '## Loading kernel from FIT Image')
> -        self.wait_for_console_pattern('Starting kernel ...')
> -
> -    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> -    def test_arm_ast2500_evb_sdk(self):
> -        """
> -        :avocado: tags=arch:arm
> -        :avocado: tags=machine:ast2500-evb
> -        :avocado: tags=flaky
> -        """
> -
> -        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
> -                     'download/v08.06/ast2500-default-obmc.tar.gz')
> -        image_hash = ('e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
> -        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
> -                                      algorithm='sha256')
> -        archive.extract(image_path, self.workdir)
> -
> -        self.do_test_arm_aspeed_sdk_start(
> -            self.workdir + '/ast2500-default/image-bmc')
> -        self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
> -
> -    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
> -    def test_arm_ast2600_evb_sdk(self):
> -        """
> -        :avocado: tags=arch:arm
> -        :avocado: tags=machine:ast2600-evb
> -        :avocado: tags=flaky
> -        """
> -
> -        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
> -                     'download/v08.06/ast2600-a2-obmc.tar.gz')
> -        image_hash = ('9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
> -        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
> -                                      algorithm='sha256')
> -        archive.extract(image_path, self.workdir)
> -
> -        self.vm.add_args('-device',
> -                         'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
> -        self.vm.add_args('-device',
> -                         'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
> -        self.do_test_arm_aspeed_sdk_start(
> -            self.workdir + '/ast2600-a2/image-bmc')
> -        self.wait_for_console_pattern('nodistro.0 ast2600-a2 ttyS4')
> -
> -        self.ssh_connect('root', '0penBmc', False)
> -        self.ssh_command('dmesg -c > /dev/null')
> -
> -        self.ssh_command_output_contains(
> -             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device ; '
> -             'dmesg -c',
> -             'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
> -        self.ssh_command_output_contains(
> -                             'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
> -        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
> -                    property='temperature', value=18000);
> -        self.ssh_command_output_contains(
> -                             'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
> -
> -        self.ssh_command_output_contains(
> -             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device ; '
> -             'dmesg -c',
> -             'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
> -        year = time.strftime("%Y")
> -        self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);
> -
> diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
> index 5fb1adf46439..7644ecbae750 100755
> --- a/tests/functional/test_arm_aspeed.py
> +++ b/tests/functional/test_arm_aspeed.py
> @@ -252,6 +252,73 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
>   
>           self.do_test_arm_aspeed_buildroot_poweroff()
>   
> +    def do_test_arm_aspeed_sdk_start(self, image):
> +        self.vm.set_console()
> +        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
> +                         '-net', 'nic', '-net', 'user', '-snapshot')
> +        self.vm.launch()
> +
> +        self.wait_for_console_pattern('U-Boot 2019.04')
> +        self.wait_for_console_pattern('## Loading kernel from FIT Image')
> +        self.wait_for_console_pattern('Starting kernel ...')
> +
> +    ASSET_SDK_V806_AST2500 = Asset(
> +        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2500-default-obmc.tar.gz',
> +        'e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
> +
> +    def test_arm_ast2500_evb_sdk(self):
> +        self.set_machine('ast2500-evb')
> +
> +        image_path = self.ASSET_SDK_V806_AST2500.fetch()
> +
> +        archive_extract(image_path, self.workdir)
> +
> +        self.do_test_arm_aspeed_sdk_start(
> +            self.workdir + '/ast2500-default/image-bmc')
> +
> +        self.wait_for_console_pattern('ast2500-default login:')
> +
> +    ASSET_SDK_V806_AST2600_A2 = Asset(
> +        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2600-a2-obmc.tar.gz',
> +        '9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
> +
> +    def test_arm_ast2600_evb_sdk(self):
> +        self.set_machine('ast2600-evb')
> +
> +        image_path = self.ASSET_SDK_V806_AST2600_A2.fetch()
> +
> +        archive_extract(image_path, self.workdir)
> +
> +        self.vm.add_args('-device',
> +            'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
> +        self.vm.add_args('-device',
> +            'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
> +        self.do_test_arm_aspeed_sdk_start(
> +            self.workdir + '/ast2600-a2/image-bmc')
> +
> +        self.wait_for_console_pattern('ast2600-a2 login:')
> +
> +        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
> +        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-a2:~#')
> +
> +        exec_command_and_wait_for_pattern(self,
> +            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
> +            'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
> +        exec_command_and_wait_for_pattern(self,
> +             'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
> +        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
> +                    property='temperature', value=18000);
> +        exec_command_and_wait_for_pattern(self,
> +             'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
> +
> +        exec_command_and_wait_for_pattern(self,
> +             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device',
> +             'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
> +        year = time.strftime("%Y")
> +        exec_command_and_wait_for_pattern(self,
> +             '/sbin/hwclock -f /dev/rtc1', year);
> +
> +
>   class AST2x00MachineMMC(LinuxKernelTest):
>   
>       ASSET_RAINIER_EMMC = Asset(
