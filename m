Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3612982lfc;
        Mon, 7 Sep 2020 02:59:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvfWefFdeh5HQ+G5JWl8ssRTlZe2QGVzZMCusGIpAODD1SPAlYo7vlX99/icZRSjZeSxlI
X-Received: by 2002:a05:6402:1656:: with SMTP id s22mr15985811edx.160.1599472771082;
        Mon, 07 Sep 2020 02:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599472771; cv=none;
        d=google.com; s=arc-20160816;
        b=JtVtnogATSyPPUFVmzcdWcbpYNVsj4FomWxwgDLTukoTq++WNGMAqHdCfkCLYXeeDl
         Eawod/1V7DUxDY5dbXwe+AeQczYQiUHzDeTwrTi+zEA92xiWE0onnmCF9QoXXcYvIJcG
         JvZxl9abvctd5Ic71Vm+y2kSmkdzhUMMJrlD11ZDx9rTjzWS4XNP3pEek47G6cVSdRyo
         koKf7B5uadDHWtacW9X4Mb4/y5EQkhv9nXijpm4gg1anRe0/uFGmaJ2xX7KE2YxLGCNk
         ZUhlM8pibsPWbAM5RLsaSNK39jXa34R2gq9cKcAwDSxRoYUxkvzWyaD4mnz0YfFILXAB
         GFNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=wnwf+zkh5TJXklbvl8ZnTlo8KhCQaAAgLALx5Yp/PxU=;
        b=hsF5K0E45vH13DRbDn64BNmVNZ3q2xdbVZ26CtbW9ti4b5D2CYhN10K55OnfjlgeRe
         o39uSo2uGgH6MWvcBdhZLvtGSUQSwjGbQbHenyyMjjqJ9yBN+YPGnhmtBVWrp64iaVyp
         H/h7W8W0HojcsAtzcSBbOi5CnZj3ncsRuceHwkzIWnRsDiZceIrfHIw3xsiDQsmMdKW2
         O2KrnlDAnwMjGsUpN09Xxgzdi1R2ANsRUCtH2cKH3D5/2bs2nIdtv/9ECZ/DmVbLfKab
         vJ4/ETzDl1BpuZYwHJ5ls1Z8KEtvdfS+1cGYEbAcmNN+Weh9/jaCXu9L1Hpy7EzNo6s4
         yhPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gWFb9trN;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id ay1si9267296edb.440.2020.09.07.02.59.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 02:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) client-ip=207.211.31.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gWFb9trN;
       spf=pass (google.com: domain of philmd@redhat.com designates 207.211.31.120 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599472769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wnwf+zkh5TJXklbvl8ZnTlo8KhCQaAAgLALx5Yp/PxU=;
	b=gWFb9trNQ95Xs5KKIUkOpdNo7APD6Q+soAJOg8LcpBbxPdL9DAoKSh35ummGAZC3A8OJMH
	BkCiVdmI1AbJa6Uy2qX8qWy/fHI+WyE43o57CoJ6bXu6U5z/02MzR1A0Ve2rdFr9xc054p
	lHiEfAf6GG3JrF50rTa+6QzLOUu+Mx8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-xkM7sP3kML6IaY_H32SXuA-1; Mon, 07 Sep 2020 05:59:23 -0400
X-MC-Unique: xkM7sP3kML6IaY_H32SXuA-1
Received: by mail-wm1-f69.google.com with SMTP id m25so3815902wmi.0
        for <alex.bennee@linaro.org>; Mon, 07 Sep 2020 02:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=wnwf+zkh5TJXklbvl8ZnTlo8KhCQaAAgLALx5Yp/PxU=;
        b=GJeKEU2boqfskEG1b9L3ThQHPp7OGgSepIFr+/yWdgjJwZauY7c2jSdbNQwZoZkIfW
         iz8LbhLUHJT3QUTo9EROPW4rU9sHuRz4gA91/LJvy2vwZ8QpmotCy77PNVZaehDSEn82
         pxg7p6viIcEZJ2D3szL6Zi59QSBHavlZN5W0inqcdvE4CWtI11P7B11y15hrr/b7It+u
         V/XgmOFvKirgN1j/K0NaEOP/q65DqjD3mtqN7MW6InPQ+SJB8wLvfXF8yrNxV/xSjmr3
         /b8xrT2FGHBRxcX7l7nm71BG9O2JLMxtKBJNeKS3xcCe7OOIYW2fbiIGGYeQfIRWwNg0
         PTUw==
X-Gm-Message-State: AOAM531Tk1fjho40FlSnXRWV03yVOeJplwF+/cFZOunSNz9Wm4aedHEk
	+o2hgQwlaIBaUtXnXemaCs5uMF2SDp5gTYBq5ZvoGcZi3GSSdlfUFVw9Rv7gxl5PDOCxSqTe7au
	4hSBvt+cnANhlL9E3
X-Received: by 2002:a7b:c8c9:: with SMTP id f9mr20370497wml.67.1599472761567;
        Mon, 07 Sep 2020 02:59:21 -0700 (PDT)
X-Received: by 2002:a7b:c8c9:: with SMTP id f9mr20370456wml.67.1599472761128;
        Mon, 07 Sep 2020 02:59:21 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.65])
        by smtp.gmail.com with ESMTPSA id i26sm27759414wmb.17.2020.09.07.02.59.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 02:59:20 -0700 (PDT)
Subject: Re: [PATCH 1/4] Acceptance tests: use an available kernel image
 package for arm
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Fabien Chouteau
 <chouteau@adacore.com>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Beraldo Leal <bleal@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20200907042000.415931-1-crosa@redhat.com>
 <20200907042000.415931-2-crosa@redhat.com>
 <001385a1-92eb-d311-88b5-8e1e7f6f1f48@redhat.com>
 <20200907093930.GD810755@redhat.com>
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
Message-ID: <34814b29-a47a-efd3-971b-520bc5ac6309@redhat.com>
Date: Mon, 7 Sep 2020 11:59:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200907093930.GD810755@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: MF1BW21I0F+E

On 9/7/20 11:39 AM, Daniel P. Berrangé wrote:
> On Mon, Sep 07, 2020 at 10:06:13AM +0200, Philippe Mathieu-Daudé wrote:
>> [Cc'ing Daniel who usually have good ideas for that
>> kind if project-wide problem]
>>
>> On 9/7/20 6:19 AM, Cleber Rosa wrote:
>>> Which means a newer kernel version.  Expected output was changed
>>> to match the new kernel too.
>>
>> Nack.
>>
>> Acceptance tests are not to test the latest Linux kernel,
>> they aim to assert a specific kernel tested by some developer
>> still works while QEMU evolves.
>> QEMU doesn't have to adapt to the latest kernel;
>> QEMU should keep boot an old kernel.
>>
>> Testing new kernels is good, you are adding coverage. But
>> this break the acceptance testing contract "keep testing
>> the same thing over time".
>>
>> The problem you are trying to fix is the "where to keep
>> assets from public locations where they are being removed?"
>> one. Two years ago [*] you suggested to use some storage on
>> the avocado-project.org:
>>
>>   For Avocado-VT, there are the JeOS images[1], which we
>>   keep on a test "assets" directory.  We have a lot of
>>   storage/bandwidth availability, so it can be used for
>>   other assets proven to be necessary for tests.
>>
>>   As long as distribution rights and licensing are not
>>   issues, we can definitely use the same server for kernels,
>>   u-boot images and what not.
>>
>>   [1] - https://avocado-project.org/data/assets/
> 
> If I look at stuff under that directory I see a bunch of "Jeos" qcow2
> images, and zero information about the corresponding source for the
> images, nor any information about the licenses of software included.
> IOW what is stored their right now does not appear to comply with the
> GPL licensing requirements for providing full and corresponding source.
> 
>> It is time to have QEMU assets managed the same way.
> 
> I'd rather we didn't do anything relying on binary blobs with no
> info about how they were built. Pointing to the 3rd party download
> URLs was the easy way to ensure we don't have to worry about licensing
> problems.

I tried to be very strict including the recipe about how to rebuild
and description of the source (for licensing) in each commits (Alex
Bennée once said Debian/Fedora based was OK):

commit 784b8796380532351737d753a6a092ed4e1ffebf
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Wed Mar 11 23:18:52 2020 +0100

    tests/boot_linux_console: Add a SLOW test booting Ubuntu on OrangePi PC

    This test boots Ubuntu Bionic on a OrangePi PC board.

    As it requires 1GB of storage, and is slow, this test is disabled
    on automatic CI testing.

    It is useful for workstation testing. Currently Avocado timeouts too
    quickly, so we can't run userland commands.

    The kernel image and DeviceTree blob are built by the Armbian
    project (based on Debian):
    https://www.armbian.com/orange-pi-pc/

    The Ubuntu image is downloaded from:
    https://dl.armbian.com/orangepipc/Bionic_current

commit de2749bcb2459d0722022fb70c70310a04413fc1
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Wed Mar 11 23:18:51 2020 +0100

    tests/boot_linux_console: Add a SD card test for the OrangePi PC board

    The kernel image and DeviceTree blob are built by the Armbian
    project (based on Debian):
    https://www.armbian.com/orange-pi-pc/

    The SD image is from the kernelci.org project:
    https://kernelci.org/faq/#the-code

commit c40b1ded0af6ee5b26e4b2eb5e0ce68c308e8de3
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Wed Mar 11 23:18:50 2020 +0100

    tests/boot_linux_console: Add initrd test for the Orange Pi PC board

    This test boots a Linux kernel on a OrangePi PC board and verify
    the serial output is working.

    The kernel image and DeviceTree blob are built by the Armbian
    project (based on Debian):
    https://www.armbian.com/orange-pi-pc/

    The cpio image used comes from the linux-build-test project:
    https://github.com/groeck/linux-build-test

commit e33ee3097f705bd7d3ae14a177e12a4b16055970
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Fri Jan 17 14:09:30 2020 +0000

    tests/boot_linux_console: Add a SD card test for the CubieBoard

    The kernel image and DeviceTree blob are built by the Armbian
    project (based on Debian):
    https://docs.armbian.com/Developer-Guide_Build-Preparation/

    The cpio image used comes from the linux-build-test project:
    https://github.com/groeck/linux-build-test

commit efdb45bfd72745038909dfd1e970a827cb8d5d7e
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Mon Oct 28 19:04:04 2019 -0400

    tests/boot_linux_console: Run BusyBox on 5KEc 64-bit cpu

    This tests boots a Linux kernel on a Malta machine up to a
    busybox shell on the serial console. Few commands are executed
    before halting the machine (via reboot).

    We use the Fedora 24 kernel extracted from the image at:
    https://fedoraproject.org/wiki/Architectures/MIPS
    and the initrd cpio image from the kerneltests project:
    https://kerneltests.org/

commit 92d9361255a0862379866f156686180902bb63d2
Author: Philippe Mathieu-Daudé <f4bug@amsat.org>
Date:   Mon Oct 28 19:04:04 2019 -0400

    tests/boot_linux_console: Add a test for the Raspberry Pi 2

    Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
    board and verify the serial is working.

    The kernel image and DeviceTree blob are built by the Raspbian
    project (based on Debian):
    https://www.raspbian.org/RaspbianImages
    as recommended by the Raspberry Pi project:
    https://www.raspberrypi.org/downloads/raspbian/

> 
> IIUC, the majority of our acceptance tests needs should be satisfied
> with a combination of a Linux kernel and busybox tools. We already
> use cross-compilers to build TCG test cases.
> 
> I'd like to see us provide a minimal "config" file for each Linux
> kernel combo we need to test. We should be able to define a fairly
> simple script that do the Linux build, busybox build and then puts
> the combination of them into a disk image.  Something 100% automated
> and reviewable.

For Debian/Fedora this config is available in their package (or source
package).

> 
> Even a minimal linux build takes some time, so we would need to cache
> the binary result in some suitable manner. At least this way we have
> a clear record of what we're building & how and can thus satisfy the
> license rules.

Yes, but if the Debian/Fedora build farms already build/published
their packages, it is easier to use it directly.

QEMU developers are very reluctant to add tests. I suppose we prefer
to develop or fix bugs rather than write tests. If we ask full build
recipe for each tests, I doubt we'll have much testing.

> 
>>
>> [*] https://www.mail-archive.com/avocado-devel@redhat.com/msg00860.html
>>
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>  tests/acceptance/boot_linux_console.py | 44 +++++++++++++-------------
>>>  tests/acceptance/replay_kernel.py      |  8 ++---
>>>  2 files changed, 26 insertions(+), 26 deletions(-)
>>>
>>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>>> index aaa781a581..751b47b8fd 100644
>>> --- a/tests/acceptance/boot_linux_console.py
>>> +++ b/tests/acceptance/boot_linux_console.py
>>> @@ -490,12 +490,12 @@ class BootLinuxConsole(LinuxKernelTest):
>>>          :avocado: tags=arch:arm
>>>          :avocado: tags=machine:cubieboard
>>>          """
>>> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
>>> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
>>> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
>>> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
>>> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
>>> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>>>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>>>          kernel_path = self.extract_from_deb(deb_path,
>>> -                                            '/boot/vmlinuz-4.20.7-sunxi')
>>> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>>>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
>>>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
>>> @@ -522,7 +522,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>>          exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
>>>                                                  'Allwinner sun4i/sun5i')
>>>          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
>>> -                                                'system-control@1c00000')
>>> +                                                '1c00000.system-control')
>>>          # cubieboard's reboot is not functioning; omit reboot test.
>>>  
>>>      def test_arm_cubieboard_sata(self):
>>> @@ -530,12 +530,12 @@ class BootLinuxConsole(LinuxKernelTest):
>>>          :avocado: tags=arch:arm
>>>          :avocado: tags=machine:cubieboard
>>>          """
>>> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
>>> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
>>> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
>>> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
>>> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
>>> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>>>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>>>          kernel_path = self.extract_from_deb(deb_path,
>>> -                                            '/boot/vmlinuz-4.20.7-sunxi')
>>> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>>>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
>>>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>          rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
>>> @@ -573,12 +573,12 @@ class BootLinuxConsole(LinuxKernelTest):
>>>          :avocado: tags=arch:arm
>>>          :avocado: tags=machine:orangepi-pc
>>>          """
>>> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
>>> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
>>> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
>>> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
>>> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
>>> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>>>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>>>          kernel_path = self.extract_from_deb(deb_path,
>>> -                                            '/boot/vmlinuz-4.20.7-sunxi')
>>> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>>>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
>>>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>  
>>> @@ -598,12 +598,12 @@ class BootLinuxConsole(LinuxKernelTest):
>>>          :avocado: tags=arch:arm
>>>          :avocado: tags=machine:orangepi-pc
>>>          """
>>> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
>>> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
>>> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
>>> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
>>> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
>>> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>>>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>>>          kernel_path = self.extract_from_deb(deb_path,
>>> -                                            '/boot/vmlinuz-4.20.7-sunxi')
>>> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>>>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
>>>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
>>> @@ -629,7 +629,7 @@ class BootLinuxConsole(LinuxKernelTest):
>>>          exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
>>>                                                  'Allwinner sun8i Family')
>>>          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
>>> -                                                'system-control@1c00000')
>>> +                                                '1c00000.system-control')
>>>          exec_command_and_wait_for_pattern(self, 'reboot',
>>>                                                  'reboot: Restarting system')
>>>          # Wait for VM to shut down gracefully
>>> @@ -641,12 +641,12 @@ class BootLinuxConsole(LinuxKernelTest):
>>>          :avocado: tags=machine:orangepi-pc
>>>          :avocado: tags=device:sd
>>>          """
>>> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
>>> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
>>> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
>>> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
>>> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
>>> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>>>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>>>          kernel_path = self.extract_from_deb(deb_path,
>>> -                                            '/boot/vmlinuz-4.20.7-sunxi')
>>> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>>>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
>>>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>          rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
>>> diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
>>> index b79fc8daf8..80a460814f 100644
>>> --- a/tests/acceptance/replay_kernel.py
>>> +++ b/tests/acceptance/replay_kernel.py
>>> @@ -132,12 +132,12 @@ class ReplayKernel(LinuxKernelTest):
>>>          :avocado: tags=arch:arm
>>>          :avocado: tags=machine:cubieboard
>>>          """
>>> -        deb_url = ('https://apt.armbian.com/pool/main/l/'
>>> -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
>>> -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
>>> +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
>>> +                   'linux-image-dev-sunxi_20.08_armhf.deb')
>>> +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
>>>          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
>>>          kernel_path = self.extract_from_deb(deb_path,
>>> -                                            '/boot/vmlinuz-4.20.7-sunxi')
>>> +                                            '/boot/vmlinuz-5.8.0-sunxi')
>>>          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
>>>          dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>>          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
>>>
>>
>>
> 
> Regards,
> Daniel
> 
