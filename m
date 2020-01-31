Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp949623lfp;
        Fri, 31 Jan 2020 10:16:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqxO0BlYKihtce9CvzQYy/8SLp5MyD45nE1q7kdTVbSDz3UkuiILX8/D93BSaOCUzrIYQ9vk
X-Received: by 2002:a17:906:3084:: with SMTP id 4mr9832933ejv.140.1580494609578;
        Fri, 31 Jan 2020 10:16:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580494609; cv=none;
        d=google.com; s=arc-20160816;
        b=vkEdJOZd8jkXSY/RREgnWU+UDa/6apUMM8fatMyVsf3r3fb53DK1dgiCkkT0+L9cRP
         9lt8BLpZR3VVvPKigxrzfUXfqtjWFIepwQqEng+MUyJod28UYtO9VC3TjI7nfzarA9Cw
         AOc+LLZURTz2W/ne8yRX5XRXdfRhj8zEehTawBXC8B+oS/4aFt2ICUtky43HSuF87xky
         UeAhDqDvEcySgaupwCNE4QyBdp1iZv3jzBo574D+Hh8N3uHmQ+8e0UYf4m1TYCvlUraz
         CACXpSFCfCYcHYUV0fg6KhtEdrJ+3dwrgOQ7Cj4s5L8NZj1+hdL9yIj2oN7vsOUsis4e
         iKFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=vK+euhUQo09I8h8WV16nc9uQPWfknpU25hSlqYYwpFQ=;
        b=A1T5W9XxTy5cPahEVDqB7HeHp43DimEUS4wFSIbcyZZMFKFOyKSWKnlgciQ9IO0Wqo
         FG862HVaUJPe/wMYcgRDPLZWQKOviRxYgbzhJFq+jCHa1JLY90sYVzTW/fvz0MwBebSI
         bFicVmGR2IY9fWSoGhqde0G1L13k7vNf0f5GO32laydDl05elmLKXO6d9DH36Pb4kntT
         bC9yM55KF7wFqmoF+k01jNYdvjyucwS9fPoNHe+/P61ve0wcEp09FBQI2aaD+dAEHSA3
         V8jmIQdqr1x2KrCMZJAj0XKQ9xHgL4VW4/pfrKQhpwvrryza2ZyMgFeTQF/OGBqaaUU8
         7fTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aUBjfwWd;
       spf=pass (google.com: domain of wainersm@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wainersm@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id i15si5326003ejz.397.2020.01.31.10.16.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jan 2020 10:16:49 -0800 (PST)
Received-SPF: pass (google.com: domain of wainersm@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aUBjfwWd;
       spf=pass (google.com: domain of wainersm@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580494608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vK+euhUQo09I8h8WV16nc9uQPWfknpU25hSlqYYwpFQ=;
	b=aUBjfwWdp9/AK0sU2WZkVWecudbKvCM4gv+u4oRmSauzwVShbRgxmQ5AxWS3cqOvxkRvFA
	hrnQNZ/dCYP4i6YIfP9PDh3MoBqkdILdKZsEfcbffOrvr430g9kkist8osI3YORpJXPWOL
	TB0rNv2Rp8q63T02LsK+K1hSnhcNVUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-J_mY-WUoNoChvdPVN3WSGg-1; Fri, 31 Jan 2020 13:16:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE9E8801E67;
	Fri, 31 Jan 2020 18:16:42 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-40.gru2.redhat.com [10.97.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 79490100EBA8;
	Fri, 31 Jan 2020 18:16:37 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add a test for the integratorcp arm
 machine
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200131170233.14584-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <0be9d317-2d02-485d-0ce9-06e243e94355@redhat.com>
Date: Fri, 31 Jan 2020 16:16:35 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200131170233.14584-1-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: J_mY-WUoNoChvdPVN3WSGg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ELBUxGPSbGJN


On 1/31/20 3:02 PM, Thomas Huth wrote:
> There is a kernel and initrd available on github which we can use
> for testing this machine.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS                                  |  1 +
>   tests/acceptance/machine_arm_integratorcp.py | 43 ++++++++++++++++++++
>   2 files changed, 44 insertions(+)
>   create mode 100644 tests/acceptance/machine_arm_integratorcp.py

This was piece of cake! ;)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6e4976d366..6a03835037 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -599,6 +599,7 @@ S: Maintained
>   F: hw/arm/integratorcp.c
>   F: hw/misc/arm_integrator_debug.c
>   F: include/hw/misc/arm_integrator_debug.h
> +F: tests/acceptance/machine_arm_integratorcp.py
>   
>   MCIMX6UL EVK / i.MX6ul
>   M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/tests/acceptance/machine_arm_integratorcp.py b/tests/acceptance/machine_arm_integratorcp.py
> new file mode 100644
> index 0000000000..4f9ab40f2f
> --- /dev/null
> +++ b/tests/acceptance/machine_arm_integratorcp.py
> @@ -0,0 +1,43 @@
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
> +class IntegratorMachine(Test):
> +    """Boots the Linux kernel and checks that the console is operational"""
> +
> +    timeout = 90
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
> +    def test_integratorcp(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:integratorcp
> +        """
> +        kernel_url = ('https://github.com/zayac/qemu-arm/raw/master/'
> +                      'arm-test/kernel/zImage.integrator')
> +        kernel_hash = '0d7adba893c503267c946a3cbdc63b4b54f25468'
> +        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
> +
> +        initrd_url = ('https://github.com/zayac/qemu-arm/raw/master/'
> +                      'arm-test/kernel/arm_root.img')
> +        initrd_hash = 'b51e4154285bf784e017a37586428332d8c7bd8b'
> +        initrd_path = self.fetch_asset(initrd_url, asset_hash=initrd_hash)
> +
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-initrd', initrd_path,
> +                         '-append', 'printk.time=0 console=ttyAMA0')
> +        self.vm.launch()
> +        wait_for_console_pattern(self, 'Log in as root')
