Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4910325ejx;
        Thu, 24 Nov 2022 01:20:46 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Fx30E+weJNf8BQZDhgmY/ozuwNEgP9oPLQRiq7pdMSKUNBEkF0CAsdBVGo/JeBowYF6PF
X-Received: by 2002:ac8:7296:0:b0:3a5:ad5c:ba41 with SMTP id v22-20020ac87296000000b003a5ad5cba41mr15139616qto.512.1669281646571;
        Thu, 24 Nov 2022 01:20:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669281646; cv=none;
        d=google.com; s=arc-20160816;
        b=rbe7dSQyKhJcflbhWiHCjESulyEPHUb8B2ePsMCQIu5FQAF2k+eTsGMH2bdncHW1kq
         1gvV7qVjFmTqI7I/qfCaWgiqPrIRfVzdBctTGYxFKVSGfZ6EryYJ3VFrOZjuw2JGhzxB
         nGHT0+8/zhQwx5wkubQbGlHKpvBHe6V3+7wlYyoB74YzKlV10snORhB4huxO3iDzxCY+
         gDigXTwyi29//wfU0iZffFybElJt09aKrKvybluGjQ2zbmwmr/DzjINdBTKyBgbgO8GJ
         u43mo0yq7k+17Vq2wgTQAXlnLqVQWIUkCywk52keMiSC480xqoQyFoHjUPhj5wRdqAG3
         rwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=8Lpeu5Ss2ivhrSfRq54gOr5bohU3P8pE/EFC1tBLppY=;
        b=epaFpbcTvmoJwFOu3E1u0V69CMhgB5P8T57XyIkY/piE5kARqI+HP06FtD/u3xxUjC
         LNJkHb3cgoVTWnNVEUgcxXWlUhu/hK1AwleWuELDCL/KHmF06tc18lj9T9HJbRowtzB8
         S7ysn9zPaHi5+zD63dQG6RtbCFk+1kKdB2LGYFseJMkyvxCjcKrcf2uOoCuKdpimXjiL
         zpGVzhC90/7LJoiaTU7PPrrLjRdKRkG91SA8qCQr24DKOOjioOxoLm754B+g8xcRAXmu
         iHNH2GpN/pWhjxZbrQ4WlDTT7iNzLJ4yAMPoVfeoHf8jVQaNjBUg6i7gfrS65Jdr+W5w
         +l4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L19eJ3qT;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id br43-20020a05620a462b00b006b2543c5866si474189qkb.18.2022.11.24.01.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 01:20:46 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L19eJ3qT;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669281646;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Lpeu5Ss2ivhrSfRq54gOr5bohU3P8pE/EFC1tBLppY=;
	b=L19eJ3qTbMmzHrpXK/5JBg+bmHq18Rub0UP2sn88GvjpXDEYmmRcNe+SK8pxJBqwSqs95E
	GoWGHsweiQFXysB1RKXl1eDd9zs1AofEGxx6kx/IPvM4d2jjYDU5oE2OKhd1Z4fZJJsD1M
	ITg1kgkgEtnV14xUr78Sv8dOyZTuw6E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-pbPwJV6MPwSEovI57nIYng-1; Thu, 24 Nov 2022 04:20:42 -0500
X-MC-Unique: pbPwJV6MPwSEovI57nIYng-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 20BB9811E7A;
	Thu, 24 Nov 2022 09:20:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C4EE2166B26;
	Thu, 24 Nov 2022 09:20:40 +0000 (UTC)
Date: Thu, 24 Nov 2022 09:20:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Message-ID: <Y383Y03gZI77KeWK@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
 <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com>
 <87fse9bvmf.fsf@linaro.org>
 <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: R9HKq1rUZyjd

On Wed, Nov 23, 2022 at 07:13:09PM +0100, Philippe Mathieu-Daudé wrote:
> On 23/11/22 15:12, Alex Bennée wrote:
> > Thomas Huth <thuth@redhat.com> writes:
> > > On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
> > > > On 18/11/22 12:33, Alex Bennée wrote:
> > > > > The old URL wasn't stable. I suspect the current URL will only be
> > > > > stable for a few months so maybe we need another strategy for hosting
> > > > > rootfs snapshots?
> > > > > 
> > > > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > > > ---
> > > > >    tests/avocado/boot_linux_console.py | 4 ++--
> > > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/tests/avocado/boot_linux_console.py
> > > > > b/tests/avocado/boot_linux_console.py
> > > > > index 4c9d551f47..5a2923c423 100644
> > > > > --- a/tests/avocado/boot_linux_console.py
> > > > > +++ b/tests/avocado/boot_linux_console.py
> > > > > @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
> > > > >            dtb_path =
> > > > > '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
> > > > >            dtb_path = self.extract_from_deb(deb_path, dtb_path)
> > > > >            rootfs_url =
> > > > > ('http://storage.kernelci.org/images/rootfs/buildroot/'
> > > > > -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
> > > > > -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
> > > > > +                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
> > > > > +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
> > > > If Avocado doesn't find an artifact in its local cache, it will fetch it
> > > > from the URL.
> > > > The cache might be populated with artifacts previously downloaded, but
> > > > their URL is not valid anymore (my case for many tests).
> > > > We can also add artifacts manually, see [1].
> > > > I'd rather keep pre-existing tests if possible, to test older
> > > > (kernel / user-space) images. We don't need to run all the tests all
> > > > the time:
> > > > tests can be filtered by tags (see [2]).
> > > > My preference here is to refactor this test, adding the
> > > > "kci-2019.02"
> > > > and "baseline-20221116.0" releases. I can prepare the patch if you /
> > > > Thomas don't object.
> > > 
> > > IMHO we shouldn't keep tests in the upstream git repository where the
> > > binaries are not available in public anymore. They won't get run by
> > > new contributors anymore, and also could vanish from the disks of the
> > > people who previously downloaded it, once they wipe their cache or
> > > upgrade to a new installation, so the test code will sooner or later
> > > be bitrotting. But if you want to keep the tests around on your hard
> > > disk, you could also stick the test in a local branch on your hard
> > > disk instead.
> > 
> > CI/Workstation splits aside I tend to agree with Thomas here that having
> > tests no one else can run will lead to an accretion of broken tests.
> 
> Following this idea, should we remove all boards for which no open
> source & GPL software is available? I.e:

No of course not, that's totally ridiculous.

Don't equate what scenarios we cover in CI, with what features
QEMU implements in code.

The CI coverage merely influences what we tell people about
the level of quality we can guarantee for respective features.


> > > The other possibility is to upload the binaries to a new public
> > > location in the web ... but for software that contains GPLed software,
> > > you should then also make sure to provide the source code to comply
> > > with the license.
> > 
> > This is the traditional reason we've lent so hard on external hosting
> > for binaries because the upstream doesn't want the hassle of maintaining
> > that sort of zoo of binaries. That said we have tests where binaries are
> > served from fileserver.linaro.org but its then only my problem to deal
> > with GPL requirements and not the upstream.
> 
> Maybe we are discussing 2 different topics. I am in possession of
> old Solaris installation CDROMs and could boot some of them with
> qemu-system-sparc. I want to automatize my testing, and wrote Avocado
> scripts doing that. I suppose other QEMU users have similar CDROMs.
> If I contribute my tests, they can run them. Isn't it in the interest
> of the community to have such examples and tests available?

Potentially yes, but remember that all code has a maintenance cost,
and we're massively struggling to keep even our current avocado
setup running reliably. The CI for Avocado is in a state of almost
constant brokeness throughout recent merges :-(

Given the instability and time invested chasing failures in current
tests we have, I don't think we can commit to adding arbitrary user
contributed tests to our gating CI.

I think we need to strictly focus our Avocado gating CI testing on
a small set of OS that give maximum value for our usersr. IMHO that
means primarily focus testing resources on modern non-EOL OS distros
and hardware platforms.

We could take tests for other old OS / old hardware platforms and
NOT run them in CI, but then they're at even greater risk of
bitrotting than the stuff we already struggle to keep running.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
