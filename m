Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3853587njb;
        Tue, 10 Dec 2024 22:58:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFrOdXMcb0ddKUUy0R0aFo+Nx7i86wlDx9ERHuH0NlznNDkYZSuuUzJWuu/Y5HVTFH0u/Nh
X-Received: by 2002:a05:6602:342a:b0:841:8345:5eed with SMTP id ca18e2360f4ac-844ccf773f8mr194542139f.0.1733900288091;
        Tue, 10 Dec 2024 22:58:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733900288; cv=none;
        d=google.com; s=arc-20240605;
        b=GAi3KVRivyccdkQgLQ27pDl0QCCxO7kuqYTSAOC8OyUqU6fw/buT29/DnzwoAvnuuG
         IXqMB3RRp56IO6q3L9IyDRMTyUd1N31b0LPW+iHiLTAjlJLLqeFRvTx3/SiqRQOz73A7
         Gt0h/2XEo7i38SMjpfu3Ob3vZUEQ77UsCgno2BVa1QfILZROmw6wUdmJBykOFJrNxosv
         QU4QuWYhs0vK1/cYFkSQ36qH3hwFmZ8ihwqhT7Uk6pDDF0+EZubRsHQh/vvx10yYM45Q
         thpxiWRc5r+yV98BUXJ53nV3UgRbo8qSeVzRQCHyesHu3S+PpuhAZcCcl0ZCHOUcJIFM
         XyqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Gy2n11iGTa9ZiqbyiHBxIp01HGftCyw+zIb9nN+g+e0=;
        fh=p4TgAEIBsE47d+3ho4vV39JSs5yvgZfZgnJxtoN9Gq8=;
        b=XXjsz/Z2mx5O+hHAC9kxwr2etVSWVyAEXsOfywVw8O4hT6Mf+Pv1aO8cgrxhtMoxmA
         i08C/cQSs7dofU7CgH+fHrjFrxM7YxJjMQ4zGprfCgpN6uiBURYQRIxJ3t4xMClHAmP+
         C6JFUbX3dZjbhz8e89rya2Ciya0wxdJVEvl1v3bEouUMGd9k2krLioQj1kgljwRNtWCZ
         wjMxuWpyo9at3uaXuGeZ7KQ3xgv1RpcMKho9aUJnuKl/62fYObaTjN6Y4f1W3EBaHTdJ
         VxDCblqyAC31Nh6+klmJoBCM7h3D3VCpppWablUjI/vlEDxxpW0QqDSoKe96O0jZYF1D
         q4TA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NsNkmKxF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id ca18e2360f4ac-844cd2d8d6esi55835539f.49.2024.12.10.22.58.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 22:58:08 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NsNkmKxF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733900287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Gy2n11iGTa9ZiqbyiHBxIp01HGftCyw+zIb9nN+g+e0=;
	b=NsNkmKxFVrsLTDTSYwXpOhVk1s0ePU1ExrugMJdYaA4QShmdD0PzlZUf9jhK2q32Q7fhAd
	kEzagl3T3eTiHq8E6DAgNOclxBYBBdqFewT0x7j76RtCeKvCrnAUs+lYTdMJoH//8UoRIj
	3w631WGqjtFthvuZkuTEdJjlhStdQMs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-UgWTP21UOGqCAfYyw07mKw-1; Wed, 11 Dec 2024 01:58:06 -0500
X-MC-Unique: UgWTP21UOGqCAfYyw07mKw-1
X-Mimecast-MFC-AGG-ID: UgWTP21UOGqCAfYyw07mKw
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa68203d288so286778566b.1
        for <alex.bennee@linaro.org>; Tue, 10 Dec 2024 22:58:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733900285; x=1734505085;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gy2n11iGTa9ZiqbyiHBxIp01HGftCyw+zIb9nN+g+e0=;
        b=i8/aI2fBMxUFN4+atIgUFHb+blq0RUUx4wdpQh0yocU8sg0UXNAye3cuGn7ZTkVeAY
         26U2lLrv7IktJg1XsN5qTEwimbNFcVKuC71RAR0lubwB1GN5JG9SxusKPYwaXoqxfx1E
         Q4B73EWzXlBIGfcmsElbZByrYjXXEDk4Gr+h4hZxXLQZ7kwGk1SzguMv6oHW8WSSkmgZ
         sx/j+kmqxQKeJgMmStlKcf4WawcJJlU6UD8MVB3nkwtbbKjyd4l7J6M3G0UA20evLzdn
         Z7BEZz97hHa/+IlA+V7Dg/ipE2aqx1rohIpGhzYE6/zPqUYSHZ7Z7G90fT6OUL32077v
         Jr1w==
X-Gm-Message-State: AOJu0Yz+DEejaAc1IWgKXhb01IivLzSI71akMeTt8OE98sK38TcOuQzY
	7pJ5xd4dp7hM+cCnL75v8GL2rBNW2y3+nWEN9Xw9VRK2DkaGeIVAr+i2KECYi0JWpmMdc+q7kx+
	3qT6hEXTLmJXpx2vRKOOyel4vJ2Z/IphQQkanwawoxYwZ0cSi6/1BCVYeXyGXxnPoodr2MsZarp
	Q90FGFGUCyN9CWGx+FZg/WFWr8QZ1c6W5G/Q==
X-Gm-Gg: ASbGncuBTXsZgagfhIcgNNbmm9jtKU1Sr3OM/HGSgoKcpQUWMJj/Cwla0+gXe/ddoZH
	f38dwJ2tV7eH6IxkqQ01+Bjb1r5qUqlLzWObA22pyQCEJyi60uvH0BOw3/ON3xVPUcc0dn0xAST
	vWVx1coaODmVZkLrLQajtpLmwDp+kEjkA34Di9FHNgpKiyVDIf0skrj/Jjd5nYu7tbkGiCHQ7o8
	XuXmrKSpPYrB6z5pj12CSMFYl9UzN4DOtDIWHXk6my4qFJDB5XfAOFngKs0r6DSmcgXLRN91/mE
	q70SvD0=
X-Received: by 2002:a17:906:328e:b0:aa6:7f3d:4f9b with SMTP id a640c23a62f3a-aa6b11a4696mr102433166b.24.1733900284798;
        Tue, 10 Dec 2024 22:58:04 -0800 (PST)
X-Received: by 2002:a17:906:328e:b0:aa6:7f3d:4f9b with SMTP id a640c23a62f3a-aa6b11a4696mr102427866b.24.1733900284238;
        Tue, 10 Dec 2024 22:58:04 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.6] (ip-109-42-51-17.web.vodafone.de. [109.42.51.17])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa667925953sm597991566b.9.2024.12.10.22.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Dec 2024 22:58:03 -0800 (PST)
Message-ID: <d2a73820-58fa-41d0-8f38-68b0ad53fa7d@redhat.com>
Date: Wed, 11 Dec 2024 07:58:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/20] tests/functional: extend test_aarch64_virt with
 vulkan test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 qemu-s390x@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Weiwei Li <liwei1518@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Cleber Rosa <crosa@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Eric Farman
 <farman@linux.ibm.com>, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Bernhard Beschow <shentey@gmail.com>,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Markus Armbruster <armbru@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241210204349.723590-1-alex.bennee@linaro.org>
 <20241210204349.723590-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241210204349.723590-21-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qjGOfzH8xQSZe3qG30IXERHPPJVV_CEetfwNQLW2tbs_1733900285
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: IIyNFgpYlBcC

On 10/12/2024 21.43, Alex Bennée wrote:
> Now we have virtio-gpu Vulkan support lets add a test for it.
> Currently this is using images build by buildroot:
> 
>    https://lists.buildroot.org/pipermail/buildroot/2024-December/768196.html
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/functional/test_aarch64_virt.py | 83 ++++++++++++++++++++++++++-
>   1 file changed, 80 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
> index 801300607c..25d11e2626 100755
> --- a/tests/functional/test_aarch64_virt.py
> +++ b/tests/functional/test_aarch64_virt.py
> @@ -14,11 +14,12 @@
>   import os
>   import logging
>   
> +from qemu.machine.machine import VMLaunchFailure
> +
>   from qemu_test import BUILD_DIR
>   from qemu_test import QemuSystemTest, Asset
> -from qemu_test import exec_command, wait_for_console_pattern
> -from qemu_test import get_qemu_img, run_cmd
> -
> +from qemu_test import exec_command, wait_for_console_pattern, exec_command_and_wait_for_pattern
> +from qemu_test import has_cmd, get_qemu_img, run_cmd
>   
>   class Aarch64VirtMachine(QemuSystemTest):
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> @@ -125,5 +126,81 @@ def test_aarch64_virt_gicv2(self):
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
> +    def test_aarch64_virt_with_gpu(self):
> +        # This tests boots with a buildroot test image that contains
> +        # vkmark and other GPU exercising tools. We run a headless
> +        # weston that nevertheless still exercises the virtio-gpu
> +        # backend.
> +
> +        (has_zstd, msg) = has_cmd('zstd')
> +        if has_zstd is False:
> +            self.skipTest(msg)

I'd recommend to use a decorator instead:

@skipUnless(*has_cmd('zstd'))

or if Daniel's patch series lands first, switch to @skipIfMissingCommands:

https://lore.kernel.org/qemu-devel/20241129173120.761728-7-berrange@redhat.com/

> +        self.zstd = 'zstd'

You only use self.zstd once, so the detour through a variable seems 
unnecessary here?

> +        image_path_zst = self.ASSET_VIRT_GPU_ROOTFS.fetch()
> +        kernel_path = self.ASSET_VIRT_GPU_KERNEL.fetch()
> +
> +        image_path = self.workdir + "/rootfs.ext4"
> +
> +        run_cmd([self.zstd, "-f", "-d", image_path_zst,
> +                 "-o", image_path])
> +
> +        self.set_machine('virt')

Please move set_machine to the top of the function. Reasoning: It can cancel 
the test if the 'virt' machine has not been compiled into the binary. In 
that case you'd extracted the rootfs image in vain.

> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyAMA0 root=/dev/vda')
> +        self.require_accelerator("tcg")

Same, please move to the beginning since it can skip the test.

> +        self.vm.add_args("-accel", "tcg")
> +        self.vm.add_args("-cpu", "neoverse-v1,pauth-impdef=on")
> +        self.vm.add_args("-machine",
> +                         "virt,virtualization=on,"
> +                         "gic-version=max",
> +                         '-kernel', kernel_path,
> +                         '-append', kernel_command_line)
> +        self.vm.add_args("-smp", "2", "-m", "2048")
> +        self.vm.add_args("-device", "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
> +        self.vm.add_args("-display", "egl-headless")
> +        self.vm.add_args("-display", "dbus,gl=on")
> +        self.vm.add_args("-device", "virtio-blk-device,drive=hd0")
> +        self.vm.add_args("-blockdev",
> +                         "driver=raw,file.driver=file,node-name=hd0,read-only=on,"
> +                         f"file.filename={image_path}")
> +        self.vm.add_args("--snapshot")

Any reason for using double dashes just here and not for the other commands?

> +        try:
> +            self.vm.launch()
> +        except VMLaunchFailure as e:
> +            if "old virglrenderer, blob resources unsupported" in e.output:
> +                self.skipTest("No blob support for virtio-gpu")
> +            elif "old virglrenderer, venus unsupported" in e.output:
> +                self.skipTest("No venus support for virtio-gpu")
> +            else:
> +                self.log.info(f"un-handled launch failure: {e.output}")

s/un-handled/unhandled/ ?

  Thomas
