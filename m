Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1755232njb;
        Mon, 14 Oct 2024 03:13:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/48kj32SER5JS0S4r6VgwKYUZmwg1HsB3DrQaB12P9z7esVtoWJBch09NC7IWRoozJgHK
X-Received: by 2002:a05:620a:2407:b0:7af:c5e8:78b0 with SMTP id af79cd13be357-7b11a3c45d9mr1542635785a.65.1728900838738;
        Mon, 14 Oct 2024 03:13:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728900838; cv=none;
        d=google.com; s=arc-20240605;
        b=PVIVmZhy4Z/RTNeetcaaThh9ishXKVB/VERIZg6Uz3o2z9XzWm7bYTMLisQ/F6dA7r
         aBwO2BegJQv3zSbBf/appshBqsCcjhcaDMRyFwMzfMQWDaq5um/2255gVqQXUqhQm73o
         dg4sKrrL64hYcDeBjh3MdiCi4ZtBuMlYTVu16jpLhIQ6EAfwnmmTm10y6Vk/i9+sTNtY
         /2O45heQ1qZvvR1HuKrhcG7/LyzjhyfJZJT3TQCfL5bauEkFQwDhFNDI5PJsT6qg5T7+
         tf0twBc1tX4HmlMjV+F9HL2CN36yBh/N5mE3Y/1HQS1Vrk5hKcvx1xlOFrgoKx9s5cKs
         23jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=v5gKkCG6usCG+bfba3Xn2GCgK6CC1BB9xO0vJlMJdMY=;
        fh=tY8sL66BfLkqP909SLTXNI9r2EJ3RMmL9s6EJzKuDRM=;
        b=OVIybV3l2RN2uGBWK1REkIzTPNZgxM8SLoM9vy2k2Fe4hOP+3YsLxTsdkqhU336iTf
         l7hHCH6sFz2zhLIVgei2ztTP57z4R+B1SuhGwPqFu22VqMddpUS+KhdALT7KTnQvXg0l
         83ZVYfQTbUbh1jYzwgTyIKzBkdXa2cFmNbhXyL+k6Bw8Jgj9vfR/PIwoIjfRB5mLPoad
         9+CNCf2TTnqrwzQg5bTA/HO6MmjBShmB5XKm550G6tYk/swK5h2TW6kCEuPx5jtefjMq
         OYjWKIYv3PYls/rThaZG+vFhKmvp957vVI5txHj1Vvi38k6srB/YQuRzerTrF5Kj17Tr
         RGqw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TAiIA1Su;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b1149a621asi1138439985a.480.2024.10.14.03.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 03:13:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TAiIA1Su;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728900838;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5gKkCG6usCG+bfba3Xn2GCgK6CC1BB9xO0vJlMJdMY=;
	b=TAiIA1SuXH1B+K6AUZj0JEOwooK158eRs4aOjgz97hu75s4LmK9ZQk3zsXiT2Ot29iQsqx
	hmGh18aY04Vxhz4VCwoltDU4vg6bnGiwG7bzEjCiNxSy1MfNo78ACEYXufswQx174Zih9p
	HGjrNDlOV2OYM2AHgjzpyEemLf8r00A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-643-FfYTG9KvMP6tMvokbO93bg-1; Mon,
 14 Oct 2024 06:13:54 -0400
X-MC-Unique: FfYTG9KvMP6tMvokbO93bg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 477751956058;
	Mon, 14 Oct 2024 10:13:52 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.155])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 260E91955F42;
	Mon, 14 Oct 2024 10:13:46 +0000 (UTC)
Date: Mon, 14 Oct 2024 11:13:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Magnus Damm <magnus.damm@gmail.com>, qemu-arm@nongnu.org
Subject: Re: [PATCH 00/17] Convert the Avocado tuxrun tests into new
 functional tests
Message-ID: <Zwzu1c9urQ2vSy0I@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241011131937.377223-1-thuth@redhat.com>
 <87bjzoaura.fsf@draig.linaro.org>
 <7e8c6503-e56b-4a01-a1f8-945e3e0020d1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e8c6503-e56b-4a01-a1f8-945e3e0020d1@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: ABnSmLLwrrcU

On Mon, Oct 14, 2024 at 08:12:39AM +0200, Thomas Huth wrote:
> On 13/10/2024 17.27, Alex Bennée wrote:
> > Thomas Huth <thuth@redhat.com> writes:
> > 
> > > This patch series converts the tests/avocado/tuxrun_baselines.py
> > > to the new functional test framework. While converting the sh4 test,
> > > I noticed that the Avocado test was completely broken, so I included
> > > a fix (revert) for that problem in this series, too.
> > 
> > How can I run them from meson? I don't see them in list (but make
> > check-functional works). Shouldn't I be able to do:
> > 
> >    ./pyvenv/bin/meson test qemu:func-thorough
> > 
> > ?
> 
> Did you regenerate the meson files before running this command?
> 
> Anyway, the "official" way to run the tests is:
> 
>  make check-functional
> 
> This should take care of
> 1) Regenerating the meson files if necessary
> 2) Precaching the assets if necessary
> 3) Running the tests

Or if you just want to run a single test, directly execute the python
file eg  ./tests/functional/testname.py

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
