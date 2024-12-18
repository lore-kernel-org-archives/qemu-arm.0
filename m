Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1057872njk;
        Wed, 18 Dec 2024 08:37:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE0kbQv6DYf+WbHQPMFoNBonADIdN14EoTIOo88hKgrEsSvW3a/ehcsUakjVmW44Uf5UKE+
X-Received: by 2002:a05:620a:27c6:b0:7b6:eba3:2dfa with SMTP id af79cd13be357-7b859623825mr1089255285a.22.1734539875493;
        Wed, 18 Dec 2024 08:37:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734539875; cv=none;
        d=google.com; s=arc-20240605;
        b=Z28XULN9evOkR5o/vkzU0pt90aA5mv3OY+aP/rJ4dtaTXHH1byGkL/WnzaS/SCl8DD
         m0nYM8/l1N1T1UniIcSMnGetw1Q4Mqupoqu9T1FK+yEvX+iT3IiWemj405WMCpH4Cjb6
         raLziv8e2LYb/rwM6lT9fEUENqdec1xyKtZepBpHYZQymKNyLGUyHiQCuVWS+4RS63rQ
         OaLgF7KZssa2nFVEAJ+vE3ZIKF3E3pR7uwqzL4/bGaPaOmxqlG5OiNNfr9I1fq74iRT+
         GaP+0sFD8MyStHf4sV7mrWm3yOA6m12ABa0ny7B5dgNulECPSywwjFcwNAXjEoNs7GYP
         xlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=C8X2KrHI80fuxzEsv+Qv2l5vmUcsdGsELqDKS6sXwzo=;
        fh=9Zke7ipf+XgxgP6XBLMA+c7xIpH91AiCyh1cNrY82/E=;
        b=MVf8WIJ0mMGPiSzA1pwThtseH01mjWRkYLX6vHUJc2JbPfaXqiCZzUQPY8PlR9bd6m
         wVqfDsZ1sP7fyTW7mvGobjLJgkmF04QL33vwamDLnKA0CfQvwoay1MJGQc2LoOYLZ02U
         lHyFKXY8hTWH05qC0hY8wesWTM/HDYwr6YS0/+X6Kq+ogtPA/zfgbzCdYYZ20nHmw62Q
         f5kDSABhSlKwXH2COsbOa1Mv6XLHwMz28keiCj0zi/qUo0d4DE72/wCwkKYuCW6AS8Ph
         HoLHIBIhHmNQU8LtejZDiNwfi3yRB2JgO+X2kC+bysI60bPp20INqQNSWTx8P3aCrbR1
         3vjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CxCHjaFg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b7048f310dsi1209081085a.651.2024.12.18.08.37.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:37:55 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CxCHjaFg;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734539875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=C8X2KrHI80fuxzEsv+Qv2l5vmUcsdGsELqDKS6sXwzo=;
	b=CxCHjaFgmhZjyv+shsmqk/rtMlaio6kDTm4lBEV+dIC+DDUy4OHFPfMML6iXG55LgsBBNq
	CbFJC65z7rMsvXhRrZh310floyfCxmQPM8xnzzGQfkjhX3mt3Dr39SG7oPvHu1kL9h63My
	BoSrcngnkuRZyNVldcS+9mT/GUB4N4o=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-FhumR6tsNi6QwgtfQa0NnQ-1; Wed, 18 Dec 2024 11:37:53 -0500
X-MC-Unique: FhumR6tsNi6QwgtfQa0NnQ-1
X-Mimecast-MFC-AGG-ID: FhumR6tsNi6QwgtfQa0NnQ
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7b6ecd22efbso212925085a.0
        for <alex.bennee@linaro.org>; Wed, 18 Dec 2024 08:37:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734539873; x=1735144673;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8X2KrHI80fuxzEsv+Qv2l5vmUcsdGsELqDKS6sXwzo=;
        b=G10ksiOqSMC3mDGxHOfZAY0W9RA56ZgBSuEQUJuhfxPGxJeysF+WBcJNIMjVoX+A/N
         aG4TvknHO9yhi0UGNzVGx6PqoMgLb17/Q4cwtjhXyFkpHN4GIe+cRf0OVp7WQfgMayP9
         2KzXizGUwRs0yhHoeoki9lec7tShigk5DS6/TWAh6CKXl+N9fZIgFg4hqPrgp7px4WUO
         QxtWZndt5Ltw0NgbfEUH0fu92YXOAx/njkLjJaHR8n9A4JE0kAgG0RbohFZhEItopG7L
         68nDg79bzblcVs8uqwRmdLfe9umlG8agCtqCLCLp3lbaevCw1E5a2f8WRqUFvNLUpUrm
         SCwQ==
X-Gm-Message-State: AOJu0YzoTkvbd9vRxAHK2P8LAQH9aFrkfGlY5FvpSdaS5invAjjYLKkr
	ehJVzazIgTQEwDvPS6/1ES5+HWYEfYsVpvweNrTgNpa6BMnck+/FFd8NXGh9bZ7IKutQMcn9Mb4
	xmqwVivrtwxJ81XZQYPkFD8UhWVzNRyckIsgr5AKh51NRpjZdQovnwvBzwzqfJqsUM0Q+8zwzXe
	m0OliCNQIG8OKrZWopc/ELTDS1JqT3bqe2bA==
X-Gm-Gg: ASbGncvrc61qMe9wxUhyWt1VAS0iVIomAe2M6rWjX3pfTkFaoSC8yuqpLGpUEKOsOcD
	evzxBWhDSeCkDmNDBrYZRSOFPIM9XTWDRY3Ga0UsBPo88/Yr7bPLJmMg+nAQ0E57gKQruMGwlDI
	Uye1Mcfnxe0nSj1W96AQLpBZAp4aJ8v62Go1fV/4dDSDZmaqRe8ad1B7qMnF2SlK2nVEBOpCjeq
	Bnqk3Y5XyyvQngKj2I121z3CWdcJDwn92hgF1/VS0jTRMYWf+jGi5a+pXCKL2F8o5nv93l0YftV
	T+kjdD1aGMco
X-Received: by 2002:a05:620a:394a:b0:7b1:ab32:b71e with SMTP id af79cd13be357-7b8633df343mr551866285a.0.1734539873468;
        Wed, 18 Dec 2024 08:37:53 -0800 (PST)
X-Received: by 2002:a05:620a:394a:b0:7b1:ab32:b71e with SMTP id af79cd13be357-7b8633df343mr551854285a.0.1734539872600;
        Wed, 18 Dec 2024 08:37:52 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-42-49-186.web.vodafone.de. [109.42.49.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047aa66csm444802385a.17.2024.12.18.08.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 08:37:51 -0800 (PST)
Message-ID: <e8d15905-cbfb-4078-87ad-ed4c60e426f0@redhat.com>
Date: Wed, 18 Dec 2024 17:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/27] tests/functional: extend test_aarch64_virt with
 vulkan test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Eric Farman <farman@linux.ibm.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Fabiano Rosas <farosas@suse.de>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Beraldo Leal <bleal@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-arm@nongnu.org,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-s390x@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241218162104.3493551-1-alex.bennee@linaro.org>
 <20241218162104.3493551-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241218162104.3493551-21-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cSfUpaaZYnesMHqWkawEiXL1F-4iB3ZakWgRUZzapL8_1734539873
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ZddjQkR9/hYj

On 18/12/2024 17.20, Alex Bennée wrote:
> Now we have virtio-gpu Vulkan support lets add a test for it.

s/lets/let's/ ?

...
> diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
> index 453e84c39f..4ac66905b8 100755
> --- a/tests/functional/test_aarch64_virt.py
> +++ b/tests/functional/test_aarch64_virt.py
> @@ -13,11 +13,14 @@
>   import os
>   import logging
>   
> +from qemu.machine.machine import VMLaunchFailure
> +
>   from qemu_test import BUILD_DIR
>   from qemu_test import QemuSystemTest, Asset
>   from qemu_test import exec_command, wait_for_console_pattern
> -from qemu_test import get_qemu_img, run_cmd
> -
> +from qemu_test import exec_command_and_wait_for_pattern
> +from qemu_test import has_cmd, get_qemu_img, run_cmd
> +from unittest import skipUnless
>   
>   class Aarch64VirtMachine(QemuSystemTest):
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> @@ -101,7 +104,9 @@ def common_aarch64_virt(self, machine):
>   
>           # Add the device
>           self.vm.add_args('-blockdev',
> -                         f"driver=qcow2,file.driver=file,file.filename={image_path},node-name=scratch")
> +                         "driver=qcow2,file."
> +                         "driver=file,file."
> +                         f"filename={image_path},node-name=scratch")
>           self.vm.add_args('-device',
>                            'virtio-blk-device,drive=scratch')
>   
> @@ -130,5 +135,78 @@ def test_aarch64_virt_gicv2(self):
>           self.common_aarch64_virt("virt,gic-version=2")
>   
>   
> +    ASSET_VIRT_GPU_KERNEL = Asset(
> +        ('https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> +         'download?path=%2F&files='
> +         'Image'),
> +        '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462f6')
> +
> +    ASSET_VIRT_GPU_ROOTFS = Asset(
> +        ('https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> +         'download?path=%2F&files='
> +         'rootfs.ext4.zstd'),
> +        '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
> +
> +    @skipUnless(*has_cmd('zstd'))

Please switch to the new @skipIfMissingCommands() decorate that will be 
provided by Daniel's patches in my pull request from today (it also removes 
has_cmd() so you need to respin this patch as soon as my PR lands).

  Thanks,
   Thomas
