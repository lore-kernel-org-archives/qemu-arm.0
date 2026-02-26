Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2115FD9E0E
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 20:48:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vviHT-0005vZ-LT; Thu, 26 Feb 2026 15:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vviHQ-0005v9-KK
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 15:48:16 -0500
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vviHN-0006Yc-PH
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 15:48:16 -0500
Received: by mail-ed1-x544.google.com with SMTP id
 4fb4d7f45d1cf-65a43a512b0so1644679a12.3
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 12:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772138891; x=1772743691; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BEWjzhvat8nSZIDcRKJW7qRUgCogqJ1KdBtP4aG5OvI=;
 b=fnkiraKPUCD3pA1F8MS1NNMeEDGC0zuDMibctvLMarzhJ/ZGBpO90ptp+zlMMHhzUK
 NBQnsNaCszRgGK91VIG3STLAhZK1XaLPAI3I/GvI2RAjQGkJVeoWR5nlqgb51c7p34+y
 Nns0mXN74OUEX5CU9KrjlS7U/NZiOvnYC4cavYtMHMC5AOBf4+xrK+nf/OFqKgsgHl8d
 UoYyFHqhwth7p7Zv7uZvcxEP5EP1nLpGCA3IWlDF0usmgzZ+J17rQNuJGReBEG2fFXzd
 Cvuf7ansO7oFwMi8rY+DTl6mFIxL/WHDbk4VOoiTGoy+mT7vKwA9iSe1OiCD+2u2zLXt
 QNtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138891; x=1772743691;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BEWjzhvat8nSZIDcRKJW7qRUgCogqJ1KdBtP4aG5OvI=;
 b=Ix9cqG3fXX8S+VEmpA92KBAHxLgTcMih4PFYzSSco2aL4wrmUMRyggJQPI91BTlZDj
 mSCu2gimh4Slb4Gc2XPyrUX9NsRmAbxrMtHMip/ctrazgOBcLq1fDrDXGKzK1J+m83we
 ohnQ5ZHmOA7372nHo1sPmJElGlutt35Ta032eydEiN+/WkD26WsobEjt/PHrgmhn4nUS
 NWF20sSa6Y3j40H66GhRuwAvoT7SCJW1kfQkj3faySoC+EwKGaH0LpDo7A2zAj6b9m0d
 1SFFPvYEBgaxyniYXaaAjAlb3V+YEdtHsMNEBe88EXNOU0oiDdF9to98jgauBfE5E4Tc
 mFzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUuRqo83gkidD8Y4OtKm6HFhykgI1ieGqHLRpS1bv2Icgw45ZzIRIQ5Bwplkc5lB3Dwa2IatS2hag==@nongnu.org
X-Gm-Message-State: AOJu0Yxugi81qaoXexckLyXvPETsLCekywlPy43thksyOuXNh7/zJJP8
 x3QN4b6uAOQtsR7szB0PvxDnAQXr9AgPBUdoG0xHO2Upm1VfM53umLmCxy6UJXj8dj0=
X-Gm-Gg: ATEYQzwAIvauvcmKjKeW8xYJSJuTEmc6t3qHJnp8nLGkSzdHqvq/uER8mYyg+tvkV/X
 oXQ6qtPHteyqqyd8VXIdgzLCf8aVRwlR3LkZrdkVZX4ebfr7pzi5hiE0fvfpi+f/hs1F57tH7MZ
 uqhCvMY6VLK4K9+nj1wwzpm9tI2RotRBXuMZld83oHZmXS8r/47oZmyiVpolYg24XpwiNcoPJYi
 GGa9/ujDkI/owZCeMFpdwyARHXkX9bzfer46Xi5ir9D+yo4RUTjAzUsrO44MztFKFwsRHy4EX/a
 /pi2NjnJ3O2XJoXvIepdY7OFQ/XgBVUeSsOYvcDBnYivFTA91WGeGJ8sy+sjfreGXrjAQp/Wte2
 xEbbOmjvF3wIXxrUol/MMSn0sdjqyE0tZ2qRBA/qfgu9j3KJWAkY05XBVNrIPsetUEpLmKwMAUa
 Q5PUuGkYzaqk9eCbQ+xWFR5zf17LX2rDNKlg==
X-Received: by 2002:a05:6402:42c4:b0:65c:2170:67d2 with SMTP id
 4fb4d7f45d1cf-65fddcebdcamr459059a12.16.1772138891476; 
 Thu, 26 Feb 2026 12:48:11 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-65fabf6cfd9sm849354a12.22.2026.02.26.12.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:48:10 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 06BD35F802;
 Thu, 26 Feb 2026 20:48:10 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-arm@nongnu.org,  Thomas Huth
 <thuth@redhat.com>,  Kyle Evans <kevans@freebsd.org>,  Brad Smith
 <brad@comstyle.com>,  Warner Losh <imp@bsdimp.com>
Subject: Re: [PATCH v2 7/7] tests/functional: add Arm VBSA uefi conformance
 test
In-Reply-To: <a42315f0-e84b-46b3-9fac-299f9894de16@linaro.org> (Pierrick
 Bouvier's message of "Thu, 26 Feb 2026 11:26:17 -0800")
References: <20260226185303.1920021-1-alex.bennee@linaro.org>
 <20260226185303.1920021-8-alex.bennee@linaro.org>
 <a42315f0-e84b-46b3-9fac-299f9894de16@linaro.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 26 Feb 2026 20:48:09 +0000
Message-ID: <87y0kfxmd2.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::544;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x544.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> On 2/26/26 10:53 AM, Alex Benn=C3=A9e wrote:
>> The VBSA test is a subset of the wider Arm architecture compliance
>> suites (ACS) which validate machines meet particular minimum set of
>> requirements. The VBSA is for virtual machines so it makes sense we
>> should check the -M virt machine is compliant.
>> Fortunately there are prebuilt binaries published via github so all
>> we
>> need to do is build an EFI partition and place things in the right
>> place.
>> There are some additional Linux based tests which are left for
>> later.
>> Message-ID: <20260213154859.1551283-7-alex.bennee@linaro.org>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>> v2
>>    - use the VBSA prebuilt shell
>>    - fail the test if we see FAILED in the console stream
>> ---
>>   tests/functional/aarch64/meson.build       |  1 +
>>   tests/functional/aarch64/test_virt_vbsa.py | 99 ++++++++++++++++++++++
>>   2 files changed, 100 insertions(+)
>>   create mode 100755 tests/functional/aarch64/test_virt_vbsa.py
>> diff --git a/tests/functional/aarch64/meson.build
>> b/tests/functional/aarch64/meson.build
>> index 49eca120589..7ea8c22b048 100644
>> --- a/tests/functional/aarch64/meson.build
>> +++ b/tests/functional/aarch64/meson.build
>> @@ -46,6 +46,7 @@ tests_aarch64_system_thorough =3D [
>>     'tuxrun',
>>     'virt',
>>     'virt_gpu',
>> +  'virt_vbsa',
>>     'xen',
>>     'xlnx_versal',
>>   ]
>> diff --git a/tests/functional/aarch64/test_virt_vbsa.py b/tests/function=
al/aarch64/test_virt_vbsa.py
>> new file mode 100755
>> index 00000000000..3da06904ea9
>> --- /dev/null
>> +++ b/tests/functional/aarch64/test_virt_vbsa.py
>> @@ -0,0 +1,99 @@
>> +#!/usr/bin/env python3
>> +#
>> +# Functional test that runs the Arm VBSA conformance tests.
>> +#
>> +# Copyright (c) 2026 Linaro Ltd.
>> +#
>> +# Author:
>> +#  Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +import shutil
>> +from subprocess import check_call, DEVNULL
>> +
>> +from qemu_test import QemuSystemTest, Asset
>> +from qemu_test import wait_for_console_pattern, get_qemu_img, skipIfMis=
singCommands
>> +from qemu_test import exec_command_and_wait_for_pattern as ec_and_wait
>> +
>> +
>> +@skipIfMissingCommands("mformat", "mcopy", "mmd")
>> +class Aarch64VirtMachine(QemuSystemTest):
>> +    KERNEL_COMMON_COMMAND_LINE =3D 'printk.time=3D0 '
>> +    timeout =3D 360
>> +
>> +    def wait_for_console_pattern(self, success_message, vm=3DNone):
>> +        wait_for_console_pattern(self, success_message,
>> +                                 failure_message=3D'FAILED',
>> +                                 vm=3Dvm)
>> +
>> +    ASSET_VBSA_EFI =3D Asset('https://github.com/ARM-software/sysarch-a=
cs/raw/refs/heads/main'
>> +                           '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Vbs=
a.efi',
>> +                           '80f37d2fb86d152d95dec4d05ff099c9e47ee8a8931=
4268e08056b0e1359e1fa')
>> +
>> +    ASSET_BSA_SHELL =3D Asset('https://github.com/ARM-software/sysarch-=
acs/raw/refs/heads/main'
>> +                            '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Sh=
ell.efi',
>> +                            'e526604f0d329b481c6a1f62f7a0db8ea24ce8178b=
2c6abda8e247425f38775c')
>> +
>> +    def test_aarch64_vbsa_uefi_tests(self):
>> +        """
>> +        Launch the UEFI based VBSA test from an EFI file-system
>> +        """
>> +
>> +        self.vm.set_console()
>> +
>> +        # virt machine wi
>> +        self.set_machine('virt')
>> +        self.vm.add_args('-M', 'virt,gic-version=3Dmax,virtualization=
=3Don')
>> +        self.vm.add_args('-cpu', 'max','-m', '1024')
>> +
>> +        # We will use the QEMU firmware blobs to boot
>> +        code_path =3D self.build_file('pc-bios', 'edk2-aarch64-code.fd')
>> +        vars_source =3D self.build_file('pc-bios', 'edk2-arm-vars.fd')
>> +        vars_path =3D self.scratch_file('vars.fd')
>> +        shutil.copy(vars_source, vars_path)
>> +
>> +        self.vm.add_args('-drive', f'if=3Dpflash,format=3Draw,readonly=
=3Don,file=3D{code_path}')
>> +        self.vm.add_args('-drive', f'if=3Dpflash,format=3Draw,file=3D{v=
ars_path}')
>> +
>> +        # Build an EFI FAT32 file-system for the UEFI tests
>> +        vbsa_efi =3D self.ASSET_VBSA_EFI.fetch()
>> +        bsa_shell =3D self.ASSET_BSA_SHELL.fetch()
>> +
>> +        img_path =3D self.scratch_file('vbsa.img')
>> +        qemu_img =3D get_qemu_img(self)
>> +        check_call([qemu_img, 'create', '-f', 'raw', img_path, '64M'],
>> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
>> +
>> +        check_call(['mformat', '-i', img_path, '-v', 'VBSA', '::'],
>> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
>> +
>> +        check_call(['mmd', '-i', img_path, '::/EFI'],
>> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
>> +
>> +        check_call(['mmd', '-i', img_path, '::/EFI/BOOT'],
>> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
>> +
>> +        check_call(['mcopy', '-i', img_path, bsa_shell, '::/EFI/BOOT/BO=
OTAA64.EFI'],
>> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
>> +
>> +        check_call(['mcopy', '-i', img_path, vbsa_efi, '::/Vbsa.efi'],
>> +                   stdout=3DDEVNULL, stderr=3DDEVNULL)
>> +
>> +        self.vm.add_args('-drive', f'file=3D{img_path},format=3Draw,if=
=3Dnone,id=3Ddrive0')
>> +        self.vm.add_args('-device', 'virtio-blk-pci,drive=3Ddrive0')
>> +
>> +        self.vm.launch()
>> +
>> +        # wait for EFI prompt
>> +        self.wait_for_console_pattern('Shell>')
>> +
>> +        # Start the VBSA tests
>> +        ec_and_wait(self, "FS0:Vbsa.efi", 'VBSA Architecture Compliance=
 Suite')
>> +
>> +        # could we parse the summary somehow?
>> +
>> +        self.wait_for_console_pattern('VBSA tests complete. Reset the s=
ystem.')
>> +
>
> Same comment than on v1:
> https://lore.kernel.org/qemu-devel/5befbd0e-5f0f-41c4-99a7-1cf17bfe5454@l=
inaro.org/
>
> In case a failing output would not contain any string easy to
> identify, I'm fine with current patch, but since I didn't receive any
> answer on previous series, I'm not sure if it has been tried.

That's why I added the FAILED catch.

>
> Regards,
> Pierrick

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

