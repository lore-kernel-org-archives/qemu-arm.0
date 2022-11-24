Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp4912176ejx;
        Thu, 24 Nov 2022 01:24:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7BakCE0KfMXk+1zVe1Gkq24wrn2Isylv322//8W3f0Uh7H4ePBuvBQYubqoQyuyNagAsgk
X-Received: by 2002:a37:9a97:0:b0:6fa:5070:1e38 with SMTP id c145-20020a379a97000000b006fa50701e38mr27739039qke.763.1669281850843;
        Thu, 24 Nov 2022 01:24:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669281850; cv=none;
        d=google.com; s=arc-20160816;
        b=zaHiO0ODNq7R3xtkgPU85fb1hv/VCLc+uuwJ2ykJAz0RuXSXc/aGgAqt6KtWG+VYZ8
         eUUi6jxU4pCOzZYTQ1SrjLIqfuV0N7QewrBGowYm9y2fVw/n9yl2xK0vCI7E4aEz6rn6
         oUkItUtLJ5uJ6Yz+JU8xwptx6loHxgjwiJxk+tk/gWv7KQUAOVVMakRCEVGFBfZeTwCW
         PIYFdBVlZQf7NYAhAtEKPoz1uU+ayAHbTHnzMO0e2kulYj0KmES6QtpwYQ4NkpWDct5D
         2shOKTpPEPbt3kZkkBfWImrf5WLIBjaiD3GbRfDWNi7xx9r7iDu0YSYLM677+2SH2s8s
         P9lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=2YcVcw0QCNYed8UKcxe8YAYNqKOKyenKP5jNj1GUeJc=;
        b=bC42jDKpPmPQNgRfh+EOdQ+I9m7fHwrUsTGdhEIsjXWN4IRYOniTaO97g3tCa33sAp
         xOfOdlw5DJfbdN7GX/iIBz4XKMIvmw7BerKd6KL+KQO4vLx3B+nVKq/OJivBa5CWmlhv
         a/OI8jXG6MrO3toMAcxpivK3H90fveSf6vzYmf2fAKbHXg8m4Q5ZoZUGe4OLrLLxRU+a
         nGeeEaI5DuPHTILZgr8PNPaVUICw8uYRaLxWyvFLddKneW8DhG9GYU7BVMfPphCIA6uo
         j2wEmQ1teRggn1068jNonMAueBf+1x6MyFVaSlFCCH8WqjtZgpOYcxdW0i+Q7sL++vJG
         QOIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cGx1l13N;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id fz27-20020a05622a5a9b00b003a5882a0510si318716qtb.398.2022.11.24.01.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Nov 2022 01:24:10 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cGx1l13N;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669281850;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2YcVcw0QCNYed8UKcxe8YAYNqKOKyenKP5jNj1GUeJc=;
	b=cGx1l13N5H7tUlLnjlDPd56atsoOiKQWZvtjcWC8fFAZO6CON+as/XKj3MtSkGELJTjTg+
	OKmNB4jWdR+N/HTZbVdk9GaxOQsbOZshb3T+6VR09uJ1eWdxKivHyQtOl5Y6TNaPipHd/D
	7D5XVVg0xBclpk0lnhTT4+gHspF5+fA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-hcHH3fKmOfORq2waaRZSHw-1; Thu, 24 Nov 2022 04:24:06 -0500
X-MC-Unique: hcHH3fKmOfORq2waaRZSHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75C9E185A79C;
	Thu, 24 Nov 2022 09:24:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C201E2166B26;
	Thu, 24 Nov 2022 09:24:04 +0000 (UTC)
Date: Thu, 24 Nov 2022 09:24:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Message-ID: <Y384MFrsSMLlFShV@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
 <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com>
 <87fse9bvmf.fsf@linaro.org>
 <504f6645-5315-74c5-623d-d8bf231aec09@linaro.org>
 <be6d895d-1693-32ab-580f-e630fab82e97@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be6d895d-1693-32ab-580f-e630fab82e97@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: tZlk7y1K3Wge

On Thu, Nov 24, 2022 at 09:20:36AM +0100, Thomas Huth wrote:
> On 23/11/2022 19.13, Philippe Mathieu-Daudé wrote:
> > On 23/11/22 15:12, Alex Bennée wrote:
> > > Thomas Huth <thuth@redhat.com> writes:
> > > > On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
> > > > > On 18/11/22 12:33, Alex Bennée wrote:
> > > > > > The old URL wasn't stable. I suspect the current URL will only be
> > > > > > stable for a few months so maybe we need another strategy for hosting
> > > > > > rootfs snapshots?
> > > > > > 
> > > > > > Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> > > > > > ---
> > > > > >    tests/avocado/boot_linux_console.py | 4 ++--
> > > > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/tests/avocado/boot_linux_console.py
> > > > > > b/tests/avocado/boot_linux_console.py
> > > > > > index 4c9d551f47..5a2923c423 100644
> > > > > > --- a/tests/avocado/boot_linux_console.py
> > > > > > +++ b/tests/avocado/boot_linux_console.py
> > > > > > @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
> > > > > >            dtb_path =
> > > > > > '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
> > > > > >            dtb_path = self.extract_from_deb(deb_path, dtb_path)
> > > > > >            rootfs_url =
> > > > > > ('http://storage.kernelci.org/images/rootfs/buildroot/'
> > > > > > -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
> > > > > > -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
> > > > > > +
> > > > > > 'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
> > > > > > +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
> > > > > If Avocado doesn't find an artifact in its local cache, it will fetch it
> > > > > from the URL.
> > > > > The cache might be populated with artifacts previously downloaded, but
> > > > > their URL is not valid anymore (my case for many tests).
> > > > > We can also add artifacts manually, see [1].
> > > > > I'd rather keep pre-existing tests if possible, to test older
> > > > > (kernel / user-space) images. We don't need to run all the tests all
> > > > > the time:
> > > > > tests can be filtered by tags (see [2]).
> > > > > My preference here is to refactor this test, adding the
> > > > > "kci-2019.02"
> > > > > and "baseline-20221116.0" releases. I can prepare the patch if you /
> > > > > Thomas don't object.
> > > > 
> > > > IMHO we shouldn't keep tests in the upstream git repository where the
> > > > binaries are not available in public anymore. They won't get run by
> > > > new contributors anymore, and also could vanish from the disks of the
> > > > people who previously downloaded it, once they wipe their cache or
> > > > upgrade to a new installation, so the test code will sooner or later
> > > > be bitrotting. But if you want to keep the tests around on your hard
> > > > disk, you could also stick the test in a local branch on your hard
> > > > disk instead.
> > > 
> > > CI/Workstation splits aside I tend to agree with Thomas here that having
> > > tests no one else can run will lead to an accretion of broken tests.
> > 
> > Following this idea, should we remove all boards for which no open
> > source & GPL software is available?
> 
> That's certainly a different topic... but I see where you're heading to.
> 
> My point here is rather: There is an alternative, newer version of the
> kernel available which can be used to test the same thing. The older version
> disappeared from the net, so why should we bother trying to keep that test
> with that version supported if there is a newer version available?

In the ideal world we would test a representative sample of OS across a
wide vintage of years.

The real world though, we're massively struggling to keep avocado running
reliably, and so don't have resources to achieve ideal testing coverage.

We need to aggressively restrict our focus to testing that maximises
the value for our userbase. I think that means focusing on modern
non-EOL operating systems.  So yes, if an old image disappears, cull
it from testing and put something new in its place that is more likely
to actually be used by our userbase. 


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
