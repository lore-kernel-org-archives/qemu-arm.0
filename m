Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1359088njb;
        Wed, 19 Feb 2025 05:52:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVxTIUnPKr6VdCydYm6d8mjsePpdfJ60eNfA+gvF+o0uTpS+lPVrv0MLT4+MOAjdSOBWvKunmWZSWQTvQ==@linaro.org
X-Received: by 2002:a5d:518b:0:b0:38f:2f88:b034 with SMTP id ffacd0b85a97d-38f33f4e284mr12896472f8f.42.1739973153851;
        Wed, 19 Feb 2025 05:52:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739973153; cv=none;
        d=google.com; s=arc-20240605;
        b=gRyxg3FzTK5J9SH7YcXViIIaHwV0LXMN5DmTSfzDNh4plksBjQvWgUU3d+PUQgrOOY
         w4EvyKOc7UmPJ1dvu2GF4yMPs7wS8NQQet2s3NUVcchd0tIxJSrS5ZvdMS4y3eBq9fxC
         IzXRV6g5B7ACaT/Y7OP1oCcnxS5KiMM+QmjUNisTvfG/ErsX5pDWVITn4YJRhf3VfSDp
         gSZejZXxB9bBuWx+mwDMK3hqPaP0/QQKzIH1nxrE9TPQfCVkpX425/qVU3itu/UiANlz
         6256RVvcrD1sGW47rYsLupw/+2KZCLvNpwt5+tbaUFdQhul7zb+wYfvKvxoqgTHT0dxU
         Gt0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ky0FqEXk3PNMyggSwD0aEVfPAYskpZSffK5UlDh1w10=;
        fh=/6GeaAzag734i9qORkqx3KOrfQqyZhW3Q6QeaeAOrCU=;
        b=ChalVfCD96dFatul7mU1WxkPBJ3CNgXFS+lz7ufe4E++pSok/MevsQeAYNncRhyE+T
         rGPd6y9wI5jsZdKekemVMNAV7HHC+GaWqUlR/0KF+E2r8CV2TPN1pdctd0o/0CaZDP0/
         CX1ujv2ZrhOxqwFMWopV7fuENv/+DKgaIWu3p3Kp6N/2y1sHYE4YjTqaavlEHMD0lwCu
         JPdnuoyRd4HzvaGZfOGqMzapMUuuzQ6HAyD6UFeX06zHGJCen0f+fJaGZ8v1VQaMDUXU
         CYzX6dO/jJG9ukaeh/WYm3tAlsyf5XpY/Cs+6RY86j/H0raV0yR044KEgeOEjABWyRRY
         qWBg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYJ0oJ28;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-38f25984f98sor4929426f8f.7.2025.02.19.05.52.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 19 Feb 2025 05:52:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dYJ0oJ28;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739973153; x=1740577953; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ky0FqEXk3PNMyggSwD0aEVfPAYskpZSffK5UlDh1w10=;
        b=dYJ0oJ28X6g5yHzhEobvEFGGHJZUuh4bDMzjTgKYkeRYViwG9XHqF+RGlI5ziAt10B
         pIWBYjOsSUYaR6jFYduEA/Udahwhl6v/GYZbCFsD6y/uz77mt5v/hnOxbOQzjG12dIvO
         1TtBkuXO52y3MJwgKiKX/46SitdjBbqKkbWc+PEVQ+5DhZ4uyOJlHMHrdHiUqXgux5lY
         fL9cWVHy+VyiHCKH5Vy2PTdymRPG0+Gyc+EVnmmuuXQtWpJ2nwPvUvYYDAxPVC5n39bc
         PQvEHzzjxXM91npVHGvv0Z7Xak6hnceDSqoBhGt5OTqEg85H0GjBX5LgI12JIK4Jaf5X
         cLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973153; x=1740577953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ky0FqEXk3PNMyggSwD0aEVfPAYskpZSffK5UlDh1w10=;
        b=lWfzjei6nAXlT0IZflZyF03tvSIeUkOqUGlGGtFPXL0j3XovayYf11CJrt36HcvGvY
         9jTv77y7dJa9U1EYAVaNy5d+BRfPTv0N5gmLed43XY62yjedJewaqiZvZe1pIw8OtPcy
         rbZaKBTFgIw911IlN/Dbm16SkrBjwjRFDAI2009G33H54AKSJ+gWPDbUZ+OwoobQuuU5
         TAMItT8Z6/ksY1idcTxAZP9z203TTxkP86C7SdjG6XZHNmwSDcKNA42CMG5sM0oRRjYI
         ooIqD861RCJoUjeqmTuWn0Xo/PMvBxyGFOxakLSpiE9T+mR3RNNnYFgPPtZAGQcZdrCp
         qOkg==
X-Forwarded-Encrypted: i=1; AJvYcCWvPHCLFHsTYRI9kE5eFWJjIeNHlPGil0DCuTHBIv1sk1v0k46G1F64HlOewY/yBDp8lDmQTsuj9zLeFQ==@linaro.org
X-Gm-Message-State: AOJu0Yyx4W4eb8ICYGkmvnZ8Ep1oRm068khiCvEu7sSu32IwSaflX/DU
	3MM7dXkddnqOZB492JZk8JhCNPxLeiPRO8+T3Jd2RXkpZaAMda0vmnYdMbnsQpyafv/EnR3g7eU
	v8HxHdg==
X-Gm-Gg: ASbGncsyzeP6ljnAqNq0jzFuzzPC5e5ekDuf4YqltVznHImr34/+CrGhXD1wZTNe0BZ
	NGue1/G9i9iXW7s6kItCjAlKN6v3xXY62m+O5YavINYainuNFxAFumO0xd8jerBgIn35HHe/ZOv
	86102XygxDmQqIWFm1uda2C+ux20enD+DpsTmuktKFaaa/txobPVm3vMUqmX0nsopRZlxKmyoa0
	JRo/DfpgJ4x1FgN8AwVFfqHZOG9rcMU5JXriRUigL5HL2YpOsi+cDmdlS9VbTgVjlayP9hhzwno
	hs9OR2k7pDFCyQ8pkrP2ITSqHojDxFX1TTCjH+K+ND6UAnbuc9XRQUwUjOg=
X-Google-Smtp-Source: AGHT+IF1dV2ICDQlE4h08oCrWDTZlSFQeu19yZxT88E71XyMeaFR07nB+TTVtdoMdky+5t3Tvu9TrA==
X-Received: by 2002:a05:6000:145:b0:38d:b325:471f with SMTP id ffacd0b85a97d-38f33f1f725mr14675924f8f.15.1739973153268;
        Wed, 19 Feb 2025 05:52:33 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8121sm17699059f8f.88.2025.02.19.05.52.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 05:52:32 -0800 (PST)
Message-ID: <f1066292-2395-44e5-bf2d-543deba647d6@linaro.org>
Date: Wed, 19 Feb 2025 14:52:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 23/32] tests/functional: extend test_aarch64_virt with
 vulkan test
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Virt" <qemu-arm@nongnu.org>
References: <20250110131754.2769814-1-alex.bennee@linaro.org>
 <20250110131754.2769814-24-alex.bennee@linaro.org>
 <91a78caf-2200-42b7-8da6-e857af38bad7@linaro.org>
 <87751cfc-b2b9-4995-a024-13905a1c47ca@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <87751cfc-b2b9-4995-a024-13905a1c47ca@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UTrdzTJnMVJ7

On 19/2/25 14:43, Thomas Huth wrote:
> On 19/02/2025 14.25, Philippe Mathieu-Daudé wrote:
>> (+Markus for CLI)
>>
>> On 10/1/25 14:17, Alex Bennée wrote:
>>> Now that we have virtio-gpu Vulkan support, let's add a test for it.
>>> Currently this is using images build by buildroot:
>>>
>>>    https://lists.buildroot.org/pipermail/buildroot/2024- 
>>> December/768196.html
>>>
>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20250108121054.1126164-24-alex.bennee@linaro.org>
>>>
>>> diff --git a/tests/functional/test_aarch64_virt.py b/tests/ 
>>> functional/ test_aarch64_virt.py
>>> index 201c5ed023..6b2336a28d 100755
>>> --- a/tests/functional/test_aarch64_virt.py
>>> +++ b/tests/functional/test_aarch64_virt.py
>>> @@ -13,10 +13,12 @@
>>>   import logging
>>>   from subprocess import check_call, DEVNULL
>>> +from qemu.machine.machine import VMLaunchFailure
>>> +
>>>   from qemu_test import QemuSystemTest, Asset
>>> -from qemu_test import exec_command_and_wait_for_pattern
>>> +from qemu_test import exec_command, exec_command_and_wait_for_pattern
>>>   from qemu_test import wait_for_console_pattern
>>> -from qemu_test import get_qemu_img
>>> +from qemu_test import skipIfMissingCommands, get_qemu_img
>>>   class Aarch64VirtMachine(QemuSystemTest):
>>> @@ -132,5 +134,73 @@ def test_aarch64_virt_gicv2(self):
>>>           self.common_aarch64_virt("virt,gic-version=2")
>>> +    ASSET_VIRT_GPU_KERNEL = Asset(
>>> +        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
>>> +        'download?path=%2F&files='
>>> +        'Image',
>>> +        
>>> '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462f6')
>>> +
>>> +    ASSET_VIRT_GPU_ROOTFS = Asset(
>>> +        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
>>> +        'download?path=%2F&files='
>>> +        'rootfs.ext4.zstd',
>>> +        
>>> '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
>>> +
>>> +    @skipIfMissingCommands('zstd')
>>> +    def test_aarch64_virt_with_gpu(self):
>>> +        # This tests boots with a buildroot test image that contains
>>> +        # vkmark and other GPU exercising tools. We run a headless
>>> +        # weston that nevertheless still exercises the virtio-gpu
>>> +        # backend.
>>> +
>>> +        self.set_machine('virt')
>>> +        self.require_accelerator("tcg")
>>> +
>>> +        kernel_path = self.ASSET_VIRT_GPU_KERNEL.fetch()
>>> +        image_path = self.uncompress(self.ASSET_VIRT_GPU_ROOTFS, 
>>> format="zstd")
>>> +
>>> +        self.vm.set_console()
>>> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>>> +                               'console=ttyAMA0 root=/dev/vda')
>>> +
>>> +        self.vm.add_args("-accel", "tcg")
>>> +        self.vm.add_args("-cpu", "neoverse-v1,pauth-impdef=on")
>>> +        self.vm.add_args("-machine", "virt,gic-version=max",
>>> +                         '-kernel', kernel_path,
>>> +                         '-append', kernel_command_line)
>>> +        self.vm.add_args("-smp", "2", "-m", "2048")
>>> +        self.vm.add_args("-device",
>>> +                         "virtio-gpu-gl- 
>>> pci,hostmem=4G,blob=on,venus=on")
>>> +        self.vm.add_args("-display", "egl-headless")
>>> +        self.vm.add_args("-display", "dbus,gl=on")
>>
>> [*]
>>
>>> +        self.vm.add_args("-device", "virtio-blk-device,drive=hd0")
>>> +        self.vm.add_args("-blockdev",
>>> +                         "driver=raw,file.driver=file,"
>>> +                         "node-name=hd0,read-only=on,"
>>> +                         f"file.filename={image_path}")
>>> +        self.vm.add_args("-snapshot")
>>> +
>>> +        try:
>>> +            self.vm.launch()
>>> +        except VMLaunchFailure as excp:
>>> +            if "old virglrenderer, blob resources unsupported" in 
>>> excp.output:
>>> +                self.skipTest("No blob support for virtio-gpu")
>>> +            elif "old virglrenderer, venus unsupported" in excp.output:
>>> +                self.skipTest("No venus support for virtio-gpu")
>>
>> This seems dependent on the order of the CLI arguments, as I got:
>>
>> qemu-system-aarch64: -device virtio-gpu-gl- 
>> pci,hostmem=4G,blob=on,venus=on: 'virtio-gpu-gl-pci' is not a valid 
>> device model name
>>
>> I understand it is too complex to check this device availability with
>> meson, in order to avoid running the test.
>>
>> Can we use device introspection instead, like we do in QTest with
>> qtest_qom_has_concrete_type() for accelerators? Maybe in the lines of:
>>
>>    @skipIfMissingQOMType('virtio-gpu-gl-pci')
> 
> We already have "self.require_device('...')" that can be used to check 
> for the availability of devices and skip the test if it is not built 
> in ... would that be suitable here?

Yes, perfect, thanks!

> 
>   Thomas
> 
