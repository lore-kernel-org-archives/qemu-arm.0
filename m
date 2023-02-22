Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4392415ejb;
        Wed, 22 Feb 2023 07:22:41 -0800 (PST)
X-Received: by 2002:a5d:47aa:0:b0:2c5:5839:daa0 with SMTP id 10-20020a5d47aa000000b002c55839daa0mr7379477wrb.24.1677079361588;
        Wed, 22 Feb 2023 07:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677079361; cv=none;
        d=google.com; s=arc-20160816;
        b=CpYkJ6U6I9HRTFHxoo7vo3bEkCb1S+06A8sks9SE2Dkw1YZqwOz8IECt/kDoArvvnb
         giwDGHGP80UYnjfi3FfuqKLzoC6M19s300pGVcVBXChjKKCQnKXpzjQGM/+jr0/WOq+/
         BFTgRVwqx+Z54eniF1WZ7P4CVV0rb4WoWfU0IJ/UoBONZcLPtKSUGnFGZJsmzCeWhdDq
         eh9HFfSccMXkVtVi0uOeiSsTQ782tri4BhBN5oBQZPu2L+khYoc8wuAhIeyD4dqPI6l3
         VRZG2/+pgjx7hCqLrwfpd/1k0FoA7/retvunIbdR8oDbKVt1Zx9Ngpgw1cihQ6t9k8iF
         CzXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=KJBJbv+415OUDEInsqHVKsr9uhTboRbJCqoLtf+TGo8=;
        b=lSnprMAEIky3DXegRhBAZAWbjtyvBMW8IlRGzjyQOfhJdBJ+lMSMzyF6zXQIxnYv7J
         P+FRP5GFTQPAHegMTo6cy3cN2M9gu9jDramJU5FIF+p3e6e7adIyb8rG2S2qQwj4+stx
         aBCEIA/LOePKKckI7hl81Kz8Xwo0d9fQ+E+uTgFlh/M0eo/xzeUd2tMND/qZubtPKY3t
         2eX3u6dXSU13hv6/0LjagGqPvtG8JWUq9vm5O58AKfAgwm7lITKNUwBfGLsI+9IOg15a
         IjI02TKuaMtrQw6xTCFDf/Dk1AXFmFgHyaZpcWA7Y7q9W0oPFZN3emOXR3yJVtdXmOAN
         +ggQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r7bT62So;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m4-20020a5d4a04000000b002be518094a0sor2700314wrq.58.2023.02.22.07.22.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Feb 2023 07:22:41 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r7bT62So;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KJBJbv+415OUDEInsqHVKsr9uhTboRbJCqoLtf+TGo8=;
        b=r7bT62SofzRC1bwNPO7hS5b4tzLwRJBGDe6Jt4K/cQ2jfNp6GKYuBuA/KCSK6e3Ogg
         t+D8J4tsUVarn/3aNBEsvSjhCg+cFIb32gMhMXD1Sh4r+iJIVIlr+dZ9rXtvam+vUNOZ
         AUsMffrz8jO+PKsBR3omgxVP5QMwmUCjPeXths2qOa3LB4ztEEp34QCX3J9xDVZiBJWr
         Kth18vub1slFTHuMd0EIli0sos4uTRUGIhoorL6RcX0dVye2aCrNJGL8Xt0dNW4YXjI3
         RIGevXj+L6uDaZMWJunYwUfySWrPYAhxUs8AFl1hsvdFeGBy8dWh7n0f78CtI52/FOib
         J/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJBJbv+415OUDEInsqHVKsr9uhTboRbJCqoLtf+TGo8=;
        b=M8X1mlM8ig1JW/5JmIrLAa6ghczJ5T5zULWHJNxGxWBeZupSLvX622tQzDDAV4aV/B
         X7pz0Tnk2IwuGZVwrWwi270XEYpIGdv021BMcoO1zPuBWPxfSEwCRM/eO2/Sp7CzXLUK
         F7RiuCU0pLJz3qsjZsC8g0I+UZuggr6d4WA2QEaitKBlxyoBoddrqWXvgHVcnqJIEJxM
         HCfkFH9hjouqiavdo3WlDW/xub/P9agNZgtEGa0eH5cA4WA6723zL6OcEOzC9LhOPQUT
         2xwn79xcnvlcRVycE3aKU9Bw72gBhPKerwvgK/ItqE7Gz6xs3M2t7CsYC4sCgGsM1I8O
         Sp+A==
X-Gm-Message-State: AO0yUKWbKSG/I2sNx1d4KP8lzTJYaON6UkATPgoJWl82gqMQyJUUpfks
	Yr0qWZLM4FZg4Pxe/GrOqBfVamjs2FJcO/4wTX0=
X-Google-Smtp-Source: AK7set8xOdcXl1xLbIbXsKDjNPR5bXIJZvKd44S9vlvPX8Do9p8wT9hl73Vm+xxxDV98pO+bRxYuuQ==
X-Received: by 2002:a5d:5e93:0:b0:2c5:5297:24ae with SMTP id ck19-20020a5d5e93000000b002c5529724aemr6829460wrb.2.1677079361050;
        Wed, 22 Feb 2023 07:22:41 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.115] ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id c15-20020adffb4f000000b002c55b0e6ef1sm8274104wrs.4.2023.02.22.07.22.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 07:22:40 -0800 (PST)
Message-ID: <40eb45d9-e51e-bbe9-bb09-40a5cb3aed24@linaro.org>
Date: Wed, 22 Feb 2023 16:22:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 02/12] tests/avocado: retire the Aarch64 TCG tests from
 boot_linux.py
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-3-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: BrMpNj7MquHZ

On 15/2/23 20:25, Alex Bennée wrote:
> The two TCG tests for GICv2 and GICv3 are very heavy weight distros
> that take a long time to boot up, especially for an --enable-debug
> build. The total code coverage they give is:
> 
>    Overall coverage rate:
>      lines......: 11.2% (59584 of 530123 lines)
>      functions..: 15.0% (7436 of 49443 functions)
>      branches...: 6.3% (19273 of 303933 branches)
> 
> We already get pretty close to that with the machine_aarch64_virt
> tests which only does one full boot (~120s vs ~600s) of alpine. We
> expand the kernel+initrd boot (~8s) to test both GICs and also add an
> RNG device and a block device to generate a few IRQs and exercise the
> storage layer. With that we get to a coverage of:
> 
>    Overall coverage rate:
>      lines......: 11.0% (58121 of 530123 lines)
>      functions..: 14.9% (7343 of 49443 functions)
>      branches...: 6.0% (18269 of 303933 branches)
> 
> which I feel is close enough given the massive time saving. If we want
> to target any more sub-systems we can use lighter weight more directed
> tests.
> 
> Reviewed-by: Fabiano Rosas <farosas@suse.de>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> 
> ---
> v2
>    - fix checkpatch warning
> ---
>   tests/avocado/boot_linux.py           | 48 ++++----------------
>   tests/avocado/machine_aarch64_virt.py | 64 ++++++++++++++++++++++++---
>   2 files changed, 66 insertions(+), 46 deletions(-)


> -    def test_aarch64_virt(self):
> +    def common_aarch64_virt(self, machine):
>           """
> -        :avocado: tags=arch:aarch64
> -        :avocado: tags=machine:virt
> -        :avocado: tags=accel:tcg
> -        :avocado: tags=cpu:max
> +        Common code to launch basic virt machine with kernel+initrd
> +        and a scratch disk.
>           """
> +        logger = logging.getLogger('aarch64_virt')
> +
>           kernel_url = ('https://fileserver.linaro.org/s/'
>                         'z6B2ARM7DQT3HWN/download')
> -
>           kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
>           kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
>   
> @@ -83,13 +85,63 @@ def test_aarch64_virt(self):
>                                  'console=ttyAMA0')
>           self.require_accelerator("tcg")
>           self.vm.add_args('-cpu', 'max,pauth-impdef=on',
> +                         '-machine', machine,

I'm surprised you had to add that, this should be handled by
avocado_qemu::get_vm which calls QEMUMachine::set_machine:

     def get_vm(self, *args, name=None):
             if self.machine is not None:
                 self._vms[name].set_machine(self.machine)

>                            '-accel', 'tcg',
>                            '-kernel', kernel_path,
>                            '-append', kernel_command_line)
> +
> +        # A RNG offers an easy way to generate a few IRQs
> +        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
> +        self.vm.add_args('-object',
> +                         'rng-random,id=rng0,filename=/dev/urandom')
> +
> +        # Also add a scratch block device
> +        logger.info('creating scratch qcow2 image')
> +        image_path = os.path.join(self.workdir, 'scratch.qcow2')
> +        qemu_img = os.path.join(BUILD_DIR, 'qemu-img')
> +        if not os.path.exists(qemu_img):
> +            qemu_img = find_command('qemu-img', False)
> +        if qemu_img is False:
> +            self.cancel('Could not find "qemu-img", which is required to '
> +                        'create the temporary qcow2 image')
> +        cmd = '%s create -f qcow2 %s 8M' % (qemu_img, image_path)
> +        process.run(cmd)
> +
> +        # Add the device
> +        self.vm.add_args('-blockdev',
> +                         f"driver=qcow2,file.driver=file,"
> +                         f"file.filename={image_path},node-name=scratch")
> +        self.vm.add_args('-device',
> +                         'virtio-blk-device,drive=scratch')
> +
>           self.vm.launch()
>           self.wait_for_console_pattern('Welcome to Buildroot')
>           time.sleep(0.1)
>           exec_command(self, 'root')
>           time.sleep(0.1)
> +        exec_command(self, 'dd if=/dev/hwrng of=/dev/vda bs=512 count=4')
> +        time.sleep(0.1)
> +        exec_command(self, 'md5sum /dev/vda')
> +        time.sleep(0.1)
> +        exec_command(self, 'cat /proc/interrupts')
> +        time.sleep(0.1)
>           exec_command(self, 'cat /proc/self/maps')
>           time.sleep(0.1)
> +
> +    def test_aarch64_virt_gicv3(self):
> +        """
> +        :avocado: tags=arch:aarch64
> +        :avocado: tags=machine:virt

(machine set here)

> +        :avocado: tags=accel:tcg
> +        :avocado: tags=cpu:max
> +        """
> +        self.common_aarch64_virt("virt,gic_version=3")

Ah, you duplicate as "-machine virt -machine virt,gic_version=3".

It would be clearer if you rename common_aarch64_virt() argument
as 'machine_options' and pass the option as:

          """
          :avocado: tags=machine:virt
          """
          self.common_aarch64_virt("gic_version=3")

to produce "-machine virt -machine gic_version=3".

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
