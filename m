Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2331888njb;
        Mon, 21 Oct 2024 05:27:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWcPFLe2O3cUjZkyY+qwWQKjAyOnU5Ng0sXDizuDATPrf0XqA8uO+cVRMJXLU8dUvp7RH819M1IwSDaig==@linaro.org
X-Google-Smtp-Source: AGHT+IGe/jXN4y7GzmyQ8++D4Jja2hiAJTRTBffc7izeSJF0w4Y+uYL5bLFhWHFn+gi/QdytMBAX
X-Received: by 2002:a05:6830:670b:b0:718:1109:9626 with SMTP id 46e09a7af769-7181a5c9991mr10754621a34.6.1729513650756;
        Mon, 21 Oct 2024 05:27:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729513650; cv=none;
        d=google.com; s=arc-20240605;
        b=fBMlk6S02jDtdKxTZPzfrUHT6QjsJBYazYQSswjV01ZIV/en7zWuXWjo4aSV1YjnBB
         vFwpDHipD5xa50yUndz/EoVXJmKTn4UuDMEM29/zQBRNDxRKB80Ko32QlCQJDPEECQar
         ulCBbFR6JTMy6a3vuVCWRjBMjNMNpf8hVoVShiExOCQIidZbOQf705/4MY5A2ae3P6O+
         VHSNTJFmJwctZaC4MRyu3Q0mdUJOpaMJ3yICz2lLxd2YebNwIDMtThvsCJJHVq+PlnLe
         +JR2mlsBPtM88+hdEviVH2fZi0hNwAt0Itf17Ib150vCn8LngNRjnA+P0XLkk7ZDvQ77
         MeDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=1I0sRRzIsugI0UjhTszwRibAvSARmptC8OBycHgJ0a4=;
        fh=J0Qb6LtlCkPjvGBBNg/d4T4NAN+4+go2G3wp+mxVRq0=;
        b=iiWoroYoSvsVcqpvJw15qM2DuXpPZCYFZSxuuEQG9DF/4PUcX5/yggHPPKf3K1s+hH
         pKPquQ0nbWRSO9wsclyYvcQYjCrMg7eokMkG11cRoBY4RDXzS54vTQK8fFxltNpWwcdK
         lXy1WgvNIM3o8fmj0p08mwhQNEvejOHt2puEbMnKTCg727OY8WzK0FRA8xnbNt36PkV6
         Cv6OUI3pHyxIGSfcn92QFTdy6tifD6uO9oXmKRowMzNqpMqdNUmtfBfCLpA7MlzO6szV
         CrYtsT0MidCqQdWKheojcnNgbTJvj7lcKDtABRyVloG55eLk87l/Lx3PqOG2LEADUwXi
         maXw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=guHaQdDr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce0098ba7fsi37126026d6.289.2024.10.21.05.27.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2024 05:27:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=guHaQdDr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t2rV5-0005fF-Qz; Mon, 21 Oct 2024 08:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2rV3-0005e2-Qe
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 08:27:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1t2rV1-0007ef-NM
 for qemu-arm@nongnu.org; Mon, 21 Oct 2024 08:27:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729513622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1I0sRRzIsugI0UjhTszwRibAvSARmptC8OBycHgJ0a4=;
 b=guHaQdDrOn3/f6ZxBuZDqiHfIugvLXGhVX1tDH0JIPJZQLjAJsXIfVM2Sm+6aXwTqBwMVn
 G8SrjxKs7Cz1zmccUn7dlqhYBthobqBO302j3jX/NYrEjQ3bNtfTPg7RaoqHgj3I6gnqzB
 6SDa689GY8b5jTpflSAb91Zk0cCeHqY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-ZNkXO4GJP364C4H3svAnXw-1; Mon, 21 Oct 2024 08:27:01 -0400
X-MC-Unique: ZNkXO4GJP364C4H3svAnXw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43157e3521dso31689995e9.1
 for <qemu-arm@nongnu.org>; Mon, 21 Oct 2024 05:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729513620; x=1730118420;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1I0sRRzIsugI0UjhTszwRibAvSARmptC8OBycHgJ0a4=;
 b=WTO43CWiVYGN7PDUGi47F4weGCX6f17Y5rqVIjJX62nK1NtEZzI4G7ryMZAydeG8wG
 9TQkqMpxtvtLoTXoowy7io22Ecw26ZN/YNuJXWW7SIAtxOm+PkicoJFPqKdtYlTrSH8D
 NvNUgX3XHfMHjWsfhv+zluHJXuqSvMCGRUBYp5OSY6E2UKIisDTroqzZvmxmLstrf6cA
 QJJ5zPa4pSWhE0FHVLwO6NsD3qSxMh43DBwXNsAE8qtChtyzdq8qPTUTv4fiD5IefBgy
 06azKql5Tz0ywvXqaHKxtWPAItrRlcXlw/cK2TFUEwFuRGCogzslbgaZvFwOZXEbh33Y
 8O0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlqHK5mk0PJCH7kAQ3xkLH1D0qgy05fr1VNIw8GvwQQF94lKKpMfNMdMKhdxAHMZbi6EFzkiwOng==@nongnu.org
X-Gm-Message-State: AOJu0Yxtlg0F7c1lXlDBap9MjsyatBe+rf608amvE1ObMtftybHHK0Xx
 QFyKZzbD6Rty2zv0AvDMC5Gd+sOJzBefpT+GH50nSF5KrzZvRjwI5ef3kth3D09aSEtrnkO+OpY
 2IllP4AdPQvYFK+3qbgJo+uuPAyqo34FM9FMb2XpAZqYhlKJSTA==
X-Received: by 2002:a05:600c:674a:b0:431:54f3:11af with SMTP id
 5b1f17b1804b1-431616ad566mr78781825e9.31.1729513619922; 
 Mon, 21 Oct 2024 05:26:59 -0700 (PDT)
X-Received: by 2002:a05:600c:674a:b0:431:54f3:11af with SMTP id
 5b1f17b1804b1-431616ad566mr78781615e9.31.1729513619516; 
 Mon, 21 Oct 2024 05:26:59 -0700 (PDT)
Received: from [192.168.0.7] (ip-109-42-50-24.web.vodafone.de. [109.42.50.24])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f570dd5sm56463025e9.3.2024.10.21.05.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 05:26:59 -0700 (PDT)
Message-ID: <c483b0aa-8b51-4d11-9542-e54ef702bcfd@redhat.com>
Date: Mon, 21 Oct 2024 14:26:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] tests/functional: Convert most Aspeed machine tests
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 berrange@redhat.com
References: <20241021115603.711116-1-clg@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241021115603.711116-1-clg@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.421,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1.699,
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
X-TUID: miNppicCDTEk

On 21/10/2024 13.56, Cédric Le Goater wrote:
> This is a simple conversion of the tests with some cleanups and
> adjustments to match the new test framework. Replace the zephyr image
> MD5 hashes with SHA256 hashes while at it.
> 
> The SDK tests depend on a ssh class from avocado.utils which is
> difficult to replace. To be addressed separately.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
...
> diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
> new file mode 100644
> index 000000000000..9761fc06a454
> --- /dev/null
> +++ b/tests/functional/test_arm_aspeed.py
> @@ -0,0 +1,282 @@
> +#!/usr/bin/env python3
> +#
> +# Functional test that boots the ASPEED SoCs with firmware
> +#
> +# Copyright (C) 2022 ASPEED Technology Inc
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import time
> +import subprocess
> +import tempfile
> +
> +from qemu_test import LinuxKernelTest, Asset
> +from qemu_test import exec_command_and_wait_for_pattern
> +from qemu_test import interrupt_interactive_console_until_pattern
> +from qemu_test import exec_command
> +from qemu_test import has_cmd
> +from qemu_test.utils import archive_extract
> +from zipfile import ZipFile
> +from unittest import skipUnless
> +
> +class AST1030Machine(LinuxKernelTest):

Nit: Zephyr does not seem to be based on the Linux kernel, so I'd maybe keep 
QemuSystemTest for the AST1030Machine class.

Anyway, it should not matter much, and the rest looks and works fine now, so:

Reviewed-by: Thomas Huth <thuth@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>

> +    ASSET_ZEPHYR_1_04 = Asset(
> +        ('https://github.com/AspeedTech-BMC'
> +         '/zephyr/releases/download/v00.01.04/ast1030-evb-demo.zip'),
> +        '4ac6210adcbc61294927918707c6762483fd844dde5e07f3ba834ad1f91434d3')
> +
> +    def test_ast1030_zephyros_1_04(self):
> +        self.set_machine('ast1030-evb')
> +
> +        zip_file = self.ASSET_ZEPHYR_1_04.fetch()
> +
> +        kernel_name = "ast1030-evb-demo/zephyr.elf"
> +        with ZipFile(zip_file, 'r') as zf:
> +                     zf.extract(kernel_name, path=self.workdir)
> +        kernel_file = os.path.join(self.workdir, kernel_name)
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_file, '-nographic')
> +        self.vm.launch()
> +        self.wait_for_console_pattern("Booting Zephyr OS")
> +        exec_command_and_wait_for_pattern(self, "help",
> +                                          "Available commands")
> +
> +    ASSET_ZEPHYR_1_07 = Asset(
> +        ('https://github.com/AspeedTech-BMC'
> +         '/zephyr/releases/download/v00.01.07/ast1030-evb-demo.zip'),
> +        'ad52e27959746988afaed8429bf4e12ab988c05c4d07c9d90e13ec6f7be4574c')
> +
> +    def test_ast1030_zephyros_1_07(self):
> +        self.set_machine('ast1030-evb')
> +
> +        zip_file = self.ASSET_ZEPHYR_1_07.fetch()
> +
> +        kernel_name = "ast1030-evb-demo/zephyr.bin"
> +        with ZipFile(zip_file, 'r') as zf:
> +                     zf.extract(kernel_name, path=self.workdir)
> +        kernel_file = os.path.join(self.workdir, kernel_name)
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_file, '-nographic')
> +        self.vm.launch()
> +        self.wait_for_console_pattern("Booting Zephyr OS")
> +        for shell_cmd in [
> +                'kernel stacks',
> +                'otp info conf',
> +                'otp info scu',
> +                'hwinfo devid',
> +                'crypto aes256_cbc_vault',
> +                'random get',
> +                'jtag JTAG1 sw_xfer high TMS',
> +                'adc ADC0 resolution 12',
> +                'adc ADC0 read 42',
> +                'adc ADC1 read 69',
> +                'i2c scan I2C_0',
> +                'i3c attach I3C_0',
> +                'hash test',
> +                'kernel uptime',
> +                'kernel reboot warm',
> +                'kernel uptime',
> +                'kernel reboot cold',
> +                'kernel uptime',
> +        ]: exec_command_and_wait_for_pattern(self, shell_cmd, "uart:~$")
> +

  Thomas

