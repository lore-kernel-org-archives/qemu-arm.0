Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1252452lfm;
        Fri, 21 May 2021 08:13:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNoQ9T4uPXAKDYwj0Y5mBOT0SwuxNr+J+h/QvQokB4suyLWNFPcmdA7r97rCEdDNogm4PD
X-Received: by 2002:aa7:cf06:: with SMTP id a6mr12080074edy.138.1621609987571;
        Fri, 21 May 2021 08:13:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621609987; cv=none;
        d=google.com; s=arc-20160816;
        b=a4ufVf6bfRRyNaSqPtJV7RS7W9WD1wUENj0ddQlu90AG/GyuBmsq/melcRJXjvrOkQ
         vez+GkLCj8nmZGMRjJJBuM2Ex9LQY953e3T3+fiLFdfiiaME0lwdS7JOXktxqgJ/X3wy
         ETOlOlEDO99kAAcLpPTebFbVG02fJLXVl4C8g0y9ZGw3h9mtWWiwFJO3u0QTAYnvvFPk
         7jg7ZxHc3PPWtdZb97fnrkv1Rs4kXd9eYJoZd8MxbChJo0ZTpk6gFhfN9V9hItRBK8tp
         hlm/Z3lGXs2QJNQvpRv0DNmuyWO0ZvpgrDzWW3zZIhLRpCUUzQ/b1LtdFQKVzpu6ndMC
         /irg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iloWt9guBWln7WRUG/OBv7ebaBaXKHdgpM/cHkOpmro=;
        b=vW0EztCmV7KOfLzUH/omMmpXKfiiJl0zaa1Zo1UJomfqdC3CseRd2y929K5otJ22aj
         mfS46WHLcWuIutqABF/Yie++3e7P72MIVjClkQ8qqXFZLS4DnCiw9nItP8w4CvIX8+vT
         Tg2BOc9pmdwdGlAyNvCcR+RaOg6mSitRy0mSFjZRY87bv6zraxOju2cIb2KyMCcaIuPz
         +14mVmkIpkJKuMX7SuXIWAsRjXQkq6RfncfuywdR/gl8m9VYypNCEl/839bKnGn8wdmj
         c5SpckzDbxGg20ZJ1rKRsv5o/r000a6+dlrppCtPT3ob1DjOTcAvExcelreBQ4QX/JLn
         cuIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CY/xWNCI";
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <wrampazz@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ba12si5545874edb.25.2021.05.21.08.13.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 08:13:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CY/xWNCI";
       spf=pass (google.com: domain of wrampazz@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=wrampazz@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621609986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iloWt9guBWln7WRUG/OBv7ebaBaXKHdgpM/cHkOpmro=;
	b=CY/xWNCInEoJf1E6HB5EklN6hBAYWGqEg9zXCYnUPjenFZwEVJHPDiDZ/kqvUuDKbcNEry
	mfxSojMXKtf35+koV+7LY0AXhSleCxdktcEyI9N6E0ffTawdPAcNqnIkkVfyL4eUawTtyB
	UlpCQMFnrRH7JDqwL0nmrCHBg5TNThQ=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-LTL6YmmsPYyeSnb-PZb79w-1; Fri, 21 May 2021 11:13:05 -0400
X-MC-Unique: LTL6YmmsPYyeSnb-PZb79w-1
Received: by mail-vs1-f69.google.com with SMTP id u21-20020a67c8150000b029022a6f03b431so6896070vsk.9
        for <alex.bennee@linaro.org>; Fri, 21 May 2021 08:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iloWt9guBWln7WRUG/OBv7ebaBaXKHdgpM/cHkOpmro=;
        b=U1CBHNpIvp2fqPclv05yD6kB56ww9XN9YFgzfvPcscGiLVzRqrlUTHVn7U93rpjR+o
         AFGlg44qVOWYftDkFkp2kB4Fad4G+lUA8E1yjgbnNzQhoPwWnRyQVu7dd6waNidBKjGr
         v2gyABlcBZkzcCRKaMOlYigCJv4iBhQJ4Y4kqWy3Lqfx2vBzK6p3WalCJCzRF49XGb6f
         HH+x0LwgAFgeuw6O1iokPmY3hZKXIKLTSyXZmYYxm087uiGKeYLbjvhSeUmSIZIMEs8n
         x47AwPp1gjaWuK2fNEwblxtxpp2lKVaz8GJw+p7hqUcR+QnvFm5FGbRQxfC9DDKvOxJz
         VMZw==
X-Gm-Message-State: AOAM531c9Comf82vQwGBeY0ayGze3ArukOMUuQFLItmtV8OS2hN4vR9z
	W+o0dqkNOHemf7mo3JWxH6kHKJOaQ3e15HusJwFMUQzjdsrde9bX+XXs39l/JwBOIEGwo0KG7wY
	Tn4LzxRUcXDAsUd74ThpGZChxBi6QCD+M
X-Received: by 2002:a05:6122:124b:: with SMTP id b11mr11041553vkp.11.1621609984566;
        Fri, 21 May 2021 08:13:04 -0700 (PDT)
X-Received: by 2002:a05:6122:124b:: with SMTP id b11mr11041521vkp.11.1621609984335;
 Fri, 21 May 2021 08:13:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com> <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com> <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org> <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
In-Reply-To: <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 12:12:38 -0300
Message-ID: <CAKJDGDa7W2BkYc-kgPJJySnBJtZDDyAfAzmMVxTzDrkDQSWUEA@mail.gmail.com>
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
X-TUID: yqynJGa6Wfr/

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

I think the updated README.rst from this RFC, inside the system
(originally acceptance) folder, is a good description of what these
tests should be: "This directory contains system tests. They're
usually higher level, and may interact with external resources and
with various guest operating systems." I can improve it, if needed.

We are using Avocado Framework as a tool to accomplish the above
description, but I don't think we should strictly use it if there is
another way to accomplish what those tests are supposed to be. Calling
them "avocado" tests may restrict the intent of them, in my opinion.

>
> Or we could just leave it as it is -- is the current naming
> actually confusing anybody? :-)
>
> thanks
> -- PMM
>
