Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3796417njk;
        Tue, 3 Dec 2024 07:54:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXzFhkdirNiiBF7C97wr/GCZyjCnyepk0hv573P5boWouI8DFJQ5Lpr6N19XTJRjOCWmLcE2ZmuorvBsw==@linaro.org
X-Received: by 2002:a05:600c:4f95:b0:434:a5d1:9917 with SMTP id 5b1f17b1804b1-434d0a05c88mr21845395e9.21.1733241250854;
        Tue, 03 Dec 2024 07:54:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733241250; cv=none;
        d=google.com; s=arc-20240605;
        b=Xd7jQkM5tCALAmNDKC+VMBVx7IqBYrzCpHO7eiEiKHvsEMPlzDDRbiSxv6+/a1hb93
         QKguiS1yoyqrDWo2zYN9LQoBeOcrYcycHGjjHoEr6e1AhRhG44MFUuCQtxlT4t+GqsnX
         UU8eFWhJS9aWjl6A7UGVlF6Jpcm4e9svHYOLyNLlPB04G08Cz3XnU3q3RUFP33LAX1DV
         4mUHoOV7IMvqk1GeMDuChsqHp7DMxTbf9IhIzkFHsHbB/bUdEdVS8aSQWU+h4zQ0vPcS
         K68VpMTquhIERYnGj4ruwm+iEmSpNXPlidNf/FDbKcRMFed/3KXtyyRd/rspLqSbYZN1
         RL8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=WXH/s/ip8BsiNVAtl+QTmTFjS9rg6DwOtbG5SDcWnkI=;
        fh=gPJaie2weJbBXSAO0GnSK4wSaQI3jekYyAc8mQ2gKro=;
        b=lbNlCjzFL49G+79IqT42raSAuHcIezhoaySNpZMI/ynXFLWggnzAoXOntGT9sfoLaM
         9v5HHJJG16bFiWVCLVIKrE6dr59r2n9IheeJQk4gbRlw+4NroO75kw+0Q3sRxY6mrfSm
         b6JcmuyF2UD8EVxqtGi9epLx9wJP7xxUP09I1X/ZwA4tu9ycprboX/EUHVXo9KMS7YQ/
         NIn4GceY2U27lSmMZd/MVdEhUmajFiHX5MtzEkD24lHOp8YIeUl1Jy6cMZeTaQn9w0oS
         6SsCvlwhhLB/aibHgFEi5IJXnUtNgpzUk+nniYoOweDMBtEMlLvJS63N6w3UepxNdo8T
         Gujw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHPyf9KM;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434b10521f0sor42750945e9.4.2024.12.03.07.54.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 03 Dec 2024 07:54:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xHPyf9KM;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733241250; x=1733846050; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WXH/s/ip8BsiNVAtl+QTmTFjS9rg6DwOtbG5SDcWnkI=;
        b=xHPyf9KMNzt3zW+uksFL82kdR3Mh9H0omXPleBb28WeseUZRweoxUyfftFVfFTHimN
         D/FnC/7bQJ0HpO/PxAeJZ/ySmRC0rLhfMpvUrBRfdVSbTafhcGs/+Hz1kKZFXZqmJEAg
         76QqkHY/xSUm3925uxPNDyBUjPbXlNjVkrbbKD66LmCy5wwZ2ta5E+3GEPPuvxeeuC2+
         SSPHsfsRSqDfmGxbopDDDWhnmDV3gZEXshgLhwYfHo7QCz8N5J+zYmssOzy0HfEFoR3J
         30dCRLK5L4wiW01HbutZxyxwjjtP4vln2eMTL1a/mJ+P9Xm+3Un9uFbIVO+zkmsYQZnv
         WjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733241250; x=1733846050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXH/s/ip8BsiNVAtl+QTmTFjS9rg6DwOtbG5SDcWnkI=;
        b=lv60iHn6nswOofFkojbEFL1ByvAugh8Uq7lE/YicQDQ1gvLzmQcdIRHBdH9IW35ibe
         jjo8pMrOJ2FQ2jVgDIL+H/4Ku0dzERopu6L5PmLFs5QeqRwhx843f9D74mjgq+6eKEZ0
         j4FzWWoX+J+UcwxumYgGYsB/aw5yxS7rWy/BQ9t1IpxzirJXCo8+4ampDeajlFgVPPx6
         FOFo0xAbsTz6RC8BJ3Jn/7kAY7sOMVagGzlAJi+Z7DjHEl2ef3Xcb+iDRI3PyHSTOlAg
         nDCudzt6DvBpgD7ABVOVQbYqTNmkpQ2lEJJaONuc+AJaFC8XdhcoPF640G4gmk0gFK2N
         /COQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPdKQ9dzBRs4JEK1iCrMTQJJOWmHsNz/55vmSEbGR+wil1C4CcDa2jRn4Rcw4ot045oFUL7VOwf1MDGg==@linaro.org
X-Gm-Message-State: AOJu0YyH45v71HiD15BtO9DCNGxwEWEj5ktRN30KE387Il1isZyhDz69
	1NoqU59CpCypkmvZtc1vDrsGq+pT9/alJVn+6mMvfuRtnIGgvsbV16oYKB3mqLrYbA==
X-Gm-Gg: ASbGncsRms7qIMDk8BI3yfBi5r2ah5hFvu94s+32nICxQ8UWOrM7COko9WpsWY8hj25
	yuOkoaTLGDZ97r6oVQ8n3ITKLch4G3xVfMWhYmsAeLPKDr8/msUWJT6fQQZNRqy46fM0AKsQX6H
	jjb0vY28uPbyhGRfWcHHhZTX4FBjFB+Klv9u/iELq1wbfok/RVEP8lbBC61P3maEoBpL1me5shu
	nCJH5/970Y9UyrPIFUIjpbJPUQPMbmP7rt9Apy8Qu91pgeV
X-Google-Smtp-Source: AGHT+IFnyN+Vr6xTMF9G8jhDQLxpEJ4sTI9bFWDZYtPPwTa1OrwH0AryMYoMj7aOaiIl7eX2oy2MDg==
X-Received: by 2002:a05:600c:1994:b0:434:a1d3:a326 with SMTP id 5b1f17b1804b1-434d09b1473mr28058655e9.6.1733241250239;
        Tue, 03 Dec 2024 07:54:10 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dbf9f5sm191729705e9.16.2024.12.03.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 07:54:09 -0800 (PST)
Date: Tue, 3 Dec 2024 15:54:34 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, marcin.juszkiewicz@linaro.org,
	gustavo.romero@linaro.org, qemu-arm@nongnu.org,
	alex.bennee@linaro.org, mathieu.poirier@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3] tests/functional/aarch64: add tests for FEAT_RME
Message-ID: <20241203155434.GB1903051@myrica>
References: <20241203001741.2068452-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203001741.2068452-1-pierrick.bouvier@linaro.org>
X-TUID: d9hkZavvD7dt

On Mon, Dec 02, 2024 at 04:17:41PM -0800, Pierrick Bouvier wrote:
> This boot an OP-TEE environment, and launch a nested guest VM inside it
> using the Realms feature. We do it for virt and sbsa-ref platforms.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> 
> -----
> 
> v2:
> - move test to its own file
> - add sbsa test
> - check output of `cca-workload-attestation report`
> 
> v3:
> - build and run test with cca-v4 images
> - factorize nested guest test between both tests
> - remove accel tcg option as it is the default when running tests
> Note: It's a long test and there is a work in progress to understand why
> debug build is so slow (x12 vs optimized).

Can the functional tests take as long as we want, or are they regularly
run by a CI?

The `cca-workload-attestation report` command is great for making sure the
RME feature is working and the guest is running in a Realm, and it's very
light. In my opinion it's sufficient here.

We could also run kvm-unit-tests on the host, various VM payloads and
configs (in particular edk2 boot), and performing local attestation, but
those would all be testing the other software components, so don't seem
relevant to this functional test of the QEMU emulator. That said we do
need regression tests for the whole software stack (including QEMU VMM)
and this test automation is really convenient so I'd like to extend it
with extra tests but outside the QEMU codebase.

Thanks,
Jean

> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> ---
>  tests/functional/meson.build                 |   4 +
>  tests/functional/test_aarch64_rme_sbsaref.py |  70 +++++++++++++
>  tests/functional/test_aarch64_rme_virt.py    | 100 +++++++++++++++++++
>  3 files changed, 174 insertions(+)
>  create mode 100755 tests/functional/test_aarch64_rme_sbsaref.py
>  create mode 100755 tests/functional/test_aarch64_rme_virt.py
> 
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 5c048cfac6d..b975a1560df 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -13,6 +13,8 @@ endif
>  test_timeouts = {
>    'aarch64_aspeed' : 600,
>    'aarch64_raspi4' : 480,
> +  'aarch64_rme_virt' : 720,
> +  'aarch64_rme_sbsaref' : 720,
>    'aarch64_sbsaref_alpine' : 720,
>    'aarch64_sbsaref_freebsd' : 720,
>    'aarch64_tuxrun' : 240,
> @@ -52,6 +54,8 @@ tests_aarch64_system_thorough = [
>    'aarch64_aspeed',
>    'aarch64_raspi3',
>    'aarch64_raspi4',
> +  'aarch64_rme_virt',
> +  'aarch64_rme_sbsaref',
>    'aarch64_sbsaref',
>    'aarch64_sbsaref_alpine',
>    'aarch64_sbsaref_freebsd',
> diff --git a/tests/functional/test_aarch64_rme_sbsaref.py b/tests/functional/test_aarch64_rme_sbsaref.py
> new file mode 100755
> index 00000000000..398562c166f
> --- /dev/null
> +++ b/tests/functional/test_aarch64_rme_sbsaref.py
> @@ -0,0 +1,70 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that boots a Realms environment on sbsa-ref machine and a
> +# nested guest VM using it.
> +#
> +# Copyright (c) 2024 Linaro Ltd.
> +#
> +# Author: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import time
> +import os
> +import logging
> +
> +from qemu_test import QemuSystemTest, Asset
> +from qemu_test import exec_command, wait_for_console_pattern
> +from qemu_test import exec_command_and_wait_for_pattern
> +from qemu_test.utils import archive_extract
> +from test_aarch64_rme_virt import test_realms_guest
> +
> +class Aarch64RMESbsaRefMachine(QemuSystemTest):
> +
> +    # Stack is built with OP-TEE build environment from those instructions:
> +    # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
> +    # https://github.com/pbo-linaro/qemu-rme-stack
> +    ASSET_RME_STACK_SBSA = Asset(
> +        ('https://fileserver.linaro.org/s/KJyeBxL82mz2r7F/'
> +         'download/rme-stack-op-tee-4.2.0-cca-v4-sbsa.tar.gz'),
> +         'dd9ab28ec869bdf3b5376116cb3689103b43433fd5c4bca0f4a8d8b3c104999e')
> +
> +    # This tests the FEAT_RME cpu implementation, by booting a VM supporting it,
> +    # and launching a nested VM using it.
> +    def test_aarch64_rme_sbsaref(self):
> +        stack_path_tar_gz = self.ASSET_RME_STACK_SBSA.fetch()
> +        archive_extract(stack_path_tar_gz, self.workdir)
> +
> +        self.set_machine('sbsa-ref')
> +        self.vm.set_console()
> +        self.require_accelerator('tcg')
> +
> +        rme_stack = os.path.join(self.workdir,
> +                                 'rme-stack-op-tee-4.2.0-cca-v4-sbsa')
> +        pflash0 = os.path.join(rme_stack, 'images', 'SBSA_FLASH0.fd')
> +        pflash1 = os.path.join(rme_stack, 'images', 'SBSA_FLASH1.fd')
> +        virtual = os.path.join(rme_stack, 'images', 'disks', 'virtual')
> +        drive = os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ext4')
> +
> +        self.vm.add_args('-cpu', 'max,x-rme=on')
> +        self.vm.add_args('-m', '2G')
> +        self.vm.add_args('-M', 'sbsa-ref')
> +        self.vm.add_args('-drive', f'file={pflash0},format=raw,if=pflash')
> +        self.vm.add_args('-drive', f'file={pflash1},format=raw,if=pflash')
> +        self.vm.add_args('-drive', f'file=fat:rw:{virtual},format=raw')
> +        self.vm.add_args('-drive', f'format=raw,if=none,file={drive},id=hd0')
> +        self.vm.add_args('-device', 'virtio-blk-pci,drive=hd0')
> +        self.vm.add_args('-device', 'virtio-9p-pci,fsdev=shr0,mount_tag=shr0')
> +        self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
> +        self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
> +        self.vm.add_args('-netdev', 'user,id=net0')
> +
> +        self.vm.launch()
> +        # Wait for host VM boot to complete.
> +        wait_for_console_pattern(self, 'Welcome to Buildroot')
> +        exec_command_and_wait_for_pattern(self, 'root', '#')
> +
> +        test_realms_guest(self)
> +
> +if __name__ == '__main__':
> +    QemuSystemTest.main()
> diff --git a/tests/functional/test_aarch64_rme_virt.py b/tests/functional/test_aarch64_rme_virt.py
> new file mode 100755
> index 00000000000..be240c691c2
> --- /dev/null
> +++ b/tests/functional/test_aarch64_rme_virt.py
> @@ -0,0 +1,100 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that boots a Realms environment on virt machine and a nested
> +# guest VM using it.
> +#
> +# Copyright (c) 2024 Linaro Ltd.
> +#
> +# Author: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import time
> +import os
> +import logging
> +
> +from qemu_test import QemuSystemTest, Asset
> +from qemu_test import exec_command, wait_for_console_pattern
> +from qemu_test import exec_command_and_wait_for_pattern
> +from qemu_test.utils import archive_extract
> +
> +def test_realms_guest(test_rme_instance):
> +
> +    # Boot the (nested) guest VM
> +    exec_command(test_rme_instance,
> +                 'qemu-system-aarch64 -M virt,gic-version=3 '
> +                 '-cpu host -enable-kvm -m 512M '
> +                 '-M confidential-guest-support=rme0 '
> +                 '-object rme-guest,id=rme0 '
> +                 '-device virtio-net-pci,netdev=net0,romfile= '
> +                 '-netdev user,id=net0 '
> +                 '-kernel /mnt/out/bin/Image '
> +                 '-initrd /mnt/out-br/images/rootfs.cpio '
> +                 '-serial stdio')
> +    # Detect Realm activation during (nested) guest boot.
> +    wait_for_console_pattern(test_rme_instance,
> +                             'SMC_RMI_REALM_ACTIVATE')
> +    # Wait for (nested) guest boot to complete.
> +    wait_for_console_pattern(test_rme_instance,
> +                             'Welcome to Buildroot')
> +    exec_command_and_wait_for_pattern(test_rme_instance, 'root', '#')
> +    # query (nested) guest cca report
> +    exec_command(test_rme_instance, 'cca-workload-attestation report')
> +    wait_for_console_pattern(test_rme_instance,
> +                             '"cca-platform-hash-algo-id": "sha-256"')
> +    wait_for_console_pattern(test_rme_instance,
> +                             '"cca-realm-hash-algo-id": "sha-512"')
> +    wait_for_console_pattern(test_rme_instance,
> +                             '"cca-realm-public-key-hash-algo-id": "sha-256"')
> +
> +class Aarch64RMEVirtMachine(QemuSystemTest):
> +
> +    # Stack is built with OP-TEE build environment from those instructions:
> +    # https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/
> +    # https://github.com/pbo-linaro/qemu-rme-stack
> +    ASSET_RME_STACK_VIRT = Asset(
> +        ('https://fileserver.linaro.org/s/iaRsNDJp2CXHMSJ/'
> +         'download/rme-stack-op-tee-4.2.0-cca-v4-qemu_v8.tar.gz'),
> +         '1851adc232b094384d8b879b9a2cfff07ef3d6205032b85e9b3a4a9ae6b0b7ad')
> +
> +    # This tests the FEAT_RME cpu implementation, by booting a VM supporting it,
> +    # and launching a nested VM using it.
> +    def test_aarch64_rme_virt(self):
> +        stack_path_tar_gz = self.ASSET_RME_STACK_VIRT.fetch()
> +        archive_extract(stack_path_tar_gz, self.workdir)
> +
> +        self.set_machine('virt')
> +        self.vm.set_console()
> +        self.require_accelerator('tcg')
> +
> +        rme_stack = os.path.join(self.workdir,
> +                                 'rme-stack-op-tee-4.2.0-cca-v4-qemu_v8')
> +        kernel = os.path.join(rme_stack, 'out', 'bin', 'Image')
> +        bios = os.path.join(rme_stack, 'out', 'bin', 'flash.bin')
> +        drive = os.path.join(rme_stack, 'out-br', 'images', 'rootfs.ext4')
> +
> +        self.vm.add_args('-cpu', 'max,x-rme=on')
> +        self.vm.add_args('-m', '2G')
> +        self.vm.add_args('-M', 'virt,acpi=off,'
> +                         'virtualization=on,'
> +                         'secure=on,'
> +                         'gic-version=3')
> +        self.vm.add_args('-bios', bios)
> +        self.vm.add_args('-kernel', kernel)
> +        self.vm.add_args('-drive', f'format=raw,if=none,file={drive},id=hd0')
> +        self.vm.add_args('-device', 'virtio-blk-pci,drive=hd0')
> +        self.vm.add_args('-device', 'virtio-9p-device,fsdev=shr0,mount_tag=shr0')
> +        self.vm.add_args('-fsdev', f'local,security_model=none,path={rme_stack},id=shr0')
> +        self.vm.add_args('-device', 'virtio-net-pci,netdev=net0')
> +        self.vm.add_args('-netdev', 'user,id=net0')
> +        self.vm.add_args('-append', 'root=/dev/vda')
> +
> +        self.vm.launch()
> +        # Wait for host VM boot to complete.
> +        wait_for_console_pattern(self, 'Welcome to Buildroot')
> +        exec_command_and_wait_for_pattern(self, 'root', '#')
> +
> +        test_realms_guest(self)
> +
> +if __name__ == '__main__':
> +    QemuSystemTest.main()
> -- 
> 2.39.5
> 
