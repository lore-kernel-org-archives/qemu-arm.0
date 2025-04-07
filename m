Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp6164691njd;
        Sun, 6 Apr 2025 22:39:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5jtWjDo3FhEgUNGNjLq5nIN42Kjf8/gLw2UTIUxkckHsqL4o+h0eg1CQ0qv2MwmjjA8XwiiMvS3Ltsw==@linaro.org
X-Google-Smtp-Source: AGHT+IEgKgI8M7SUAV+udVxjAzh47ewZbVn2SBe3lNZJBP3nJtERdmti/KSP3KaNa8ycYgNahaJd
X-Received: by 2002:a05:620a:1724:b0:7c5:54d8:3d43 with SMTP id af79cd13be357-7c775af148dmr1780132485a.58.1744004366936;
        Sun, 06 Apr 2025 22:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744004366; cv=none;
        d=google.com; s=arc-20240605;
        b=FSRgCHbObUP4nTZmRNDNhwB1n/yrezLS1tCFqKTmZ2VXi3cbNRKY4J7gw0f+xNaWMZ
         09ms+1PBQT0c8AaRgvLmqdhQpFQWP8tpbhQQVswzFfHAe1y9W526R/ahjgZhk1VO9XXA
         Jk9b8eTN8pGO64DWd53sTSi9B5x9WVEv8Bvk1r2x5EdXUY4paJR3Fnp7RRmROABZ1Smo
         SFoF/7d8EmeQkzLD01yvupsBdGFVJrSSVosGNfOBBSzq+mn4v3S6r1+Agff0FyKpxMpE
         rk3pTpunj280Y94sZK0hnmx4BBRXbIqXiDTlq6N6zYXxuqDJG/jcoXR7aDjZIXspYvQj
         LPTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=xWsJ6q2lih4yZbIGWlXQLSA1n/DWkWhH/ZyrsmSpCjk=;
        fh=ORRDx1RLCbuFaTTV7sFvNGvzl61W2NdwzC3CWDXpHZA=;
        b=AInNjGC5lLrrbig+3+mr5pi8URkX04vZFb1wy7jktChIYj3v2TNrxIayGkYCybd3c0
         tkbaqPlGBTxqkepAFvk4WqAfG722QkEgZ/1GMmCgMZ1O643bG/ZrYyCWKweFESJs9xC5
         oTynbWbYFh2jHwY13wgMJo+80xt0S5VaLNDcjPTY0/L9zn9fm+sCI4f04v+dzYP8mO2N
         62draC+EgQ5px7i4y3JlaEiPvWZIPcs8/vzZWLbqxJRUEDUf5NRPQY+F/Qfe+xPJBxGF
         Ik3lJljxracKjqV/Z3i2Y/7elRcUBJTY+k/wSMqzL8RP69Jc4YhRCzW4DB2woLaku66B
         yzAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ceo8rdlZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c76e748964si810906585a.19.2025.04.06.22.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Apr 2025 22:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ceo8rdlZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u1fCA-0005ct-Rz; Mon, 07 Apr 2025 01:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1u1fBy-0005bw-71
 for qemu-arm@nongnu.org; Mon, 07 Apr 2025 01:38:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1u1fBv-0003Rm-JU
 for qemu-arm@nongnu.org; Mon, 07 Apr 2025 01:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744004317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=xWsJ6q2lih4yZbIGWlXQLSA1n/DWkWhH/ZyrsmSpCjk=;
 b=Ceo8rdlZYk+lh5OfVeqiyZzquqhrUpo9PYDnWBo6vhoLCQ9/tcgLhNW/wFZLn8di9495yq
 UpRw19k6fwCGBKOn/eQLJLkb+2eygwmBUNQVR6yls67ffokaVS/Ekv/ZFNsZT8r/KGYrFb
 vMZKKSsRDZ9wkpayWljAEGYAkOsH0X8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-eghoQOF4MyWfzhRHKlIS4g-1; Mon, 07 Apr 2025 01:38:33 -0400
X-MC-Unique: eghoQOF4MyWfzhRHKlIS4g-1
X-Mimecast-MFC-AGG-ID: eghoQOF4MyWfzhRHKlIS4g_1744004312
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ac3d89cc4f3so305846066b.2
 for <qemu-arm@nongnu.org>; Sun, 06 Apr 2025 22:38:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744004312; x=1744609112;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xWsJ6q2lih4yZbIGWlXQLSA1n/DWkWhH/ZyrsmSpCjk=;
 b=gLp7bIq/iUzAOemSXMJduVz/kQZZ11v+SSwlTiBfG3gkUPxtg9q4WPRqBPXmmFlANm
 QyAUhxQHDjjJEbm8yRyh/SIslXGuzK+blDK2rTUgiHrNdIswtGG7M2M/frrHFpBenCJl
 0qQZ45JGG7A/DE2Om5ACUypRopH0WZQfeVVq5Sqbj9bJNFTtZTjbLnSkV+erzqOiRnXW
 1mmL4pmACBA7gLBb/zjAc/BgQ21Kt/rfQu6hAzv+xfzrMsl+qkMznJrDnZfRWvsAgoTf
 tMWWVz4DQaJcqqTWiqh0c7X4wBMaaDCSE3fEGpzp2ON7/UtbgShjy1e6L+8IPp/wrxe+
 e4iw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXui08LG/LukMMT09mAPpbxyiVmHt5ab6uxfye1yn2WXhyDan+7DAIdHAJOd8/vTi6SYpCorWONGQ==@nongnu.org
X-Gm-Message-State: AOJu0YxEjylNxGBl2+QidHkJIpIGBnWVdBv53coyJ0mUtMT3BH/FlJSz
 LWwmcgltbww+jQf6MAvifnaB69pMo1Gui3HRaUjY+cQ6wJW7dQusJgKHHVJt2Y0N1pGc3osbqEd
 IowjB+/zUay9IH3ocKfrGUahdYaFA3GmaMvP5KximGGK2RtdZgA==
X-Gm-Gg: ASbGncs6pHD25nkIrcedcFEEAYKk7ANlhRX49/YBWwPALj4nqF/LBbE9kt3MeG06qLe
 1gvKWHQDZnQwOUQ7ChucOG0pQwHnTKPZoQi6loacr44yjMMZis1YZ9mS+oUPPj7jS39BpVENPCS
 QhzEoxgb3bauK6G10Bdlst8zOMDq3kFWLossHuiyGpokmeu/PkeiZwscW4hNaqaRz8CR8yIQ4v6
 3xuQ1iUzgFll8+QyZahhCgSTR14eAIwxvWI62nlttKGDPpep7vGsKZqIWzpuIp17xUfsNJ46CWa
 YwynuGKk9kC9aqEk2AzhVcg5irIMevU5YPgRHk0NIUmT
X-Received: by 2002:a17:907:2d2c:b0:ac7:b368:b193 with SMTP id
 a640c23a62f3a-ac7d6d630bdmr1081009466b.27.1744004311760; 
 Sun, 06 Apr 2025 22:38:31 -0700 (PDT)
X-Received: by 2002:a17:907:2d2c:b0:ac7:b368:b193 with SMTP id
 a640c23a62f3a-ac7d6d630bdmr1081008166b.27.1744004311349; 
 Sun, 06 Apr 2025 22:38:31 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-51-76.web.vodafone.de. [109.42.51.76])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac7bfe9adfdsm697321466b.62.2025.04.06.22.38.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Apr 2025 22:38:30 -0700 (PDT)
Message-ID: <122aaf9e-cb4c-4117-90ae-2803f4810700@redhat.com>
Date: Mon, 7 Apr 2025 07:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 1/3] tests/functional: Add test for imx8mp-evk
 board with USDHC coverage
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250405214900.7114-1-shentey@gmail.com>
 <20250405214900.7114-2-shentey@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250405214900.7114-2-shentey@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qEULA_8vX3uOmI9GWRAysHQxrmLCyeCnCUDCW8HFfDk_1744004312
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.659,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HPNPM8kpNP33

  Hi!

On 05/04/2025 23.48, Bernhard Beschow wrote:
> Introduce a functional test which boots Debian 12 on the imx8mp-evk board. Since
> the root filesystem resides on an SD card, the test also verifies the basic
> operation of the USDHC.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   MAINTAINERS                                 |  1 +
>   tests/functional/meson.build                |  1 +
>   tests/functional/test_aarch64_imx8mp_evk.py | 69 +++++++++++++++++++++
>   3 files changed, 71 insertions(+)
>   create mode 100644 tests/functional/test_aarch64_imx8mp_evk.py
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d54b5578f8..4ceffa89dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -833,6 +833,7 @@ F: include/hw/arm/fsl-imx8mp.h
>   F: include/hw/misc/imx8mp_*.h
>   F: include/hw/pci-host/fsl_imx8m_phy.h
>   F: docs/system/arm/imx8mp-evk.rst
> +F: tests/functional/test_aarch64_imx8mp_evk.py
>   F: tests/qtest/rs5c372-test.c
>   
>   MPS2 / MPS3
> diff --git a/tests/functional/meson.build b/tests/functional/meson.build
> index 0f8be30fe2..aaaf3472f1 100644
> --- a/tests/functional/meson.build
> +++ b/tests/functional/meson.build
> @@ -75,6 +75,7 @@ tests_aarch64_system_quick = [
>   
>   tests_aarch64_system_thorough = [
>     'aarch64_aspeed',
> +  'aarch64_imx8mp_evk',
>     'aarch64_raspi3',
>     'aarch64_raspi4',
>     'aarch64_replay',
> diff --git a/tests/functional/test_aarch64_imx8mp_evk.py b/tests/functional/test_aarch64_imx8mp_evk.py
> new file mode 100644

The test files should be executable so you can run them directly (after 
setting PYTHONPATH and QEMU_TEST_QEMU_BINARY)

> index 0000000000..5419d3c525
> --- /dev/null
> +++ b/tests/functional/test_aarch64_imx8mp_evk.py
> @@ -0,0 +1,69 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that boots a Linux kernel and checks the console
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +from qemu_test import LinuxKernelTest, Asset
> +
> +class Imx8mpEvkMachine(LinuxKernelTest):
> +
> +    ASSET_IMAGE = Asset(
> +        ('https://cloud.debian.org/images/cloud/bookworm/20231210-1590/'
> +         'debian-12-generic-arm64-20231210-1590.tar.xz'),
> +        '7ebf1577b32d5af6204df74b54ca2e4675de9b5a9fa14f3ff70b88eeb7b3b359')
> +
> +    KERNEL_OFFSET = 0x51000000
> +    KERNEL_SIZE = 32622528
> +    INITRD_OFFSET = 0x76000000
> +    INITRD_SIZE = 30987766
> +    DTB_OFFSET = 0x64F51000
> +    DTB_SIZE = 45 * 1024
> +
> +    def extract(self, in_path, out_path, offset, size):
> +        try:
> +            with open(in_path, "rb") as source:
> +                source.seek(offset)
> +                data = source.read(size)
> +            with open(out_path, "wb") as target:
> +                target.write(data)
> +        except (IOError, ValueError) as e:
> +            self.log.error(f"Failed to extract {out_path}: {e}")
> +            raise
> +
> +    def setUp(self):
> +        super().setUp()

Is there any special reason for overriding the setUp function here? ... 
otherwise, I think this could also simply be done from the 
test_aarch64_imx8mp_evk_usdhc function instead?

> +        self.ASSET_IMAGE.fetch()

I think you can omit the fetch() here, it should be handled by 
archive_extract() already. At least that's what we're doing in the other 
spots that use archive_extract().

> +        self.archive_extract(self.ASSET_IMAGE)
> +
> +        self.image_path = self.scratch_file("disk.raw")
> +        self.kernel_path = self.scratch_file("linux")
> +        self.initrd_path = self.scratch_file("initrd.zstd")
> +        self.dtb_path = self.scratch_file("imx8mp-evk.dtb")
> +
> +        self.extract(self.image_path, self.kernel_path,
> +                     self.KERNEL_OFFSET, self.KERNEL_SIZE)
> +        self.extract(self.image_path, self.initrd_path,
> +                     self.INITRD_OFFSET, self.INITRD_SIZE)
> +        self.extract(self.image_path, self.dtb_path,
> +                     self.DTB_OFFSET, self.DTB_SIZE)
> +
> +    def test_aarch64_imx8mp_evk_usdhc(self):
> +        self.set_machine('imx8mp-evk')
> +        self.vm.set_console(console_index=1)
> +        self.vm.add_args('-m', '2G',
> +                         '-smp', '4',
> +                         '-accel', 'tcg',

The imx8mp-evk board has a "depends on TCG" in its Kconfig file, so I think 
you could omit "-accel tcg" here (but it also does not hurt to be explicit, 
I guess).

  Thomas


> +                         '-kernel', self.kernel_path,
> +                         '-initrd', self.initrd_path,
> +                         '-dtb', self.dtb_path,
> +                         '-append', 'root=/dev/mmcblk2p1',
> +                         '-drive', f'file={self.image_path},if=sd,bus=2,'
> +                                    'format=raw,id=mmcblk2')
> +
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Welcome to ')
> +
> +if __name__ == '__main__':
> +    LinuxKernelTest.main()

