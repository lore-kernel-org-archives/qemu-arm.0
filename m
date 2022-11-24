Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4916874ejx;
        Thu, 24 Nov 2022 01:32:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6TwY7sHGXVYNPjEn2jKXKWcKjuhpBm6aMFJ72vR927ch8RiBMJpVXQTfQhCe4VSrxPsiIx
X-Received: by 2002:a05:622a:11d1:b0:3a5:9157:f3a4 with SMTP id n17-20020a05622a11d100b003a59157f3a4mr14290540qtk.178.1669282374168;
        Thu, 24 Nov 2022 01:32:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669282374; cv=none;
        d=google.com; s=arc-20160816;
        b=sAsma6cXkRUVT39ZPOPkWtUJYOO9e3Tl1H18TErJwQhKNzcldnTMJK3Eoa0M0Ztq8U
         e1+ZPgJ9WM8qWEcv8JAI4q4OecNp5lYQnpdWY+WHtppMN9Y1DYFmJdRBslYMOr+iRrse
         JA/xGy1os6WSXyC+q4myYISkRUjRHYfELkTjdXHm0cp+W5n7oMIWSFNvYEzHTE6WKHpZ
         p+yRn2TzX0IL1q8pbem18zPZuLYeaHxKkJTk5bXfSgah5/DdtC0WA2WJXzXE8NgWANj9
         iI/hWssHtULBWkithas5J4eJ/jt7IHkqvV97j2Zy86Oogx4QJqRX/at8v5evPbLfi/Cf
         KZ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=Ytjw1Q193GioMQ7nuuiJ2+8swD2PQaobqGR4aVGxZGg=;
        b=YoHE/teWzfhPtZJtvwcz7oRrxZceoUbVYUumqT00zkpW3yc7j12zUkb38MBySQergc
         odue/0fjRbrQJa4GXE0ljioyTEx+P6pckqk1iTW2UWyA6yL1LCPngI/Wl/s2dWcyUzDH
         Onxs+wuzXo3rSmNAKWm58Zi27HUcgfABZpgx4ClLbhT93zroV6bmz1dKbhNeFtuPBP/H
         12oc6IB6IsNWZOFkN3ifBMs9gpLSHGSfeghOAZouLOX7mU6XUSPun0YyFEfz7Zxo3mn2
         /KnszjYLh1/m4eetfvdfXycKZWBDEO4ERJ4GfRthK7IAD6RDtnCEuT038+9Z1HrVlR6j
         OPlw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P76v9tYz;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s125-20020a37a983000000b006ea415df571si438588qke.189.2022.11.24.01.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 01:32:54 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P76v9tYz;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669282373;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ytjw1Q193GioMQ7nuuiJ2+8swD2PQaobqGR4aVGxZGg=;
	b=P76v9tYzlG1JZrKJb5RRrre5j52VFmJQRIOn926AmJKht2v0c2lkIFJ1qLcNjw3FPirnSR
	gAbLhe6GDo9CE03On6KM00J7vpLexV8jjoqJEeaEkFDL+Nj/OXhFoRpNbog9yq1QKGLAhG
	yzAyCkFWO5ANnOnuHO4Zi2LDGJtZWlE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-yFs3sWylMMa5LaGYy5bTtw-1; Thu, 24 Nov 2022 04:32:50 -0500
X-MC-Unique: yFs3sWylMMa5LaGYy5bTtw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B769101AA79;
	Thu, 24 Nov 2022 09:32:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F0864EA55;
	Thu, 24 Nov 2022 09:32:45 +0000 (UTC)
Date: Thu, 24 Nov 2022 09:32:41 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Message-ID: <Y386OVJ3HhsnuZ8F@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
 <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com>
 <87fse9bvmf.fsf@linaro.org>
 <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
 <f12c4b6f-8125-696c-5699-802ccc7c5f39@kaod.org>
 <d43878da-f17c-96ae-a097-7b90f9024a98@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d43878da-f17c-96ae-a097-7b90f9024a98@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: qyQ0RgdmetxE

On Thu, Nov 24, 2022 at 12:06:10AM +0100, Philippe Mathieu-Daudé wrote:
> On 23/11/22 19:49, Cédric Le Goater wrote:
> > On 11/23/22 19:13, Philippe Mathieu-Daudé wrote:
> > > On 23/11/22 15:12, Alex Bennée wrote:
> > > > Thomas Huth <thuth@redhat.com> writes:
> > > > > On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
> > > > > > On 18/11/22 12:33, Alex Bennée wrote:
> > > > > > > The old URL wasn't stable. I suspect the current URL will only be
> > > > > > > stable for a few months so maybe we need another strategy for hosting
> > > > > > > rootfs snapshots?
> > > > > > > 
> > > > > > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > > > > > ---
> > > > > > >    tests/avocado/boot_linux_console.py | 4 ++--
> > > > > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/tests/avocado/boot_linux_console.py
> > > > > > > b/tests/avocado/boot_linux_console.py
> > > > > > > index 4c9d551f47..5a2923c423 100644
> > > > > > > --- a/tests/avocado/boot_linux_console.py
> > > > > > > +++ b/tests/avocado/boot_linux_console.py
> > > > > > > @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
> > > > > > >            dtb_path =
> > > > > > > '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
> > > > > > >            dtb_path = self.extract_from_deb(deb_path, dtb_path)
> > > > > > >            rootfs_url =
> > > > > > > ('http://storage.kernelci.org/images/rootfs/buildroot/'
> > > > > > > -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
> > > > > > > -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
> > > > > > > +
> > > > > > > 'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
> > > > > > > +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
> > > > > > If Avocado doesn't find an artifact in its local cache,
> > > > > > it will fetch it
> > > > > > from the URL.
> > > > > > The cache might be populated with artifacts previously downloaded, but
> > > > > > their URL is not valid anymore (my case for many tests).
> > > > > > We can also add artifacts manually, see [1].
> > > > > > I'd rather keep pre-existing tests if possible, to test older
> > > > > > (kernel / user-space) images. We don't need to run all the tests all
> > > > > > the time:
> > > > > > tests can be filtered by tags (see [2]).
> > > > > > My preference here is to refactor this test, adding the
> > > > > > "kci-2019.02"
> > > > > > and "baseline-20221116.0" releases. I can prepare the patch if you /
> > > > > > Thomas don't object.
> > > > > 
> > > > > IMHO we shouldn't keep tests in the upstream git repository where the
> > > > > binaries are not available in public anymore. They won't get run by
> > > > > new contributors anymore, and also could vanish from the disks of the
> > > > > people who previously downloaded it, once they wipe their cache or
> > > > > upgrade to a new installation, so the test code will sooner or later
> > > > > be bitrotting. But if you want to keep the tests around on your hard
> > > > > disk, you could also stick the test in a local branch on your hard
> > > > > disk instead.
> > > > 
> > > > CI/Workstation splits aside I tend to agree with Thomas here that having
> > > > tests no one else can run will lead to an accretion of broken tests.
> > > 
> > > Following this idea, should we remove all boards for which no open
> > > source & GPL software is available? I.e:
> > > 
> > > 40p                  IBM RS/6000 7020 (40p)
> > 
> > This machine can run debian :
> 
> IMHO having QEMU able to run anything an architecture can run seems way
> more interesting/helpful rather than restricting it to just open source
> projects.
> 
> >    qemu-system-ppc -M 40p -cpu 604 -nic user -hda ./prep.qcow2 -cdrom
> > ./zImage.hdd -serial mon:stdio -nographic
> >    >> =============================================================
> >    >> OpenBIOS 1.1 [Mar 7 2022 23:07]
> >    >> Configuration device id QEMU version 1 machine id 0
> >    >> CPUs: 0
> >    >> Memory: 128M
> >    >> UUID: 00000000-0000-0000-0000-000000000000
> >    >> CPU type PowerPC,604
> >    milliseconds isn't unique.
> >    Welcome to OpenBIOS v1.1 built on Mar 7 2022 23:07
> >    Trying hd:,\\:tbxi...
> >    >> Not a bootable ELF image
> >    >> switching to new context:
> >    loaded at:     04000400 04015218
> >    relocated to:  00800000 00814E18
> >    board data at: 07C9E870 07CA527C
> >    relocated to:  0080B130 00811B3C
> >    zimage at:     0400B400 0411DC98
> >    avail ram:     00400000 00800000
> >    Linux/PPC load: console=/dev/ttyS0,9600 console=tty0
> > ether=5,0x210,eth0 ether=11,0x300,eth1 ramdisk_size=8192 root=/dev/sda3
> >    Uncompressing Linux................................................done.
> >    Now booting the kernel
> >    Debian GNU/Linux 3.0 6015 ttyS0
> >    6015 login:
> > 
> > Please keep it ! :)
> > 
> > and it also boots AIX 4.4/5.1 (with 2 small patches) but that's clearly
> > not open source. It is downloadable from the net though, like many macos
> > PPC images.
> > 
> > That said, we might have been putting too much in avocado and it takes
> > ages to run (when it does not hit some random python issue).
> 
> w.r.t. "too much in avocado", are you referring to GitLab CI?
> 
> I see the following 2 use cases with Avocado:
>  1/ Run tests locally
>  2/ Run tests on CI
> The set of tests used in 1/ and 2/ doesn't have to be the same...
> 
> 1/ is very helpful for maintainers, to run tests specific to their
> subsystems. Also useful during refactor when touching other subsystems,
> to run their tests before sending a patch set.
> 
> 2/ is the "gating" testing. With retrospective, it was a mistake to
> start running avocado on CI without any filtering on what tests to run.
> Instead of trying to explain my view here, I'd like to go back to Daniel
> earlier proposal:
> https://lore.kernel.org/qemu-devel/20200427152036.GI1244803@redhat.com/
> 
> Per this proposal, we should only run 'Tier 1' on Gitlab CI.
> Daniel described "Tier 1" as "[test that] Will always work."

The key part there is to make clear that testing does not determine
what code we accept into QEMU tree. It merely influences what quality
level we tell users the code has. Ideally we would test everything,
but realistically that's not viable, but we still want to take the
features.

>                                                              I'd like to
> amend with "test that run in less than 150 seconds" (or less). If a test
> takes more, we can run it on our workstations, but we shouldn't waste
> CI cycles with it.

I don't think we need to be so aggressive on time limits for
individual tests. What matters for CI is not the individual
test time, but the overall pipeline wallclock time.

If we want our pipelines to be no longer than 45 minutes,
it is still fine to have 4 tests that run 30 minutes each,
provided we have sufficient resources to run all 4 in parallel.
Keeping tests short is still a good thing, as it lets us run
more overall, but if some need extra time that's ok.

Above all else though, the top 5 requirements for any CI
test we add are reliability, reliability, reliability,
reliability and reliability.

We can't keep spending so much time chasing broken tests.
If the person merging QEMU pull requests just carries on
ignoring tests as they're so frequently broken, the value
of having the tests at all is drastically reduced, in
terms of what they can promise us about quality of the
code we ship.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
