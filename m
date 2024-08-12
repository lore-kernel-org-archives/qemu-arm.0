Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp840872njh;
        Mon, 12 Aug 2024 09:22:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKCs0GRPvKd0pmjmLlgulixeUmzXR7ECSEOSco+Z/wNUhCvZfrFHzkl5OFDQgOjgR9BAnGMweZzi/dA0YeMZfsjXoWItH5
X-Google-Smtp-Source: AGHT+IGp6gh5j2ZDI2f7b4hY8Zzv58JnLStgvhx09r3rL/C3hdEOvzL0XPxPjLTgMlx/Mcz/DrGr
X-Received: by 2002:a05:622a:316:b0:453:4aaa:d585 with SMTP id d75a77b69052e-4534aaad5f5mr7068611cf.4.1723479776784;
        Mon, 12 Aug 2024 09:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723479776; cv=none;
        d=google.com; s=arc-20160816;
        b=RrI9Dnrr3xcabE5POgrytJVuSPYJZkXCgQIyEn3rvM59eQ8Us98PM9hl/33X0ePgDu
         Ys9El8iZSbt98dOGALvinSHF7bHQ2EMB3pIqK1pOA+9I36K8Zs4yGTNm8xTz+Xjyulnq
         q3BZ8wRt9fDh+XdhxKHMDk3jkVGLCM/YZT1r1UmT6CCvIcaki7hyDaCVETB50SmI6Us4
         RBka/06c+QVwmZydN+bEyEbTOGxL6WmteFgnmImyJambOavG97UvOK1Wbolpaq92U95Q
         a7IK+gCBHAN/nccdEy/Xg7ywXAjW7BCldVcQTr61jDb7dCHM/kYAgBUbz5MKUhsc56Rh
         Pvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=iL77nnSBH9gZ96JVImMJmmmZbAJ/u3cCB2omLv9Yg/4=;
        fh=iIm85KRF86tQoOUSYdajY/9G0GgRo3XUwL8vdJZ12Jc=;
        b=v5G5XKfUipEPj14kDX7cV3fwMAAQUmcZKGz8JwtAWWv1lLQywhJ0kkGeA5AxkdCrQT
         +NNEVKb3NzSk0wGg/7Hpn81ETTBvjcWwbgrmbAQL6rRJyIs5at+qwdxfRHXIAKe5VhW1
         nm6U4oCnswGRfOoFeNIFG9EXYtyQCUAKBpLBZGyTe/ATU/xY3GTN1JnwfoQKHU2JPTEH
         iwYgEA0pBPiB5IcLJXTbD9oTB22xmwXn/Sfi6aHUNfRS8nU2gWXVV/7ZP9jhkyLLlA1p
         OlUaN3+SUgOsAlRcBkl9BUD0l0cKrXmKbL9EK1juGmdnCjMgHyn9LzGYAkMI8d9Thd93
         uvcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QLVHvh4K;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4531c2b3aaesi62696451cf.687.2024.08.12.09.22.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 09:22:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QLVHvh4K;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723479776;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=iL77nnSBH9gZ96JVImMJmmmZbAJ/u3cCB2omLv9Yg/4=;
	b=QLVHvh4KN0/1GoaLIwTEwv0LKMPba88mSLjlUPESaj+1DxuXXe0hni28qlZtQaxTL774+u
	sZVZD7WQt7oSnluYteutzQY+Yx3ZMsImyy+a0Q2UTseshiNKEjP4y9j6s97mR91b9wklbG
	FHbwCDnSqzoZJcGsG9GvVjbSypvdPQE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-R34gMxh1MI-CvurNTT2kOQ-1; Mon,
 12 Aug 2024 12:22:54 -0400
X-MC-Unique: R34gMxh1MI-CvurNTT2kOQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E0B9019776C9;
	Mon, 12 Aug 2024 16:22:52 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.211])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 40F7E19373D7;
	Mon, 12 Aug 2024 16:22:47 +0000 (UTC)
Date: Mon, 12 Aug 2024 17:22:43 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Octavian Purdila <tavip@google.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com,
	alex.bennee@linaro.org, thuth@redhat.com,
	marcandre.lureau@redhat.com, alistair@alistair23.me,
	philmd@linaro.org, jsnow@redhat.com, crosa@redhat.com,
	bleal@redhat.com
Subject: Re: [RFC PATCH 00/23] NXP i.MX RT595, ARM SVD and device model unit
 tests
Message-ID: <Zro207XTHFILvRoe@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240805201719.2345596-1-tavip@google.com>
 <CAFEAcA9tUW0DHHOuGJ4sUxu12JMLUMxqW=_9oUHKiiRTenZwKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9tUW0DHHOuGJ4sUxu12JMLUMxqW=_9oUHKiiRTenZwKw@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: hkTTU1BIn9My

On Mon, Aug 12, 2024 at 05:10:52PM +0100, Peter Maydell wrote:
> On Mon, 5 Aug 2024 at 21:17, Octavian Purdila <tavip@google.com> wrote:
> > It also introduces unit tests for device models. To allow accessing
> > registers from unit tests a system bus mock is created. The main
> > advantage of unit tests for device models over QTest is that device
> > models can be tested in isolation and do not require a full qemu
> > machine.
> 
> On the other hand the disadvantage is that you need to add a
> bunch of extra code to mock the interfaces that the device
> connects to, and then you compile into the test binary a
> subset of C files which weren't written with the expectation
> that they got compiled into tests like that, so it feels a
> bit brittle. The nice thing about qtest is that it doesn't
> need you to do any of that -- you just run the QEMU machine
> model and prod the devices it already has.

Yep, mocking often ends up being rather a double-edged sword.
You can do some really powerful things with it, and in particular
it can enable you test scenarios / code paths that are hard or
impractical to exercise with regular functional tests where fault
injection is difficult/impossible.

The cost of this though is that the mocks can pose a significant
ongoing maint burden on anyone who refactors code in future, as
the mocks need to evolve in lockstep with the code refactoring.

12 months down the line, it can be hard for another maintainer
to understand the full purpose of the mocks & thus even harder
to know what todo as they refactor the code. The future burden
of mocks rarely falls on the person who creates them in the
first place.

> Do you have examples in this series of tests which you
> were able to write with this unit test setup that you
> wouldn't have been able to write equivalents of with the
> qtest framework ?



With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
