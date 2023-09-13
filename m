Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2631087ejx;
        Wed, 13 Sep 2023 02:01:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCqHVUI8kytkGv1xk/5ZEIXdcFBie/qlKTRVwcPArPNzdjuPJW8SEUwBTc0Nh9ctAHyU9L
X-Received: by 2002:a05:6214:4607:b0:64f:82d2:26fe with SMTP id oq7-20020a056214460700b0064f82d226femr2166985qvb.39.1694595662081;
        Wed, 13 Sep 2023 02:01:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694595662; cv=none;
        d=google.com; s=arc-20160816;
        b=p4Iy6FsrfJTVjdlMDATUA59rTkvgrD+DeYxb7W3F2WS8y0qSENSQqDwZZEBqOo8F3U
         o74QEz4w7k4tRCgdNKTh5BAIZGRPm1zzBbfl2rCx5YTZVfMuZmQtPYJHErLJ7ez+izev
         cBTT7li+LulhqoLa5eqemNyi7ROht0nKxUPN53eKAVUG8o8BlHzPXO5Fk6oMri9nuNYV
         bE7M+l75JrjbeeZifjQFVe9knYiUkTLWZtHOU+vM9QYn3UG3YKvbYhFDs0WKcNtURMjp
         Ti+BXvuSYfAAzVUosB+lenWCgH7mrKFUi26TRQSHdtHsYfe98Ti+lHMIeR3gyBmYoE5t
         nTvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=syBSAHxmtbJOl+EUTI5blRbznmIrn6eKkKeoN3Js9nM=;
        fh=2sKPfZdENdCygzr/sGK6jMnQ+IiJM2EW+AGCyG72jxE=;
        b=m/knhau12Y2cP98o52zQfOSKmPrKBynIQCLHuc7i1N0Uw1urFfJaNqdSipLiZyHiMX
         WDWYvYVKBSoiNnzYdqgFN0ANJMXwtpE6mnJ5p3Y8t/VY+tjZWF6abSB7XB1ZBh/jqnw0
         USXXGgkCwkYmvlLXPRQN3Z2oHD1eaE3x4F03jHvM2oU7Cw41N6XWU2lqSwJiZEbr8NAQ
         YnlzNhe/tdeJf5s5R6MVSQzw9jlN7n0z+MRyH27PogwgrvUScwfDz0es4Il0Q38G06vB
         xWGQxKefK0YUKytIQtZT8ZX75lbLaesJHSYIrgqH83+ds9d5HQlTBctp728DPKvF1CFD
         P1ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lu5mgEq+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id t9-20020a0c8d89000000b0064f92d244f5si6982772qvb.396.2023.09.13.02.01.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 02:01:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Lu5mgEq+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694595661;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=syBSAHxmtbJOl+EUTI5blRbznmIrn6eKkKeoN3Js9nM=;
	b=Lu5mgEq+OSr80LHZL1NaYKnR8hhES00/+fIeDIkJAk0lut5kTPK5hhDVkgaXrkgt5UYGpX
	d256dHDL3YGhTyMDaJ0HoJcXcIzgxBaTUlMPkPchFIsGllOFSmr8ua8tcah4t4rsyYuJ3n
	AXCpB/nf9GDBpB7GYZYQRXnVK7HTQMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-PAfXDCWNNQyWqT_SExY1sQ-1; Wed, 13 Sep 2023 05:00:57 -0400
X-MC-Unique: PAfXDCWNNQyWqT_SExY1sQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03E67101FAA1;
	Wed, 13 Sep 2023 09:00:57 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FA54409AFC1;
	Wed, 13 Sep 2023 09:00:53 +0000 (UTC)
Date: Wed, 13 Sep 2023 10:00:51 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH 0/4] ci: fix hang of FreeBSD CI jobs
Message-ID: <ZQF6Q3a9aMK5xSL6@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230912184130.3056054-1-berrange@redhat.com>
 <5cbb92ab-f8b5-4d03-5698-06d0a0b7cfda@redhat.com>
 <87ledatq3s.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ledatq3s.fsf@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: HVw+FVQz7R+j

On Wed, Sep 13, 2023 at 09:48:34AM +0100, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
> > On 12/09/2023 20.41, Daniel P. Berrangé wrote:
> >> This addresses
> >>    https://gitlab.com/qemu-project/qemu/-/issues/1882
> >> Which turned out to be a genuine flaw which we missed during merge
> >> as the patch hitting master co-incided with the FreeBSD CI job
> >> having an temporary outage due to changed release image version.
> >> Daniel P. Berrangé (4):
> >>    microbit: add missing qtest_quit() call
> >>    qtest: kill orphaned qtest QEMU processes on FreeBSD
> >>    gitlab: make Cirrus CI timeout explicit
> >>    gitlab: make Cirrus CI jobs gating
> >>   .gitlab-ci.d/cirrus.yml       | 4 +++-
> >>   .gitlab-ci.d/cirrus/build.yml | 2 ++
> >>   tests/qtest/libqtest.c        | 7 +++++++
> >>   tests/qtest/microbit-test.c   | 2 ++
> >>   4 files changed, 14 insertions(+), 1 deletion(-)
> >> 
> >
> > Series
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> >
> > Alex, will you pick these up or shall I take them for my next PR?
> 
> Queued to testing/next, thanks.
> 
> Do you have a patch to disable the borked avacado tests? Or maybe I
> should just include Philippe's fix?

Not at this time. My hope was that this patch might address at least
some of the broken tests:

https://lists.gnu.org/archive/html/qemu-devel/2023-09/msg02797.html

but I ran out of time to test that yesterday.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
