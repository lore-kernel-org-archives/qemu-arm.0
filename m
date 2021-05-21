Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1236236lfm;
        Fri, 21 May 2021 07:54:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyILb2JY1cpMshEF3vm13sLx/+dN1bElwvbz1uwct8bb4oj22R1ZLzUY3kD2BLm9d1kbodu
X-Received: by 2002:a17:906:a3c9:: with SMTP id ca9mr10729639ejb.553.1621608846231;
        Fri, 21 May 2021 07:54:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621608846; cv=none;
        d=google.com; s=arc-20160816;
        b=R264HR1aMf+UiFLbvve+fLEbQVqNDRce0DkjvAza8AhWn/lF3d8xhRg5S5YBqNKv2U
         2P+Sv1GjyKXA9GJ2pSaXQxwdjo4K2n6JUQzLQEESKv7+CwwBbzNPs7Mq/1nDsU4gyTgb
         xwgHi2G33kcMk53pj6smCS5C4mLBWG6lKtt7j4rpfTQ4/ar/VnZOr1OGHthFR4JOI4rA
         eDtRZ8PbF0c+8qiMi/OaHSefD6l54I7GuVBzI1XmgL7iPMTvzA2G6Uj7VGwA2+nZQewJ
         vsh5/vNEaOnwVa/bYLBKiQZqZFILGwl0vIInsBFC64N9ZBMCt4H2wTnGZ5wL4iKl8t2S
         vqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vkWZXMU/3fiOC766PyeBYhPV21EVkbwevnKj/UQshkk=;
        b=LxWQP0QI2zS510Zf/BNTMXc1BIqGuNaCN/ocZy0vq2dQINrBMqmnjN3ov+y7zYtx5d
         0LIggTUE4CQhd4coHKrg3jDAVo91vyC7fVWFdZTNR1O81UkVTa2EjUNlaKQfRFHFgMrH
         zsfNDbsGu1ld++++ywuLJXEFBzm0JQbvI954OfFS3kjGW3WsXnYZPTzTheu/CfPgPMQ4
         XHukFJu4fYN4PSfaWGZzWBU4bKUSO8y8JX5NK+eQpDa73SrBtjLZlgPq3ZnW+VF2cz0c
         MjRaurRTQNS57cr2gh8fOsH0lAaZhn08+JmZ0vJ9LAz142q8M43Y+COgFcZbpowipOMk
         Cg9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BHWMArWe;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wrampazz@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 8si7413695ejx.637.2021.05.21.07.54.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 07:54:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BHWMArWe;
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621608845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vkWZXMU/3fiOC766PyeBYhPV21EVkbwevnKj/UQshkk=;
	b=BHWMArWewsGIHkDhCLC9AQo+RFDmMkMSW9+i9efnxt5UCwjcHVezMvRVOardyZOSiG1PMv
	mJPTaypAAYnPtvH4UsflSIr8y5Od2PC8y7GFDwOuNPgjuuYt06C7QYBgtGKgaY0osdqFN5
	MFEpdrQAKwmNyO5LzinCMkVL1iW4b/8=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-xrThrwCtOVuTcUEgIER3oQ-1; Fri, 21 May 2021 10:54:04 -0400
X-MC-Unique: xrThrwCtOVuTcUEgIER3oQ-1
Received: by mail-vk1-f197.google.com with SMTP id e8-20020ac5c7c80000b02901fc7f94b3a7so2664637vkn.6
        for <alex.bennee@linaro.org>; Fri, 21 May 2021 07:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vkWZXMU/3fiOC766PyeBYhPV21EVkbwevnKj/UQshkk=;
        b=R/dH+eSr2mLXVvf8/yk9mB4sWolzd5OJ4gufzu7My2BSX7cMdsNREyI4BqfXwnxFme
         S8HwEIJiSz35MEbrR/pg2d9cNfDe34p2D8u0fbJ9zwr3qSjBW+hPXOQ4qksXXTeJmFTf
         8ST8l2QTS31nLzqwBJOLitxgt5it00sYkUPGSZ2DDOP2ehViHcym8poFsQeqg1IofEFV
         IF/eVreb8O9iLwZbu3YlSo/YL78KihXy67Qr7u8+0u0nvqb/p3Lv2df3AZqEsW4XgAAk
         fVn/TG0Fe6JUTvYqkXWXCewtrrbN4WaSA+wqZLuZFjsZkb4xScmt3yT6M9qfcEGOYVW5
         FASQ==
X-Gm-Message-State: AOAM532pkrXuTfW9qWUyvgET/M8iYah2cI79ZX2ZEedlD6YiKAKZVZc1
	fhC7MpCCmhrpMm1zy4UPRELhBGUBRLSQqQt62hlCuQxI4E2dF2qSSAPNg1mOZucGwtnugOEO3ex
	Ili0voO++PPGAM4OhTW/TGssoMKdnXc3t
X-Received: by 2002:a05:6102:2f3:: with SMTP id j19mr10745713vsj.1.1621608843580;
        Fri, 21 May 2021 07:54:03 -0700 (PDT)
X-Received: by 2002:a05:6102:2f3:: with SMTP id j19mr10745687vsj.1.1621608843392;
 Fri, 21 May 2021 07:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com> <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com> <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org> <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
In-Reply-To: <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 11:53:37 -0300
Message-ID: <CAKJDGDaTKDn9EvjmSoKUpu-QfhUhPi0USnH+SBFUZymtSU_GcA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-TUID: habiLTYVn/uW

On Fri, May 21, 2021 at 11:29 AM Peter Maydell <peter.maydell@linaro.org> w=
rote:
>
> On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> > If you think these tests belong to tests/tcg/, I am OK to put
> > them they, but I don't think adding the Avocado buildsys
> > machinery to the already-complex tests/tcg/ Makefiles is going
> > to help us...
>
> This does raise the question of what we're actually trying
> to distinguish. It seems to me somewhat that what tests/acceptance/
> actually contains that makes it interestingly different from other
> tests/ stuff is that it's specifically "tests using the Avocado
> framework". On that theory we might name it tests/avocado/.
>
> Or we could just leave it as it is -- is the current naming
> actually confusing anybody? :-)

Conceptually speaking, it isn't very clear because acceptance tests
are meant to test features requested by the customer during the
requisite phase for a specific software release. The QEMU project does
not have a formal requisite phase where features added to one software
version are discussed with the customers. In this case, the QEMU
acceptance tests are not accepting a use case or requested feature of
a release. Eventually, those tests may not be a blocker to a release
if some of them fail. Thus, calling them acceptance, may confuse
people working with tests.

>
> thanks
> -- PMM
>
