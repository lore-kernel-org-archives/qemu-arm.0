Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3631626lfc;
        Mon, 7 Sep 2020 03:29:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwokzHghg4s+TzSmYv/HWsfutSi3somg8qBwt7a/9bm3jRBPwltSYG8kYmZONM971oV+gTj
X-Received: by 2002:a25:bbcf:: with SMTP id c15mr26224361ybk.127.1599474572879;
        Mon, 07 Sep 2020 03:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474572; cv=none;
        d=google.com; s=arc-20160816;
        b=f9NvWy2hFnXpAYDLeEYRwOgvS9FlRU4axvM7WqpcfF8OMF+R0Gdqhx0GrF4SGWko/N
         TZ8jjpIsJW4jU6cAbnI8O2bJi9k3ZdZJ5VWqGlt2LNfhiI0AjkOw7orabBTWirvV6OBd
         40WskOF04PTt23DDuI27dsVV7VvwlhPAFupUpk7TY6MxOmEhqsHmGWFfciKtWJwfXXGK
         uSURTfwmGiX+rWe+N139/+NWSueRSnwvwyq38EJjtok8ytKod2FF8DApPvjFtzKJwWZ4
         4/iBFr3uM1yW5Cb0tJuGZnyce6GvDYYQpcRgltzREdf/aRn7HQLc7NWZ3svgUvBped8C
         h/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-disposition:content-transfer-encoding:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=IPMsWu19jw+gz3DeeiNb5IfYY/YJ8LVqkvkIJJotT+o=;
        b=nHk7mbPumClaxvEq6CUNb+Ipg0jeZVEwyBFvYQ9+tU61HAhGwj5hzr5FXt4/Nq5VOK
         +TePa4a55lu9omTnK+m0rEBiMaKlZtADsFKsljxn40wQAijKvWW+AhHiCzfZn0KXwBUU
         R+xLkRN9qrQ0x8ItbzCOZaEL3YSUfSU6znOoheQeXs2OszqorvsbmELsN3NbYKINrHoM
         s8NSW0D88Crvedx3bTLhid9+sSD8XyLy/Q2j6lBPIpg4eGKDq81lhGlKmV87ePWqogUb
         WVDyAm+7ub1SOIntl0pzBARBOUGqCb5XjcW5rZBUaJB+/M5BbZR0iqN005N/vy/4uqY3
         jJ1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EipS1oPH;
       spf=pass (google.com: domain of berrange@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 124si14144985ybz.22.2020.09.07.03.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EipS1oPH;
       spf=pass (google.com: domain of berrange@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599474572;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IPMsWu19jw+gz3DeeiNb5IfYY/YJ8LVqkvkIJJotT+o=;
	b=EipS1oPHINaRTPFh0Qrk5hykNKJYGuz1JLlGMDZtWHNO1YNh5pAY/EJ9Cvl2MhuUVp2TbD
	NSCXBvzaBVVv5FrtEkkRhWi6+0eJI3yGWPN8c+o3UCwLnLCDTcogdpS8dO8d90eJj4Ks2p
	q1DfDaWUfch2L25u25J7w7KPx5oW7ic=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-iMEVlKMFMTGnZofQoRqlZA-1; Mon, 07 Sep 2020 06:29:06 -0400
X-MC-Unique: iMEVlKMFMTGnZofQoRqlZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF6991007B09;
	Mon,  7 Sep 2020 10:29:03 +0000 (UTC)
Received: from redhat.com (ovpn-114-70.ams2.redhat.com [10.36.114.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C23F460C84;
	Mon,  7 Sep 2020 10:28:52 +0000 (UTC)
Date: Mon, 7 Sep 2020 11:28:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
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
	Beraldo Leal <bleal@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 1/4] Acceptance tests: use an available kernel image
 package for arm
Message-ID: <20200907102849.GE810755@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200907042000.415931-1-crosa@redhat.com>
 <20200907042000.415931-2-crosa@redhat.com>
 <001385a1-92eb-d311-88b5-8e1e7f6f1f48@redhat.com>
 <20200907093930.GD810755@redhat.com>
 <34814b29-a47a-efd3-971b-520bc5ac6309@redhat.com>
MIME-Version: 1.0
In-Reply-To: <34814b29-a47a-efd3-971b-520bc5ac6309@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
X-TUID: 553wQBT+lg67

On Mon, Sep 07, 2020 at 11:59:18AM +0200, Philippe Mathieu-Daudé wrote:
> On 9/7/20 11:39 AM, Daniel P. Berrangé wrote:
> > On Mon, Sep 07, 2020 at 10:06:13AM +0200, Philippe Mathieu-Daudé wrote:
> >> [Cc'ing Daniel who usually have good ideas for that
> >> kind if project-wide problem]
> >>
> >> On 9/7/20 6:19 AM, Cleber Rosa wrote:
> >>> Which means a newer kernel version.  Expected output was changed
> >>> to match the new kernel too.
> >>
> >> Nack.
> >>
> >> Acceptance tests are not to test the latest Linux kernel,
> >> they aim to assert a specific kernel tested by some developer
> >> still works while QEMU evolves.
> >> QEMU doesn't have to adapt to the latest kernel;
> >> QEMU should keep boot an old kernel.
> >>
> >> Testing new kernels is good, you are adding coverage. But
> >> this break the acceptance testing contract "keep testing
> >> the same thing over time".
> >>
> >> The problem you are trying to fix is the "where to keep
> >> assets from public locations where they are being removed?"
> >> one. Two years ago [*] you suggested to use some storage on
> >> the avocado-project.org:
> >>
> >>   For Avocado-VT, there are the JeOS images[1], which we
> >>   keep on a test "assets" directory.  We have a lot of
> >>   storage/bandwidth availability, so it can be used for
> >>   other assets proven to be necessary for tests.
> >>
> >>   As long as distribution rights and licensing are not
> >>   issues, we can definitely use the same server for kernels,
> >>   u-boot images and what not.
> >>
> >>   [1] - https://avocado-project.org/data/assets/
> > 
> > If I look at stuff under that directory I see a bunch of "Jeos" qcow2
> > images, and zero information about the corresponding source for the
> > images, nor any information about the licenses of software included.
> > IOW what is stored their right now does not appear to comply with the
> > GPL licensing requirements for providing full and corresponding source.
> > 
> >> It is time to have QEMU assets managed the same way.
> > 
> > I'd rather we didn't do anything relying on binary blobs with no
> > info about how they were built. Pointing to the 3rd party download
> > URLs was the easy way to ensure we don't have to worry about licensing
> > problems.
> 
> I tried to be very strict including the recipe about how to rebuild
> and description of the source (for licensing) in each commits (Alex
> Bennée once said Debian/Fedora based was OK):

..snip...

Well that looks better than what is done for the JEOS images currently
on avocado-project.org, as I can't tell what distro those came from
at all.

If we're hosting images built by some 3rd party, and we intend to rely
on the 3rd party to satisfy source availability, then we need to be sure
that the 3rd party is themselves still distributing the same images.

IIUC, from Cleber's commit here the original images we're pointing to
are now 404s. If the URLs moved, we just need to update to fix the URLs
to point the new location. If the content was entirely removed though,
we shouldn't mirror it ourselves, because we can't rely on the original
vendor to be providing the source at that point.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
