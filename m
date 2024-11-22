Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5241881njc;
        Fri, 22 Nov 2024 01:01:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVXRFOLH9vj3BclOkYA1vANFvwmvyzxbwaTHx3FRZEmO3RgFInXOJOoBb35n6hQV7/60SXgnc5zWC+RhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGNR8EkVDY1ZRL16uXe+mKHVYC3QEmQ2hmSrBjjPDtp4CI+lNtWBfto7/IkWxumOeSGEApQ
X-Received: by 2002:a05:6214:1c4a:b0:6d3:5be3:e711 with SMTP id 6a1803df08f44-6d44239bf6fmr102709676d6.9.1732266068053;
        Fri, 22 Nov 2024 01:01:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732266068; cv=none;
        d=google.com; s=arc-20240605;
        b=ZAUBLbhcwTq8qjaRwtFlEZc8CXndjLQz3cHbS3aIUg9CXlOMy7GqdPJVGmhWeIrvJu
         Hc3GUcelp77MexOxjESmN4wFJuPYxEPaj+UVlU+sDA/RWROgi6PPtYIaw2AEkdFWG4mw
         DqEtSxcL0kduSU1QwdMffkGfZDb/igbnNc5KLPGHbqu33E8K46JUyRQO2n4iy7KbOR0M
         h4SdAD5vtGz67HSytOdGraDfeqOXKCc/EjIiiGerINVgslpu3hWGZrHwwmpGePr8puiZ
         5vMdKe8lNr7FJgyGMYqpVHnth0sRHBOVlBhBkoeCGiClq0a5BK8RfN/x4p08qjWX0SqF
         AUJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=N3JUW4qkV2apTacWCwXy2kz9aAW/LpMQScgoeVD3cR0=;
        fh=VgtsKe4qokVVPyDAG84V5AW+JbCSuL5HgZ1cSRlBkuo=;
        b=VKQ7XpY42pZJQyseRxeIh6MxWJ+yRQLC1IknZhWgj6559viTT+SCd9O5FMr+ZRE7cG
         w5td/+m9tgW0KiLAqMJVA1gxJH6G+6r8UrwDSZWeePyPL/Z4dZ9q6ICZXUORO6bWTPsK
         3/LRHXYYEaSbM0uUFjiDIHYDT6EpQ/lWUx+fIgwaJaLg4SwGihSEEmh0zbWM/h+GZl3J
         HjzER7s4zc0K51KGbqBJ2xOA3dx9y9g+iuYkQYukdYtL2cz0HGHIdUEPKTlkswzoXR0P
         ZA8jAFnvRaSN7h/CJ38fjW1j5Xz5HDXc2AToeFluHNTwttSA8HZ2e9FjC7Ua3L+dA1IC
         0mbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lb6dXbG6;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451a8620fsi15294596d6.57.2024.11.22.01.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:01:08 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lb6dXbG6;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732266067;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N3JUW4qkV2apTacWCwXy2kz9aAW/LpMQScgoeVD3cR0=;
	b=Lb6dXbG6pk0cIV4/+OPR0a37P7LObKU/GM6MYoYRD3OjxLLRqsM9r4+nhjUn8fFATmCmQO
	AOWubExLjp/2Ri6k9pNx4l6lrfpWxuW4KHuWSLZKk6cN7er91L9EfjxOSOOSoDUDjrsdn6
	yF+IkakFCLIYUbBCx8E2Tg3rpFYbFpg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-u0hx6KpRN2mtjQHZAz917w-1; Fri, 22 Nov 2024 04:01:05 -0500
X-MC-Unique: u0hx6KpRN2mtjQHZAz917w-1
X-Mimecast-MFC-AGG-ID: u0hx6KpRN2mtjQHZAz917w
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6d41a81a98fso33589356d6.0
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 01:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266065; x=1732870865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N3JUW4qkV2apTacWCwXy2kz9aAW/LpMQScgoeVD3cR0=;
        b=I3GN40q4K0p81lImhLmyiFz+n+4V/+au1beuJlkFVcrcX4D31Wx+N1xbX1V2pinKxI
         ARGCStOtGk4WQdbJX/JJ2aUdpBb9tVMgcrBjPAwqaenRUUjBFTxy+36yKpL4nIiJlJmT
         hGcvE4JjBku2tYxjrbgQQ5x5yJb/BKugI7cWcMgHBW0ySq1UhaHQaL10L4mrYWTJU8qS
         mHdbaB5q3qfa0gx8PQm/zqzf0dn4vVsx9uwoWaA7RsC0Wp0PZtHsImlEOv0j9aLN6M8f
         oqXL1BRUE6SYjmpTzM0UQ0nTRRohjnYgbAWT5Lf4V0zxjoNtXyckkqE1Y6j2JQXu6TR5
         DDfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZiGDGBkpbQdHti7BqR3pxz6LVDlbjQsk/acWn/CiVaf7XISalwaoZf9zEMtoRQ2kCMIgHAmg9WpR4bw==@linaro.org
X-Gm-Message-State: AOJu0YyaaVRF4sykY7vVEImUfXwL/GNXqV0EetBRj9AuVJUbgjGvy7Ll
	2ArsFBgujA58GzbKbleY8XFI8m43QQM6IJPVgXg8DrBWzeKYfwX/jqx0nWdk6ojrwhljCEGuJqr
	yNK+fGTmu8URcdkqsQKL9Veft6amkDOnrc1QULnB3Rimi+FrCLV0JCQ==
X-Gm-Gg: ASbGnct9E8Iuyg5g2WrFLsy6jadojRta+tRzKBREus090FlpjWnySb/YufWtLl3VKZp
	n1uXH/Z0YRC5DsLKSHYON8clWOexutvBxVdEbcCKVmjmw5EcgGgCzyy7Rdr8ymkEqFRIE1CJ46m
	a3IQUFloIiU5ROin6wuIilXEqT2fIx5G7YXEi/1N0OI4CephrW06vrPCSYJUG8pgvjmnoeNSIpI
	c/9x6GIfXuG6ETB9nJKHYkoVwIkH2L2ym/080Fg2ItYCgcM0hmYs7TbWND7FuzQq3KnYBnx65ee
	qAZcCE9PujqZ
X-Received: by 2002:a05:6214:2528:b0:6cb:c9cf:cd40 with SMTP id 6a1803df08f44-6d442382f27mr112783136d6.8.1732266064885;
        Fri, 22 Nov 2024 01:01:04 -0800 (PST)
X-Received: by 2002:a05:6214:2528:b0:6cb:c9cf:cd40 with SMTP id 6a1803df08f44-6d442382f27mr112782726d6.8.1732266064565;
        Fri, 22 Nov 2024 01:01:04 -0800 (PST)
Return-Path: <clg@redhat.com>
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c? ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d451b23efdsm7338096d6.88.2024.11.22.01.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 01:01:04 -0800 (PST)
Message-ID: <ed195e1a-1ecc-4575-baed-f0777ee9379c@redhat.com>
Date: Fri, 22 Nov 2024 10:01:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] tests/functional: Convert Aspeed arm SDK tests
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20241122073309.1897944-1-clg@redhat.com>
 <20241122073309.1897944-3-clg@redhat.com>
 <fa39d761-91c5-4cb6-93b3-c077ce51a989@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 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
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <fa39d761-91c5-4cb6-93b3-c077ce51a989@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ax28ZhjwMmV0moXjk22kIta19mcx08hm1i9l-Rbu3Yk_1732266065
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: uAAHGLRRY01G

On 11/22/24 09:21, Thomas Huth wrote:
> On 22/11/2024 08.33, Cédric Le Goater wrote:
>> Drop the SSH connection which was introduced in the avocado tests to
>> workaround read issues when interacting with console.
>>
>> EXTRA_BOOTARGS was introduced to reduce the console output at Linux
>> boot time. This didn't have the desired effect as we still had issues
>> when trying to match patterns on the console and we had to use the ssh
>> connection as a workaround.
>>
>> While at it, remove the U-Boot EXTRA_BOOTARGS variable which has
>> become useless.
>>
>> Signed-off-by: Cédric Le Goater <clg@redhat.com>
>> ---
> ...
>> -    def do_test_arm_aspeed_sdk_start(self, image):
>> -        self.require_netdev('user')
> 
> The require_netdev('user') is gone in the new code, but it still uses "-net user" ... so I'd like to suggest to add it in the new code, too?

do_test_aarch64_aspeed_sdk_start needs it too. In v4 !

> With that nit fixed:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks,

C.

> 
> 
>> -        self.vm.set_console()
>> -        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>> -                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
>> -        self.vm.launch()
>> -
>> -        self.wait_for_console_pattern('U-Boot 2019.04')
>> -        interrupt_interactive_console_until_pattern(
>> -            self, 'Hit any key to stop autoboot:', 'ast#')
>> -        exec_command_and_wait_for_pattern(
>> -            self, 'setenv bootargs ${bootargs} ' + self.EXTRA_BOOTARGS, 'ast#')
>> -        exec_command_and_wait_for_pattern(
>> -            self, 'boot', '## Loading kernel from FIT Image')
>> -        self.wait_for_console_pattern('Starting kernel ...')
>> -
>> -    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
>> -    def test_arm_ast2500_evb_sdk(self):
>> -        """
>> -        :avocado: tags=arch:arm
>> -        :avocado: tags=machine:ast2500-evb
>> -        :avocado: tags=flaky
>> -        """
>> -
>> -        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
>> -                     'download/v08.06/ast2500-default-obmc.tar.gz')
>> -        image_hash = ('e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
>> -        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
>> -                                      algorithm='sha256')
>> -        archive.extract(image_path, self.workdir)
>> -
>> -        self.do_test_arm_aspeed_sdk_start(
>> -            self.workdir + '/ast2500-default/image-bmc')
>> -        self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
>> -
>> -    @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
>> -    def test_arm_ast2600_evb_sdk(self):
>> -        """
>> -        :avocado: tags=arch:arm
>> -        :avocado: tags=machine:ast2600-evb
>> -        :avocado: tags=flaky
>> -        """
>> -
>> -        image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
>> -                     'download/v08.06/ast2600-a2-obmc.tar.gz')
>> -        image_hash = ('9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
>> -        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
>> -                                      algorithm='sha256')
>> -        archive.extract(image_path, self.workdir)
>> -
>> -        self.vm.add_args('-device',
>> -                         'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
>> -        self.vm.add_args('-device',
>> -                         'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
>> -        self.do_test_arm_aspeed_sdk_start(
>> -            self.workdir + '/ast2600-a2/image-bmc')
>> -        self.wait_for_console_pattern('nodistro.0 ast2600-a2 ttyS4')
>> -
>> -        self.ssh_connect('root', '0penBmc', False)
>> -        self.ssh_command('dmesg -c > /dev/null')
>> -
>> -        self.ssh_command_output_contains(
>> -             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device ; '
>> -             'dmesg -c',
>> -             'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
>> -        self.ssh_command_output_contains(
>> -                             'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
>> -        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
>> -                    property='temperature', value=18000);
>> -        self.ssh_command_output_contains(
>> -                             'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
>> -
>> -        self.ssh_command_output_contains(
>> -             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device ; '
>> -             'dmesg -c',
>> -             'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
>> -        year = time.strftime("%Y")
>> -        self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);
>> -
>> diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
>> index 5fb1adf46439..7644ecbae750 100755
>> --- a/tests/functional/test_arm_aspeed.py
>> +++ b/tests/functional/test_arm_aspeed.py
>> @@ -252,6 +252,73 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
>>           self.do_test_arm_aspeed_buildroot_poweroff()
>> +    def do_test_arm_aspeed_sdk_start(self, image):
>> +        self.vm.set_console()
>> +        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
>> +                         '-net', 'nic', '-net', 'user', '-snapshot')
>> +        self.vm.launch()
>> +
>> +        self.wait_for_console_pattern('U-Boot 2019.04')
>> +        self.wait_for_console_pattern('## Loading kernel from FIT Image')
>> +        self.wait_for_console_pattern('Starting kernel ...')
>> +
>> +    ASSET_SDK_V806_AST2500 = Asset(
>> +        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2500-default-obmc.tar.gz',
>> +        'e1755f3cadff69190438c688d52dd0f0d399b70a1e14b1d3d5540fc4851d38ca')
>> +
>> +    def test_arm_ast2500_evb_sdk(self):
>> +        self.set_machine('ast2500-evb')
>> +
>> +        image_path = self.ASSET_SDK_V806_AST2500.fetch()
>> +
>> +        archive_extract(image_path, self.workdir)
>> +
>> +        self.do_test_arm_aspeed_sdk_start(
>> +            self.workdir + '/ast2500-default/image-bmc')
>> +
>> +        self.wait_for_console_pattern('ast2500-default login:')
>> +
>> +    ASSET_SDK_V806_AST2600_A2 = Asset(
>> +        'https://github.com/AspeedTech-BMC/openbmc/releases/download/v08.06/ast2600-a2-obmc.tar.gz',
>> +        '9083506135f622d5e7351fcf7d4e1c7125cee5ba16141220c0ba88931f3681a4')
>> +
>> +    def test_arm_ast2600_evb_sdk(self):
>> +        self.set_machine('ast2600-evb')
>> +
>> +        image_path = self.ASSET_SDK_V806_AST2600_A2.fetch()
>> +
>> +        archive_extract(image_path, self.workdir)
>> +
>> +        self.vm.add_args('-device',
>> +            'tmp105,bus=aspeed.i2c.bus.5,address=0x4d,id=tmp-test');
>> +        self.vm.add_args('-device',
>> +            'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
>> +        self.do_test_arm_aspeed_sdk_start(
>> +            self.workdir + '/ast2600-a2/image-bmc')
>> +
>> +        self.wait_for_console_pattern('ast2600-a2 login:')
>> +
>> +        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
>> +        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-a2:~#')
>> +
>> +        exec_command_and_wait_for_pattern(self,
>> +            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
>> +            'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
>> +        exec_command_and_wait_for_pattern(self,
>> +             'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
>> +        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
>> +                    property='temperature', value=18000);
>> +        exec_command_and_wait_for_pattern(self,
>> +             'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
>> +
>> +        exec_command_and_wait_for_pattern(self,
>> +             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device',
>> +             'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
>> +        year = time.strftime("%Y")
>> +        exec_command_and_wait_for_pattern(self,
>> +             '/sbin/hwclock -f /dev/rtc1', year);
>> +
>> +
>>   class AST2x00MachineMMC(LinuxKernelTest):
>>       ASSET_RAINIER_EMMC = Asset(
> 
