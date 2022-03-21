Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp911388lfb;
        Mon, 21 Mar 2022 10:10:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY5oh8i2230uQmxBI5tL/P5mJtdEl2UQi3aMR6iC2Rmb7w2Mxa1pk1CEOAGN83qwl0dEVr
X-Received: by 2002:ac8:5c54:0:b0:2e1:d615:484d with SMTP id j20-20020ac85c54000000b002e1d615484dmr17094265qtj.109.1647882658198;
        Mon, 21 Mar 2022 10:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647882658; cv=none;
        d=google.com; s=arc-20160816;
        b=DAWx8ZSP4iNZNzpUBlDGN3FNjGka4wTjyhA5yH8Gf5w1MKNP60QHaEqeWDI16YLVnR
         Ce4P32mZ+XrYQsZ4yYGQ1JK1WRzd2Cu+gTqkSlc1YqdAnsWz46K0xIvGkqI5MPA1BSWF
         hqhT4IZH8VEMRMr6lnizZ5BQ4NGASUw6cuYpBbZXdPqWW5uE8MfBMTsFzYIVgFju5u8I
         0QEii+2lNh+25vthD+nJtFKFAMl0xvYLKTD36BG5vqVhKfBVV0ewBe1itX6COWxcJpnk
         IdPJXI9l3L5qVqv/Ez4tQPuEUcA/6nAJ9Zami9AcCkI8LSzs2r7ByJuyvt2f+Shz35Jw
         YU7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=x3G6WchGWvyVgp7y1+VYyRvZmCDd0+pELE6d0oFsGNg=;
        b=ki6H4FLVN3GXpu4toknPXLthtA2pY04T2f9EGjvLsVj+rEUDi1B+6VJK4V9Fy0X7rx
         6W9q/N1ja0WCmDhVmR0ICjr4FciTEVcAi01c1pWk36AST97+VYmfAUassiF4ZFmQBiUG
         a7K8zIruSyF+mlYRqawonadyNro6E0Rj/lLqbZ7LBLno3e8KfSWxJpCoDBHTOsFJ1tne
         cY7FN74Phv/Nfs4CRbc0owL83NW3BIOjqtVf9CRLRnchLqBLeoif88JowS/gZtk/Eago
         O+QGp6SnvQy/RkUMZGhi2iDzMqpgqQj89liF1sqJ48/5zu4IJmhX2fxWcgv4dBWSFVHt
         pEPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QAd7EWKI;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id k1-20020a05620a414100b0067e4be23816si2387963qko.91.2022.03.21.10.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Mar 2022 10:10:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QAd7EWKI;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647882657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x3G6WchGWvyVgp7y1+VYyRvZmCDd0+pELE6d0oFsGNg=;
	b=QAd7EWKILXEWe2ChzF+dCl2Hlzr1DtIBBhNVHj5iocGCJvHoSc1wORkKHZYYVQLmZfaM9a
	VF/IsZZH9uvt0rlqkNF5PaLVMFAnmPm2pN4WSRHcZi+lbw+5B1dMgJyWJ8VOhNWtcE14Sl
	+Mbk6OCEVzGC7NVC5r4rkpaleFd8oUk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-kXmQWKLWMDaKa1Re5ogEDQ-1; Mon, 21 Mar 2022 13:10:53 -0400
X-MC-Unique: kXmQWKLWMDaKa1Re5ogEDQ-1
Received: by mail-wr1-f71.google.com with SMTP id f18-20020adf9f52000000b00203d86759beso3292815wrg.11
        for <alex.bennee@linaro.org>; Mon, 21 Mar 2022 10:10:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=x3G6WchGWvyVgp7y1+VYyRvZmCDd0+pELE6d0oFsGNg=;
        b=lZFov5itYYz2mYfUHNmzd3GRCUi/VUAlVeRkZUBjX8V1q516juWsoxZYWMeRTSmA7d
         qlb3ORswHLCZCfnBZastEzLts6sUguyPyNfpILcGngXuqmnbJ3m4jLLoeXrdi+fkZAmW
         XaODoiYsXrvnbfmZHJ32ogWbpCBQNBoQyfRoa4SpU3BD4+CdboH7XkQXBew/IbuS8A8+
         fdSRy3DRLkUpjDV1plGosw9+q2aaXk/uoxYI6UQ6Ats+Ay6pDKGGJa8DGdBsGnoTLOij
         TA/LIDooiWSsqAq8X96tYDkxav3V8B2hcyCLhNbcJFRF2smOw+o+WN1RSwbX8JRwlysJ
         xRhA==
X-Gm-Message-State: AOAM532MByZqKkY1dFQFuUwKFip2nLosSCdiM1M7ffK90XIY4yDb6pdG
	W301eKblxCN0i/Jt8Td5S5iaOanSMYzbIMrUS/FaFUuddY/qFB83d18tz8bb79H2P5StrrJsfaI
	0f99BtX9aUrU/b463yVMuBSz7UdUM7OwEKVJHpOYQwxxYepm8/c06MjbySzIuU5En
X-Received: by 2002:a5d:6651:0:b0:203:fc53:cf22 with SMTP id f17-20020a5d6651000000b00203fc53cf22mr11702287wrw.365.1647882652305;
        Mon, 21 Mar 2022 10:10:52 -0700 (PDT)
X-Received: by 2002:a5d:6651:0:b0:203:fc53:cf22 with SMTP id f17-20020a5d6651000000b00203fc53cf22mr11702258wrw.365.1647882652008;
        Mon, 21 Mar 2022 10:10:52 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com. [80.187.98.218])
        by smtp.gmail.com with ESMTPSA id c11-20020a05600c0a4b00b0037c91e085ddsm66891wmq.40.2022.03.21.10.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 10:10:51 -0700 (PDT)
Message-ID: <ede500df-5261-ddae-b359-1cc6e051cd07@redhat.com>
Date: Mon, 21 Mar 2022 18:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v1 2/8] tests/avocado: update aarch64_virt test to
 exercise -cpu max
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 sw@weilnetz.de, richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220315121251.2280317-3-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: k/Nd9Y03IyK+

On 15/03/2022 13.12, Alex Bennée wrote:
> The Fedora 29 kernel is quite old and importantly fails when running
> in LPA2 scenarios. As it's not really exercising much of the CPU space
> replace it with a custom 5.16.12 kernel with all the architecture
> options turned on. There is a minimal buildroot initramfs included in
> the kernel which has a few tools for stress testing the memory
> subsystem. The userspace also targets the Neoverse N1 processor so
> will fail without additional v8.x+ features.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220307172249.3125779-1-alex.bennee@linaro.org>
> ---
>   tests/avocado/boot_linux_console.py | 22 ++++++++++++++--------
>   1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
> index 9c618d4809..ca3a40e91d 100644
> --- a/tests/avocado/boot_linux_console.py
> +++ b/tests/avocado/boot_linux_console.py
> @@ -12,6 +12,7 @@
>   import lzma
>   import gzip
>   import shutil
> +import time
>   
>   from avocado import skip
>   from avocado import skipUnless
> @@ -330,25 +331,30 @@ def test_aarch64_virt(self):
>           :avocado: tags=arch:aarch64
>           :avocado: tags=machine:virt
>           :avocado: tags=accel:tcg
> -        :avocado: tags=cpu:cortex-a53
> +        :avocado: tags=cpu:max
>           """
> -        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
> -                      '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
> -                      '/vmlinuz')
> -        kernel_hash = '8c73e469fc6ea06a58dc83a628fc695b693b8493'
> +        kernel_url = ('https://fileserver.linaro.org/s/'
> +                      'z6B2ARM7DQT3HWN/download')
> +
> +        kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
>           kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
>   
>           self.vm.set_console()
>           kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
>                                  'console=ttyAMA0')
>           self.require_accelerator("tcg")
> -        self.vm.add_args('-cpu', 'cortex-a53',
> +        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
>                            '-accel', 'tcg',
>                            '-kernel', kernel_path,
>                            '-append', kernel_command_line)
>           self.vm.launch()
> -        console_pattern = 'Kernel command line: %s' % kernel_command_line
> -        self.wait_for_console_pattern(console_pattern)
> +        self.wait_for_console_pattern('Welcome to Buildroot')
> +        time.sleep(0.1)
> +        exec_command(self, 'root')
> +        time.sleep(0.1)
> +        exec_command(self, 'cat /proc/self/maps')
> +        time.sleep(0.1)

I can't say much about scope of aarch64 testing, but while you're at it, you 
also could move the new test to a separate file, like 
machine_aarch64_virt.py, so that it could be added to MAINTAINERS, too?

  Thomas
