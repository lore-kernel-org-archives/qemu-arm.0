Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1379685lfy;
        Wed, 12 Aug 2020 05:19:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyq0ntH7v5XkgjD6Ku2bkPOnJ7g2gjBD8hTmq0/rN2SiQl+ks5QN1gFC6vuM3Rq7Nexahej
X-Received: by 2002:a17:906:7f0b:: with SMTP id d11mr32924580ejr.116.1597234792427;
        Wed, 12 Aug 2020 05:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597234792; cv=none;
        d=google.com; s=arc-20160816;
        b=EDAT5zvVCUeqLmP4/8dQkff2qB7nQQN8HXqtgKNKrgcVbt+YDjJRqmXv/EG2iMGcln
         SnxUznHwOo9282cMv9X22463PiKKcNTCBGB3RRMyRJdl4nbuKaP6eWU6QCA9RJ7MEdTu
         jlGCxe2OgcnVvrLVnJ2XZdjeKz3pCSswUxDr+OYQPYDoWC1rIMabzn1vnm85eSkemSMJ
         rWxKUxGvXzeGz8Mo6064Hfu88HDZQVJY5DSV4pUsm16VNLClG7sCBsH0xXjzhuP6wRTF
         Gtwmvc0Qcyoezr4njO1kvDQgzjEby8uiG63gIuIXBXAxJN8OvJ5alYkQBZlLZAa8lq6f
         K2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=989288FbIlvacuy6N/3Yg9uqNHxm/HXXkikvRLzl2jc=;
        b=AqppmaQxqoMZtCWxZb5yhNniP1+gpgMLouFaSr2SiC+xLXrfZm00KLZkkh3G3h6UL8
         Eqny2KEaS5T5e8U+g664CkgHbXoCQnDEY7FHsX3tZP/J/7v2Ukay1RJi9GddcvmbkmC/
         J/MrecvORUjIwvW2ZPdcMjAmsF8JLwD8VVVn970e4i/UV7BqT6q1AKMgXH33Y0sLKA6J
         lD6qMZ/f56hxev7K4gQpw6WuFGtjbY0Th3DEDSAX652cd6zTTbKRGMGGkNr2hdAWJ93D
         ZLLHAbi+UU/2RaOftObk7pBBOdzQwANqV7+96hCzyHBtYRZ/nS8+1gB1J7IjQurZeQ8g
         gJnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MO4AQinc;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id f20si967196ejx.474.2020.08.12.05.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Aug 2020 05:19:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MO4AQinc;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597234791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=989288FbIlvacuy6N/3Yg9uqNHxm/HXXkikvRLzl2jc=;
	b=MO4AQincVCeIA0JdrudHbEwYkUlTv25EIPC02mwyY7o7ykep4xBs0keSiSGqZENbyAoAoV
	Po1cjl1HJBK8RgG6I2qdw411r35SeVJ+0njAZhUY+AwTQLyAuzSCBTdWRbznOdPbIR3a/y
	g0nNL/nLLDT5BexFuNH2/KfG2tjmRno=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-UGPqovNlPmS4fHADMqtpjw-1; Wed, 12 Aug 2020 08:19:48 -0400
X-MC-Unique: UGPqovNlPmS4fHADMqtpjw-1
Received: by mail-wm1-f69.google.com with SMTP id h205so836469wmf.0
        for <alex.bennee@linaro.org>; Wed, 12 Aug 2020 05:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=989288FbIlvacuy6N/3Yg9uqNHxm/HXXkikvRLzl2jc=;
        b=QiZu8AicctRlL2vIkIFuWqYxq6EUTwJITBwAqXgjCKrI1ws3NvQanIX8yv/WsXTpUf
         isLtSHYAa+m4xEpAFUDHdC13FsVVoguGzTCivZESf/TFvo4lQvMtjW5Ov9KA6YQUwDBf
         2J0+bK5juXMTGSjLKoLdGtwrOXyr4kNHPLnKN/pQtymy4TFj7kX/V8H4gXtgfQd/qdcb
         UZ5YZmO/sngAMdnZ4XRbKi+whctNpeR0q5/sVp3KlYKpR/EXgVKtZK1c5ATcWA2+R6n6
         47+FtApq9DIFzM8hwnLuRyVNa5R4AZdBaNOTNCB/ywEZoapvYmvaqvS5MPvAqitzhlkc
         6V2w==
X-Gm-Message-State: AOAM531SOVabgiIG0mzFLSgod+WSWzbuWpMeoHKhlRpC5MbWia7+KbAk
	hY/a1ZrUx68f+RIJU8b0+zrbs2Q/7MUY0DTnrY43GLc8a8sqHns+6QGgXbHt8S8g6QwSsJSnbup
	gMIdK5kKEDgN6CJJu
X-Received: by 2002:a1c:6707:: with SMTP id b7mr8010375wmc.97.1597234786854;
        Wed, 12 Aug 2020 05:19:46 -0700 (PDT)
X-Received: by 2002:a1c:6707:: with SMTP id b7mr8010350wmc.97.1597234786568;
        Wed, 12 Aug 2020 05:19:46 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id u204sm3800016wmg.9.2020.08.12.05.19.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2020 05:19:45 -0700 (PDT)
Subject: Re: Acceptance Test BootLinuxAarch64.test_virt_tcg execution times
To: Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200806193553.GA1463846@localhost.localdomain>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <e1eab172-5f29-dd54-c78a-fc76216fe97c@redhat.com>
Date: Wed, 12 Aug 2020 14:19:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200806193553.GA1463846@localhost.localdomain>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-TUID: +Q6HK1/XXkeY

On 8/6/20 9:35 PM, Cleber Rosa wrote:
> TL;DR: This is a followup from an IRC chat about the
> tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg test
> taking many orders of magnitute longer than other acceptance (and even
> similar boot) tests.  I could not find an easy way for this specific
> test (aarch64+tcg) to have a significant execution time improvement.
> The best solution may be to filter out tests that are known to be
> slow, and create a specific "test job" that includes them.
> 
> Fisrt, if it's not clear, this specific test runs QEMU with TCG and
> boots a Fedora 31 "cloud image" and waits until the cloud-init agent
> notifies the test that the boot is over.
> 
> Out of the four archtiectures tested with the same approach under
> "tests/acceptance/boot_linux.py", aarch64 was special, in the sense
> that many Linux "cloud images" got stuck very late in the boot
> process.  What seemed to be a disk activity within the guest that
> seemed to make the kernel drain its random number sources if my memory
> serves me right.  Giving the machine a RNG device fixed it.  This can
> still be verified Today if you comment the virtio-rng lines in the
> aarch64 test.
> 
> So, even with the RNG device and the boot process not getting stuck, a
> lot of the test time is spent with QEMU actively using CPU time
> produced by the guest boot process.  This may or may not be the cause
> for the slowness.

I believe this is related to the issue Richard recently addressed:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg729216.html

> 
> One approach to have a shorter test time, would be to reduce the
> things that happen during the guest boot process.  Choosing a minimal
> guest, such as CirrOS, would be an example of such a solution, but:
> 
> * With less things happening during the guest boot, less things
>   get tested within QEMU;
> 
> * CirrOS can not make use of the same boot cloud-init configuration
>   and boot verification the test currently uses;
> 
> So that leaves other non-minimal Linux "cloud images" as options.  But
> still, the following things are required or nice to have:
> 
> * Support for cloud-init;
> 
> * Support for as many as possible architectures;
> 
> * Wide user base;
> 
> * Be thoroughly tested with this "boot_linux.py" test
> 
> So in the end, I picked Fedora 31, which was available and behaved
> well for four different architectures with and without KVM. Today, I
> verified if switching distros would provide an "easy fix", but the
> results were negative.  Any ideas on how to improve the test execution
> times are appreciated.
> 
> For the record, one of the ways we're trying to improve the overall
> test experience is to allow tests to run in parallel (expected to be
> fully supported on the upcoming version 81.0).
> 
> For those interested, these are the numbers I got, and how I tested
> with other distros.  I'm using QEMU e1d322c405 with a vanilla
> configure under a x86_64 Fedora 32 host.
> 
> Fedora 31 (baseline):
> ====================
> 
>   $ make check-venv
>   $ ./tests/venv/bin/avocado run -t arch:aarch64,accel:tcg --keep-tmp on -- tests/acceptance/boot_linux.py{,,,,}
>   JOB ID     : 14802f9d5016a44d2937ed7b1fec63b2eaa06e89
>   JOB LOG    : /home/cleber/avocado/job-results/job-2020-08-06T13.19-14802f9/job.log
>    (1/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (153.12 s)
>    (2/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (149.57 s)
>    (3/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (154.45 s)
>    (4/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (148.97 s)
>    (5/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (150.70 s)
>   RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>   JOB TIME   : 757.50 s
> 
> Fedora 32:
> ==========
> 
> 1. Tweak version and image hash:
> 
> ---
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> index 0055dc7cee..44c62bd4a2 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -48,7 +48,7 @@ class BootLinuxBase(Test):
>              image_arch = 'ppc64le'
>          try:
>              boot = vmimage.get(
> -                'fedora', arch=image_arch, version='31',
> +                'fedora', arch=image_arch, version='32',
>                  checksum=self.chksum,
>                  algorithm='sha256',
>                  cache_dir=self.cache_dirs[0],
> @@ -160,7 +160,7 @@ class BootLinuxAarch64(BootLinux):
>      :avocado: tags=machine:gic-version=2
>      """
>  
> -    chksum = '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'
> +    chksum = 'b367755c664a2d7a26955bbfff985855adfa2ca15e908baf15b4b176d68d3967'
>  
>      def add_common_args(self):
>          self.vm.add_args('-bios',
> ---
> 
> 2. Download the image before the test:
> 
>   $ ./tests/venv/bin/avocado vmimage get --distro=fedora --arch aarch64 --distro-version=32
>   The image was downloaded:
>   Provider Version Architecture File
>   fedora   32      aarch64      /tmp/data/cache/by_location/7049001631a4b2eabf5766cc110e66d486e09821/Fedora-Cloud-Base-32-1.6.aarch64.qcow2
> 
> 3. Run the tests:
> 
>   $ ./tests/venv/bin/avocado run -t arch:aarch64,accel:tcg --keep-tmp on -- tests/acceptance/boot_linux.py{,,,,}
> JOB ID     : 09e740a41dc400f9fcbb9253f613734597fe0efc
> JOB LOG    : /home/cleber/avocado/job-results/job-2020-08-06T13.53-09e740a/job.log
>  (1/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (162.06 s)
>  (2/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (167.78 s)
>  (3/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (166.98 s)
>  (4/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (171.13 s)
>  (5/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (167.43 s)
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 836.05 s
> 
> Ubuntu 20.04:
> =============
> 
> 1. Tweak version and image hash:
> 
> ---
> diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
> index 0055dc7cee..03c0e1bee9 100644
> --- a/tests/acceptance/boot_linux.py
> +++ b/tests/acceptance/boot_linux.py
> @@ -48,7 +48,7 @@ class BootLinuxBase(Test):
>              image_arch = 'ppc64le'
>          try:
>              boot = vmimage.get(
> -                'fedora', arch=image_arch, version='31',
> +                'ubuntu', arch=image_arch, version='20.04',
>                  checksum=self.chksum,
>                  algorithm='sha256',
>                  cache_dir=self.cache_dirs[0],
> @@ -160,7 +160,7 @@ class BootLinuxAarch64(BootLinux):
>      :avocado: tags=machine:gic-version=2
>      """
>  
> -    chksum = '1e18d9c0cf734940c4b5d5ec592facaed2af0ad0329383d5639c997fdf16fe49'
> +    chksum = '1d9e50f3381145835b11911adf611f455d674a570814086b7d6581ecc0718770'
>  
>      def add_common_args(self):
>          self.vm.add_args('-bios',
> ---
> 
> 2. Download the image before the test:
> 
>   $ ./tests/venv/bin/avocado vmimage get --distro=ubuntu --arch aarch64 --distro-version=20.04
>   The image was downloaded:
>   Provider Version Architecture File
>   ubuntu   20.04   arm64        /tmp/data/cache/by_location/19db8c6d910a3f2660c4109ffb85d73d43e5cdf2/ubuntu-20.04-server-cloudimg-arm64.img
> 
> 3. Run the tests:
> 
>   $ ./tests/venv/bin/avocado run -t arch:aarch64,accel:tcg --keep-tmp on -- tests/acceptance/boot_linux.py{,,,,}
>   JOB ID     : 92a1bdbb5e933e6dff8b882808a191f1de3c2600
>   JOB LOG    : /home/cleber/avocado/job-results/job-2020-08-06T12.13-92a1bdb/job.log
>    (1/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (341.40 s)
>    (2/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (345.82 s)
>    (3/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (335.91 s)
>    (4/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (320.32 s)
>    (5/5) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_tcg: PASS (319.79 s)
>   RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>   JOB TIME   : 1663.92 s
> 
