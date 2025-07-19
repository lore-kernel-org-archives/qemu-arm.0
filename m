Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C304CC83F27
	for <qemu-arm@archiver.kernel.org>; Sat, 19 Jul 2025 15:38:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ud9dh-0006Km-EO; Sat, 19 Jul 2025 11:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ud9dX-0006Er-OL
 for qemu-arm@nongnu.org; Sat, 19 Jul 2025 11:38:08 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1ud9dV-0000PE-Gf
 for qemu-arm@nongnu.org; Sat, 19 Jul 2025 11:38:07 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-74ce477af25so2003930b3a.3
 for <qemu-arm@nongnu.org>; Sat, 19 Jul 2025 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752939483; x=1753544283; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MVKY2zow/8iNoLGqjs1oMzSrnMpP4vILiLA7Qf202zY=;
 b=OWiGnsNjAw5+urVpFcYtiDumz92odTGSwGQgfSQErMoa1ULHOs1Wv3HE3uOV+R8R4A
 oi5WhoXrbvFTY2q4uti9RfmhI7/cKl65LfWP3JrmPN9CTXha6q+wcWlc/39DGxevWiBV
 PxxjO+eCWx3ih+fjUyeqZRQmSjwSKytz4IJJ+Z3gfbH/NenAty3BaT3ThzSPKIEGHKvR
 wOvwvhifZZoAogzWOAKbTtjuUmz71nFOqp34/8P5vJYGH0/fzfxMZg/N+u9kp8Q4aWcu
 BrTiD/hx3PiW+jmGMYZ3vZDgi23y9YW7srqdi4ujp6aw8dgOMxpQhHuVdilL7dkIvRl2
 lZOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752939483; x=1753544283;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MVKY2zow/8iNoLGqjs1oMzSrnMpP4vILiLA7Qf202zY=;
 b=ZMI9grQcmhlNWk6Md5GzhWQF/KZ6HxNb/Ut2icIY/lQK13pokoZjPp0zI8sHeqFKzJ
 DYBcsAcaktYe0yMGFlcbvxSkZ5aiHBzg8mgaVMaygqcYvqsILskJRycCfNoj4xvvjUox
 A/y/NNnFi7nU2HRmopRah1S2GgPSM3r7qgnXUJDseZBbSJzav7LGK5uvo18OWTbiEEnm
 t20sF0FrEJAAm/wj1aESxPXxQNzCNbSJ8WjE7Paa2pVEHcq7SrPD5lFwkiYQ9PGo0V7j
 rHqmYBy2sk3ajgw3yujBk7eZtUY1IfvHEal78+wjNW7pRysMwNNG99aDrq3yI4S4qzRt
 V+Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeAmvNvi3esIC2eyBidYBunP5VFZiEo3juTRBgQq9wlk0HwCoFuw9rTJkVCfF3yyYTAAcdShTP6Q==@nongnu.org
X-Gm-Message-State: AOJu0YzwpPBWPjzk+xHMU0kQbx/T8U01krqLkReSOMWunIFUA86xyjYg
 yEhARsQ44HDa2TqXIWA2b7w6VdQGVVSeHAS0pkC/wOTPHb5Ce0+D30HEQIFVUkt+tE4=
X-Gm-Gg: ASbGncs6IIj4NfuAGqPjvui3onLjV2008t26CmnZpLPC+T2v/Z2duy4GVEw4uhaJjT3
 hDTMCXmyyR41S7L4sQ8XlX+h0BDEw2yFABvTcESmOXRcSvJZ4qj1u1uP1rL48zQeEo2XkNmKi8s
 feB1p9B2YNFEoIA7cXeKiJOwxvjZiHcbGG7GErG7D87f7jL5ZE0zJA7CaoTA3uEAuv5XqA0tAbZ
 cEhYth96uBgdjV1Lx8Z+BUo/CXNlKRN3YZHOP7c+/VZnUocQDiT+n4RlG2uby2RYYdOJJT/To58
 kbqKQ7FvUVSVe27biEKc5WZIvhkd2Wn7xXOUS2SVBFMXiz+IRl8h/x2yiHZbmR/elrCGBCWekqn
 Ex1e1ptFZQ6lArS9N/8QDb7UBsAVtM5Hc8EI=
X-Google-Smtp-Source: AGHT+IFPmX4dNaNNWJMOfMoXIXcm3EW8wEoqr2tWptDiQYa9ml8/ccFWj/pXJwNdP7rXLIJ7bN6Pdw==
X-Received: by 2002:a05:6a00:3920:b0:748:68dd:ecc8 with SMTP id
 d2e1a72fcca58-75724687164mr17462886b3a.22.1752939483422; 
 Sat, 19 Jul 2025 08:38:03 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb76d4e4sm3036581b3a.106.2025.07.19.08.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jul 2025 08:38:02 -0700 (PDT)
Message-ID: <7afa0c8d-71a1-4c97-aedf-1ed401f95fad@linaro.org>
Date: Sat, 19 Jul 2025 08:38:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] tests/functional/test_aarch64_rme: update image
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 richard.henderson@linaro.org, Leif Lindholm
 <leif.lindholm@oss.qualcomm.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, gustavo.romero@linaro.org,
 qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>
References: <20250719035838.2284029-1-pierrick.bouvier@linaro.org>
 <20250719035838.2284029-3-pierrick.bouvier@linaro.org>
 <CAAjaMXYRar1FnWSXqxRb1cKabWOXu2YxFi5B_JhypS0OZZ2LSg@mail.gmail.com>
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <CAAjaMXYRar1FnWSXqxRb1cKabWOXu2YxFi5B_JhypS0OZZ2LSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x42a.google.com
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

On 7/19/25 3:57 AM, Manos Pitsidianakis wrote:
> On Sat, Jul 19, 2025 at 7:00 AM Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
>>
>> TF-A needs to be patched to enable support for FEAT_TCR2 and
>> FEAT_SCTLR2. This new image contains updated firmware.
>>
>> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> ---
>>   tests/functional/test_aarch64_rme_sbsaref.py | 64 ++++++++-------
>>   tests/functional/test_aarch64_rme_virt.py    | 85 +++++++-------------
>>   2 files changed, 66 insertions(+), 83 deletions(-)
>>
>> diff --git a/tests/functional/test_aarch64_rme_sbsaref.py b/tests/functional/test_aarch64_rme_sbsaref.py
>> index 746770e776d..cd6390b548a 100755
>> --- a/tests/functional/test_aarch64_rme_sbsaref.py
>> +++ b/tests/functional/test_aarch64_rme_sbsaref.py
>> @@ -10,21 +10,23 @@
>>   # SPDX-License-Identifier: GPL-2.0-or-later
>>
>>   import os
>> +from os.path import join
>> +import shutil
>>
>>   from qemu_test import QemuSystemTest, Asset, wait_for_console_pattern
>>   from qemu_test import exec_command_and_wait_for_pattern
>> -from test_aarch64_rme_virt import test_realms_guest
>>
>>
>>   class Aarch64RMESbsaRefMachine(QemuSystemTest):
>>
>> -    # Stack is built with OP-TEE build environment from those instructions:
>> +    # Stack is inspired from:
>>       # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
>> -    # https://github.com/pbo-linaro/qemu-rme-stack
>> +    # https://github.com/pbo-linaro/qemu-linux-stack/tree/rme_sbsa_release
>> +    # ./build.sh && ./archive_artifacts.sh out.tar.xz
>>       ASSET_RME_STACK_SBSA = Asset(
>> -        ('https://fileserver.linaro.org/s/KJyeBxL82mz2r7F/'
>> -         'download/rme-stack-op-tee-4.2.0-cca-v4-sbsa.tar.gz'),
>> -         'dd9ab28ec869bdf3b5376116cb3689103b43433fd5c4bca0f4a8d8b3c104999e')
>> +        ('https://github.com/pbo-linaro/qemu-linux-stack/'
>> +         'releases/download/build/rme_sbsa_release-a7f02cf.tar.xz'),
>> +         '27d8400b11befb828d6db0cab97e7ae102d0992c928d3dfbf38b24b6cf6c324c')
> 
> Hi Pierrick, I got:
> 
>> qemu_test.asset.AssetError: https://github.com/pbo-linaro/qemu-linux-stack/releases/download/build/rme_sbsa_release-a7f02cf.tar.xz: Download retries exceeded
>
> Maybe fileserver.linaro.org is a better option?
>

In years of using GitHub releases to download various sources/artifacts, 
I found that it is very reliable (as much as cloning code from GitHub), 
so I would favor this over any custom solution.
Were you able to download it manually when you had a failure?
Assets download in test infra can be very picky, especially if you 
Ctrl-C when it was downloading.

>>       # This tests the FEAT_RME cpu implementation, by booting a VM supporting it,
>>       # and launching a nested VM using it.
>> @@ -35,35 +37,41 @@ def test_aarch64_rme_sbsaref(self):
>>
>>           self.vm.set_console()
>>
>> -        stack_path_tar_gz = self.ASSET_RME_STACK_SBSA.fetch()
>> -        self.archive_extract(stack_path_tar_gz, format="tar")
>> +        stack_path_tar = self.ASSET_RME_STACK_SBSA.fetch()
>> +        self.archive_extract(stack_path_tar, format="tar")
>>
>> -        rme_stack = self.scratch_file('rme-stack-op-tee-4.2.0-cca-v4-sbsa')
>> -        pflash0 = os.path.join(rme_stack, 'images', 'SBSA_FLASH0.fd')
>> -        pflash1 = os.path.join(rme_stack, 'images', 'SBSA_FLASH1.fd')
>> -        virtual = os.path.join(rme_stack, 'images', 'disks', 'virtual')
>> -        drive = os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ext4')
>> +        rme_stack = self.scratch_file('.')
>> +        pflash0 = join(rme_stack, 'out', 'SBSA_FLASH0.fd')
>> +        pflash1 = join(rme_stack, 'out', 'SBSA_FLASH1.fd')
>> +        rootfs = join(rme_stack, 'out', 'host.ext4')
>>
>> -        self.vm.add_args('-cpu', 'max,x-rme=on,pauth-impdef=on')
>> +        efi = join(rme_stack, 'out', 'EFI')
>> +        os.mkdir(efi)
>> +        shutil.copyfile(join(rme_stack, 'out', 'Image'), join(efi, 'Image'))
>> +        with open(join(efi, 'startup.nsh'), 'w') as startup:
>> +            startup.write('fs0:Image nokaslr root=/dev/vda rw init=/init --'
>> +                          ' /host/out/lkvm run --realm'
>> +                          ' -m 256m'
>> +                          ' --restricted_mem'
>> +                          ' --kernel /host/out/Image'
>> +                          ' --disk /host/out/guest.ext4'
>> +                          ' --params "root=/dev/vda rw init=/init"')
>> +
>> +        self.vm.add_args('-cpu', 'max,x-rme=on')
>> +        self.vm.add_args('-smp', '2')
>>           self.vm.add_args('-m', '2G')
>>           self.vm.add_args('-M', 'sbsa-ref')
>>           self.vm.add_args('-drive', f'file={pflash0},format=raw,if=pflash')
>>           self.vm.add_args('-drive', f'file={pflash1},format=raw,if=pflash')
>> -        self.vm.add_args('-drive', f'file=fat:rw:{virtual},format=raw')
>> -        self.vm.add_args('-drive', f'format=raw,if=none,file={drive},id=hd0')
>> -        self.vm.add_args('-device', 'virtio-blk-pci,drive=hd0')
>> -        self.vm.add_args('-device', 'virtio-9p-pci,fsdev=shr0,mount_tag=shr0')
>> -        self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
>> -        self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
>> -        self.vm.add_args('-netdev', 'user,id=net0')
>> -
>> +        self.vm.add_args('-drive', f'file=fat:rw:{efi},format=raw')
>> +        self.vm.add_args('-drive', f'format=raw,file={rootfs},if=virtio')
>> +        self.vm.add_args('-virtfs',
>> +                         f'local,path={rme_stack}/,mount_tag=host,'
>> +                         'security_model=mapped,readonly=off')
>>           self.vm.launch()
>> -        # Wait for host VM boot to complete.
>> -        wait_for_console_pattern(self, 'Welcome to Buildroot',
>> -                                 failure_message='Synchronous Exception at')
>> -        exec_command_and_wait_for_pattern(self, 'root', '#')
>> -
>> -        test_realms_guest(self)
>> +        # Wait for host and guest VM boot to complete.
>> +        wait_for_console_pattern(self, 'root@guest',
>> +                                 failure_message='Kernel panic')
>>
>>   if __name__ == '__main__':
>>       QemuSystemTest.main()
>> diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/test_aarch64_rme_virt.py
>> index 8452d27928f..bb603aaa26c 100755
>> --- a/tests/functional/test_aarch64_rme_virt.py
>> +++ b/tests/functional/test_aarch64_rme_virt.py
>> @@ -9,50 +9,22 @@
>>   #
>>   # SPDX-License-Identifier: GPL-2.0-or-later
>>
>> -import os
>> +from os.path import join
>>
>>   from qemu_test import QemuSystemTest, Asset
>>   from qemu_test import exec_command, wait_for_console_pattern
>>   from qemu_test import exec_command_and_wait_for_pattern
>>
>> -def test_realms_guest(test_rme_instance):
>> -
>> -    # Boot the (nested) guest VM
>> -    exec_command(test_rme_instance,
>> -                 'qemu-system-aarch64 -M virt,gic-version=3 '
>> -                 '-cpu host -enable-kvm -m 512M '
>> -                 '-M confidential-guest-support=rme0 '
>> -                 '-object rme-guest,id=rme0 '
>> -                 '-device virtio-net-pci,netdev=net0,romfile= '
>> -                 '-netdev user,id=net0 '
>> -                 '-kernel /mnt/out/bin/Image '
>> -                 '-initrd /mnt/out-br/images/rootfs.cpio '
>> -                 '-serial stdio')
>> -    # Detect Realm activation during (nested) guest boot.
>> -    wait_for_console_pattern(test_rme_instance,
>> -                             'SMC_RMI_REALM_ACTIVATE')
>> -    # Wait for (nested) guest boot to complete.
>> -    wait_for_console_pattern(test_rme_instance,
>> -                             'Welcome to Buildroot')
>> -    exec_command_and_wait_for_pattern(test_rme_instance, 'root', '#')
>> -    # query (nested) guest cca report
>> -    exec_command(test_rme_instance, 'cca-workload-attestation report')
>> -    wait_for_console_pattern(test_rme_instance,
>> -                             '"cca-platform-hash-algo-id": "sha-256"')
>> -    wait_for_console_pattern(test_rme_instance,
>> -                             '"cca-realm-hash-algo-id": "sha-512"')
>> -    wait_for_console_pattern(test_rme_instance,
>> -                             '"cca-realm-public-key-hash-algo-id": "sha-256"')
>> -
>>   class Aarch64RMEVirtMachine(QemuSystemTest):
>>
>> -    # Stack is built with OP-TEE build environment from those instructions:
>> +    # Stack is inspired from:
>>       # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
>> -    # https://github.com/pbo-linaro/qemu-rme-stack
>> +    # https://github.com/pbo-linaro/qemu-linux-stack/tree/rme_release
>> +    # ./build.sh && ./archive_artifacts.sh out.tar.xz
>>       ASSET_RME_STACK_VIRT = Asset(
>> -        ('https://fileserver.linaro.org/s/iaRsNDJp2CXHMSJ/'
>> -         'download/rme-stack-op-tee-4.2.0-cca-v4-qemu_v8.tar.gz'),
>> -         '1851adc232b094384d8b879b9a2cfff07ef3d6205032b85e9b3a4a9ae6b0b7ad')
>> +        ('https://github.com/pbo-linaro/qemu-linux-stack/'
>> +         'releases/download/build/rme_release-86101e5.tar.xz'),
>> +         'e42fef8439badb52a071ac446fc33cff4cb7d61314c7a28fdbe61a11e1faad3a')
>>
>>       # This tests the FEAT_RME cpu implementation, by booting a VM supporting it,
>>       # and launching a nested VM using it.
>> @@ -63,15 +35,16 @@ def test_aarch64_rme_virt(self):
>>
>>           self.vm.set_console()
>>
>> -        stack_path_tar_gz = self.ASSET_RME_STACK_VIRT.fetch()
>> -        self.archive_extract(stack_path_tar_gz, format="tar")
>> +        stack_path_tar = self.ASSET_RME_STACK_VIRT.fetch()
>> +        self.archive_extract(stack_path_tar, format="tar")
>>
>> -        rme_stack = self.scratch_file('rme-stack-op-tee-4.2.0-cca-v4-qemu_v8')
>> -        kernel = os.path.join(rme_stack, 'out', 'bin', 'Image')
>> -        bios = os.path.join(rme_stack, 'out', 'bin', 'flash.bin')
>> -        drive = os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ext4')
>> +        rme_stack = self.scratch_file('.')
>> +        kernel = join(rme_stack, 'out', 'Image')
>> +        bios = join(rme_stack, 'out', 'flash.bin')
>> +        rootfs = join(rme_stack, 'out', 'host.ext4')
>>
>> -        self.vm.add_args('-cpu', 'max,x-rme=on,pauth-impdef=on')
>> +        self.vm.add_args('-cpu', 'max,x-rme=on')
>> +        self.vm.add_args('-smp', '2')
>>           self.vm.add_args('-m', '2G')
>>           self.vm.add_args('-M', 'virt,acpi=off,'
>>                            'virtualization=on,'
>> @@ -79,23 +52,25 @@ def test_aarch64_rme_virt(self):
>>                            'gic-version=3')
>>           self.vm.add_args('-bios', bios)
>>           self.vm.add_args('-kernel', kernel)
>> -        self.vm.add_args('-drive', f'format=raw,if=none,file={drive},id=hd0')
>> -        self.vm.add_args('-device', 'virtio-blk-pci,drive=hd0')
>> -        self.vm.add_args('-device', 'virtio-9p-device,fsdev=shr0,mount_tag=shr0')
>> -        self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
>> -        self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
>> -        self.vm.add_args('-netdev', 'user,id=net0')
>> +        self.vm.add_args('-drive', f'format=raw,file={rootfs},if=virtio')
>> +        self.vm.add_args('-virtfs',
>> +                         f'local,path={rme_stack}/,mount_tag=host,'
>> +                         'security_model=mapped,readonly=off')
>>           # We need to add nokaslr to avoid triggering this sporadic bug:
>>           # https://gitlab.com/qemu-project/qemu/-/issues/2823
>> -        self.vm.add_args('-append', 'root=/dev/vda nokaslr')
>> +        self.vm.add_args('-append',
>> +                         'nokaslr root=/dev/vda rw init=/init --'
>> +                         ' /host/out/lkvm run --realm'
>> +                         ' -m 256m'
>> +                         ' --restricted_mem'
>> +                         ' --kernel /host/out/Image'
>> +                         ' --disk /host/out/guest.ext4'
>> +                         ' --params "root=/dev/vda rw init=/init"')
>>
>>           self.vm.launch()
>> -        # Wait for host VM boot to complete.
>> -        wait_for_console_pattern(self, 'Welcome to Buildroot',
>> -                                 failure_message='Synchronous Exception at')
>> -        exec_command_and_wait_for_pattern(self, 'root', '#')
>> -
>> -        test_realms_guest(self)
>> +        # Wait for host and guest VM boot to complete.
>> +        wait_for_console_pattern(self, 'root@guest',
>> +                                 failure_message='Kernel panic')
>>
>>   if __name__ == '__main__':
>>       QemuSystemTest.main()
>> --
>> 2.47.2
>>
>>


