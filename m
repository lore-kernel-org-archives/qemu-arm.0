Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp1234250ejc;
        Fri, 25 Aug 2023 01:12:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZp5gTPK0LgHHA6uo1hdj0nyKHWLDGFJ5HU9zViUz5lKtpBYZLYrmsD41ByETyJxLv7EY8
X-Received: by 2002:a05:620a:410d:b0:765:7a1e:a456 with SMTP id j13-20020a05620a410d00b007657a1ea456mr22982335qko.54.1692951120144;
        Fri, 25 Aug 2023 01:12:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692951120; cv=none;
        d=google.com; s=arc-20160816;
        b=mJWYPgTwCcOXfbChF/K+pAe7yvsf4PF873oLf5U2PwzXuU3O1Ft2IhzjrrNxHSdfTf
         QSpqXQ5CEOiXo7tq3lHN4NKRYweja2BS+nefFIshdE1uGgUnpfSaTsrxG4j1KOa4bnii
         PY0XW2uTwEUYg39cskg4FHxmattxQbrqGnMKzZp6Yel6JpJ2U23b+Be5gCuS8zaBe3c7
         Ap/kn16OufSUAAQqM/8qu/h8GNrgT4tn9pZaF+OUsURtace8mF8jL55bk+azp78EV0Gv
         DnYuW/GGXx6Kp5kAzaP0jCx+DakLCemXPsuZ1wotjaUdA+rmo4D9fLy6iFHTXTQuF6Qy
         Papw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=5Vq7SYLT8/3P8VktR6TGZbPAprcnDQ2P6BI9Ie+pqAw=;
        fh=I1ssWD65w7ybmtMwrJqGKTlqMuu84QN1LpOfKJVve7o=;
        b=z7zGx9wEqtMNV/6guehcJTZuR3uqhLhqqDaDVbK5ZxO8jIdU43xavnOkBLI/FetESa
         j756h/t0SaGty0eIvls11C5qG4w+rHateLuBoux+kajMQdfEmwwaPNoxTHoZI3jPG8hS
         0uTltprB1UAnvfcOkSHerv5XCWhA0ThLQ8/5YX/yyMdnOjij7RTsLUjH+LVQIcCmrKPU
         vsDpz+9LtFh8Dzf+kIF5luFzJQ1Cq1HwqFJUtwBj7roQ/gA/mbN6mepAcvPvdLHkEIXL
         LQyGSnDMQTIDFHHmS78YZF1lAyN65jP8tWqtAOfAbXbaZjVygTh8/PNvXdlYRlbSo0f6
         Gdrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LGSXuV0a;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t15-20020a05620a450f00b0076dbc2b8790si714817qkp.510.2023.08.25.01.11.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 01:12:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LGSXuV0a;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692951119;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Vq7SYLT8/3P8VktR6TGZbPAprcnDQ2P6BI9Ie+pqAw=;
	b=LGSXuV0aYMso7OuJZ3F3mdFh/p6DlhuEkWNiKfy2n7I6s7qHO5RPcpRtgbDhwrWS05KU1o
	urGUrbY+P4HnfQmmm/6OokRpW/OVnkrAP8TUmCuceIly8LorKj4sJV0/b9fCMgFBgQYOcB
	xIUfYMsPhID8ImwGuR4ppIgR7BGkBsI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-687-8Od1pM6NOz629Q3CZcjpiw-1; Fri, 25 Aug 2023 04:11:55 -0400
X-MC-Unique: 8Od1pM6NOz629Q3CZcjpiw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71214185A792;
	Fri, 25 Aug 2023 08:11:54 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.144])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B975A140E962;
	Fri, 25 Aug 2023 08:11:51 +0000 (UTC)
Date: Fri, 25 Aug 2023 09:11:49 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-s390x@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
	qemu-arm@nongnu.org, Juan Quintela <quintela@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>, Greg Kurz <groug@kaod.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 01/12] gitlab: enable ccache for many build jobs
Message-ID: <ZOhiRYxTQPSX0HbS@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230824163910.1737079-1-alex.bennee@linaro.org>
 <20230824163910.1737079-2-alex.bennee@linaro.org>
 <20abecb3-b330-0303-0f4a-b0b5d0cfade1@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20abecb3-b330-0303-0f4a-b0b5d0cfade1@tls.msk.ru>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: Pj5rSGN77iXf

On Fri, Aug 25, 2023 at 10:46:29AM +0300, Michael Tokarev wrote:
> 24.08.2023 19:38, Alex Bennée wrote:
> > From: Daniel P. Berrangé <berrange@redhat.com>
> > 
> > The `ccache` tool can be very effective at reducing compilation times
> > when re-running pipelines with only minor changes each time. For example
> > a fresh 'build-system-fedora' job will typically take 20 minutes on the
> > gitlab.com shared runners. With ccache this is reduced to as little as
> > 6 minutes.
> 
> I've been using ccache when building qemu in debian, for quite a while.
> 
> The problem here, in the way qemu build system works, is that the cache
> is hugely dependent on the path to the source. You change just one char
> in there (/build/qemu/v8.1.0/ => /build/qemu/v8.1.1) and whole cache becomes
> unusable, it all gets compiled anew.  This is because qemu build sys uses
> absolute file names when building, and this is detected by ccache, so
> the source dir gets mixed into the hash together with gcc version and
> other things.
> 
> Dunno how well this will work in the qemu ci though.

Should be fine, as gitlab always checks out code in a fixed directory
name matching the git repo name.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
