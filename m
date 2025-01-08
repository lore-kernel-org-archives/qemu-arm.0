Received: by 2002:a17:505:d21:b0:1be9:327d:8ee3 with SMTP id vh1csp658816njb;
        Tue, 7 Jan 2025 23:03:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHciuwCDx3zB1omXj0CO5bQ4fH5FZHxE3nLjFSal+PojdAAuRr2g0cGeXAcMrIU/T1zDayZ
X-Received: by 2002:ac8:58c9:0:b0:467:61c1:df3e with SMTP id d75a77b69052e-46c7102cb1dmr21390871cf.30.1736319816494;
        Tue, 07 Jan 2025 23:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736319816; cv=none;
        d=google.com; s=arc-20240605;
        b=IadPuYCYzALA5/vGCG1DBli/tsCP50KYwYs9Fbjh7GvcPKyoyMbP48iDTgDlkR1awr
         xvtemiNVHU9S4nue2wo5vh7TwA7y2MNLaBCAcYkZ/OuRMpRQXMsPQXeQdHIlA8IUaUBK
         r0MJJ66L6NaB/754ahf6jvwZIdwTbk1q2Ei7zct7+Sq5tuL+oWTyLwnBeItNjsQgnYSw
         1YDQZMCpYgEDMRp/Fpl5HOzOkXKDV1x3+ncyUAX1JPBn+KK63e2h3zXqeYsQHDPTk7y3
         EuvTFnpFY8uyWikmJD0/Ytgigdqaj5HwGBociH3L3G3r19XCB3sitlO5Adi8FrrlN0xt
         sNFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=NatfcuudAJ8cyj0CEfSoHFM2avWlrQG2di0+ZhF3h54=;
        fh=sANZkUZC6MKnhiWDQo2GZcy6gQ38YYjN+b7Qwq+md2s=;
        b=ehjv5X4cxly7sXaiH/72KW4VrNohRocGsD73hGJAABXcDiWiZapKxDUNzshGNzP1y5
         zVBQkF2aXhDHq0XauA+7jw7P515OOqOaurhksn1i5nhUW4XULazGKzY7BFwZEDmk+RCn
         7plpqlJgREZg+rk/TmlGpeD/QD8BOT8RzvL38apXtQC9BWoq2fU09r6QW0l9zeLjLKbF
         nMjW+Qdc6kz+ASgKET6bxT7FnJizEHn28KYy2XPBQwr0QLdrdPUJgPTNBP2CSf+syK2C
         zgzgLFIsThlHF/rY66gTyMbtCax+s6DvM5jmphvKqTpS87uuDoNRlxZ3YgkvAn/JkyJB
         QYjw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T6xZ1sjw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3e680894si516611011cf.34.2025.01.07.23.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:03:36 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T6xZ1sjw;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736319816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NatfcuudAJ8cyj0CEfSoHFM2avWlrQG2di0+ZhF3h54=;
	b=T6xZ1sjwc21b64wxJsQuGtcmlJoH3Duj1GaPpDzKdGmNrQW72SpTnSj56pkTEhqV29/9dv
	js+5ndiWxBgB+2FTAn3D0UTKVfelEiwhKatgmUYP1+lVNDts3r+IcyU7k7H0XSq1K1fBBs
	vVuoeysTp9AMRylsng5KBoVy3PJIF8I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-K5FOJfz6N7OTDNWJ6V-0Lg-1; Wed, 08 Jan 2025 02:03:33 -0500
X-MC-Unique: K5FOJfz6N7OTDNWJ6V-0Lg-1
X-Mimecast-MFC-AGG-ID: K5FOJfz6N7OTDNWJ6V-0Lg
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-aaf8396f65fso601710766b.0
        for <alex.bennee@linaro.org>; Tue, 07 Jan 2025 23:03:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319813; x=1736924613;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NatfcuudAJ8cyj0CEfSoHFM2avWlrQG2di0+ZhF3h54=;
        b=TPW+foaj4ZawhPcwyUmu57pB2b+c76wlSj0+k8KdJxodL9XeMmE1jQVLtdidGohDJH
         bSgYUhkPOexSAnxbedG+vS6iuDzlaxDLNazAhw1PafPwOJR9qGDPz0Yt7W67X4Y3DMHS
         wuQbcpvLxPEHLIkPt00cRNjlfeQpIKujFRT/gkiXQtXNDB8Hs0ZRfAY/eMvsl3s7VNpe
         B3PYYdVeLsd9N3ZsPA9hBJNl6uqvSwIJ07OtGiO4V5lAksuRSkO6dC6psZGmu2lQP3I2
         i1c5CieaKiP76tvWcmzwDBBVIwiEaHijOj15BMRyJaavfVR7ysWAcKF2eF0SpstnW2vY
         jQWQ==
X-Gm-Message-State: AOJu0YwQNCS9oQR9bzSXnh7OlJC8MhFu+jdwA+yopXY8BPtyGn/axqTc
	aFOj4JY0FZynajeksyj8hqTNDgGea88zC8Em6D/lPv1Eghw9SxktmR8WF+Scwg6JyZ1GVDupotG
	cxwfn6u40CFgEBHM3aeHAGLmYcY7XZvFADIvFIuvHKCTD4f5x0k12kFVT9gyUi/02j4DcVHCJwx
	gRi4j9233Y6M4t7u7T8BNeXh4igDrRRaZd0A==
X-Gm-Gg: ASbGncu6Ct7ZvWp8Y/oG5+HqsxCinqiE6wTCLncGNy8FBTkxVhM+0Tl2gO/R7+NW65t
	FaklKJjMXJ7lKyvoJ8X98sRhyReCN0z34oJTM/dfbyTXlLCGgeDIHdGapYpSGlfyXZ2BVnuvXo9
	cREgTr1d3j/JOJIyYKPfPi6wKmn382lGGlNUeqaU0cyYZ4v1FmhpplWJFGtV1urr3u3D/x4f5M8
	dtHe0tarCHe/tHRfMKZTnTU5a7kFoF+RQFLbux7Spv+RgyZ2vbxY+y0I8+EEq2iKBhss/bTHFZv
	/Do7sANL5bvA
X-Received: by 2002:a17:907:2d08:b0:aac:278:98fd with SMTP id a640c23a62f3a-ab2ab6a3f9dmr119370766b.17.1736319812652;
        Tue, 07 Jan 2025 23:03:32 -0800 (PST)
X-Received: by 2002:a17:907:2d08:b0:aac:278:98fd with SMTP id a640c23a62f3a-ab2ab6a3f9dmr119364266b.17.1736319812075;
        Tue, 07 Jan 2025 23:03:32 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.7] (ip-109-42-49-182.web.vodafone.de. [109.42.49.182])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e894f2esm2491667166b.69.2025.01.07.23.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 23:03:31 -0800 (PST)
Message-ID: <f714ab7d-0056-4fd7-9804-62f669b50fcc@redhat.com>
Date: Wed, 8 Jan 2025 08:03:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/29] tests/functional: extend test_aarch64_virt with
 vulkan test
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Beraldo Leal <bleal@redhat.com>, Ed Maste <emaste@freebsd.org>,
 Halil Pasic <pasic@linux.ibm.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Nicholas Piggin <npiggin@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-riscv@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Fabiano Rosas <farosas@suse.de>,
 Weiwei Li <liwei1518@gmail.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 qemu-arm@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Eric Farman <farman@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20250107165208.743958-1-alex.bennee@linaro.org>
 <20250107165208.743958-21-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250107165208.743958-21-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -UwYfHfh2GjEnUJEW383cIvyJ_H4mM7nQ_p1d8h5yu8_1736319813
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Qr6muJDtjD5Q

On 07/01/2025 17.51, Alex Bennée wrote:
> Now we have virtio-gpu Vulkan support lets add a test for it.

I'm not a native speaker, but maybe rather:

Now that we have virtio-gpu Vulkan support, let's add a test for it.

?

...
> diff --git a/tests/functional/test_aarch64_virt.py b/tests/functional/test_aarch64_virt.py
> index 2d9995a95d..bb68048537 100755
> --- a/tests/functional/test_aarch64_virt.py
> +++ b/tests/functional/test_aarch64_virt.py
> @@ -13,11 +13,14 @@
>   import logging
>   from subprocess import check_call, DEVNULL
>   
> +from qemu.machine.machine import VMLaunchFailure
> +
> +from qemu_test import BUILD_DIR
>   from qemu_test import QemuSystemTest, Asset
> -from qemu_test import exec_command_and_wait_for_pattern
> +from qemu_test import exec_command, exec_command_and_wait_for_pattern
>   from qemu_test import wait_for_console_pattern
>   from qemu_test import get_qemu_img
> -
> +from qemu_test import skipIfMissingCommands, get_qemu_img
>   

Daniel recently tried to standardize two empty lines between the import and 
class statements, so could you please keep the empty line here?

>   class Aarch64VirtMachine(QemuSystemTest):
>       KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
> @@ -73,15 +76,16 @@ def common_aarch64_virt(self, machine):
>           Common code to launch basic virt machine with kernel+initrd
>           and a scratch disk.
>           """
> +        self.set_machine('virt')
> +        self.require_accelerator("tcg")

Thanks for moving this to the beginning of the function!

>           logger = logging.getLogger('aarch64_virt')
>   
>           kernel_path = self.ASSET_KERNEL.fetch()
>   
> -        self.set_machine('virt')
>           self.vm.set_console()
>           kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>                                  'console=ttyAMA0')
> -        self.require_accelerator("tcg")
>           self.vm.add_args('-cpu', 'max,pauth-impdef=on',
>                            '-machine', machine,
>                            '-accel', 'tcg',
> @@ -102,7 +106,9 @@ def common_aarch64_virt(self, machine):
>   
>           # Add the device
>           self.vm.add_args('-blockdev',
> -                         f"driver=qcow2,file.driver=file,file.filename={image_path},node-name=scratch")
> +                         "driver=qcow2,file."
> +                         "driver=file,file."

The line breaks look weird here. I'd rather start a new line after the 
comma, not after the dot...? (also the changes look rather unrelated to the 
patch subject?)

> +                         f"filename={image_path},node-name=scratch")
>           self.vm.add_args('-device',
>                            'virtio-blk-device,drive=scratch')
>   
> @@ -131,5 +137,73 @@ def test_aarch64_virt_gicv2(self):
>           self.common_aarch64_virt("virt,gic-version=2")
>   
>   
> +    ASSET_VIRT_GPU_KERNEL = Asset(
> +        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> +        'download?path=%2F&files='
> +        'Image',
> +        '89e5099d26166204cc5ca4bb6d1a11b92c217e1f82ec67e3ba363d09157462f6')
> +
> +    ASSET_VIRT_GPU_ROOTFS = Asset(
> +        'https://fileserver.linaro.org/s/ce5jXBFinPxtEdx/'
> +        'download?path=%2F&files='
> +        'rootfs.ext4.zstd',
> +        '792da7573f5dc2913ddb7c638151d4a6b2d028a4cb2afb38add513c1924bdad4')
> +
> +    @skipIfMissingCommands('zstd')
> +    def test_aarch64_virt_with_gpu(self):
> +        # This tests boots with a buildroot test image that contains
> +        # vkmark and other GPU exercising tools. We run a headless
> +        # weston that nevertheless still exercises the virtio-gpu
> +        # backend.
> +
> +        self.set_machine('virt')
> +        self.require_accelerator("tcg")
> +
> +        kernel_path = self.ASSET_VIRT_GPU_KERNEL.fetch()
> +        image_path = self.uncompress(self.ASSET_VIRT_GPU_ROOTFS, format="zstd")
> +
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'console=ttyAMA0 root=/dev/vda')
> +
> +        self.vm.add_args("-accel", "tcg")
> +        self.vm.add_args("-cpu", "neoverse-v1,pauth-impdef=on")
> +        self.vm.add_args("-machine", "virt,gic-version=max",
> +                         '-kernel', kernel_path,
> +                         '-append', kernel_command_line)
> +        self.vm.add_args("-smp", "2", "-m", "2048")
> +        self.vm.add_args("-device",
> +                         "virtio-gpu-gl-pci,hostmem=4G,blob=on,venus=on")
> +        self.vm.add_args("-display", "egl-headless")
> +        self.vm.add_args("-display", "dbus,gl=on")
> +        self.vm.add_args("-device", "virtio-blk-device,drive=hd0")
> +        self.vm.add_args("-blockdev",
> +                         "driver=raw,file.driver=file,"
> +                         "node-name=hd0,read-only=on,"
> +                         f"file.filename={image_path}")
> +        self.vm.add_args("-snapshot")
> +
> +        try:
> +            self.vm.launch()
> +        except VMLaunchFailure as excp:
> +            if "old virglrenderer, blob resources unsupported" in excp.output:
> +                self.skipTest("No blob support for virtio-gpu")
> +            elif "old virglrenderer, venus unsupported" in excp.output:
> +                self.skipTest("No venus support for virtio-gpu")
> +            else:
> +                self.log.info("unhandled launch failure: {excp.output}")
> +                raise excp
> +
> +        self.wait_for_console_pattern('buildroot login:')
> +        exec_command(self, 'root')
> +        exec_command(self, 'export XDG_RUNTIME_DIR=/tmp')
> +        exec_command_and_wait_for_pattern(self,
> +                                          "weston -B headless "
> +                                          "--renderer gl "
> +                                          "--shell kiosk "
> +                                          "-- vkmark -b:duration=1.0",
> +                                          "vkmark Score")

The new test looks fine to me!

  Thomas
