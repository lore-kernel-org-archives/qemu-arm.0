Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp380529njb;
        Tue, 13 May 2025 02:04:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnVi1In1jkwy5yrqqjWl4uUzVJDvLA1zsnEfDfIJHnBr48QrpXGO1Nk5HaT6bICJuEmgHw
X-Received: by 2002:a05:622a:1987:b0:48b:4d11:1780 with SMTP id d75a77b69052e-4945271de1emr265987591cf.4.1747127085632;
        Tue, 13 May 2025 02:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747127085; cv=none;
        d=google.com; s=arc-20240605;
        b=MezIYOA2gMZ2WfL524bwokBiTqxJ8Hl0/CN/hCVfcLgZ9HWNT+hTPoh+Saz5aGN49Z
         mG84OZR59Ht4LWqmJZTU+PsmWQvOc2V0rx4KNEGz3US+jGXCFhM3fqsMkyUyXO0j3v5d
         Yut+hh4J57tXonrut7UIJ0tDSFkgh/ImAMLa45U6HYKKtkZ8BeFuOiHbwA4/+1QXEmOw
         M85qKsZPeO9+OrQP4fwvnkRQl6pSX+KssmonxbGKzGyciaoTwD7BHYA9HQKglTTwPMyH
         Cbra1mB6Olgn5WWMm5uBnLlUSWOub6cAibaGgWztnSrGvHX90A83B2VNm1IQg8Kzwcdy
         co1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=R6eonsskfOOe3KnGu2tFGL/6iBrDFe3TXuWk4dwBJ9g=;
        fh=j/iohPOANTCn2bkNhzPwEdY695oC5ItAlEm1vJYSD2g=;
        b=fTI7SPwKIHjXeNDfUmmG2PNYwjmMDDi//e8Yz6QRiFTxvsc+rMUG+9cr7Z21nPgC6V
         aY6B/yE1GgqcHiOaesk4kN2+tILXxdcPh4L9zWaDSSosoX9DL5KtpkmR9fc3LjbSoraX
         /o0hibr0ndoP7TgGk5V4RhVWnXsf7SI5WenTt7z6QfNXUQbVGzUqwQ60tuOG+KmSfabd
         tvZHQMOGdlEbmFaZINWDguBEy9HyTkT4bootgmZ7GSMJrDT01QHu0yx1iUtP3YnNAmUM
         P1/Fr4jFdxyz71W4rwnzXrg/0S0D1oHyL5qsFEpwOqc8+Q+VWQCkrKGkY4L3zgxIXCeI
         TgEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h3porA6b;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4945247cd42si99333931cf.170.2025.05.13.02.04.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:04:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h3porA6b;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747127085;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R6eonsskfOOe3KnGu2tFGL/6iBrDFe3TXuWk4dwBJ9g=;
	b=h3porA6bzhrwI07r7mdso/O52qGRBdmJwn0psJOpYN6iJuScEXUxueeRs5jKbMUi0oa2Ja
	SXPDf+U4PmoN9+0b1Ifmmow26YlINhVkTTo2CF5zgjF7b4+Q7r+3a+nUWJ7MOSZ1x3uIu4
	YHYPqWOophMs60MUMjpdWyazQgycseU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-rreBHLAjO0WYVN4uCrwa_Q-1; Tue, 13 May 2025 05:04:43 -0400
X-MC-Unique: rreBHLAjO0WYVN4uCrwa_Q-1
X-Mimecast-MFC-AGG-ID: rreBHLAjO0WYVN4uCrwa_Q_1747127083
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-441c122fa56so21257155e9.2
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 02:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127082; x=1747731882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6eonsskfOOe3KnGu2tFGL/6iBrDFe3TXuWk4dwBJ9g=;
        b=c5EKUhatGDErFU6QddIU8OMAIqGQCsShaoo7HNx4yFKLHOLVefsWlCyWJe6qk8okyr
         dLcyEweBduSYGPnhz5oCyYTdytPq7f+Eiii1UtOSpd2l2Jv17Vui418Vuxv667NSHHJv
         8UDzo3z30vHuRigsn7Jc4PKVMXXIqszFoR2GAtdun0sHe3RqSVIeFufjAprRciy4Fuxn
         hkSIHV2/w1eVJCIxipkLLgQaa/lhlikL8TdSpnuz4DXw7GwNm1ty0v48fKP3MyYhD8vb
         ydBt3HeDJisvDPidn/760me9ekWP3oYQ2MaTO2eD61tRY0gI+/jUnMwCzkPsElnhuIo0
         tRnA==
X-Gm-Message-State: AOJu0YxsW1UWFQT2FQFJNbHl1hpJws+oL9OyZYy/yc1b52fRUH65+GIv
	/fEMoCjEb/xD9i8IjD9PU/jq+E+LEZm2X+O1lLOBm/vK6NGfEIZdUjM0wegkN8aG5wcypXTq8K1
	Tp+mXRfHHs/5Y+KG9y/KM5M4XgPrI3rp7IWLwPzDF3ky4ghyeKqQK9A==
X-Gm-Gg: ASbGnctQF0zuLaI5V3ZrjKMyZBK1oyupx4y60NdXH/PcRUJDv79+IEWq2AUtW6qMzZQ
	P8/LTT3bqQdoy+KHkdLY1tdKFs0p5n/RCpLPbrxg2koBkqbaPOkaY5gHIjTlkM6e936qUg0f79N
	spjOOuMIOZfTVzhK0smbB5A5j+nom0Nb4YdzpP4UKUDvSz53mdQAUQcY7y+BeMW9DPYKklQ3pfi
	RhxgLrzj8piOdFBGeEsspEVJYE8S9DeJA+j3fJzDKdBQk9+pkLJovm2BCN25GAH+GQwGANMLHVw
	GN7QZDXYfMN2vwBEAXF02VrzEDZfGaf7JLS13KHzpaUp67tIRkWDPVGljN0=
X-Received: by 2002:a05:6000:2485:b0:39e:e3ef:5cbf with SMTP id ffacd0b85a97d-3a1f643a65fmr15077188f8f.24.1747127082620;
        Tue, 13 May 2025 02:04:42 -0700 (PDT)
X-Received: by 2002:a05:6000:2485:b0:39e:e3ef:5cbf with SMTP id ffacd0b85a97d-3a1f643a65fmr15077153f8f.24.1747127082237;
        Tue, 13 May 2025 02:04:42 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de087sm15669476f8f.16.2025.05.13.02.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:04:41 -0700 (PDT)
Message-ID: <67ab5cf1-5e61-4fd0-b3a1-fe5eae690448@redhat.com>
Date: Tue, 13 May 2025 11:04:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4] tests/functional: Add PCI hotplug test for aarch64
To: Gustavo Romero <gustavo.romero@linaro.org>, qemu-devel@nongnu.org,
 thuth@redhat.com, berrange@redhat.com
Cc: alex.bennee@linaro.org, philmd@linaro.org, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
References: <20250512144629.182340-1-gustavo.romero@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250512144629.182340-1-gustavo.romero@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3-FOLdKbxazuAi_2lj8UvnaqCYYnojvC24PNhE4UuIg_1747127083
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: TNNiWYIgdF7q

Hi Gustavo,

On 5/12/25 4:45 PM, Gustavo Romero wrote:
> Add a functional test, aarch64_hotplug_pci, to exercise PCI hotplug and
> hot-unplug on arm64.
>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  MAINTAINERS                                  |  5 ++
>  tests/functional/meson.build                 |  1 +
>  tests/functional/test_aarch64_hotplug_pci.py | 74 ++++++++++++++++++++
>  3 files changed, 80 insertions(+)
>  create mode 100755 tests/functional/test_aarch64_hotplug_pci.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 23174b4ca7..9ebb768214 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2065,6 +2065,11 @@ S: Supported
>  F: include/hw/pci/pcie_doe.h
>  F: hw/pci/pcie_doe.c
>  
> +ARM PCI Hotplug
> +M: Gustavo Romero <gustavo.romero@linaro.org>
> +S: Supported
> +F: tests/functional/test_aarch64_hotplug_pci.py
> +
>  ACPI/SMBIOS
>  M: Michael S. Tsirkin <mst@redhat.com>
>  M: Igor Mammedov <imammedo@redhat.com>
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 52b4706cfe..2d68840fa2 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -83,6 +83,7 @@ tests_aarch64_system_quick = [
>  tests_aarch64_system_thorough = [
>    'aarch64_aspeed_ast2700',
>    'aarch64_aspeed_ast2700fc',
> +  'aarch64_hotplug_pci',
>    'aarch64_imx8mp_evk',
>    'aarch64_raspi3',
>    'aarch64_raspi4',
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
