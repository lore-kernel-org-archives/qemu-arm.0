Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2103955wrp;
        Thu, 26 Sep 2019 05:58:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbT+SmnnWQz3b0o0DxjNcP5MrhSU2VqlHTrZseMShpveioZdxaFHARvHiN8fSQMI0juCPJ
X-Received: by 2002:a92:c98f:: with SMTP id y15mr2267951iln.48.1569502727410;
        Thu, 26 Sep 2019 05:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569502727; cv=none;
        d=google.com; s=arc-20160816;
        b=dUD9somYEsXwif1/IuKajU5BFk4Chs8er0QBZ8qGPA24YyBAjU6fZuJpJbx0/FgxTc
         q8r1KODR84hFMrIVFGFyqITbXp/uJGzFp/c6Wr1p4tS2CpDeMmBa4E0ER9CmzNYPxn8o
         FADohrk2RNpPxGNUc/4pAgOl14YXh/VB0JLXRCQ71Kn6kAEH7dM/+hLpZuco8lQGuhkP
         vVkAfUAWBvFqqkN4TLb/6BXXdwBTzwUsZNvfASpN4H267OJg3sAhSDDHTM9K3fOy8ede
         W0EKFvJArf0TXxr6uDedq1LHYydCKE6oxpY24j+9685Fql+1BvXw+SsDjwpxtATSJBXI
         4Dow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date;
        bh=uBTNtHUaE0c6HaTrhM9kOcqGKE0cKNSvxEP3kcKus6Q=;
        b=U8MA5ZM4WIWdGujRdZdZrCXjQVqUQa3QyVq75SEJ9A+8sgEUnynRytNkQMUAYdAllT
         hAI72r7wp9XBBRqHZUU9EiY8VpzKJmmAz27Gnp5eNrh6X8h2QFVjvF3PrD7GjtSpTdEW
         XmPR6tqIJBHlcrDJgxHLK0u79mFMxcwjIplQo+TdjEYuKiwmSwgOB0KhgdkXP4Bpby7Q
         j17Kh1bDuUdO+VAFUF2cs6NuIfMI7YaJ0oASpwBw4DO1ix49j9rlmE/bJla6shXqMSkG
         zHbM34v3racpZaVjFZWN2fmCTvxXPLM5T//mBvp5XZKhA3/gmq5vnszwvK7V4JH2pYa/
         Kaqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 77si1593617ilw.88.2019.09.26.05.58.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Sep 2019 05:58:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FA6530BBE8A;
	Thu, 26 Sep 2019 12:58:46 +0000 (UTC)
Received: from redhat.com (unknown [10.42.17.55])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29E95194B6;
	Thu, 26 Sep 2019 12:58:45 +0000 (UTC)
Date: Thu, 26 Sep 2019 13:58:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"open list:RISC-V" <qemu-riscv@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-discuss <qemu-discuss@nongnu.org>,
	qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	qemu-ppc@nongnu.org
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
Message-ID: <20190926125817.GB19660@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20190925233013.6449-1-alex.bennee@linaro.org>
 <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 26 Sep 2019 12:58:46 +0000 (UTC)
X-TUID: eB0LcPmEcAp2

On Thu, Sep 26, 2019 at 08:50:36AM +0100, Peter Maydell wrote:
> On Thu, 26 Sep 2019 at 00:31, Alex Bennée <alex.bennee@linaro.org> wrote:
> >
> > The 32 bit hosts are already a second class citizen especially with
> > support for running 64 bit guests under TCG. We are also limited by
> > testing as actual working 32 bit machines are getting quite rare in
> > developers personal menageries. For TCG supporting newer types like
> > Int128 is a lot harder with 32 bit calling conventions compared to
> > their larger bit sized cousins. Fundamentally address space is the
> > most useful thing for the translator to have even for a 32 bit guest a
> > 32 bit host is quite constrained.
> >
> > As far as I'm aware 32 bit KVM users are even less numerous. Even
> > ILP32 doesn't make much sense given the address space QEMU needs to
> > manage.
> 
> For KVM we should wait until the kernel chooses to drop support,
> I think.

What if the kernel is waiting for QEMU to drop support too ;-P

> > @@ -745,19 +744,22 @@ case "$cpu" in
> >    ;;
> >    armv*b|armv*l|arm)
> >      cpu="arm"
> > -    supported_cpu="yes"
> >    ;;
> 
> I'll leave others to voice opinions about their architectures,
> but I still have 32-bit arm in my test set for builds, and
> I'm pretty sure we have users (raspi users, for a start).

RHEL dropped all 32-bit host support a long time ago, so Red Hat
don't care for our products.

Fedora has recently stopped building i686 kernels and thus also no
long composes i686 installs. Some users complained, but ultimately
no one cares enough to step forward as maintainers.

That leaves armv7 as the only 32-bit arch in Fedora that is somewhat
active & maintained. I don't have any real insight on whether any
armv7 (Fedora) users are making much use of QEMU/KVM though, either
system or user emulation. 

Our preference in Fedora is to have things built on every architecture
that the distro targets, but if upstream developers explicitly drop an
architecture we're not going to try to add it back.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
