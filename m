Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1344257njb;
        Wed, 19 Feb 2025 05:25:43 -0800 (PST)
X-Received: by 2002:a05:600c:450b:b0:439:9225:2f50 with SMTP id 5b1f17b1804b1-43999db0139mr36046675e9.16.1739971542840;
        Wed, 19 Feb 2025 05:25:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739971542; cv=none;
        d=google.com; s=arc-20240605;
        b=T7g6n2CeC+VAz5FYgyz31rxlx0rt+J+GwYMv2chABmcsBPMIzu4Z07odCXtbCGSi2D
         9eCeWo5kNezXkjS+bqCe3/bskjhnP/Xy6F1Z/WTgaLS/K2UDcGyhhXG3XSyZtYpkjhNn
         L3c7eHhq21ZrEjZi6sHOy6JcNXFWxrwHAKXFTRsfaw7WBmRJPJWzJkn5eHU2vFJI5zMb
         TRX0T8aQ/FIvpLP745LZyoct0Ns/a63tIdsLXob+HxxygxALHgoKzxjlUnJgZuJIiPtC
         gLJfGi3aQDgFWEj2C44QrFfy+kixvL95Ml7Nrs75OS9LXAgcS7JaCnv0EYmzio9WdAgd
         RhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=DtuF+rz3778eIKLYUWSSALvsbBodG1m8cm177EWmjXM=;
        fh=o0qZTedznJwHkfc7d4faW3QLEovAIIN8A8tFNpqaouE=;
        b=UyEWX0PSWz/yhlyoHx+rzgYxZ0LQjGzmziAzGig0cZDdKasbr0y9d+/27aRYw0FNwW
         9T2ENvz8X07Phk2fEwzq426S4Zb/SZ4CkWffYXSl4K3L1hHPj09zlFUGP8VUVnUHeX2L
         fG5C1zRsJPBeeuhM202hb+2ij+VeACm+LjYhm2o9znycaDM6PkIv8mP+smHm5fGp0X9S
         9zo55RLtreaodkIze1QlXNUbM0rYl0ueFehOE6jFWYrMniBu6g90NoW53XxAHQkTnqB0
         m2S0Q7Ch1B8AmAOiNsed1DljH1tDQEOIX7ZVhTG2FbH4fCYBGraKCWHcNaAWrDwUHJaH
         cHcA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+CSrnLP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38f258f01e0sor3649767f8f.3.2025.02.19.05.25.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 05:25:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I+CSrnLP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739971542; x=1740576342; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DtuF+rz3778eIKLYUWSSALvsbBodG1m8cm177EWmjXM=;
        b=I+CSrnLPCdQjlxu75M6sH+ABrrDHi6E9T/leDO+Ezn6D9iAW2zixoTcGb0YAbX1zfN
         mpao6EOW4kYNfbSkmfg/sHUNUjM6N/XhfjAKtREmZOLwhEquW5ArKNWg/v7ipT4/54/u
         3ao6/ke9FRXvnaqkDz4vKvfF6wdWYjE3l3wVNVddFctZFRpLjHSqALphgkz2I16jpD1c
         nYKPZsEFRfKvOm7biD4A6Opn/nF8+DhnAHjBxQNT0sJk4adz34H9NSHE0XipumFJQwnw
         ajXyOaUw2LTQW+jT046JyIfigLND/0bqvDg0xaP1zfTUkfG/kKjipDmcqSerNQL/CjLZ
         LV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739971542; x=1740576342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DtuF+rz3778eIKLYUWSSALvsbBodG1m8cm177EWmjXM=;
        b=utTiT1Gud+2gT93W9CseIsYxMkSUP3x47tIccJp+YoZcxrHMSWelFBo9X/2C3BT788
         eT4NUoS1MXkz2YQyVvWHjB5hRRNCSEPu4jF6HKeaYuu+nPiSG0sHdukyGdBh42ghdToS
         oiNnBsIK0JQiKqK20jssXWCJNmG9Fg7p02TJIpg8mijwTxjejG/NSm0yw35WT2tf4t1d
         UghmDgujUyRDIu4Bq0FvQyG+EMZHTwPXCTwvz16m92itLBAvqaW/xFk0VRwwgpdLL1h5
         tZGgDmDQukXlnH5cIxx/+FB9jzJePt4YLaJYUc2VmwhsE/YQLwqtcsMT+aYxqaISfC96
         I/eA==
X-Gm-Message-State: AOJu0Yyj+CpucaEymC+B9+3PSqPYkIp7L3+zy1o0xCgnSIlNxg8m8G9Q
	uuYUGCRMPOxIdzx3fBphOrpC0Eu0tyPtpwUovYYs8eF41ajB1B+bLAIy+yyz20KjmtL8wm7Hxu/
	zpOt8nQ==
X-Gm-Gg: ASbGncskL3P/Aa+dwig/4yiEMCdHve9TpAqc6dwjvvhsVkbRZmj1SPizpvtOHdh9K8S
	UBhLikSyCsYhqv6PxZatsnGNz6sSeHuOkXEMkgHRe6qLQ7A7dZiflEfzyrT8QqUm5bmDGTQdjS8
	Xgti0+ummDz0uKe+yfqg1pt/Gv80/B3vQpKBzqFC/+Il82BjFMzVi7WXDFTOkJSXzf7qs7/DJOj
	MpyceoZUOTd2fp27UeJgGHvmhMftxP4lWdPHeJaUHLjXOQotmt7bOlRlA9lKKR4M0aooReGkWxp
	u8EfwA626xyvX95x53PeNL4B1fDsy6UWz5YKbNE8XR2/ZbYMpTo7ruUYROM=
X-Google-Smtp-Source: AGHT+IGQi91u7eT7pJaTa/M46yJFoAWIp0cbTppUiL2Wr7Z9PasuLWGkNly1NAnHG8rmGiO8vNDf6Q==
X-Received: by 2002:a5d:588f:0:b0:38f:3791:c1d3 with SMTP id ffacd0b85a97d-38f587f4141mr2809496f8f.54.1739971541858;
        Wed, 19 Feb 2025 05:25:41 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddba7sm18113033f8f.38.2025.02.19.05.25.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 05:25:41 -0800 (PST)
Message-ID: <91a78caf-2200-42b7-8da6-e857af38bad7@linaro.org>
Date: Wed, 19 Feb 2025 14:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 23/32] tests/functional: extend test_aarch64_virt with
 vulkan test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "open list:Virt" <qemu-arm@nongnu.org>
References: <20250110131754.2769814-1-alex.bennee@linaro.org>
 <20250110131754.2769814-24-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250110131754.2769814-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Tm6iVNWBRmkH

(+Markus for CLI)

On 10/1/25 14:17, Alex Bennée wrote:
> Now that we have virtio-gpu Vulkan support, let's add a test for it.
> Currently this is using images build by buildroot:
> 
>    https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.html
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20250108121054.1126164-24-alex.bennee@linaro.org>
> 
> diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
> index 201c5ed023..6b2336a28d 100755
> --- a/tests/functional/test_aarch64_virt.py
> +++ b/tests/functional/test_aarch64_virt.py
> @@ -13,10 +13,12 @@
>   import logging
>   from subprocess import check_call, DEVNULL
>   
> +from qemu.machine.machine import VMLaunchFailure
> +
>   from qemu_test import QemuSystemTest, Asset
> -from qemu_test import exec_command_and_wait_for_pattern
> +from qemu_test import exec_command, exec_command_and_wait_for_pattern
>   from qemu_test import wait_for_console_pattern
> -from qemu_test import get_qemu_img
> +from qemu_test import skipIfMissingCommands, get_qemu_img
>   
>   
>   class Aarch64VirtMachine(QemuSystemTest):
> @@ -132,5 +134,73 @@ def test_aarch64_virt_gicv2(self):
>           self.common_aarch64_virt("virt,gic-version=2")
>   
>   
> +    ASSET_VIRT_GPU_KERNEL = Asset(
> +        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> +        'download?path=%2F&files='
> +        'Image',
> +        '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462f6')
> +
> +    ASSET_VIRT_GPU_ROOTFS = Asset(
> +        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> +        'download?path=%2F&files='
> +        'rootfs.ext4.zstd',
> +        '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
> +
> +    @skipIfMissingCommands('zstd')
> +    def test_aarch64_virt_with_gpu(self):
> +        # This tests boots with a buildroot test image that contains
> +        # vkmark and other GPU exercising tools. We run a headless
> +        # weston that nevertheless still exercises the virtio-gpu
> +        # backend.
> +
> +        self.set_machine('virt')
> +        self.require_accelerator("tcg")
> +
> +        kernel_path = self.ASSET_VIRT_GPU_KERNEL.fetch()
> +        image_path = self.uncompress(self.ASSET_VIRT_GPU_ROOTFS, format="zstd")
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyAMA0 root=/dev/vda')
> +
> +        self.vm.add_args("-accel", "tcg")
> +        self.vm.add_args("-cpu", "neoverse-v1,pauth-impdef=on")
> +        self.vm.add_args("-machine", "virt,gic-version=max",
> +                         '-kernel', kernel_path,
> +                         '-append', kernel_command_line)
> +        self.vm.add_args("-smp", "2", "-m", "2048")
> +        self.vm.add_args("-device",
> +                         "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
> +        self.vm.add_args("-display", "egl-headless")
> +        self.vm.add_args("-display", "dbus,gl=on")

[*]

> +        self.vm.add_args("-device", "virtio-blk-device,drive=hd0")
> +        self.vm.add_args("-blockdev",
> +                         "driver=raw,file.driver=file,"
> +                         "node-name=hd0,read-only=on,"
> +                         f"file.filename={image_path}")
> +        self.vm.add_args("-snapshot")
> +
> +        try:
> +            self.vm.launch()
> +        except VMLaunchFailure as excp:
> +            if "old virglrenderer, blob resources unsupported" in excp.output:
> +                self.skipTest("No blob support for virtio-gpu")
> +            elif "old virglrenderer, venus unsupported" in excp.output:
> +                self.skipTest("No venus support for virtio-gpu")

This seems dependent on the order of the CLI arguments, as I got:

qemu-system-aarch64: -device 
virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on: 'virtio-gpu-gl-pci' is 
not a valid device model name

I understand it is too complex to check this device availability with
meson, in order to avoid running the test.

Can we use device introspection instead, like we do in QTest with
qtest_qom_has_concrete_type() for accelerators? Maybe in the lines of:

   @skipIfMissingQOMType('virtio-gpu-gl-pci')

Or having a skipIfMissingDevice -> skipIfMissingQOMType alias:

   @skipIfMissingDevice('virtio-gpu-gl-pci')

tests/functional/test_virtio_version.py already uses some of it:

  def devtype_implements(vm, devtype, implements):
      return devtype in [d['name'] for d in
                         vm.cmd('qom-list-types', implements=implements)]

> +            else:
> +                self.log.info("unhandled launch failure: {excp.output}")
> +                raise excp
> +
> +        self.wait_for_console_pattern('buildroot login:')
> +        exec_command(self, 'root')
> +        exec_command(self, 'export XDG_RUNTIME_DIR=/tmp')
> +        exec_command_and_wait_for_pattern(self,
> +                                          "weston -B headless "
> +                                          "--renderer gl "
> +                                          "--shell kiosk "
> +                                          "-- vkmark -b:duration=1.0",
> +                                          "vkmark Score")
> +
> +
>   if __name__ == '__main__':
>       QemuSystemTest.main()
