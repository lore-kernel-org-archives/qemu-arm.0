Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1380717lfm;
        Fri, 21 May 2021 10:49:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFMnV9B+Z9cVw5Andrzzb5Qm+8lrcU2PUzzAPaGA4cL1z6br7hTWGLtq7o0lzwe0OgSd2s
X-Received: by 2002:a17:906:1d43:: with SMTP id o3mr11407799ejh.466.1621619371725;
        Fri, 21 May 2021 10:49:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621619371; cv=none;
        d=google.com; s=arc-20160816;
        b=BaOLb1rohPagAjOfFJuB4ky+qgfpm4xpvoGXcOWNye7StE+Z5zoUCEHHyObvJklVRS
         YeC3cEvuY/eOsXN73kQGk7NLIz25QH0COO1ominWfeAV7LAFMHIemAERYGDoJY4R54iA
         IOz/1d5z8VyETEOmDZ8KmyS40lgOBvqrsKm9yWO66ZH6C7qZmhRf3wtKSi3g/sNMXGD9
         8QlqeFL65Uchg4i/kDx+LiCjaBEIYyYnH4vdQqf5C6U8YTrefoqasK80NmF6a4FUdllD
         CUu6nF1WIkvNfEo0l4bZPeNFkKDT+6oEDtdcEBBpiFYAAaYTC0/PB1+qk3ctVNJ6VIf/
         +c2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RI2pmeWcT28+sYUe+GlPSFbS6fQkmCrOz5peViPMPMY=;
        b=n0zjjrIFn4fdD3iaKA/BR65HUsWyKcJkh5q29AYStJktQhdjAS8Ek7DsBn69wctXQG
         Ssn+yxZn6B4I+BBD9Y1MMy4rifvj/iqD1cu9vfTT/I3RFMrGuSlDMQPTfYX7oCjCe+Qo
         l3x4mufyiqBje7IBjCAfh/zNUaYrgibNbuYanfFWPPqRTvSYcyZsAxvq6a52UEj8PAqy
         GMYw8pv/kDNSDUiqPJs7NKKC8gxNt020rJ+uw6a+UdBsS469SSmKM09Xbsp3SWTTSUv3
         jn6pb0ICg0ouGUlErKL9milD2GJRiuBF7f6OYX/eqaDQBgkOLu50RuEhDzOeJ+QKw0GL
         6rPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q+At/yCm";
       spf=pass (google.com: domain of wrampazz@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wrampazz@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id ck17si5257398edb.53.2021.05.21.10.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 10:49:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of wrampazz@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Q+At/yCm";
       spf=pass (google.com: domain of wrampazz@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621619370;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RI2pmeWcT28+sYUe+GlPSFbS6fQkmCrOz5peViPMPMY=;
	b=Q+At/yCm6RcGiOyM5c8Ml3zTJ1ABYPo4BEKErMhonyRWqZur7DhfVG2XyRt3cwxSC/srhc
	0YSVuHslanezHFSfFyHtFS4yR6+cnV0sxxi+Q2mH7nFtyjewDooauY+mndtjOxGllHeU9+
	6Ktzh/ZUUq+UknJwWw/ZMFr4VTaEQ9Q=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-m9lHz4JXOYCzvnzCvEswmw-1; Fri, 21 May 2021 13:49:29 -0400
X-MC-Unique: m9lHz4JXOYCzvnzCvEswmw-1
Received: by mail-ua1-f71.google.com with SMTP id o4-20020ab037640000b0290218107a4549so1563309uat.14
        for <alex.bennee@linaro.org>; Fri, 21 May 2021 10:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RI2pmeWcT28+sYUe+GlPSFbS6fQkmCrOz5peViPMPMY=;
        b=aFhyYAGLxnlIGgTb/lNorkVon3MCW/NlgVjWS1xuNt8xQ5TdCiQ0zUMTVPWw0lqm/i
         6XiMowdn/U/U7KICG3g/9TEyafM3IOK09tpAuU9Xwc2wdJkfdMeIUcZMOuWbHt6Dhuk2
         raW4/0nWinWJv1KJj1KpQIQ+cc+KlzZQUrLOusailnIlsKgrIJalv0oy0oEt3IKnT2qp
         WZsoFS4JTxZG77UQJ3jGy+8FdyLUH7puXq7VDW9aMU6v17ZU7S+lX+w+a+9JxOcSqhUS
         wVbSDbsyjEWaihsdO1b6xkJjNu373SeS+ONaM9A5QQOp6z+Fw8H+o1kSnaW1gQRucHjU
         1c4A==
X-Gm-Message-State: AOAM531Q9RJ19EsolxLPHjt6PqUOgBeeVIsZEZO869EUuPKxCL9Z7+0z
	GwX5JZFRqg892sHnlLkYiR7AWIq58ZdFUEOOJAe3ZVT4eOX7ybYbtbWHCRBkPKzZJ5iNTG3Rm6X
	Ctt3sSWBRTYH7vDGzr+xGYM/TEapxpX7T
X-Received: by 2002:a67:f357:: with SMTP id p23mr11767781vsm.50.1621619368818;
        Fri, 21 May 2021 10:49:28 -0700 (PDT)
X-Received: by 2002:a67:f357:: with SMTP id p23mr11767768vsm.50.1621619368643;
 Fri, 21 May 2021 10:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com> <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com> <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org> <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
 <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
In-Reply-To: <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 14:49:02 -0300
Message-ID: <CAKJDGDZ2guQ2cpnV0Q-f6YgjPMe88TJddG473FC155td23GrrA@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: +7ICk9C7HbZx

On Fri, May 21, 2021 at 2:14 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 21/05/2021 16.29, Peter Maydell wrote:
> > On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >> If you think these tests belong to tests/tcg/, I am OK to put
> >> them they, but I don't think adding the Avocado buildsys
> >> machinery to the already-complex tests/tcg/ Makefiles is going
> >> to help us...
> >
> > This does raise the question of what we're actually trying
> > to distinguish. It seems to me somewhat that what tests/acceptance/
> > actually contains that makes it interestingly different from other
> > tests/ stuff is that it's specifically "tests using the Avocado
> > framework". On that theory we might name it tests/avocado/.
>
> I think there are two aspects:
>
> 1) These tests are using the avocado framework
>
> 2) These tests are downloading other stuff from the internet (unlike the
> other tests that we have)
>

After Peter's reply, I noticed QEMU does not organize tests under the
tests folder by software engineering test category but by the
mechanism/machinery the tests run on. This makes me think that we may
need to handle the folders name and the CI jobs name differently:

1 - Change the current "test/acceptance" folder name to "test/(avocado
or avoqado)." Change the "make check-acceptance" to "make
check-validation," and the GitLab CI job names to "validation,"
meaning that, in a promising future, other tests running on a
different framework and acting like validation tests would run in the
same make command and same GitLab CI job.

2 - Change the current "test/acceptance" folder name to "test/(avocado
or avoqado)." Change the "make check-acceptance" to "make
check-(avocado or avoqaco)" and the GitLab CI job names to "(avocado
or avoqado)," meaning that, in a promising future, we can categorize
validation jobs inside the CI and run each of the different validation
tests supported by a framework on its own GitLab CI job.

Personally, I prefer option 2 as it gives more flexibility to decide
how to set a GitLab CI job or run it when testing locally.

> > Or we could just leave it as it is -- is the current naming
> > actually confusing anybody? :-)
>
> Yes, I think "acceptance" is rather confusing. So far they haven't been p=
art
> of your PR acceptance tests (well, now they are part of the gitlab-CI,
> though), and it's also not about tests that have been set up by customers=
,
> which is what you normally think of when hearing "acceptance tests". So a
> different name would be adequate.
>
> I think I'd vote for either "avocado", "avoqado" or "validation".
>

Even laughing every time I read "avoqado" (and thanks for that), I
liked the idea as there is supplementary code added inside
"tests/acceptance/avocado_qemu" to support the tests, meaning they are
not "pure" avocado.

>   Thomas
>
