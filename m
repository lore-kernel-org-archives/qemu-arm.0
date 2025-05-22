Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp1639788njc;
        Wed, 21 May 2025 22:43:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d88:b0:216:1476:f6c with SMTP id adf61e73a8af0-216218c530cmr36772614637.13.1747892611836;
        Wed, 21 May 2025 22:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747892611; cv=none;
        d=google.com; s=arc-20240605;
        b=JJTZihx7L2rb40LImJNHkT/4vgc6OyoYFsVgvjnhPIW76/nEyea8bTDw7bwLQwq3v7
         qO/mz0ftieEU6ghS/7QisDvNoq/1O1NHW3aFJm6NuaEDlGcQJi+dM7w5/LOZhma0seqC
         xPmXmVTXXcUbxruyHTCkOP72oY6nkKDygO07yZ0D9a2kHONoMHRnMm6MJnwcnLw2AlCw
         TdB7R08Xb+iarN+X5xvfxTp9nesdaLXI0Ejt/IPEkxiKIJbRqkuznHAl9N0CI7b5/aUc
         ng6wRyILBBT407jAyuWjFuBZULqVc5xiRAVxn+WNojbi7iqx/3stedhYq1+J22E8zNFz
         kAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=o+E0blcDcCohxEl9FUWl2W/U42R6Sqpik4O7lael+Q0=;
        fh=RttHyMfZrs9TmVOCrQPCsP43umc3x0EEvN5NOuPjr6U=;
        b=SXrlbfj+mIicjtvyMyFxOUaNKrlzrgiqbCT9X37lOZpLjDsPJTCtzzOdGjKRXvfCq/
         kmLB+9NR/3Q/4+xA4b+W+XB1LBUM4of/OSutyemGEiR75CaKTrXzkxEMbaBKpsEnTdOU
         AMMjlP+t3/5fFIWylEbc9Z8R3rJBbCJucVs/g1lpX+DojVj3pISjFalY2E4uSc79TFaV
         yoE8Snb35zLUp4bKidDRHy6j+rsK7h5k8+9RURYSsl0W8qCuYYFr9Dxv33gw8g02k/FR
         Q33/PzcMri1hP4SPwJk5QjSvxtFLaSV8WaYfSPcEoPDPVLUyksbpC+NSRul3qynZUz0z
         SUXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NRkg2LRv;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 41be03b00d2f7-b26eb07900csor10623494a12.5.2025.05.21.22.43.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 May 2025 22:43:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=NRkg2LRv;
       spf=pass (google.com: domain of akihiko.odaki@daynix.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=akihiko.odaki@daynix.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1747892611; x=1748497411; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o+E0blcDcCohxEl9FUWl2W/U42R6Sqpik4O7lael+Q0=;
        b=NRkg2LRvlFl+cy8/ZsFyTM9ZV7ACVcYabjwOrEvQTzmYnEDXozKhtXU2oApl2lGWuk
         LT4hEKykeYMWIY5+LAM35dPiHZycU7bGlwUYAsLdomE/rNopSqKZr+NnTfcPGGynh3Zq
         AyxN0a2+thgngslPC9qqunr2Yu3EZviKb1CaRkbCZ/s9qluhQDxovJ7VbL+ln25GJtjM
         gyreo9a381JyVlDqoHVTNVp/F4yqRpKfFqxM3j3UyHaxK0ba5eC0gcwlTCPuisqkpsi+
         8S0fC9ciF+231+39ut5/b4x/cFyIrdy2kZzPJky+q4DjrZxCdDUB1zhzDo2KSuMQKQIe
         NEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747892611; x=1748497411;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o+E0blcDcCohxEl9FUWl2W/U42R6Sqpik4O7lael+Q0=;
        b=Gg+JBV6u3Et6Wvrwka0oBSJogkGCD0lsZRX2tA+uUYFCYjS+war4S5TH/RvyR1j85u
         ubOS6sF2cTAEIz9jT4s+ceuMV1PAtvWUy52+tXxVP1xMKtNIm6iVC3gszz1j8RdMrtCq
         bKpvkW/5Iz5FeNTK7d42Gtfy+7YNemsGSbXaMq+5fU9DeBaHx7/vTjp7r/ZC+S+fRLKA
         ANAl33/oI6eECw72vvXnR2/Xr2apySpJ1YS4Z/m6cHYDDhSoPghnvusyVPR7Z/lwG3Ze
         w3ONGyjpIZNut+8zVi/kqt5p4E8RvQr8E007E6CUucQEE+2En5yRWdckOd4E9YmwTUTi
         Lrgg==
X-Gm-Message-State: AOJu0YzYil9Rb36kOv5gh1XktMQxbOjwGU78D/DaPzmaqxuYHAhBlwg7
	dd68C7bktoQ1Fi2HV5qGWp6jwTATvTnLXiQSmPDnJ/Zxl0UqNoWDUyq8EC5ilfq+tw2HwOMrLnL
	TVgZg
X-Gm-Gg: ASbGnct2mhr7V4iezgEcGFgQbMy2w/GvaK1O3Gow6LNHNPI3sPE97EV2RLFgrwuERht
	WNnWfxY0oxP5gRhJkKnzyjY/Z+G7BzUj4xFLHkqCh8oV1FtdXsBYmKhE2zcYQK5d7YA0/90a48h
	yntX3p7wUa+mRTvD+6PtMOJ4B2biuftma75kJjdbR5/8cSumDIDwl4Q6P+oeMrLtqoxGaK7qKPf
	zEefYGziaHn+lsYs7qCa1j2HUNHKsfT6Iz/LTcEFWfjwxgTNHGutd7L6tfn62YLMq3oUgLYvb80
	y2ZQOuWQ5w3mxNW23YTXQAcIhLna4uWO+n/0opY7Zt4dAA3Thefwohi3jk3c1g==
X-Google-Smtp-Source: AGHT+IEr8cYOE/hW9pwX4j2WRUDi1E4lhkdzCTHSFTfK66y/oG1sByn+NzIfv80XO0HVPHJmIvOEVQ==
X-Received: by 2002:a17:90b:3c45:b0:2ff:592d:23bc with SMTP id 98e67ed59e1d1-30e7d4f2ac6mr37205151a91.4.1747892611008;
        Wed, 21 May 2025 22:43:31 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from [10.100.116.185] ([157.82.128.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36513281sm4675741a91.45.2025.05.21.22.43.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 22:43:30 -0700 (PDT)
Message-ID: <16e8971a-aa1a-41ee-aa0a-2540eef80908@daynix.com>
Date: Thu, 22 May 2025 14:43:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] tests/functional: Add PCI hotplug test for
 aarch64
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
 <20250521164250.135776-7-alex.bennee@linaro.org>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20250521164250.135776-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lBQ1zK1crqoD

On 2025/05/22 1:42, Alex Bennée wrote:
> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
> hot-unplug on arm64.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Message-Id: <20250512144629.182340-1-gustavo.romero@linaro.org>
> [AJB: add qemu-arm link]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - add qemu-arm link to MAINTAINERS
> ---
>   MAINTAINERS                                  |  6 ++
>   tests/functional/meson.build                 |  1 +
>   tests/functional/test_aarch64_hotplug_pci.py | 74 ++++++++++++++++++++
>   3 files changed, 81 insertions(+)
>   create mode 100755 tests/functional/test_aarch64_hotplug_pci.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7060cf49b9..818d7b9d5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2078,6 +2078,12 @@ S: Supported
>   F: include/hw/pci/pcie_doe.h
>   F: hw/pci/pcie_doe.c
>   
> +ARM PCI Hotplug
> +M: Gustavo Romero <gustavo.romero@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Supported
> +F: tests/functional/test_aarch64_hotplug_pci.py
> +
>   ACPI/SMBIOS
>   M: Michael S. Tsirkin <mst@redhat.com>
>   M: Igor Mammedov <imammedo@redhat.com>
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 52b4706cfe..2d68840fa2 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -83,6 +83,7 @@ tests_aarch64_system_quick = [
>   tests_aarch64_system_thorough = [
>     'aarch64_aspeed_ast2700',
>     'aarch64_aspeed_ast2700fc',
> +  'aarch64_hotplug_pci',
>     'aarch64_imx8mp_evk',
>     'aarch64_raspi3',
>     'aarch64_raspi4',
> diff --git a/tests/functional/test_aarch64_hotplug_pci.py b/tests/functional/test_aarch64_hotplug_pci.py
> new file mode 100755
> index 0000000000..fa1bb62c8f
> --- /dev/null
> +++ b/tests/functional/test_aarch64_hotplug_pci.py
> @@ -0,0 +1,74 @@
> +#!/usr/bin/env python3
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +#
> +# The test hotplugs a PCI device and checks it on a Linux guest.
> +#
> +# Copyright (c) 2025 Linaro Ltd.
> +#
> +# Author:
> +#  Gustavo Romero <gustavo.romero@linaro.org>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +from qemu_test import LinuxKernelTest, Asset, exec_command_and_wait_for_pattern
> +from qemu_test import BUILD_DIR
> +
> +class HotplugPCI(LinuxKernelTest):
> +
> +    ASSET_KERNEL = Asset(
> +        ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
> +         'current/images/netboot/debian-installer/arm64/linux'),
> +        '3821d4db56d42c6a4eac62f31846e35465940afd87746b4cfcdf5c9eca3117b2')
> +
> +    ASSET_INITRD = Asset(
> +        ('https://ftp.debian.org/debian/dists/stable/main/installer-arm64/'
> +         'current/images/netboot/debian-installer/arm64/initrd.gz'),
> +        '2583ec22b45265ad69e82f198674f53d4cd85be124fe012eedc2fd91156bc4b4')
> +
> +    def test_hotplug_pci(self):
> +
> +        self.set_machine('virt')
> +        self.vm.add_args('-m', '512M')
> +        self.vm.add_args('-cpu', 'cortex-a57')
> +        self.vm.add_args('-append',
> +                         'console=ttyAMA0,115200 init=/bin/sh')
> +        self.vm.add_args('-device',
> +                         'pcie-root-port,bus=pcie.0,chassis=1,slot=1,id=pcie.1')
> +        self.vm.add_args('-bios', self.build_file('pc-bios',
> +                                                  'edk2-aarch64-code.fd'))

One call of self.vm.add_args should be sufficient:

self.vm.add_args('-m', '512M',
                  '-cpu', 'cortex-a57',
                  '-append',
                  'console=ttyAMA0,115200 init=/bin/sh',
                  '-device',
                  'pcie-root-port,bus=pcie.0,chassis=1,slot=1,id=pcie.1',
                  '-bios',
                  self.build_file('pc-bios', 'edk2-aarch64-code.fd'))

> +
> +        # BusyBox prompt
> +        prompt = "~ #"
> +        self.launch_kernel(self.ASSET_KERNEL.fetch(),
> +                           self.ASSET_INITRD.fetch(),
> +                           wait_for=prompt)
> +
> +        # Check for initial state: 2 network adapters, lo and enp0s1.
> +        exec_command_and_wait_for_pattern(self,
> +                                          'ls -l /sys/class/net | wc -l',

Shorter: ls /sys/class/net | wc -l

> +                                          '2')
> +
> +        # Hotplug one network adapter to the root port, i.e. pcie.1 bus.
> +        self.vm.cmd('device_add',
> +                    driver='virtio-net-pci',
> +                    bus='pcie.1',
> +                    addr=0,
> +                    id='na')
> +        # Wait for the kernel to recognize the new device.
> +        self.wait_for_console_pattern('virtio-pci')
> +        self.wait_for_console_pattern('virtio_net')
> +
> +        # Check if there is a new network adapter.
> +        exec_command_and_wait_for_pattern(self,
> +                                          'ls -l /sys/class/net | wc -l',
> +                                          '3')
> +
> +        self.vm.cmd('device_del', id='na')
> +        exec_command_and_wait_for_pattern(self,
> +                                          'ls -l /sys/class/net | wc -l',
> +                                          '2')
> +
> +if __name__ == '__main__':
> +    LinuxKernelTest.main()
