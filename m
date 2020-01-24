Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1080209lfp;
        Fri, 24 Jan 2020 13:28:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqx6KxrdFIukJwc0VvhQAb+sSbXme3AEcn8N+FBD6xHk9nEh0+zWapVdAvK3JMv8Njnc8u61
X-Received: by 2002:a5b:ec4:: with SMTP id a4mr3807015ybs.460.1579901305496;
        Fri, 24 Jan 2020 13:28:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579901305; cv=none;
        d=google.com; s=arc-20160816;
        b=qZhESaJsepG7XgZ9KdCHkOGEfFAk1F3KIgmARYJWmz6YPdHqtgPsiAQ9Xc+kVB17Wj
         HRgEt7w1rDGdemKihTb7zFnBaT8fI/bsEh/HjgkcDV9++9sO6sAdMaZPO09EvYGihjj0
         njnNyy8QySjVV+YUTtViRsqQYEt9AD0yF9oQ55LGGOV/9ak6dVrBwq54FiT1p1yOLwHs
         HyZrmLEeX8Fz2YaWY1kPBa18KW0adx96+EgtJ0Rg0/RLJ+ihbBVeFI1YkGbYrNM8p/MZ
         KakXBLbbQ0UfMxY1zWDhMyNNSUm0lCI+WCQ9a98w6iERqbJyO6+DuKRP986eYpW6UpQW
         Hk3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=MHdnecRYf4mM9JFnSebp4hnxSswXhAnm979xUf63zTE=;
        b=NOHhx+cHBYn6hLtGlFANJR85cDmpOKu5w/mbBpI07rTjZo1vPxHEUVNis2t1Xrte4k
         KiyqDrOQvXV8leDrdoLuI1Ez/3/xWgatldHA3rTTZEHcFwy1V+TFttDv3id1Au4Yof3v
         l35vrkXUBPXynl8ky4zRldV8bA9Lnv1mZxZnh26nx6w950sCZmRBDYwq72XBbzpU5taM
         +swEywMcB7UyevAIiYYutghbGHoeylyzgbqaitenhozuTPjvtS26p8ZiCpsb3gLe18yW
         I0H1dssvzfkKSQZHDkM92hLqSeqOPq3COWjF2PZ8z9/VmkFMtpKtY7W96TVQSHLLXUCu
         nNDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItpBtEY3;
       spf=pass (google.com: domain of wainersm@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wainersm@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id q206si3770109ybg.17.2020.01.24.13.28.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jan 2020 13:28:25 -0800 (PST)
Received-SPF: pass (google.com: domain of wainersm@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItpBtEY3;
       spf=pass (google.com: domain of wainersm@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=wainersm@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579901304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MHdnecRYf4mM9JFnSebp4hnxSswXhAnm979xUf63zTE=;
	b=ItpBtEY3R6l7Ekslkilvf7g6ORkR5DP0jHfApmWYOZ4BBEfM/sjtjHlM0sAcCQ3yy7Gf42
	76GLUddihb6Z9tS6til2cKnrWIsHK0tsOEfN3gSV0Sntn8BQ/2SkuzDeQh3HByNcaXy40j
	l73F1u81E91ZFkSH7l1EgPEtlGJdaFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-RKUPo4bWOzKL9BY0uKakuQ-1; Fri, 24 Jan 2020 16:28:18 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFD7A800D54;
	Fri, 24 Jan 2020 21:28:17 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-27.gru2.redhat.com [10.97.116.27])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C6F9860BE1;
	Fri, 24 Jan 2020 21:28:12 +0000 (UTC)
Subject: Re: [PATCH] tests/acceptance: Add boot tests for some of the QEMU
 advent calendar images
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200124170325.30072-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <8f085a1a-b9df-29d4-db51-eb345a44a971@redhat.com>
Date: Fri, 24 Jan 2020 19:28:10 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200124170325.30072-1-thuth@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: RKUPo4bWOzKL9BY0uKakuQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 7RnAt62gBaHO


On 1/24/20 3:03 PM, Thomas Huth wrote:
> The 2018 edition of the QEMU advent calendar 2018 featured Linux images
> for various non-x86 machines. We can use them for a boot tests in our
> acceptance test suite.
>
> Let's also make sure that we build the corresponding machines in Travis,
> and while we're there, drop the superfluous --python parameter (python3
> is now the only supported version anyway).

Yes, please, removal of --python was in my wish list.

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


Perhaps use MAIN_SOFTMMU_TARGETS in only append the other targets, like:

--target-list=${MAIN_SOFTMMU_TARGETS},alpha-softmmu,sparc-softmmu,....


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
