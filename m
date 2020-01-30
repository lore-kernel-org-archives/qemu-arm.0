Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1978615lfp;
        Thu, 30 Jan 2020 06:44:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjHAiArJxp6sNaNabwHguT7JnfO9ULykwARUlpyuASYQdBadHK2ALwam9qxOLaSdKfGm3F
X-Received: by 2002:a17:906:390d:: with SMTP id f13mr4355949eje.151.1580395442899;
        Thu, 30 Jan 2020 06:44:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580395442; cv=none;
        d=google.com; s=arc-20160816;
        b=zU9kxSJaIdj5nY9uPIm4pTXPtTy6nDxMVa2MqCeYIsRedKckOhR9JiBjY/kjwJQert
         LnIiNJuzIyZwz+Ko9OcEGMN6wXUSx8rrK7LoXQrM0K6Z8VvUrA7dVNmEcQgdX4+10Mgn
         3ptRWb+qXgQw2z1ouyFpqSmZmL4SGJtPGw1CB7QKusLsp2tXwb4BxbZSNw3P/NRiXGUs
         Hwq8oOMGJ6iPOzRCPtQHbQcRaxqxZ5oHJgEeZ/VBiZjwp13mrhG5Bj3O1ZsOYIRn/Fr7
         UUwvzFQapudIJnBalMqeF32sOReYGg1szvc4IfdcUrAiDmLmbJYx1g6Xozk14js+4cqm
         +4xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=VcwkawPc0Bk8cmCdkH/Z17eGA4dxe7XPTWhkSJ6R1mM=;
        b=Y3l9BYkQisY0L/k/ShaAFIR8OqGNV1Hk2iA1xvb0stINapkFtqBPzHFikDNuLa5U7S
         7+ctIef7EFBu2qWUPoQeg0zVDq6GPP6luDfbD5BafW0e/SSYcWKR2ZGfXqDhe/3s1qWL
         u6WrGP/JDW02lLkzufLQRHA4mqLFBy6tZwLC5KnTolMWmMOetOlbX25BiKgzdIWon+ai
         xkwiroE1u/3P0yHhNJ2VbuFlhwP6ZTI8hAfyyR+bMBJuBAuTH5vJ6AbTBGDg4UAkp+p7
         lx+bF5Eu4ijqqzuAUZ/mUyWw7ZJmK0HgMnfkHJYZCZRvOWIr/Nc807zVpy3mTEGTRZtq
         DbdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q8cWElc1;
       spf=pass (google.com: domain of wainersm@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wainersm@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id e6si3224651ejc.240.2020.01.30.06.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 06:44:02 -0800 (PST)
Received-SPF: pass (google.com: domain of wainersm@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q8cWElc1;
       spf=pass (google.com: domain of wainersm@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580395441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VcwkawPc0Bk8cmCdkH/Z17eGA4dxe7XPTWhkSJ6R1mM=;
	b=Q8cWElc1FCXIXUy8dhx1ZNWbiE3pDFWbI+TpyQUeBeuZP+mWfixSPCm42mKRVRKULWTYNu
	P22dVUjRfFFZk6sMOJhmVMqD2yyR3bKgbO3a6+Gt4wAVqjx7GmUVu9IwPOWt4VAOYOX8nk
	8daiRmHcQT3CtO3Q/zSi2XxBhadyoTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-Bq59QaOFNkCCbJV8fJrSXQ-1; Thu, 30 Jan 2020 09:43:54 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A4BC800D4C;
	Thu, 30 Jan 2020 14:43:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-40.gru2.redhat.com [10.97.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D49077928;
	Thu, 30 Jan 2020 14:43:49 +0000 (UTC)
Subject: Re: [RFC PATCH] tests/acceptance: Add a test for the N800 and N810
 arm machines
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200129131920.22302-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <8afc6c04-f17b-27d8-968e-4d18b7ed6edb@redhat.com>
Date: Thu, 30 Jan 2020 12:43:47 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200129131920.22302-1-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: Bq59QaOFNkCCbJV8fJrSXQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ocB/V4IL+LBd


On 1/29/20 11:19 AM, Thomas Huth wrote:
> Old kernels from the Meego project can be used to check that Linux
> is at least starting on these machines.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   The serial console is written to the second UART, so this needs Phil's
>   "Allow to use other serial consoles than default" patch as a prerequisite:
>   Based-on: <20200120235159.18510-5-f4bug@amsat.org>
>
>   MAINTAINERS                          |  1 +
>   tests/acceptance/machine_arm_n8x0.py | 49 ++++++++++++++++++++++++++++
>   2 files changed, 50 insertions(+)
>   create mode 100644 tests/acceptance/machine_arm_n8x0.py

LGTM.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ddf6fe0794..560507e821 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -672,6 +672,7 @@ F: hw/rtc/twl92230.c
>   F: include/hw/display/blizzard.h
>   F: include/hw/input/tsc2xxx.h
>   F: include/hw/misc/cbus.h
> +F: tests/acceptance/machine_arm_n8x0.py
>   
>   Palm
>   M: Andrzej Zaborowski <balrogg@gmail.com>
> diff --git a/tests/acceptance/machine_arm_n8x0.py b/tests/acceptance/machine_arm_n8x0.py
> new file mode 100644
> index 0000000000..e5741f2d8d
> --- /dev/null
> +++ b/tests/acceptance/machine_arm_n8x0.py
> @@ -0,0 +1,49 @@
> +# Functional test that boots a Linux kernel and checks the console
> +#
> +# Copyright (c) 2020 Red Hat, Inc.
> +#
> +# Author:
> +#  Thomas Huth <thuth@redhat.com>
> +#
> +# This work is licensed under the terms of the GNU GPL, version 2 or
> +# later.  See the COPYING file in the top-level directory.
> +
> +import os
> +
> +from avocado import skipUnless
> +from avocado_qemu import Test
> +from avocado_qemu import wait_for_console_pattern
> +
> +class N8x0Machine(Test):
> +    """Boots the Linux kernel and checks that the console is operational"""
> +
> +    timeout = 90
> +
> +    def __do_test_n8x0(self):
> +        kernel_url = ('http://stskeeps.subnetmask.net/meego-n8x0/'
> +                      'meego-arm-n8x0-1.0.80.20100712.1431-'
> +                      'vmlinuz-2.6.35~rc4-129.1-n8x0')
> +        kernel_hash = 'e9d5ab8d7548923a0061b6fbf601465e479ed269'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +
> +        self.vm.set_console(console_index=1)
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-append', 'printk.time=0 console=ttyS1')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'TSC2005 driver initializing')
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    def test_n800(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:n800
> +        """
> +        self.__do_test_n8x0()
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    def test_n810(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:n810
> +        """
> +        self.__do_test_n8x0()
