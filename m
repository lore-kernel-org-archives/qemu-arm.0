Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1270515lfm;
        Fri, 21 May 2021 08:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS+u4yxpJEtIP5NVnux+Ah1cVkzUXS6fheD3qH/gjXpAcwXKvdpLt+O4HqDSo6kXDhIZO5
X-Received: by 2002:a17:907:76fa:: with SMTP id kg26mr11261621ejc.192.1621611294957;
        Fri, 21 May 2021 08:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621611294; cv=none;
        d=google.com; s=arc-20160816;
        b=up8Rh3yyFsDfL146yy99NoNqcPcOU3DwBSQ3dxFM572lCn8840FWYGNCk4lwhcOGUk
         z6YzoDesmy1g3dsqbO6Ds/LcLhXEMD//g9Z9e1vAerJPXd08wdbiK4XFmsCX35ri2/PE
         75jNK4I0yj5EjIizWaawRrTJmtREGE1CKSise/qF2LPAkgGojXXkuq7rFkalzsIiMx5u
         xCtOsyueMwiiZ+bcQueLo9kWENuSmcOsrtdQ6giwM+e1rYRiSlxyJgCxTaq1j75AKNfH
         R3ktmYSPluAfETvyIZmKUBFwEDLDU77UjDcaGGG43xE+mjlWnaBXLHp1DGLSRimrcIHS
         43og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FfaoevGaX5GtsuZp5BfhzO44hd+5Zm4qKdI5fj2Db7g=;
        b=oZd6F7nsEGR42Uc+qAdTMXyorzIppC1vJl2d8UG8HaNg1oiMz1qOw+dBop9x913TKs
         t3IbtPWVzfGA2abmGI2xGbEVWLYAkUwdnoXTRGZOaYZOYQjgURkLEFPJl/OiqQb2IbP+
         UYHt7L0rEYVtmHe4xAv+Qs/gjmQ9fc9fuZZJzjohWVevrATXahO2epUUM4fXaHKuTmd5
         B/QI3AAYYPxPKEaCWzTngn5SLkrlC93wd6Kth3/npIxfpBm4hYi/tvfgbVtVpM+qmTh2
         gK8S3DMF6eXd9NUDn981mGuSSVqaQ2mK7T/cGcYYVUA6UxHMKQo6bfF06sD6PqujbQPD
         4k5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hWUkNRDk;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wrampazz@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id z21si5833102edq.367.2021.05.21.08.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 08:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of wrampazz@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hWUkNRDk;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621611293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FfaoevGaX5GtsuZp5BfhzO44hd+5Zm4qKdI5fj2Db7g=;
	b=hWUkNRDkBBPhTEsylfqmJL4/BVrbZh7pN83e08PNXt+gsU/cLfJa2d2AO2IGr3iouNJKmG
	uSvuHfQqu0o5nN58OA8tt5bq2VRSFk9UnRNsubB0VlEer4nHSP4QaZLcUbjVm4OGll5YvR
	+xPNxczjAeTPRvvFmgfoQX1iXQBM2SQ=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-OTsmU0DkNEeERwFMInkyjw-1; Fri, 21 May 2021 11:34:51 -0400
X-MC-Unique: OTsmU0DkNEeERwFMInkyjw-1
Received: by mail-vs1-f72.google.com with SMTP id h27-20020a67cb9b0000b0290235f3536140so6641105vsl.12
        for <alex.bennee@linaro.org>; Fri, 21 May 2021 08:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FfaoevGaX5GtsuZp5BfhzO44hd+5Zm4qKdI5fj2Db7g=;
        b=LcIepG+bL0dY8ql9xpx75vCmJPkQz/Og+81vXcd9aSg+nap6piyXR2njs8HOLwEJP6
         g2NW+R9IfaskLpXeuc2xKjr9DnMQFOCns3D6X4aSMXbQuIyJibCp3cnupHZ/8Spo5PNT
         eLthidt2U+n0I2mC6mtqorP8zQMMnlQXzuc1111iFpxolPCIKFlEBauIekZ/J4+YgYly
         CgI/D+e8yZjKOKzgSkZ1C39FudugO3ojF+5ZuiEJDPGD3C1OSUjmXkOkZWdRd9oW+02X
         1Gc8sXmWHZB3c2FGYYbOI6JvMrw/jRiRKVJb/XVTJfpP/O7R/99Ee83siUA5a5HrgIAK
         uM1g==
X-Gm-Message-State: AOAM531bCzxYbz2wgvwSPrOI7Er55tC4Tys6TNpC41/GYloy4rdgTZy3
	IGSMM22RjnwWCwVh8Hfk6UPlVTCDJpCMORXibtIsEifNioJD2cbptG3XQ4ANBRc7SjaVIDaiDPX
	YxiHM0sT7pDovIhuT+LnUOIV0eR8JbSiR
X-Received: by 2002:a05:6102:2431:: with SMTP id l17mr10771619vsi.45.1621611291417;
        Fri, 21 May 2021 08:34:51 -0700 (PDT)
X-Received: by 2002:a05:6102:2431:: with SMTP id l17mr10771583vsi.45.1621611291227;
 Fri, 21 May 2021 08:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com> <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com> <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org> <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
 <CAKJDGDa7W2BkYc-kgPJJySnBJtZDDyAfAzmMVxTzDrkDQSWUEA@mail.gmail.com> <CAFEAcA8kc=x8KTtW+Qg1wgdPNSvN-_13FEbmF2TPK8xC5q-GfQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8kc=x8KTtW+Qg1wgdPNSvN-_13FEbmF2TPK8xC5q-GfQ@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 12:34:25 -0300
Message-ID: <CAKJDGDZckVS1ZgBPpJptSqFGhYT6FQsid+cTFcxoJCiz7q=yxg@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: qophh72i8R0G

On Fri, May 21, 2021 at 12:23 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 21 May 2021 at 16:13, Willian Rampazzo <wrampazz@redhat.com> wrote:
> > On Fri, May 21, 2021 at 11:29 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > This does raise the question of what we're actually trying
> > > to distinguish. It seems to me somewhat that what tests/acceptance/
> > > actually contains that makes it interestingly different from other
> > > tests/ stuff is that it's specifically "tests using the Avocado
> > > framework". On that theory we might name it tests/avocado/.
> >
> > I think the updated README.rst from this RFC, inside the system
> > (originally acceptance) folder, is a good description of what these
> > tests should be: "This directory contains system tests. They're
> > usually higher level, and may interact with external resources and
> > with various guest operating systems." I can improve it, if needed.
> >
> > We are using Avocado Framework as a tool to accomplish the above
> > description, but I don't think we should strictly use it if there is
> > another way to accomplish what those tests are supposed to be. Calling
> > them "avocado" tests may restrict the intent of them, in my opinion.
>
> But the main reason IMHO that we have them in a separate directory is
> because that's where we have all the avocado machinery. I think the
> sharing of the machinery is what dictates whether a test winds up in
> tests/acceptance, tests/qtest, tests/tcg or tests/qemu-iotests
> much more than whether it is "usually higher level" or more of a
> unit test or whatever. If we ever added some other test framework for
> doing system tests, we'd probably want to put it in its own
> directory rather than lumping all its support machinery and
> build files in together with the avocado based tests.

Okay, I understand your point. With the organization of tests under
the test folder that QEMU has today, I agree with you.

>
> thanks
> -- PMM
>
