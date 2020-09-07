Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3602264lfc;
        Mon, 7 Sep 2020 02:40:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwByMCgiiGTIuDBgDxpt7aMHA+rfODFmCfCMRR+0rgQ3y+ufSKQMRA1cKciDGUltPXYyTnB
X-Received: by 2002:a17:906:bc52:: with SMTP id s18mr19229486ejv.398.1599471614484;
        Mon, 07 Sep 2020 02:40:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599471614; cv=none;
        d=google.com; s=arc-20160816;
        b=BzjUvXFCk/BHiDI+hOUhu8iMg/YyccOlhQfY6zzle1ThKn6CcofL0Ju5HUhEpP7nJF
         JOObPYq4GMCSe9Ch+U4A7wNyJyBu3rJhQPu/9vt2ISW6CMn/JwRg5Cq23kgWjYTkdYmK
         tI6ColRMyoXZJTtcz10mhse+LTKwuMbe3jE7zv/pzD9J+COu92mjK/rvN1UgvUwgPN1n
         c8j+Bblk9UAlID5jeNcKKoRKsOSB2h1iM0YyZDmxW3R/VwzLIOl8eWpKPL/bvbvhW/dt
         rhhCsuoRJe4332m8g3MCm8JO2sqewlLPiKSOjR9dNu2axPy5/tvdxzEWUblUjaoQzQVw
         t7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=QExlLy8jSofv2tI/cGtlZTEeshpSz8fa87HJM8H60YU=;
        b=Bt9657ViCGG7iJ5amI43Z6yf63MgNSuBUAYj0TjcVia8ydNBW1FTNdPm858a9IbHhV
         Z76gS9W62EUWmOqRV9JzCLr+jqqdUP4ZrwTQ7iBoAybwKC1MC/AKrCI5It24b8n/JW/g
         WKTcQ9GWekzklGaIA+zp2RTN376wUwSiQ4vk4DBntU7KoETQG1yfDqZvqtc9/k1oQxTg
         Yszabcrsgx0dYv7iJg8N4C+oHnGnM5zNd7Rymb2ZIa6AhiG8InqKW4nOIKljwxOH17pM
         iLD6S9xdgsW8t5maGTlz/8HFOrg7afm1WnTlySyBw+gMwACEjp0IgYnZfw1WC9oI9gBX
         0WXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HC9LstZS;
       spf=pass (google.com: domain of berrange@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id l8si8878766edj.442.2020.09.07.02.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 02:40:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HC9LstZS;
       spf=pass (google.com: domain of berrange@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599471613;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QExlLy8jSofv2tI/cGtlZTEeshpSz8fa87HJM8H60YU=;
	b=HC9LstZS9303oZ7gC4F8JFLDhJMwRi2a788mixmFENp2dqRy1aKJaaqVaw3LLqrmBB2s/C
	XLlzv41yjbqaD/bAdHXtg+uFfXAKTocaks6sqYivuZfhKJlbYKt06JKzQIWKxx88datgdu
	ktHSFBfzlZ2pYbyRtWF0RbgXTzMYlzg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-bD3C1VklMpSTxihxOG50ug-1; Mon, 07 Sep 2020 05:39:45 -0400
X-MC-Unique: bD3C1VklMpSTxihxOG50ug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F01E1DDEC;
	Mon,  7 Sep 2020 09:39:42 +0000 (UTC)
Received: from redhat.com (ovpn-114-70.ams2.redhat.com [10.36.114.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3A3610013C4;
	Mon,  7 Sep 2020 09:39:32 +0000 (UTC)
Date: Mon, 7 Sep 2020 10:39:30 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Sarah Harris <S.E.Harris@kent.ac.uk>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	Willian Rampazzo <wrampazz@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-arm@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Beraldo Leal <bleal@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 1/4] Acceptance tests: use an available kernel image
 package for arm
Message-ID: <20200907093930.GD810755@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200907042000.415931-1-crosa@redhat.com>
 <20200907042000.415931-2-crosa@redhat.com>
 <001385a1-92eb-d311-88b5-8e1e7f6f1f48@redhat.com>
MIME-Version: 1.0
In-Reply-To: <001385a1-92eb-d311-88b5-8e1e7f6f1f48@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-TUID: kPlG8YXjzB3d

On Mon, Sep 07, 2020 at 10:06:13AM +0200, Philippe Mathieu-Daudé wrote:
> [Cc'ing Daniel who usually have good ideas for that
> kind if project-wide problem]
> 
> On 9/7/20 6:19 AM, Cleber Rosa wrote:
> > Which means a newer kernel version.  Expected output was changed
> > to match the new kernel too.
> 
> Nack.
> 
> Acceptance tests are not to test the latest Linux kernel,
> they aim to assert a specific kernel tested by some developer
> still works while QEMU evolves.
> QEMU doesn't have to adapt to the latest kernel;
> QEMU should keep boot an old kernel.
> 
> Testing new kernels is good, you are adding coverage. But
> this break the acceptance testing contract "keep testing
> the same thing over time".
> 
> The problem you are trying to fix is the "where to keep
> assets from public locations where they are being removed?"
> one. Two years ago [*] you suggested to use some storage on
> the avocado-project.org:
> 
>   For Avocado-VT, there are the JeOS images[1], which we
>   keep on a test "assets" directory.  We have a lot of
>   storage/bandwidth availability, so it can be used for
>   other assets proven to be necessary for tests.
> 
>   As long as distribution rights and licensing are not
>   issues, we can definitely use the same server for kernels,
>   u-boot images and what not.
> 
>   [1] - https://avocado-project.org/data/assets/

If I look at stuff under that directory I see a bunch of "Jeos" qcow2
images, and zero information about the corresponding source for the
images, nor any information about the licenses of software included.
IOW what is stored their right now does not appear to comply with the
GPL licensing requirements for providing full and corresponding source.

> It is time to have QEMU assets managed the same way.

I'd rather we didn't do anything relying on binary blobs with no
info about how they were built. Pointing to the 3rd party download
URLs was the easy way to ensure we don't have to worry about licensing
problems.

IIUC, the majority of our acceptance tests needs should be satisfied
with a combination of a Linux kernel and busybox tools. We already
use cross-compilers to build TCG test cases.

I'd like to see us provide a minimal "config" file for each Linux
kernel combo we need to test. We should be able to define a fairly
simple script that do the Linux build, busybox build and then puts
the combination of them into a disk image.  Something 100% automated
and reviewable.

Even a minimal linux build takes some time, so we would need to cache
the binary result in some suitable manner. At least this way we have
a clear record of what we're building & how and can thus satisfy the
license rules.

> 
> [*] https://www.mail-archive.com/avocado-devel@redhat.com/msg00860.html
> 
> > 
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/acceptance/boot_linux_console.py | 44 +++++++++++++-------------
> >  tests/acceptance/replay_kernel.py      |  8 ++---
> >  2 files changed, 26 insertions(+), 26 deletions(-)
> > 
> > diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
> > index aaa781a581..751b47b8fd 100644
> > --- a/tests/acceptance/boot_linux_console.py
> > +++ b/tests/acceptance/boot_linux_console.py
> > @@ -490,12 +490,12 @@ class BootLinuxConsole(LinuxKernelTest):
> >          :avocado: tags=arch:arm
> >          :avocado: tags=machine:cubieboard
> >          """
> > -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> > -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> > -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> > +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> > +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> > +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
> >          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> >          kernel_path = self.extract_from_deb(deb_path,
> > -                                            '/boot/vmlinuz-4.20.7-sunxi')
> > +                                            '/boot/vmlinuz-5.8.0-sunxi')
> >          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
> >          dtb_path = self.extract_from_deb(deb_path, dtb_path)
> >          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> > @@ -522,7 +522,7 @@ class BootLinuxConsole(LinuxKernelTest):
> >          exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> >                                                  'Allwinner sun4i/sun5i')
> >          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> > -                                                'system-control@1c00000')
> > +                                                '1c00000.system-control')
> >          # cubieboard's reboot is not functioning; omit reboot test.
> >  
> >      def test_arm_cubieboard_sata(self):
> > @@ -530,12 +530,12 @@ class BootLinuxConsole(LinuxKernelTest):
> >          :avocado: tags=arch:arm
> >          :avocado: tags=machine:cubieboard
> >          """
> > -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> > -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> > -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> > +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> > +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> > +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
> >          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> >          kernel_path = self.extract_from_deb(deb_path,
> > -                                            '/boot/vmlinuz-4.20.7-sunxi')
> > +                                            '/boot/vmlinuz-5.8.0-sunxi')
> >          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
> >          dtb_path = self.extract_from_deb(deb_path, dtb_path)
> >          rootfs_url = ('https://github.com/groeck/linux-build-test/raw/'
> > @@ -573,12 +573,12 @@ class BootLinuxConsole(LinuxKernelTest):
> >          :avocado: tags=arch:arm
> >          :avocado: tags=machine:orangepi-pc
> >          """
> > -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> > -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> > -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> > +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> > +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> > +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
> >          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> >          kernel_path = self.extract_from_deb(deb_path,
> > -                                            '/boot/vmlinuz-4.20.7-sunxi')
> > +                                            '/boot/vmlinuz-5.8.0-sunxi')
> >          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
> >          dtb_path = self.extract_from_deb(deb_path, dtb_path)
> >  
> > @@ -598,12 +598,12 @@ class BootLinuxConsole(LinuxKernelTest):
> >          :avocado: tags=arch:arm
> >          :avocado: tags=machine:orangepi-pc
> >          """
> > -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> > -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> > -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> > +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> > +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> > +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
> >          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> >          kernel_path = self.extract_from_deb(deb_path,
> > -                                            '/boot/vmlinuz-4.20.7-sunxi')
> > +                                            '/boot/vmlinuz-5.8.0-sunxi')
> >          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
> >          dtb_path = self.extract_from_deb(deb_path, dtb_path)
> >          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> > @@ -629,7 +629,7 @@ class BootLinuxConsole(LinuxKernelTest):
> >          exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
> >                                                  'Allwinner sun8i Family')
> >          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
> > -                                                'system-control@1c00000')
> > +                                                '1c00000.system-control')
> >          exec_command_and_wait_for_pattern(self, 'reboot',
> >                                                  'reboot: Restarting system')
> >          # Wait for VM to shut down gracefully
> > @@ -641,12 +641,12 @@ class BootLinuxConsole(LinuxKernelTest):
> >          :avocado: tags=machine:orangepi-pc
> >          :avocado: tags=device:sd
> >          """
> > -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> > -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> > -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> > +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> > +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> > +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
> >          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> >          kernel_path = self.extract_from_deb(deb_path,
> > -                                            '/boot/vmlinuz-4.20.7-sunxi')
> > +                                            '/boot/vmlinuz-5.8.0-sunxi')
> >          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun8i-h3-orangepi-pc.dtb'
> >          dtb_path = self.extract_from_deb(deb_path, dtb_path)
> >          rootfs_url = ('http://storage.kernelci.org/images/rootfs/buildroot/'
> > diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
> > index b79fc8daf8..80a460814f 100644
> > --- a/tests/acceptance/replay_kernel.py
> > +++ b/tests/acceptance/replay_kernel.py
> > @@ -132,12 +132,12 @@ class ReplayKernel(LinuxKernelTest):
> >          :avocado: tags=arch:arm
> >          :avocado: tags=machine:cubieboard
> >          """
> > -        deb_url = ('https://apt.armbian.com/pool/main/l/'
> > -                   'linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb')
> > -        deb_hash = '1334c29c44d984ffa05ed10de8c3361f33d78315'
> > +        deb_url = ('https://apt.armbian.com/pool/main/l/linux-5.8.0-sunxi/'
> > +                   'linux-image-dev-sunxi_20.08_armhf.deb')
> > +        deb_hash = 'ae553a9f7d43b18abfa8f3e64bf2d31878b9be89'
> >          deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
> >          kernel_path = self.extract_from_deb(deb_path,
> > -                                            '/boot/vmlinuz-4.20.7-sunxi')
> > +                                            '/boot/vmlinuz-5.8.0-sunxi')
> >          dtb_path = '/usr/lib/linux-image-dev-sunxi/sun4i-a10-cubieboard.dtb'
> >          dtb_path = self.extract_from_deb(deb_path, dtb_path)
> >          initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
> > 
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
