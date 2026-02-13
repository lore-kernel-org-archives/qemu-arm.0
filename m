Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6969DEF99C9
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 18:49:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqyEI-0007wn-Qk; Fri, 13 Feb 2026 13:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vqyEH-0007wR-Ad
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 13:49:25 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vqyEF-000560-7X
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 13:49:24 -0500
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2aaecf9c325so8467125ad.1
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 10:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771008561; x=1771613361; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4V2L+NFfjmumyc6ecUmUnxPMVOEdVL3VMd56xZAlsDo=;
 b=nhEuxdyDHJSInOa2U8IBFN/dqwIVkzn7TarsNe5SqSBvceg4hDVBxDhX2w6JV4a550
 yZ2Q5XG6yBCxhu8y6fdu/2I0L/AQHqOl996Rye4y7gnDscXeaIHrZ/v9stXynNFxvAiY
 i0JSl/PVCVGh4H01Kczgh44odCxcmSNj9W3AK6WE80+OGj1xDX3iuwR9639joyagFDzQ
 1LibPOX00SbkvYBlOMPxT093Dru2rXBUEN8PXfakaqLD/xRg9SkZT6JgwUyWjN4KCCyJ
 p+dENBx2swfwkAinLzb/dtKnVx+vSyLTTbpLYXh83bbYwBBpKZA4gTbqbVVM37bRo31M
 krYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771008561; x=1771613361;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4V2L+NFfjmumyc6ecUmUnxPMVOEdVL3VMd56xZAlsDo=;
 b=GxiPbBZ7wh6l+p+mSWdAV6tAQqBfHorNcu+FAczqC8rvbubrspMoBLNyx48LaNY4Kq
 MLN+OiEAs9pf3eg+RR0IBLiKOkz+3bhH+n8N1Gb7Kqwlk/Sg/qlmK0LRXUvOEFpTWRku
 51doXl2z0R41RI8d8gg1SiXWO9xraixf/ZixkNDv3mcMT9nkWMB6hpxYPSxvNOym3jjB
 vIBiDZR7TzZtCnK2RFmn3S2yVgRk3GdF7akdCUT3j0LNA1iWyYRerapoUnlC44TssXUx
 3ahNdBqPITEGc8NRd4zfs2jwDMmIWBmP1CSo52xxynmIBK1S/pJOhW4EYe9NSC1/xxZ4
 6Bdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9DIFlg5T+1JM0frYwXOFMcSfLo0iphqrI+vGo3z9JlKxEJHpJrQ2j1ywsb0kIPahPgxinwue/tg==@nongnu.org
X-Gm-Message-State: AOJu0YwlqG6rlWHyI7mSrnhZbq/J6XzFxRTNvW6UT1VG3bSAP/S0jJKD
 CXJ1kLySMhQO0VTRfxeZo8ZSM51VdIOk43xshaT6tgKkXkmq+C1j6Yb7feKLfqh1618=
X-Gm-Gg: AZuq6aJbzBQ0Mww/qPMYfb21+4CuxKG2ymRiLuIbVIofvY8/N8ArjR2Ak96WyZOa6SQ
 0uVQlAMXL8POBBdmA81dnC/b2MnV7leaoXluS6rnKSOKtQ8l+c2mOZeRjFWhyk1GxkYbxEiZ6OE
 DN2/OTTURHBQW2M67A0ydb7QjJofl+ibP/GnDggmyWBqJ5V8jgzLmt0cf9UM/FF3FSih5xhCzgr
 tyjlJxGBXBdrzcfjRz7dZuUPZbxtJLJazx7BgYDDhC2A1NJbKzqXMta2qFbYlFPnJQZ9tT2n+P/
 HrwELksFw73CQ/h2Z+CBU9cR8V01pgMtxnEAF3Kc65Dg4xy6KYA/3649HrxXJJihJpW+P2VmJOP
 XDmTT1o0EzeCBGe2HdyyIewJrOMpyR1MmNDJ7gJZqFvlbbjvM+xXrDs0na+eDmDsTFd1Sol0Cel
 56SMIE03PGHyVhPyiaRRUeYTp9TDnxfVS0JLbf8sNjUk0HfHrlKcqFuu8T43N4ksvhFWYJ
X-Received: by 2002:a17:903:230f:b0:2a0:9a3b:d2a4 with SMTP id
 d9443c01a7336-2ac9744558cmr10734395ad.10.1771008561419; 
 Fri, 13 Feb 2026 10:49:21 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ab29998b48sm93643245ad.86.2026.02.13.10.49.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Feb 2026 10:49:21 -0800 (PST)
Message-ID: <82942191-d0a6-4393-846d-b04e3cb009ce@linaro.org>
Date: Fri, 13 Feb 2026 10:49:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] tests/functional: add Arm VBSA uefi conformance test
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20260213154859.1551283-1-alex.bennee@linaro.org>
 <20260213154859.1551283-7-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260213154859.1551283-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/13/26 7:48 AM, Alex Bennée wrote:
> The VBSA test is a subset of the wider Arm architecture compliance
> suites (ACS) which validate machines meet particular minimum set of
> requirements. The VBSA is for virtual machines so it makes sense we
> should check the -M virt machine is compliant.
> 
> Fortunately there are prebuilt binaries published via github so all we
> need to do is build an EFI partition and place things in the right
> place.
> 
> There are some additional Linux based tests which are left for later.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/aarch64/meson.build       |  1 +
>   tests/functional/aarch64/test_virt_vbsa.py | 99 ++++++++++++++++++++++
>   2 files changed, 100 insertions(+)
>   create mode 100755 tests/functional/aarch64/test_virt_vbsa.py
> 
> diff --git a/tests/functional/aarch64/meson.build b/tests/functional/aarch64/meson.build
> index 49eca120589..7ea8c22b048 100644
> --- a/tests/functional/aarch64/meson.build
> +++ b/tests/functional/aarch64/meson.build
> @@ -46,6 +46,7 @@ tests_aarch64_system_thorough = [
>     'tuxrun',
>     'virt',
>     'virt_gpu',
> +  'virt_vbsa',
>     'xen',
>     'xlnx_versal',
>   ]
> diff --git a/tests/functional/aarch64/test_virt_vbsa.py b/tests/functional/aarch64/test_virt_vbsa.py
> new file mode 100755
> index 00000000000..53cabf9d6c5
> --- /dev/null
> +++ b/tests/functional/aarch64/test_virt_vbsa.py
> @@ -0,0 +1,99 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that runs the Arm VBSA conformance tests.
> +#
> +# Copyright (c) 2026 Linaro Ltd.
> +#
> +# Author:
> +#  Alex Bennée <alex.bennee@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import shutil
> +from subprocess import check_call, DEVNULL
> +
> +from qemu_test import QemuSystemTest, Asset
> +from qemu_test import wait_for_console_pattern, get_qemu_img, skipIfMissingCommands
> +from qemu_test import exec_command_and_wait_for_pattern as ec_and_wait
> +
> +
> +@skipIfMissingCommands("mformat", "mcopy", "mmd")
> +class Aarch64VirtMachine(QemuSystemTest):
> +    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> +    timeout = 360
> +
> +    def wait_for_console_pattern(self, success_message, vm=None):
> +        wait_for_console_pattern(self, success_message,
> +                                 failure_message='Kernel panic - not syncing',
> +                                 vm=vm)
> +

May be worth adding a comment with README url:
https://github.com/ARM-software/sysarch-acs/blob/main/docs/vbsa/README.md

> +    ASSET_VBSA_EFI = Asset('https://github.com/ARM-software/sysarch-acs/raw/refs/heads/main'
> +                           '/prebuilt_images/VBSA/v25.12_VBSA_0.7.0/Vbsa.efi',
> +                           '80f37d2fb86d152d95dec4d05ff099c9e47ee8a89314268e08056b0e1359e1fa')
> +
> +    ASSET_BSA_SHELL = Asset('https://github.com/ARM-software/bsa-acs/raw/refs/heads/main/'
> +                            'prebuilt_images/BSA_DT/v20.05_05_ALPHA/Shell.efi',
> +                            '763e7b293fa9d1582153ea8fd0cf60e2a7a87d092d35d342cf9b3b697f47b588')
> +
> +    def test_aarch64_vbsa_uefi_tests(self):
> +        """
> +        Launch the UEFI based VBSA test from an EFI file-system
> +        """
> +
> +        self.vm.set_console()
> +
> +        # virt machine wi
> +        self.set_machine('virt')
> +        self.vm.add_args('-M', 'virt,gic-version=max,virtualization=on')
> +        self.vm.add_args('-cpu', 'max','-m', '1024')
> +
> +        # We will use the QEMU firmware blobs to boot
> +        code_path = self.build_file('pc-bios', 'edk2-aarch64-code.fd')
> +        vars_source = self.build_file('pc-bios', 'edk2-arm-vars.fd')
> +        vars_path = self.scratch_file('vars.fd')
> +        shutil.copy(vars_source, vars_path)
> +
> +        self.vm.add_args('-drive', f'if=pflash,format=raw,readonly=on,file={code_path}')
> +        self.vm.add_args('-drive', f'if=pflash,format=raw,file={vars_path}')
> +
> +        # Build an EFI FAT32 file-system for the UEFI tests
> +        vbsa_efi = self.ASSET_VBSA_EFI.fetch()
> +        bsa_shell = self.ASSET_BSA_SHELL.fetch()
> +
> +        img_path = self.scratch_file('vbsa.img')
> +        qemu_img = get_qemu_img(self)
> +        check_call([qemu_img, 'create', '-f', 'raw', img_path, '64M'],
> +                   stdout=DEVNULL, stderr=DEVNULL)
> +
> +        check_call(['mformat', '-i', img_path, '-v', 'VBSA', '::'],
> +                   stdout=DEVNULL, stderr=DEVNULL)
> +
> +        check_call(['mmd', '-i', img_path, '::/EFI'],
> +                   stdout=DEVNULL, stderr=DEVNULL)
> +
> +        check_call(['mmd', '-i', img_path, '::/EFI/BOOT'],
> +                   stdout=DEVNULL, stderr=DEVNULL)
> +
> +        check_call(['mcopy', '-i', img_path, bsa_shell, '::/EFI/BOOT/BOOTAA64.EFI'],
> +                   stdout=DEVNULL, stderr=DEVNULL)
> +
> +        check_call(['mcopy', '-i', img_path, vbsa_efi, '::/Vbsa.efi'],
> +                   stdout=DEVNULL, stderr=DEVNULL)
> +
> +        self.vm.add_args('-drive', f'file={img_path},format=raw,if=none,id=drive0')
> +        self.vm.add_args('-device', 'virtio-blk-pci,drive=drive0')
> +
> +        self.vm.launch()
> +
> +        # wait for EFI prompt
> +        self.wait_for_console_pattern('Shell>')
> +
> +        # Start the VBSA tests
> +        ec_and_wait(self, "FS0:Vbsa.efi", 'VBSA Architecture Compliance Suite')
> +
> +        # could we parse the summary somehow?
> +
> +        self.wait_for_console_pattern('VBSA tests complete. Reset the system.')
> +

What happens in case there is an error, does the test app hangs, or 
still exit with message under?

If it always exit with this message, whether we have an error or not, 
then the test is not really checking anything.

> +if __name__ == '__main__':
> +    QemuSystemTest.main()


