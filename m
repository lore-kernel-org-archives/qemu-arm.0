Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp976762njb;
        Thu, 1 Aug 2024 08:17:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVw1x9LgrjUPjKaJMixXJezarkmFtop3mRtpiBmlbtEHi//gLE93aXNOQZDms+iJCz55TYyHDA9NSIpe1OEh8uYx1hY1C7N
X-Google-Smtp-Source: AGHT+IHOYQsIF6gLCb31Cwy6lAauzDUGMr7cyelgIRDPQLR/9Gin+vFnFSHAhEoVlHsCSq7KJxcC
X-Received: by 2002:a05:622a:255:b0:444:e9b9:709f with SMTP id d75a77b69052e-451892202afmr4688371cf.19.1722525455732;
        Thu, 01 Aug 2024 08:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722525455; cv=none;
        d=google.com; s=arc-20160816;
        b=HUOLF5Irltmqnil+G0t376cQSzpp6v+8h8MHuTP0iC6vnXp/p6Uezbc1N7SCuyyvc1
         bpFc9+3fwnkLwGF/jugLeHv1h9iBJ054qmpRUVl27bEYtVExfJ+wg8OJMTBgtQHlYohg
         1gNIuZ8Y5XHu5Cyk4dTuc2478XWccT7XnbQczVemGg0WV7EjjcvJntsmUwB8l77PD5Of
         z1he7rNrGDWOJVK1npLmcS47C3I8Dal/eaau5qA8nRfJ664dFrgoBHMb2NCETU8A1wyZ
         QuOmQdJyyKSz8URmyqHJF4Fl3oJOERlwDc8vr7U2txIIx4ocLbVHhKJ1LaLoUJQpV1iN
         sVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=saWSM0dvG6oMWmS/XHDtmdkUhGSwyi8ohATfugSLLzE=;
        fh=wU40h1YRy0XwnO1QvGBgzGP0CuBHemm55HQhhkCtE2w=;
        b=fUHCmsxOg0x5+NmWIxQJdH0CnePv7F/ghMnoQ35pziws8tYZiFT5/L0E6kr4/A2pJk
         CS+0sj3FjiGLA1qyycWVFhnswDUAhAcYgZnzuM8wpf5yqCh9gBflhF3gMQsUtHuVK4XB
         VI+hZSmcfPHrtty+V2lK3O9W9zb0ooe645JgW5NGidm+687kY7Kz42p8d63EbyQgdtrX
         F95BqlDE1RIrpB1lnC5fx1VtDZTH1AkKjRR9EB7JW3s9sxKNKQf/px/+266mDce7sCU6
         3N9jcRyELjRH4FkL30lUV70Glgi3u8jDIzZBlCpGoXA1lmXr9jPSBsHaa5uSQ3N2EXgB
         55Tw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RH6HkT77;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe851d021si185917511cf.668.2024.08.01.08.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:17:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RH6HkT77;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722525455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saWSM0dvG6oMWmS/XHDtmdkUhGSwyi8ohATfugSLLzE=;
	b=RH6HkT77DjJQa+wU0FPgk2e3ymnKCxw+Zg8OheyCaNgrcpfTk/eLJNUV8xHTnazJn4SbIl
	Jd8bb0BkhAz7OZdKtcb2Iw9ykk8yq3i7Sq+RwuucAXdp5QHg3S4/bh8OQR8g5XVJ6w9JoE
	jRBjcQLIiqK/oViWi0mx6d6UU3hKHlc=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-iI2Z306ZOheU38fmnCkGhg-1; Thu, 01 Aug 2024 11:17:34 -0400
X-MC-Unique: iI2Z306ZOheU38fmnCkGhg-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-66b3b4415c7so150208997b3.0
        for <alex.bennee@linaro.org>; Thu, 01 Aug 2024 08:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525453; x=1723130253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saWSM0dvG6oMWmS/XHDtmdkUhGSwyi8ohATfugSLLzE=;
        b=nuBP6yCjwzYH9sQZlLmZ+CY9tdNuI6qfs3ZGrHMhbz4osyM+KKaE6QbthkEm3hcxkA
         04Z1dkA9RPlWNx/sKMGzioou/Y4gH7HUWfHukWVUe90Hy6SCAHBNA17XqM0rRdUVoxX7
         /a0eSHA7Y9BlrtpZnHoW58HUisIAlg7AxJW1zYUlqfSjg9x3hnsIcE3bQ/wJAhLnkcYm
         OgKHwTItoWwzJp+FxJDPSD/vrkzym63x5Osn2RYVoR7jnPbk9Y9gSZ2yg6etm5y435TZ
         DMc0RHj/7kwCqXO3gRLFNXyBCZG+zBfJ1Kmot4dzz8v9xrsDgeWwqVyuhvzWUiQc136f
         2l5g==
X-Forwarded-Encrypted: i=1; AJvYcCWc6CFhhJKIqHljkFwGMBzxUY258uuMo0Qgvq+sxAzQqhr0sAL7Z7nS9fKnFtJpktVpG2PDTRYBvkeDWSDyVSTzUFd/1aE9
X-Gm-Message-State: AOJu0Yy+sPJsaYWh9taRaj8Opy/bO85u8MJviuxmxP1huN/BiZsSGT2I
	GBDGMSBfe5GiIGAI9/WZYrqkFrWHhe2cDfZ2TIW43tfcnsosXiC6QNf+QodziHVtVg+51ENUBhb
	f2dRp5gwLUMC9ssWqoxiWPLa8h43HRsa2GLCM7ocbpfGV+LIzsI1+V6ABvw50NGjVFM18oXkycy
	7c/oths+vYumBff7mJzsAqK7ff20zo
X-Received: by 2002:a81:8a02:0:b0:627:88fc:61c5 with SMTP id 00721157ae682-689608712bemr3552237b3.14.1722525453629;
        Thu, 01 Aug 2024 08:17:33 -0700 (PDT)
X-Received: by 2002:a81:8a02:0:b0:627:88fc:61c5 with SMTP id
 00721157ae682-689608712bemr3551957b3.14.1722525453261; Thu, 01 Aug 2024
 08:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <20231208190911.102879-1-crosa@redhat.com> <20231208190911.102879-7-crosa@redhat.com>
 <20efca0c-982c-4962-8e0c-ea4959557a5e@linaro.org> <CA+bd_6K5S9yrD6hsBsTmW4+eJpPsquE8Ud9eHZzptUwDrHcpeQ@mail.gmail.com>
 <a3b0ebf6-47ca-4aad-9489-16458ffd6ff3@linaro.org>
In-Reply-To: <a3b0ebf6-47ca-4aad-9489-16458ffd6ff3@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Thu, 1 Aug 2024 11:17:21 -0400
Message-ID: <CA+bd_6LmuOdQ8ZdLjwt+MCusjQ8ROv23d9PXoF-Ku3j4j73wsg@mail.gmail.com>
Subject: Re: [PATCH 06/10] tests/avocado/kvm_xen_guest.py: cope with asset RW requirements
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>, Leif Lindholm <quic_llindhol@quicinc.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, kvm@vger.kernel.org, 
	qemu-arm@nongnu.org, Beraldo Leal <bleal@redhat.com>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Sriram Yagnaraman <sriram.yagnaraman@est.tech>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, David Woodhouse <dwmw2@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 9NZpIrGtntGB

On Thu, Aug 1, 2024 at 8:57=E2=80=AFAM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org> wrote:
> > I agree those files should not be modified, but I wonder if you
> > thought about any solution to this? Given that the same user writes
> > (downloads) those files, do you think setting file permissions between
> > the download and the use of the files should be done?
>
> We want to share a cachedir on development hosts with multiple
> developers. OK to alter a downloaded file before adding it to
> the cache; but then once a file is added/hashed it shouldn't be
> modified IMO.
>

I was asking more in terms of what to do before/after the test.  When
it comes to this type of setup, Avocado's cache was designed to
support this use case.  You can provide multiple cache dirs in the
configuration, and some (the first ones, ideally) can be RO (life NFS
mounts).

But this is hardly something that can be configured without proper
user input, so this is not present in the generic "make
check-avocado".

> So far this directory is group=3DRW but we like the ability to track
> a read-only directory (like owned by a particular user) and adding
> missing assets to current user cachedir, to avoid duplication of
> files and waste of network transfer.
>

That can be done in avocado.conf, something like:

[datadir.paths]
cache_dirs =3D ['/path/that/is/ro/because/owned/by/someone/else',
'/home/cleber/avocado/data/cache']

The asset library will take care of trying to find assets in the RO
directories, while writing to the RW ones.

Hope this helps,
- Cleber.
