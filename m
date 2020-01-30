Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2480328lfp;
        Thu, 30 Jan 2020 15:11:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqwJBy/vSA78OikjYAVkYruMykvqvnpz9CkpmQyVu3sIWjaKRbhXNlm8mGJzuNlkGUSZnTmO
X-Received: by 2002:a81:5dc1:: with SMTP id r184mr5598747ywb.433.1580425868861;
        Thu, 30 Jan 2020 15:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580425868; cv=none;
        d=google.com; s=arc-20160816;
        b=EdS5zoUrExi9XeMbMtznuDwVBrk6OHZtveSWCylOiSY7WrnEPAcCV3WRLN35xX8q6M
         yDLxqAqylSY+/V53mWTtyEfiHBNixmNw6R5ztrx9f3AofIZYHkiK1hZIBtolGU0ycB0T
         cPTym4DkzoCuwUxR3r9Jzbait/wgW/3R5QKwz/KbMnrpBU4FsSft6FCfM2FQmmb4NcnN
         ptXa3Bb7PVTwAbNeH+dDfGNw7hcrjIz6QntOBAmv3cZXD34bb5AxGbJ5NfNsqh9M485f
         KLpWqmhmY+YFVYBvbEtGbm986yZ0zJHShqW4eRuo44flguhCqQHr2UK/lscmiCW/BrwF
         AH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=iGYgBklM21RGCI4ogN6CiAlVDJv+ayxsnimdT5Pw9BE=;
        b=WCG8Z72QaAKcBq2wWVGcsOkkfgPo8qhlQrcmXKTnU7kY/9lZDosHz6Nd/efw+rWVBC
         4GV13L8fBYL/0xVl1uAQ1GR0b65QRcuqr8wMcyBPYkB7YMS2blo3N8VUEZJ94/2B++KO
         2R8+SYkBYl5JztAOfH1eHuuAKA9zGzGXp6vLtazV1pzwpQXi0WlHDnw1AL9fsFtnSDoP
         jEbwAEsCge7ixCbrYK7Rh8IQj6/Y2AIk+xb53HLKOj0C9q3haX0N7Twv7zXxgLvIq39Y
         xN8q9xxmAlPSXpesXjE3Usq8H/C7K1aSRYac48EfL2UjH95RK1cEAB1qbqp7FHtbIKK9
         mQwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S6wyWTJw;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id m124si4016371ybb.42.2020.01.30.15.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2020 15:11:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S6wyWTJw;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580425868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iGYgBklM21RGCI4ogN6CiAlVDJv+ayxsnimdT5Pw9BE=;
	b=S6wyWTJwRNHdMyJPJSOG8lYM8dmkKw8oR6M/Tx2ahO6wQ43WfYqIJpTSGsdcGalTOJdSCQ
	ty9XXYsBlksHPruXCAWVXVLj6BPyoAajTjP3TGGOggEQwGjMWKwWtpLg/i46enNEYVFSYq
	szOv65pdfATQH5TpLeze4QAWMPQYQ5s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-Qy_y_0rCOjaj35xQIDMQTQ-1; Thu, 30 Jan 2020 18:11:01 -0500
Received: by mail-wm1-f71.google.com with SMTP id a10so1335729wme.9
        for <alex.bennee@linaro.org>; Thu, 30 Jan 2020 15:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iGYgBklM21RGCI4ogN6CiAlVDJv+ayxsnimdT5Pw9BE=;
        b=SfwTL1HuSTVDhGncSf22LxcF+ofL+xQKGuttw+IOp7ZqNgyLc4jKvfF9hPFgrla1Zn
         W28dpJroR3qbFgyk+MqMSGpKk3WVnnPhiC6GgTi/sAprADbK6LASreGYew0emKCkjmdu
         hiEMzz643jP2vzvcb0DIpi2wR4FpcEkm6d1DTVJvk/B+IuzsgCDGWsDgHCDnE3+pEiHm
         DWeOBlZZlQ5u3XnuHjgOVUElgpdKgxuY95ekjV0vDITmJ6+5uJm8bkhLAmg1QxChQQ+4
         ltLwK3olsmmGMBclHKNroAAY/UB6E8JxrgiX1yOtQQ+KjWnbSYHnqIXeG2ppKtrxlr9g
         Ro7Q==
X-Gm-Message-State: APjAAAUubSvcXYPgBtNOpXgXzPANvzL3oxH7BzSwTtmdFDoJrnqzCxy9
	REDxbPDyk81XvnftKpl+vEI8dQvbe4oOiAZ4ThguIp12Gl4XUuYXJQvdl6vsKF/1H0uk1HpoXLH
	gFOa8Q4ilp2MwJ42K
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr7914442wmg.86.1580425858405;
        Thu, 30 Jan 2020 15:10:58 -0800 (PST)
X-Received: by 2002:a7b:cf01:: with SMTP id l1mr7914429wmg.86.1580425858179;
        Thu, 30 Jan 2020 15:10:58 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.113])
        by smtp.gmail.com with ESMTPSA id z11sm9245907wrt.82.2020.01.30.15.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2020 15:10:57 -0800 (PST)
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200124170325.30072-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2e4ed23c-01f4-3bb5-d7c2-d1b74751ecf1@redhat.com>
Date: Fri, 31 Jan 2020 00:10:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200124170325.30072-1-thuth@redhat.com>
Content-Language: en-US
X-MC-Unique: Qy_y_0rCOjaj35xQIDMQTQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: yw1e4HqpdL3j

On 1/24/20 6:03 PM, Thomas Huth wrote:
> The 2018 edition of the QEMU advent calendar 2018 featured Linux images
> for various non-x86 machines. We can use them for a boot tests in our
> acceptance test suite.
> 
> Let's also make sure that we build the corresponding machines in Travis,
> and while we're there, drop the superfluous --python parameter (python3
> is now the only supported version anyway).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .travis.yml                            |  2 +-
>   tests/acceptance/boot_linux_console.py | 96 ++++++++++++++++++++++++++
>   2 files changed, 97 insertions(+), 1 deletion(-)
> 
> diff --git a/.travis.yml b/.travis.yml
> index 6c1038a0f1..73ca12c921 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -268,7 +268,7 @@ matrix:
>   
>       # Acceptance (Functional) tests
>       - env:
> -        - CONFIG="--python=/usr/bin/python3 --target-list=x86_64-softmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-softmmu,alpha-softmmu,ppc-softmmu,ppc64-softmmu,m68k-softmmu,sparc-softmmu"
> +        - CONFIG="--target-list=aarch64-softmmu,alpha-softmmu,arm-softmmu,m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-softmmu,nios2-softmmu,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,sparc-softmmu,x86_64-softmmu,xtensa-softmmu"
>           - TEST_CMD="make check-acceptance"
>         after_script:
>           - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP")]' | xargs cat
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> index e03add2989..f7ac2a3a59 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -584,3 +584,99 @@ class BootLinuxConsole(Test):
>           self.wait_for_console_pattern(console_pattern)
>           console_pattern = 'No filesystem could mount root'
>           self.wait_for_console_pattern(console_pattern)
> +
> +    def do_test_advcal_2018(self, day, tar_hash, kernel_name):
> +        tar_url = ('https://www.qemu-advent-calendar.org'
> +                   '/2018/download/day' + day + '.tar.xz')
> +        file_path = self.fetch_asset(tar_url, asset_hash=tar_hash)
> +        archive.extract(file_path, self.workdir)
> +        self.vm.set_console()
> +        self.vm.add_args('-kernel',
> +                         self.workdir + '/day' + day + '/' + kernel_name)
> +        self.vm.launch()
> +        self.wait_for_console_pattern('QEMU advent calendar')
> +
> +    def test_arm_vexpressa9(self):
> +        """
> +        :avocado: tags=arch:arm
> +        :avocado: tags=machine:vexpress-a9
> +        """
> +        tar_hash = '32b7677ce8b6f1471fb0059865f451169934245b'
> +        self.vm.add_args('-dtb', self.workdir + '/day16/vexpress-v2p-ca9.dtb')
> +        self.do_test_advcal_2018('16', tar_hash, 'winter.zImage')
> +
> +    def test_m68k_mcf5208evb(self):
> +        """
> +        :avocado: tags=arch:m68k
> +        :avocado: tags=machine:mcf5208evb
> +        """
> +        tar_hash = 'ac688fd00561a2b6ce1359f9ff6aa2b98c9a570c'
> +        self.do_test_advcal_2018('07', tar_hash, 'sanity-clause.elf')
> +
> +    def test_microblaze_s3adsp1800(self):
> +        """
> +        :avocado: tags=arch:microblaze
> +        :avocado: tags=machine:petalogix-s3adsp1800
> +        """
> +        tar_hash = '08bf3e3bfb6b6c7ce1e54ab65d54e189f2caf13f'
> +        self.do_test_advcal_2018('17', tar_hash, 'ballerina.bin')
> +
> +    def test_or1k_sim(self):
> +        """
> +        :avocado: tags=arch:or1k
> +        :avocado: tags=machine:or1k-sim
> +        """
> +        tar_hash = '20334cdaf386108c530ff0badaecc955693027dd'
> +        self.do_test_advcal_2018('20', tar_hash, 'vmlinux')
> +
> +    def test_nios2_10m50(self):
> +        """
> +        :avocado: tags=arch:nios2
> +        :avocado: tags=machine:10m50-ghrd
> +        """
> +        tar_hash = 'e4251141726c412ac0407c5a6bceefbbff018918'
> +        self.do_test_advcal_2018('14', tar_hash, 'vmlinux.elf')
> +
> +    def test_ppc64_e500(self):
> +        """
> +        :avocado: tags=arch:ppc64
> +        :avocado: tags=machine:ppce500
> +        """
> +        tar_hash = '6951d86d644b302898da2fd701739c9406527fe1'
> +        self.vm.add_args('-cpu', 'e5500')
> +        self.do_test_advcal_2018('19', tar_hash, 'uImage')
> +
> +    def test_ppc_g3beige(self):
> +        """
> +        :avocado: tags=arch:ppc
> +        :avocado: tags=machine:g3beige
> +        """
> +        tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
> +        self.vm.add_args('-M', 'graphics=off')
> +        self.do_test_advcal_2018('15', tar_hash, 'invaders.elf')
> +
> +    def test_ppc_mac99(self):
> +        """
> +        :avocado: tags=arch:ppc
> +        :avocado: tags=machine:mac99
> +        """
> +        tar_hash = 'e0b872a5eb8fdc5bed19bd43ffe863900ebcedfc'
> +        self.vm.add_args('-M', 'graphics=off')
> +        self.do_test_advcal_2018('15', tar_hash, 'invaders.elf')
> +
> +    def test_sparc_ss20(self):
> +        """
> +        :avocado: tags=arch:sparc
> +        :avocado: tags=machine:SS-20
> +        """
> +        tar_hash = 'b18550d5d61c7615d989a06edace051017726a9f'
> +        self.do_test_advcal_2018('11', tar_hash, 'zImage.elf')
> +
> +    def test_xtensa_lx60(self):
> +        """
> +        :avocado: tags=arch:xtensa
> +        :avocado: tags=machine:lx60
> +        """
> +        tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
> +        self.vm.add_args('-cpu', 'dc233c')
> +        self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf')
> 

Thanks, applied to my python-next tree:
https://gitlab.com/philmd/qemu/commits/python-next
